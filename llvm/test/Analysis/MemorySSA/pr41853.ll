; RUN: opt -S -memoryssa -loop-simplify -early-cse-memssa -verify-memoryssa %s | FileCheck %s
; RUN: opt -S -memoryssa -loop-simplify -early-cse-memssa -enable-mssa-loop-dependency -verify-memoryssa %s | FileCheck %s
; REQUIRES: asserts
target triple = "x86_64-unknown-linux-gnu"

; CHECK-LABEL: @func()
define void @func() {
  br i1 undef, label %bb5, label %bb3

bb5:                                              ; preds = %bb5, %0
  store i16 undef, i16* undef
  br i1 undef, label %bb5, label %bb3

bb3:                                              ; preds = %bb5, %0
  ret void
}
