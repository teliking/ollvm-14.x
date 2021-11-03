; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+d,+experimental-zfh,+experimental-v -riscv-v-vector-bits-min=128 -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK,RV32
; RUN: llc -mtriple=riscv64 -mattr=+d,+experimental-zfh,+experimental-v -riscv-v-vector-bits-min=128 -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK,RV64

define <4 x half> @shuffle_v4f16(<4 x half> %x, <4 x half> %y) {
; CHECK-LABEL: shuffle_v4f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi a0, zero, 11
; CHECK-NEXT:    vsetivli zero, 1, e8, mf8, ta, mu
; CHECK-NEXT:    vmv.s.x v0, a0
; CHECK-NEXT:    vsetivli zero, 4, e16, mf2, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v9, v8, v0
; CHECK-NEXT:    ret
  %s = shufflevector <4 x half> %x, <4 x half> %y, <4 x i32> <i32 0, i32 1, i32 6, i32 3>
  ret <4 x half> %s
}

define <8 x float> @shuffle_v8f32(<8 x float> %x, <8 x float> %y) {
; CHECK-LABEL: shuffle_v8f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi a0, zero, 236
; CHECK-NEXT:    vsetivli zero, 1, e8, mf8, ta, mu
; CHECK-NEXT:    vmv.s.x v0, a0
; CHECK-NEXT:    vsetivli zero, 8, e32, m2, ta, mu
; CHECK-NEXT:    vmerge.vvm v8, v10, v8, v0
; CHECK-NEXT:    ret
  %s = shufflevector <8 x float> %x, <8 x float> %y, <8 x i32> <i32 8, i32 9, i32 2, i32 3, i32 12, i32 5, i32 6, i32 7>
  ret <8 x float> %s
}

define <4 x double> @shuffle_fv_v4f64(<4 x double> %x) {
; RV32-LABEL: shuffle_fv_v4f64:
; RV32:       # %bb.0:
; RV32-NEXT:    addi a0, zero, 9
; RV32-NEXT:    lui a1, %hi(.LCPI2_0)
; RV32-NEXT:    fld ft0, %lo(.LCPI2_0)(a1)
; RV32-NEXT:    vsetivli zero, 1, e8, mf8, ta, mu
; RV32-NEXT:    vmv.s.x v0, a0
; RV32-NEXT:    vsetivli zero, 4, e64, m2, ta, mu
; RV32-NEXT:    vfmerge.vfm v8, v8, ft0, v0
; RV32-NEXT:    ret
;
; RV64-LABEL: shuffle_fv_v4f64:
; RV64:       # %bb.0:
; RV64-NEXT:    lui a0, %hi(.LCPI2_0)
; RV64-NEXT:    fld ft0, %lo(.LCPI2_0)(a0)
; RV64-NEXT:    addi a0, zero, 9
; RV64-NEXT:    vsetivli zero, 1, e8, mf8, ta, mu
; RV64-NEXT:    vmv.s.x v0, a0
; RV64-NEXT:    vsetivli zero, 4, e64, m2, ta, mu
; RV64-NEXT:    vfmerge.vfm v8, v8, ft0, v0
; RV64-NEXT:    ret
  %s = shufflevector <4 x double> <double 2.0, double 2.0, double 2.0, double 2.0>, <4 x double> %x, <4 x i32> <i32 0, i32 5, i32 6, i32 3>
  ret <4 x double> %s
}

define <4 x double> @shuffle_vf_v4f64(<4 x double> %x) {
; RV32-LABEL: shuffle_vf_v4f64:
; RV32:       # %bb.0:
; RV32-NEXT:    addi a0, zero, 6
; RV32-NEXT:    lui a1, %hi(.LCPI3_0)
; RV32-NEXT:    fld ft0, %lo(.LCPI3_0)(a1)
; RV32-NEXT:    vsetivli zero, 1, e8, mf8, ta, mu
; RV32-NEXT:    vmv.s.x v0, a0
; RV32-NEXT:    vsetivli zero, 4, e64, m2, ta, mu
; RV32-NEXT:    vfmerge.vfm v8, v8, ft0, v0
; RV32-NEXT:    ret
;
; RV64-LABEL: shuffle_vf_v4f64:
; RV64:       # %bb.0:
; RV64-NEXT:    lui a0, %hi(.LCPI3_0)
; RV64-NEXT:    fld ft0, %lo(.LCPI3_0)(a0)
; RV64-NEXT:    addi a0, zero, 6
; RV64-NEXT:    vsetivli zero, 1, e8, mf8, ta, mu
; RV64-NEXT:    vmv.s.x v0, a0
; RV64-NEXT:    vsetivli zero, 4, e64, m2, ta, mu
; RV64-NEXT:    vfmerge.vfm v8, v8, ft0, v0
; RV64-NEXT:    ret
  %s = shufflevector <4 x double> %x, <4 x double> <double 2.0, double 2.0, double 2.0, double 2.0>, <4 x i32> <i32 0, i32 5, i32 6, i32 3>
  ret <4 x double> %s
}

