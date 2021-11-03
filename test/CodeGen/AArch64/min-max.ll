; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=aarch64-eabi %s -o - | FileCheck %s --check-prefixes=CHECK,CHECK-ISEL
; RUN: llc -mtriple=aarch64-eabi -global-isel %s -o - | FileCheck %s --check-prefixes=CHECK,CHECK-GLOBAL


; These tests just check that the plumbing is in place for @llvm.smax, @llvm.umax,
; @llvm.smin, @llvm.umin.

declare i8 @llvm.smax.i8(i8 %a, i8 %b) readnone

define i8 @smaxi8(i8 %a, i8 %b) {
; CHECK-ISEL-LABEL: smaxi8:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    sxtb w8, w1
; CHECK-ISEL-NEXT:    sxtb w9, w0
; CHECK-ISEL-NEXT:    cmp w9, w8
; CHECK-ISEL-NEXT:    csel w0, w9, w8, gt
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: smaxi8:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    sxtb w8, w0
; CHECK-GLOBAL-NEXT:    cmp w8, w1, sxtb
; CHECK-GLOBAL-NEXT:    csel w0, w0, w1, gt
; CHECK-GLOBAL-NEXT:    ret
  %c = call i8 @llvm.smax.i8(i8 %a, i8 %b)
  ret i8 %c
}

declare i16 @llvm.smax.i16(i16 %a, i16 %b) readnone

define i16 @smaxi16(i16 %a, i16 %b) {
; CHECK-ISEL-LABEL: smaxi16:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    sxth w8, w1
; CHECK-ISEL-NEXT:    sxth w9, w0
; CHECK-ISEL-NEXT:    cmp w9, w8
; CHECK-ISEL-NEXT:    csel w0, w9, w8, gt
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: smaxi16:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    sxth w8, w0
; CHECK-GLOBAL-NEXT:    cmp w8, w1, sxth
; CHECK-GLOBAL-NEXT:    csel w0, w0, w1, gt
; CHECK-GLOBAL-NEXT:    ret
  %c = call i16 @llvm.smax.i16(i16 %a, i16 %b)
  ret i16 %c
}

declare i32 @llvm.smax.i32(i32 %a, i32 %b) readnone

define i32 @smaxi32(i32 %a, i32 %b) {
; CHECK-LABEL: smaxi32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp w0, w1
; CHECK-NEXT:    csel w0, w0, w1, gt
; CHECK-NEXT:    ret
  %c = call i32 @llvm.smax.i32(i32 %a, i32 %b)
  ret i32 %c
}

declare i64 @llvm.smax.i64(i64 %a, i64 %b) readnone

define i64 @smaxi64(i64 %a, i64 %b) {
; CHECK-LABEL: smaxi64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp x0, x1
; CHECK-NEXT:    csel x0, x0, x1, gt
; CHECK-NEXT:    ret
  %c = call i64 @llvm.smax.i64(i64 %a, i64 %b)
  ret i64 %c
}

declare <8 x i8> @llvm.smax.v8i8(<8 x i8> %a, <8 x i8> %b) readnone

define <8 x i8> @smax8i8(<8 x i8> %a, <8 x i8> %b) {
; CHECK-LABEL: smax8i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smax v0.8b, v0.8b, v1.8b
; CHECK-NEXT:    ret
  %c = call <8 x i8> @llvm.smax.v8i8(<8 x i8> %a, <8 x i8> %b)
  ret <8 x i8> %c
}

declare <16 x i8> @llvm.smax.v16i8(<16 x i8> %a, <16 x i8> %b) readnone

define <16 x i8> @smax16i8(<16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: smax16i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smax v0.16b, v0.16b, v1.16b
; CHECK-NEXT:    ret
  %c = call <16 x i8> @llvm.smax.v16i8(<16 x i8> %a, <16 x i8> %b)
  ret <16 x i8> %c
}

declare <32 x i8> @llvm.smax.v32i8(<32 x i8> %a, <32 x i8> %b) readnone

define void @smax32i8(<32 x i8> %a, <32 x i8> %b, <32 x i8>* %p) {
; CHECK-ISEL-LABEL: smax32i8:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    smax v1.16b, v1.16b, v3.16b
; CHECK-ISEL-NEXT:    smax v0.16b, v0.16b, v2.16b
; CHECK-ISEL-NEXT:    stp q0, q1, [x0]
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: smax32i8:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    smax v0.16b, v0.16b, v2.16b
; CHECK-GLOBAL-NEXT:    smax v1.16b, v1.16b, v3.16b
; CHECK-GLOBAL-NEXT:    stp q0, q1, [x0]
; CHECK-GLOBAL-NEXT:    ret
  %c = call <32 x i8> @llvm.smax.v32i8(<32 x i8> %a, <32 x i8> %b)
  store <32 x i8> %c, <32 x i8>* %p
  ret void
}

declare <4 x i16> @llvm.smax.v4i16(<4 x i16> %a, <4 x i16> %b) readnone

define <4 x i16> @smax4i16(<4 x i16> %a, <4 x i16> %b) {
; CHECK-LABEL: smax4i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smax v0.4h, v0.4h, v1.4h
; CHECK-NEXT:    ret
  %c = call <4 x i16> @llvm.smax.v4i16(<4 x i16> %a, <4 x i16> %b)
  ret <4 x i16> %c
}

declare <8 x i16> @llvm.smax.v8i16(<8 x i16> %a, <8 x i16> %b) readnone

define <8 x i16> @smax8i16(<8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: smax8i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smax v0.8h, v0.8h, v1.8h
; CHECK-NEXT:    ret
  %c = call <8 x i16> @llvm.smax.v8i16(<8 x i16> %a, <8 x i16> %b)
  ret <8 x i16> %c
}

declare <16 x i16> @llvm.smax.v16i16(<16 x i16> %a, <16 x i16> %b) readnone

