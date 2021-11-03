; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple aarch64-none-linux-gnu -mattr=+sve | FileCheck %s

define <vscale x 2 x i16> @dupsext_v2i8_v2i16(i8 %src, <vscale x 2 x i16> %b) {
; CHECK-LABEL: dupsext_v2i8_v2i16:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    sxtb w8, w0
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    mov z1.d, x8
; CHECK-NEXT:    mul z0.d, p0/m, z0.d, z1.d
; CHECK-NEXT:    ret
entry:
    %in = sext i8 %src to i16
    %broadcast.splatinsert = insertelement <vscale x 2 x i16> undef, i16 %in, i16 0
    %broadcast.splat = shufflevector <vscale x 2 x i16> %broadcast.splatinsert, <vscale x 2 x i16> undef, <vscale x 2 x i32> zeroinitializer
    %out = mul nsw <vscale x 2 x i16> %broadcast.splat, %b
    ret <vscale x 2 x i16> %out
}

define <vscale x 4 x i16> @dupsext_v4i8_v4i16(i8 %src, <vscale x 4 x i16> %b) {
; CHECK-LABEL: dupsext_v4i8_v4i16:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    sxtb w8, w0
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    mov z1.s, w8
; CHECK-NEXT:    mul z0.s, p0/m, z0.s, z1.s
; CHECK-NEXT:    ret
entry:
    %in = sext i8 %src to i16
    %broadcast.splatinsert = insertelement <vscale x 4 x i16> undef, i16 %in, i16 0
    %broadcast.splat = shufflevector <vscale x 4 x i16> %broadcast.splatinsert, <vscale x 4 x i16> undef, <vscale x 4 x i32> zeroinitializer
    %out = mul nsw <vscale x 4 x i16> %broadcast.splat, %b
    ret <vscale x 4 x i16> %out
}

define <vscale x 8 x i16> @dupsext_v8i8_v8i16(i8 %src, <vscale x 8 x i16> %b) {
; CHECK-LABEL: dupsext_v8i8_v8i16:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    sxtb w8, w0
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    mov z1.h, w8
; CHECK-NEXT:    mul z0.h, p0/m, z0.h, z1.h
; CHECK-NEXT:    ret
entry:
    %in = sext i8 %src to i16
    %broadcast.splatinsert = insertelement <vscale x 8 x i16> undef, i16 %in, i16 0
    %broadcast.splat = shufflevector <vscale x 8 x i16> %broadcast.splatinsert, <vscale x 8 x i16> undef, <vscale x 8 x i32> zeroinitializer
    %out = mul nsw <vscale x 8 x i16> %broadcast.splat, %b
    ret <vscale x 8 x i16> %out
}

define <vscale x 2 x i32> @dupsext_v2i8_v2i32(i8 %src, <vscale x 2 x i32> %b) {
; CHECK-LABEL: dupsext_v2i8_v2i32:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    sxtb w8, w0
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    mov z1.d, x8
; CHECK-NEXT:    mul z0.d, p0/m, z0.d, z1.d
; CHECK-NEXT:    ret
entry:
    %in = sext i8 %src to i32
    %broadcast.splatinsert = insertelement <vscale x 2 x i32> undef, i32 %in, i32 0
    %broadcast.splat = shufflevector <vscale x 2 x i32> %broadcast.splatinsert, <vscale x 2 x i32> undef, <vscale x 2 x i32> zeroinitializer
    %out = mul nsw <vscale x 2 x i32> %broadcast.splat, %b
    ret <vscale x 2 x i32> %out
}

define <vscale x 4 x i32> @dupsext_v4i8_v4i32(i8 %src, <vscale x 4 x i32> %b) {
; CHECK-LABEL: dupsext_v4i8_v4i32:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    sxtb w8, w0
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    mov z1.s, w8
; CHECK-NEXT:    mul z0.s, p0/m, z0.s, z1.s
; CHECK-NEXT:    ret
entry:
    %in = sext i8 %src to i32
    %broadcast.splatinsert = insertelement <vscale x 4 x i32> undef, i32 %in, i32 0
    %broadcast.splat = shufflevector <vscale x 4 x i32> %broadcast.splatinsert, <vscale x 4 x i32> undef, <vscale x 4 x i32> zeroinitializer
    %out = mul nsw <vscale x 4 x i32> %broadcast.splat, %b
    ret <vscale x 4 x i32> %out
}

