; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -indvars -S | FileCheck %s

define i32 @test.signed.add.0(i32* %array, i32 %length, i32 %init) {
; CHECK-LABEL: @test.signed.add.0(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[UPPER:%.*]] = icmp slt i32 [[INIT:%.*]], [[LENGTH:%.*]]
; CHECK-NEXT:    br i1 [[UPPER]], label [[LOOP_PREHEADER:%.*]], label [[EXIT:%.*]]
; CHECK:       loop.preheader:
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    [[CIV:%.*]] = phi i32 [ [[CIV_INC:%.*]], [[LATCH:%.*]] ], [ [[INIT]], [[LOOP_PREHEADER]] ]
; CHECK-NEXT:    [[CIV_INC]] = add nsw i32 [[CIV]], 1
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i32 [[CIV_INC]], [[LENGTH]]
; CHECK-NEXT:    br i1 [[CMP]], label [[LATCH]], label [[BREAK:%.*]]
; CHECK:       latch:
; CHECK-NEXT:    store i32 0, i32* [[ARRAY:%.*]], align 4
; CHECK-NEXT:    br i1 true, label [[LOOP]], label [[BREAK]]
; CHECK:       break:
; CHECK-NEXT:    [[CIV_INC_LCSSA:%.*]] = phi i32 [ [[LENGTH]], [[LATCH]] ], [ [[LENGTH]], [[LOOP]] ]
; CHECK-NEXT:    ret i32 [[CIV_INC_LCSSA]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;
  entry:
  %upper = icmp slt i32 %init, %length
  br i1 %upper, label %loop, label %exit

  loop:
  %civ = phi i32 [ %init, %entry ], [ %civ.inc, %latch ]
  %civ.inc = add i32 %civ, 1
  %cmp = icmp slt i32 %civ.inc, %length
  br i1 %cmp, label %latch, label %break

  latch:
  store i32 0, i32* %array
  %check = icmp slt i32 %civ.inc, %length
  br i1 %check, label %loop, label %break

  break:
  ret i32 %civ.inc

  exit:
  ret i32 42
}

define i32 @test.signed.add.1(i32* %array, i32 %length, i32 %init) {
; CHECK-LABEL: @test.signed.add.1(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[UPPER:%.*]] = icmp sle i32 [[INIT:%.*]], [[LENGTH:%.*]]
; CHECK-NEXT:    br i1 [[UPPER]], label [[LOOP_PREHEADER:%.*]], label [[EXIT:%.*]]
; CHECK:       loop.preheader:
; CHECK-NEXT:    [[TMP0:%.*]] = add i32 [[INIT]], 1
; CHECK-NEXT:    [[SMAX:%.*]] = call i32 @llvm.smax.i32(i32 [[LENGTH]], i32 [[TMP0]])
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    [[CIV:%.*]] = phi i32 [ [[CIV_INC:%.*]], [[LATCH:%.*]] ], [ [[INIT]], [[LOOP_PREHEADER]] ]
; CHECK-NEXT:    [[CIV_INC]] = add i32 [[CIV]], 1
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i32 [[CIV_INC]], [[LENGTH]]
; CHECK-NEXT:    br i1 [[CMP]], label [[LATCH]], label [[BREAK:%.*]]
; CHECK:       latch:
; CHECK-NEXT:    store i32 0, i32* [[ARRAY:%.*]], align 4
; CHECK-NEXT:    br i1 true, label [[LOOP]], label [[BREAK]]
; CHECK:       break:
; CHECK-NEXT:    [[CIV_INC_LCSSA:%.*]] = phi i32 [ [[SMAX]], [[LATCH]] ], [ [[SMAX]], [[LOOP]] ]
; CHECK-NEXT:    ret i32 [[CIV_INC_LCSSA]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;
  entry:
  %upper = icmp sle i32 %init, %length
  br i1 %upper, label %loop, label %exit

  loop:
  %civ = phi i32 [ %init, %entry ], [ %civ.inc, %latch ]
  %civ.inc = add i32 %civ, 1
  %cmp = icmp slt i32 %civ.inc, %length
  br i1 %cmp, label %latch, label %break

  latch:
  store i32 0, i32* %array
  %check = icmp slt i32 %civ.inc, %length
  br i1 %check, label %loop, label %break

  break:
  ret i32 %civ.inc

  exit:
  ret i32 42
}

define i32 @test.unsigned.add.0(i32* %array, i32 %length, i32 %init) {
; CHECK-LABEL: @test.unsigned.add.0(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[UPPER:%.*]] = icmp ult i32 [[INIT:%.*]], [[LENGTH:%.*]]
; CHECK-NEXT:    br i1 [[UPPER]], label [[LOOP_PREHEADER:%.*]], label [[EXIT:%.*]]
; CHECK:       loop.preheader:
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    [[CIV:%.*]] = phi i32 [ [[CIV_INC:%.*]], [[LATCH:%.*]] ], [ [[INIT]], [[LOOP_PREHEADER]] ]
; CHECK-NEXT:    [[CIV_INC]] = add nuw i32 [[CIV]], 1
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i32 [[CIV_INC]], [[LENGTH]]
; CHECK-NEXT:    br i1 [[CMP]], label [[LATCH]], label [[BREAK:%.*]]
; CHECK:       latch:
; CHECK-NEXT:    store i32 0, i32* [[ARRAY:%.*]], align 4
; CHECK-NEXT:    [[CHECK:%.*]] = icmp ult i32 [[CIV_INC]], [[LENGTH]]
; CHECK-NEXT:    br i1 [[CHECK]], label [[LOOP]], label [[BREAK]]
; CHECK:       break:
; CHECK-NEXT:    [[CIV_INC_LCSSA:%.*]] = phi i32 [ [[CIV_INC]], [[LATCH]] ], [ [[CIV_INC]], [[LOOP]] ]
; CHECK-NEXT:    ret i32 [[CIV_INC_LCSSA]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;
  entry:
  %upper = icmp ult i32 %init, %length
  br i1 %upper, label %loop, label %exit

  loop:
  %civ = phi i32 [ %init, %entry ], [ %civ.inc, %latch ]
  %civ.inc = add i32 %civ, 1
  %cmp = icmp slt i32 %civ.inc, %length
  br i1 %cmp, label %latch, label %break

  latch:
  store i32 0, i32* %array
  %check = icmp ult i32 %civ.inc, %length
  br i1 %check, label %loop, label %break

  break:
  ret i32 %civ.inc

  exit:
  ret i32 42
}

define i32 @test.unsigned.add.1(i32* %array, i32 %length, i32 %init) {
; CHECK-LABEL: @test.unsigned.add.1(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[UPPER:%.*]] = icmp ule i32 [[INIT:%.*]], [[LENGTH:%.*]]
; CHECK-NEXT:    br i1 [[UPPER]], label [[LOOP_PREHEADER:%.*]], label [[EXIT:%.*]]
; CHECK:       loop.preheader:
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    [[CIV:%.*]] = phi i32 [ [[CIV_INC:%.*]], [[LATCH:%.*]] ], [ [[INIT]], [[LOOP_PREHEADER]] ]
; CHECK-NEXT:    [[CIV_INC]] = add i32 [[CIV]], 1
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i32 [[CIV_INC]], [[LENGTH]]
; CHECK-NEXT:    br i1 [[CMP]], label [[LATCH]], label [[BREAK:%.*]]
; CHECK:       latch:
; CHECK-NEXT:    store i32 0, i32* [[ARRAY:%.*]], align 4
; CHECK-NEXT:    [[CHECK:%.*]] = icmp ult i32 [[CIV_INC]], [[LENGTH]]
; CHECK-NEXT:    br i1 [[CHECK]], label [[LOOP]], label [[BREAK]]
; CHECK:       break:
; CHECK-NEXT:    [[CIV_INC_LCSSA:%.*]] = phi i32 [ [[CIV_INC]], [[LATCH]] ], [ [[CIV_INC]], [[LOOP]] ]
; CHECK-NEXT:    ret i32 [[CIV_INC_LCSSA]]
; CHECK:       exit:
; CHECK-NEXT:    ret i32 42
;
  entry:
  %upper = icmp ule i32 %init, %length
  br i1 %upper, label %loop, label %exit

  loop:
  %civ = phi i32 [ %init, %entry ], [ %civ.inc, %latch ]
  %civ.inc = add i32 %civ, 1
  %cmp = icmp slt i32 %civ.inc, %length
  br i1 %cmp, label %latch, label %break

  latch:
  store i32 0, i32* %array
  %check = icmp ult i32 %civ.inc, %length
  br i1 %check, label %loop, label %break

  break:
  ret i32 %civ.inc

  exit:
  ret i32 42
}

define hidden void @test.shl.exact.equal() {
; CHECK-LABEL: @test.shl.exact.equal(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[FOR_BODY:%.*]]
; CHECK:       for.body:
; CHECK-NEXT:    [[K_021:%.*]] = phi i32 [ 1, [[ENTRY:%.*]] ], [ [[INC:%.*]], [[FOR_BODY]] ]
; CHECK-NEXT:    [[SHL:%.*]] = shl i32 1, [[K_021]]
; CHECK-NEXT:    [[SHR1:%.*]] = ashr exact i32 [[SHL]], 1
; CHECK-NEXT:    [[SHR2:%.*]] = lshr exact i32 [[SHL]], 1
; CHECK-NEXT:    [[INC]] = add nuw nsw i32 [[K_021]], 1
; CHECK-NEXT:    br i1 true, label [[FOR_END:%.*]], label [[FOR_BODY]]
; CHECK:       for.end:
; CHECK-NEXT:    ret void
;
entry:
  br label %for.body

for.body:
  %k.021 = phi i32 [ 1, %entry ], [ %inc, %for.body ]
  %shl = shl i32 1, %k.021
  %shr1 = ashr i32 %shl, 1
  %shr2 = lshr i32 %shl, 1
  %inc = add nuw nsw i32 %k.021, 1
  %exitcond = icmp eq i32 %inc, 9
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

define hidden void @test.shl.exact.greater() {
; CHECK-LABEL: @test.shl.exact.greater(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[FOR_BODY:%.*]]
; CHECK:       for.body:
; CHECK-NEXT:    [[K_021:%.*]] = phi i32 [ 3, [[ENTRY:%.*]] ], [ [[INC:%.*]], [[FOR_BODY]] ]
; CHECK-NEXT:    [[SHL:%.*]] = shl i32 1, [[K_021]]
; CHECK-NEXT:    [[SHR1:%.*]] = ashr exact i32 [[SHL]], 2
; CHECK-NEXT:    [[SHR2:%.*]] = lshr exact i32 [[SHL]], 2
; CHECK-NEXT:    [[INC]] = add nuw nsw i32 [[K_021]], 1
; CHECK-NEXT:    br i1 true, label [[FOR_END:%.*]], label [[FOR_BODY]]
; CHECK:       for.end:
; CHECK-NEXT:    ret void
;
entry:
  br label %for.body

for.body:
  %k.021 = phi i32 [ 3, %entry ], [ %inc, %for.body ]
  %shl = shl i32 1, %k.021
  %shr1 = ashr i32 %shl, 2
  %shr2 = lshr i32 %shl, 2
  %inc = add nuw nsw i32 %k.021, 1
  %exitcond = icmp eq i32 %inc, 9
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

define hidden void @test.shl.exact.unbound(i32 %arg) {
; CHECK-LABEL: @test.shl.exact.unbound(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[FOR_BODY:%.*]]
; CHECK:       for.body:
; CHECK-NEXT:    [[K_021:%.*]] = phi i32 [ 2, [[ENTRY:%.*]] ], [ [[INC:%.*]], [[FOR_BODY]] ]
; CHECK-NEXT:    [[SHL:%.*]] = shl i32 1, [[K_021]]
; CHECK-NEXT:    [[SHR1:%.*]] = ashr exact i32 [[SHL]], 2
; CHECK-NEXT:    [[SHR2:%.*]] = lshr exact i32 [[SHL]], 2
; CHECK-NEXT:    [[INC]] = add nuw nsw i32 [[K_021]], 1
; CHECK-NEXT:    br i1 true, label [[FOR_END:%.*]], label [[FOR_BODY]]
; CHECK:       for.end:
; CHECK-NEXT:    ret void
;
entry:
  br label %for.body

for.body:
  %k.021 = phi i32 [ 2, %entry ], [ %inc, %for.body ]
  %shl = shl i32 1, %k.021
  %shr1 = ashr i32 %shl, 2
  %shr2 = lshr i32 %shl, 2
  %inc = add nuw nsw i32 %k.021, 1
  %exitcond = icmp eq i32 %inc, %arg
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

define hidden void @test.shl.nonexact() {
; CHECK-LABEL: @test.shl.nonexact(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[FOR_BODY:%.*]]
; CHECK:       for.body:
; CHECK-NEXT:    [[K_021:%.*]] = phi i32 [ 2, [[ENTRY:%.*]] ], [ [[INC:%.*]], [[FOR_BODY]] ]
; CHECK-NEXT:    [[SHL:%.*]] = shl i32 1, [[K_021]]
; CHECK-NEXT:    [[SHR1:%.*]] = ashr i32 [[SHL]], 3
; CHECK-NEXT:    [[SHR2:%.*]] = lshr i32 [[SHL]], 3
; CHECK-NEXT:    [[INC]] = add nuw nsw i32 [[K_021]], 1
; CHECK-NEXT:    br i1 true, label [[FOR_END:%.*]], label [[FOR_BODY]]
; CHECK:       for.end:
; CHECK-NEXT:    ret void
;
entry:
  br label %for.body

for.body:
  %k.021 = phi i32 [ 2, %entry ], [ %inc, %for.body ]
  %shl = shl i32 1, %k.021
  %shr1 = ashr i32 %shl, 3
  %shr2 = lshr i32 %shl, 3
  %inc = add nuw nsw i32 %k.021, 1
  %exitcond = icmp eq i32 %inc, 9
  br i1 %exitcond, label %for.end, label %for.body

for.end:
  ret void
}

!0 = !{i32 0, i32 2}
!1 = !{i32 0, i32 42}