define void @smax16i16(<16 x i16> %a, <16 x i16> %b, <16 x i16>* %p) {
; CHECK-ISEL-LABEL: smax16i16:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    smax v1.8h, v1.8h, v3.8h
; CHECK-ISEL-NEXT:    smax v0.8h, v0.8h, v2.8h
; CHECK-ISEL-NEXT:    stp q0, q1, [x0]
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: smax16i16:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    smax v0.8h, v0.8h, v2.8h
; CHECK-GLOBAL-NEXT:    smax v1.8h, v1.8h, v3.8h
; CHECK-GLOBAL-NEXT:    stp q0, q1, [x0]
; CHECK-GLOBAL-NEXT:    ret
  %c = call <16 x i16> @llvm.smax.v16i16(<16 x i16> %a, <16 x i16> %b)
  store <16 x i16> %c, <16 x i16>* %p
  ret void
}

declare <2 x i32> @llvm.smax.v2i32(<2 x i32> %a, <2 x i32> %b) readnone

define <2 x i32> @smax2i32(<2 x i32> %a, <2 x i32> %b) {
; CHECK-LABEL: smax2i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smax v0.2s, v0.2s, v1.2s
; CHECK-NEXT:    ret
  %c = call <2 x i32> @llvm.smax.v2i32(<2 x i32> %a, <2 x i32> %b)
  ret <2 x i32> %c
}

declare <4 x i32> @llvm.smax.v4i32(<4 x i32> %a, <4 x i32> %b) readnone

define <4 x i32> @smax4i32(<4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: smax4i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smax v0.4s, v0.4s, v1.4s
; CHECK-NEXT:    ret
  %c = call <4 x i32> @llvm.smax.v4i32(<4 x i32> %a, <4 x i32> %b)
  ret <4 x i32> %c
}

declare <8 x i32> @llvm.smax.v8i32(<8 x i32> %a, <8 x i32> %b) readnone

define void @smax8i32(<8 x i32> %a, <8 x i32> %b, <8 x i32>* %p) {
; CHECK-ISEL-LABEL: smax8i32:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    smax v1.4s, v1.4s, v3.4s
; CHECK-ISEL-NEXT:    smax v0.4s, v0.4s, v2.4s
; CHECK-ISEL-NEXT:    stp q0, q1, [x0]
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: smax8i32:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    smax v0.4s, v0.4s, v2.4s
; CHECK-GLOBAL-NEXT:    smax v1.4s, v1.4s, v3.4s
; CHECK-GLOBAL-NEXT:    stp q0, q1, [x0]
; CHECK-GLOBAL-NEXT:    ret
  %c = call <8 x i32>@llvm.smax.v8i32(<8 x i32> %a, <8 x i32> %b)
  store <8 x i32> %c, <8 x i32>* %p
  ret void
}

declare <1 x i64> @llvm.smax.v1i64(<1 x i64> %a, <1 x i64> %b) readnone

define <1 x i64> @smax1i64(<1 x i64> %a, <1 x i64> %b) {
; CHECK-ISEL-LABEL: smax1i64:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    cmgt d2, d0, d1
; CHECK-ISEL-NEXT:    bif v0.8b, v1.8b, v2.8b
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: smax1i64:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    fmov x8, d0
; CHECK-GLOBAL-NEXT:    fmov x9, d1
; CHECK-GLOBAL-NEXT:    cmp x8, x9
; CHECK-GLOBAL-NEXT:    fcsel d0, d0, d1, gt
; CHECK-GLOBAL-NEXT:    ret
  %c = call <1 x i64> @llvm.smax.v1i64(<1 x i64> %a, <1 x i64> %b)
  ret <1 x i64> %c
}

declare <2 x i64> @llvm.smax.v2i64(<2 x i64> %a, <2 x i64> %b) readnone

define <2 x i64> @smax2i64(<2 x i64> %a, <2 x i64> %b) {
; CHECK-ISEL-LABEL: smax2i64:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    cmgt v2.2d, v0.2d, v1.2d
; CHECK-ISEL-NEXT:    bif v0.16b, v1.16b, v2.16b
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: smax2i64:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    cmgt v2.2d, v0.2d, v1.2d
; CHECK-GLOBAL-NEXT:    shl v2.2d, v2.2d, #63
; CHECK-GLOBAL-NEXT:    sshr v2.2d, v2.2d, #63
; CHECK-GLOBAL-NEXT:    bif v0.16b, v1.16b, v2.16b
; CHECK-GLOBAL-NEXT:    ret
  %c = call <2 x i64> @llvm.smax.v2i64(<2 x i64> %a, <2 x i64> %b)
  ret <2 x i64> %c
}

declare <4 x i64> @llvm.smax.v4i64(<4 x i64> %a, <4 x i64> %b) readnone

define void @smax4i64(<4 x i64> %a, <4 x i64> %b, <4 x i64>* %p) {
; CHECK-ISEL-LABEL: smax4i64:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    cmgt v4.2d, v1.2d, v3.2d
; CHECK-ISEL-NEXT:    cmgt v5.2d, v0.2d, v2.2d
; CHECK-ISEL-NEXT:    bif v1.16b, v3.16b, v4.16b
; CHECK-ISEL-NEXT:    bif v0.16b, v2.16b, v5.16b
; CHECK-ISEL-NEXT:    stp q0, q1, [x0]
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: smax4i64:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    cmgt v4.2d, v0.2d, v2.2d
; CHECK-GLOBAL-NEXT:    cmgt v5.2d, v1.2d, v3.2d
; CHECK-GLOBAL-NEXT:    shl v4.2d, v4.2d, #63
; CHECK-GLOBAL-NEXT:    shl v5.2d, v5.2d, #63
; CHECK-GLOBAL-NEXT:    sshr v4.2d, v4.2d, #63
; CHECK-GLOBAL-NEXT:    sshr v5.2d, v5.2d, #63
; CHECK-GLOBAL-NEXT:    bif v0.16b, v2.16b, v4.16b
; CHECK-GLOBAL-NEXT:    bif v1.16b, v3.16b, v5.16b
; CHECK-GLOBAL-NEXT:    stp q0, q1, [x0]
; CHECK-GLOBAL-NEXT:    ret
  %c = call <4 x i64> @llvm.smax.v4i64(<4 x i64> %a, <4 x i64> %b)
  store <4 x i64> %c, <4 x i64>* %p
  ret void
}

