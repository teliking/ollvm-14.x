; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -verify-machineinstrs -mtriple=powerpc64le-unknown-linux-gnu \
; RUN:   --ppc-asm-full-reg-names -mcpu=pwr8 < %s | FileCheck %s
; RUN: llc -verify-machineinstrs -mtriple=powerpc64-unknown-linux-gnu \
; RUN:   --ppc-asm-full-reg-names -mcpu=pwr7 < %s | FileCheck %s
; RUN: llc -verify-machineinstrs -mtriple=powerpc-unknown-aix \
; RUN:   --ppc-asm-full-reg-names -mcpu=pwr8 < %s | FileCheck %s
; RUN: llc -verify-machineinstrs -mtriple=powerpc64-unknown-aix \
; RUN:   --ppc-asm-full-reg-names -mcpu=pwr8 < %s | FileCheck %s

; tw
declare void @llvm.ppc.tw(i32 %a, i32 %b, i32 %c)
define dso_local void @test__twlgt(i32 %a, i32 %b) {
; CHECK-LABEL: test__twlgt:
; CHECK:       # %bb.0:
; CHECK-NEXT:    twlgt r3, r4
; CHECK-NEXT:    blr
  call void @llvm.ppc.tw(i32 %a, i32 %b, i32 1)
  ret void
}

define dso_local void @test__twllt(i32 %a, i32 %b) {
; CHECK-LABEL: test__twllt:
; CHECK:       # %bb.0:
; CHECK-NEXT:    twllt r3, r4
; CHECK-NEXT:    blr
  call void @llvm.ppc.tw(i32 %a, i32 %b, i32 2)
  ret void
}

define dso_local void @test__tw3(i32 %a, i32 %b) {
; CHECK-LABEL: test__tw3:
; CHECK:       # %bb.0:
; CHECK-NEXT:    tw 3, r3, r4
; CHECK-NEXT:    blr
  call void @llvm.ppc.tw(i32 %a, i32 %b, i32 3)
  ret void
}

define dso_local void @test__tweq(i32 %a, i32 %b) {
; CHECK-LABEL: test__tweq:
; CHECK:       # %bb.0:
; CHECK-NEXT:    tweq r3, r4
; CHECK-NEXT:    blr
  call void @llvm.ppc.tw(i32 %a, i32 %b, i32 4)
  ret void
}

define dso_local void @test__twlge(i32 %a, i32 %b) {
; CHECK-LABEL: test__twlge:
; CHECK:       # %bb.0:
; CHECK-NEXT:    tw 5, r3, r4
; CHECK-NEXT:    blr
  call void @llvm.ppc.tw(i32 %a, i32 %b, i32 5)
  ret void
}

define dso_local void @test__twlle(i32 %a, i32 %b) {
; CHECK-LABEL: test__twlle:
; CHECK:       # %bb.0:
; CHECK-NEXT:    tw 6, r3, r4
; CHECK-NEXT:    blr
  call void @llvm.ppc.tw(i32 %a, i32 %b, i32 6)
  ret void
}

define dso_local void @test__twgt(i32 %a, i32 %b) {
; CHECK-LABEL: test__twgt:
; CHECK:       # %bb.0:
; CHECK-NEXT:    twgt r3, r4
; CHECK-NEXT:    blr
  call void @llvm.ppc.tw(i32 %a, i32 %b, i32 8)
  ret void
}

define dso_local void @test__twge(i32 %a, i32 %b) {
; CHECK-LABEL: test__twge:
; CHECK:       # %bb.0:
; CHECK-NEXT:    tw 12, r3, r4
; CHECK-NEXT:    blr
  call void @llvm.ppc.tw(i32 %a, i32 %b, i32 12)
  ret void
}

define dso_local void @test__twlt(i32 %a, i32 %b) {
; CHECK-LABEL: test__twlt:
; CHECK:       # %bb.0:
; CHECK-NEXT:    twlt r3, r4
; CHECK-NEXT:    blr
  call void @llvm.ppc.tw(i32 %a, i32 %b, i32 16)
  ret void
}

define dso_local void @test__twle(i32 %a, i32 %b) {
; CHECK-LABEL: test__twle:
; CHECK:       # %bb.0:
; CHECK-NEXT:    tw 20, r3, r4
; CHECK-NEXT:    blr
  call void @llvm.ppc.tw(i32 %a, i32 %b, i32 20)
  ret void
}

define dso_local void @test__twne24(i32 %a, i32 %b) {
; CHECK-LABEL: test__twne24:
; CHECK:       # %bb.0:
; CHECK-NEXT:    twne r3, r4
; CHECK-NEXT:    blr
  call void @llvm.ppc.tw(i32 %a, i32 %b, i32 24)
  ret void
}

define dso_local void @test__twu(i32 %a, i32 %b) {
; CHECK-LABEL: test__twu:
; CHECK:       # %bb.0:
; CHECK-NEXT:    twu r3, r4
; CHECK-NEXT:    blr
  call void @llvm.ppc.tw(i32 %a, i32 %b, i32 31)
  ret void
}

define dso_local void @test__tw_no_match(i32 %a, i32 %b) {
; CHECK-LABEL: test__tw_no_match:
; CHECK:       # %bb.0:
; CHECK-NEXT:    tw 13, r3, r4
; CHECK-NEXT:    blr
  call void @llvm.ppc.tw(i32 %a, i32 %b, i32 13)
  ret void
}

; trap
declare void @llvm.ppc.trap(i32 %a)
define dso_local void @test__trap(i32 %a) {
; CHECK-LABEL: test__trap:
; CHECK:       # %bb.0:
; CHECK-NEXT:    twnei r3, 0
; CHECK-NEXT:    blr
  call void @llvm.ppc.trap(i32 %a)
  ret void
}
