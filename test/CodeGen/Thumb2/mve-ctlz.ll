; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=thumbv8.1m.main-none-none-eabi -verify-machineinstrs -mattr=+mve %s -o - | FileCheck %s
; RUN: llc -mtriple=thumbv8.1m.main-none-none-eabi -verify-machineinstrs -mattr=+mve %s -early-live-intervals -verify-machineinstrs -o - | FileCheck %s

define arm_aapcs_vfpcc <2 x i64> @ctlz_2i64_0_t(<2 x i64> %src){
; CHECK-LABEL: ctlz_2i64_0_t:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov r0, r1, d1
; CHECK-NEXT:    clz r0, r0
; CHECK-NEXT:    cmp r1, #0
; CHECK-NEXT:    cset r2, ne
; CHECK-NEXT:    adds r0, #32
; CHECK-NEXT:    cmp r2, #0
; CHECK-NEXT:    it ne
; CHECK-NEXT:    clzne r0, r1
; CHECK-NEXT:    vmov s2, r0
; CHECK-NEXT:    vmov r0, r1, d0
; CHECK-NEXT:    vldr s1, .LCPI0_0
; CHECK-NEXT:    vmov.f32 s3, s1
; CHECK-NEXT:    clz r0, r0
; CHECK-NEXT:    cmp r1, #0
; CHECK-NEXT:    cset r2, ne
; CHECK-NEXT:    adds r0, #32
; CHECK-NEXT:    cmp r2, #0
; CHECK-NEXT:    it ne
; CHECK-NEXT:    clzne r0, r1
; CHECK-NEXT:    vmov s0, r0
; CHECK-NEXT:    bx lr
; CHECK-NEXT:    .p2align 2
; CHECK-NEXT:  @ %bb.1:
; CHECK-NEXT:  .LCPI0_0:
; CHECK-NEXT:    .long 0x00000000 @ float 0
entry:
  %0 = call <2 x i64> @llvm.ctlz.v2i64(<2 x i64> %src, i1 0)
  ret <2 x i64> %0
}

define arm_aapcs_vfpcc <4 x i32> @ctlz_4i32_0_t(<4 x i32> %src){
; CHECK-LABEL: ctlz_4i32_0_t:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vclz.i32 q0, q0
; CHECK-NEXT:    bx lr
entry:
  %0 = call <4 x i32> @llvm.ctlz.v4i32(<4 x i32> %src, i1 0)
  ret <4 x i32> %0
}

define arm_aapcs_vfpcc <8 x i16> @ctlz_8i16_0_t(<8 x i16> %src){
; CHECK-LABEL: ctlz_8i16_0_t:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vclz.i16 q0, q0
; CHECK-NEXT:    bx lr
entry:
  %0 = call <8 x i16> @llvm.ctlz.v8i16(<8 x i16> %src, i1 0)
  ret <8 x i16> %0
}

define arm_aapcs_vfpcc <16 x i8> @ctlz_16i8_0_t(<16 x i8> %src){
; CHECK-LABEL: ctlz_16i8_0_t:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vclz.i8 q0, q0
; CHECK-NEXT:    bx lr
entry:
  %0 = call <16 x i8> @llvm.ctlz.v16i8(<16 x i8> %src, i1 0)
  ret <16 x i8> %0
}

define arm_aapcs_vfpcc <2 x i64> @ctlz_2i64_1_t(<2 x i64> %src){
; CHECK-LABEL: ctlz_2i64_1_t:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov r0, r1, d1
; CHECK-NEXT:    clz r0, r0
; CHECK-NEXT:    cmp r1, #0
; CHECK-NEXT:    cset r2, ne
; CHECK-NEXT:    adds r0, #32
; CHECK-NEXT:    cmp r2, #0
; CHECK-NEXT:    it ne
; CHECK-NEXT:    clzne r0, r1
; CHECK-NEXT:    vmov s2, r0
; CHECK-NEXT:    vmov r0, r1, d0
; CHECK-NEXT:    vldr s1, .LCPI4_0
; CHECK-NEXT:    vmov.f32 s3, s1
; CHECK-NEXT:    clz r0, r0
; CHECK-NEXT:    cmp r1, #0
; CHECK-NEXT:    cset r2, ne
; CHECK-NEXT:    adds r0, #32
; CHECK-NEXT:    cmp r2, #0
; CHECK-NEXT:    it ne
; CHECK-NEXT:    clzne r0, r1
; CHECK-NEXT:    vmov s0, r0
; CHECK-NEXT:    bx lr
; CHECK-NEXT:    .p2align 2
; CHECK-NEXT:  @ %bb.1:
; CHECK-NEXT:  .LCPI4_0:
; CHECK-NEXT:    .long 0x00000000 @ float 0
entry:
  %0 = call <2 x i64> @llvm.ctlz.v2i64(<2 x i64> %src, i1 1)
  ret <2 x i64> %0
}

define arm_aapcs_vfpcc <4 x i32> @ctlz_4i32_1_t(<4 x i32> %src){
; CHECK-LABEL: ctlz_4i32_1_t:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vclz.i32 q0, q0
; CHECK-NEXT:    bx lr
entry:
  %0 = call <4 x i32> @llvm.ctlz.v4i32(<4 x i32> %src, i1 1)
  ret <4 x i32> %0
}

define arm_aapcs_vfpcc <8 x i16> @ctlz_8i16_1_t(<8 x i16> %src){
; CHECK-LABEL: ctlz_8i16_1_t:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vclz.i16 q0, q0
; CHECK-NEXT:    bx lr
entry:
  %0 = call <8 x i16> @llvm.ctlz.v8i16(<8 x i16> %src, i1 1)
  ret <8 x i16> %0
}

define arm_aapcs_vfpcc <16 x i8> @ctlz_16i8_1_t(<16 x i8> %src){
; CHECK-LABEL: ctlz_16i8_1_t:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vclz.i8 q0, q0
; CHECK-NEXT:    bx lr
entry:
  %0 = call <16 x i8> @llvm.ctlz.v16i8(<16 x i8> %src, i1 1)
  ret <16 x i8> %0
}


declare <2 x i64> @llvm.ctlz.v2i64(<2 x i64>, i1)
declare <4 x i32> @llvm.ctlz.v4i32(<4 x i32>, i1)
declare <8 x i16> @llvm.ctlz.v8i16(<8 x i16>, i1)
declare <16 x i8> @llvm.ctlz.v16i8(<16 x i8>, i1)