declare i8 @llvm.umax.i8(i8 %a, i8 %b) readnone

define i8 @umaxi8(i8 %a, i8 %b) {
; CHECK-ISEL-LABEL: umaxi8:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    and w8, w1, #0xff
; CHECK-ISEL-NEXT:    and w9, w0, #0xff
; CHECK-ISEL-NEXT:    cmp w9, w8
; CHECK-ISEL-NEXT:    csel w0, w9, w8, hi
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: umaxi8:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    and w8, w0, #0xff
; CHECK-GLOBAL-NEXT:    cmp w8, w1, uxtb
; CHECK-GLOBAL-NEXT:    csel w0, w0, w1, hi
; CHECK-GLOBAL-NEXT:    ret
  %c = call i8 @llvm.umax.i8(i8 %a, i8 %b)
  ret i8 %c
}

declare i16 @llvm.umax.i16(i16 %a, i16 %b) readnone

define i16 @umaxi16(i16 %a, i16 %b) {
; CHECK-ISEL-LABEL: umaxi16:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    and w8, w1, #0xffff
; CHECK-ISEL-NEXT:    and w9, w0, #0xffff
; CHECK-ISEL-NEXT:    cmp w9, w8
; CHECK-ISEL-NEXT:    csel w0, w9, w8, hi
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: umaxi16:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    and w8, w0, #0xffff
; CHECK-GLOBAL-NEXT:    cmp w8, w1, uxth
; CHECK-GLOBAL-NEXT:    csel w0, w0, w1, hi
; CHECK-GLOBAL-NEXT:    ret
  %c = call i16 @llvm.umax.i16(i16 %a, i16 %b)
  ret i16 %c
}

declare i32 @llvm.umax.i32(i32 %a, i32 %b) readnone

define i32 @umaxi32(i32 %a, i32 %b) {
; CHECK-LABEL: umaxi32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp w0, w1
; CHECK-NEXT:    csel w0, w0, w1, hi
; CHECK-NEXT:    ret
  %c = call i32 @llvm.umax.i32(i32 %a, i32 %b)
  ret i32 %c
}

declare i64 @llvm.umax.i64(i64 %a, i64 %b) readnone

define i64 @umaxi64(i64 %a, i64 %b) {
; CHECK-LABEL: umaxi64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp x0, x1
; CHECK-NEXT:    csel x0, x0, x1, hi
; CHECK-NEXT:    ret
  %c = call i64 @llvm.umax.i64(i64 %a, i64 %b)
  ret i64 %c
}

declare <8 x i8> @llvm.umax.v8i8(<8 x i8> %a, <8 x i8> %b) readnone

define <8 x i8> @umax8i8(<8 x i8> %a, <8 x i8> %b) {
; CHECK-LABEL: umax8i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umax v0.8b, v0.8b, v1.8b
; CHECK-NEXT:    ret
  %c = call <8 x i8> @llvm.umax.v8i8(<8 x i8> %a, <8 x i8> %b)
  ret <8 x i8> %c
}

declare <16 x i8> @llvm.umax.v16i8(<16 x i8> %a, <16 x i8> %b) readnone

define <16 x i8> @umax16i8(<16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: umax16i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umax v0.16b, v0.16b, v1.16b
; CHECK-NEXT:    ret
  %c = call <16 x i8> @llvm.umax.v16i8(<16 x i8> %a, <16 x i8> %b)
  ret <16 x i8> %c
}

declare <32 x i8> @llvm.umax.v32i8(<32 x i8> %a, <32 x i8> %b) readnone

define void @umax32i8(<32 x i8> %a, <32 x i8> %b, <32 x i8>* %p) {
; CHECK-ISEL-LABEL: umax32i8:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    umax v1.16b, v1.16b, v3.16b
; CHECK-ISEL-NEXT:    umax v0.16b, v0.16b, v2.16b
; CHECK-ISEL-NEXT:    stp q0, q1, [x0]
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: umax32i8:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    umax v0.16b, v0.16b, v2.16b
; CHECK-GLOBAL-NEXT:    umax v1.16b, v1.16b, v3.16b
; CHECK-GLOBAL-NEXT:    stp q0, q1, [x0]
; CHECK-GLOBAL-NEXT:    ret
  %c = call <32 x i8> @llvm.umax.v32i8(<32 x i8> %a, <32 x i8> %b)
  store <32 x i8> %c, <32 x i8>* %p
  ret void
}

declare <4 x i16> @llvm.umax.v4i16(<4 x i16> %a, <4 x i16> %b) readnone

define <4 x i16> @umax4i16(<4 x i16> %a, <4 x i16> %b) {
; CHECK-LABEL: umax4i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umax v0.4h, v0.4h, v1.4h
; CHECK-NEXT:    ret
  %c = call <4 x i16> @llvm.umax.v4i16(<4 x i16> %a, <4 x i16> %b)
  ret <4 x i16> %c
}

declare <8 x i16> @llvm.umax.v8i16(<8 x i16> %a, <8 x i16> %b) readnone

define <8 x i16> @umax8i16(<8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: umax8i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umax v0.8h, v0.8h, v1.8h
; CHECK-NEXT:    ret
  %c = call <8 x i16> @llvm.umax.v8i16(<8 x i16> %a, <8 x i16> %b)
  ret <8 x i16> %c
}

declare <16 x i16> @llvm.umax.v16i16(<16 x i16> %a, <16 x i16> %b) readnone

