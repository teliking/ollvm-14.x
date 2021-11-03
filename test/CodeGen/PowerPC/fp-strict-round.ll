; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -verify-machineinstrs < %s -mtriple=powerpc64-unknown-linux \
; RUN:   -mcpu=pwr8 -ppc-asm-full-reg-names -ppc-vsr-nums-as-vr  | FileCheck \
; RUN:   --check-prefix=P8 %s
; RUN: llc -verify-machineinstrs < %s -mtriple=powerpc64le-unknown-linux \
; RUN:   -mcpu=pwr9 -ppc-asm-full-reg-names -ppc-vsr-nums-as-vr | FileCheck \
; RUN:   --check-prefix=P9 %s

; FIXME: Constrained fpext would fail if VSX feature disabled. Add no-vsx

declare float @llvm.experimental.constrained.ceil.f32(float, metadata)
declare double @llvm.experimental.constrained.ceil.f64(double, metadata)
declare <4 x float> @llvm.experimental.constrained.ceil.v4f32(<4 x float>, metadata)
declare <2 x double> @llvm.experimental.constrained.ceil.v2f64(<2 x double>, metadata)

declare float @llvm.experimental.constrained.floor.f32(float, metadata)
declare double @llvm.experimental.constrained.floor.f64(double, metadata)
declare <4 x float> @llvm.experimental.constrained.floor.v4f32(<4 x float>, metadata)
declare <2 x double> @llvm.experimental.constrained.floor.v2f64(<2 x double>, metadata)

declare double @llvm.experimental.constrained.nearbyint.f64(double, metadata, metadata)
declare <4 x float> @llvm.experimental.constrained.nearbyint.v4f32(<4 x float>, metadata, metadata)
declare <2 x double> @llvm.experimental.constrained.nearbyint.v2f64(<2 x double>, metadata, metadata)

declare <4 x double> @llvm.experimental.constrained.fpext.v4f64.v4f32(<4 x float>, metadata)
declare <2 x double> @llvm.experimental.constrained.fpext.v2f64.v2f32(<2 x float>, metadata)

declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata)
declare <4 x float> @llvm.experimental.constrained.fptrunc.v4f32.v4f64(<4 x double>, metadata, metadata)
declare <2 x float> @llvm.experimental.constrained.fptrunc.v2f32.v2f64(<2 x double>, metadata, metadata)

declare float @llvm.experimental.constrained.round.f32(float, metadata)
declare double @llvm.experimental.constrained.round.f64(double, metadata)
declare <4 x float> @llvm.experimental.constrained.round.v4f32(<4 x float>, metadata)
declare <2 x double> @llvm.experimental.constrained.round.v2f64(<2 x double>, metadata)

declare float @llvm.experimental.constrained.trunc.f32(float, metadata)
declare double @llvm.experimental.constrained.trunc.f64(double, metadata)
declare <4 x float> @llvm.experimental.constrained.trunc.v4f32(<4 x float>, metadata)
declare <2 x double> @llvm.experimental.constrained.trunc.v2f64(<2 x double>, metadata)

define float @ceil_f32(float %f1) {
; P8-LABEL: ceil_f32:
; P8:       # %bb.0:
; P8-NEXT:    xsrdpip f1, f1
; P8-NEXT:    blr
;
; P9-LABEL: ceil_f32:
; P9:       # %bb.0:
; P9-NEXT:    xsrdpip f1, f1
; P9-NEXT:    blr
  %res = call float @llvm.experimental.constrained.ceil.f32(
                        float %f1,
                        metadata !"fpexcept.strict")
  ret float %res
}

define double @ceil_f64(double %f1) {
; P8-LABEL: ceil_f64:
; P8:       # %bb.0:
; P8-NEXT:    xsrdpip f1, f1
; P8-NEXT:    blr
;
; P9-LABEL: ceil_f64:
; P9:       # %bb.0:
; P9-NEXT:    xsrdpip f1, f1
; P9-NEXT:    blr
  %res = call double @llvm.experimental.constrained.ceil.f64(
                        double %f1,
                        metadata !"fpexcept.strict")
  ret double %res
}

