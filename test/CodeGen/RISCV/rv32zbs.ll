; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -verify-machineinstrs < %s \
; RUN:   | FileCheck %s -check-prefix=RV32I
; RUN: llc -mtriple=riscv32 -mattr=+experimental-zbs -verify-machineinstrs < %s \
; RUN:   | FileCheck %s -check-prefix=RV32ZBS

define i32 @sbclr_i32(i32 %a, i32 %b) nounwind {
; RV32I-LABEL: sbclr_i32:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi a2, zero, 1
; RV32I-NEXT:    sll a1, a2, a1
; RV32I-NEXT:    not a1, a1
; RV32I-NEXT:    and a0, a1, a0
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbclr_i32:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    bclr a0, a0, a1
; RV32ZBS-NEXT:    ret
  %and = and i32 %b, 31
  %shl = shl nuw i32 1, %and
  %neg = xor i32 %shl, -1
  %and1 = and i32 %neg, %a
  ret i32 %and1
}

define i32 @sbclr_i32_no_mask(i32 %a, i32 %b) nounwind {
; RV32I-LABEL: sbclr_i32_no_mask:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi a2, zero, 1
; RV32I-NEXT:    sll a1, a2, a1
; RV32I-NEXT:    not a1, a1
; RV32I-NEXT:    and a0, a1, a0
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbclr_i32_no_mask:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    bclr a0, a0, a1
; RV32ZBS-NEXT:    ret
  %shl = shl nuw i32 1, %b
  %neg = xor i32 %shl, -1
  %and1 = and i32 %neg, %a
  ret i32 %and1
}

define i64 @sbclr_i64(i64 %a, i64 %b) nounwind {
; RV32I-LABEL: sbclr_i64:
; RV32I:       # %bb.0:
; RV32I-NEXT:    andi a3, a2, 63
; RV32I-NEXT:    addi a4, a3, -32
; RV32I-NEXT:    addi a3, zero, 1
; RV32I-NEXT:    bltz a4, .LBB2_2
; RV32I-NEXT:  # %bb.1:
; RV32I-NEXT:    sll a2, a3, a4
; RV32I-NEXT:    not a2, a2
; RV32I-NEXT:    and a1, a1, a2
; RV32I-NEXT:    ret
; RV32I-NEXT:  .LBB2_2:
; RV32I-NEXT:    sll a2, a3, a2
; RV32I-NEXT:    not a2, a2
; RV32I-NEXT:    and a0, a0, a2
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbclr_i64:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    andi a3, a2, 63
; RV32ZBS-NEXT:    addi a3, a3, -32
; RV32ZBS-NEXT:    bltz a3, .LBB2_2
; RV32ZBS-NEXT:  # %bb.1:
; RV32ZBS-NEXT:    bclr a1, a1, a3
; RV32ZBS-NEXT:    ret
; RV32ZBS-NEXT:  .LBB2_2:
; RV32ZBS-NEXT:    bclr a0, a0, a2
; RV32ZBS-NEXT:    ret
  %and = and i64 %b, 63
  %shl = shl nuw i64 1, %and
  %neg = xor i64 %shl, -1
  %and1 = and i64 %neg, %a
  ret i64 %and1
}

define i32 @sbset_i32(i32 %a, i32 %b) nounwind {
; RV32I-LABEL: sbset_i32:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi a2, zero, 1
; RV32I-NEXT:    sll a1, a2, a1
; RV32I-NEXT:    or a0, a1, a0
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbset_i32:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    bset a0, a0, a1
; RV32ZBS-NEXT:    ret
  %and = and i32 %b, 31
  %shl = shl nuw i32 1, %and
  %or = or i32 %shl, %a
  ret i32 %or
}

define i32 @sbset_i32_no_mask(i32 %a, i32 %b) nounwind {
; RV32I-LABEL: sbset_i32_no_mask:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi a2, zero, 1
; RV32I-NEXT:    sll a1, a2, a1
; RV32I-NEXT:    or a0, a1, a0
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbset_i32_no_mask:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    bset a0, a0, a1
; RV32ZBS-NEXT:    ret
  %shl = shl nuw i32 1, %b
  %or = or i32 %shl, %a
  ret i32 %or
}

