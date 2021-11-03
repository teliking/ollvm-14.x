; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -verify-machineinstrs -mattr=+simd128 | FileCheck %s

; Test that vector float-to-int and int-to-float instructions lower correctly

target triple = "wasm32-unknown-unknown"

define <4 x float> @convert_s_v4f32(<4 x i32> %x) {
; CHECK-LABEL: convert_s_v4f32:
; CHECK:         .functype convert_s_v4f32 (v128) -> (v128)
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    f32x4.convert_i32x4_s
; CHECK-NEXT:    # fallthrough-return
  %a = sitofp <4 x i32> %x to <4 x float>
  ret <4 x float> %a
}

define <4 x float> @convert_u_v4f32(<4 x i32> %x) {
; CHECK-LABEL: convert_u_v4f32:
; CHECK:         .functype convert_u_v4f32 (v128) -> (v128)
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    f32x4.convert_i32x4_u
; CHECK-NEXT:    # fallthrough-return
  %a = uitofp <4 x i32> %x to <4 x float>
  ret <4 x float> %a
}

define <2 x double> @convert_s_v2f64(<2 x i64> %x) {
; CHECK-LABEL: convert_s_v2f64:
; CHECK:         .functype convert_s_v2f64 (v128) -> (v128)
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    i64x2.extract_lane 0
; CHECK-NEXT:    f64.convert_i64_s
; CHECK-NEXT:    f64x2.splat
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    i64x2.extract_lane 1
; CHECK-NEXT:    f64.convert_i64_s
; CHECK-NEXT:    f64x2.replace_lane 1
; CHECK-NEXT:    # fallthrough-return
  %a = sitofp <2 x i64> %x to <2 x double>
  ret <2 x double> %a
}

define <2 x double> @convert_u_v2f64(<2 x i64> %x) {
; CHECK-LABEL: convert_u_v2f64:
; CHECK:         .functype convert_u_v2f64 (v128) -> (v128)
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    v128.const 4294967295, 4294967295
; CHECK-NEXT:    v128.and
; CHECK-NEXT:    v128.const 4841369599423283200, 4841369599423283200
; CHECK-NEXT:    v128.or
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    i32.const 32
; CHECK-NEXT:    i64x2.shr_u
; CHECK-NEXT:    v128.const 4985484787499139072, 4985484787499139072
; CHECK-NEXT:    v128.or
; CHECK-NEXT:    v128.const 0x1.00000001p84, 0x1.00000001p84
; CHECK-NEXT:    f64x2.sub
; CHECK-NEXT:    f64x2.add
; CHECK-NEXT:    # fallthrough-return
  %a = uitofp <2 x i64> %x to <2 x double>
  ret <2 x double> %a
}

define <4 x i32> @trunc_sat_s_v4i32(<4 x float> %x) {
; CHECK-LABEL: trunc_sat_s_v4i32:
; CHECK:         .functype trunc_sat_s_v4i32 (v128) -> (v128)
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    i32x4.trunc_sat_f32x4_s
; CHECK-NEXT:    # fallthrough-return
  %a = fptosi <4 x float> %x to <4 x i32>
  ret <4 x i32> %a
}

define <4 x i32> @trunc_sat_u_v4i32(<4 x float> %x) {
; CHECK-LABEL: trunc_sat_u_v4i32:
; CHECK:         .functype trunc_sat_u_v4i32 (v128) -> (v128)
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    i32x4.trunc_sat_f32x4_u
; CHECK-NEXT:    # fallthrough-return
  %a = fptoui <4 x float> %x to <4 x i32>
  ret <4 x i32> %a
}

