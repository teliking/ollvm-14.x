; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv64 -mattr=+m,+f,+d,+a,+c,+experimental-v \
; RUN:    -verify-machineinstrs -O2 < %s | FileCheck %s

declare i64 @llvm.riscv.vsetvli(i64, i64, i64)
declare <vscale x 1 x double> @llvm.riscv.vfadd.nxv1f64.nxv1f64(
  <vscale x 1 x double>,
  <vscale x 1 x double>,
  i64)
declare <vscale x 1 x i64> @llvm.riscv.vle.mask.nxv1i64(
  <vscale x 1 x i64>,
  <vscale x 1 x i64>*,
  <vscale x 1 x i1>,
  i64, i64)

define <vscale x 1 x double> @test1(i64 %avl, <vscale x 1 x double> %a, <vscale x 1 x double> %b) nounwind {
; CHECK-LABEL: test1:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli a0, a0, e64, m1, ta, mu
; CHECK-NEXT:    vfadd.vv v8, v8, v9
; CHECK-NEXT:    ret
entry:
  %0 = tail call i64 @llvm.riscv.vsetvli(i64 %avl, i64 2, i64 7)
  %1 = tail call <vscale x 1 x double> @llvm.riscv.vfadd.nxv1f64.nxv1f64(
    <vscale x 1 x double> %a,
    <vscale x 1 x double> %b,
    i64 %0)
  ret <vscale x 1 x double> %1
}

define <vscale x 1 x double> @test2(i64 %avl, <vscale x 1 x double> %a, <vscale x 1 x double> %b) nounwind {
; CHECK-LABEL: test2:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli a0, a0, e64, m1, ta, mu
; CHECK-NEXT:    vfadd.vv v8, v8, v9
; CHECK-NEXT:    ret
entry:
  %0 = tail call i64 @llvm.riscv.vsetvli(i64 %avl, i64 2, i64 7)
  %1 = tail call <vscale x 1 x double> @llvm.riscv.vfadd.nxv1f64.nxv1f64(
    <vscale x 1 x double> %a,
    <vscale x 1 x double> %b,
    i64 %avl)
  ret <vscale x 1 x double> %1
}

define <vscale x 1 x i64> @test3(i64 %avl, <vscale x 1 x i64> %a, <vscale x 1 x i64>* %b, <vscale x 1 x i1> %c) nounwind {
; CHECK-LABEL: test3:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli a0, a0, e64, m1, ta, mu
; CHECK-NEXT:    vle64.v v8, (a1), v0.t
; CHECK-NEXT:    ret
entry:
  %0 = tail call i64 @llvm.riscv.vsetvli(i64 %avl, i64 3, i64 0)
  %1 = call <vscale x 1 x i64> @llvm.riscv.vle.mask.nxv1i64(
    <vscale x 1 x i64> %a,
    <vscale x 1 x i64>* %b,
    <vscale x 1 x i1> %c,
    i64 %0, i64 1)

  ret <vscale x 1 x i64> %1
}

define <vscale x 1 x i64> @test4(i64 %avl, <vscale x 1 x i64> %a, <vscale x 1 x i64>* %b, <vscale x 1 x i1> %c) nounwind {
; CHECK-LABEL: test4:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli a0, a0, e64, m1, ta, mu
; CHECK-NEXT:    vle64.v v8, (a1), v0.t
; CHECK-NEXT:    ret
entry:
  %0 = tail call i64 @llvm.riscv.vsetvli(i64 %avl, i64 3, i64 0)
  %1 = call <vscale x 1 x i64> @llvm.riscv.vle.mask.nxv1i64(
    <vscale x 1 x i64> %a,
    <vscale x 1 x i64>* %b,
    <vscale x 1 x i1> %c,
    i64 %avl, i64 1)

  ret <vscale x 1 x i64> %1
}

; FIXME the second vsetvli is unnecessary.
define <vscale x 1 x i1> @test5(<vscale x 1 x i64> %0, <vscale x 1 x i64> %1, <vscale x 1 x i1> %2, i64 %avl) nounwind {
; CHECK-LABEL: test5:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli a0, a0, e64, m1, ta, mu
; CHECK-NEXT:    vmseq.vv v8, v8, v9
; CHECK-NEXT:    vsetvli zero, a0, e8, mf8, ta, mu
; CHECK-NEXT:    vmand.mm v0, v8, v0
; CHECK-NEXT:    ret
entry:
  %vl = tail call i64 @llvm.riscv.vsetvli(i64 %avl, i64 3, i64 0)
  %a = call <vscale x 1 x i1> @llvm.riscv.vmseq.nxv1i64.i64(<vscale x 1 x i64> %0, <vscale x 1 x i64> %1, i64 %vl)
  %b = call <vscale x 1 x i1> @llvm.riscv.vmand.nxv1i1.i64(<vscale x 1 x i1> %a, <vscale x 1 x i1> %2, i64 %vl)
  ret <vscale x 1 x i1> %b
}
declare <vscale x 1 x i1> @llvm.riscv.vmseq.nxv1i64.i64(<vscale x 1 x i64>, <vscale x 1 x i64>, i64)
declare <vscale x 1 x i1> @llvm.riscv.vmand.nxv1i1.i64(<vscale x 1 x i1>, <vscale x 1 x i1>, i64)