define <4 x float> @ceil_v4f32(<4 x float> %vf1) {
; P8-LABEL: ceil_v4f32:
; P8:       # %bb.0:
; P8-NEXT:    xvrspip v2, v2
; P8-NEXT:    blr
;
; P9-LABEL: ceil_v4f32:
; P9:       # %bb.0:
; P9-NEXT:    xvrspip v2, v2
; P9-NEXT:    blr
  %res = call <4 x float> @llvm.experimental.constrained.ceil.v4f32(
                        <4 x float> %vf1,
                        metadata !"fpexcept.strict")
  ret <4 x float> %res
}

define <2 x double> @ceil_v2f64(<2 x double> %vf1) {
; P8-LABEL: ceil_v2f64:
; P8:       # %bb.0:
; P8-NEXT:    xvrdpip v2, v2
; P8-NEXT:    blr
;
; P9-LABEL: ceil_v2f64:
; P9:       # %bb.0:
; P9-NEXT:    xvrdpip v2, v2
; P9-NEXT:    blr
  %res = call <2 x double> @llvm.experimental.constrained.ceil.v2f64(
                        <2 x double> %vf1,
                        metadata !"fpexcept.strict")
  ret <2 x double> %res
}

define float @floor_f32(float %f1) {
; P8-LABEL: floor_f32:
; P8:       # %bb.0:
; P8-NEXT:    xsrdpim f1, f1
; P8-NEXT:    blr
;
; P9-LABEL: floor_f32:
; P9:       # %bb.0:
; P9-NEXT:    xsrdpim f1, f1
; P9-NEXT:    blr
  %res = call float @llvm.experimental.constrained.floor.f32(
                        float %f1,
                        metadata !"fpexcept.strict")
  ret float %res
}

define double @floor_f64(double %f1) {
; P8-LABEL: floor_f64:
; P8:       # %bb.0:
; P8-NEXT:    xsrdpim f1, f1
; P8-NEXT:    blr
;
; P9-LABEL: floor_f64:
; P9:       # %bb.0:
; P9-NEXT:    xsrdpim f1, f1
; P9-NEXT:    blr
  %res = call double @llvm.experimental.constrained.floor.f64(
                        double %f1,
                        metadata !"fpexcept.strict")
  ret double %res;
}

define <4 x float> @floor_v4f32(<4 x float> %vf1) {
; P8-LABEL: floor_v4f32:
; P8:       # %bb.0:
; P8-NEXT:    xvrspim v2, v2
; P8-NEXT:    blr
;
; P9-LABEL: floor_v4f32:
; P9:       # %bb.0:
; P9-NEXT:    xvrspim v2, v2
; P9-NEXT:    blr
  %res = call <4 x float> @llvm.experimental.constrained.floor.v4f32(
                        <4 x float> %vf1,
                        metadata !"fpexcept.strict")
  ret <4 x float> %res;
}

define <2 x double> @floor_v2f64(<2 x double> %vf1) {
; P8-LABEL: floor_v2f64:
; P8:       # %bb.0:
; P8-NEXT:    xvrdpim v2, v2
; P8-NEXT:    blr
;
; P9-LABEL: floor_v2f64:
; P9:       # %bb.0:
; P9-NEXT:    xvrdpim v2, v2
; P9-NEXT:    blr
  %res = call <2 x double> @llvm.experimental.constrained.floor.v2f64(
                        <2 x double> %vf1,
                        metadata !"fpexcept.strict")
  ret <2 x double> %res;
}

define double @nearbyint_f64(double %f1, double %f2) {
; P8-LABEL: nearbyint_f64:
; P8:       # %bb.0:
; P8-NEXT:    mflr r0
; P8-NEXT:    std r0, 16(r1)
; P8-NEXT:    stdu r1, -112(r1)
; P8-NEXT:    .cfi_def_cfa_offset 112
; P8-NEXT:    .cfi_offset lr, 16
; P8-NEXT:    bl nearbyint
; P8-NEXT:    nop
; P8-NEXT:    addi r1, r1, 112
; P8-NEXT:    ld r0, 16(r1)
; P8-NEXT:    mtlr r0
; P8-NEXT:    blr
;
; P9-LABEL: nearbyint_f64:
; P9:       # %bb.0:
; P9-NEXT:    mflr r0
; P9-NEXT:    std r0, 16(r1)
; P9-NEXT:    stdu r1, -32(r1)
; P9-NEXT:    .cfi_def_cfa_offset 32
; P9-NEXT:    .cfi_offset lr, 16
; P9-NEXT:    bl nearbyint
; P9-NEXT:    nop
; P9-NEXT:    addi r1, r1, 32
; P9-NEXT:    ld r0, 16(r1)
; P9-NEXT:    mtlr r0
; P9-NEXT:    blr
  %res = call double @llvm.experimental.constrained.nearbyint.f64(
                        double %f1,
                        metadata !"round.dynamic",
                        metadata !"fpexcept.strict")
  ret double %res
}