define <2 x i64> @trunc_sat_s_v2i64(<2 x double> %x) {
; CHECK-LABEL: trunc_sat_s_v2i64:
; CHECK:         .functype trunc_sat_s_v2i64 (v128) -> (v128)
; CHECK-NEXT:    .local f64, i64, i64
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    block
; CHECK-NEXT:    block
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    f64x2.extract_lane 1
; CHECK-NEXT:    local.tee 1
; CHECK-NEXT:    f64.abs
; CHECK-NEXT:    f64.const 0x1p63
; CHECK-NEXT:    f64.lt
; CHECK-NEXT:    i32.eqz
; CHECK-NEXT:    br_if 0 # 0: down to label1
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    i64.trunc_f64_s
; CHECK-NEXT:    local.set 2
; CHECK-NEXT:    br 1 # 1: down to label0
; CHECK-NEXT:  .LBB6_2:
; CHECK-NEXT:    end_block # label1:
; CHECK-NEXT:    i64.const -9223372036854775808
; CHECK-NEXT:    local.set 2
; CHECK-NEXT:  .LBB6_3:
; CHECK-NEXT:    end_block # label0:
; CHECK-NEXT:    block
; CHECK-NEXT:    block
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    f64x2.extract_lane 0
; CHECK-NEXT:    local.tee 1
; CHECK-NEXT:    f64.abs
; CHECK-NEXT:    f64.const 0x1p63
; CHECK-NEXT:    f64.lt
; CHECK-NEXT:    i32.eqz
; CHECK-NEXT:    br_if 0 # 0: down to label3
; CHECK-NEXT:  # %bb.4:
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    i64.trunc_f64_s
; CHECK-NEXT:    local.set 3
; CHECK-NEXT:    br 1 # 1: down to label2
; CHECK-NEXT:  .LBB6_5:
; CHECK-NEXT:    end_block # label3:
; CHECK-NEXT:    i64.const -9223372036854775808
; CHECK-NEXT:    local.set 3
; CHECK-NEXT:  .LBB6_6:
; CHECK-NEXT:    end_block # label2:
; CHECK-NEXT:    local.get 3
; CHECK-NEXT:    i64x2.splat
; CHECK-NEXT:    local.get 2
; CHECK-NEXT:    i64x2.replace_lane 1
; CHECK-NEXT:    # fallthrough-return
  %a = fptosi <2 x double> %x to <2 x i64>
  ret <2 x i64> %a
}

define <2 x i64> @trunc_sat_u_v2i64(<2 x double> %x) {
; CHECK-LABEL: trunc_sat_u_v2i64:
; CHECK:         .functype trunc_sat_u_v2i64 (v128) -> (v128)
; CHECK-NEXT:    .local f64, i64, i64
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    block
; CHECK-NEXT:    block
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    f64x2.extract_lane 1
; CHECK-NEXT:    local.tee 1
; CHECK-NEXT:    f64.const 0x1p64
; CHECK-NEXT:    f64.lt
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    f64.const 0x0p0
; CHECK-NEXT:    f64.ge
; CHECK-NEXT:    i32.and
; CHECK-NEXT:    i32.eqz
; CHECK-NEXT:    br_if 0 # 0: down to label5
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    i64.trunc_f64_u
; CHECK-NEXT:    local.set 2
; CHECK-NEXT:    br 1 # 1: down to label4
; CHECK-NEXT:  .LBB7_2:
; CHECK-NEXT:    end_block # label5:
; CHECK-NEXT:    i64.const 0
; CHECK-NEXT:    local.set 2
; CHECK-NEXT:  .LBB7_3:
; CHECK-NEXT:    end_block # label4:
; CHECK-NEXT:    block
; CHECK-NEXT:    block
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    f64x2.extract_lane 0
; CHECK-NEXT:    local.tee 1
; CHECK-NEXT:    f64.const 0x1p64
; CHECK-NEXT:    f64.lt
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    f64.const 0x0p0
; CHECK-NEXT:    f64.ge
; CHECK-NEXT:    i32.and
; CHECK-NEXT:    i32.eqz
; CHECK-NEXT:    br_if 0 # 0: down to label7
; CHECK-NEXT:  # %bb.4:
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    i64.trunc_f64_u
; CHECK-NEXT:    local.set 3
; CHECK-NEXT:    br 1 # 1: down to label6
; CHECK-NEXT:  .LBB7_5:
; CHECK-NEXT:    end_block # label7:
; CHECK-NEXT:    i64.const 0
; CHECK-NEXT:    local.set 3
; CHECK-NEXT:  .LBB7_6:
; CHECK-NEXT:    end_block # label6:
; CHECK-NEXT:    local.get 3
; CHECK-NEXT:    i64x2.splat
; CHECK-NEXT:    local.get 2
; CHECK-NEXT:    i64x2.replace_lane 1
; CHECK-NEXT:    # fallthrough-return
  %a = fptoui <2 x double> %x to <2 x i64>
  ret <2 x i64> %a
}

define <4 x float> @demote_zero_v4f32(<2 x double> %x) {
; CHECK-LABEL: demote_zero_v4f32:
; CHECK:         .functype demote_zero_v4f32 (v128) -> (v128)
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    f32x4.demote_zero_f64x2
; CHECK-NEXT:    # fallthrough-return
  %v = shufflevector <2 x double> %x, <2 x double> zeroinitializer,
         <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %a = fptrunc <4 x double> %v to <4 x float>
  ret <4 x float> %a
}