define void @umax16i16(<16 x i16> %a, <16 x i16> %b, <16 x i16>* %p) {
; CHECK-ISEL-LABEL: umax16i16:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    umax v1.8h, v1.8h, v3.8h
; CHECK-ISEL-NEXT:    umax v0.8h, v0.8h, v2.8h
; CHECK-ISEL-NEXT:    stp q0, q1, [x0]
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: umax16i16:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    umax v0.8h, v0.8h, v2.8h
; CHECK-GLOBAL-NEXT:    umax v1.8h, v1.8h, v3.8h
; CHECK-GLOBAL-NEXT:    stp q0, q1, [x0]
; CHECK-GLOBAL-NEXT:    ret
  %c = call <16 x i16> @llvm.umax.v16i16(<16 x i16> %a, <16 x i16> %b)
  store <16 x i16> %c, <16 x i16>* %p
  ret void
}

declare <2 x i32> @llvm.umax.v2i32(<2 x i32> %a, <2 x i32> %b) readnone

define <2 x i32> @umax2i32(<2 x i32> %a, <2 x i32> %b) {
; CHECK-LABEL: umax2i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umax v0.2s, v0.2s, v1.2s
; CHECK-NEXT:    ret
  %c = call <2 x i32> @llvm.umax.v2i32(<2 x i32> %a, <2 x i32> %b)
  ret <2 x i32> %c
}

declare <4 x i32> @llvm.umax.v4i32(<4 x i32> %a, <4 x i32> %b) readnone

define <4 x i32> @umax4i32(<4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: umax4i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umax v0.4s, v0.4s, v1.4s
; CHECK-NEXT:    ret
  %c = call <4 x i32> @llvm.umax.v4i32(<4 x i32> %a, <4 x i32> %b)
  ret <4 x i32> %c
}

declare <8 x i32> @llvm.umax.v8i32(<8 x i32> %a, <8 x i32> %b) readnone

define void @umax8i32(<8 x i32> %a, <8 x i32> %b, <8 x i32>* %p) {
; CHECK-ISEL-LABEL: umax8i32:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    umax v1.4s, v1.4s, v3.4s
; CHECK-ISEL-NEXT:    umax v0.4s, v0.4s, v2.4s
; CHECK-ISEL-NEXT:    stp q0, q1, [x0]
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: umax8i32:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    umax v0.4s, v0.4s, v2.4s
; CHECK-GLOBAL-NEXT:    umax v1.4s, v1.4s, v3.4s
; CHECK-GLOBAL-NEXT:    stp q0, q1, [x0]
; CHECK-GLOBAL-NEXT:    ret
  %c = call <8 x i32>@llvm.umax.v8i32(<8 x i32> %a, <8 x i32> %b)
  store <8 x i32> %c, <8 x i32>* %p
  ret void
}

declare <1 x i64> @llvm.umax.v1i64(<1 x i64> %a, <1 x i64> %b) readnone

define <1 x i64> @umax1i64(<1 x i64> %a, <1 x i64> %b) {
; CHECK-ISEL-LABEL: umax1i64:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    cmhi d2, d0, d1
; CHECK-ISEL-NEXT:    bif v0.8b, v1.8b, v2.8b
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: umax1i64:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    fmov x8, d0
; CHECK-GLOBAL-NEXT:    fmov x9, d1
; CHECK-GLOBAL-NEXT:    cmp x8, x9
; CHECK-GLOBAL-NEXT:    fcsel d0, d0, d1, hi
; CHECK-GLOBAL-NEXT:    ret
  %c = call <1 x i64> @llvm.umax.v1i64(<1 x i64> %a, <1 x i64> %b)
  ret <1 x i64> %c
}

declare <2 x i64> @llvm.umax.v2i64(<2 x i64> %a, <2 x i64> %b) readnone

define <2 x i64> @umax2i64(<2 x i64> %a, <2 x i64> %b) {
; CHECK-ISEL-LABEL: umax2i64:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    cmhi v2.2d, v0.2d, v1.2d
; CHECK-ISEL-NEXT:    bif v0.16b, v1.16b, v2.16b
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: umax2i64:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    cmhi v2.2d, v0.2d, v1.2d
; CHECK-GLOBAL-NEXT:    shl v2.2d, v2.2d, #63
; CHECK-GLOBAL-NEXT:    sshr v2.2d, v2.2d, #63
; CHECK-GLOBAL-NEXT:    bif v0.16b, v1.16b, v2.16b
; CHECK-GLOBAL-NEXT:    ret
  %c = call <2 x i64> @llvm.umax.v2i64(<2 x i64> %a, <2 x i64> %b)
  ret <2 x i64> %c
}

declare <4 x i64> @llvm.umax.v4i64(<4 x i64> %a, <4 x i64> %b) readnone

define void @umax4i64(<4 x i64> %a, <4 x i64> %b, <4 x i64>* %p) {
; CHECK-ISEL-LABEL: umax4i64:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    cmhi v4.2d, v1.2d, v3.2d
; CHECK-ISEL-NEXT:    cmhi v5.2d, v0.2d, v2.2d
; CHECK-ISEL-NEXT:    bif v1.16b, v3.16b, v4.16b
; CHECK-ISEL-NEXT:    bif v0.16b, v2.16b, v5.16b
; CHECK-ISEL-NEXT:    stp q0, q1, [x0]
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: umax4i64:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    cmhi v4.2d, v0.2d, v2.2d
; CHECK-GLOBAL-NEXT:    cmhi v5.2d, v1.2d, v3.2d
; CHECK-GLOBAL-NEXT:    shl v4.2d, v4.2d, #63
; CHECK-GLOBAL-NEXT:    shl v5.2d, v5.2d, #63
; CHECK-GLOBAL-NEXT:    sshr v4.2d, v4.2d, #63
; CHECK-GLOBAL-NEXT:    sshr v5.2d, v5.2d, #63
; CHECK-GLOBAL-NEXT:    bif v0.16b, v2.16b, v4.16b
; CHECK-GLOBAL-NEXT:    bif v1.16b, v3.16b, v5.16b
; CHECK-GLOBAL-NEXT:    stp q0, q1, [x0]
; CHECK-GLOBAL-NEXT:    ret
  %c = call <4 x i64> @llvm.umax.v4i64(<4 x i64> %a, <4 x i64> %b)
  store <4 x i64> %c, <4 x i64>* %p
  ret void
}