define <vscale x 2 x i64> @dupsext_v2i8_v2i64(i8 %src, <vscale x 2 x i64> %b) {
; CHECK-LABEL: dupsext_v2i8_v2i64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    sxtb x8, w0
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    mov z1.d, x8
; CHECK-NEXT:    mul z0.d, p0/m, z0.d, z1.d
; CHECK-NEXT:    ret
entry:
    %in = sext i8 %src to i64
    %broadcast.splatinsert = insertelement <vscale x 2 x i64> undef, i64 %in, i64 0
    %broadcast.splat = shufflevector <vscale x 2 x i64> %broadcast.splatinsert, <vscale x 2 x i64> undef, <vscale x 2 x i32> zeroinitializer
    %out = mul nsw <vscale x 2 x i64> %broadcast.splat, %b
    ret <vscale x 2 x i64> %out
}

define <vscale x 2 x i32> @dupsext_v2i16_v2i32(i16 %src, <vscale x 2 x i32> %b) {
; CHECK-LABEL: dupsext_v2i16_v2i32:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    sxth w8, w0
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    mov z1.d, x8
; CHECK-NEXT:    mul z0.d, p0/m, z0.d, z1.d
; CHECK-NEXT:    ret
entry:
    %in = sext i16 %src to i32
    %broadcast.splatinsert = insertelement <vscale x 2 x i32> undef, i32 %in, i32 0
    %broadcast.splat = shufflevector <vscale x 2 x i32> %broadcast.splatinsert, <vscale x 2 x i32> undef, <vscale x 2 x i32> zeroinitializer
    %out = mul nsw <vscale x 2 x i32> %broadcast.splat, %b
    ret <vscale x 2 x i32> %out
}

define <vscale x 4 x i32> @dupsext_v4i16_v4i32(i16 %src, <vscale x 4 x i32> %b) {
; CHECK-LABEL: dupsext_v4i16_v4i32:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    sxth w8, w0
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    mov z1.s, w8
; CHECK-NEXT:    mul z0.s, p0/m, z0.s, z1.s
; CHECK-NEXT:    ret
entry:
    %in = sext i16 %src to i32
    %broadcast.splatinsert = insertelement <vscale x 4 x i32> undef, i32 %in, i32 0
    %broadcast.splat = shufflevector <vscale x 4 x i32> %broadcast.splatinsert, <vscale x 4 x i32> undef, <vscale x 4 x i32> zeroinitializer
    %out = mul nsw <vscale x 4 x i32> %broadcast.splat, %b
    ret <vscale x 4 x i32> %out
}

define <vscale x 2 x i64> @dupsext_v2i16_v2i64(i16 %src, <vscale x 2 x i64> %b) {
; CHECK-LABEL: dupsext_v2i16_v2i64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    sxth x8, w0
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    mov z1.d, x8
; CHECK-NEXT:    mul z0.d, p0/m, z0.d, z1.d
; CHECK-NEXT:    ret
entry:
    %in = sext i16 %src to i64
    %broadcast.splatinsert = insertelement <vscale x 2 x i64> undef, i64 %in, i64 0
    %broadcast.splat = shufflevector <vscale x 2 x i64> %broadcast.splatinsert, <vscale x 2 x i64> undef, <vscale x 2 x i32> zeroinitializer
    %out = mul nsw <vscale x 2 x i64> %broadcast.splat, %b
    ret <vscale x 2 x i64> %out
}

define <vscale x 2 x i64> @dupsext_v2i32_v2i64(i32 %src, <vscale x 2 x i64> %b) {
; CHECK-LABEL: dupsext_v2i32_v2i64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    sxtw x8, w0
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    mov z1.d, x8
; CHECK-NEXT:    mul z0.d, p0/m, z0.d, z1.d
; CHECK-NEXT:    ret
entry:
    %in = sext i32 %src to i64
    %broadcast.splatinsert = insertelement <vscale x 2 x i64> undef, i64 %in, i64 0
    %broadcast.splat = shufflevector <vscale x 2 x i64> %broadcast.splatinsert, <vscale x 2 x i64> undef, <vscale x 2 x i32> zeroinitializer
    %out = mul nsw <vscale x 2 x i64> %broadcast.splat, %b
    ret <vscale x 2 x i64> %out
}

