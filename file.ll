; ModuleID = 'utf8.c'
source_filename = "utf8.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx13.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@.str = private unnamed_addr constant [31 x i8] c"Please supply a file argument\0A\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.3 = private unnamed_addr constant [38 x i8] c"The file provided could not be found\0A\00", align 1
@.str.4 = private unnamed_addr constant [23 x i8] c"\0ATotal Codepoints: %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [12 x i8] c"Out of mana\00", align 1
@.str.6 = private unnamed_addr constant [43 x i8] c"The number of bytes in this codepoint: %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [19 x i8] c"Unicode: U+%x\09%lc\0A\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @main(i32 noundef %0, i8** noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca %struct.__sFILE*, align 8
  %7 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  %8 = load i32, i32* %4, align 4
  %9 = icmp slt i32 %8, 2
  br i1 %9, label %10, label %12

10:                                               ; preds = %2
  %11 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0))
  store i32 1, i32* %3, align 4
  br label %27

12:                                               ; preds = %2
  %13 = call i8* @setlocale(i32 noundef 2, i8* noundef getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0))
  %14 = load i8**, i8*** %5, align 8
  %15 = getelementptr inbounds i8*, i8** %14, i64 1
  %16 = load i8*, i8** %15, align 8
  %17 = call %struct.__sFILE* @"\01_fopen"(i8* noundef %16, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0))
  store %struct.__sFILE* %17, %struct.__sFILE** %6, align 8
  %18 = load %struct.__sFILE*, %struct.__sFILE** %6, align 8
  %19 = icmp eq %struct.__sFILE* %18, null
  br i1 %19, label %20, label %22

20:                                               ; preds = %12
  %21 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([38 x i8], [38 x i8]* @.str.3, i64 0, i64 0))
  store i32 2, i32* %3, align 4
  br label %27

22:                                               ; preds = %12
  %23 = load %struct.__sFILE*, %struct.__sFILE** %6, align 8
  %24 = call i32 @read_unicode_file(%struct.__sFILE* noundef %23)
  store i32 %24, i32* %7, align 4
  %25 = load i32, i32* %7, align 4
  %26 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.4, i64 0, i64 0), i32 noundef %25)
  store i32 0, i32* %3, align 4
  br label %27

27:                                               ; preds = %22, %20, %10
  %28 = load i32, i32* %3, align 4
  ret i32 %28
}

declare i32 @printf(i8* noundef, ...) #1

declare i8* @setlocale(i32 noundef, i8* noundef) #1

declare %struct.__sFILE* @"\01_fopen"(i8* noundef, i8* noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @read_unicode_file(%struct.__sFILE* noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.__sFILE*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store %struct.__sFILE* %0, %struct.__sFILE** %3, align 8
  %10 = load %struct.__sFILE*, %struct.__sFILE** %3, align 8
  %11 = call i32 @fseek(%struct.__sFILE* noundef %10, i64 noundef 0, i32 noundef 2)
  %12 = load %struct.__sFILE*, %struct.__sFILE** %3, align 8
  %13 = call i64 @ftell(%struct.__sFILE* noundef %12)
  %14 = trunc i64 %13 to i32
  store i32 %14, i32* %4, align 4
  %15 = load %struct.__sFILE*, %struct.__sFILE** %3, align 8
  call void @rewind(%struct.__sFILE* noundef %15)
  %16 = load i32, i32* %4, align 4
  %17 = sext i32 %16 to i64
  %18 = call i8* @malloc(i64 noundef %17) #3
  store i8* %18, i8** %5, align 8
  %19 = load i8*, i8** %5, align 8
  %20 = icmp eq i8* %19, null
  br i1 %20, label %21, label %23

21:                                               ; preds = %1
  %22 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0))
  store i32 0, i32* %2, align 4
  br label %157

23:                                               ; preds = %1
  %24 = load i8*, i8** %5, align 8
  %25 = load i32, i32* %4, align 4
  %26 = sext i32 %25 to i64
  %27 = load %struct.__sFILE*, %struct.__sFILE** %3, align 8
  %28 = call i64 @fread(i8* noundef %24, i64 noundef %26, i64 noundef 1, %struct.__sFILE* noundef %27)
  store i32 0, i32* %6, align 4
  store i32 0, i32* %7, align 4
  br label %29