declare i8 @llvm.smin.i8(i8 %a, i8 %b) readnone

define i8 @smini8(i8 %a, i8 %b) {
; CHECK-ISEL-LABEL: smini8:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    sxtb w8, w1
; CHECK-ISEL-NEXT:    sxtb w9, w0
; CHECK-ISEL-NEXT:    cmp w9, w8
; CHECK-ISEL-NEXT:    csel w0, w9, w8, lt
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: smini8:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    sxtb w8, w0
; CHECK-GLOBAL-NEXT:    cmp w8, w1, sxtb
; CHECK-GLOBAL-NEXT:    csel w0, w0, w1, lt
; CHECK-GLOBAL-NEXT:    ret
  %c = call i8 @llvm.smin.i8(i8 %a, i8 %b)
  ret i8 %c
}

declare i16 @llvm.smin.i16(i16 %a, i16 %b) readnone

define i16 @smini16(i16 %a, i16 %b) {
; CHECK-ISEL-LABEL: smini16:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    sxth w8, w1
; CHECK-ISEL-NEXT:    sxth w9, w0
; CHECK-ISEL-NEXT:    cmp w9, w8
; CHECK-ISEL-NEXT:    csel w0, w9, w8, lt
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: smini16:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    sxth w8, w0
; CHECK-GLOBAL-NEXT:    cmp w8, w1, sxth
; CHECK-GLOBAL-NEXT:    csel w0, w0, w1, lt
; CHECK-GLOBAL-NEXT:    ret
  %c = call i16 @llvm.smin.i16(i16 %a, i16 %b)
  ret i16 %c
}

declare i32 @llvm.smin.i32(i32 %a, i32 %b) readnone

define i32 @smini32(i32 %a, i32 %b) {
; CHECK-LABEL: smini32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp w0, w1
; CHECK-NEXT:    csel w0, w0, w1, lt
; CHECK-NEXT:    ret
  %c = call i32 @llvm.smin.i32(i32 %a, i32 %b)
  ret i32 %c
}

declare i64 @llvm.smin.i64(i64 %a, i64 %b) readnone

define i64 @smini64(i64 %a, i64 %b) {
; CHECK-LABEL: smini64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp x0, x1
; CHECK-NEXT:    csel x0, x0, x1, lt
; CHECK-NEXT:    ret
  %c = call i64 @llvm.smin.i64(i64 %a, i64 %b)
  ret i64 %c
}

declare <8 x i8> @llvm.smin.v8i8(<8 x i8> %a, <8 x i8> %b) readnone

define <8 x i8> @smin8i8(<8 x i8> %a, <8 x i8> %b) {
; CHECK-LABEL: smin8i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smin v0.8b, v0.8b, v1.8b
; CHECK-NEXT:    ret
  %c = call <8 x i8> @llvm.smin.v8i8(<8 x i8> %a, <8 x i8> %b)
  ret <8 x i8> %c
}

declare <16 x i8> @llvm.smin.v16i8(<16 x i8> %a, <16 x i8> %b) readnone

define <16 x i8> @smin16i8(<16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: smin16i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smin v0.16b, v0.16b, v1.16b
; CHECK-NEXT:    ret
  %c = call <16 x i8> @llvm.smin.v16i8(<16 x i8> %a, <16 x i8> %b)
  ret <16 x i8> %c
}

declare <32 x i8> @llvm.smin.v32i8(<32 x i8> %a, <32 x i8> %b) readnone

define void @smin32i8(<32 x i8> %a, <32 x i8> %b, <32 x i8>* %p) {
; CHECK-ISEL-LABEL: smin32i8:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    smin v1.16b, v1.16b, v3.16b
; CHECK-ISEL-NEXT:    smin v0.16b, v0.16b, v2.16b
; CHECK-ISEL-NEXT:    stp q0, q1, [x0]
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: smin32i8:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    smin v0.16b, v0.16b, v2.16b
; CHECK-GLOBAL-NEXT:    smin v1.16b, v1.16b, v3.16b
; CHECK-GLOBAL-NEXT:    stp q0, q1, [x0]
; CHECK-GLOBAL-NEXT:    ret
  %c = call <32 x i8> @llvm.smin.v32i8(<32 x i8> %a, <32 x i8> %b)
  store <32 x i8> %c, <32 x i8>* %p
  ret void
}

declare <4 x i16> @llvm.smin.v4i16(<4 x i16> %a, <4 x i16> %b) readnone

define <4 x i16> @smin4i16(<4 x i16> %a, <4 x i16> %b) {
; CHECK-LABEL: smin4i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smin v0.4h, v0.4h, v1.4h
; CHECK-NEXT:    ret
  %c = call <4 x i16> @llvm.smin.v4i16(<4 x i16> %a, <4 x i16> %b)
  ret <4 x i16> %c
}

declare <8 x i16> @llvm.smin.v8i16(<8 x i16> %a, <8 x i16> %b) readnone

define <8 x i16> @smin8i16(<8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: smin8i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smin v0.8h, v0.8h, v1.8h
; CHECK-NEXT:    ret
  %c = call <8 x i16> @llvm.smin.v8i16(<8 x i16> %a, <8 x i16> %b)
  ret <8 x i16> %c
}

declare <16 x i16> @llvm.smin.v16i16(<16 x i16> %a, <16 x i16> %b) readnone

define void @smin16i16(<16 x i16> %a, <16 x i16> %b, <16 x i16>* %p) {
; CHECK-ISEL-LABEL: smin16i16:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    smin v1.8h, v1.8h, v3.8h
; CHECK-ISEL-NEXT:    smin v0.8h, v0.8h, v2.8h
; CHECK-ISEL-NEXT:    stp q0, q1, [x0]
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: smin16i16:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    smin v0.8h, v0.8h, v2.8h
; CHECK-GLOBAL-NEXT:    smin v1.8h, v1.8h, v3.8h
; CHECK-GLOBAL-NEXT:    stp q0, q1, [x0]
; CHECK-GLOBAL-NEXT:    ret
  %c = call <16 x i16> @llvm.smin.v16i16(<16 x i16> %a, <16 x i16> %b)
  store <16 x i16> %c, <16 x i16>* %p
  ret void
}

