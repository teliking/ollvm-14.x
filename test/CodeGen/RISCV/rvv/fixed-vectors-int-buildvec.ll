; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+experimental-v -riscv-v-vector-bits-min=128 -riscv-v-fixed-length-vector-lmul-max=1 -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK,RV32
; RUN: llc -mtriple=riscv64 -mattr=+experimental-v -riscv-v-vector-bits-min=128 -riscv-v-fixed-length-vector-lmul-max=1 -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK,RV64

define void @buildvec_vid_v16i8(<16 x i8>* %x) {
; CHECK-LABEL: buildvec_vid_v16i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 16, e8, m1, ta, mu
; CHECK-NEXT:    vid.v v8
; CHECK-NEXT:    vse8.v v8, (a0)
; CHECK-NEXT:    ret
  store <16 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>, <16 x i8>* %x
  ret void
}

define void @buildvec_vid_undefelts_v16i8(<16 x i8>* %x) {
; CHECK-LABEL: buildvec_vid_undefelts_v16i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 16, e8, m1, ta, mu
; CHECK-NEXT:    vid.v v8
; CHECK-NEXT:    vse8.v v8, (a0)
; CHECK-NEXT:    ret
  store <16 x i8> <i8 0, i8 1, i8 2, i8 undef, i8 4, i8 undef, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>, <16 x i8>* %x
  ret void
}

; TODO: Could do VID then insertelement on missing elements
define void @buildvec_notquite_vid_v16i8(<16 x i8>* %x) {
; CHECK-LABEL: buildvec_notquite_vid_v16i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lui a1, %hi(.LCPI2_0)
; CHECK-NEXT:    addi a1, a1, %lo(.LCPI2_0)
; CHECK-NEXT:    vsetivli zero, 16, e8, m1, ta, mu
; CHECK-NEXT:    vle8.v v8, (a1)
; CHECK-NEXT:    vse8.v v8, (a0)
; CHECK-NEXT:    ret
  store <16 x i8> <i8 0, i8 1, i8 3, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>, <16 x i8>* %x
  ret void
}

define void @buildvec_vid_plus_imm_v16i8(<16 x i8>* %x) {
; CHECK-LABEL: buildvec_vid_plus_imm_v16i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 16, e8, m1, ta, mu
; CHECK-NEXT:    vid.v v8
; CHECK-NEXT:    vadd.vi v8, v8, 2
; CHECK-NEXT:    vse8.v v8, (a0)
; CHECK-NEXT:    ret
  store <16 x i8> <i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15, i8 16, i8 17>, <16 x i8>* %x
  ret void
}

define void @buildvec_vid_mpy_imm_v16i8(<16 x i8>* %x) {
; CHECK-LABEL: buildvec_vid_mpy_imm_v16i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 16, e8, m1, ta, mu
; CHECK-NEXT:    vid.v v8
; CHECK-NEXT:    addi a1, zero, 3
; CHECK-NEXT:    vmul.vx v8, v8, a1
; CHECK-NEXT:    vse8.v v8, (a0)
; CHECK-NEXT:    ret
  store <16 x i8> <i8 0, i8 3, i8 6, i8 9, i8 12, i8 15, i8 18, i8 21, i8 24, i8 27, i8 30, i8 33, i8 36, i8 39, i8 42, i8 45>, <16 x i8>* %x
  ret void
}

define void @buildvec_vid_step2_add0_v4i8(<4 x i8>* %z0, <4 x i8>* %z1, <4 x i8>* %z2, <4 x i8>* %z3) {
; CHECK-LABEL: buildvec_vid_step2_add0_v4i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e8, mf4, ta, mu
; CHECK-NEXT:    vid.v v8
; CHECK-NEXT:    vadd.vv v8, v8, v8
; CHECK-NEXT:    vse8.v v8, (a0)
; CHECK-NEXT:    vse8.v v8, (a1)
; CHECK-NEXT:    vse8.v v8, (a2)
; CHECK-NEXT:    vse8.v v8, (a3)
; CHECK-NEXT:    ret
  store <4 x i8> <i8 0, i8 2, i8 4, i8 6>, <4 x i8>* %z0
  store <4 x i8> <i8 undef, i8 2, i8 4, i8 6>, <4 x i8>* %z1
  store <4 x i8> <i8 undef, i8 undef, i8 4, i8 6>, <4 x i8>* %z2
  store <4 x i8> <i8 0, i8 undef, i8 undef, i8 6>, <4 x i8>* %z3
  ret void
}