; We can use sbsetw for 1 << x by setting the first source to zero.
define signext i32 @sbset_i32_zero(i32 signext %a) nounwind {
; RV32I-LABEL: sbset_i32_zero:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi a1, zero, 1
; RV32I-NEXT:    sll a0, a1, a0
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbset_i32_zero:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    bset a0, zero, a0
; RV32ZBS-NEXT:    ret
  %shl = shl i32 1, %a
  ret i32 %shl
}

; As we are not matching directly i64 code patterns on RV32 some i64 patterns
; don't have yet any matching bit manipulation instructions on RV32.
; This test is presented here in case future expansions of the experimental-b
; extension introduce instructions suitable for this pattern.

define i64 @sbset_i64(i64 %a, i64 %b) nounwind {
; RV32I-LABEL: sbset_i64:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi a3, zero, 1
; RV32I-NEXT:    sll a2, a3, a2
; RV32I-NEXT:    srai a3, a2, 31
; RV32I-NEXT:    or a0, a2, a0
; RV32I-NEXT:    or a1, a3, a1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbset_i64:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    bset a3, zero, a2
; RV32ZBS-NEXT:    srai a3, a3, 31
; RV32ZBS-NEXT:    bset a0, a0, a2
; RV32ZBS-NEXT:    or a1, a3, a1
; RV32ZBS-NEXT:    ret
  %1 = trunc i64 %b to i32
  %conv = and i32 %1, 63
  %shl = shl nuw i32 1, %conv
  %conv1 = sext i32 %shl to i64
  %or = or i64 %conv1, %a
  ret i64 %or
}

define signext i64 @sbset_i64_zero(i64 signext %a) nounwind {
; RV32I-LABEL: sbset_i64_zero:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi a1, a0, -32
; RV32I-NEXT:    addi a2, zero, 1
; RV32I-NEXT:    bltz a1, .LBB7_2
; RV32I-NEXT:  # %bb.1:
; RV32I-NEXT:    mv a0, zero
; RV32I-NEXT:    sll a1, a2, a1
; RV32I-NEXT:    ret
; RV32I-NEXT:  .LBB7_2:
; RV32I-NEXT:    mv a1, zero
; RV32I-NEXT:    sll a0, a2, a0
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbset_i64_zero:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    addi a1, a0, -32
; RV32ZBS-NEXT:    bltz a1, .LBB7_2
; RV32ZBS-NEXT:  # %bb.1:
; RV32ZBS-NEXT:    mv a0, zero
; RV32ZBS-NEXT:    bset a1, zero, a1
; RV32ZBS-NEXT:    ret
; RV32ZBS-NEXT:  .LBB7_2:
; RV32ZBS-NEXT:    mv a1, zero
; RV32ZBS-NEXT:    bset a0, zero, a0
; RV32ZBS-NEXT:    ret
  %shl = shl i64 1, %a
  ret i64 %shl
}

define i32 @sbinv_i32(i32 %a, i32 %b) nounwind {
; RV32I-LABEL: sbinv_i32:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi a2, zero, 1
; RV32I-NEXT:    sll a1, a2, a1
; RV32I-NEXT:    xor a0, a1, a0
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbinv_i32:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    binv a0, a0, a1
; RV32ZBS-NEXT:    ret
  %and = and i32 %b, 31
  %shl = shl nuw i32 1, %and
  %xor = xor i32 %shl, %a
  ret i32 %xor
}

; As we are not matching directly i64 code patterns on RV32 some i64 patterns
; don't have yet any matching bit manipulation instructions on RV32.
; This test is presented here in case future expansions of the experimental-b
; extension introduce instructions suitable for this pattern.