declare <2 x i32> @llvm.smin.v2i32(<2 x i32> %a, <2 x i32> %b) readnone

define <2 x i32> @smin2i32(<2 x i32> %a, <2 x i32> %b) {
; CHECK-LABEL: smin2i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smin v0.2s, v0.2s, v1.2s
; CHECK-NEXT:    ret
  %c = call <2 x i32> @llvm.smin.v2i32(<2 x i32> %a, <2 x i32> %b)
  ret <2 x i32> %c
}

declare <4 x i32> @llvm.smin.v4i32(<4 x i32> %a, <4 x i32> %b) readnone

define <4 x i32> @smin4i32(<4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: smin4i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    smin v0.4s, v0.4s, v1.4s
; CHECK-NEXT:    ret
  %c = call <4 x i32> @llvm.smin.v4i32(<4 x i32> %a, <4 x i32> %b)
  ret <4 x i32> %c
}

declare <8 x i32> @llvm.smin.v8i32(<8 x i32> %a, <8 x i32> %b) readnone

define void @smin8i32(<8 x i32> %a, <8 x i32> %b, <8 x i32>* %p) {
; CHECK-ISEL-LABEL: smin8i32:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    smin v1.4s, v1.4s, v3.4s
; CHECK-ISEL-NEXT:    smin v0.4s, v0.4s, v2.4s
; CHECK-ISEL-NEXT:    stp q0, q1, [x0]
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: smin8i32:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    smin v0.4s, v0.4s, v2.4s
; CHECK-GLOBAL-NEXT:    smin v1.4s, v1.4s, v3.4s
; CHECK-GLOBAL-NEXT:    stp q0, q1, [x0]
; CHECK-GLOBAL-NEXT:    ret
  %c = call <8 x i32>@llvm.smin.v8i32(<8 x i32> %a, <8 x i32> %b)
  store <8 x i32> %c, <8 x i32>* %p
  ret void
}

declare <1 x i64> @llvm.smin.v1i64(<1 x i64> %a, <1 x i64> %b) readnone

define <1 x i64> @smin1i64(<1 x i64> %a, <1 x i64> %b) {
; CHECK-ISEL-LABEL: smin1i64:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    cmgt d2, d1, d0
; CHECK-ISEL-NEXT:    bif v0.8b, v1.8b, v2.8b
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: smin1i64:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    fmov x8, d0
; CHECK-GLOBAL-NEXT:    fmov x9, d1
; CHECK-GLOBAL-NEXT:    cmp x8, x9
; CHECK-GLOBAL-NEXT:    fcsel d0, d0, d1, lt
; CHECK-GLOBAL-NEXT:    ret
  %c = call <1 x i64> @llvm.smin.v1i64(<1 x i64> %a, <1 x i64> %b)
  ret <1 x i64> %c
}

declare <2 x i64> @llvm.smin.v2i64(<2 x i64> %a, <2 x i64> %b) readnone

define <2 x i64> @smin2i64(<2 x i64> %a, <2 x i64> %b) {
; CHECK-ISEL-LABEL: smin2i64:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    cmgt v2.2d, v1.2d, v0.2d
; CHECK-ISEL-NEXT:    bif v0.16b, v1.16b, v2.16b
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: smin2i64:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    cmgt v2.2d, v1.2d, v0.2d
; CHECK-GLOBAL-NEXT:    shl v2.2d, v2.2d, #63
; CHECK-GLOBAL-NEXT:    sshr v2.2d, v2.2d, #63
; CHECK-GLOBAL-NEXT:    bif v0.16b, v1.16b, v2.16b
; CHECK-GLOBAL-NEXT:    ret
  %c = call <2 x i64> @llvm.smin.v2i64(<2 x i64> %a, <2 x i64> %b)
  ret <2 x i64> %c
}

declare <4 x i64> @llvm.smin.v4i64(<4 x i64> %a, <4 x i64> %b) readnone

define void @smin4i64(<4 x i64> %a, <4 x i64> %b, <4 x i64>* %p) {
; CHECK-ISEL-LABEL: smin4i64:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    cmgt v4.2d, v3.2d, v1.2d
; CHECK-ISEL-NEXT:    cmgt v5.2d, v2.2d, v0.2d
; CHECK-ISEL-NEXT:    bif v1.16b, v3.16b, v4.16b
; CHECK-ISEL-NEXT:    bif v0.16b, v2.16b, v5.16b
; CHECK-ISEL-NEXT:    stp q0, q1, [x0]
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: smin4i64:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    cmgt v4.2d, v2.2d, v0.2d
; CHECK-GLOBAL-NEXT:    cmgt v5.2d, v3.2d, v1.2d
; CHECK-GLOBAL-NEXT:    shl v4.2d, v4.2d, #63
; CHECK-GLOBAL-NEXT:    shl v5.2d, v5.2d, #63
; CHECK-GLOBAL-NEXT:    sshr v4.2d, v4.2d, #63
; CHECK-GLOBAL-NEXT:    sshr v5.2d, v5.2d, #63
; CHECK-GLOBAL-NEXT:    bif v0.16b, v2.16b, v4.16b
; CHECK-GLOBAL-NEXT:    bif v1.16b, v3.16b, v5.16b
; CHECK-GLOBAL-NEXT:    stp q0, q1, [x0]
; CHECK-GLOBAL-NEXT:    ret
  %c = call <4 x i64> @llvm.smin.v4i64(<4 x i64> %a, <4 x i64> %b)
  store <4 x i64> %c, <4 x i64>* %p
  ret void
}

declare i8 @llvm.umin.i8(i8 %a, i8 %b) readnone