define void @buildvec_vid_step2_add1_v4i8(<4 x i8>* %z0, <4 x i8>* %z1, <4 x i8>* %z2, <4 x i8>* %z3) {
; CHECK-LABEL: buildvec_vid_step2_add1_v4i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e8, mf4, ta, mu
; CHECK-NEXT:    vid.v v8
; CHECK-NEXT:    vadd.vv v8, v8, v8
; CHECK-NEXT:    vadd.vi v8, v8, 1
; CHECK-NEXT:    vse8.v v8, (a0)
; CHECK-NEXT:    vse8.v v8, (a1)
; CHECK-NEXT:    vse8.v v8, (a2)
; CHECK-NEXT:    vse8.v v8, (a3)
; CHECK-NEXT:    ret
  store <4 x i8> <i8 1, i8 3, i8 5, i8 7>, <4 x i8>* %z0
  store <4 x i8> <i8 undef, i8 3, i8 5, i8 7>, <4 x i8>* %z1
  store <4 x i8> <i8 undef, i8 undef, i8 5, i8 7>, <4 x i8>* %z2
  store <4 x i8> <i8 1, i8 undef, i8 undef, i8 7>, <4 x i8>* %z3
  ret void
}

; FIXME: This could generate vrsub.vi but the (ISD::MUL X, -1) we generate
; while lowering ISD::BUILD_VECTOR is custom-lowered to RISCVISD::MUL_VL before
; being combined.
define void @buildvec_vid_stepn1_add0_v4i8(<4 x i8>* %z0, <4 x i8>* %z1, <4 x
; CHECK-LABEL: buildvec_vid_stepn1_add0_v4i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e8, mf4, ta, mu
; CHECK-NEXT:    vid.v v8
; CHECK-NEXT:    vrsub.vi v8, v8, 0
; CHECK-NEXT:    vse8.v v8, (a0)
; CHECK-NEXT:    vse8.v v8, (a1)
; CHECK-NEXT:    vse8.v v8, (a2)
; CHECK-NEXT:    vse8.v v8, (a3)
; CHECK-NEXT:    ret
i8>* %z2, <4 x i8>* %z3) {
  store <4 x i8> <i8 0, i8 -1, i8 -2, i8 -3>, <4 x i8>* %z0
  store <4 x i8> <i8 undef, i8 -1, i8 -2, i8 -3>, <4 x i8>* %z1
  store <4 x i8> <i8 undef, i8 undef, i8 -2, i8 -3>, <4 x i8>* %z2
  store <4 x i8> <i8 0, i8 undef, i8 undef, i8 -3>, <4 x i8>* %z3
  ret void
}

define void @buildvec_vid_stepn2_add0_v4i8(<4 x i8>* %z0, <4 x i8>* %z1, <4 x i8>* %z2, <4 x i8>* %z3) {
; CHECK-LABEL: buildvec_vid_stepn2_add0_v4i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e8, mf4, ta, mu
; CHECK-NEXT:    vid.v v8
; CHECK-NEXT:    vadd.vv v8, v8, v8
; CHECK-NEXT:    vrsub.vi v8, v8, 0
; CHECK-NEXT:    vse8.v v8, (a0)
; CHECK-NEXT:    vse8.v v8, (a1)
; CHECK-NEXT:    vse8.v v8, (a2)
; CHECK-NEXT:    vse8.v v8, (a3)
; CHECK-NEXT:    ret
  store <4 x i8> <i8 0, i8 -2, i8 -4, i8 -6>, <4 x i8>* %z0
  store <4 x i8> <i8 undef, i8 -2, i8 -4, i8 -6>, <4 x i8>* %z1
  store <4 x i8> <i8 undef, i8 undef, i8 -4, i8 -6>, <4 x i8>* %z2
  store <4 x i8> <i8 0, i8 undef, i8 undef, i8 -6>, <4 x i8>* %z3
  ret void
}

define void @buildvec_vid_stepn2_add3_v4i8(<4 x i8>* %z0, <4 x i8>* %z1, <4 x i8>* %z2, <4 x i8>* %z3) {
; CHECK-LABEL: buildvec_vid_stepn2_add3_v4i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e8, mf4, ta, mu
; CHECK-NEXT:    vid.v v8
; CHECK-NEXT:    vadd.vv v8, v8, v8
; CHECK-NEXT:    vrsub.vi v8, v8, 3
; CHECK-NEXT:    vse8.v v8, (a0)
; CHECK-NEXT:    ret
  store <4 x i8> <i8 3, i8 1, i8 -1, i8 -3>, <4 x i8>* %z0
  ret void
}