define <vscale x 2 x i16> @dupzext_v2i8_v2i16(i8 %src, <vscale x 2 x i16> %b) {
; CHECK-LABEL: dupzext_v2i8_v2i16:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    and w8, w0, #0xff
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    mov z1.d, x8
; CHECK-NEXT:    mul z0.d, p0/m, z0.d, z1.d
; CHECK-NEXT:    ret
entry:
    %in = zext i8 %src to i16
    %broadcast.splatinsert = insertelement <vscale x 2 x i16> undef, i16 %in, i16 0
    %broadcast.splat = shufflevector <vscale x 2 x i16> %broadcast.splatinsert, <vscale x 2 x i16> undef, <vscale x 2 x i32> zeroinitializer
    %out = mul nuw <vscale x 2 x i16> %broadcast.splat, %b
    ret <vscale x 2 x i16> %out
}

define <vscale x 4 x i16> @dupzext_v4i8_v4i16(i8 %src, <vscale x 4 x i16> %b) {
; CHECK-LABEL: dupzext_v4i8_v4i16:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    and w8, w0, #0xff
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    mov z1.s, w8
; CHECK-NEXT:    mul z0.s, p0/m, z0.s, z1.s
; CHECK-NEXT:    ret
entry:
    %in = zext i8 %src to i16
    %broadcast.splatinsert = insertelement <vscale x 4 x i16> undef, i16 %in, i16 0
    %broadcast.splat = shufflevector <vscale x 4 x i16> %broadcast.splatinsert, <vscale x 4 x i16> undef, <vscale x 4 x i32> zeroinitializer
    %out = mul nuw <vscale x 4 x i16> %broadcast.splat, %b
    ret <vscale x 4 x i16> %out
}

define <vscale x 8 x i16> @dupzext_v8i8_v8i16(i8 %src, <vscale x 8 x i16> %b) {
; CHECK-LABEL: dupzext_v8i8_v8i16:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    and w8, w0, #0xff
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    mov z1.h, w8
; CHECK-NEXT:    mul z0.h, p0/m, z0.h, z1.h
; CHECK-NEXT:    ret
entry:
    %in = zext i8 %src to i16
    %broadcast.splatinsert = insertelement <vscale x 8 x i16> undef, i16 %in, i16 0
    %broadcast.splat = shufflevector <vscale x 8 x i16> %broadcast.splatinsert, <vscale x 8 x i16> undef, <vscale x 8 x i32> zeroinitializer
    %out = mul nuw <vscale x 8 x i16> %broadcast.splat, %b
    ret <vscale x 8 x i16> %out
}

define <vscale x 2 x i32> @dupzext_v2i8_v2i32(i8 %src, <vscale x 2 x i32> %b) {
; CHECK-LABEL: dupzext_v2i8_v2i32:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    and w8, w0, #0xff
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    mov z1.d, x8
; CHECK-NEXT:    mul z0.d, p0/m, z0.d, z1.d
; CHECK-NEXT:    ret
entry:
    %in = zext i8 %src to i32
    %broadcast.splatinsert = insertelement <vscale x 2 x i32> undef, i32 %in, i32 0
    %broadcast.splat = shufflevector <vscale x 2 x i32> %broadcast.splatinsert, <vscale x 2 x i32> undef, <vscale x 2 x i32> zeroinitializer
    %out = mul nuw <vscale x 2 x i32> %broadcast.splat, %b
    ret <vscale x 2 x i32> %out
}

define <vscale x 4 x i32> @dupzext_v4i8_v4i32(i8 %src, <vscale x 4 x i32> %b) {
; CHECK-LABEL: dupzext_v4i8_v4i32:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    and w8, w0, #0xff
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    mov z1.s, w8
; CHECK-NEXT:    mul z0.s, p0/m, z0.s, z1.s
; CHECK-NEXT:    ret
entry:
    %in = zext i8 %src to i32
    %broadcast.splatinsert = insertelement <vscale x 4 x i32> undef, i32 %in, i32 0
    %broadcast.splat = shufflevector <vscale x 4 x i32> %broadcast.splatinsert, <vscale x 4 x i32> undef, <vscale x 4 x i32> zeroinitializer
    %out = mul nuw <vscale x 4 x i32> %broadcast.splat, %b
    ret <vscale x 4 x i32> %out
}