define i8 @umini8(i8 %a, i8 %b) {
; CHECK-ISEL-LABEL: umini8:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    and w8, w1, #0xff
; CHECK-ISEL-NEXT:    and w9, w0, #0xff
; CHECK-ISEL-NEXT:    cmp w9, w8
; CHECK-ISEL-NEXT:    csel w0, w9, w8, lo
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: umini8:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    and w8, w0, #0xff
; CHECK-GLOBAL-NEXT:    cmp w8, w1, uxtb
; CHECK-GLOBAL-NEXT:    csel w0, w0, w1, lo
; CHECK-GLOBAL-NEXT:    ret
  %c = call i8 @llvm.umin.i8(i8 %a, i8 %b)
  ret i8 %c
}

declare i16 @llvm.umin.i16(i16 %a, i16 %b) readnone

define i16 @umini16(i16 %a, i16 %b) {
; CHECK-ISEL-LABEL: umini16:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    and w8, w1, #0xffff
; CHECK-ISEL-NEXT:    and w9, w0, #0xffff
; CHECK-ISEL-NEXT:    cmp w9, w8
; CHECK-ISEL-NEXT:    csel w0, w9, w8, lo
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: umini16:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    and w8, w0, #0xffff
; CHECK-GLOBAL-NEXT:    cmp w8, w1, uxth
; CHECK-GLOBAL-NEXT:    csel w0, w0, w1, lo
; CHECK-GLOBAL-NEXT:    ret
  %c = call i16 @llvm.umin.i16(i16 %a, i16 %b)
  ret i16 %c
}

declare i32 @llvm.umin.i32(i32 %a, i32 %b) readnone

define i32 @umini32(i32 %a, i32 %b) {
; CHECK-LABEL: umini32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp w0, w1
; CHECK-NEXT:    csel w0, w0, w1, lo
; CHECK-NEXT:    ret
  %c = call i32 @llvm.umin.i32(i32 %a, i32 %b)
  ret i32 %c
}

declare i64 @llvm.umin.i64(i64 %a, i64 %b) readnone

define i64 @umini64(i64 %a, i64 %b) {
; CHECK-LABEL: umini64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    cmp x0, x1
; CHECK-NEXT:    csel x0, x0, x1, lo
; CHECK-NEXT:    ret
  %c = call i64 @llvm.umin.i64(i64 %a, i64 %b)
  ret i64 %c
}

declare <8 x i8> @llvm.umin.v8i8(<8 x i8> %a, <8 x i8> %b) readnone

define <8 x i8> @umin8i8(<8 x i8> %a, <8 x i8> %b) {
; CHECK-LABEL: umin8i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umin v0.8b, v0.8b, v1.8b
; CHECK-NEXT:    ret
  %c = call <8 x i8> @llvm.umin.v8i8(<8 x i8> %a, <8 x i8> %b)
  ret <8 x i8> %c
}

declare <16 x i8> @llvm.umin.v16i8(<16 x i8> %a, <16 x i8> %b) readnone

define <16 x i8> @umin16i8(<16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: umin16i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umin v0.16b, v0.16b, v1.16b
; CHECK-NEXT:    ret
  %c = call <16 x i8> @llvm.umin.v16i8(<16 x i8> %a, <16 x i8> %b)
  ret <16 x i8> %c
}

declare <32 x i8> @llvm.umin.v32i8(<32 x i8> %a, <32 x i8> %b) readnone

define void @umin32i8(<32 x i8> %a, <32 x i8> %b, <32 x i8>* %p) {
; CHECK-ISEL-LABEL: umin32i8:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    umin v1.16b, v1.16b, v3.16b
; CHECK-ISEL-NEXT:    umin v0.16b, v0.16b, v2.16b
; CHECK-ISEL-NEXT:    stp q0, q1, [x0]
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: umin32i8:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    umin v0.16b, v0.16b, v2.16b
; CHECK-GLOBAL-NEXT:    umin v1.16b, v1.16b, v3.16b
; CHECK-GLOBAL-NEXT:    stp q0, q1, [x0]
; CHECK-GLOBAL-NEXT:    ret
  %c = call <32 x i8> @llvm.umin.v32i8(<32 x i8> %a, <32 x i8> %b)
  store <32 x i8> %c, <32 x i8>* %p
  ret void
}

declare <4 x i16> @llvm.umin.v4i16(<4 x i16> %a, <4 x i16> %b) readnone

define <4 x i16> @umin4i16(<4 x i16> %a, <4 x i16> %b) {
; CHECK-LABEL: umin4i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umin v0.4h, v0.4h, v1.4h
; CHECK-NEXT:    ret
  %c = call <4 x i16> @llvm.umin.v4i16(<4 x i16> %a, <4 x i16> %b)
  ret <4 x i16> %c
}

declare <8 x i16> @llvm.umin.v8i16(<8 x i16> %a, <8 x i16> %b) readnone

define <8 x i16> @umin8i16(<8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: umin8i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umin v0.8h, v0.8h, v1.8h
; CHECK-NEXT:    ret
  %c = call <8 x i16> @llvm.umin.v8i16(<8 x i16> %a, <8 x i16> %b)
  ret <8 x i16> %c
}

declare <16 x i16> @llvm.umin.v16i16(<16 x i16> %a, <16 x i16> %b) readnone

define void @umin16i16(<16 x i16> %a, <16 x i16> %b, <16 x i16>* %p) {
; CHECK-ISEL-LABEL: umin16i16:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    umin v1.8h, v1.8h, v3.8h
; CHECK-ISEL-NEXT:    umin v0.8h, v0.8h, v2.8h
; CHECK-ISEL-NEXT:    stp q0, q1, [x0]
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: umin16i16:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    umin v0.8h, v0.8h, v2.8h
; CHECK-GLOBAL-NEXT:    umin v1.8h, v1.8h, v3.8h
; CHECK-GLOBAL-NEXT:    stp q0, q1, [x0]
; CHECK-GLOBAL-NEXT:    ret
  %c = call <16 x i16> @llvm.umin.v16i16(<16 x i16> %a, <16 x i16> %b)
  store <16 x i16> %c, <16 x i16>* %p
  ret void
}