define void @buildvec_vid_stepn3_add3_v4i8(<4 x i8>* %z0, <4 x i8>* %z1, <4 x i8>* %z2, <4 x i8>* %z3) {
; CHECK-LABEL: buildvec_vid_stepn3_add3_v4i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e8, mf4, ta, mu
; CHECK-NEXT:    vmv.v.i v8, 3
; CHECK-NEXT:    vid.v v9
; CHECK-NEXT:    addi a1, zero, -3
; CHECK-NEXT:    vmadd.vx v9, a1, v8
; CHECK-NEXT:    vse8.v v9, (a0)
; CHECK-NEXT:    ret
  store <4 x i8> <i8 3, i8 0, i8 -3, i8 -6>, <4 x i8>* %z0
  ret void
}

define void @buildvec_vid_stepn3_addn3_v4i32(<4 x i32>* %z0, <4 x i32>* %z1, <4 x i32>* %z2, <4 x i32>* %z3) {
; CHECK-LABEL: buildvec_vid_stepn3_addn3_v4i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e32, m1, ta, mu
; CHECK-NEXT:    vmv.v.i v8, -3
; CHECK-NEXT:    vid.v v9
; CHECK-NEXT:    addi a4, zero, -3
; CHECK-NEXT:    vmadd.vx v9, a4, v8
; CHECK-NEXT:    vse32.v v9, (a0)
; CHECK-NEXT:    vse32.v v9, (a1)
; CHECK-NEXT:    vse32.v v9, (a2)
; CHECK-NEXT:    vse32.v v9, (a3)
; CHECK-NEXT:    ret
  store <4 x i32> <i32 -3, i32 -6, i32 -9, i32 -12>, <4 x i32>* %z0
  store <4 x i32> <i32 undef, i32 -6, i32 -9, i32 -12>, <4 x i32>* %z1
  store <4 x i32> <i32 undef, i32 undef, i32 -9, i32 -12>, <4 x i32>* %z2
  store <4 x i32> <i32 -3, i32 undef, i32 undef, i32 -12>, <4 x i32>* %z3
  ret void
}

; FIXME: RV32 doesn't catch this pattern due to BUILD_VECTOR legalization.
define <4 x i64> @buildvec_vid_step1_add0_v4i64() {
; RV32-LABEL: buildvec_vid_step1_add0_v4i64:
; RV32:       # %bb.0:
; RV32-NEXT:    addi a0, zero, 1
; RV32-NEXT:    vsetivli zero, 4, e32, m1, ta, mu
; RV32-NEXT:    vmv.s.x v9, a0
; RV32-NEXT:    vmv.v.i v8, 0
; RV32-NEXT:    vsetivli zero, 3, e32, m1, tu, mu
; RV32-NEXT:    vslideup.vi v8, v9, 2
; RV32-NEXT:    lui a0, %hi(.LCPI12_0)
; RV32-NEXT:    addi a0, a0, %lo(.LCPI12_0)
; RV32-NEXT:    vsetivli zero, 4, e32, m1, ta, mu
; RV32-NEXT:    vle32.v v9, (a0)
; RV32-NEXT:    ret
;
; RV64-LABEL: buildvec_vid_step1_add0_v4i64:
; RV64:       # %bb.0:
; RV64-NEXT:    vsetivli zero, 2, e64, m1, ta, mu
; RV64-NEXT:    vid.v v8
; RV64-NEXT:    vadd.vi v9, v8, 2
; RV64-NEXT:    ret
  ret <4 x i64> <i64 0, i64 1, i64 2, i64 3>
}

define <4 x i64> @buildvec_vid_step2_add0_v4i64() {
; RV32-LABEL: buildvec_vid_step2_add0_v4i64:
; RV32:       # %bb.0:
; RV32-NEXT:    addi a0, zero, 2
; RV32-NEXT:    vsetivli zero, 4, e32, m1, ta, mu
; RV32-NEXT:    vmv.s.x v9, a0
; RV32-NEXT:    vmv.v.i v8, 0
; RV32-NEXT:    vsetivli zero, 3, e32, m1, tu, mu
; RV32-NEXT:    vslideup.vi v8, v9, 2
; RV32-NEXT:    lui a0, %hi(.LCPI13_0)
; RV32-NEXT:    addi a0, a0, %lo(.LCPI13_0)
; RV32-NEXT:    vsetivli zero, 4, e32, m1, ta, mu
; RV32-NEXT:    vle32.v v9, (a0)
; RV32-NEXT:    ret
;
; RV64-LABEL: buildvec_vid_step2_add0_v4i64:
; RV64:       # %bb.0:
; RV64-NEXT:    vsetivli zero, 2, e64, m1, ta, mu
; RV64-NEXT:    vid.v v8
; RV64-NEXT:    vadd.vv v8, v8, v8
; RV64-NEXT:    vadd.vi v9, v8, 4
; RV64-NEXT:    ret
  ret <4 x i64> <i64 0, i64 2, i64 4, i64 6>
}