define i64 @sbinv_i64(i64 %a, i64 %b) nounwind {
; RV32I-LABEL: sbinv_i64:
; RV32I:       # %bb.0:
; RV32I-NEXT:    addi a3, zero, 1
; RV32I-NEXT:    sll a2, a3, a2
; RV32I-NEXT:    srai a3, a2, 31
; RV32I-NEXT:    xor a0, a2, a0
; RV32I-NEXT:    xor a1, a3, a1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbinv_i64:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    bset a3, zero, a2
; RV32ZBS-NEXT:    srai a3, a3, 31
; RV32ZBS-NEXT:    binv a0, a0, a2
; RV32ZBS-NEXT:    xor a1, a3, a1
; RV32ZBS-NEXT:    ret
  %1 = trunc i64 %b to i32
  %conv = and i32 %1, 63
  %shl = shl nuw i32 1, %conv
  %conv1 = sext i32 %shl to i64
  %xor = xor i64 %conv1, %a
  ret i64 %xor
}

define i32 @sbext_i32(i32 %a, i32 %b) nounwind {
; RV32I-LABEL: sbext_i32:
; RV32I:       # %bb.0:
; RV32I-NEXT:    srl a0, a0, a1
; RV32I-NEXT:    andi a0, a0, 1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbext_i32:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    bext a0, a0, a1
; RV32ZBS-NEXT:    ret
  %and = and i32 %b, 31
  %shr = lshr i32 %a, %and
  %and1 = and i32 %shr, 1
  ret i32 %and1
}

define i32 @sbext_i32_no_mask(i32 %a, i32 %b) nounwind {
; RV32I-LABEL: sbext_i32_no_mask:
; RV32I:       # %bb.0:
; RV32I-NEXT:    srl a0, a0, a1
; RV32I-NEXT:    andi a0, a0, 1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbext_i32_no_mask:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    bext a0, a0, a1
; RV32ZBS-NEXT:    ret
  %shr = lshr i32 %a, %b
  %and1 = and i32 %shr, 1
  ret i32 %and1
}

; As we are not matching directly i64 code patterns on RV32 some i64 patterns
; don't have yet any matching bit manipulation instructions on RV32.
; This test is presented here in case future expansions of the experimental-b
; extension introduce instructions suitable for this pattern.

define i64 @sbext_i64(i64 %a, i64 %b) nounwind {
; RV32I-LABEL: sbext_i64:
; RV32I:       # %bb.0:
; RV32I-NEXT:    andi a3, a2, 63
; RV32I-NEXT:    addi a4, a3, -32
; RV32I-NEXT:    bltz a4, .LBB12_2
; RV32I-NEXT:  # %bb.1:
; RV32I-NEXT:    srl a0, a1, a4
; RV32I-NEXT:    j .LBB12_3
; RV32I-NEXT:  .LBB12_2:
; RV32I-NEXT:    srl a0, a0, a2
; RV32I-NEXT:    addi a2, zero, 31
; RV32I-NEXT:    sub a2, a2, a3
; RV32I-NEXT:    slli a1, a1, 1
; RV32I-NEXT:    sll a1, a1, a2
; RV32I-NEXT:    or a0, a0, a1
; RV32I-NEXT:  .LBB12_3:
; RV32I-NEXT:    andi a0, a0, 1
; RV32I-NEXT:    mv a1, zero
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbext_i64:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    andi a3, a2, 63
; RV32ZBS-NEXT:    addi a4, a3, -32
; RV32ZBS-NEXT:    bltz a4, .LBB12_2
; RV32ZBS-NEXT:  # %bb.1:
; RV32ZBS-NEXT:    srl a0, a1, a4
; RV32ZBS-NEXT:    j .LBB12_3
; RV32ZBS-NEXT:  .LBB12_2:
; RV32ZBS-NEXT:    srl a0, a0, a2
; RV32ZBS-NEXT:    addi a2, zero, 31
; RV32ZBS-NEXT:    sub a2, a2, a3
; RV32ZBS-NEXT:    slli a1, a1, 1
; RV32ZBS-NEXT:    sll a1, a1, a2
; RV32ZBS-NEXT:    or a0, a0, a1
; RV32ZBS-NEXT:  .LBB12_3:
; RV32ZBS-NEXT:    andi a0, a0, 1
; RV32ZBS-NEXT:    mv a1, zero
; RV32ZBS-NEXT:    ret
  %conv = and i64 %b, 63
  %shr = lshr i64 %a, %conv
  %and1 = and i64 %shr, 1
  ret i64 %and1
}