29:                                               ; preds = %148, %23
  %30 = load i32, i32* %7, align 4
  %31 = load i32, i32* %4, align 4
  %32 = icmp slt i32 %30, %31
  br i1 %32, label %33, label %155

33:                                               ; preds = %29
  %34 = load i8*, i8** %5, align 8
  %35 = load i32, i32* %7, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8, i8* %34, i64 %36
  %38 = load i8, i8* %37, align 1
  %39 = sext i8 %38 to i32
  %40 = call i32 @unicode_codepoint_bytes(i32 noundef %39)
  store i32 %40, i32* %8, align 4
  %41 = load i32, i32* %7, align 4
  %42 = load i32, i32* %8, align 4
  %43 = add nsw i32 %41, %42
  %44 = load i32, i32* %4, align 4
  %45 = icmp sle i32 %43, %44
  br i1 %45, label %46, label %47

46:                                               ; preds = %33
  br label %47

47:                                               ; preds = %46, %33
  %48 = load i8*, i8** %5, align 8
  %49 = load i32, i32* %7, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8, i8* %48, i64 %50
  %52 = load i8, i8* %51, align 1
  %53 = sext i8 %52 to i32
  %54 = call i32 @unicode_codepoint_bytes(i32 noundef %53)
  %55 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.6, i64 0, i64 0), i32 noundef %54)
  store i32 0, i32* %9, align 4
  %56 = load i32, i32* %8, align 4
  switch i32 %56, label %148 [
    i32 1, label %57
    i32 2, label %64
    i32 3, label %82
    i32 4, label %110
  ]

57:                                               ; preds = %47
  %58 = load i8*, i8** %5, align 8
  %59 = load i32, i32* %7, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i8, i8* %58, i64 %60
  %62 = load i8, i8* %61, align 1
  %63 = sext i8 %62 to i32
  store i32 %63, i32* %9, align 4
  br label %148

64:                                               ; preds = %47
  %65 = load i8*, i8** %5, align 8
  %66 = load i32, i32* %7, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i8, i8* %65, i64 %67
  %69 = load i8, i8* %68, align 1
  %70 = sext i8 %69 to i32
  %71 = and i32 %70, 31
  %72 = shl i32 %71, 6
  %73 = load i8*, i8** %5, align 8
  %74 = load i32, i32* %7, align 4
  %75 = add nsw i32 %74, 1
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i8, i8* %73, i64 %76
  %78 = load i8, i8* %77, align 1
  %79 = sext i8 %78 to i32
  %80 = and i32 %79, 63
  %81 = or i32 %72, %80
  store i32 %81, i32* %9, align 4
  br label %148

82:                                               ; preds = %47
  %83 = load i8*, i8** %5, align 8
  %84 = load i32, i32* %7, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i8, i8* %83, i64 %85
  %87 = load i8, i8* %86, align 1
  %88 = sext i8 %87 to i32
  %89 = and i32 %88, 15
  %90 = shl i32 %89, 12
  %91 = load i8*, i8** %5, align 8
  %92 = load i32, i32* %7, align 4
  %93 = add nsw i32 %92, 1
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i8, i8* %91, i64 %94
  %96 = load i8, i8* %95, align 1
  %97 = sext i8 %96 to i32
  %98 = and i32 %97, 63
  %99 = shl i32 %98, 6
  %100 = or i32 %90, %99
  %101 = load i8*, i8** %5, align 8
  %102 = load i32, i32* %7, align 4
  %103 = add nsw i32 %102, 2
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i8, i8* %101, i64 %104
  %106 = load i8, i8* %105, align 1
  %107 = sext i8 %106 to i32
  %108 = and i32 %107, 63
  %109 = or i32 %100, %108
  store i32 %109, i32* %9, align 4
  br label %148