define <4 x double> @vrgather_permute_shuffle_vu_v4f64(<4 x double> %x) {
; RV32-LABEL: vrgather_permute_shuffle_vu_v4f64:
; RV32:       # %bb.0:
; RV32-NEXT:    lui a0, %hi(.LCPI4_0)
; RV32-NEXT:    addi a0, a0, %lo(.LCPI4_0)
; RV32-NEXT:    vsetivli zero, 4, e16, mf2, ta, mu
; RV32-NEXT:    vle16.v v12, (a0)
; RV32-NEXT:    vsetvli zero, zero, e64, m2, ta, mu
; RV32-NEXT:    vrgatherei16.vv v10, v8, v12
; RV32-NEXT:    vmv.v.v v8, v10
; RV32-NEXT:    ret
;
; RV64-LABEL: vrgather_permute_shuffle_vu_v4f64:
; RV64:       # %bb.0:
; RV64-NEXT:    lui a0, %hi(.LCPI4_0)
; RV64-NEXT:    addi a0, a0, %lo(.LCPI4_0)
; RV64-NEXT:    vsetivli zero, 4, e64, m2, ta, mu
; RV64-NEXT:    vle64.v v12, (a0)
; RV64-NEXT:    vrgather.vv v10, v8, v12
; RV64-NEXT:    vmv.v.v v8, v10
; RV64-NEXT:    ret
  %s = shufflevector <4 x double> %x, <4 x double> undef, <4 x i32> <i32 1, i32 2, i32 0, i32 1>
  ret <4 x double> %s
}

define <4 x double> @vrgather_permute_shuffle_uv_v4f64(<4 x double> %x) {
; RV32-LABEL: vrgather_permute_shuffle_uv_v4f64:
; RV32:       # %bb.0:
; RV32-NEXT:    lui a0, %hi(.LCPI5_0)
; RV32-NEXT:    addi a0, a0, %lo(.LCPI5_0)
; RV32-NEXT:    vsetivli zero, 4, e16, mf2, ta, mu
; RV32-NEXT:    vle16.v v12, (a0)
; RV32-NEXT:    vsetvli zero, zero, e64, m2, ta, mu
; RV32-NEXT:    vrgatherei16.vv v10, v8, v12
; RV32-NEXT:    vmv.v.v v8, v10
; RV32-NEXT:    ret
;
; RV64-LABEL: vrgather_permute_shuffle_uv_v4f64:
; RV64:       # %bb.0:
; RV64-NEXT:    lui a0, %hi(.LCPI5_0)
; RV64-NEXT:    addi a0, a0, %lo(.LCPI5_0)
; RV64-NEXT:    vsetivli zero, 4, e64, m2, ta, mu
; RV64-NEXT:    vle64.v v12, (a0)
; RV64-NEXT:    vrgather.vv v10, v8, v12
; RV64-NEXT:    vmv.v.v v8, v10
; RV64-NEXT:    ret
  %s = shufflevector <4 x double> undef, <4 x double> %x, <4 x i32> <i32 5, i32 6, i32 4, i32 5>
  ret <4 x double> %s
}

define <4 x double> @vrgather_shuffle_vv_v4f64(<4 x double> %x, <4 x double> %y) {
; RV32-LABEL: vrgather_shuffle_vv_v4f64:
; RV32:       # %bb.0:
; RV32-NEXT:    lui a0, %hi(.LCPI6_0)
; RV32-NEXT:    addi a0, a0, %lo(.LCPI6_0)
; RV32-NEXT:    vsetivli zero, 4, e16, mf2, ta, mu
; RV32-NEXT:    vle16.v v14, (a0)
; RV32-NEXT:    vsetvli zero, zero, e64, m2, ta, mu
; RV32-NEXT:    vrgatherei16.vv v12, v8, v14
; RV32-NEXT:    addi a0, zero, 8
; RV32-NEXT:    vsetivli zero, 1, e8, mf8, ta, mu
; RV32-NEXT:    vmv.s.x v0, a0
; RV32-NEXT:    vsetivli zero, 4, e64, m2, ta, mu
; RV32-NEXT:    vrgather.vi v12, v10, 1, v0.t
; RV32-NEXT:    vmv.v.v v8, v12
; RV32-NEXT:    ret
;
; RV64-LABEL: vrgather_shuffle_vv_v4f64:
; RV64:       # %bb.0:
; RV64-NEXT:    lui a0, %hi(.LCPI6_0)
; RV64-NEXT:    addi a0, a0, %lo(.LCPI6_0)
; RV64-NEXT:    vsetivli zero, 4, e64, m2, ta, mu
; RV64-NEXT:    vle64.v v14, (a0)
; RV64-NEXT:    vrgather.vv v12, v8, v14
; RV64-NEXT:    addi a0, zero, 8
; RV64-NEXT:    vsetivli zero, 1, e8, mf8, ta, mu
; RV64-NEXT:    vmv.s.x v0, a0
; RV64-NEXT:    vsetivli zero, 4, e64, m2, ta, mu
; RV64-NEXT:    vrgather.vi v12, v10, 1, v0.t
; RV64-NEXT:    vmv.v.v v8, v12
; RV64-NEXT:    ret
  %s = shufflevector <4 x double> %x, <4 x double> %y, <4 x i32> <i32 1, i32 2, i32 0, i32 5>
  ret <4 x double> %s
}