define i32 @sbexti_i32(i32 %a) nounwind {
; RV32I-LABEL: sbexti_i32:
; RV32I:       # %bb.0:
; RV32I-NEXT:    srli a0, a0, 5
; RV32I-NEXT:    andi a0, a0, 1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbexti_i32:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    bexti a0, a0, 5
; RV32ZBS-NEXT:    ret
  %shr = lshr i32 %a, 5
  %and = and i32 %shr, 1
  ret i32 %and
}

define i64 @sbexti_i64(i64 %a) nounwind {
; RV32I-LABEL: sbexti_i64:
; RV32I:       # %bb.0:
; RV32I-NEXT:    srli a0, a0, 5
; RV32I-NEXT:    andi a0, a0, 1
; RV32I-NEXT:    mv a1, zero
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbexti_i64:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    bexti a0, a0, 5
; RV32ZBS-NEXT:    mv a1, zero
; RV32ZBS-NEXT:    ret
  %shr = lshr i64 %a, 5
  %and = and i64 %shr, 1
  ret i64 %and
}

define i32 @sbclri_i32_10(i32 %a) nounwind {
; RV32I-LABEL: sbclri_i32_10:
; RV32I:       # %bb.0:
; RV32I-NEXT:    andi a0, a0, -1025
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbclri_i32_10:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    andi a0, a0, -1025
; RV32ZBS-NEXT:    ret
  %and = and i32 %a, -1025
  ret i32 %and
}

define i32 @sbclri_i32_11(i32 %a) nounwind {
; RV32I-LABEL: sbclri_i32_11:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a1, 1048575
; RV32I-NEXT:    addi a1, a1, 2047
; RV32I-NEXT:    and a0, a0, a1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbclri_i32_11:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    bclri a0, a0, 11
; RV32ZBS-NEXT:    ret
  %and = and i32 %a, -2049
  ret i32 %and
}

define i32 @sbclri_i32_30(i32 %a) nounwind {
; RV32I-LABEL: sbclri_i32_30:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a1, 786432
; RV32I-NEXT:    addi a1, a1, -1
; RV32I-NEXT:    and a0, a0, a1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbclri_i32_30:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    bclri a0, a0, 30
; RV32ZBS-NEXT:    ret
  %and = and i32 %a, -1073741825
  ret i32 %and
}

define i32 @sbclri_i32_31(i32 %a) nounwind {
; RV32I-LABEL: sbclri_i32_31:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a1, 524288
; RV32I-NEXT:    addi a1, a1, -1
; RV32I-NEXT:    and a0, a0, a1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbclri_i32_31:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    bclri a0, a0, 31
; RV32ZBS-NEXT:    ret
  %and = and i32 %a, -2147483649
  ret i32 %and
}

define i32 @sbclri_i32_large0(i32 %a) nounwind {
; RV32I-LABEL: sbclri_i32_large0:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a1, 1044480
; RV32I-NEXT:    addi a1, a1, -256
; RV32I-NEXT:    and a0, a0, a1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbclri_i32_large0:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    andi a0, a0, -256
; RV32ZBS-NEXT:    bclri a0, a0, 24
; RV32ZBS-NEXT:    ret
  %and = and i32 %a, -16777472
  ret i32 %and
}

define i32 @sbclri_i32_large1(i32 %a) nounwind {
; RV32I-LABEL: sbclri_i32_large1:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a1, 1044464
; RV32I-NEXT:    addi a1, a1, -1
; RV32I-NEXT:    and a0, a0, a1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbclri_i32_large1:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    bclri a0, a0, 16
; RV32ZBS-NEXT:    bclri a0, a0, 24
; RV32ZBS-NEXT:    ret
  %and = and i32 %a, -16842753
  ret i32 %and
}

