; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -verify-machineinstrs -mtriple=powerpc64le-unknown-linux-gnu \
; RUN:   -mcpu=pwr8 < %s | FileCheck %s --check-prefix=CHECK-64
; RUN: llc -verify-machineinstrs -mtriple=powerpc64-unknown-linux-gnu \
; RUN:   -mcpu=pwr8 < %s | FileCheck %s --check-prefix=CHECK-64
; RUN: llc -verify-machineinstrs -mtriple=powerpc-unknown-aix \
; RUN:   -mcpu=pwr8 < %s | FileCheck %s --check-prefix=CHECK-32
; RUN: llc -verify-machineinstrs -mtriple=powerpc64-unknown-aix \
; RUN:   -mcpu=pwr8 < %s | FileCheck %s --check-prefix=CHECK-64

declare i32 @llvm.ppc.lwarx(i8*)
define dso_local signext i32 @test_lwarx(i32* readnone %a) {
; CHECK-64-LABEL: test_lwarx:
; CHECK-64:       # %bb.0: # %entry
; CHECK-64-NEXT:    #APP
; CHECK-64-NEXT:    lwarx 3, 0, 3
; CHECK-64-NEXT:    #NO_APP
; CHECK-64-NEXT:    extsw 3, 3
; CHECK-64-NEXT:    blr
;
; CHECK-32-LABEL: test_lwarx:
; CHECK-32:       # %bb.0: # %entry
; CHECK-32-NEXT:    #APP
; CHECK-32-NEXT:    lwarx 3, 0, 3
; CHECK-32-NEXT:    #NO_APP
; CHECK-32-NEXT:    blr
entry:
  %0 = call i32 asm sideeffect "lwarx $0, ${1:y}", "=r,*Z,~{memory}"(i32* %a)
  ret i32 %0
}

declare i32 @llvm.ppc.stwcx(i8*, i32)
define dso_local signext i32 @test_stwcx(i32* %a, i32 signext %b) {
; CHECK-64-LABEL: test_stwcx:
; CHECK-64:       # %bb.0: # %entry
; CHECK-64-NEXT:    stwcx. 4, 0, 3
; CHECK-64-NEXT:    mfocrf 3, 128
; CHECK-64-NEXT:    srwi 3, 3, 28
; CHECK-64-NEXT:    extsw 3, 3
; CHECK-64-NEXT:    blr
;
; CHECK-32-LABEL: test_stwcx:
; CHECK-32:       # %bb.0: # %entry
; CHECK-32-NEXT:    stwcx. 4, 0, 3
; CHECK-32-NEXT:    mfocrf 3, 128
; CHECK-32-NEXT:    srwi 3, 3, 28
; CHECK-32-NEXT:    blr
entry:
  %0 = bitcast i32* %a to i8*
  %1 = tail call i32 @llvm.ppc.stwcx(i8* %0, i32 %b)
  ret i32 %1
}

declare i32 @llvm.ppc.sthcx(i8*, i32)
define dso_local signext i32 @test_sthcx(i16* %a, i16 signext %val) {
; CHECK-64-LABEL: test_sthcx:
; CHECK-64:       # %bb.0: # %entry
; CHECK-64-NEXT:    sthcx. 4, 0, 3
; CHECK-64-NEXT:    mfocrf 3, 128
; CHECK-64-NEXT:    srwi 3, 3, 28
; CHECK-64-NEXT:    extsw 3, 3
; CHECK-64-NEXT:    blr
;
; CHECK-32-LABEL: test_sthcx:
; CHECK-32:       # %bb.0: # %entry
; CHECK-32-NEXT:    sthcx. 4, 0, 3
; CHECK-32-NEXT:    mfocrf 3, 128
; CHECK-32-NEXT:    srwi 3, 3, 28
; CHECK-32-NEXT:    blr
entry:
  %0 = bitcast i16* %a to i8*
  %1 = sext i16 %val to i32
  %2 = tail call i32 @llvm.ppc.sthcx(i8* %0, i32 %1)
  ret i32 %2
}

declare i32 @llvm.ppc.stbcx(i8*, i32)
define signext i32 @test_stbcx(i8* %addr, i8 signext %val) {
; CHECK-64-LABEL: test_stbcx:
; CHECK-64:       # %bb.0: # %entry
; CHECK-64-NEXT:    stbcx. 4, 0, 3
; CHECK-64-NEXT:    mfocrf 3, 128
; CHECK-64-NEXT:    srwi 3, 3, 28
; CHECK-64-NEXT:    extsw 3, 3
; CHECK-64-NEXT:    blr
;
; CHECK-32-LABEL: test_stbcx:
; CHECK-32:       # %bb.0: # %entry
; CHECK-32-NEXT:    stbcx. 4, 0, 3
; CHECK-32-NEXT:    mfocrf 3, 128
; CHECK-32-NEXT:    srwi 3, 3, 28
; CHECK-32-NEXT:    blr
entry:
  %conv = sext i8 %val to i32
  %0 = tail call i32 @llvm.ppc.stbcx(i8* %addr, i32 %conv)
  ret i32 %0
}

define dso_local signext i16 @test_lharx(i16* %a) {
; CHECK-64-LABEL: test_lharx:
; CHECK-64:       # %bb.0: # %entry
; CHECK-64-NEXT:    #APP
; CHECK-64-NEXT:    lharx 3, 0, 3
; CHECK-64-NEXT:    #NO_APP
; CHECK-64-NEXT:    extsh 3, 3
; CHECK-64-NEXT:    blr
;
; CHECK-32-LABEL: test_lharx:
; CHECK-32:       # %bb.0: # %entry
; CHECK-32-NEXT:    #APP
; CHECK-32-NEXT:    lharx 3, 0, 3
; CHECK-32-NEXT:    #NO_APP
; CHECK-32-NEXT:    extsh 3, 3
; CHECK-32-NEXT:    blr
entry:
  %0 = tail call i16 asm sideeffect "lharx $0, ${1:y}", "=r,*Z,~{memory}"(i16* %a)
  ret i16 %0
}

; Function Attrs: nounwind uwtable
define dso_local zeroext i8 @test_lbarx(i8* %a) {
; CHECK-64-LABEL: test_lbarx:
; CHECK-64:       # %bb.0: # %entry
; CHECK-64-NEXT:    #APP
; CHECK-64-NEXT:    lbarx 3, 0, 3
; CHECK-64-NEXT:    #NO_APP
; CHECK-64-NEXT:    clrldi 3, 3, 56
; CHECK-64-NEXT:    blr
;
; CHECK-32-LABEL: test_lbarx:
; CHECK-32:       # %bb.0: # %entry
; CHECK-32-NEXT:    #APP
; CHECK-32-NEXT:    lbarx 3, 0, 3
; CHECK-32-NEXT:    #NO_APP
; CHECK-32-NEXT:    clrlwi 3, 3, 24
; CHECK-32-NEXT:    blr
entry:
  %0 = tail call i8 asm sideeffect "lbarx $0, ${1:y}", "=r,*Z,~{memory}"(i8* %a)
  ret i8 %0
}