define <4 x double> @vrgather_shuffle_xv_v4f64(<4 x double> %x) {
; RV32-LABEL: vrgather_shuffle_xv_v4f64:
; RV32:       # %bb.0:
; RV32-NEXT:    addi a0, zero, 12
; RV32-NEXT:    vsetivli zero, 1, e8, mf8, ta, mu
; RV32-NEXT:    vmv.s.x v0, a0
; RV32-NEXT:    vsetivli zero, 4, e16, mf2, ta, mu
; RV32-NEXT:    lui a0, %hi(.LCPI7_0)
; RV32-NEXT:    addi a0, a0, %lo(.LCPI7_0)
; RV32-NEXT:    vlse64.v v10, (a0), zero
; RV32-NEXT:    vid.v v12
; RV32-NEXT:    vrsub.vi v12, v12, 4
; RV32-NEXT:    vsetvli zero, zero, e64, m2, ta, mu
; RV32-NEXT:    vrgatherei16.vv v10, v8, v12, v0.t
; RV32-NEXT:    vmv.v.v v8, v10
; RV32-NEXT:    ret
;
; RV64-LABEL: vrgather_shuffle_xv_v4f64:
; RV64:       # %bb.0:
; RV64-NEXT:    addi a0, zero, 12
; RV64-NEXT:    vsetivli zero, 1, e8, mf8, ta, mu
; RV64-NEXT:    vmv.s.x v0, a0
; RV64-NEXT:    vsetivli zero, 4, e64, m2, ta, mu
; RV64-NEXT:    lui a0, %hi(.LCPI7_0)
; RV64-NEXT:    addi a0, a0, %lo(.LCPI7_0)
; RV64-NEXT:    vlse64.v v10, (a0), zero
; RV64-NEXT:    vid.v v12
; RV64-NEXT:    vrsub.vi v12, v12, 4
; RV64-NEXT:    vrgather.vv v10, v8, v12, v0.t
; RV64-NEXT:    vmv.v.v v8, v10
; RV64-NEXT:    ret
  %s = shufflevector <4 x double> <double 2.0, double 2.0, double 2.0, double 2.0>, <4 x double> %x, <4 x i32> <i32 0, i32 3, i32 6, i32 5>
  ret <4 x double> %s
}

define <4 x double> @vrgather_shuffle_vx_v4f64(<4 x double> %x) {
; RV32-LABEL: vrgather_shuffle_vx_v4f64:
; RV32:       # %bb.0:
; RV32-NEXT:    vsetivli zero, 4, e16, mf2, ta, mu
; RV32-NEXT:    vid.v v10
; RV32-NEXT:    addi a0, zero, 3
; RV32-NEXT:    vmul.vx v12, v10, a0
; RV32-NEXT:    vsetivli zero, 1, e8, mf8, ta, mu
; RV32-NEXT:    vmv.s.x v0, a0
; RV32-NEXT:    lui a0, %hi(.LCPI8_0)
; RV32-NEXT:    addi a0, a0, %lo(.LCPI8_0)
; RV32-NEXT:    vsetivli zero, 4, e64, m2, ta, mu
; RV32-NEXT:    vlse64.v v10, (a0), zero
; RV32-NEXT:    vrgatherei16.vv v10, v8, v12, v0.t
; RV32-NEXT:    vmv.v.v v8, v10
; RV32-NEXT:    ret
;
; RV64-LABEL: vrgather_shuffle_vx_v4f64:
; RV64:       # %bb.0:
; RV64-NEXT:    vsetivli zero, 4, e64, m2, ta, mu
; RV64-NEXT:    vid.v v10
; RV64-NEXT:    addi a0, zero, 3
; RV64-NEXT:    vmul.vx v12, v10, a0
; RV64-NEXT:    vsetivli zero, 1, e8, mf8, ta, mu
; RV64-NEXT:    vmv.s.x v0, a0
; RV64-NEXT:    lui a0, %hi(.LCPI8_0)
; RV64-NEXT:    addi a0, a0, %lo(.LCPI8_0)
; RV64-NEXT:    vsetivli zero, 4, e64, m2, ta, mu
; RV64-NEXT:    vlse64.v v10, (a0), zero
; RV64-NEXT:    vrgather.vv v10, v8, v12, v0.t
; RV64-NEXT:    vmv.v.v v8, v10
; RV64-NEXT:    ret
  %s = shufflevector <4 x double> %x, <4 x double> <double 2.0, double 2.0, double 2.0, double 2.0>, <4 x i32> <i32 0, i32 3, i32 6, i32 5>
  ret <4 x double> %s
}
