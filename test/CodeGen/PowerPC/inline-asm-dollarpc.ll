; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mcpu=pwr7 -verify-machineinstrs \
; RUN:     -mtriple=powerpc-unknown-aix < %s  | FileCheck %s --check-prefix=IAS32

; RUN: llc -mcpu=pwr7 -verify-machineinstrs \
; RUN:     -mtriple=powerpc64-unknown-aix < %s | FileCheck %s --check-prefix=IAS64

; RUN: llc -mcpu=pwr7 -verify-machineinstrs -no-integrated-as \
; RUN:     -mtriple=powerpc64-unknown-aix < %s | FileCheck %s --check-prefix=NOIAS

define dso_local i32 @dollarpc() #0 {
; IAS32-LABEL: dollarpc:
; IAS32:       # %bb.0: # %entry
; IAS32-NEXT:    li 3, 0
; IAS32-NEXT:    stw 3, -4(1)
; IAS32-NEXT:    #APP
; IAS32-NEXT:    mfspr 5, 269
; IAS32-NEXT:    mfspr 3, 268
; IAS32-NEXT:    mfspr 4, 269
; IAS32-NEXT:    cmpw 5, 4
; IAS32-NEXT:  L..tmp0:
; IAS32-NEXT:    bne 0, L..tmp0-16
; IAS32-EMPTY:
; IAS32-NEXT:    #NO_APP
; IAS32-NEXT:    stw 3, -12(1)
; IAS32-NEXT:    stw 4, -8(1)
; IAS32-NEXT:    stw 5, -16(1)
; IAS32-NEXT:    blr
;
; IAS64-LABEL: dollarpc:
; IAS64:       # %bb.0: # %entry
; IAS64-NEXT:    li 3, 0
; IAS64-NEXT:    stw 3, -4(1)
; IAS64-NEXT:    #APP
; IAS64-NEXT:    mfspr 4, 269
; IAS64-NEXT:    mfspr 3, 268
; IAS64-NEXT:    mfspr 5, 269
; IAS64-NEXT:    cmpw 4, 5
; IAS64-NEXT:  L..tmp0:
; IAS64-NEXT:    bne 0, L..tmp0-16
; IAS64-EMPTY:
; IAS64-NEXT:    #NO_APP
; IAS64-NEXT:    stw 3, -12(1)
; IAS64-NEXT:    rldimi 3, 5, 32, 0
; IAS64-NEXT:    stw 5, -8(1)
; IAS64-NEXT:    stw 4, -16(1)
; IAS64-NEXT:    blr
;
; NOIAS-LABEL: dollarpc:
; NOIAS:       # %bb.0: # %entry
; NOIAS-NEXT:    li 3, 0
; NOIAS-NEXT:    stw 3, -4(1)
; NOIAS-NEXT:    #APP
; NOIAS-NEXT:    mftbu 4
; NOIAS-NEXT:  mftb 3
; NOIAS-NEXT:  mftbu 5
; NOIAS-NEXT:  cmpw 4,5
; NOIAS-NEXT:  bne $-0x10
; NOIAS-EMPTY:
; NOIAS-NEXT:    #NO_APP
; NOIAS-NEXT:    stw 3, -12(1)
; NOIAS-NEXT:    rldimi 3, 5, 32, 0
; NOIAS-NEXT:    stw 5, -8(1)
; NOIAS-NEXT:    stw 4, -16(1)
; NOIAS-NEXT:    blr
entry:
  %retval = alloca i32, align 4
  %tbu = alloca i32, align 4
  %tbl = alloca i32, align 4
  %temp = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %0 = call { i32, i32, i32 } asm sideeffect "mftbu  $2\0Amftb   $0\0Amftbu  $1\0Acmpw   $2,$1\0Abne    $$-0x10\0A", "=r,=r,=r,~{cc}"()
  %asmresult = extractvalue { i32, i32, i32 } %0, 0
  %asmresult1 = extractvalue { i32, i32, i32 } %0, 1
  %asmresult2 = extractvalue { i32, i32, i32 } %0, 2
  store i32 %asmresult, i32* %tbl, align 4
  store i32 %asmresult1, i32* %tbu, align 4
  store i32 %asmresult2, i32* %temp, align 4
  %1 = load i32, i32* %tbu, align 4
  %conv = zext i32 %1 to i64
  %shl = shl i64 %conv, 32
  %2 = load i32, i32* %tbl, align 4
  %conv3 = zext i32 %2 to i64
  %or = or i64 %shl, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