define <4 x float> @nearbyint_v4f32(<4 x float> %vf1, <4 x float> %vf2) {
; P8-LABEL: nearbyint_v4f32:
; P8:       # %bb.0:
; P8-NEXT:    mflr r0
; P8-NEXT:    std r0, 16(r1)
; P8-NEXT:    stdu r1, -176(r1)
; P8-NEXT:    .cfi_def_cfa_offset 176
; P8-NEXT:    .cfi_offset lr, 16
; P8-NEXT:    .cfi_offset v29, -48
; P8-NEXT:    .cfi_offset v30, -32
; P8-NEXT:    .cfi_offset v31, -16
; P8-NEXT:    xxsldwi vs0, v2, v2, 3
; P8-NEXT:    li r3, 128
; P8-NEXT:    stxvd2x v29, r1, r3 # 16-byte Folded Spill
; P8-NEXT:    li r3, 144
; P8-NEXT:    stxvd2x v30, r1, r3 # 16-byte Folded Spill
; P8-NEXT:    li r3, 160
; P8-NEXT:    xscvspdpn f1, vs0
; P8-NEXT:    stxvd2x v31, r1, r3 # 16-byte Folded Spill
; P8-NEXT:    vmr v31, v2
; P8-NEXT:    bl nearbyintf
; P8-NEXT:    nop
; P8-NEXT:    xxsldwi vs0, v31, v31, 1
; P8-NEXT:    xxlor v30, f1, f1
; P8-NEXT:    xscvspdpn f1, vs0
; P8-NEXT:    bl nearbyintf
; P8-NEXT:    nop
; P8-NEXT:    # kill: def $f1 killed $f1 def $vsl1
; P8-NEXT:    xxmrghd vs0, vs1, v30
; P8-NEXT:    xscvspdpn f1, v31
; P8-NEXT:    xvcvdpsp v29, vs0
; P8-NEXT:    bl nearbyintf
; P8-NEXT:    nop
; P8-NEXT:    xxswapd vs0, v31
; P8-NEXT:    xxlor v30, f1, f1
; P8-NEXT:    xscvspdpn f1, vs0
; P8-NEXT:    bl nearbyintf
; P8-NEXT:    nop
; P8-NEXT:    # kill: def $f1 killed $f1 def $vsl1
; P8-NEXT:    xxmrghd vs0, v30, vs1
; P8-NEXT:    li r3, 160
; P8-NEXT:    lxvd2x v31, r1, r3 # 16-byte Folded Reload
; P8-NEXT:    li r3, 144
; P8-NEXT:    lxvd2x v30, r1, r3 # 16-byte Folded Reload
; P8-NEXT:    li r3, 128
; P8-NEXT:    xvcvdpsp v2, vs0
; P8-NEXT:    vmrgew v2, v2, v29
; P8-NEXT:    lxvd2x v29, r1, r3 # 16-byte Folded Reload
; P8-NEXT:    addi r1, r1, 176
; P8-NEXT:    ld r0, 16(r1)
; P8-NEXT:    mtlr r0
; P8-NEXT:    blr
;
; P9-LABEL: nearbyint_v4f32:
; P9:       # %bb.0:
; P9-NEXT:    mflr r0
; P9-NEXT:    std r0, 16(r1)
; P9-NEXT:    stdu r1, -80(r1)
; P9-NEXT:    .cfi_def_cfa_offset 80
; P9-NEXT:    .cfi_offset lr, 16
; P9-NEXT:    .cfi_offset v29, -48
; P9-NEXT:    .cfi_offset v30, -32
; P9-NEXT:    .cfi_offset v31, -16
; P9-NEXT:    xxsldwi vs0, v2, v2, 3
; P9-NEXT:    stxv v29, 32(r1) # 16-byte Folded Spill
; P9-NEXT:    xscvspdpn f1, vs0
; P9-NEXT:    stxv v30, 48(r1) # 16-byte Folded Spill
; P9-NEXT:    stxv v31, 64(r1) # 16-byte Folded Spill
; P9-NEXT:    vmr v31, v2
; P9-NEXT:    bl nearbyintf
; P9-NEXT:    nop
; P9-NEXT:    xxsldwi vs0, v31, v31, 1
; P9-NEXT:    xscpsgndp v30, f1, f1
; P9-NEXT:    xscvspdpn f1, vs0
; P9-NEXT:    bl nearbyintf
; P9-NEXT:    nop
; P9-NEXT:    # kill: def $f1 killed $f1 def $vsl1
; P9-NEXT:    xxmrghd vs0, vs1, v30
; P9-NEXT:    xscvspdpn f1, v31
; P9-NEXT:    xvcvdpsp v29, vs0
; P9-NEXT:    bl nearbyintf
; P9-NEXT:    nop
; P9-NEXT:    xxswapd vs0, v31
; P9-NEXT:    xscpsgndp v30, f1, f1
; P9-NEXT:    xscvspdpn f1, vs0
; P9-NEXT:    bl nearbyintf
; P9-NEXT:    nop
; P9-NEXT:    # kill: def $f1 killed $f1 def $vsl1
; P9-NEXT:    xxmrghd vs0, v30, vs1
; P9-NEXT:    lxv v31, 64(r1) # 16-byte Folded Reload
; P9-NEXT:    lxv v30, 48(r1) # 16-byte Folded Reload
; P9-NEXT:    xvcvdpsp v2, vs0
; P9-NEXT:    vmrgew v2, v2, v29
; P9-NEXT:    lxv v29, 32(r1) # 16-byte Folded Reload
; P9-NEXT:    addi r1, r1, 80
; P9-NEXT:    ld r0, 16(r1)
; P9-NEXT:    mtlr r0
; P9-NEXT:    blr
  %res = call <4 x float> @llvm.experimental.constrained.nearbyint.v4f32(
                        <4 x float> %vf1,
                        metadata !"round.dynamic",
                        metadata !"fpexcept.strict")
  ret <4 x float> %res
}