define void @buildvec_no_vid_v4i8(<4 x i8>* %z0, <4 x i8>* %z1, <4 x i8>* %z2, <4 x i8>* %z3, <4 x i8>* %z4, <4 x i8>* %z5) {
; RV32-LABEL: buildvec_no_vid_v4i8:
; RV32:       # %bb.0:
; RV32-NEXT:    lui a6, %hi(.LCPI14_0)
; RV32-NEXT:    addi a6, a6, %lo(.LCPI14_0)
; RV32-NEXT:    vsetivli zero, 4, e8, mf4, ta, mu
; RV32-NEXT:    vle8.v v8, (a6)
; RV32-NEXT:    lui a6, %hi(.LCPI14_1)
; RV32-NEXT:    addi a6, a6, %lo(.LCPI14_1)
; RV32-NEXT:    vle8.v v9, (a6)
; RV32-NEXT:    vse8.v v8, (a0)
; RV32-NEXT:    vse8.v v9, (a1)
; RV32-NEXT:    lui a0, 1
; RV32-NEXT:    addi a0, a0, -2048
; RV32-NEXT:    vsetivli zero, 2, e16, mf4, ta, mu
; RV32-NEXT:    vmv.v.x v8, a0
; RV32-NEXT:    vsetivli zero, 4, e8, mf4, ta, mu
; RV32-NEXT:    vse8.v v8, (a2)
; RV32-NEXT:    addi a0, zero, 2047
; RV32-NEXT:    vsetivli zero, 2, e16, mf4, ta, mu
; RV32-NEXT:    vmv.v.x v8, a0
; RV32-NEXT:    vsetivli zero, 4, e8, mf4, ta, mu
; RV32-NEXT:    lui a0, %hi(.LCPI14_2)
; RV32-NEXT:    addi a0, a0, %lo(.LCPI14_2)
; RV32-NEXT:    vle8.v v9, (a0)
; RV32-NEXT:    vse8.v v8, (a3)
; RV32-NEXT:    vmv.v.i v8, -2
; RV32-NEXT:    vse8.v v8, (a4)
; RV32-NEXT:    vse8.v v9, (a5)
; RV32-NEXT:    ret
;
; RV64-LABEL: buildvec_no_vid_v4i8:
; RV64:       # %bb.0:
; RV64-NEXT:    lui a6, %hi(.LCPI14_0)
; RV64-NEXT:    addi a6, a6, %lo(.LCPI14_0)
; RV64-NEXT:    vsetivli zero, 4, e8, mf4, ta, mu
; RV64-NEXT:    vle8.v v8, (a6)
; RV64-NEXT:    lui a6, %hi(.LCPI14_1)
; RV64-NEXT:    addi a6, a6, %lo(.LCPI14_1)
; RV64-NEXT:    vle8.v v9, (a6)
; RV64-NEXT:    vse8.v v8, (a0)
; RV64-NEXT:    vse8.v v9, (a1)
; RV64-NEXT:    lui a0, 1
; RV64-NEXT:    addiw a0, a0, -2048
; RV64-NEXT:    vsetivli zero, 2, e16, mf4, ta, mu
; RV64-NEXT:    vmv.v.x v8, a0
; RV64-NEXT:    vsetivli zero, 4, e8, mf4, ta, mu
; RV64-NEXT:    vse8.v v8, (a2)
; RV64-NEXT:    addi a0, zero, 2047
; RV64-NEXT:    vsetivli zero, 2, e16, mf4, ta, mu
; RV64-NEXT:    vmv.v.x v8, a0
; RV64-NEXT:    vsetivli zero, 4, e8, mf4, ta, mu
; RV64-NEXT:    lui a0, %hi(.LCPI14_2)
; RV64-NEXT:    addi a0, a0, %lo(.LCPI14_2)
; RV64-NEXT:    vle8.v v9, (a0)
; RV64-NEXT:    vse8.v v8, (a3)
; RV64-NEXT:    vmv.v.i v8, -2
; RV64-NEXT:    vse8.v v8, (a4)
; RV64-NEXT:    vse8.v v9, (a5)
; RV64-NEXT:    ret
  store <4 x i8> <i8 1, i8 3, i8 6, i8 7>, <4 x i8>* %z0
  store <4 x i8> <i8 undef, i8 2, i8 5, i8 7>, <4 x i8>* %z1
  store <4 x i8> <i8 0, i8 undef, i8 undef, i8 8>, <4 x i8>* %z2
  store <4 x i8> <i8 -1, i8 undef, i8 undef, i8 7>, <4 x i8>* %z3
  store <4 x i8> <i8 -2, i8 undef, i8 undef, i8 undef>, <4 x i8>* %z4
  store <4 x i8> <i8 -1, i8 -2, i8 -4, i8 -5>, <4 x i8>* %z5
  ret void
}