define <4 x float> @demote_zero_v4f32_2(<2 x double> %x) {
; CHECK-LABEL: demote_zero_v4f32_2:
; CHECK:         .functype demote_zero_v4f32_2 (v128) -> (v128)
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    f32x4.demote_zero_f64x2
; CHECK-NEXT:    # fallthrough-return
  %v = fptrunc <2 x double> %x to <2 x float>
  %a = shufflevector <2 x float> %v, <2 x float> zeroinitializer,
         <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  ret <4 x float> %a
}

define <2 x double> @convert_low_s_v2f64(<4 x i32> %x) {
; CHECK-LABEL: convert_low_s_v2f64:
; CHECK:         .functype convert_low_s_v2f64 (v128) -> (v128)
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    f64x2.convert_low_i32x4_s
; CHECK-NEXT:    # fallthrough-return
  %v = shufflevector <4 x i32> %x, <4 x i32> undef, <2 x i32> <i32 0, i32 1>
  %a = sitofp <2 x i32> %v to <2 x double>
  ret <2 x double> %a
}

define <2 x double> @convert_low_u_v2f64(<4 x i32> %x) {
; CHECK-LABEL: convert_low_u_v2f64:
; CHECK:         .functype convert_low_u_v2f64 (v128) -> (v128)
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    f64x2.convert_low_i32x4_u
; CHECK-NEXT:    # fallthrough-return
  %v = shufflevector <4 x i32> %x, <4 x i32> undef, <2 x i32> <i32 0, i32 1>
  %a = uitofp <2 x i32> %v to <2 x double>
  ret <2 x double> %a
}


define <2 x double> @convert_low_s_v2f64_2(<4 x i32> %x) {
; CHECK-LABEL: convert_low_s_v2f64_2:
; CHECK:         .functype convert_low_s_v2f64_2 (v128) -> (v128)
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    f64x2.convert_low_i32x4_s
; CHECK-NEXT:    # fallthrough-return
  %v = sitofp <4 x i32> %x to <4 x double>
  %a = shufflevector <4 x double> %v, <4 x double> undef, <2 x i32> <i32 0, i32 1>
  ret <2 x double> %a
}

define <2 x double> @convert_low_u_v2f64_2(<4 x i32> %x) {
; CHECK-LABEL: convert_low_u_v2f64_2:
; CHECK:         .functype convert_low_u_v2f64_2 (v128) -> (v128)
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    f64x2.convert_low_i32x4_u
; CHECK-NEXT:    # fallthrough-return
  %v = uitofp <4 x i32> %x to <4 x double>
  %a = shufflevector <4 x double> %v, <4 x double> undef, <2 x i32> <i32 0, i32 1>
  ret <2 x double> %a
}

define <2 x double> @promote_low_v2f64(<4 x float> %x) {
; CHECK-LABEL: promote_low_v2f64:
; CHECK:         .functype promote_low_v2f64 (v128) -> (v128)
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    f64x2.promote_low_f32x4
; CHECK-NEXT:    # fallthrough-return
  %v = shufflevector <4 x float> %x, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %a = fpext <2 x float> %v to <2 x double>
  ret <2 x double> %a
}

define <2 x double> @promote_low_v2f64_2(<4 x float> %x) {
; CHECK-LABEL: promote_low_v2f64_2:
; CHECK:         .functype promote_low_v2f64_2 (v128) -> (v128)
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    f64x2.promote_low_f32x4
; CHECK-NEXT:    # fallthrough-return
  %v = fpext <4 x float> %x to <4 x double>
  %a = shufflevector <4 x double> %v, <4 x double> undef, <2 x i32> <i32 0, i32 1>
  ret <2 x double> %a
}

;; Also check with illegally wide vectors

define <4 x double> @convert_low_s_v4f64(<8 x i32> %x) {
; CHECK-LABEL: convert_low_s_v4f64:
; CHECK:         .functype convert_low_s_v4f64 (i32, v128, v128) -> ()
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    f64x2.convert_low_i32x4_s
; CHECK-NEXT:    v128.store 0
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    i8x16.shuffle 8, 9, 10, 11, 12, 13, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0
; CHECK-NEXT:    f64x2.convert_low_i32x4_s
; CHECK-NEXT:    v128.store 16
; CHECK-NEXT:    # fallthrough-return
  %v = shufflevector <8 x i32> %x, <8 x i32> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %a = sitofp <4 x i32> %v to <4 x double>
  ret <4 x double> %a
}