define <2 x double> @nearbyint_v2f64(<2 x double> %vf1, <2 x double> %vf2) {
; P8-LABEL: nearbyint_v2f64:
; P8:       # %bb.0:
; P8-NEXT:    mflr r0
; P8-NEXT:    std r0, 16(r1)
; P8-NEXT:    stdu r1, -160(r1)
; P8-NEXT:    .cfi_def_cfa_offset 160
; P8-NEXT:    .cfi_offset lr, 16
; P8-NEXT:    .cfi_offset v30, -32
; P8-NEXT:    .cfi_offset v31, -16
; P8-NEXT:    li r3, 128
; P8-NEXT:    stxvd2x v30, r1, r3 # 16-byte Folded Spill
; P8-NEXT:    li r3, 144
; P8-NEXT:    stxvd2x v31, r1, r3 # 16-byte Folded Spill
; P8-NEXT:    vmr v31, v2
; P8-NEXT:    xxlor f1, v31, v31
; P8-NEXT:    bl nearbyint
; P8-NEXT:    nop
; P8-NEXT:    xxlor v30, f1, f1
; P8-NEXT:    xxswapd vs1, v31
; P8-NEXT:    # kill: def $f1 killed $f1 killed $vsl1
; P8-NEXT:    bl nearbyint
; P8-NEXT:    nop
; P8-NEXT:    li r3, 144
; P8-NEXT:    # kill: def $f1 killed $f1 def $vsl1
; P8-NEXT:    xxmrghd v2, v30, vs1
; P8-NEXT:    lxvd2x v31, r1, r3 # 16-byte Folded Reload
; P8-NEXT:    li r3, 128
; P8-NEXT:    lxvd2x v30, r1, r3 # 16-byte Folded Reload
; P8-NEXT:    addi r1, r1, 160
; P8-NEXT:    ld r0, 16(r1)
; P8-NEXT:    mtlr r0
; P8-NEXT:    blr
;
; P9-LABEL: nearbyint_v2f64:
; P9:       # %bb.0:
; P9-NEXT:    mflr r0
; P9-NEXT:    std r0, 16(r1)
; P9-NEXT:    stdu r1, -64(r1)
; P9-NEXT:    .cfi_def_cfa_offset 64
; P9-NEXT:    .cfi_offset lr, 16
; P9-NEXT:    .cfi_offset v30, -32
; P9-NEXT:    .cfi_offset v31, -16
; P9-NEXT:    stxv v31, 48(r1) # 16-byte Folded Spill
; P9-NEXT:    vmr v31, v2
; P9-NEXT:    xscpsgndp f1, v31, v31
; P9-NEXT:    stxv v30, 32(r1) # 16-byte Folded Spill
; P9-NEXT:    bl nearbyint
; P9-NEXT:    nop
; P9-NEXT:    xscpsgndp v30, f1, f1
; P9-NEXT:    xxswapd vs1, v31
; P9-NEXT:    # kill: def $f1 killed $f1 killed $vsl1
; P9-NEXT:    bl nearbyint
; P9-NEXT:    nop
; P9-NEXT:    # kill: def $f1 killed $f1 def $vsl1
; P9-NEXT:    xxmrghd v2, v30, vs1
; P9-NEXT:    lxv v31, 48(r1) # 16-byte Folded Reload
; P9-NEXT:    lxv v30, 32(r1) # 16-byte Folded Reload
; P9-NEXT:    addi r1, r1, 64
; P9-NEXT:    ld r0, 16(r1)
; P9-NEXT:    mtlr r0
; P9-NEXT:    blr
  %res = call <2 x double> @llvm.experimental.constrained.nearbyint.v2f64(
                        <2 x double> %vf1,
                        metadata !"round.dynamic",
                        metadata !"fpexcept.strict")
  ret <2 x double> %res
}