define void @buildvec_dominant0_v8i16(<8 x i16>* %x) {
; CHECK-LABEL: buildvec_dominant0_v8i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e16, m1, ta, mu
; CHECK-NEXT:    vmv.s.x v8, zero
; CHECK-NEXT:    vmv.v.i v9, 8
; CHECK-NEXT:    vsetivli zero, 4, e16, m1, tu, mu
; CHECK-NEXT:    vslideup.vi v9, v8, 3
; CHECK-NEXT:    vsetivli zero, 8, e16, m1, ta, mu
; CHECK-NEXT:    vse16.v v9, (a0)
; CHECK-NEXT:    ret
  store <8 x i16> <i16 8, i16 8, i16 undef, i16 0, i16 8, i16 undef, i16 8, i16 8>, <8 x i16>* %x
  ret void
}

define void @buildvec_dominant1_v8i16(<8 x i16>* %x) {
; CHECK-LABEL: buildvec_dominant1_v8i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e16, m1, ta, mu
; CHECK-NEXT:    vmv.v.i v8, 8
; CHECK-NEXT:    vse16.v v8, (a0)
; CHECK-NEXT:    ret
  store <8 x i16> <i16 undef, i16 8, i16 undef, i16 undef, i16 undef, i16 undef, i16 undef, i16 undef>, <8 x i16>* %x
  ret void
}

define void @buildvec_dominant0_v2i8(<2 x i8>* %x) {
; CHECK-LABEL: buildvec_dominant0_v2i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ret
  store <2 x i8> <i8 undef, i8 undef>, <2 x i8>* %x
  ret void
}

define void @buildvec_dominant1_v2i8(<2 x i8>* %x) {
; CHECK-LABEL: buildvec_dominant1_v2i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e8, mf8, ta, mu
; CHECK-NEXT:    vmv.v.i v8, -1
; CHECK-NEXT:    vse8.v v8, (a0)
; CHECK-NEXT:    ret
  store <2 x i8> <i8 undef, i8 -1>, <2 x i8>* %x
  ret void
}

define void @buildvec_dominant2_v2i8(<2 x i8>* %x) {
; CHECK-LABEL: buildvec_dominant2_v2i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e8, mf8, ta, mu
; CHECK-NEXT:    vid.v v8
; CHECK-NEXT:    vrsub.vi v8, v8, 0
; CHECK-NEXT:    vse8.v v8, (a0)
; CHECK-NEXT:    ret
  store <2 x i8> <i8 0, i8 -1>, <2 x i8>* %x
  ret void
}

define void @buildvec_dominant0_v2i32(<2 x i64>* %x) {
; RV32-LABEL: buildvec_dominant0_v2i32:
; RV32:       # %bb.0:
; RV32-NEXT:    lui a1, %hi(.LCPI20_0)
; RV32-NEXT:    addi a1, a1, %lo(.LCPI20_0)
; RV32-NEXT:    vsetivli zero, 4, e32, m1, ta, mu
; RV32-NEXT:    vle32.v v8, (a1)
; RV32-NEXT:    vse32.v v8, (a0)
; RV32-NEXT:    ret
;
; RV64-LABEL: buildvec_dominant0_v2i32:
; RV64:       # %bb.0:
; RV64-NEXT:    vsetivli zero, 2, e64, m1, ta, mu
; RV64-NEXT:    vmv.v.i v8, -1
; RV64-NEXT:    lui a1, 3641
; RV64-NEXT:    addiw a1, a1, -455
; RV64-NEXT:    slli a1, a1, 12
; RV64-NEXT:    addi a1, a1, -455
; RV64-NEXT:    slli a1, a1, 12
; RV64-NEXT:    addi a1, a1, -455
; RV64-NEXT:    slli a1, a1, 13
; RV64-NEXT:    addi a1, a1, -910
; RV64-NEXT:    vsetvli zero, zero, e64, m1, tu, mu
; RV64-NEXT:    vmv.s.x v8, a1
; RV64-NEXT:    vse64.v v8, (a0)
; RV64-NEXT:    ret
  store <2 x i64> <i64 2049638230412172402, i64 -1>, <2 x i64>* %x
  ret void
}