define i32 @sbclri_i32_large2(i32 %0) {
; RV32I-LABEL: sbclri_i32_large2:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a1, 524288
; RV32I-NEXT:    addi a1, a1, -5
; RV32I-NEXT:    and a0, a0, a1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbclri_i32_large2:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    bclri a0, a0, 2
; RV32ZBS-NEXT:    bclri a0, a0, 31
; RV32ZBS-NEXT:    ret
  %2 = and i32 %0, 2147483643
  ret i32 %2
}

define i32 @sbclri_i32_large3(i32 %0) {
; RV32I-LABEL: sbclri_i32_large3:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a1, 524288
; RV32I-NEXT:    addi a1, a1, -6
; RV32I-NEXT:    and a0, a0, a1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbclri_i32_large3:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    andi a0, a0, -6
; RV32ZBS-NEXT:    bclri a0, a0, 31
; RV32ZBS-NEXT:    ret
  %2 = and i32 %0, 2147483642
  ret i32 %2
}

define i32 @sbseti_i32_10(i32 %a) nounwind {
; RV32I-LABEL: sbseti_i32_10:
; RV32I:       # %bb.0:
; RV32I-NEXT:    ori a0, a0, 1024
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbseti_i32_10:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    ori a0, a0, 1024
; RV32ZBS-NEXT:    ret
  %or = or i32 %a, 1024
  ret i32 %or
}

define i32 @sbseti_i32_11(i32 %a) nounwind {
; RV32I-LABEL: sbseti_i32_11:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a1, 1
; RV32I-NEXT:    addi a1, a1, -2048
; RV32I-NEXT:    or a0, a0, a1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbseti_i32_11:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    bseti a0, a0, 11
; RV32ZBS-NEXT:    ret
  %or = or i32 %a, 2048
  ret i32 %or
}

define i32 @sbseti_i32_30(i32 %a) nounwind {
; RV32I-LABEL: sbseti_i32_30:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a1, 262144
; RV32I-NEXT:    or a0, a0, a1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbseti_i32_30:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    bseti a0, a0, 30
; RV32ZBS-NEXT:    ret
  %or = or i32 %a, 1073741824
  ret i32 %or
}

define i32 @sbseti_i32_31(i32 %a) nounwind {
; RV32I-LABEL: sbseti_i32_31:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a1, 524288
; RV32I-NEXT:    or a0, a0, a1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbseti_i32_31:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    bseti a0, a0, 31
; RV32ZBS-NEXT:    ret
  %or = or i32 %a, 2147483648
  ret i32 %or
}

define i32 @sbinvi_i32_10(i32 %a) nounwind {
; RV32I-LABEL: sbinvi_i32_10:
; RV32I:       # %bb.0:
; RV32I-NEXT:    xori a0, a0, 1024
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbinvi_i32_10:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    xori a0, a0, 1024
; RV32ZBS-NEXT:    ret
  %xor = xor i32 %a, 1024
  ret i32 %xor
}

define i32 @sbinvi_i32_11(i32 %a) nounwind {
; RV32I-LABEL: sbinvi_i32_11:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a1, 1
; RV32I-NEXT:    addi a1, a1, -2048
; RV32I-NEXT:    xor a0, a0, a1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbinvi_i32_11:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    binvi a0, a0, 11
; RV32ZBS-NEXT:    ret
  %xor = xor i32 %a, 2048
  ret i32 %xor
}

define i32 @sbinvi_i32_30(i32 %a) nounwind {
; RV32I-LABEL: sbinvi_i32_30:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a1, 262144
; RV32I-NEXT:    xor a0, a0, a1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbinvi_i32_30:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    binvi a0, a0, 30
; RV32ZBS-NEXT:    ret
  %xor = xor i32 %a, 1073741824
  ret i32 %xor
}

define i32 @sbinvi_i32_31(i32 %a) nounwind {
; RV32I-LABEL: sbinvi_i32_31:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a1, 524288
; RV32I-NEXT:    xor a0, a0, a1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: sbinvi_i32_31:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    binvi a0, a0, 31
; RV32ZBS-NEXT:    ret
  %xor = xor i32 %a, 2147483648
  ret i32 %xor
}