define <4 x double> @fpext_v4f64_v4f32(<4 x float> %vf1) {
; P8-LABEL: fpext_v4f64_v4f32:
; P8:       # %bb.0:
; P8-NEXT:    xxsldwi vs0, v2, v2, 1
; P8-NEXT:    xxsldwi vs1, v2, v2, 3
; P8-NEXT:    xxswapd vs3, v2
; P8-NEXT:    xscvspdpn f2, v2
; P8-NEXT:    xscvspdpn f0, vs0
; P8-NEXT:    xscvspdpn f1, vs1
; P8-NEXT:    xscvspdpn f3, vs3
; P8-NEXT:    xxmrghd v2, vs2, vs0
; P8-NEXT:    xxmrghd v3, vs3, vs1
; P8-NEXT:    blr
;
; P9-LABEL: fpext_v4f64_v4f32:
; P9:       # %bb.0:
; P9-NEXT:    xxsldwi vs0, v2, v2, 3
; P9-NEXT:    xxswapd vs1, v2
; P9-NEXT:    xscvspdpn f0, vs0
; P9-NEXT:    xscvspdpn f1, vs1
; P9-NEXT:    xxsldwi vs2, v2, v2, 1
; P9-NEXT:    xscvspdpn f2, vs2
; P9-NEXT:    xxmrghd vs0, vs1, vs0
; P9-NEXT:    xscvspdpn f1, v2
; P9-NEXT:    xxmrghd v3, vs1, vs2
; P9-NEXT:    xxlor v2, vs0, vs0
; P9-NEXT:    blr
  %res = call <4 x double> @llvm.experimental.constrained.fpext.v4f64.v4f32(
                        <4 x float> %vf1,
                        metadata !"fpexcept.strict")
  ret <4 x double> %res
}