define <vscale x 2 x i64> @dupzext_v2i8_v2i64(i8 %src, <vscale x 2 x i64> %b) {
; CHECK-LABEL: dupzext_v2i8_v2i64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    and x8, x0, #0xff
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    mov z1.d, x8
; CHECK-NEXT:    mul z0.d, p0/m, z0.d, z1.d
; CHECK-NEXT:    ret
entry:
    %in = zext i8 %src to i64
    %broadcast.splatinsert = insertelement <vscale x 2 x i64> undef, i64 %in, i64 0
    %broadcast.splat = shufflevector <vscale x 2 x i64> %broadcast.splatinsert, <vscale x 2 x i64> undef, <vscale x 2 x i32> zeroinitializer
    %out = mul nuw <vscale x 2 x i64> %broadcast.splat, %b
    ret <vscale x 2 x i64> %out
}

define <vscale x 2 x i32> @dupzext_v2i16_v2i32(i16 %src, <vscale x 2 x i32> %b) {
; CHECK-LABEL: dupzext_v2i16_v2i32:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    and w8, w0, #0xffff
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    mov z1.d, x8
; CHECK-NEXT:    mul z0.d, p0/m, z0.d, z1.d
; CHECK-NEXT:    ret
entry:
    %in = zext i16 %src to i32
    %broadcast.splatinsert = insertelement <vscale x 2 x i32> undef, i32 %in, i32 0
    %broadcast.splat = shufflevector <vscale x 2 x i32> %broadcast.splatinsert, <vscale x 2 x i32> undef, <vscale x 2 x i32> zeroinitializer
    %out = mul nuw <vscale x 2 x i32> %broadcast.splat, %b
    ret <vscale x 2 x i32> %out
}

define <vscale x 4 x i32> @dupzext_v4i16_v4i32(i16 %src, <vscale x 4 x i32> %b) {
; CHECK-LABEL: dupzext_v4i16_v4i32:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    and w8, w0, #0xffff
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    mov z1.s, w8
; CHECK-NEXT:    mul z0.s, p0/m, z0.s, z1.s
; CHECK-NEXT:    ret
entry:
    %in = zext i16 %src to i32
    %broadcast.splatinsert = insertelement <vscale x 4 x i32> undef, i32 %in, i32 0
    %broadcast.splat = shufflevector <vscale x 4 x i32> %broadcast.splatinsert, <vscale x 4 x i32> undef, <vscale x 4 x i32> zeroinitializer
    %out = mul nuw <vscale x 4 x i32> %broadcast.splat, %b
    ret <vscale x 4 x i32> %out
}

define <vscale x 2 x i64> @dupzext_v2i16_v2i64(i16 %src, <vscale x 2 x i64> %b) {
; CHECK-LABEL: dupzext_v2i16_v2i64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    // kill: def $w0 killed $w0 def $x0
; CHECK-NEXT:    and x8, x0, #0xffff
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    mov z1.d, x8
; CHECK-NEXT:    mul z0.d, p0/m, z0.d, z1.d
; CHECK-NEXT:    ret
entry:
    %in = zext i16 %src to i64
    %broadcast.splatinsert = insertelement <vscale x 2 x i64> undef, i64 %in, i64 0
    %broadcast.splat = shufflevector <vscale x 2 x i64> %broadcast.splatinsert, <vscale x 2 x i64> undef, <vscale x 2 x i32> zeroinitializer
    %out = mul nuw <vscale x 2 x i64> %broadcast.splat, %b
    ret <vscale x 2 x i64> %out
}

define <vscale x 2 x i64> @dupzext_v2i32_v2i64(i32 %src, <vscale x 2 x i64> %b) {
; CHECK-LABEL: dupzext_v2i32_v2i64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    mov w8, w0
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    mov z1.d, x8
; CHECK-NEXT:    mul z0.d, p0/m, z0.d, z1.d
; CHECK-NEXT:    ret
entry:
    %in = zext i32 %src to i64
    %broadcast.splatinsert = insertelement <vscale x 2 x i64> undef, i64 %in, i64 0
    %broadcast.splat = shufflevector <vscale x 2 x i64> %broadcast.splatinsert, <vscale x 2 x i64> undef, <vscale x 2 x i32> zeroinitializer
    %out = mul nuw <vscale x 2 x i64> %broadcast.splat, %b
    ret <vscale x 2 x i64> %out
}