define i32 @xor_i32_4098(i32 %a) nounwind {
; RV32I-LABEL: xor_i32_4098:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a1, 1
; RV32I-NEXT:    addi a1, a1, 2
; RV32I-NEXT:    xor a0, a0, a1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: xor_i32_4098:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    binvi a0, a0, 1
; RV32ZBS-NEXT:    binvi a0, a0, 12
; RV32ZBS-NEXT:    ret
  %xor = xor i32 %a, 4098
  ret i32 %xor
}

define i32 @xor_i32_4099(i32 %a) nounwind {
; RV32I-LABEL: xor_i32_4099:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a1, 1
; RV32I-NEXT:    addi a1, a1, 3
; RV32I-NEXT:    xor a0, a0, a1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: xor_i32_4099:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    xori a0, a0, 3
; RV32ZBS-NEXT:    binvi a0, a0, 12
; RV32ZBS-NEXT:    ret
  %xor = xor i32 %a, 4099
  ret i32 %xor
}

define i32 @xor_i32_96(i32 %a) nounwind {
; RV32I-LABEL: xor_i32_96:
; RV32I:       # %bb.0:
; RV32I-NEXT:    xori a0, a0, 96
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: xor_i32_96:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    xori a0, a0, 96
; RV32ZBS-NEXT:    ret
  %xor = xor i32 %a, 96
  ret i32 %xor
}

define i32 @xor_i32_66901(i32 %a) nounwind {
; RV32I-LABEL: xor_i32_66901:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a1, 16
; RV32I-NEXT:    addi a1, a1, 1365
; RV32I-NEXT:    xor a0, a0, a1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: xor_i32_66901:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    xori a0, a0, 1365
; RV32ZBS-NEXT:    binvi a0, a0, 16
; RV32ZBS-NEXT:    ret
  %xor = xor i32 %a, 66901
  ret i32 %xor
}

define i32 @or_i32_4098(i32 %a) nounwind {
; RV32I-LABEL: or_i32_4098:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a1, 1
; RV32I-NEXT:    addi a1, a1, 2
; RV32I-NEXT:    or a0, a0, a1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: or_i32_4098:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    bseti a0, a0, 1
; RV32ZBS-NEXT:    bseti a0, a0, 12
; RV32ZBS-NEXT:    ret
  %or = or i32 %a, 4098
  ret i32 %or
}

define i32 @or_i32_4099(i32 %a) nounwind {
; RV32I-LABEL: or_i32_4099:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a1, 1
; RV32I-NEXT:    addi a1, a1, 3
; RV32I-NEXT:    or a0, a0, a1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: or_i32_4099:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    ori a0, a0, 3
; RV32ZBS-NEXT:    bseti a0, a0, 12
; RV32ZBS-NEXT:    ret
  %or = or i32 %a, 4099
  ret i32 %or
}

define i32 @or_i32_96(i32 %a) nounwind {
; RV32I-LABEL: or_i32_96:
; RV32I:       # %bb.0:
; RV32I-NEXT:    ori a0, a0, 96
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: or_i32_96:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    ori a0, a0, 96
; RV32ZBS-NEXT:    ret
  %or = or i32 %a, 96
  ret i32 %or
}

define i32 @or_i32_66901(i32 %a) nounwind {
; RV32I-LABEL: or_i32_66901:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a1, 16
; RV32I-NEXT:    addi a1, a1, 1365
; RV32I-NEXT:    or a0, a0, a1
; RV32I-NEXT:    ret
;
; RV32ZBS-LABEL: or_i32_66901:
; RV32ZBS:       # %bb.0:
; RV32ZBS-NEXT:    ori a0, a0, 1365
; RV32ZBS-NEXT:    bseti a0, a0, 16
; RV32ZBS-NEXT:    ret
  %or = or i32 %a, 66901
  ret i32 %or
}
