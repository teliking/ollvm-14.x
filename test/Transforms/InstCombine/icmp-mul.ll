; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -instcombine -S | FileCheck %s

declare void @use(i8)

; Tests for slt/ult

define i1 @slt_positive_multip_rem_zero(i8 %x) {
; CHECK-LABEL: @slt_positive_multip_rem_zero(
; CHECK-NEXT:    [[A:%.*]] = mul nsw i8 [[X:%.*]], 7
; CHECK-NEXT:    [[B:%.*]] = icmp slt i8 [[A]], 21
; CHECK-NEXT:    ret i1 [[B]]
;
  %a = mul nsw i8 %x, 7
  %b = icmp slt i8 %a, 21
  ret i1 %b
}

define i1 @slt_negative_multip_rem_zero(i8 %x) {
; CHECK-LABEL: @slt_negative_multip_rem_zero(
; CHECK-NEXT:    [[A:%.*]] = mul nsw i8 [[X:%.*]], -7
; CHECK-NEXT:    [[B:%.*]] = icmp slt i8 [[A]], 21
; CHECK-NEXT:    ret i1 [[B]]
;
  %a = mul nsw i8 %x, -7
  %b = icmp slt i8 %a, 21
  ret i1 %b
}

define i1 @slt_positive_multip_rem_nz(i8 %x) {
; CHECK-LABEL: @slt_positive_multip_rem_nz(
; CHECK-NEXT:    [[A:%.*]] = mul nsw i8 [[X:%.*]], 5
; CHECK-NEXT:    [[B:%.*]] = icmp slt i8 [[A]], 21
; CHECK-NEXT:    ret i1 [[B]]
;
  %a = mul nsw i8 %x, 5
  %b = icmp slt i8 %a, 21
  ret i1 %b
}

define i1 @ult_rem_zero(i8 %x) {
; CHECK-LABEL: @ult_rem_zero(
; CHECK-NEXT:    [[A:%.*]] = mul nuw i8 [[X:%.*]], 7
; CHECK-NEXT:    [[B:%.*]] = icmp ult i8 [[A]], 21
; CHECK-NEXT:    ret i1 [[B]]
;
  %a = mul nuw i8 %x, 7
  %b = icmp ult i8 %a, 21
  ret i1 %b
}

define i1 @ult_rem_nz(i8 %x) {
; CHECK-LABEL: @ult_rem_nz(
; CHECK-NEXT:    [[A:%.*]] = mul nuw i8 [[X:%.*]], 5
; CHECK-NEXT:    [[B:%.*]] = icmp ult i8 [[A]], 21
; CHECK-NEXT:    ret i1 [[B]]
;
  %a = mul nuw i8 %x, 5
  %b = icmp ult i8 %a, 21
  ret i1 %b
}

; Tests for sgt/ugt

define i1 @sgt_positive_multip_rem_zero(i8 %x) {
; CHECK-LABEL: @sgt_positive_multip_rem_zero(
; CHECK-NEXT:    [[A:%.*]] = mul nsw i8 [[X:%.*]], 7
; CHECK-NEXT:    [[B:%.*]] = icmp sgt i8 [[A]], 21
; CHECK-NEXT:    ret i1 [[B]]
;
  %a = mul nsw i8 %x, 7
  %b = icmp sgt i8 %a, 21
  ret i1 %b
}

define i1 @sgt_negative_multip_rem_zero(i8 %x) {
; CHECK-LABEL: @sgt_negative_multip_rem_zero(
; CHECK-NEXT:    [[A:%.*]] = mul nsw i8 [[X:%.*]], -7
; CHECK-NEXT:    [[B:%.*]] = icmp sgt i8 [[A]], 21
; CHECK-NEXT:    ret i1 [[B]]
;
  %a = mul nsw i8 %x, -7
  %b = icmp sgt i8 %a, 21
  ret i1 %b
}

define i1 @sgt_positive_multip_rem_nz(i8 %x) {
; CHECK-LABEL: @sgt_positive_multip_rem_nz(
; CHECK-NEXT:    [[A:%.*]] = mul nsw i8 [[X:%.*]], 5
; CHECK-NEXT:    [[B:%.*]] = icmp sgt i8 [[A]], 21
; CHECK-NEXT:    ret i1 [[B]]
;
  %a = mul nsw i8 %x, 5
  %b = icmp sgt i8 %a, 21
  ret i1 %b
}

define i1 @ugt_rem_zero(i8 %x) {
; CHECK-LABEL: @ugt_rem_zero(
; CHECK-NEXT:    [[A:%.*]] = mul nuw i8 [[X:%.*]], 7
; CHECK-NEXT:    [[B:%.*]] = icmp ugt i8 [[A]], 21
; CHECK-NEXT:    ret i1 [[B]]
;
  %a = mul nuw i8 %x, 7
  %b = icmp ugt i8 %a, 21
  ret i1 %b
}

define i1 @ugt_rem_nz(i8 %x) {
; CHECK-LABEL: @ugt_rem_nz(
; CHECK-NEXT:    [[A:%.*]] = mul nuw i8 [[X:%.*]], 5
; CHECK-NEXT:    [[B:%.*]] = icmp ugt i8 [[A]], 21
; CHECK-NEXT:    ret i1 [[B]]
;
  %a = mul nuw i8 %x, 5
  %b = icmp ugt i8 %a, 21
  ret i1 %b
}

; Tests for eq/ne

define i1 @eq_nsw_rem_zero(i8 %x) {
; CHECK-LABEL: @eq_nsw_rem_zero(
; CHECK-NEXT:    [[B:%.*]] = icmp eq i8 [[X:%.*]], -4
; CHECK-NEXT:    ret i1 [[B]]
;
  %a = mul nsw i8 %x, -5
  %b = icmp eq i8 %a, 20
  ret i1 %b
}

define <2 x i1> @ne_nsw_rem_zero(<2 x i8> %x) {
; CHECK-LABEL: @ne_nsw_rem_zero(
; CHECK-NEXT:    [[B:%.*]] = icmp ne <2 x i8> [[X:%.*]], <i8 -6, i8 -6>
; CHECK-NEXT:    ret <2 x i1> [[B]]
;
  %a = mul nsw <2 x i8> %x, <i8 5, i8 5>
  %b = icmp ne <2 x i8> %a, <i8 -30, i8 -30>
  ret <2 x i1> %b
}

; TODO: Missed fold with undef.

define <2 x i1> @ne_nsw_rem_zero_undef1(<2 x i8> %x) {
; CHECK-LABEL: @ne_nsw_rem_zero_undef1(
; CHECK-NEXT:    [[A:%.*]] = mul nsw <2 x i8> [[X:%.*]], <i8 5, i8 undef>
; CHECK-NEXT:    [[B:%.*]] = icmp ne <2 x i8> [[A]], <i8 -30, i8 -30>
; CHECK-NEXT:    ret <2 x i1> [[B]]
;
  %a = mul nsw <2 x i8> %x, <i8 5, i8 undef>
  %b = icmp ne <2 x i8> %a, <i8 -30, i8 -30>
  ret <2 x i1> %b
}

; TODO: Missed fold with undef.

define <2 x i1> @ne_nsw_rem_zero_undef2(<2 x i8> %x) {
; CHECK-LABEL: @ne_nsw_rem_zero_undef2(
; CHECK-NEXT:    [[A:%.*]] = mul nsw <2 x i8> [[X:%.*]], <i8 5, i8 5>
; CHECK-NEXT:    [[B:%.*]] = icmp ne <2 x i8> [[A]], <i8 -30, i8 undef>
; CHECK-NEXT:    ret <2 x i1> [[B]]
;
  %a = mul nsw <2 x i8> %x, <i8 5, i8 5>
  %b = icmp ne <2 x i8> %a, <i8 -30, i8 undef>
  ret <2 x i1> %b
}

define i1 @eq_nsw_rem_zero_uses(i8 %x) {
; CHECK-LABEL: @eq_nsw_rem_zero_uses(
; CHECK-NEXT:    [[A:%.*]] = mul nsw i8 [[X:%.*]], -5
; CHECK-NEXT:    call void @use(i8 [[A]])
; CHECK-NEXT:    [[B:%.*]] = icmp eq i8 [[X]], -4
; CHECK-NEXT:    ret i1 [[B]]
;
  %a = mul nsw i8 %x, -5
  call void @use(i8 %a)
  %b = icmp eq i8 %a, 20
  ret i1 %b
}

; Impossible multiple should be handled by instsimplify.

define i1 @eq_nsw_rem_nz(i8 %x) {
; CHECK-LABEL: @eq_nsw_rem_nz(
; CHECK-NEXT:    ret i1 false
;
  %a = mul nsw i8 %x, 5
  %b = icmp eq i8 %a, 245
  ret i1 %b
}

; Impossible multiple should be handled by instsimplify.

define i1 @ne_nsw_rem_nz(i8 %x) {
; CHECK-LABEL: @ne_nsw_rem_nz(
; CHECK-NEXT:    ret i1 true
;
  %a = mul nsw i8 %x, 5
  %b = icmp ne i8 %a, 130
  ret i1 %b
}

define <2 x i1> @eq_nuw_rem_zero(<2 x i8> %x) {
; CHECK-LABEL: @eq_nuw_rem_zero(
; CHECK-NEXT:    [[B:%.*]] = icmp eq <2 x i8> [[X:%.*]], <i8 4, i8 4>
; CHECK-NEXT:    ret <2 x i1> [[B]]
;
  %a = mul nuw <2 x i8> %x, <i8 5, i8 5>
  %b = icmp eq <2 x i8> %a, <i8 20, i8 20>
  ret <2 x i1> %b
}

; TODO: Missed fold with undef.

define <2 x i1> @eq_nuw_rem_zero_undef1(<2 x i8> %x) {
; CHECK-LABEL: @eq_nuw_rem_zero_undef1(
; CHECK-NEXT:    [[A:%.*]] = mul nuw <2 x i8> [[X:%.*]], <i8 undef, i8 5>
; CHECK-NEXT:    [[B:%.*]] = icmp eq <2 x i8> [[A]], <i8 20, i8 20>
; CHECK-NEXT:    ret <2 x i1> [[B]]
;
  %a = mul nuw <2 x i8> %x, <i8 undef, i8 5>
  %b = icmp eq <2 x i8> %a, <i8 20, i8 20>
  ret <2 x i1> %b
}

; TODO: Missed fold with undef.

define <2 x i1> @eq_nuw_rem_zero_undef2(<2 x i8> %x) {
; CHECK-LABEL: @eq_nuw_rem_zero_undef2(
; CHECK-NEXT:    [[A:%.*]] = mul nuw <2 x i8> [[X:%.*]], <i8 5, i8 5>
; CHECK-NEXT:    [[B:%.*]] = icmp eq <2 x i8> [[A]], <i8 undef, i8 20>
; CHECK-NEXT:    ret <2 x i1> [[B]]
;
  %a = mul nuw <2 x i8> %x, <i8 5, i8 5>
  %b = icmp eq <2 x i8> %a, <i8 undef, i8 20>
  ret <2 x i1> %b
}

define i1 @ne_nuw_rem_zero(i8 %x) {
; CHECK-LABEL: @ne_nuw_rem_zero(
; CHECK-NEXT:    [[B:%.*]] = icmp ne i8 [[X:%.*]], 26
; CHECK-NEXT:    ret i1 [[B]]
;
  %a = mul nuw i8 %x, 5
  %b = icmp ne i8 %a, 130
  ret i1 %b
}

define i1 @ne_nuw_rem_zero_uses(i8 %x) {
; CHECK-LABEL: @ne_nuw_rem_zero_uses(
; CHECK-NEXT:    [[A:%.*]] = mul nuw i8 [[X:%.*]], 5
; CHECK-NEXT:    call void @use(i8 [[A]])
; CHECK-NEXT:    [[B:%.*]] = icmp ne i8 [[X]], 26
; CHECK-NEXT:    ret i1 [[B]]
;
  %a = mul nuw i8 %x, 5
  call void @use(i8 %a)
  %b = icmp ne i8 %a, 130
  ret i1 %b
}

; Impossible multiple should be handled by instsimplify.

define i1 @eq_nuw_rem_nz(i8 %x) {
; CHECK-LABEL: @eq_nuw_rem_nz(
; CHECK-NEXT:    ret i1 false
;
  %a = mul nuw i8 %x, -5
  %b = icmp eq i8 %a, 20
  ret i1 %b
}

; Impossible multiple should be handled by instsimplify.

define i1 @ne_nuw_rem_nz(i8 %x) {
; CHECK-LABEL: @ne_nuw_rem_nz(
; CHECK-NEXT:    ret i1 true
;
  %a = mul nuw i8 %x, 5
  %b = icmp ne i8 %a, -30
  ret i1 %b
}

; Negative tests for the icmp mul folds

define i1 @sgt_positive_multip_rem_zero_nonsw(i8 %x) {
; CHECK-LABEL: @sgt_positive_multip_rem_zero_nonsw(
; CHECK-NEXT:    [[A:%.*]] = mul i8 [[X:%.*]], 7
; CHECK-NEXT:    [[B:%.*]] = icmp sgt i8 [[A]], 21
; CHECK-NEXT:    ret i1 [[B]]
;
  %a = mul i8 %x, 7
  %b = icmp sgt i8 %a, 21
  ret i1 %b
}

define i1 @ult_multip_rem_zero_nonsw(i8 %x) {
; CHECK-LABEL: @ult_multip_rem_zero_nonsw(
; CHECK-NEXT:    [[A:%.*]] = mul i8 [[X:%.*]], 7
; CHECK-NEXT:    [[B:%.*]] = icmp ult i8 [[A]], 21
; CHECK-NEXT:    ret i1 [[B]]
;
  %a = mul i8 %x, 7
  %b = icmp ult i8 %a, 21
  ret i1 %b
}

define i1 @ugt_rem_zero_nonuw(i8 %x) {
; CHECK-LABEL: @ugt_rem_zero_nonuw(
; CHECK-NEXT:    [[A:%.*]] = mul i8 [[X:%.*]], 7
; CHECK-NEXT:    [[B:%.*]] = icmp ugt i8 [[A]], 21
; CHECK-NEXT:    ret i1 [[B]]
;
  %a = mul i8 %x, 7
  %b = icmp ugt i8 %a, 21
  ret i1 %b
}

define i1 @sgt_minnum(i8 %x) {
; CHECK-LABEL: @sgt_minnum(
; CHECK-NEXT:    ret i1 true
;
  %a = mul nsw i8 %x, 7
  %b = icmp sgt i8 %a, -128
  ret i1 %b
}

define i1 @ule_bignum(i8 %x) {
; CHECK-LABEL: @ule_bignum(
; CHECK-NEXT:    [[B:%.*]] = icmp eq i8 [[X:%.*]], 0
; CHECK-NEXT:    ret i1 [[B]]
;
  %a = mul i8 %x, 2147483647
  %b = icmp ule i8 %a, 0
  ret i1 %b
}

define i1 @sgt_mulzero(i8 %x) {
; CHECK-LABEL: @sgt_mulzero(
; CHECK-NEXT:    ret i1 false
;
  %a = mul nsw i8 %x, 0
  %b = icmp sgt i8 %a, 21
  ret i1 %b
}

define i1 @eq_rem_zero_nonuw(i8 %x) {
; CHECK-LABEL: @eq_rem_zero_nonuw(
; CHECK-NEXT:    [[A:%.*]] = mul i8 [[X:%.*]], 5
; CHECK-NEXT:    [[B:%.*]] = icmp eq i8 [[A]], 20
; CHECK-NEXT:    ret i1 [[B]]
;
  %a = mul i8 %x, 5
  %b = icmp eq i8 %a, 20
  ret i1 %b
}

define i1 @ne_rem_zero_nonuw(i8 %x) {
; CHECK-LABEL: @ne_rem_zero_nonuw(
; CHECK-NEXT:    [[A:%.*]] = mul i8 [[X:%.*]], 5
; CHECK-NEXT:    [[B:%.*]] = icmp ne i8 [[A]], 30
; CHECK-NEXT:    ret i1 [[B]]
;
  %a = mul i8 %x, 5
  %b = icmp ne i8 %a, 30
  ret i1 %b
}

define i1 @mul_constant_eq(i32 %x, i32 %y) {
; CHECK-LABEL: @mul_constant_eq(
; CHECK-NEXT:    [[C:%.*]] = icmp eq i32 [[X:%.*]], [[Y:%.*]]
; CHECK-NEXT:    ret i1 [[C]]
;
  %A = mul i32 %x, 5
  %B = mul i32 %y, 5
  %C = icmp eq i32 %A, %B
  ret i1 %C
}

define <2 x i1> @mul_constant_ne_splat(<2 x i32> %x, <2 x i32> %y) {
; CHECK-LABEL: @mul_constant_ne_splat(
; CHECK-NEXT:    [[C:%.*]] = icmp ne <2 x i32> [[X:%.*]], [[Y:%.*]]
; CHECK-NEXT:    ret <2 x i1> [[C]]
;
  %A = mul <2 x i32> %x, <i32 5, i32 5>
  %B = mul <2 x i32> %y, <i32 5, i32 5>
  %C = icmp ne <2 x i32> %A, %B
  ret <2 x i1> %C
}

define i1 @mul_constant_ne_extra_use1(i8 %x, i8 %y) {
; CHECK-LABEL: @mul_constant_ne_extra_use1(
; CHECK-NEXT:    [[A:%.*]] = mul i8 [[X:%.*]], 5
; CHECK-NEXT:    call void @use(i8 [[A]])
; CHECK-NEXT:    [[C:%.*]] = icmp ne i8 [[X]], [[Y:%.*]]
; CHECK-NEXT:    ret i1 [[C]]
;
  %A = mul i8 %x, 5
  call void @use(i8 %A)
  %B = mul i8 %y, 5
  %C = icmp ne i8 %A, %B
  ret i1 %C
}

define i1 @mul_constant_eq_extra_use2(i8 %x, i8 %y) {
; CHECK-LABEL: @mul_constant_eq_extra_use2(
; CHECK-NEXT:    [[B:%.*]] = mul i8 [[Y:%.*]], 5
; CHECK-NEXT:    call void @use(i8 [[B]])
; CHECK-NEXT:    [[C:%.*]] = icmp eq i8 [[X:%.*]], [[Y]]
; CHECK-NEXT:    ret i1 [[C]]
;
  %A = mul i8 %x, 5
  %B = mul i8 %y, 5
  call void @use(i8 %B)
  %C = icmp eq i8 %A, %B
  ret i1 %C
}

define i1 @mul_constant_ne_extra_use3(i8 %x, i8 %y) {
; CHECK-LABEL: @mul_constant_ne_extra_use3(
; CHECK-NEXT:    [[A:%.*]] = mul i8 [[X:%.*]], 5
; CHECK-NEXT:    call void @use(i8 [[A]])
; CHECK-NEXT:    [[B:%.*]] = mul i8 [[Y:%.*]], 5
; CHECK-NEXT:    call void @use(i8 [[B]])
; CHECK-NEXT:    [[C:%.*]] = icmp ne i8 [[X]], [[Y]]
; CHECK-NEXT:    ret i1 [[C]]
;
  %A = mul i8 %x, 5
  call void @use(i8 %A)
  %B = mul i8 %y, 5
  call void @use(i8 %B)
  %C = icmp ne i8 %A, %B
  ret i1 %C
}

define i1 @mul_constant_eq_nsw(i32 %x, i32 %y) {
; CHECK-LABEL: @mul_constant_eq_nsw(
; CHECK-NEXT:    [[C:%.*]] = icmp eq i32 [[X:%.*]], [[Y:%.*]]
; CHECK-NEXT:    ret i1 [[C]]
;
  %A = mul nsw i32 %x, 6
  %B = mul nsw i32 %y, 6
  %C = icmp eq i32 %A, %B
  ret i1 %C
}

define <2 x i1> @mul_constant_ne_nsw_splat(<2 x i32> %x, <2 x i32> %y) {
; CHECK-LABEL: @mul_constant_ne_nsw_splat(
; CHECK-NEXT:    [[C:%.*]] = icmp ne <2 x i32> [[X:%.*]], [[Y:%.*]]
; CHECK-NEXT:    ret <2 x i1> [[C]]
;
  %A = mul nsw <2 x i32> %x, <i32 12, i32 12>
  %B = mul nsw <2 x i32> %y, <i32 12, i32 12>
  %C = icmp ne <2 x i32> %A, %B
  ret <2 x i1> %C
}

define i1 @mul_constant_ne_nsw_extra_use1(i8 %x, i8 %y) {
; CHECK-LABEL: @mul_constant_ne_nsw_extra_use1(
; CHECK-NEXT:    [[A:%.*]] = mul nsw i8 [[X:%.*]], 74
; CHECK-NEXT:    call void @use(i8 [[A]])
; CHECK-NEXT:    [[C:%.*]] = icmp ne i8 [[X]], [[Y:%.*]]
; CHECK-NEXT:    ret i1 [[C]]
;
  %A = mul nsw i8 %x, 74
  call void @use(i8 %A)
  %B = mul nsw i8 %y, 74
  %C = icmp ne i8 %A, %B
  ret i1 %C
}

define i1 @mul_constant_eq_nsw_extra_use2(i8 %x, i8 %y) {
; CHECK-LABEL: @mul_constant_eq_nsw_extra_use2(
; CHECK-NEXT:    [[B:%.*]] = mul nsw i8 [[Y:%.*]], 20
; CHECK-NEXT:    call void @use(i8 [[B]])
; CHECK-NEXT:    [[C:%.*]] = icmp eq i8 [[X:%.*]], [[Y]]
; CHECK-NEXT:    ret i1 [[C]]
;
  %A = mul nsw i8 %x, 20
  %B = mul nsw i8 %y, 20
  call void @use(i8 %B)
  %C = icmp eq i8 %A, %B
  ret i1 %C
}

define i1 @mul_constant_ne_nsw_extra_use3(i8 %x, i8 %y) {
; CHECK-LABEL: @mul_constant_ne_nsw_extra_use3(
; CHECK-NEXT:    [[A:%.*]] = mul nsw i8 [[X:%.*]], 24
; CHECK-NEXT:    call void @use(i8 [[A]])
; CHECK-NEXT:    [[B:%.*]] = mul nsw i8 [[Y:%.*]], 24
; CHECK-NEXT:    call void @use(i8 [[B]])
; CHECK-NEXT:    [[C:%.*]] = icmp ne i8 [[X]], [[Y]]
; CHECK-NEXT:    ret i1 [[C]]
;
  %A = mul nsw i8 %x, 24
  call void @use(i8 %A)
  %B = mul nsw i8 %y, 24
  call void @use(i8 %B)
  %C = icmp ne i8 %A, %B
  ret i1 %C
}

define i1 @mul_constant_nuw_eq(i32 %x, i32 %y) {
; CHECK-LABEL: @mul_constant_nuw_eq(
; CHECK-NEXT:    [[C:%.*]] = icmp eq i32 [[X:%.*]], [[Y:%.*]]
; CHECK-NEXT:    ret i1 [[C]]
;
  %A = mul nuw i32 %x, 22
  %B = mul nuw i32 %y, 22
  %C = icmp eq i32 %A, %B
  ret i1 %C
}

define <2 x i1> @mul_constant_ne_nuw_splat(<2 x i32> %x, <2 x i32> %y) {
; CHECK-LABEL: @mul_constant_ne_nuw_splat(
; CHECK-NEXT:    [[C:%.*]] = icmp ne <2 x i32> [[X:%.*]], [[Y:%.*]]
; CHECK-NEXT:    ret <2 x i1> [[C]]
;
  %A = mul nuw <2 x i32> %x, <i32 10, i32 10>
  %B = mul nuw <2 x i32> %y, <i32 10, i32 10>
  %C = icmp ne <2 x i32> %A, %B
  ret <2 x i1> %C
}

define i1 @mul_constant_ne_nuw_extra_use1(i8 %x, i8 %y) {
; CHECK-LABEL: @mul_constant_ne_nuw_extra_use1(
; CHECK-NEXT:    [[A:%.*]] = mul nuw i8 [[X:%.*]], 6
; CHECK-NEXT:    call void @use(i8 [[A]])
; CHECK-NEXT:    [[C:%.*]] = icmp ne i8 [[X]], [[Y:%.*]]
; CHECK-NEXT:    ret i1 [[C]]
;
  %A = mul nuw i8 %x, 6
  call void @use(i8 %A)
  %B = mul nuw i8 %y, 6
  %C = icmp ne i8 %A, %B
  ret i1 %C
}

define i1 @mul_constant_eq_nuw_extra_use2(i8 %x, i8 %y) {
; CHECK-LABEL: @mul_constant_eq_nuw_extra_use2(
; CHECK-NEXT:    [[B:%.*]] = mul nuw i8 [[Y:%.*]], 36
; CHECK-NEXT:    call void @use(i8 [[B]])
; CHECK-NEXT:    [[C:%.*]] = icmp eq i8 [[X:%.*]], [[Y]]
; CHECK-NEXT:    ret i1 [[C]]
;
  %A = mul nuw i8 %x, 36
  %B = mul nuw i8 %y, 36
  call void @use(i8 %B)
  %C = icmp eq i8 %A, %B
  ret i1 %C
}

define i1 @mul_constant_ne_nuw_extra_use3(i8 %x, i8 %y) {
; CHECK-LABEL: @mul_constant_ne_nuw_extra_use3(
; CHECK-NEXT:    [[A:%.*]] = mul nuw i8 [[X:%.*]], 38
; CHECK-NEXT:    call void @use(i8 [[A]])
; CHECK-NEXT:    [[B:%.*]] = mul nuw i8 [[Y:%.*]], 38
; CHECK-NEXT:    call void @use(i8 [[B]])
; CHECK-NEXT:    [[C:%.*]] = icmp ne i8 [[X]], [[Y]]
; CHECK-NEXT:    ret i1 [[C]]
;
  %A = mul nuw i8 %x, 38
  call void @use(i8 %A)
  %B = mul nuw i8 %y, 38
  call void @use(i8 %B)
  %C = icmp ne i8 %A, %B
  ret i1 %C
}

; Negative test - wrong pred

define i1 @mul_constant_ult(i32 %x, i32 %y) {
; CHECK-LABEL: @mul_constant_ult(
; CHECK-NEXT:    [[A:%.*]] = mul i32 [[X:%.*]], 47
; CHECK-NEXT:    [[B:%.*]] = mul i32 [[Y:%.*]], 47
; CHECK-NEXT:    [[C:%.*]] = icmp ult i32 [[A]], [[B]]
; CHECK-NEXT:    ret i1 [[C]]
;
  %A = mul i32 %x, 47
  %B = mul i32 %y, 47
  %C = icmp ult i32 %A, %B
  ret i1 %C
}

; Negative test - wrong pred

define i1 @mul_constant_nuw_sgt(i32 %x, i32 %y) {
; CHECK-LABEL: @mul_constant_nuw_sgt(
; CHECK-NEXT:    [[A:%.*]] = mul nuw i32 [[X:%.*]], 46
; CHECK-NEXT:    [[B:%.*]] = mul nuw i32 [[Y:%.*]], 46
; CHECK-NEXT:    [[C:%.*]] = icmp sgt i32 [[A]], [[B]]
; CHECK-NEXT:    ret i1 [[C]]
;
  %A = mul nuw i32 %x, 46
  %B = mul nuw i32 %y, 46
  %C = icmp sgt i32 %A, %B
  ret i1 %C
}

; Negative test - wrong constants

define i1 @mul_mismatch_constant_nuw_eq(i32 %x, i32 %y) {
; CHECK-LABEL: @mul_mismatch_constant_nuw_eq(
; CHECK-NEXT:    [[A:%.*]] = mul nuw i32 [[X:%.*]], 46
; CHECK-NEXT:    [[B:%.*]] = mul nuw i32 [[Y:%.*]], 44
; CHECK-NEXT:    [[C:%.*]] = icmp eq i32 [[A]], [[B]]
; CHECK-NEXT:    ret i1 [[C]]
;
  %A = mul nuw i32 %x, 46
  %B = mul nuw i32 %y, 44
  %C = icmp eq i32 %A, %B
  ret i1 %C
}

; If the multiply constant has any trailing zero bits but could overflow,
; we get something completely different.
; We mask off the high bits of each input and then convert:
; (X&Z) == (Y&Z) -> (X^Y) & Z == 0

define i1 @mul_constant_partial_nuw_eq(i32 %x, i32 %y) {
; CHECK-LABEL: @mul_constant_partial_nuw_eq(
; CHECK-NEXT:    [[TMP1:%.*]] = xor i32 [[X:%.*]], [[Y:%.*]]
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[TMP1]], 1073741823
; CHECK-NEXT:    [[C:%.*]] = icmp eq i32 [[TMP2]], 0
; CHECK-NEXT:    ret i1 [[C]]
;
  %A = mul i32 %x, 44
  %B = mul nuw i32 %y, 44
  %C = icmp eq i32 %A, %B
  ret i1 %C
}

define i1 @mul_constant_mismatch_wrap_eq(i32 %x, i32 %y) {
; CHECK-LABEL: @mul_constant_mismatch_wrap_eq(
; CHECK-NEXT:    [[TMP1:%.*]] = xor i32 [[X:%.*]], [[Y:%.*]]
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[TMP1]], 2147483647
; CHECK-NEXT:    [[C:%.*]] = icmp eq i32 [[TMP2]], 0
; CHECK-NEXT:    ret i1 [[C]]
;
  %A = mul nsw i32 %x, 54
  %B = mul nuw i32 %y, 54
  %C = icmp eq i32 %A, %B
  ret i1 %C
}

define i1 @eq_mul_constants_with_tz(i32 %x, i32 %y) {
; CHECK-LABEL: @eq_mul_constants_with_tz(
; CHECK-NEXT:    [[TMP1:%.*]] = xor i32 [[X:%.*]], [[Y:%.*]]
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[TMP1]], 1073741823
; CHECK-NEXT:    [[C:%.*]] = icmp ne i32 [[TMP2]], 0
; CHECK-NEXT:    ret i1 [[C]]
;
  %A = mul i32 %x, 12
  %B = mul i32 %y, 12
  %C = icmp ne i32 %A, %B
  ret i1 %C
}

define <2 x i1> @eq_mul_constants_with_tz_splat(<2 x i32> %x, <2 x i32> %y) {
; CHECK-LABEL: @eq_mul_constants_with_tz_splat(
; CHECK-NEXT:    [[TMP1:%.*]] = xor <2 x i32> [[X:%.*]], [[Y:%.*]]
; CHECK-NEXT:    [[TMP2:%.*]] = and <2 x i32> [[TMP1]], <i32 1073741823, i32 1073741823>
; CHECK-NEXT:    [[C:%.*]] = icmp eq <2 x i32> [[TMP2]], zeroinitializer
; CHECK-NEXT:    ret <2 x i1> [[C]]
;
  %A = mul <2 x i32> %x, <i32 12, i32 12>
  %B = mul <2 x i32> %y, <i32 12, i32 12>
  %C = icmp eq <2 x i32> %A, %B
  ret <2 x i1> %C
}

@g = extern_weak global i32

define i1 @oss_fuzz_39934(i32 %arg) {
  %B13 = mul nsw i32 %arg, -65536
  %C10 = icmp ne i32 mul (i32 or (i32 zext (i1 icmp eq (i32* @g, i32* null) to i32), i32 65537), i32 -65536), %B13
  ret i1 %C10
}
