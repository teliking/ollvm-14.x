; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=thumbv8.1m.main -mattr=+mve.fp -verify-machineinstrs -o - %s | FileCheck %s

define arm_aapcs_vfpcc <16 x i8> @test_vmaxaq_s8(<16 x i8> %a, <16 x i8> %b) local_unnamed_addr #0 {
; CHECK-LABEL: test_vmaxaq_s8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmaxa.s8 q0, q1
; CHECK-NEXT:    bx lr
entry:
  %0 = icmp slt <16 x i8> %b, zeroinitializer
  %1 = sub <16 x i8> zeroinitializer, %b
  %2 = select <16 x i1> %0, <16 x i8> %1, <16 x i8> %b
  %3 = icmp ugt <16 x i8> %2, %a
  %4 = select <16 x i1> %3, <16 x i8> %2, <16 x i8> %a
  ret <16 x i8> %4
}

define arm_aapcs_vfpcc <8 x i16> @test_vmaxaq_s16(<8 x i16> %a, <8 x i16> %b) local_unnamed_addr #0 {
; CHECK-LABEL: test_vmaxaq_s16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmaxa.s16 q0, q1
; CHECK-NEXT:    bx lr
entry:
  %0 = icmp slt <8 x i16> %b, zeroinitializer
  %1 = sub <8 x i16> zeroinitializer, %b
  %2 = select <8 x i1> %0, <8 x i16> %1, <8 x i16> %b
  %3 = icmp ugt <8 x i16> %2, %a
  %4 = select <8 x i1> %3, <8 x i16> %2, <8 x i16> %a
  ret <8 x i16> %4
}

define arm_aapcs_vfpcc <4 x i32> @test_vmaxaq_s32(<4 x i32> %a, <4 x i32> %b) local_unnamed_addr #0 {
; CHECK-LABEL: test_vmaxaq_s32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmaxa.s32 q0, q1
; CHECK-NEXT:    bx lr
entry:
  %0 = icmp slt <4 x i32> %b, zeroinitializer
  %1 = sub <4 x i32> zeroinitializer, %b
  %2 = select <4 x i1> %0, <4 x i32> %1, <4 x i32> %b
  %3 = icmp ugt <4 x i32> %2, %a
  %4 = select <4 x i1> %3, <4 x i32> %2, <4 x i32> %a
  ret <4 x i32> %4
}

define arm_aapcs_vfpcc <16 x i8> @test_vmaxaq_m_s8(<16 x i8> %a, <16 x i8> %b, i16 zeroext %p) local_unnamed_addr #1 {
; CHECK-LABEL: test_vmaxaq_m_s8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r0
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vmaxat.s8 q0, q1
; CHECK-NEXT:    bx lr
entry:
  %0 = zext i16 %p to i32
  %1 = tail call <16 x i1> @llvm.arm.mve.pred.i2v.v16i1(i32 %0)
  %2 = tail call <16 x i8> @llvm.arm.mve.vmaxa.predicated.v16i8.v16i1(<16 x i8> %a, <16 x i8> %b, <16 x i1> %1)
  ret <16 x i8> %2
}

declare <16 x i1> @llvm.arm.mve.pred.i2v.v16i1(i32) #2

declare <16 x i8> @llvm.arm.mve.vmaxa.predicated.v16i8.v16i1(<16 x i8>, <16 x i8>, <16 x i1>) #2

define arm_aapcs_vfpcc <8 x i16> @test_vmaxaq_m_s16(<8 x i16> %a, <8 x i16> %b, i16 zeroext %p) local_unnamed_addr #1 {
; CHECK-LABEL: test_vmaxaq_m_s16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r0
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vmaxat.s16 q0, q1
; CHECK-NEXT:    bx lr
entry:
  %0 = zext i16 %p to i32
  %1 = tail call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 %0)
  %2 = tail call <8 x i16> @llvm.arm.mve.vmaxa.predicated.v8i16.v8i1(<8 x i16> %a, <8 x i16> %b, <8 x i1> %1)
  ret <8 x i16> %2
}

declare <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32) #2

declare <8 x i16> @llvm.arm.mve.vmaxa.predicated.v8i16.v8i1(<8 x i16>, <8 x i16>, <8 x i1>) #2

define arm_aapcs_vfpcc <4 x i32> @test_vmaxaq_m_s32(<4 x i32> %a, <4 x i32> %b, i16 zeroext %p) local_unnamed_addr #1 {
; CHECK-LABEL: test_vmaxaq_m_s32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r0
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vmaxat.s32 q0, q1
; CHECK-NEXT:    bx lr
entry:
  %0 = zext i16 %p to i32
  %1 = tail call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %0)
  %2 = tail call <4 x i32> @llvm.arm.mve.vmaxa.predicated.v4i32.v4i1(<4 x i32> %a, <4 x i32> %b, <4 x i1> %1)
  ret <4 x i32> %2
}

declare <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32) #2

declare <4 x i32> @llvm.arm.mve.vmaxa.predicated.v4i32.v4i1(<4 x i32>, <4 x i32>, <4 x i1>) #2
