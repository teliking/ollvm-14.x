; RUN: opt -S -instcombine < %s | FileCheck %s

target triple = "aarch64-unknown-linux-gnu"

; op2 = tbl(op1 dup_x(idx)) -> op2 = vector_splat(extractelement(op1, idx))

define <vscale x 16 x i8> @dup_ext_i8(<vscale x 16 x i8> %data) #0 {
; CHECK-LABEL: @dup_ext_i8(
; CHECK-NEXT:    [[TMP1:%.*]] = extractelement <vscale x 16 x i8> [[DATA:%.*]], i8 1
; CHECK-NEXT:    [[DOTSPLATINSERT:%.*]] = insertelement <vscale x 16 x i8> poison, i8 [[TMP1]], i32 0
; CHECK-NEXT:    [[DOTSPLAT:%.*]] = shufflevector <vscale x 16 x i8> [[DOTSPLATINSERT]], <vscale x 16 x i8> poison, <vscale x 16 x i32> zeroinitializer
; CHECK-NEXT:    ret <vscale x 16 x i8> [[DOTSPLAT]]
;
  %tmp = call <vscale x 16 x i8> @llvm.aarch64.sve.dup.x.nxv16i8(i8 1)
  %out = call <vscale x 16 x i8> @llvm.aarch64.sve.tbl.nxv16i8(<vscale x 16 x i8>  %data, <vscale x 16 x i8> %tmp)
  ret <vscale x 16 x i8> %out
}

define <vscale x 8 x i16> @dup_ext_i16(<vscale x 8 x i16> %data) #0 {
; CHECK-LABEL: @dup_ext_i16(
; CHECK-NEXT:    [[TMP1:%.*]] = extractelement <vscale x 8 x i16> [[DATA:%.*]], i16 1
; CHECK-NEXT:    [[DOTSPLATINSERT:%.*]] = insertelement <vscale x 8 x i16> poison, i16 [[TMP1]], i32 0
; CHECK-NEXT:    [[DOTSPLAT:%.*]] = shufflevector <vscale x 8 x i16> [[DOTSPLATINSERT]], <vscale x 8 x i16> poison, <vscale x 8 x i32> zeroinitializer
; CHECK-NEXT:    ret <vscale x 8 x i16> [[DOTSPLAT]]
;
  %tmp = call <vscale x 8 x i16> @llvm.aarch64.sve.dup.x.nxv8i16(i16 1)
  %out = call <vscale x 8 x i16> @llvm.aarch64.sve.tbl.nxv8i16(<vscale x 8 x i16>  %data, <vscale x 8 x i16> %tmp)
  ret <vscale x 8 x i16> %out
}

define <vscale x 4 x i32> @dup_ext_i32(<vscale x 4 x i32> %data) #0 {
; CHECK-LABEL: @dup_ext_i32(
; CHECK-NEXT:    [[TMP1:%.*]] = extractelement <vscale x 4 x i32> [[DATA:%.*]], i32 1
; CHECK-NEXT:    [[DOTSPLATINSERT:%.*]] = insertelement <vscale x 4 x i32> poison, i32 [[TMP1]], i32 0
; CHECK-NEXT:    [[DOTSPLAT:%.*]] = shufflevector <vscale x 4 x i32> [[DOTSPLATINSERT]], <vscale x 4 x i32> poison, <vscale x 4 x i32> zeroinitializer
; CHECK-NEXT:    ret <vscale x 4 x i32> [[DOTSPLAT]]
;
  %tmp = call <vscale x 4 x i32> @llvm.aarch64.sve.dup.x.nxv4i32(i32 1)
  %out = call <vscale x 4 x i32> @llvm.aarch64.sve.tbl.nxv4i32(<vscale x 4 x i32>  %data, <vscale x 4 x i32> %tmp)
  ret <vscale x 4 x i32> %out
}

define <vscale x 2 x i64> @dup_ext_i64(<vscale x 2 x i64> %data) #0 {
; CHECK-LABEL: @dup_ext_i64(
; CHECK-NEXT:    [[TMP1:%.*]] = extractelement <vscale x 2 x i64> [[DATA:%.*]], i64 1
; CHECK-NEXT:    [[DOTSPLATINSERT:%.*]] = insertelement <vscale x 2 x i64> poison, i64 [[TMP1]], i32 0
; CHECK-NEXT:    [[DOTSPLAT:%.*]] = shufflevector <vscale x 2 x i64> [[DOTSPLATINSERT]], <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer
; CHECK-NEXT:    ret <vscale x 2 x i64> [[DOTSPLAT]]
;
  %tmp = call <vscale x 2 x i64> @llvm.aarch64.sve.dup.x.nxv2i64(i64 1)
  %out = call <vscale x 2 x i64> @llvm.aarch64.sve.tbl.nxv2i64(<vscale x 2 x i64>  %data, <vscale x 2 x i64> %tmp)
  ret <vscale x 2 x i64> %out
}

