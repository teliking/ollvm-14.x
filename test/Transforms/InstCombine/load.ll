; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -instcombine -S < %s | FileCheck %s
; RUN: opt -passes=instcombine -S < %s | FileCheck %s

target datalayout = "e-m:e-p:64:64:64-i64:64-f80:128-n8:16:32:64-S128-ni:1"

@X = constant i32 42		; <i32*> [#uses=2]
@X2 = constant i32 47		; <i32*> [#uses=1]
@Y = constant [2 x { i32, float }] [ { i32, float } { i32 12, float 1.000000e+00 }, { i32, float } { i32 37, float 0x3FF3B2FEC0000000 } ]		; <[2 x { i32, float }]*> [#uses=2]
@Z = constant [2 x { i32, float }] zeroinitializer		; <[2 x { i32, float }]*> [#uses=1]

@GLOBAL = internal constant [4 x i32] zeroinitializer


define i32 @test1() {
; CHECK-LABEL: @test1(
; CHECK-NEXT:    ret i32 42
;
  %B = load i32, i32* @X		; <i32> [#uses=1]
  ret i32 %B
}

define float @test2() {
; CHECK-LABEL: @test2(
; CHECK-NEXT:    ret float 0x3FF3B2FEC0000000
;
  %A = getelementptr [2 x { i32, float }], [2 x { i32, float }]* @Y, i64 0, i64 1, i32 1		; <float*> [#uses=1]
  %B = load float, float* %A		; <float> [#uses=1]
  ret float %B
}

define i32 @test3() {
; CHECK-LABEL: @test3(
; CHECK-NEXT:    ret i32 12
;
  %A = getelementptr [2 x { i32, float }], [2 x { i32, float }]* @Y, i64 0, i64 0, i32 0		; <i32*> [#uses=1]
  %B = load i32, i32* %A		; <i32> [#uses=1]
  ret i32 %B
}

define i32 @test4() {
; CHECK-LABEL: @test4(
; CHECK-NEXT:    ret i32 0
;
  %A = getelementptr [2 x { i32, float }], [2 x { i32, float }]* @Z, i64 0, i64 1, i32 0		; <i32*> [#uses=1]
  %B = load i32, i32* %A		; <i32> [#uses=1]
  ret i32 %B
}

define i32 @test5(i1 %C) {
; CHECK-LABEL: @test5(
; CHECK-NEXT:    [[Z:%.*]] = select i1 [[C:%.*]], i32 42, i32 47
; CHECK-NEXT:    ret i32 [[Z]]
;
  %Y = select i1 %C, i32* @X, i32* @X2		; <i32*> [#uses=1]
  %Z = load i32, i32* %Y		; <i32> [#uses=1]
  ret i32 %Z
}

define i32 @load_gep_null_inbounds(i64 %X) {
; CHECK-LABEL: @load_gep_null_inbounds(
; CHECK-NEXT:    store i32 poison, i32* null, align 4294967296
; CHECK-NEXT:    ret i32 poison
;
  %V = getelementptr inbounds i32, i32* null, i64 %X
  %R = load i32, i32* %V
  ret i32 %R
}

define i32 @load_gep_null_not_inbounds(i64 %X) {
; CHECK-LABEL: @load_gep_null_not_inbounds(
; CHECK-NEXT:    store i32 poison, i32* null, align 4294967296
; CHECK-NEXT:    ret i32 poison
;
  %V = getelementptr i32, i32* null, i64 %X
  %R = load i32, i32* %V
  ret i32 %R
}

define i32 @test7_no_null_opt(i32 %X) #0 {
; CHECK-LABEL: @test7_no_null_opt(
; CHECK-NEXT:    [[TMP1:%.*]] = sext i32 [[X:%.*]] to i64
; CHECK-NEXT:    [[V:%.*]] = getelementptr i32, i32* null, i64 [[TMP1]]
; CHECK-NEXT:    [[R:%.*]] = load i32, i32* [[V]], align 4
; CHECK-NEXT:    ret i32 [[R]]
;
  %V = getelementptr i32, i32* null, i32 %X               ; <i32*> [#uses=1]
  %R = load i32, i32* %V          ; <i32> [#uses=1]
  ret i32 %R
}
attributes #0 = { null_pointer_is_valid }

define i32 @test8(i32* %P) {
; CHECK-LABEL: @test8(
; CHECK-NEXT:    store i32 1, i32* [[P:%.*]], align 4
; CHECK-NEXT:    ret i32 1
;
  store i32 1, i32* %P
  %X = load i32, i32* %P		; <i32> [#uses=1]
  ret i32 %X
}

define i32 @test9(i32* %P) {
; CHECK-LABEL: @test9(
; CHECK-NEXT:    ret i32 0
;
  %X = load i32, i32* %P		; <i32> [#uses=1]
  %Y = load i32, i32* %P		; <i32> [#uses=1]
  %Z = sub i32 %X, %Y		; <i32> [#uses=1]
  ret i32 %Z
}

define i32 @test10(i1 %C.upgrd.1, i32* %P, i32* %Q) {
; CHECK-LABEL: @test10(
; CHECK-NEXT:    br i1 [[C_UPGRD_1:%.*]], label [[T:%.*]], label [[F:%.*]]
; CHECK:       T:
; CHECK-NEXT:    store i32 1, i32* [[Q:%.*]], align 4
; CHECK-NEXT:    br label [[C:%.*]]
; CHECK:       F:
; CHECK-NEXT:    br label [[C]]
; CHECK:       C:
; CHECK-NEXT:    store i32 0, i32* [[P:%.*]], align 4
; CHECK-NEXT:    ret i32 0
;
  br i1 %C.upgrd.1, label %T, label %F
T:		; preds = %0
  store i32 1, i32* %Q
  store i32 0, i32* %P
  br label %C
F:		; preds = %0
  store i32 0, i32* %P
  br label %C
C:		; preds = %F, %T
  %V = load i32, i32* %P		; <i32> [#uses=1]
  ret i32 %V
}

define double @test11(double* %p) {
; CHECK-LABEL: @test11(
; CHECK-NEXT:    [[T0:%.*]] = getelementptr double, double* [[P:%.*]], i64 1
; CHECK-NEXT:    store double 2.000000e+00, double* [[T0]], align 8
; CHECK-NEXT:    ret double 2.000000e+00
;
  %t0 = getelementptr double, double* %p, i32 1
  store double 2.0, double* %t0
  %t1 = getelementptr double, double* %p, i32 1
  %x = load double, double* %t1
  ret double %x
}

define i32 @test12(i32* %P) {
; CHECK-LABEL: @test12(
; CHECK-NEXT:    ret i32 123
;
  %A = alloca i32
  store i32 123, i32* %A
  ; Cast the result of the load not the source
  %Q = bitcast i32* %A to i32*
  %V = load i32, i32* %Q
  ret i32 %V
}

define <16 x i8> @test13(<2 x i64> %x) {
; CHECK-LABEL: @test13(
; CHECK-NEXT:    ret <16 x i8> zeroinitializer
;
  %tmp = load <16 x i8>, <16 x i8>* bitcast ([4 x i32]* @GLOBAL to <16 x i8>*)
  ret <16 x i8> %tmp
}

; This test must not have the store of %x forwarded to the load -- there is an
; intervening store if %y. However, the intervening store occurs with a different
; type and size and to a different pointer value. This is ensuring that none of
; those confuse the analysis into thinking that the second store does not alias
; the first.

define i8 @test14(i8 %x, i32 %y) {
; CHECK-LABEL: @test14(
; CHECK-NEXT:    [[A:%.*]] = alloca i32, align 4
; CHECK-NEXT:    [[A_I8:%.*]] = bitcast i32* [[A]] to i8*
; CHECK-NEXT:    store i8 [[X:%.*]], i8* [[A_I8]], align 4
; CHECK-NEXT:    store i32 [[Y:%.*]], i32* [[A]], align 4
; CHECK-NEXT:    [[R:%.*]] = load i8, i8* [[A_I8]], align 4
; CHECK-NEXT:    ret i8 [[R]]
;
  %a = alloca i32
  %a.i8 = bitcast i32* %a to i8*
  store i8 %x, i8* %a.i8
  store i32 %y, i32* %a
  %r = load i8, i8* %a.i8
  ret i8 %r
}

@test15_global = external global i32

; Same test as @test14 essentially, but using a global instead of an alloca.

define i8 @test15(i8 %x, i32 %y) {
; CHECK-LABEL: @test15(
; CHECK-NEXT:    store i8 [[X:%.*]], i8* bitcast (i32* @test15_global to i8*), align 4
; CHECK-NEXT:    store i32 [[Y:%.*]], i32* @test15_global, align 4
; CHECK-NEXT:    [[R:%.*]] = load i8, i8* bitcast (i32* @test15_global to i8*), align 4
; CHECK-NEXT:    ret i8 [[R]]
;
  %g.i8 = bitcast i32* @test15_global to i8*
  store i8 %x, i8* %g.i8
  store i32 %y, i32* @test15_global
  %r = load i8, i8* %g.i8
  ret i8 %r
}

; Check that we canonicalize loads which are only stored to use integer types
; when there is a valid integer type.

define void @test16(i8* %x, i8* %a, i8* %b, i8* %c) {
; CHECK-LABEL: @test16(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[X_CAST:%.*]] = bitcast i8* [[X:%.*]] to float*
; CHECK-NEXT:    [[A_CAST:%.*]] = bitcast i8* [[A:%.*]] to float*
; CHECK-NEXT:    [[B_CAST:%.*]] = bitcast i8* [[B:%.*]] to float*
; CHECK-NEXT:    [[X1:%.*]] = load float, float* [[X_CAST]], align 4
; CHECK-NEXT:    store float [[X1]], float* [[A_CAST]], align 4
; CHECK-NEXT:    store float [[X1]], float* [[B_CAST]], align 4
; CHECK-NEXT:    [[X2:%.*]] = load float, float* [[X_CAST]], align 4
; CHECK-NEXT:    store float [[X2]], float* [[B_CAST]], align 4
; CHECK-NEXT:    [[TMP0:%.*]] = bitcast i8* [[C:%.*]] to float*
; CHECK-NEXT:    store float [[X2]], float* [[TMP0]], align 4
; CHECK-NEXT:    ret void
;
entry:
  %x.cast = bitcast i8* %x to float*
  %a.cast = bitcast i8* %a to float*
  %b.cast = bitcast i8* %b to float*
  %c.cast = bitcast i8* %c to i32*

  %x1 = load float, float* %x.cast
  store float %x1, float* %a.cast
  store float %x1, float* %b.cast

  %x2 = load float, float* %x.cast
  store float %x2, float* %b.cast
  %x2.cast = bitcast float %x2 to i32
  store i32 %x2.cast, i32* %c.cast

  ret void
}

define void @test16-vect(i8* %x, i8* %a, i8* %b, i8* %c) {
; CHECK-LABEL: @test16-vect(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[X_CAST:%.*]] = bitcast i8* [[X:%.*]] to <4 x i8>*
; CHECK-NEXT:    [[A_CAST:%.*]] = bitcast i8* [[A:%.*]] to <4 x i8>*
; CHECK-NEXT:    [[B_CAST:%.*]] = bitcast i8* [[B:%.*]] to <4 x i8>*
; CHECK-NEXT:    [[X1:%.*]] = load <4 x i8>, <4 x i8>* [[X_CAST]], align 4
; CHECK-NEXT:    store <4 x i8> [[X1]], <4 x i8>* [[A_CAST]], align 4
; CHECK-NEXT:    store <4 x i8> [[X1]], <4 x i8>* [[B_CAST]], align 4
; CHECK-NEXT:    [[X2:%.*]] = load <4 x i8>, <4 x i8>* [[X_CAST]], align 4
; CHECK-NEXT:    store <4 x i8> [[X2]], <4 x i8>* [[B_CAST]], align 4
; CHECK-NEXT:    [[TMP0:%.*]] = bitcast i8* [[C:%.*]] to <4 x i8>*
; CHECK-NEXT:    store <4 x i8> [[X2]], <4 x i8>* [[TMP0]], align 4
; CHECK-NEXT:    ret void
;
entry:
  %x.cast = bitcast i8* %x to <4 x i8>*
  %a.cast = bitcast i8* %a to <4 x i8>*
  %b.cast = bitcast i8* %b to <4 x i8>*
  %c.cast = bitcast i8* %c to i32*

  %x1 = load <4 x i8>, <4 x i8>* %x.cast
  store <4 x i8> %x1, <4 x i8>* %a.cast
  store <4 x i8> %x1, <4 x i8>* %b.cast

  %x2 = load <4 x i8>, <4 x i8>* %x.cast
  store <4 x i8> %x2, <4 x i8>* %b.cast
  %x2.cast = bitcast <4 x i8> %x2 to i32
  store i32 %x2.cast, i32* %c.cast

  ret void
}


; Check that in cases similar to @test16 we don't try to rewrite a load when
; its only use is a store but it is used as the pointer to that store rather
; than the value.

define void @test17(i8** %x, i8 %y) {
; CHECK-LABEL: @test17(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[X_LOAD:%.*]] = load i8*, i8** [[X:%.*]], align 8
; CHECK-NEXT:    store i8 [[Y:%.*]], i8* [[X_LOAD]], align 1
; CHECK-NEXT:    ret void
;
entry:
  %x.load = load i8*, i8** %x
  store i8 %y, i8* %x.load

  ret void
}

; Check that we don't try change the type of the load by inserting a bitcast
; generating invalid IR.
%swift.error = type opaque
declare void @useSwiftError(%swift.error** swifterror)

define void @test18(%swift.error** swifterror %err) {
; CHECK-LABEL: @test18(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[SWIFTERROR:%.*]] = alloca swifterror %swift.error*, align 8
; CHECK-NEXT:    store %swift.error* null, %swift.error** [[SWIFTERROR]], align 8
; CHECK-NEXT:    call void @useSwiftError(%swift.error** nonnull swifterror [[SWIFTERROR]])
; CHECK-NEXT:    [[ERR_RES:%.*]] = load %swift.error*, %swift.error** [[SWIFTERROR]], align 8
; CHECK-NEXT:    store %swift.error* [[ERR_RES]], %swift.error** [[ERR:%.*]], align 8
; CHECK-NEXT:    ret void
;
entry:
  %swifterror = alloca swifterror %swift.error*, align 8
  store %swift.error* null, %swift.error** %swifterror, align 8
  call void @useSwiftError(%swift.error** nonnull swifterror %swifterror)
  %err.res = load %swift.error*, %swift.error** %swifterror, align 8
  store %swift.error* %err.res, %swift.error** %err, align 8
  ret void
}

; Make sure we preseve the type of the store to a swifterror pointer.

declare void @initi8(i8**)
define void @test19(%swift.error** swifterror %err) {
; CHECK-LABEL: @test19(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP:%.*]] = alloca i8*, align 8
; CHECK-NEXT:    call void @initi8(i8** nonnull [[TMP]])
; CHECK-NEXT:    [[SWIFTERROR:%.*]] = bitcast i8** [[TMP]] to %swift.error**
; CHECK-NEXT:    [[ERR_RES:%.*]] = load %swift.error*, %swift.error** [[SWIFTERROR]], align 8
; CHECK-NEXT:    store %swift.error* [[ERR_RES]], %swift.error** [[ERR:%.*]], align 8
; CHECK-NEXT:    ret void
;
entry:
  %tmp = alloca i8*, align 8
  call void @initi8(i8** %tmp)
  %swifterror = bitcast i8** %tmp to %swift.error**
  %err.res = load %swift.error*, %swift.error** %swifterror, align 8
  store %swift.error* %err.res, %swift.error** %err, align 8
  ret void
}

; Make sure we don't canonicalize accesses to scalable vectors.
define void @test20(<vscale x 4 x i8>* %x, <vscale x 4 x i8>* %y) {
; CHECK-LABEL: @test20(
; CHECK-NEXT:    [[X_LOAD:%.*]] = load <vscale x 4 x i8>, <vscale x 4 x i8>* [[X:%.*]], align 1
; CHECK-NEXT:    store <vscale x 4 x i8> [[X_LOAD]], <vscale x 4 x i8>* [[Y:%.*]], align 1
; CHECK-NEXT:    ret void
;
  %x.load = load <vscale x 4 x i8>, <vscale x 4 x i8>* %x, align 1
  store <vscale x 4 x i8> %x.load, <vscale x 4 x i8>* %y, align 1
  ret void
}


; Check that non-integral pointers are not coverted using inttoptr

declare void @use(i8*)
declare void @use.p1(i8 addrspace(1)*)

define i64 @test21(i64* %P) {
; CHECK-LABEL: @test21(
; CHECK-NEXT:    [[X:%.*]] = load i64, i64* [[P:%.*]], align 8
; CHECK-NEXT:    [[Y_CAST:%.*]] = inttoptr i64 [[X]] to i8*
; CHECK-NEXT:    call void @use(i8* [[Y_CAST]])
; CHECK-NEXT:    ret i64 [[X]]
;
  %P.ptr = bitcast i64* %P to i8**
  %X = load i64, i64* %P
  %Y = load i8*, i8** %P.ptr
  call void @use(i8* %Y)
  ret i64 %X
}

define i64 @test22(i64* %P) {
; CHECK-LABEL: @test22(
; CHECK-NEXT:    [[P_PTR:%.*]] = bitcast i64* [[P:%.*]] to i8 addrspace(1)**
; CHECK-NEXT:    [[X:%.*]] = load i64, i64* [[P]], align 8
; CHECK-NEXT:    [[Y:%.*]] = load i8 addrspace(1)*, i8 addrspace(1)** [[P_PTR]], align 8
; CHECK-NEXT:    call void @use.p1(i8 addrspace(1)* [[Y]])
; CHECK-NEXT:    ret i64 [[X]]
;
  %P.ptr = bitcast i64* %P to i8 addrspace(1)**
  %X = load i64, i64* %P
  %Y = load i8 addrspace(1)*, i8 addrspace(1)** %P.ptr
  call void @use.p1(i8 addrspace(1)* %Y)
  ret i64 %X
}

declare void @use.v2.p0(<2 x i8*>)
declare void @use.v2.p1(<2 x i8 addrspace(1)*>)

define <2 x i64> @test23(<2 x i64>* %P) {
; CHECK-LABEL: @test23(
; CHECK-NEXT:    [[P_PTR:%.*]] = bitcast <2 x i64>* [[P:%.*]] to <2 x i8*>*
; CHECK-NEXT:    [[X:%.*]] = load <2 x i64>, <2 x i64>* [[P]], align 16
; CHECK-NEXT:    [[Y:%.*]] = load <2 x i8*>, <2 x i8*>* [[P_PTR]], align 16
; CHECK-NEXT:    call void @use.v2.p0(<2 x i8*> [[Y]])
; CHECK-NEXT:    ret <2 x i64> [[X]]
;
  %P.ptr = bitcast <2 x i64>* %P to <2 x i8*>*
  %X = load <2 x i64>, <2 x i64>* %P
  %Y = load <2 x i8*>, <2 x i8*>* %P.ptr
  call void @use.v2.p0(<2 x i8*> %Y)
  ret <2 x i64> %X
}

define <2 x i64> @test24(<2 x i64>* %P) {
; CHECK-LABEL: @test24(
; CHECK-NEXT:    [[P_PTR:%.*]] = bitcast <2 x i64>* [[P:%.*]] to <2 x i8 addrspace(1)*>*
; CHECK-NEXT:    [[X:%.*]] = load <2 x i64>, <2 x i64>* [[P]], align 16
; CHECK-NEXT:    [[Y:%.*]] = load <2 x i8 addrspace(1)*>, <2 x i8 addrspace(1)*>* [[P_PTR]], align 16
; CHECK-NEXT:    call void @use.v2.p1(<2 x i8 addrspace(1)*> [[Y]])
; CHECK-NEXT:    ret <2 x i64> [[X]]
;
  %P.ptr = bitcast <2 x i64>* %P to <2 x i8 addrspace(1)*>*
  %X = load <2 x i64>, <2 x i64>* %P
  %Y = load <2 x i8 addrspace(1)*>, <2 x i8 addrspace(1)*>* %P.ptr
  call void @use.v2.p1(<2 x i8 addrspace(1)*> %Y)
  ret <2 x i64> %X
}