define void @buildvec_dominant1_optsize_v2i32(<2 x i64>* %x) optsize {
; RV32-LABEL: buildvec_dominant1_optsize_v2i32:
; RV32:       # %bb.0:
; RV32-NEXT:    lui a1, %hi(.LCPI21_0)
; RV32-NEXT:    addi a1, a1, %lo(.LCPI21_0)
; RV32-NEXT:    vsetivli zero, 4, e32, m1, ta, mu
; RV32-NEXT:    vle32.v v8, (a1)
; RV32-NEXT:    vse32.v v8, (a0)
; RV32-NEXT:    ret
;
; RV64-LABEL: buildvec_dominant1_optsize_v2i32:
; RV64:       # %bb.0:
; RV64-NEXT:    lui a1, %hi(.LCPI21_0)
; RV64-NEXT:    addi a1, a1, %lo(.LCPI21_0)
; RV64-NEXT:    vsetivli zero, 2, e64, m1, ta, mu
; RV64-NEXT:    vle64.v v8, (a1)
; RV64-NEXT:    vse64.v v8, (a0)
; RV64-NEXT:    ret
  store <2 x i64> <i64 2049638230412172402, i64 -1>, <2 x i64>* %x
  ret void
}

define void @buildvec_seq_v8i8_v4i16(<8 x i8>* %x) {
; CHECK-LABEL: buildvec_seq_v8i8_v4i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi a1, zero, 513
; CHECK-NEXT:    vsetivli zero, 4, e16, mf2, ta, mu
; CHECK-NEXT:    vmv.v.x v8, a1
; CHECK-NEXT:    vsetivli zero, 8, e8, mf2, ta, mu
; CHECK-NEXT:    vse8.v v8, (a0)
; CHECK-NEXT:    ret
  store <8 x i8> <i8 1, i8 2, i8 1, i8 2, i8 1, i8 2, i8 undef, i8 2>, <8 x i8>* %x
  ret void
}

define void @buildvec_seq_v8i8_v2i32(<8 x i8>* %x) {
; RV32-LABEL: buildvec_seq_v8i8_v2i32:
; RV32:       # %bb.0:
; RV32-NEXT:    lui a1, 48
; RV32-NEXT:    addi a1, a1, 513
; RV32-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; RV32-NEXT:    vmv.v.x v8, a1
; RV32-NEXT:    vsetivli zero, 8, e8, mf2, ta, mu
; RV32-NEXT:    vse8.v v8, (a0)
; RV32-NEXT:    ret
;
; RV64-LABEL: buildvec_seq_v8i8_v2i32:
; RV64:       # %bb.0:
; RV64-NEXT:    lui a1, 48
; RV64-NEXT:    addiw a1, a1, 513
; RV64-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; RV64-NEXT:    vmv.v.x v8, a1
; RV64-NEXT:    vsetivli zero, 8, e8, mf2, ta, mu
; RV64-NEXT:    vse8.v v8, (a0)
; RV64-NEXT:    ret
  store <8 x i8> <i8 1, i8 2, i8 3, i8 undef, i8 1, i8 2, i8 3, i8 undef>, <8 x i8>* %x
  ret void
}

define void @buildvec_seq_v16i8_v2i64(<16 x i8>* %x) {
; RV32-LABEL: buildvec_seq_v16i8_v2i64:
; RV32:       # %bb.0:
; RV32-NEXT:    lui a1, %hi(.LCPI24_0)
; RV32-NEXT:    addi a1, a1, %lo(.LCPI24_0)
; RV32-NEXT:    vsetivli zero, 16, e8, m1, ta, mu
; RV32-NEXT:    vle8.v v8, (a1)
; RV32-NEXT:    vse8.v v8, (a0)
; RV32-NEXT:    ret
;
; RV64-LABEL: buildvec_seq_v16i8_v2i64:
; RV64:       # %bb.0:
; RV64-NEXT:    lui a1, 32880
; RV64-NEXT:    addiw a1, a1, 1541
; RV64-NEXT:    slli a1, a1, 16
; RV64-NEXT:    addi a1, a1, 1027
; RV64-NEXT:    slli a1, a1, 16
; RV64-NEXT:    addi a1, a1, 513
; RV64-NEXT:    vsetivli zero, 2, e64, m1, ta, mu
; RV64-NEXT:    vmv.v.x v8, a1
; RV64-NEXT:    vsetivli zero, 16, e8, m1, ta, mu
; RV64-NEXT:    vse8.v v8, (a0)
; RV64-NEXT:    ret
  store <16 x i8> <i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8>, <16 x i8>* %x
  ret void
}