define <2 x double> @fpext_v2f64_v2f32(<2 x float> %vf1) {
; P8-LABEL: fpext_v2f64_v2f32:
; P8:       # %bb.0:
; P8-NEXT:    xxsldwi vs0, v2, v2, 1
; P8-NEXT:    xscvspdpn f1, v2
; P8-NEXT:    xscvspdpn f0, vs0
; P8-NEXT:    xxmrghd v2, vs1, vs0
; P8-NEXT:    blr
;
; P9-LABEL: fpext_v2f64_v2f32:
; P9:       # %bb.0:
; P9-NEXT:    xxsldwi vs0, v2, v2, 3
; P9-NEXT:    xxswapd vs1, v2
; P9-NEXT:    xscvspdpn f0, vs0
; P9-NEXT:    xscvspdpn f1, vs1
; P9-NEXT:    xxmrghd v2, vs1, vs0
; P9-NEXT:    blr
  %res = call <2 x double> @llvm.experimental.constrained.fpext.v2f64.v2f32(
                        <2 x float> %vf1,
                        metadata !"fpexcept.strict")
  ret <2 x double> %res
}

define float @fptrunc_f32_f64(double %f1) {
; P8-LABEL: fptrunc_f32_f64:
; P8:       # %bb.0:
; P8-NEXT:    xsrsp f1, f1
; P8-NEXT:    blr
;
; P9-LABEL: fptrunc_f32_f64:
; P9:       # %bb.0:
; P9-NEXT:    xsrsp f1, f1
; P9-NEXT:    blr
  %res = call float @llvm.experimental.constrained.fptrunc.f32.f64(
                        double %f1,
                        metadata !"round.dynamic",
                        metadata !"fpexcept.strict")
  ret float %res;
}

define <4 x float> @fptrunc_v4f32_v4f64(<4 x double> %vf1) {
; P8-LABEL: fptrunc_v4f32_v4f64:
; P8:       # %bb.0:
; P8-NEXT:    xxmrgld vs0, v2, v3
; P8-NEXT:    xxmrghd vs1, v2, v3
; P8-NEXT:    xvcvdpsp v2, vs0
; P8-NEXT:    xvcvdpsp v3, vs1
; P8-NEXT:    vmrgew v2, v3, v2
; P8-NEXT:    blr
;
; P9-LABEL: fptrunc_v4f32_v4f64:
; P9:       # %bb.0:
; P9-NEXT:    xxmrgld vs0, v3, v2
; P9-NEXT:    xvcvdpsp v4, vs0
; P9-NEXT:    xxmrghd vs0, v3, v2
; P9-NEXT:    xvcvdpsp v2, vs0
; P9-NEXT:    vmrgew v2, v2, v4
; P9-NEXT:    blr
  %res = call <4 x float> @llvm.experimental.constrained.fptrunc.v4f32.v4f64(
                        <4 x double> %vf1,
                        metadata !"round.dynamic",
                        metadata !"fpexcept.strict")
  ret <4 x float> %res
}

define <2 x float> @fptrunc_v2f32_v2f64(<2 x double> %vf1) {
; P8-LABEL: fptrunc_v2f32_v2f64:
; P8:       # %bb.0:
; P8-NEXT:    xxswapd vs0, v2
; P8-NEXT:    xsrsp f1, v2
; P8-NEXT:    xsrsp f0, f0
; P8-NEXT:    xscvdpspn v2, f1
; P8-NEXT:    xscvdpspn v3, f0
; P8-NEXT:    vmrgow v2, v2, v3
; P8-NEXT:    blr
;
; P9-LABEL: fptrunc_v2f32_v2f64:
; P9:       # %bb.0:
; P9-NEXT:    xsrsp f0, v2
; P9-NEXT:    xscvdpspn v3, f0
; P9-NEXT:    xxswapd vs0, v2
; P9-NEXT:    xsrsp f0, f0
; P9-NEXT:    xscvdpspn v2, f0
; P9-NEXT:    vmrghw v2, v3, v2
; P9-NEXT:    blr
  %res = call <2 x float> @llvm.experimental.constrained.fptrunc.v2f32.v2f64(
                        <2 x double> %vf1,
                        metadata !"round.dynamic",
                        metadata !"fpexcept.strict")
  ret <2 x float> %res
}

define float @round_f32(float %f1) {
; P8-LABEL: round_f32:
; P8:       # %bb.0:
; P8-NEXT:    xsrdpi f1, f1
; P8-NEXT:    blr
;
; P9-LABEL: round_f32:
; P9:       # %bb.0:
; P9-NEXT:    xsrdpi f1, f1
; P9-NEXT:    blr
  %res = call float @llvm.experimental.constrained.round.f32(
                        float %f1,
                        metadata !"fpexcept.strict")
  ret float %res
}