define <4 x double> @convert_low_u_v4f64(<8 x i32> %x) {
; CHECK-LABEL: convert_low_u_v4f64:
; CHECK:         .functype convert_low_u_v4f64 (i32, v128, v128) -> ()
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    f64x2.convert_low_i32x4_u
; CHECK-NEXT:    v128.store 0
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    i8x16.shuffle 8, 9, 10, 11, 12, 13, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0
; CHECK-NEXT:    f64x2.convert_low_i32x4_u
; CHECK-NEXT:    v128.store 16
; CHECK-NEXT:    # fallthrough-return
  %v = shufflevector <8 x i32> %x, <8 x i32> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %a = uitofp <4 x i32> %v to <4 x double>
  ret <4 x double> %a
}


define <4 x double> @convert_low_s_v4f64_2(<8 x i32> %x) {
; CHECK-LABEL: convert_low_s_v4f64_2:
; CHECK:         .functype convert_low_s_v4f64_2 (i32, v128, v128) -> ()
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    f64x2.convert_low_i32x4_s
; CHECK-NEXT:    v128.store 0
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    i8x16.shuffle 8, 9, 10, 11, 12, 13, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0
; CHECK-NEXT:    f64x2.convert_low_i32x4_s
; CHECK-NEXT:    v128.store 16
; CHECK-NEXT:    # fallthrough-return
  %v = sitofp <8 x i32> %x to <8 x double>
  %a = shufflevector <8 x double> %v, <8 x double> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  ret <4 x double> %a
}

define <4 x double> @convert_low_u_v4f64_2(<8 x i32> %x) {
; CHECK-LABEL: convert_low_u_v4f64_2:
; CHECK:         .functype convert_low_u_v4f64_2 (i32, v128, v128) -> ()
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    f64x2.convert_low_i32x4_u
; CHECK-NEXT:    v128.store 0
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    i8x16.shuffle 8, 9, 10, 11, 12, 13, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0
; CHECK-NEXT:    f64x2.convert_low_i32x4_u
; CHECK-NEXT:    v128.store 16
; CHECK-NEXT:    # fallthrough-return
  %v = uitofp <8 x i32> %x to <8 x double>
  %a = shufflevector <8 x double> %v, <8 x double> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  ret <4 x double> %a
}

define <4 x double> @promote_low_v4f64(<8 x float> %x) {
; CHECK-LABEL: promote_low_v4f64:
; CHECK:         .functype promote_low_v4f64 (i32, v128, v128) -> ()
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    f64x2.promote_low_f32x4
; CHECK-NEXT:    v128.store 0
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    i8x16.shuffle 8, 9, 10, 11, 12, 13, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0
; CHECK-NEXT:    f64x2.promote_low_f32x4
; CHECK-NEXT:    v128.store 16
; CHECK-NEXT:    # fallthrough-return
  %v = shufflevector <8 x float> %x, <8 x float> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %a = fpext <4 x float> %v to <4 x double>
  ret <4 x double> %a
}

define <4 x double> @promote_low_v4f64_2(<8 x float> %x) {
; CHECK-LABEL: promote_low_v4f64_2:
; CHECK:         .functype promote_low_v4f64_2 (i32, v128, v128) -> ()
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    f64x2.promote_low_f32x4
; CHECK-NEXT:    v128.store 0
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    i8x16.shuffle 8, 9, 10, 11, 12, 13, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0
; CHECK-NEXT:    f64x2.promote_low_f32x4
; CHECK-NEXT:    v128.store 16
; CHECK-NEXT:    # fallthrough-return
  %v = fpext <8 x float> %x to <8 x double>
  %a = shufflevector <8 x double> %v, <8 x double> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  ret <4 x double> %a
}

define <2 x double> @promote_mixed_v2f64(<4 x float> %x, <4 x float> %y) {
; CHECK-LABEL: promote_mixed_v2f64:
; CHECK:         .functype promote_mixed_v2f64 (v128, v128) -> (v128)
; CHECK-NEXT:  # %bb.0:
; CHECK-NEXT:    local.get 0
; CHECK-NEXT:    local.get 1
; CHECK-NEXT:    i8x16.shuffle 8, 9, 10, 11, 28, 29, 30, 31, 0, 0, 0, 0, 0, 0, 0, 0
; CHECK-NEXT:    f64x2.promote_low_f32x4
; CHECK-NEXT:    # fallthrough-return
  %v = shufflevector <4 x float> %x, <4 x float> %y, <2 x i32> <i32 2, i32 7>
  %a = fpext <2 x float> %v to <2 x double>
  ret <2 x double> %a
}