define void @buildvec_seq2_v16i8_v2i64(<16 x i8>* %x) {
; RV32-LABEL: buildvec_seq2_v16i8_v2i64:
; RV32:       # %bb.0:
; RV32-NEXT:    lui a1, 528432
; RV32-NEXT:    addi a1, a1, 513
; RV32-NEXT:    vsetivli zero, 2, e64, m1, ta, mu
; RV32-NEXT:    vmv.v.x v8, a1
; RV32-NEXT:    vsetivli zero, 16, e8, m1, ta, mu
; RV32-NEXT:    vse8.v v8, (a0)
; RV32-NEXT:    ret
;
; RV64-LABEL: buildvec_seq2_v16i8_v2i64:
; RV64:       # %bb.0:
; RV64-NEXT:    lui a1, 528432
; RV64-NEXT:    addiw a1, a1, 513
; RV64-NEXT:    vsetivli zero, 2, e64, m1, ta, mu
; RV64-NEXT:    vmv.v.x v8, a1
; RV64-NEXT:    vsetivli zero, 16, e8, m1, ta, mu
; RV64-NEXT:    vse8.v v8, (a0)
; RV64-NEXT:    ret
  store <16 x i8> <i8 1, i8 2, i8 3, i8 129, i8 -1, i8 -1, i8 -1, i8 -1, i8 1, i8 2, i8 3, i8 129, i8 -1, i8 -1, i8 -1, i8 -1>, <16 x i8>* %x
  ret void
}

define void @buildvec_seq_v9i8(<9 x i8>* %x) {
; RV32-LABEL: buildvec_seq_v9i8:
; RV32:       # %bb.0:
; RV32-NEXT:    addi a1, zero, 3
; RV32-NEXT:    sb a1, 8(a0)
; RV32-NEXT:    addi a1, zero, 73
; RV32-NEXT:    vsetivli zero, 1, e8, mf8, ta, mu
; RV32-NEXT:    vmv.s.x v0, a1
; RV32-NEXT:    vsetivli zero, 8, e8, mf2, ta, mu
; RV32-NEXT:    vmv.v.i v8, 2
; RV32-NEXT:    vmerge.vim v8, v8, 1, v0
; RV32-NEXT:    addi a1, zero, 36
; RV32-NEXT:    vsetivli zero, 1, e8, mf8, ta, mu
; RV32-NEXT:    vmv.s.x v0, a1
; RV32-NEXT:    vsetivli zero, 8, e8, mf2, ta, mu
; RV32-NEXT:    vmerge.vim v8, v8, 3, v0
; RV32-NEXT:    vse8.v v8, (a0)
; RV32-NEXT:    ret
;
; RV64-LABEL: buildvec_seq_v9i8:
; RV64:       # %bb.0:
; RV64-NEXT:    addi a1, zero, 3
; RV64-NEXT:    sb a1, 8(a0)
; RV64-NEXT:    lui a1, 4104
; RV64-NEXT:    addiw a1, a1, 385
; RV64-NEXT:    slli a1, a1, 17
; RV64-NEXT:    addi a1, a1, 259
; RV64-NEXT:    slli a1, a1, 16
; RV64-NEXT:    addi a1, a1, 513
; RV64-NEXT:    sd a1, 0(a0)
; RV64-NEXT:    ret
  store <9 x i8> <i8 1, i8 2, i8 3, i8 1, i8 2, i8 3, i8 1, i8 2, i8 3>, <9 x i8>* %x
  ret void
}

define void @buildvec_seq_v4i16_v2i32(<4 x i16>* %x) {
; CHECK-LABEL: buildvec_seq_v4i16_v2i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi a1, zero, -127
; CHECK-NEXT:    vsetivli zero, 2, e32, mf2, ta, mu
; CHECK-NEXT:    vmv.v.x v8, a1
; CHECK-NEXT:    vsetivli zero, 4, e16, mf2, ta, mu
; CHECK-NEXT:    vse16.v v8, (a0)
; CHECK-NEXT:    ret
  store <4 x i16> <i16 -127, i16 -1, i16 -127, i16 -1>, <4 x i16>* %x
  ret void
}