define double @round_f64(double %f1) {
; P8-LABEL: round_f64:
; P8:       # %bb.0:
; P8-NEXT:    xsrdpi f1, f1
; P8-NEXT:    blr
;
; P9-LABEL: round_f64:
; P9:       # %bb.0:
; P9-NEXT:    xsrdpi f1, f1
; P9-NEXT:    blr
  %res = call double @llvm.experimental.constrained.round.f64(
                        double %f1,
                        metadata !"fpexcept.strict")
  ret double %res
}

define <4 x float> @round_v4f32(<4 x float> %vf1) {
; P8-LABEL: round_v4f32:
; P8:       # %bb.0:
; P8-NEXT:    xvrspi v2, v2
; P8-NEXT:    blr
;
; P9-LABEL: round_v4f32:
; P9:       # %bb.0:
; P9-NEXT:    xvrspi v2, v2
; P9-NEXT:    blr
  %res = call <4 x float> @llvm.experimental.constrained.round.v4f32(
                        <4 x float> %vf1,
                        metadata !"fpexcept.strict")
  ret <4 x float> %res
}

define <2 x double> @round_v2f64(<2 x double> %vf1) {
; P8-LABEL: round_v2f64:
; P8:       # %bb.0:
; P8-NEXT:    xvrdpi v2, v2
; P8-NEXT:    blr
;
; P9-LABEL: round_v2f64:
; P9:       # %bb.0:
; P9-NEXT:    xvrdpi v2, v2
; P9-NEXT:    blr
  %res = call <2 x double> @llvm.experimental.constrained.round.v2f64(
                        <2 x double> %vf1,
                        metadata !"fpexcept.strict")
  ret <2 x double> %res
}

define float @trunc_f32(float %f1) {
; P8-LABEL: trunc_f32:
; P8:       # %bb.0:
; P8-NEXT:    xsrdpiz f1, f1
; P8-NEXT:    blr
;
; P9-LABEL: trunc_f32:
; P9:       # %bb.0:
; P9-NEXT:    xsrdpiz f1, f1
; P9-NEXT:    blr
  %res = call float @llvm.experimental.constrained.trunc.f32(
                        float %f1,
                        metadata !"fpexcept.strict")
  ret float %res
}

define double @trunc_f64(double %f1) {
; P8-LABEL: trunc_f64:
; P8:       # %bb.0:
; P8-NEXT:    xsrdpiz f1, f1
; P8-NEXT:    blr
;
; P9-LABEL: trunc_f64:
; P9:       # %bb.0:
; P9-NEXT:    xsrdpiz f1, f1
; P9-NEXT:    blr
  %res = call double @llvm.experimental.constrained.trunc.f64(
                        double %f1,
                        metadata !"fpexcept.strict")
  ret double %res
}

define <4 x float> @trunc_v4f32(<4 x float> %vf1) {
; P8-LABEL: trunc_v4f32:
; P8:       # %bb.0:
; P8-NEXT:    xvrspiz v2, v2
; P8-NEXT:    blr
;
; P9-LABEL: trunc_v4f32:
; P9:       # %bb.0:
; P9-NEXT:    xvrspiz v2, v2
; P9-NEXT:    blr
  %res = call <4 x float> @llvm.experimental.constrained.trunc.v4f32(
                        <4 x float> %vf1,
                        metadata !"fpexcept.strict")
  ret <4 x float> %res
}

define <2 x double> @trunc_v2f64(<2 x double> %vf1) {
; P8-LABEL: trunc_v2f64:
; P8:       # %bb.0:
; P8-NEXT:    xvrdpiz v2, v2
; P8-NEXT:    blr
;
; P9-LABEL: trunc_v2f64:
; P9:       # %bb.0:
; P9-NEXT:    xvrdpiz v2, v2
; P9-NEXT:    blr
  %res = call <2 x double> @llvm.experimental.constrained.trunc.v2f64(
                        <2 x double> %vf1,
                        metadata !"fpexcept.strict")
  ret <2 x double> %res
}