declare <2 x i32> @llvm.umin.v2i32(<2 x i32> %a, <2 x i32> %b) readnone

define <2 x i32> @umin2i32(<2 x i32> %a, <2 x i32> %b) {
; CHECK-LABEL: umin2i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umin v0.2s, v0.2s, v1.2s
; CHECK-NEXT:    ret
  %c = call <2 x i32> @llvm.umin.v2i32(<2 x i32> %a, <2 x i32> %b)
  ret <2 x i32> %c
}

declare <4 x i32> @llvm.umin.v4i32(<4 x i32> %a, <4 x i32> %b) readnone

define <4 x i32> @umin4i32(<4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: umin4i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    umin v0.4s, v0.4s, v1.4s
; CHECK-NEXT:    ret
  %c = call <4 x i32> @llvm.umin.v4i32(<4 x i32> %a, <4 x i32> %b)
  ret <4 x i32> %c
}

declare <8 x i32> @llvm.umin.v8i32(<8 x i32> %a, <8 x i32> %b) readnone

define void @umin8i32(<8 x i32> %a, <8 x i32> %b, <8 x i32>* %p) {
; CHECK-ISEL-LABEL: umin8i32:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    umin v1.4s, v1.4s, v3.4s
; CHECK-ISEL-NEXT:    umin v0.4s, v0.4s, v2.4s
; CHECK-ISEL-NEXT:    stp q0, q1, [x0]
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: umin8i32:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    umin v0.4s, v0.4s, v2.4s
; CHECK-GLOBAL-NEXT:    umin v1.4s, v1.4s, v3.4s
; CHECK-GLOBAL-NEXT:    stp q0, q1, [x0]
; CHECK-GLOBAL-NEXT:    ret
  %c = call <8 x i32>@llvm.umin.v8i32(<8 x i32> %a, <8 x i32> %b)
  store <8 x i32> %c, <8 x i32>* %p
  ret void
}

declare <1 x i64> @llvm.umin.v1i64(<1 x i64> %a, <1 x i64> %b) readnone

define <1 x i64> @umin1i64(<1 x i64> %a, <1 x i64> %b) {
; CHECK-ISEL-LABEL: umin1i64:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    cmhi d2, d1, d0
; CHECK-ISEL-NEXT:    bif v0.8b, v1.8b, v2.8b
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: umin1i64:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    fmov x8, d0
; CHECK-GLOBAL-NEXT:    fmov x9, d1
; CHECK-GLOBAL-NEXT:    cmp x8, x9
; CHECK-GLOBAL-NEXT:    fcsel d0, d0, d1, lo
; CHECK-GLOBAL-NEXT:    ret
  %c = call <1 x i64> @llvm.umin.v1i64(<1 x i64> %a, <1 x i64> %b)
  ret <1 x i64> %c
}

declare <2 x i64> @llvm.umin.v2i64(<2 x i64> %a, <2 x i64> %b) readnone

define <2 x i64> @umin2i64(<2 x i64> %a, <2 x i64> %b) {
; CHECK-ISEL-LABEL: umin2i64:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    cmhi v2.2d, v1.2d, v0.2d
; CHECK-ISEL-NEXT:    bif v0.16b, v1.16b, v2.16b
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: umin2i64:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    cmhi v2.2d, v1.2d, v0.2d
; CHECK-GLOBAL-NEXT:    shl v2.2d, v2.2d, #63
; CHECK-GLOBAL-NEXT:    sshr v2.2d, v2.2d, #63
; CHECK-GLOBAL-NEXT:    bif v0.16b, v1.16b, v2.16b
; CHECK-GLOBAL-NEXT:    ret
  %c = call <2 x i64> @llvm.umin.v2i64(<2 x i64> %a, <2 x i64> %b)
  ret <2 x i64> %c
}

declare <4 x i64> @llvm.umin.v4i64(<4 x i64> %a, <4 x i64> %b) readnone

define void @umin4i64(<4 x i64> %a, <4 x i64> %b, <4 x i64>* %p) {
; CHECK-ISEL-LABEL: umin4i64:
; CHECK-ISEL:       // %bb.0:
; CHECK-ISEL-NEXT:    cmhi v4.2d, v3.2d, v1.2d
; CHECK-ISEL-NEXT:    cmhi v5.2d, v2.2d, v0.2d
; CHECK-ISEL-NEXT:    bif v1.16b, v3.16b, v4.16b
; CHECK-ISEL-NEXT:    bif v0.16b, v2.16b, v5.16b
; CHECK-ISEL-NEXT:    stp q0, q1, [x0]
; CHECK-ISEL-NEXT:    ret
;
; CHECK-GLOBAL-LABEL: umin4i64:
; CHECK-GLOBAL:       // %bb.0:
; CHECK-GLOBAL-NEXT:    cmhi v4.2d, v2.2d, v0.2d
; CHECK-GLOBAL-NEXT:    cmhi v5.2d, v3.2d, v1.2d
; CHECK-GLOBAL-NEXT:    shl v4.2d, v4.2d, #63
; CHECK-GLOBAL-NEXT:    shl v5.2d, v5.2d, #63
; CHECK-GLOBAL-NEXT:    sshr v4.2d, v4.2d, #63
; CHECK-GLOBAL-NEXT:    sshr v5.2d, v5.2d, #63
; CHECK-GLOBAL-NEXT:    bif v0.16b, v2.16b, v4.16b
; CHECK-GLOBAL-NEXT:    bif v1.16b, v3.16b, v5.16b
; CHECK-GLOBAL-NEXT:    stp q0, q1, [x0]
; CHECK-GLOBAL-NEXT:    ret
  %c = call <4 x i64> @llvm.umin.v4i64(<4 x i64> %a, <4 x i64> %b)
  store <4 x i64> %c, <4 x i64>* %p
  ret void
}