define void @buildvec_vid_step1o2_v4i32(<4 x i32>* %z0, <4 x i32>* %z1, <4 x i32>* %z2, <4 x i32>* %z3, <4 x i32>* %z4, <4 x i32>* %z5, <4 x i32>* %z6) {
; CHECK-LABEL: buildvec_vid_step1o2_v4i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e32, m1, ta, mu
; CHECK-NEXT:    vid.v v8
; CHECK-NEXT:    vsrl.vi v8, v8, 1
; CHECK-NEXT:    vse32.v v8, (a0)
; CHECK-NEXT:    vse32.v v8, (a1)
; CHECK-NEXT:    vse32.v v8, (a2)
; CHECK-NEXT:    vse32.v v8, (a3)
; CHECK-NEXT:    vse32.v v8, (a4)
; CHECK-NEXT:    vmv.s.x v8, zero
; CHECK-NEXT:    vmv.v.i v9, 1
; CHECK-NEXT:    vsetivli zero, 2, e32, m1, tu, mu
; CHECK-NEXT:    vslideup.vi v9, v8, 1
; CHECK-NEXT:    vsetivli zero, 4, e32, m1, ta, mu
; CHECK-NEXT:    vse32.v v9, (a5)
; CHECK-NEXT:    addi a0, zero, 1
; CHECK-NEXT:    vmv.s.x v8, a0
; CHECK-NEXT:    vmv.v.i v9, 0
; CHECK-NEXT:    vsetvli zero, zero, e32, m1, tu, mu
; CHECK-NEXT:    vslideup.vi v9, v8, 3
; CHECK-NEXT:    vse32.v v9, (a6)
; CHECK-NEXT:    ret
  store <4 x i32> <i32 0, i32 0, i32 1, i32 1>, <4 x i32>* %z0
  store <4 x i32> <i32 0, i32 0, i32 1, i32 undef>, <4 x i32>* %z1
  store <4 x i32> <i32 0, i32 undef, i32 1, i32 1>, <4 x i32>* %z2
  store <4 x i32> <i32 undef, i32 0, i32 undef, i32 1>, <4 x i32>* %z3
  store <4 x i32> <i32 0, i32 undef, i32 1, i32 undef>, <4 x i32>* %z4
  ; We don't catch this one
  store <4 x i32> <i32 undef, i32 0, i32 1, i32 1>, <4 x i32>* %z5
  ; We catch this one but as VID/3 rather than VID/2
  store <4 x i32> <i32 0, i32 0, i32 undef, i32 1>, <4 x i32>* %z6
  ret void
}

define void @buildvec_vid_step1o2_add3_v4i16(<4 x i16>* %z0, <4 x i16>* %z1, <4 x i16>* %z2, <4 x i16>* %z3, <4 x i16>* %z4, <4 x i16>* %z5, <4 x i16>* %z6) {
; CHECK-LABEL: buildvec_vid_step1o2_add3_v4i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e16, mf2, ta, mu
; CHECK-NEXT:    vid.v v8
; CHECK-NEXT:    vsrl.vi v8, v8, 1
; CHECK-NEXT:    vadd.vi v8, v8, 3
; CHECK-NEXT:    vse16.v v8, (a0)
; CHECK-NEXT:    vse16.v v8, (a1)
; CHECK-NEXT:    vse16.v v8, (a2)
; CHECK-NEXT:    vse16.v v8, (a3)
; CHECK-NEXT:    vse16.v v8, (a4)
; CHECK-NEXT:    addi a0, zero, 3
; CHECK-NEXT:    vmv.s.x v8, a0
; CHECK-NEXT:    vmv.v.i v9, 4
; CHECK-NEXT:    vsetivli zero, 2, e16, mf2, tu, mu
; CHECK-NEXT:    vslideup.vi v9, v8, 1
; CHECK-NEXT:    vsetivli zero, 4, e16, mf2, ta, mu
; CHECK-NEXT:    vse16.v v9, (a5)
; CHECK-NEXT:    addi a0, zero, 4
; CHECK-NEXT:    vmv.s.x v8, a0
; CHECK-NEXT:    vmv.v.i v9, 3
; CHECK-NEXT:    vsetvli zero, zero, e16, mf2, tu, mu
; CHECK-NEXT:    vslideup.vi v9, v8, 3
; CHECK-NEXT:    vse16.v v9, (a6)
; CHECK-NEXT:    ret
  store <4 x i16> <i16 3, i16 3, i16 4, i16 4>, <4 x i16>* %z0
  store <4 x i16> <i16 3, i16 3, i16 4, i16 undef>, <4 x i16>* %z1
  store <4 x i16> <i16 3, i16 undef, i16 4, i16 4>, <4 x i16>* %z2
  store <4 x i16> <i16 undef, i16 3, i16 undef, i16 4>, <4 x i16>* %z3
  store <4 x i16> <i16 3, i16 undef, i16 4, i16 undef>, <4 x i16>* %z4
  ; We don't catch this one
  store <4 x i16> <i16 undef, i16 3, i16 4, i16 4>, <4 x i16>* %z5
  ; We catch this one but as VID/3 rather than VID/2
  store <4 x i16> <i16 3, i16 3, i16 undef, i16 4>, <4 x i16>* %z6
  ret void
}

define void @buildvec_vid_stepn1o4_addn5_v8i8(<8 x i8>* %z0) {
; CHECK-LABEL: buildvec_vid_stepn1o4_addn5_v8i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e8, mf2, ta, mu
; CHECK-NEXT:    vid.v v8
; CHECK-NEXT:    vsrl.vi v8, v8, 2
; CHECK-NEXT:    vrsub.vi v8, v8, -5
; CHECK-NEXT:    vse8.v v8, (a0)
; CHECK-NEXT:    ret
  store <8 x i8> <i8 -5, i8 -5, i8 -5, i8 -5, i8 -6, i8 -6, i8 -6, i8 -6>, <8 x i8>* %z0
  ret void
}