define <vscale x 8 x half> @dup_ext_f16(<vscale x 8 x half> %data) #0 {
; CHECK-LABEL: @dup_ext_f16(
; CHECK-NEXT:    [[TMP1:%.*]] = extractelement <vscale x 8 x half> [[DATA:%.*]], i16 1
; CHECK-NEXT:    [[DOTSPLATINSERT:%.*]] = insertelement <vscale x 8 x half> poison, half [[TMP1]], i32 0
; CHECK-NEXT:    [[DOTSPLAT:%.*]] = shufflevector <vscale x 8 x half> [[DOTSPLATINSERT]], <vscale x 8 x half> poison, <vscale x 8 x i32> zeroinitializer
; CHECK-NEXT:    ret <vscale x 8 x half> [[DOTSPLAT]]
;
  %tmp = call <vscale x 8 x i16> @llvm.aarch64.sve.dup.x.nxv8i16(i16 1)
  %out = call <vscale x 8 x half> @llvm.aarch64.sve.tbl.nxv8f16(<vscale x 8 x half>  %data, <vscale x 8 x i16> %tmp)
  ret <vscale x 8 x half> %out
}

define <vscale x 4 x float> @dup_ext_f32(<vscale x 4 x float> %data) #0 {
; CHECK-LABEL: @dup_ext_f32(
; CHECK-NEXT:    [[TMP1:%.*]] = extractelement <vscale x 4 x float> [[DATA:%.*]], i32 1
; CHECK-NEXT:    [[DOTSPLATINSERT:%.*]] = insertelement <vscale x 4 x float> poison, float [[TMP1]], i32 0
; CHECK-NEXT:    [[DOTSPLAT:%.*]] = shufflevector <vscale x 4 x float> [[DOTSPLATINSERT]], <vscale x 4 x float> poison, <vscale x 4 x i32> zeroinitializer
; CHECK-NEXT:    ret <vscale x 4 x float> [[DOTSPLAT]]
;
  %tmp = call <vscale x 4 x i32> @llvm.aarch64.sve.dup.x.nxv4i32(i32 1)
  %out = call <vscale x 4 x float> @llvm.aarch64.sve.tbl.nxv4f32(<vscale x 4 x float>  %data, <vscale x 4 x i32> %tmp)
  ret <vscale x 4 x float> %out
}

define <vscale x 2 x double> @dup_ext_f64(<vscale x 2 x double> %data) #0 {
; CHECK-LABEL: @dup_ext_f64(
; CHECK-NEXT:    [[TMP1:%.*]] = extractelement <vscale x 2 x double> [[DATA:%.*]], i64 1
; CHECK-NEXT:    [[DOTSPLATINSERT:%.*]] = insertelement <vscale x 2 x double> poison, double [[TMP1]], i32 0
; CHECK-NEXT:    [[DOTSPLAT:%.*]] = shufflevector <vscale x 2 x double> [[DOTSPLATINSERT]], <vscale x 2 x double> poison, <vscale x 2 x i32> zeroinitializer
; CHECK-NEXT:    ret <vscale x 2 x double> [[DOTSPLAT]]
;
  %tmp = call <vscale x 2 x i64> @llvm.aarch64.sve.dup.x.nxv2i64(i64 1)
  %out = call <vscale x 2 x double> @llvm.aarch64.sve.tbl.nxv2f64(<vscale x 2 x double> %data, <vscale x 2 x i64> %tmp)
  ret <vscale x 2 x double> %out
}

declare <vscale x 16 x i8> @llvm.aarch64.sve.dup.x.nxv16i8( i8)
declare <vscale x 8 x i16> @llvm.aarch64.sve.dup.x.nxv8i16(i16)
declare <vscale x 4 x i32> @llvm.aarch64.sve.dup.x.nxv4i32(i32)
declare <vscale x 2 x i64> @llvm.aarch64.sve.dup.x.nxv2i64(i64)
declare <vscale x 16 x i8> @llvm.aarch64.sve.tbl.nxv16i8( <vscale x 16 x i8>, <vscale x 16 x i8>)
declare <vscale x 8 x i16> @llvm.aarch64.sve.tbl.nxv8i16( <vscale x 8 x i16>, <vscale x 8 x i16>)
declare <vscale x 4 x i32> @llvm.aarch64.sve.tbl.nxv4i32( <vscale x 4 x i32>, <vscale x 4 x i32>)
declare <vscale x 2 x i64> @llvm.aarch64.sve.tbl.nxv2i64( <vscale x 2 x i64>, <vscale x 2 x i64>)
declare <vscale x 8 x half> @llvm.aarch64.sve.tbl.nxv8f16( <vscale x 8 x half>, <vscale x 8 x i16>)
declare <vscale x 4 x float> @llvm.aarch64.sve.tbl.nxv4f32( <vscale x 4 x float>, <vscale x 4 x i32>)
declare <vscale x 2 x double> @llvm.aarch64.sve.tbl.nxv2f64( <vscale x 2 x double>, <vscale x 2 x i64>)

attributes #0 = { "target-features"="+sve" }
