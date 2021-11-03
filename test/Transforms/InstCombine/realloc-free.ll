; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --scrub-attributes
; RUN: opt -S -instcombine < %s | FileCheck %s

define dso_local void @_Z3fooPv(i8* nocapture %0) local_unnamed_addr #0 {
; CHECK-LABEL: @_Z3fooPv(
; CHECK-NEXT:    tail call void @free(i8* [[TMP0:%.*]])
; CHECK-NEXT:    ret void
;
  %2 = tail call align 16 dereferenceable_or_null(6) i8* @realloc(i8* %0, i64 6) #2
  tail call void @free(i8* %2) #2
  ret void
}

declare dso_local noalias noundef i8* @realloc(i8* nocapture, i64 noundef) local_unnamed_addr #1
declare dso_local void @free(i8* nocapture noundef) local_unnamed_addr #1

attributes #0 = { mustprogress nounwind uwtable willreturn }
attributes #1 = { inaccessiblemem_or_argmemonly mustprogress nounwind willreturn }
attributes #2 = { nounwind }