110:                                              ; preds = %47
  %111 = load i8*, i8** %5, align 8
  %112 = load i32, i32* %7, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i8, i8* %111, i64 %113
  %115 = load i8, i8* %114, align 1
  %116 = sext i8 %115 to i32
  %117 = and i32 %116, 7
  %118 = shl i32 %117, 18
  %119 = load i8*, i8** %5, align 8
  %120 = load i32, i32* %7, align 4
  %121 = add nsw i32 %120, 1
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i8, i8* %119, i64 %122
  %124 = load i8, i8* %123, align 1
  %125 = sext i8 %124 to i32
  %126 = and i32 %125, 63
  %127 = shl i32 %126, 12
  %128 = or i32 %118, %127
  %129 = load i8*, i8** %5, align 8
  %130 = load i32, i32* %7, align 4
  %131 = add nsw i32 %130, 2
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds i8, i8* %129, i64 %132
  %134 = load i8, i8* %133, align 1
  %135 = sext i8 %134 to i32
  %136 = and i32 %135, 63
  %137 = shl i32 %136, 6
  %138 = or i32 %128, %137
  %139 = load i8*, i8** %5, align 8
  %140 = load i32, i32* %7, align 4
  %141 = add nsw i32 %140, 3
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i8, i8* %139, i64 %142
  %144 = load i8, i8* %143, align 1
  %145 = sext i8 %144 to i32
  %146 = and i32 %145, 63
  %147 = or i32 %138, %146
  store i32 %147, i32* %9, align 4
  br label %148

148:                                              ; preds = %47, %110, %82, %64, %57
  %149 = load i32, i32* %9, align 4
  %150 = load i32, i32* %9, align 4
  %151 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.7, i64 0, i64 0), i32 noundef %149, i32 noundef %150)
  %152 = load i32, i32* %8, align 4
  %153 = load i32, i32* %7, align 4
  %154 = add nsw i32 %153, %152
  store i32 %154, i32* %7, align 4
  br label %29, !llvm.loop !10

155:                                              ; preds = %29
  %156 = load i32, i32* %6, align 4
  store i32 %156, i32* %2, align 4
  br label %157

157:                                              ; preds = %155, %21
  %158 = load i32, i32* %2, align 4
  ret i32 %158
}

declare i32 @fseek(%struct.__sFILE* noundef, i64 noundef, i32 noundef) #1

declare i64 @ftell(%struct.__sFILE* noundef) #1

declare void @rewind(%struct.__sFILE* noundef) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

declare i64 @fread(i8* noundef, i64 noundef, i64 noundef, %struct.__sFILE* noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @unicode_codepoint_bytes(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  %5 = call i32 @fulfills_mask(i32 noundef 240, i32 noundef %4)
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  store i32 4, i32* %2, align 4
  br label %19

8:                                                ; preds = %1
  %9 = load i32, i32* %3, align 4
  %10 = call i32 @fulfills_mask(i32 noundef 224, i32 noundef %9)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %8
  store i32 3, i32* %2, align 4
  br label %19

13:                                               ; preds = %8
  %14 = load i32, i32* %3, align 4
  %15 = call i32 @fulfills_mask(i32 noundef 192, i32 noundef %14)
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %13
  store i32 2, i32* %2, align 4
  br label %19

18:                                               ; preds = %13
  store i32 1, i32* %2, align 4
  br label %19

19:                                               ; preds = %18, %17, %12, %7
  %20 = load i32, i32* %2, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @fulfills_mask(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* %4, align 4
  %6 = load i32, i32* %3, align 4
  %7 = and i32 %5, %6
  %8 = load i32, i32* %3, align 4
  %9 = icmp eq i32 %7, %8
  %10 = zext i1 %9 to i32
  ret i32 %10
}

attributes #0 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.5a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.5a,+zcm,+zcz" }
attributes #2 = { allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.5a,+zcm,+zcz" }
attributes #3 = { allocsize(0) }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 13, i32 3]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"branch-target-enforcement", i32 0}
!3 = !{i32 8, !"sign-return-address", i32 0}
!4 = !{i32 8, !"sign-return-address-all", i32 0}
!5 = !{i32 8, !"sign-return-address-with-bkey", i32 0}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 1}
!9 = !{!"Apple clang version 14.0.3 (clang-1403.0.22.14.1)"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
