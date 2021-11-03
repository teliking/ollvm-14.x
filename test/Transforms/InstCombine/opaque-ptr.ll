; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S -instcombine -opaque-pointers < %s | FileCheck %s

define ptr @bitcast_opaque_to_opaque(ptr %a) {
; CHECK-LABEL: @bitcast_opaque_to_opaque(
; CHECK-NEXT:    ret ptr [[A:%.*]]
;
  %b = bitcast ptr %a to ptr
  ret ptr %b
}

define ptr @bitcast_typed_to_opaque(i8* %a) {
; CHECK-LABEL: @bitcast_typed_to_opaque(
; CHECK-NEXT:    ret ptr [[A:%.*]]
;
  %b = bitcast i8* %a to ptr
  ret ptr %b
}

define i8* @bitcast_opaque_to_typed(ptr %a) {
; CHECK-LABEL: @bitcast_opaque_to_typed(
; CHECK-NEXT:    ret ptr [[A:%.*]]
;
  %b = bitcast ptr %a to i8*
  ret i8* %b
}

@g = global i8 0
define ptr @bitcast_typed_to_opaque_constexpr() {
; CHECK-LABEL: @bitcast_typed_to_opaque_constexpr(
; CHECK-NEXT:    ret ptr @g
;
  ret ptr bitcast (i8* @g to ptr)
}

define ptr @addrspacecast_opaque_to_opaque(ptr addrspace(1) %a) {
; CHECK-LABEL: @addrspacecast_opaque_to_opaque(
; CHECK-NEXT:    [[B:%.*]] = addrspacecast ptr addrspace(1) [[A:%.*]] to ptr
; CHECK-NEXT:    ret ptr [[B]]
;
  %b = addrspacecast ptr addrspace(1) %a to ptr
  ret ptr %b
}

define ptr @addrspacecast_typed_to_opaque(i8 addrspace(1)* %a) {
; CHECK-LABEL: @addrspacecast_typed_to_opaque(
; CHECK-NEXT:    [[B:%.*]] = addrspacecast ptr addrspace(1) [[A:%.*]] to ptr
; CHECK-NEXT:    ret ptr [[B]]
;
  %b = addrspacecast i8 addrspace(1)* %a to ptr
  ret ptr %b
}

define i8* @addrspacecast_opaque_to_typed(ptr addrspace(1) %a) {
; CHECK-LABEL: @addrspacecast_opaque_to_typed(
; CHECK-NEXT:    [[B:%.*]] = addrspacecast ptr addrspace(1) [[A:%.*]] to ptr
; CHECK-NEXT:    ret ptr [[B]]
;
  %b = addrspacecast ptr addrspace(1) %a to i8*
  ret i8* %b
}

define ptr addrspace(1) @bitcast_and_addrspacecast_eliminable(ptr %a) {
; CHECK-LABEL: @bitcast_and_addrspacecast_eliminable(
; CHECK-NEXT:    [[C:%.*]] = addrspacecast ptr [[A:%.*]] to ptr addrspace(1)
; CHECK-NEXT:    ret ptr addrspace(1) [[C]]
;
  %b = bitcast ptr %a to i8*
  %c = addrspacecast i8* %b to ptr addrspace(1)
  ret ptr addrspace(1) %c
}

define ptr addrspace(1) @addrspacecast_typed_to_opaque_constexpr() {
; CHECK-LABEL: @addrspacecast_typed_to_opaque_constexpr(
; CHECK-NEXT:    ret ptr addrspace(1) addrspacecast (ptr @g to ptr addrspace(1))
;
  ret ptr addrspace(1) addrspacecast (i8* @g to ptr addrspace(1))
}

define ptr @gep_constexpr_1(ptr %a) {
; CHECK-LABEL: @gep_constexpr_1(
; CHECK-NEXT:    ret ptr inttoptr (i64 6 to ptr)
;
  ret ptr getelementptr (i16, ptr null, i32 3)
}

define ptr @gep_constexpr_2(ptr %a) {
; CHECK-LABEL: @gep_constexpr_2(
; CHECK-NEXT:    ret ptr getelementptr (i8, ptr @g, i64 3)
;
  ret ptr getelementptr (i8, ptr bitcast (i8* @g to ptr), i32 3)
}

define ptr @load_bitcast_1(ptr %a) {
; CHECK-LABEL: @load_bitcast_1(
; CHECK-NEXT:    [[B1:%.*]] = load ptr, ptr [[A:%.*]], align 8
; CHECK-NEXT:    ret ptr [[B1]]
;
  %b = load i8*, ptr %a
  %c = bitcast i8* %b to ptr
  ret ptr %c
}

define ptr @load_bitcast_2(ptr %a) {
; CHECK-LABEL: @load_bitcast_2(
; CHECK-NEXT:    [[C1:%.*]] = load ptr, ptr [[A:%.*]], align 8
; CHECK-NEXT:    ret ptr [[C1]]
;
  %b = bitcast ptr %a to i8**
  %c = load i8*, i8** %b
  %d = bitcast i8* %c to ptr
  ret ptr %d
}

define void @call(ptr %a) {
; CHECK-LABEL: @call(
; CHECK-NEXT:    call void [[A:%.*]]()
; CHECK-NEXT:    ret void
;
  call void %a()
  ret void
}

declare void @varargs(...)
define void @varargs_cast_typed_to_opaque_same_type(i32* %a) {
; CHECK-LABEL: @varargs_cast_typed_to_opaque_same_type(
; CHECK-NEXT:    call void (...) @varargs(ptr byval(i32) [[A:%.*]])
; CHECK-NEXT:    ret void
;
  %b = bitcast i32* %a to ptr
  call void (...) @varargs(ptr byval(i32) %b)
  ret void
}

define void @varargs_cast_typed_to_opaque_different_type(i32* %a) {
; CHECK-LABEL: @varargs_cast_typed_to_opaque_different_type(
; CHECK-NEXT:    call void (...) @varargs(ptr byval(float) [[A:%.*]])
; CHECK-NEXT:    ret void
;
  %b = bitcast i32* %a to ptr
  call void (...) @varargs(ptr byval(float) %b)
  ret void
}

define void @varargs_cast_typed_to_opaque_different_size(i32* %a) {
; CHECK-LABEL: @varargs_cast_typed_to_opaque_different_size(
; CHECK-NEXT:    call void (...) @varargs(ptr byval(i64) [[A:%.*]])
; CHECK-NEXT:    ret void
;
  %b = bitcast i32* %a to ptr
  call void (...) @varargs(ptr byval(i64) %b)
  ret void
}

define void @varargs_cast_opaque_to_typed(ptr %a) {
; CHECK-LABEL: @varargs_cast_opaque_to_typed(
; CHECK-NEXT:    call void (...) @varargs(ptr byval(i8) [[A:%.*]])
; CHECK-NEXT:    ret void
;
  %b = bitcast ptr %a to i8*
  call void (...) @varargs(i8* byval(i8) %b)
  ret void
}
