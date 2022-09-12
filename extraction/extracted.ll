; ModuleID = 'extracted.c'
source_filename = "extracted.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.anon = type { [6 x i32]*, i32*, %struct.decap_stats*, [1024 x i32]*, [0 x i32]* }
%struct.decap_stats = type { i64, i64, i64 }
%struct.anon.0 = type { [2 x i32]*, i32*, %struct.ctl_value*, [16 x i32]*, [0 x i32]* }
%struct.ctl_value = type { %union.anon }
%union.anon = type { i64 }
%struct.anon.1 = type { [12 x i32]*, [4 x i32]*, [4 x i32]*, [128 x i32]*, [0 x i32]* }
%struct.anon.2 = type { [1 x i32]*, %struct.vip_definition*, %struct.vip_meta*, [512 x i32]*, [0 x i32]* }
%struct.vip_definition = type { %union.anon.3, i16, i8 }
%union.anon.3 = type { [4 x i32] }
%struct.vip_meta = type { i32, i32 }
%struct.anon.4 = type { [12 x i32]*, [4 x i32]*, [4 x i32]*, [128 x i32]*, [0 x i32]* }
%struct.anon.5 = type { [9 x i32]*, %struct.flow_key*, %struct.real_pos_lru*, [1000 x i32]*, [0 x i32]* }
%struct.flow_key = type { %union.anon.6, %union.anon.7, %union.anon.8, i8 }
%union.anon.6 = type { [4 x i32] }
%union.anon.7 = type { [4 x i32] }
%union.anon.8 = type { i32 }
%struct.real_pos_lru = type { i32, i64 }
%struct.anon.9 = type { [2 x i32]*, i32*, i32*, [33554944 x i32]*, [0 x i32]* }
%struct.anon.10 = type { [2 x i32]*, i32*, %struct.real_definition*, [4096 x i32]*, [0 x i32]* }
%struct.real_definition = type { %union.anon.11, i8 }
%union.anon.11 = type { [4 x i32] }
%struct.anon.12 = type { [6 x i32]*, i32*, %struct.lb_stats*, [4096 x i32]*, [0 x i32]* }
%struct.lb_stats = type { i64, i64 }
%struct.anon.13 = type { [6 x i32]*, i32*, %struct.lb_stats*, [1024 x i32]*, [0 x i32]* }
%struct.anon.14 = type { [2 x i32]*, i32*, i32*, [16777214 x i32]*, [0 x i32]* }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.packet_description = type { %struct.flow_key, i32, i8, i8 }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@decap_counters = dso_local global %struct.anon zeroinitializer, section ".maps", align 8, !dbg !51
@ctl_array = dso_local global %struct.anon.0 zeroinitializer, section ".maps", align 8, !dbg !83
@flow_debug_maps = dso_local global %struct.anon.1 zeroinitializer, section ".maps", align 8, !dbg !114
@vip_map = dso_local global %struct.anon.2 zeroinitializer, section ".maps", align 8, !dbg !136
@lru_mapping = dso_local global %struct.anon.4 zeroinitializer, section ".maps", align 8, !dbg !172
@fallback_cache = dso_local global %struct.anon.5 zeroinitializer, section ".maps", align 8, !dbg !181
@ch_rings = dso_local global %struct.anon.9 zeroinitializer, section ".maps", align 8, !dbg !223
@reals = dso_local global %struct.anon.10 zeroinitializer, section ".maps", align 8, !dbg !236
@reals_stats = dso_local global %struct.anon.12 zeroinitializer, section ".maps", align 8, !dbg !258
@stats = dso_local global %struct.anon.13 zeroinitializer, section ".maps", align 8, !dbg !272
@server_id_map = dso_local global %struct.anon.14 zeroinitializer, section ".maps", align 8, !dbg !281
@llvm.used = appending global [13 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon.9* @ch_rings to i8*), i8* bitcast (%struct.anon.0* @ctl_array to i8*), i8* bitcast (%struct.anon* @decap_counters to i8*), i8* bitcast (%struct.anon.5* @fallback_cache to i8*), i8* bitcast (%struct.anon.1* @flow_debug_maps to i8*), i8* bitcast (%struct.anon.4* @lru_mapping to i8*), i8* bitcast (%struct.anon.10* @reals to i8*), i8* bitcast (%struct.anon.12* @reals_stats to i8*), i8* bitcast (%struct.anon.14* @server_id_map to i8*), i8* bitcast (%struct.anon.13* @stats to i8*), i8* bitcast (%struct.anon.2* @vip_map to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdpdecap to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdpdecap(%struct.xdp_md* %0) #0 section "decap" !dbg !311 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !323, metadata !DIExpression()), !dbg !338
  %4 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !339
  %5 = load i32, i32* %4, align 4, !dbg !339, !tbaa !340
  %6 = zext i32 %5 to i64, !dbg !345
  %7 = inttoptr i64 %6 to i8*, !dbg !346
  call void @llvm.dbg.value(metadata i8* %7, metadata !324, metadata !DIExpression()), !dbg !338
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !347
  %9 = load i32, i32* %8, align 4, !dbg !347, !tbaa !348
  %10 = zext i32 %9 to i64, !dbg !349
  %11 = inttoptr i64 %10 to i8*, !dbg !350
  call void @llvm.dbg.value(metadata i8* %11, metadata !325, metadata !DIExpression()), !dbg !338
  call void @llvm.dbg.value(metadata i8* %7, metadata !326, metadata !DIExpression()), !dbg !338
  call void @llvm.dbg.value(metadata i32 14, metadata !337, metadata !DIExpression()), !dbg !338
  %12 = getelementptr i8, i8* %7, i64 14, !dbg !351
  %13 = icmp ugt i8* %12, %11, !dbg !353
  br i1 %13, label %113, label %14, !dbg !354

14:                                               ; preds = %1
  %15 = inttoptr i64 %6 to %struct.ethhdr*, !dbg !355
  call void @llvm.dbg.value(metadata %struct.ethhdr* %15, metadata !326, metadata !DIExpression()), !dbg !338
  %16 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %15, i64 0, i32 2, !dbg !356
  %17 = load i16, i16* %16, align 1, !dbg !356, !tbaa !357
  call void @llvm.dbg.value(metadata i16 %17, metadata !336, metadata !DIExpression()), !dbg !338
  switch i16 %17, label %113 [
    i16 8, label %18
    i16 -8826, label %70
  ], !dbg !360

18:                                               ; preds = %14
  call void @llvm.dbg.value(metadata i8* %7, metadata !361, metadata !DIExpression()) #3, !dbg !383
  call void @llvm.dbg.value(metadata i64 14, metadata !367, metadata !DIExpression()) #3, !dbg !383
  call void @llvm.dbg.value(metadata i8* %11, metadata !368, metadata !DIExpression()) #3, !dbg !383
  call void @llvm.dbg.value(metadata i1 false, metadata !369, metadata !DIExpression()) #3, !dbg !383
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !370, metadata !DIExpression()) #3, !dbg !383
  call void @llvm.dbg.value(metadata i8 0, metadata !371, metadata !DIExpression(DW_OP_LLVM_fragment, 288, 8)) #3, !dbg !383
  %19 = bitcast i32* %3 to i8*, !dbg !387
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %19) #3, !dbg !387
  call void @llvm.dbg.value(metadata i32 0, metadata !379, metadata !DIExpression()) #3, !dbg !383
  store i32 0, i32* %3, align 4, !dbg !388, !tbaa !389
  call void @llvm.dbg.value(metadata i8* %7, metadata !361, metadata !DIExpression()) #3, !dbg !383
  call void @llvm.dbg.value(metadata i8* %11, metadata !368, metadata !DIExpression()) #3, !dbg !383
  call void @llvm.dbg.value(metadata i1 false, metadata !369, metadata !DIExpression()) #3, !dbg !383
  call void @llvm.dbg.value(metadata %struct.packet_description* undef, metadata !390, metadata !DIExpression()) #3, !dbg !451
  call void @llvm.dbg.value(metadata i64 14, metadata !399, metadata !DIExpression()) #3, !dbg !451
  call void @llvm.dbg.value(metadata i8* %7, metadata !401, metadata !DIExpression()) #3, !dbg !451
  call void @llvm.dbg.value(metadata i8* %11, metadata !402, metadata !DIExpression()) #3, !dbg !451
  call void @llvm.dbg.value(metadata i1 false, metadata !403, metadata !DIExpression()) #3, !dbg !451
  call void @llvm.dbg.value(metadata i8* %12, metadata !405, metadata !DIExpression()) #3, !dbg !451
  %20 = getelementptr i8, i8* %7, i64 34, !dbg !453
  %21 = icmp ugt i8* %20, %11, !dbg !457
  br i1 %21, label %68, label %22, !dbg !458

22:                                               ; preds = %18
  %23 = load i8, i8* %12, align 4, !dbg !459
  %24 = and i8 %23, 15, !dbg !459
  %25 = icmp eq i8 %24, 5, !dbg !461
  br i1 %25, label %26, label %68, !dbg !462

26:                                               ; preds = %22
  %27 = getelementptr i8, i8* %7, i64 23, !dbg !463
  %28 = load i8, i8* %27, align 1, !dbg !463, !tbaa !464
  call void @llvm.dbg.value(metadata i8 %28, metadata !371, metadata !DIExpression(DW_OP_LLVM_fragment, 288, 8)) #3, !dbg !383
  call void @llvm.dbg.value(metadata i64 14, metadata !399, metadata !DIExpression(DW_OP_plus_uconst, 20, DW_OP_stack_value)) #3, !dbg !451
  %29 = getelementptr i8, i8* %7, i64 20, !dbg !466
  %30 = bitcast i8* %29 to i16*, !dbg !466
  %31 = load i16, i16* %30, align 2, !dbg !466, !tbaa !468
  %32 = and i16 %31, -193, !dbg !469
  %33 = icmp eq i16 %32, 0, !dbg !469
  br i1 %33, label %34, label %68, !dbg !470

34:                                               ; preds = %26
  call void @llvm.dbg.value(metadata i8 %28, metadata !371, metadata !DIExpression(DW_OP_LLVM_fragment, 288, 8)) #3, !dbg !383
  call void @llvm.dbg.value(metadata i8 %28, metadata !371, metadata !DIExpression(DW_OP_LLVM_fragment, 288, 8)) #3, !dbg !383
  call void @llvm.dbg.value(metadata i32 -1, metadata !381, metadata !DIExpression()) #3, !dbg !383
  call void @llvm.dbg.value(metadata i8 %28, metadata !380, metadata !DIExpression()) #3, !dbg !383
  call void @llvm.dbg.value(metadata i32* %3, metadata !379, metadata !DIExpression(DW_OP_deref)) #3, !dbg !383
  %35 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon* @decap_counters to i8*), i8* nonnull %19) #3, !dbg !471
  call void @llvm.dbg.value(metadata i8* %35, metadata !378, metadata !DIExpression()) #3, !dbg !383
  %36 = icmp eq i8* %35, null, !dbg !472
  br i1 %36, label %68, label %37, !dbg !474

37:                                               ; preds = %34
  %38 = getelementptr inbounds i8, i8* %35, i64 16, !dbg !475
  %39 = bitcast i8* %38 to i64*, !dbg !475
  %40 = load i64, i64* %39, align 8, !dbg !476, !tbaa !477
  %41 = add i64 %40, 1, !dbg !476
  store i64 %41, i64* %39, align 8, !dbg !476, !tbaa !477
  call void @llvm.dbg.value(metadata i8 %28, metadata !380, metadata !DIExpression()) #3, !dbg !383
  switch i8 %28, label %68 [
    i8 4, label %42
    i8 41, label %42
  ], !dbg !480

42:                                               ; preds = %37, %37
  call void @llvm.dbg.value(metadata i1 false, metadata !369, metadata !DIExpression()) #3, !dbg !383
  %43 = bitcast i8* %35 to i64*, !dbg !482
  %44 = load i64, i64* %43, align 8, !dbg !486, !tbaa !487
  %45 = add i64 %44, 1, !dbg !486
  store i64 %45, i64* %43, align 8, !dbg !486, !tbaa !487
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !488, metadata !DIExpression()) #3, !dbg !502
  call void @llvm.dbg.value(metadata %struct.packet_description* undef, metadata !498, metadata !DIExpression()) #3, !dbg !502
  call void @llvm.dbg.value(metadata i64 undef, metadata !500, metadata !DIExpression()) #3, !dbg !502
  call void @llvm.dbg.value(metadata i16* undef, metadata !501, metadata !DIExpression()) #3, !dbg !502
  switch i8 %28, label %68 [
    i8 4, label %46
    i8 41, label %55
  ], !dbg !504

46:                                               ; preds = %42
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !505, metadata !DIExpression()) #3, !dbg !515
  call void @llvm.dbg.value(metadata i8* %7, metadata !514, metadata !DIExpression()) #3, !dbg !515
  call void @llvm.dbg.value(metadata i8* %29, metadata !513, metadata !DIExpression()) #3, !dbg !515
  %47 = getelementptr i8, i8* %7, i64 26, !dbg !522
  %48 = getelementptr inbounds i8, i8* %7, i64 6, !dbg !523
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %47, i8* nonnull align 1 dereferenceable(6) %48, i64 6, i1 false) #3, !dbg !524
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %29, i8* nonnull align 1 dereferenceable(6) %7, i64 6, i1 false) #3, !dbg !525
  %49 = getelementptr i8, i8* %7, i64 32, !dbg !526
  %50 = bitcast i8* %49 to i16*, !dbg !526
  store i16 8, i16* %50, align 1, !dbg !527, !tbaa !357
  %51 = bitcast %struct.xdp_md* %0 to i8*, !dbg !528
  %52 = call i32 inttoptr (i64 44 to i32 (i8*, i32)*)(i8* %51, i32 20) #3, !dbg !530
  %53 = icmp eq i32 %52, 0, !dbg !530
  %54 = select i1 %53, i32 2, i32 1, !dbg !531
  br label %68, !dbg !531

55:                                               ; preds = %42
  %56 = getelementptr i8, i8* %7, i64 54, !dbg !532
  %57 = icmp ugt i8* %56, %11, !dbg !536
  br i1 %57, label %68, label %58, !dbg !537

58:                                               ; preds = %55
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !538, metadata !DIExpression()) #3, !dbg !548
  call void @llvm.dbg.value(metadata i1 false, metadata !545, metadata !DIExpression()) #3, !dbg !548
  call void @llvm.dbg.value(metadata i8* %7, metadata !547, metadata !DIExpression()) #3, !dbg !548
  %59 = getelementptr i8, i8* %7, i64 40, !dbg !551
  call void @llvm.dbg.value(metadata i8* %59, metadata !546, metadata !DIExpression()) #3, !dbg !548
  %60 = getelementptr i8, i8* %7, i64 46, !dbg !552
  %61 = getelementptr inbounds i8, i8* %7, i64 6, !dbg !553
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %60, i8* nonnull align 1 dereferenceable(6) %61, i64 6, i1 false) #3, !dbg !554
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %59, i8* nonnull align 1 dereferenceable(6) %7, i64 6, i1 false) #3, !dbg !555
  %62 = getelementptr i8, i8* %7, i64 52, !dbg !556
  %63 = bitcast i8* %62 to i16*, !dbg !556
  store i16 -8826, i16* %63, align 1, !dbg !556, !tbaa !357
  %64 = bitcast %struct.xdp_md* %0 to i8*, !dbg !558
  %65 = call i32 inttoptr (i64 44 to i32 (i8*, i32)*)(i8* %64, i32 40) #3, !dbg !560
  %66 = icmp eq i32 %65, 0, !dbg !560
  %67 = select i1 %66, i32 2, i32 1, !dbg !561
  br label %68, !dbg !561

68:                                               ; preds = %18, %22, %26, %34, %37, %42, %46, %55, %58
  %69 = phi i32 [ 2, %34 ], [ 2, %42 ], [ 2, %37 ], [ 1, %18 ], [ 1, %22 ], [ 1, %26 ], [ 1, %55 ], [ %54, %46 ], [ %67, %58 ], !dbg !383
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %19) #3, !dbg !562
  br label %113, !dbg !563

70:                                               ; preds = %14
  call void @llvm.dbg.value(metadata i8* %7, metadata !361, metadata !DIExpression()) #3, !dbg !564
  call void @llvm.dbg.value(metadata i64 14, metadata !367, metadata !DIExpression()) #3, !dbg !564
  call void @llvm.dbg.value(metadata i8* %11, metadata !368, metadata !DIExpression()) #3, !dbg !564
  call void @llvm.dbg.value(metadata i1 true, metadata !369, metadata !DIExpression()) #3, !dbg !564
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !370, metadata !DIExpression()) #3, !dbg !564
  call void @llvm.dbg.value(metadata i8 0, metadata !371, metadata !DIExpression(DW_OP_LLVM_fragment, 288, 8)) #3, !dbg !564
  %71 = bitcast i32* %2 to i8*, !dbg !568
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %71) #3, !dbg !568
  call void @llvm.dbg.value(metadata i32 0, metadata !379, metadata !DIExpression()) #3, !dbg !564
  store i32 0, i32* %2, align 4, !dbg !569, !tbaa !389
  call void @llvm.dbg.value(metadata i8* %7, metadata !361, metadata !DIExpression()) #3, !dbg !564
  call void @llvm.dbg.value(metadata i8* %11, metadata !368, metadata !DIExpression()) #3, !dbg !564
  call void @llvm.dbg.value(metadata i1 true, metadata !369, metadata !DIExpression()) #3, !dbg !564
  call void @llvm.dbg.value(metadata %struct.packet_description* undef, metadata !390, metadata !DIExpression()) #3, !dbg !570
  call void @llvm.dbg.value(metadata i64 14, metadata !399, metadata !DIExpression()) #3, !dbg !570
  call void @llvm.dbg.value(metadata i8* %7, metadata !401, metadata !DIExpression()) #3, !dbg !570
  call void @llvm.dbg.value(metadata i8* %11, metadata !402, metadata !DIExpression()) #3, !dbg !570
  call void @llvm.dbg.value(metadata i1 true, metadata !403, metadata !DIExpression()) #3, !dbg !570
  call void @llvm.dbg.value(metadata i8* %7, metadata !422, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #3, !dbg !570
  %72 = getelementptr i8, i8* %7, i64 54, !dbg !572
  %73 = icmp ugt i8* %72, %11, !dbg !575
  br i1 %73, label %111, label %74, !dbg !576

74:                                               ; preds = %70
  call void @llvm.dbg.value(metadata i8* %7, metadata !422, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #3, !dbg !570
  call void @llvm.dbg.value(metadata i64 40, metadata !404, metadata !DIExpression()) #3, !dbg !570
  %75 = getelementptr i8, i8* %7, i64 20, !dbg !577
  %76 = load i8, i8* %75, align 2, !dbg !577, !tbaa !578
  call void @llvm.dbg.value(metadata i8 %76, metadata !371, metadata !DIExpression(DW_OP_LLVM_fragment, 288, 8)) #3, !dbg !564
  call void @llvm.dbg.value(metadata i64 14, metadata !399, metadata !DIExpression(DW_OP_plus_uconst, 40, DW_OP_stack_value)) #3, !dbg !570
  %77 = icmp eq i8 %76, 44, !dbg !581
  br i1 %77, label %111, label %78, !dbg !583

78:                                               ; preds = %74
  call void @llvm.dbg.value(metadata i8 %76, metadata !371, metadata !DIExpression(DW_OP_LLVM_fragment, 288, 8)) #3, !dbg !564
  call void @llvm.dbg.value(metadata i8 %76, metadata !371, metadata !DIExpression(DW_OP_LLVM_fragment, 288, 8)) #3, !dbg !564
  call void @llvm.dbg.value(metadata i32 -1, metadata !381, metadata !DIExpression()) #3, !dbg !564
  call void @llvm.dbg.value(metadata i8 %76, metadata !380, metadata !DIExpression()) #3, !dbg !564
  call void @llvm.dbg.value(metadata i32* %2, metadata !379, metadata !DIExpression(DW_OP_deref)) #3, !dbg !564
  %79 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon* @decap_counters to i8*), i8* nonnull %71) #3, !dbg !584
  call void @llvm.dbg.value(metadata i8* %79, metadata !378, metadata !DIExpression()) #3, !dbg !564
  %80 = icmp eq i8* %79, null, !dbg !585
  br i1 %80, label %111, label %81, !dbg !586

81:                                               ; preds = %78
  %82 = getelementptr inbounds i8, i8* %79, i64 16, !dbg !587
  %83 = bitcast i8* %82 to i64*, !dbg !587
  %84 = load i64, i64* %83, align 8, !dbg !588, !tbaa !477
  %85 = add i64 %84, 1, !dbg !588
  store i64 %85, i64* %83, align 8, !dbg !588, !tbaa !477
  call void @llvm.dbg.value(metadata i8 %76, metadata !380, metadata !DIExpression()) #3, !dbg !564
  switch i8 %76, label %111 [
    i8 4, label %86
    i8 41, label %86
  ], !dbg !589

86:                                               ; preds = %81, %81
  call void @llvm.dbg.value(metadata i1 true, metadata !369, metadata !DIExpression()) #3, !dbg !564
  %87 = getelementptr inbounds i8, i8* %79, i64 8, !dbg !590
  %88 = bitcast i8* %87 to i64*, !dbg !590
  %89 = load i64, i64* %88, align 8, !dbg !592, !tbaa !593
  %90 = add i64 %89, 1, !dbg !592
  store i64 %90, i64* %88, align 8, !dbg !592, !tbaa !593
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !488, metadata !DIExpression()) #3, !dbg !594
  call void @llvm.dbg.value(metadata %struct.packet_description* undef, metadata !498, metadata !DIExpression()) #3, !dbg !594
  call void @llvm.dbg.value(metadata i64 undef, metadata !500, metadata !DIExpression()) #3, !dbg !594
  call void @llvm.dbg.value(metadata i16* undef, metadata !501, metadata !DIExpression()) #3, !dbg !594
  switch i8 %76, label %111 [
    i8 4, label %91
    i8 41, label %101
  ], !dbg !596

91:                                               ; preds = %86
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !538, metadata !DIExpression()) #3, !dbg !597
  call void @llvm.dbg.value(metadata i1 true, metadata !545, metadata !DIExpression()) #3, !dbg !597
  call void @llvm.dbg.value(metadata i8* %7, metadata !547, metadata !DIExpression()) #3, !dbg !597
  %92 = getelementptr i8, i8* %7, i64 40, !dbg !601
  call void @llvm.dbg.value(metadata i8* %92, metadata !546, metadata !DIExpression()) #3, !dbg !597
  %93 = getelementptr i8, i8* %7, i64 46, !dbg !602
  %94 = getelementptr inbounds i8, i8* %7, i64 6, !dbg !603
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %93, i8* nonnull align 1 dereferenceable(6) %94, i64 6, i1 false) #3, !dbg !604
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %92, i8* nonnull align 1 dereferenceable(6) %7, i64 6, i1 false) #3, !dbg !605
  %95 = getelementptr i8, i8* %7, i64 52, !dbg !606
  %96 = bitcast i8* %95 to i16*, !dbg !606
  store i16 8, i16* %96, align 1, !dbg !606, !tbaa !357
  %97 = bitcast %struct.xdp_md* %0 to i8*, !dbg !607
  %98 = call i32 inttoptr (i64 44 to i32 (i8*, i32)*)(i8* %97, i32 40) #3, !dbg !608
  %99 = icmp eq i32 %98, 0, !dbg !608
  %100 = select i1 %99, i32 2, i32 1, !dbg !609
  br label %111, !dbg !609

101:                                              ; preds = %86
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !538, metadata !DIExpression()) #3, !dbg !610
  call void @llvm.dbg.value(metadata i1 false, metadata !545, metadata !DIExpression()) #3, !dbg !610
  call void @llvm.dbg.value(metadata i8* %7, metadata !547, metadata !DIExpression()) #3, !dbg !610
  %102 = getelementptr i8, i8* %7, i64 40, !dbg !612
  call void @llvm.dbg.value(metadata i8* %102, metadata !546, metadata !DIExpression()) #3, !dbg !610
  %103 = getelementptr i8, i8* %7, i64 46, !dbg !613
  %104 = getelementptr inbounds i8, i8* %7, i64 6, !dbg !614
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %103, i8* nonnull align 1 dereferenceable(6) %104, i64 6, i1 false) #3, !dbg !615
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %102, i8* nonnull align 1 dereferenceable(6) %7, i64 6, i1 false) #3, !dbg !616
  %105 = getelementptr i8, i8* %7, i64 52, !dbg !617
  %106 = bitcast i8* %105 to i16*, !dbg !617
  store i16 -8826, i16* %106, align 1, !dbg !617, !tbaa !357
  %107 = bitcast %struct.xdp_md* %0 to i8*, !dbg !618
  %108 = call i32 inttoptr (i64 44 to i32 (i8*, i32)*)(i8* %107, i32 40) #3, !dbg !619
  %109 = icmp eq i32 %108, 0, !dbg !619
  %110 = select i1 %109, i32 2, i32 1, !dbg !620
  br label %111, !dbg !620

111:                                              ; preds = %70, %74, %78, %81, %86, %91, %101
  %112 = phi i32 [ 2, %78 ], [ 2, %86 ], [ 2, %81 ], [ 1, %70 ], [ 1, %74 ], [ %100, %91 ], [ %110, %101 ], !dbg !564
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %71) #3, !dbg !621
  br label %113, !dbg !622

113:                                              ; preds = %14, %1, %111, %68
  %114 = phi i32 [ %69, %68 ], [ %112, %111 ], [ 1, %1 ], [ 2, %14 ], !dbg !338
  ret i32 %114, !dbg !623
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!307, !308, !309}
!llvm.ident = !{!310}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 659, type: !305, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !43, globals: !50, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "extracted.c", directory: "/home/sayandes/codequery/extraction")
!4 = !{!5, !14}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 3112, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "./bpf.h", directory: "/home/sayandes/codequery/extraction")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0, isUnsigned: true)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1, isUnsigned: true)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2, isUnsigned: true)
!12 = !DIEnumerator(name: "XDP_TX", value: 3, isUnsigned: true)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4, isUnsigned: true)
!14 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !15, line: 28, baseType: !7, size: 32, elements: !16)
!15 = !DIFile(filename: "/usr/include/linux/in.h", directory: "")
!16 = !{!17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42}
!17 = !DIEnumerator(name: "IPPROTO_IP", value: 0, isUnsigned: true)
!18 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1, isUnsigned: true)
!19 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2, isUnsigned: true)
!20 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4, isUnsigned: true)
!21 = !DIEnumerator(name: "IPPROTO_TCP", value: 6, isUnsigned: true)
!22 = !DIEnumerator(name: "IPPROTO_EGP", value: 8, isUnsigned: true)
!23 = !DIEnumerator(name: "IPPROTO_PUP", value: 12, isUnsigned: true)
!24 = !DIEnumerator(name: "IPPROTO_UDP", value: 17, isUnsigned: true)
!25 = !DIEnumerator(name: "IPPROTO_IDP", value: 22, isUnsigned: true)
!26 = !DIEnumerator(name: "IPPROTO_TP", value: 29, isUnsigned: true)
!27 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33, isUnsigned: true)
!28 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41, isUnsigned: true)
!29 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46, isUnsigned: true)
!30 = !DIEnumerator(name: "IPPROTO_GRE", value: 47, isUnsigned: true)
!31 = !DIEnumerator(name: "IPPROTO_ESP", value: 50, isUnsigned: true)
!32 = !DIEnumerator(name: "IPPROTO_AH", value: 51, isUnsigned: true)
!33 = !DIEnumerator(name: "IPPROTO_MTP", value: 92, isUnsigned: true)
!34 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94, isUnsigned: true)
!35 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98, isUnsigned: true)
!36 = !DIEnumerator(name: "IPPROTO_PIM", value: 103, isUnsigned: true)
!37 = !DIEnumerator(name: "IPPROTO_COMP", value: 108, isUnsigned: true)
!38 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132, isUnsigned: true)
!39 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136, isUnsigned: true)
!40 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137, isUnsigned: true)
!41 = !DIEnumerator(name: "IPPROTO_RAW", value: 255, isUnsigned: true)
!42 = !DIEnumerator(name: "IPPROTO_MAX", value: 256, isUnsigned: true)
!43 = !{!44, !45, !46, !49}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!45 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !47, line: 24, baseType: !48)
!47 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!48 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !{!0, !51, !83, !114, !136, !172, !181, !223, !236, !258, !272, !281, !294, !300}
!51 = !DIGlobalVariableExpression(var: !52, expr: !DIExpression())
!52 = distinct !DIGlobalVariable(name: "decap_counters", scope: !2, file: !53, line: 44, type: !54, isLocal: false, isDefinition: true)
!53 = !DIFile(filename: "./decap_maps.h", directory: "/home/sayandes/codequery/extraction")
!54 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !53, line: 38, size: 320, elements: !55)
!55 = !{!56, !61, !64, !73, !78}
!56 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !54, file: !53, line: 39, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !49, size: 192, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 6)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !54, file: !53, line: 40, baseType: !62, size: 64, offset: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !47, line: 27, baseType: !7)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !54, file: !53, line: 41, baseType: !65, size: 64, offset: 128)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "decap_stats", file: !53, line: 31, size: 192, elements: !67)
!67 = !{!68, !71, !72}
!68 = !DIDerivedType(tag: DW_TAG_member, name: "decap_v4", scope: !66, file: !53, line: 32, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !47, line: 31, baseType: !70)
!70 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "decap_v6", scope: !66, file: !53, line: 33, baseType: !69, size: 64, offset: 64)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "total", scope: !66, file: !53, line: 34, baseType: !69, size: 64, offset: 128)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !54, file: !53, line: 42, baseType: !74, size: 64, offset: 192)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !49, size: 32768, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 1024)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !54, file: !53, line: 43, baseType: !79, size: 64, offset: 256)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DICompositeType(tag: DW_TAG_array_type, baseType: !49, elements: !81)
!81 = !{!82}
!82 = !DISubrange(count: 0)
!83 = !DIGlobalVariableExpression(var: !84, expr: !DIExpression())
!84 = distinct !DIGlobalVariable(name: "ctl_array", scope: !2, file: !85, line: 41, type: !86, isLocal: false, isDefinition: true)
!85 = !DIFile(filename: "./control_data_maps.h", directory: "/home/sayandes/codequery/extraction")
!86 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !85, line: 35, size: 320, elements: !87)
!87 = !{!88, !93, !94, !108, !113}
!88 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !86, file: !85, line: 36, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DICompositeType(tag: DW_TAG_array_type, baseType: !49, size: 64, elements: !91)
!91 = !{!92}
!92 = !DISubrange(count: 2)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !86, file: !85, line: 37, baseType: !62, size: 64, offset: 64)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !86, file: !85, line: 38, baseType: !95, size: 64, offset: 128)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ctl_value", file: !97, line: 53, size: 64, elements: !98)
!97 = !DIFile(filename: "./balancer_structs.h", directory: "/home/sayandes/codequery/extraction")
!98 = !{!99}
!99 = !DIDerivedType(tag: DW_TAG_member, scope: !96, file: !97, line: 54, baseType: !100, size: 64)
!100 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !96, file: !97, line: 54, size: 64, elements: !101)
!101 = !{!102, !103, !104}
!102 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !100, file: !97, line: 55, baseType: !69, size: 64)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !100, file: !97, line: 56, baseType: !63, size: 32)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "mac", scope: !100, file: !97, line: 57, baseType: !105, size: 48)
!105 = !DICompositeType(tag: DW_TAG_array_type, baseType: !106, size: 48, elements: !59)
!106 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !47, line: 21, baseType: !107)
!107 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !86, file: !85, line: 39, baseType: !109, size: 64, offset: 192)
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = !DICompositeType(tag: DW_TAG_array_type, baseType: !49, size: 512, elements: !111)
!111 = !{!112}
!112 = !DISubrange(count: 16)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !86, file: !85, line: 40, baseType: !79, size: 64, offset: 256)
!114 = !DIGlobalVariableExpression(var: !115, expr: !DIExpression())
!115 = distinct !DIGlobalVariable(name: "flow_debug_maps", scope: !2, file: !116, line: 31, type: !117, isLocal: false, isDefinition: true)
!116 = !DIFile(filename: "./flow_debug_maps.h", directory: "/home/sayandes/codequery/extraction")
!117 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !116, line: 25, size: 320, elements: !118)
!118 = !{!119, !124, !129, !130, !135}
!119 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !117, file: !116, line: 26, baseType: !120, size: 64)
!120 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !121, size: 64)
!121 = !DICompositeType(tag: DW_TAG_array_type, baseType: !49, size: 384, elements: !122)
!122 = !{!123}
!123 = !DISubrange(count: 12)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !117, file: !116, line: 27, baseType: !125, size: 64, offset: 64)
!125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !126, size: 64)
!126 = !DICompositeType(tag: DW_TAG_array_type, baseType: !49, size: 128, elements: !127)
!127 = !{!128}
!128 = !DISubrange(count: 4)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !117, file: !116, line: 28, baseType: !125, size: 64, offset: 128)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !117, file: !116, line: 29, baseType: !131, size: 64, offset: 192)
!131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !132, size: 64)
!132 = !DICompositeType(tag: DW_TAG_array_type, baseType: !49, size: 4096, elements: !133)
!133 = !{!134}
!134 = !DISubrange(count: 128)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !117, file: !116, line: 30, baseType: !79, size: 64, offset: 256)
!136 = !DIGlobalVariableExpression(var: !137, expr: !DIExpression())
!137 = distinct !DIGlobalVariable(name: "vip_map", scope: !2, file: !138, line: 38, type: !139, isLocal: false, isDefinition: true)
!138 = !DIFile(filename: "./balancer_maps.h", directory: "/home/sayandes/codequery/extraction")
!139 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !138, line: 32, size: 320, elements: !140)
!140 = !{!141, !146, !160, !166, !171}
!141 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !139, file: !138, line: 33, baseType: !142, size: 64)
!142 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !143, size: 64)
!143 = !DICompositeType(tag: DW_TAG_array_type, baseType: !49, size: 32, elements: !144)
!144 = !{!145}
!145 = !DISubrange(count: 1)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !139, file: !138, line: 34, baseType: !147, size: 64, offset: 64)
!147 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !148, size: 64)
!148 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vip_definition", file: !97, line: 62, size: 160, elements: !149)
!149 = !{!150, !158, !159}
!150 = !DIDerivedType(tag: DW_TAG_member, scope: !148, file: !97, line: 63, baseType: !151, size: 128)
!151 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !148, file: !97, line: 63, size: 128, elements: !152)
!152 = !{!153, !156}
!153 = !DIDerivedType(tag: DW_TAG_member, name: "vip", scope: !151, file: !97, line: 64, baseType: !154, size: 32)
!154 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !155, line: 27, baseType: !63)
!155 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!156 = !DIDerivedType(tag: DW_TAG_member, name: "vipv6", scope: !151, file: !97, line: 65, baseType: !157, size: 128)
!157 = !DICompositeType(tag: DW_TAG_array_type, baseType: !154, size: 128, elements: !127)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "port", scope: !148, file: !97, line: 67, baseType: !46, size: 16, offset: 128)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "proto", scope: !148, file: !97, line: 68, baseType: !106, size: 8, offset: 144)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !139, file: !138, line: 35, baseType: !161, size: 64, offset: 128)
!161 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !162, size: 64)
!162 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vip_meta", file: !97, line: 72, size: 64, elements: !163)
!163 = !{!164, !165}
!164 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !162, file: !97, line: 73, baseType: !63, size: 32)
!165 = !DIDerivedType(tag: DW_TAG_member, name: "vip_num", scope: !162, file: !97, line: 74, baseType: !63, size: 32, offset: 32)
!166 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !139, file: !138, line: 36, baseType: !167, size: 64, offset: 192)
!167 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !168, size: 64)
!168 = !DICompositeType(tag: DW_TAG_array_type, baseType: !49, size: 16384, elements: !169)
!169 = !{!170}
!170 = !DISubrange(count: 512)
!171 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !139, file: !138, line: 37, baseType: !79, size: 64, offset: 256)
!172 = !DIGlobalVariableExpression(var: !173, expr: !DIExpression())
!173 = distinct !DIGlobalVariable(name: "lru_mapping", scope: !2, file: !138, line: 47, type: !174, isLocal: false, isDefinition: true)
!174 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !138, line: 41, size: 320, elements: !175)
!175 = !{!176, !177, !178, !179, !180}
!176 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !174, file: !138, line: 42, baseType: !120, size: 64)
!177 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !174, file: !138, line: 43, baseType: !125, size: 64, offset: 64)
!178 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !174, file: !138, line: 44, baseType: !125, size: 64, offset: 128)
!179 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !174, file: !138, line: 45, baseType: !131, size: 64, offset: 192)
!180 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !174, file: !138, line: 46, baseType: !79, size: 64, offset: 256)
!181 = !DIGlobalVariableExpression(var: !182, expr: !DIExpression())
!182 = distinct !DIGlobalVariable(name: "fallback_cache", scope: !2, file: !138, line: 56, type: !183, isLocal: false, isDefinition: true)
!183 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !138, line: 50, size: 320, elements: !184)
!184 = !{!185, !190, !211, !217, !222}
!185 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !183, file: !138, line: 51, baseType: !186, size: 64)
!186 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !187, size: 64)
!187 = !DICompositeType(tag: DW_TAG_array_type, baseType: !49, size: 288, elements: !188)
!188 = !{!189}
!189 = !DISubrange(count: 9)
!190 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !183, file: !138, line: 52, baseType: !191, size: 64, offset: 64)
!191 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !192, size: 64)
!192 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "flow_key", file: !97, line: 26, size: 320, elements: !193)
!193 = !{!194, !199, !204, !210}
!194 = !DIDerivedType(tag: DW_TAG_member, scope: !192, file: !97, line: 27, baseType: !195, size: 128)
!195 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !192, file: !97, line: 27, size: 128, elements: !196)
!196 = !{!197, !198}
!197 = !DIDerivedType(tag: DW_TAG_member, name: "src", scope: !195, file: !97, line: 28, baseType: !154, size: 32)
!198 = !DIDerivedType(tag: DW_TAG_member, name: "srcv6", scope: !195, file: !97, line: 29, baseType: !157, size: 128)
!199 = !DIDerivedType(tag: DW_TAG_member, scope: !192, file: !97, line: 31, baseType: !200, size: 128, offset: 128)
!200 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !192, file: !97, line: 31, size: 128, elements: !201)
!201 = !{!202, !203}
!202 = !DIDerivedType(tag: DW_TAG_member, name: "dst", scope: !200, file: !97, line: 32, baseType: !154, size: 32)
!203 = !DIDerivedType(tag: DW_TAG_member, name: "dstv6", scope: !200, file: !97, line: 33, baseType: !157, size: 128)
!204 = !DIDerivedType(tag: DW_TAG_member, scope: !192, file: !97, line: 35, baseType: !205, size: 32, offset: 256)
!205 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !192, file: !97, line: 35, size: 32, elements: !206)
!206 = !{!207, !208}
!207 = !DIDerivedType(tag: DW_TAG_member, name: "ports", scope: !205, file: !97, line: 36, baseType: !63, size: 32)
!208 = !DIDerivedType(tag: DW_TAG_member, name: "port16", scope: !205, file: !97, line: 37, baseType: !209, size: 32)
!209 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 32, elements: !91)
!210 = !DIDerivedType(tag: DW_TAG_member, name: "proto", scope: !192, file: !97, line: 39, baseType: !106, size: 8, offset: 288)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !183, file: !138, line: 53, baseType: !212, size: 64, offset: 128)
!212 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !213, size: 64)
!213 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "real_pos_lru", file: !97, line: 78, size: 128, elements: !214)
!214 = !{!215, !216}
!215 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !213, file: !97, line: 79, baseType: !63, size: 32)
!216 = !DIDerivedType(tag: DW_TAG_member, name: "atime", scope: !213, file: !97, line: 80, baseType: !69, size: 64, offset: 64)
!217 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !183, file: !138, line: 54, baseType: !218, size: 64, offset: 192)
!218 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !219, size: 64)
!219 = !DICompositeType(tag: DW_TAG_array_type, baseType: !49, size: 32000, elements: !220)
!220 = !{!221}
!221 = !DISubrange(count: 1000)
!222 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !183, file: !138, line: 55, baseType: !79, size: 64, offset: 256)
!223 = !DIGlobalVariableExpression(var: !224, expr: !DIExpression())
!224 = distinct !DIGlobalVariable(name: "ch_rings", scope: !2, file: !138, line: 65, type: !225, isLocal: false, isDefinition: true)
!225 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !138, line: 59, size: 320, elements: !226)
!226 = !{!227, !228, !229, !230, !235}
!227 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !225, file: !138, line: 60, baseType: !89, size: 64)
!228 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !225, file: !138, line: 61, baseType: !62, size: 64, offset: 64)
!229 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !225, file: !138, line: 62, baseType: !62, size: 64, offset: 128)
!230 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !225, file: !138, line: 63, baseType: !231, size: 64, offset: 192)
!231 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !232, size: 64)
!232 = !DICompositeType(tag: DW_TAG_array_type, baseType: !49, size: 1073758208, elements: !233)
!233 = !{!234}
!234 = !DISubrange(count: 33554944)
!235 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !225, file: !138, line: 64, baseType: !79, size: 64, offset: 256)
!236 = !DIGlobalVariableExpression(var: !237, expr: !DIExpression())
!237 = distinct !DIGlobalVariable(name: "reals", scope: !2, file: !138, line: 74, type: !238, isLocal: false, isDefinition: true)
!238 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !138, line: 68, size: 320, elements: !239)
!239 = !{!240, !241, !242, !252, !257}
!240 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !238, file: !138, line: 69, baseType: !89, size: 64)
!241 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !238, file: !138, line: 70, baseType: !62, size: 64, offset: 64)
!242 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !238, file: !138, line: 71, baseType: !243, size: 64, offset: 128)
!243 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !244, size: 64)
!244 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "real_definition", file: !97, line: 84, size: 160, elements: !245)
!245 = !{!246, !251}
!246 = !DIDerivedType(tag: DW_TAG_member, scope: !244, file: !97, line: 85, baseType: !247, size: 128)
!247 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !244, file: !97, line: 85, size: 128, elements: !248)
!248 = !{!249, !250}
!249 = !DIDerivedType(tag: DW_TAG_member, name: "dst", scope: !247, file: !97, line: 86, baseType: !154, size: 32)
!250 = !DIDerivedType(tag: DW_TAG_member, name: "dstv6", scope: !247, file: !97, line: 87, baseType: !157, size: 128)
!251 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !244, file: !97, line: 89, baseType: !106, size: 8, offset: 128)
!252 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !238, file: !138, line: 72, baseType: !253, size: 64, offset: 192)
!253 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !254, size: 64)
!254 = !DICompositeType(tag: DW_TAG_array_type, baseType: !49, size: 131072, elements: !255)
!255 = !{!256}
!256 = !DISubrange(count: 4096)
!257 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !238, file: !138, line: 73, baseType: !79, size: 64, offset: 256)
!258 = !DIGlobalVariableExpression(var: !259, expr: !DIExpression())
!259 = distinct !DIGlobalVariable(name: "reals_stats", scope: !2, file: !138, line: 83, type: !260, isLocal: false, isDefinition: true)
!260 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !138, line: 77, size: 320, elements: !261)
!261 = !{!262, !263, !264, !270, !271}
!262 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !260, file: !138, line: 78, baseType: !57, size: 64)
!263 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !260, file: !138, line: 79, baseType: !62, size: 64, offset: 64)
!264 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !260, file: !138, line: 80, baseType: !265, size: 64, offset: 128)
!265 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !266, size: 64)
!266 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "lb_stats", file: !97, line: 93, size: 128, elements: !267)
!267 = !{!268, !269}
!268 = !DIDerivedType(tag: DW_TAG_member, name: "v1", scope: !266, file: !97, line: 94, baseType: !69, size: 64)
!269 = !DIDerivedType(tag: DW_TAG_member, name: "v2", scope: !266, file: !97, line: 95, baseType: !69, size: 64, offset: 64)
!270 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !260, file: !138, line: 81, baseType: !253, size: 64, offset: 192)
!271 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !260, file: !138, line: 82, baseType: !79, size: 64, offset: 256)
!272 = !DIGlobalVariableExpression(var: !273, expr: !DIExpression())
!273 = distinct !DIGlobalVariable(name: "stats", scope: !2, file: !138, line: 92, type: !274, isLocal: false, isDefinition: true)
!274 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !138, line: 86, size: 320, elements: !275)
!275 = !{!276, !277, !278, !279, !280}
!276 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !274, file: !138, line: 87, baseType: !57, size: 64)
!277 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !274, file: !138, line: 88, baseType: !62, size: 64, offset: 64)
!278 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !274, file: !138, line: 89, baseType: !265, size: 64, offset: 128)
!279 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !274, file: !138, line: 90, baseType: !74, size: 64, offset: 192)
!280 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !274, file: !138, line: 91, baseType: !79, size: 64, offset: 256)
!281 = !DIGlobalVariableExpression(var: !282, expr: !DIExpression())
!282 = distinct !DIGlobalVariable(name: "server_id_map", scope: !2, file: !138, line: 102, type: !283, isLocal: false, isDefinition: true)
!283 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !138, line: 96, size: 320, elements: !284)
!284 = !{!285, !286, !287, !288, !293}
!285 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !283, file: !138, line: 97, baseType: !89, size: 64)
!286 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !283, file: !138, line: 98, baseType: !62, size: 64, offset: 64)
!287 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !283, file: !138, line: 99, baseType: !62, size: 64, offset: 128)
!288 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !283, file: !138, line: 100, baseType: !289, size: 64, offset: 192)
!289 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !290, size: 64)
!290 = !DICompositeType(tag: DW_TAG_array_type, baseType: !49, size: 536870848, elements: !291)
!291 = !{!292}
!292 = !DISubrange(count: 16777214)
!293 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !283, file: !138, line: 101, baseType: !79, size: 64, offset: 256)
!294 = !DIGlobalVariableExpression(var: !295, expr: !DIExpression())
!295 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !296, line: 22, type: !297, isLocal: true, isDefinition: true)
!296 = !DIFile(filename: "./bpf_helpers.h", directory: "/home/sayandes/codequery/extraction")
!297 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !298, size: 64)
!298 = !DISubroutineType(types: !299)
!299 = !{!44, !44, !44}
!300 = !DIGlobalVariableExpression(var: !301, expr: !DIExpression())
!301 = distinct !DIGlobalVariable(name: "bpf_xdp_adjust_head", scope: !2, file: !296, line: 91, type: !302, isLocal: true, isDefinition: true)
!302 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !303, size: 64)
!303 = !DISubroutineType(types: !304)
!304 = !{!49, !44, !49}
!305 = !DICompositeType(tag: DW_TAG_array_type, baseType: !306, size: 32, elements: !127)
!306 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!307 = !{i32 7, !"Dwarf Version", i32 4}
!308 = !{i32 2, !"Debug Info Version", i32 3}
!309 = !{i32 1, !"wchar_size", i32 4}
!310 = !{!"clang version 10.0.0-4ubuntu1 "}
!311 = distinct !DISubprogram(name: "xdpdecap", scope: !3, file: !3, line: 635, type: !312, scopeLine: 635, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !322)
!312 = !DISubroutineType(types: !313)
!313 = !{!49, !314}
!314 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !315, size: 64)
!315 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 3123, size: 160, elements: !316)
!316 = !{!317, !318, !319, !320, !321}
!317 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !315, file: !6, line: 3124, baseType: !63, size: 32)
!318 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !315, file: !6, line: 3125, baseType: !63, size: 32, offset: 32)
!319 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !315, file: !6, line: 3126, baseType: !63, size: 32, offset: 64)
!320 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !315, file: !6, line: 3128, baseType: !63, size: 32, offset: 96)
!321 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !315, file: !6, line: 3129, baseType: !63, size: 32, offset: 128)
!322 = !{!323, !324, !325, !326, !336, !337}
!323 = !DILocalVariable(name: "ctx", arg: 1, scope: !311, file: !3, line: 635, type: !314)
!324 = !DILocalVariable(name: "data", scope: !311, file: !3, line: 636, type: !44)
!325 = !DILocalVariable(name: "data_end", scope: !311, file: !3, line: 637, type: !44)
!326 = !DILocalVariable(name: "eth", scope: !311, file: !3, line: 638, type: !327)
!327 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !328, size: 64)
!328 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !329, line: 163, size: 112, elements: !330)
!329 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "")
!330 = !{!331, !333, !334}
!331 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !328, file: !329, line: 164, baseType: !332, size: 48)
!332 = !DICompositeType(tag: DW_TAG_array_type, baseType: !107, size: 48, elements: !59)
!333 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !328, file: !329, line: 165, baseType: !332, size: 48, offset: 48)
!334 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !328, file: !329, line: 166, baseType: !335, size: 16, offset: 96)
!335 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !155, line: 25, baseType: !46)
!336 = !DILocalVariable(name: "eth_proto", scope: !311, file: !3, line: 639, type: !63)
!337 = !DILocalVariable(name: "nh_off", scope: !311, file: !3, line: 640, type: !63)
!338 = !DILocation(line: 0, scope: !311)
!339 = !DILocation(line: 636, column: 34, scope: !311)
!340 = !{!341, !342, i64 0}
!341 = !{!"xdp_md", !342, i64 0, !342, i64 4, !342, i64 8, !342, i64 12, !342, i64 16}
!342 = !{!"int", !343, i64 0}
!343 = !{!"omnipotent char", !344, i64 0}
!344 = !{!"Simple C/C++ TBAA"}
!345 = !DILocation(line: 636, column: 23, scope: !311)
!346 = !DILocation(line: 636, column: 16, scope: !311)
!347 = !DILocation(line: 637, column: 38, scope: !311)
!348 = !{!341, !342, i64 4}
!349 = !DILocation(line: 637, column: 27, scope: !311)
!350 = !DILocation(line: 637, column: 20, scope: !311)
!351 = !DILocation(line: 643, column: 12, scope: !352)
!352 = distinct !DILexicalBlock(scope: !311, file: !3, line: 643, column: 7)
!353 = !DILocation(line: 643, column: 21, scope: !352)
!354 = !DILocation(line: 643, column: 7, scope: !311)
!355 = !DILocation(line: 638, column: 24, scope: !311)
!356 = !DILocation(line: 648, column: 20, scope: !311)
!357 = !{!358, !359, i64 12}
!358 = !{!"ethhdr", !343, i64 0, !343, i64 6, !359, i64 12}
!359 = !{!"short", !343, i64 0}
!360 = !DILocation(line: 650, column: 7, scope: !311)
!361 = !DILocalVariable(name: "data", arg: 1, scope: !362, file: !3, line: 573, type: !44)
!362 = distinct !DISubprogram(name: "process_packet", scope: !3, file: !3, line: 572, type: !363, scopeLine: 577, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !366)
!363 = !DISubroutineType(types: !364)
!364 = !{!49, !44, !69, !44, !365, !314}
!365 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!366 = !{!361, !367, !368, !369, !370, !371, !378, !379, !380, !381, !382}
!367 = !DILocalVariable(name: "off", arg: 2, scope: !362, file: !3, line: 574, type: !69)
!368 = !DILocalVariable(name: "data_end", arg: 3, scope: !362, file: !3, line: 575, type: !44)
!369 = !DILocalVariable(name: "is_ipv6", arg: 4, scope: !362, file: !3, line: 576, type: !365)
!370 = !DILocalVariable(name: "xdp", arg: 5, scope: !362, file: !3, line: 577, type: !314)
!371 = !DILocalVariable(name: "pckt", scope: !362, file: !3, line: 578, type: !372)
!372 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "packet_description", file: !97, line: 43, size: 384, elements: !373)
!373 = !{!374, !375, !376, !377}
!374 = !DIDerivedType(tag: DW_TAG_member, name: "flow", scope: !372, file: !97, line: 44, baseType: !192, size: 320)
!375 = !DIDerivedType(tag: DW_TAG_member, name: "real_index", scope: !372, file: !97, line: 45, baseType: !63, size: 32, offset: 320)
!376 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !372, file: !97, line: 46, baseType: !106, size: 8, offset: 352)
!377 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !372, file: !97, line: 48, baseType: !106, size: 8, offset: 360)
!378 = !DILocalVariable(name: "data_stats", scope: !362, file: !3, line: 579, type: !65)
!379 = !DILocalVariable(name: "key", scope: !362, file: !3, line: 580, type: !63)
!380 = !DILocalVariable(name: "protocol", scope: !362, file: !3, line: 581, type: !106)
!381 = !DILocalVariable(name: "action", scope: !362, file: !3, line: 583, type: !49)
!382 = !DILocalVariable(name: "pkt_bytes", scope: !362, file: !3, line: 584, type: !46)
!383 = !DILocation(line: 0, scope: !362, inlinedAt: !384)
!384 = distinct !DILocation(line: 651, column: 12, scope: !385)
!385 = distinct !DILexicalBlock(scope: !386, file: !3, line: 650, column: 33)
!386 = distinct !DILexicalBlock(scope: !311, file: !3, line: 650, column: 7)
!387 = !DILocation(line: 580, column: 3, scope: !362, inlinedAt: !384)
!388 = !DILocation(line: 580, column: 9, scope: !362, inlinedAt: !384)
!389 = !{!342, !342, i64 0}
!390 = !DILocalVariable(name: "pckt", arg: 1, scope: !391, file: !3, line: 117, type: !394)
!391 = distinct !DISubprogram(name: "process_l3_headers", scope: !3, file: !3, line: 116, type: !392, scopeLine: 123, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !397)
!392 = !DISubroutineType(types: !393)
!393 = !{!49, !394, !395, !69, !396, !44, !44, !365}
!394 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !372, size: 64)
!395 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!396 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!397 = !{!390, !398, !399, !400, !401, !402, !403, !404, !405, !422}
!398 = !DILocalVariable(name: "protocol", arg: 2, scope: !391, file: !3, line: 118, type: !395)
!399 = !DILocalVariable(name: "off", arg: 3, scope: !391, file: !3, line: 119, type: !69)
!400 = !DILocalVariable(name: "pkt_bytes", arg: 4, scope: !391, file: !3, line: 120, type: !396)
!401 = !DILocalVariable(name: "data", arg: 5, scope: !391, file: !3, line: 121, type: !44)
!402 = !DILocalVariable(name: "data_end", arg: 6, scope: !391, file: !3, line: 122, type: !44)
!403 = !DILocalVariable(name: "is_ipv6", arg: 7, scope: !391, file: !3, line: 123, type: !365)
!404 = !DILocalVariable(name: "iph_len", scope: !391, file: !3, line: 124, type: !69)
!405 = !DILocalVariable(name: "iph", scope: !391, file: !3, line: 125, type: !406)
!406 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !407, size: 64)
!407 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !408, line: 86, size: 160, elements: !409)
!408 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "")
!409 = !{!410, !411, !412, !413, !414, !415, !416, !417, !418, !420, !421}
!410 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !407, file: !408, line: 88, baseType: !106, size: 4, flags: DIFlagBitField, extraData: i64 0)
!411 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !407, file: !408, line: 89, baseType: !106, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!412 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !407, file: !408, line: 96, baseType: !106, size: 8, offset: 8)
!413 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !407, file: !408, line: 97, baseType: !335, size: 16, offset: 16)
!414 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !407, file: !408, line: 98, baseType: !335, size: 16, offset: 32)
!415 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !407, file: !408, line: 99, baseType: !335, size: 16, offset: 48)
!416 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !407, file: !408, line: 100, baseType: !106, size: 8, offset: 64)
!417 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !407, file: !408, line: 101, baseType: !106, size: 8, offset: 72)
!418 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !407, file: !408, line: 102, baseType: !419, size: 16, offset: 80)
!419 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !155, line: 31, baseType: !46)
!420 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !407, file: !408, line: 103, baseType: !154, size: 32, offset: 96)
!421 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !407, file: !408, line: 104, baseType: !154, size: 32, offset: 128)
!422 = !DILocalVariable(name: "ip6h", scope: !391, file: !3, line: 126, type: !423)
!423 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !424, size: 64)
!424 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !425, line: 116, size: 320, elements: !426)
!425 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "")
!426 = !{!427, !428, !429, !433, !434, !435, !436, !450}
!427 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !424, file: !425, line: 118, baseType: !106, size: 4, flags: DIFlagBitField, extraData: i64 0)
!428 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !424, file: !425, line: 119, baseType: !106, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!429 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !424, file: !425, line: 126, baseType: !430, size: 24, offset: 8)
!430 = !DICompositeType(tag: DW_TAG_array_type, baseType: !106, size: 24, elements: !431)
!431 = !{!432}
!432 = !DISubrange(count: 3)
!433 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !424, file: !425, line: 128, baseType: !335, size: 16, offset: 32)
!434 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !424, file: !425, line: 129, baseType: !106, size: 8, offset: 48)
!435 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !424, file: !425, line: 130, baseType: !106, size: 8, offset: 56)
!436 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !424, file: !425, line: 132, baseType: !437, size: 128, offset: 64)
!437 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !438, line: 33, size: 128, elements: !439)
!438 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "")
!439 = !{!440}
!440 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !437, file: !438, line: 40, baseType: !441, size: 128)
!441 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !437, file: !438, line: 34, size: 128, elements: !442)
!442 = !{!443, !445, !449}
!443 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !441, file: !438, line: 35, baseType: !444, size: 128)
!444 = !DICompositeType(tag: DW_TAG_array_type, baseType: !106, size: 128, elements: !111)
!445 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !441, file: !438, line: 37, baseType: !446, size: 128)
!446 = !DICompositeType(tag: DW_TAG_array_type, baseType: !335, size: 128, elements: !447)
!447 = !{!448}
!448 = !DISubrange(count: 8)
!449 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !441, file: !438, line: 38, baseType: !157, size: 128)
!450 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !424, file: !425, line: 133, baseType: !437, size: 128, offset: 192)
!451 = !DILocation(line: 0, scope: !391, inlinedAt: !452)
!452 = distinct !DILocation(line: 585, column: 12, scope: !362, inlinedAt: !384)
!453 = !DILocation(line: 144, column: 13, scope: !454, inlinedAt: !452)
!454 = distinct !DILexicalBlock(scope: !455, file: !3, line: 144, column: 9)
!455 = distinct !DILexicalBlock(scope: !456, file: !3, line: 142, column: 10)
!456 = distinct !DILexicalBlock(scope: !391, file: !3, line: 127, column: 7)
!457 = !DILocation(line: 144, column: 17, scope: !454, inlinedAt: !452)
!458 = !DILocation(line: 144, column: 9, scope: !455, inlinedAt: !452)
!459 = !DILocation(line: 148, column: 14, scope: !460, inlinedAt: !452)
!460 = distinct !DILexicalBlock(scope: !455, file: !3, line: 148, column: 9)
!461 = !DILocation(line: 148, column: 18, scope: !460, inlinedAt: !452)
!462 = !DILocation(line: 148, column: 9, scope: !455, inlinedAt: !452)
!463 = !DILocation(line: 154, column: 22, scope: !455, inlinedAt: !452)
!464 = !{!465, !343, i64 9}
!465 = !{!"iphdr", !343, i64 0, !343, i64 0, !343, i64 1, !359, i64 2, !359, i64 4, !359, i64 6, !343, i64 8, !343, i64 9, !359, i64 10, !342, i64 12, !342, i64 16}
!466 = !DILocation(line: 159, column: 14, scope: !467, inlinedAt: !452)
!467 = distinct !DILexicalBlock(scope: !455, file: !3, line: 159, column: 9)
!468 = !{!465, !359, i64 6}
!469 = !DILocation(line: 159, column: 23, scope: !467, inlinedAt: !452)
!470 = !DILocation(line: 159, column: 9, scope: !455, inlinedAt: !452)
!471 = !DILocation(line: 592, column: 16, scope: !362, inlinedAt: !384)
!472 = !DILocation(line: 593, column: 8, scope: !473, inlinedAt: !384)
!473 = distinct !DILexicalBlock(scope: !362, file: !3, line: 593, column: 7)
!474 = !DILocation(line: 593, column: 7, scope: !362, inlinedAt: !384)
!475 = !DILocation(line: 597, column: 15, scope: !362, inlinedAt: !384)
!476 = !DILocation(line: 597, column: 21, scope: !362, inlinedAt: !384)
!477 = !{!478, !479, i64 16}
!478 = !{!"decap_stats", !479, i64 0, !479, i64 8, !479, i64 16}
!479 = !{!"long long", !343, i64 0}
!480 = !DILocation(line: 598, column: 32, scope: !481, inlinedAt: !384)
!481 = distinct !DILexicalBlock(scope: !362, file: !3, line: 598, column: 7)
!482 = !DILocation(line: 602, column: 19, scope: !483, inlinedAt: !384)
!483 = distinct !DILexicalBlock(scope: !484, file: !3, line: 601, column: 12)
!484 = distinct !DILexicalBlock(scope: !485, file: !3, line: 599, column: 9)
!485 = distinct !DILexicalBlock(scope: !481, file: !3, line: 598, column: 61)
!486 = !DILocation(line: 602, column: 28, scope: !483, inlinedAt: !384)
!487 = !{!478, !479, i64 0}
!488 = !DILocalVariable(name: "xdp", arg: 3, scope: !489, file: !3, line: 202, type: !314)
!489 = distinct !DISubprogram(name: "process_encaped_ipip_pckt", scope: !3, file: !3, line: 199, type: !490, scopeLine: 207, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !494)
!490 = !DISubroutineType(types: !491)
!491 = !{!49, !492, !492, !314, !493, !394, !395, !69, !396}
!492 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!493 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !365, size: 64)
!494 = !{!495, !496, !488, !497, !498, !499, !500, !501}
!495 = !DILocalVariable(name: "data", arg: 1, scope: !489, file: !3, line: 200, type: !492)
!496 = !DILocalVariable(name: "data_end", arg: 2, scope: !489, file: !3, line: 201, type: !492)
!497 = !DILocalVariable(name: "is_ipv6", arg: 4, scope: !489, file: !3, line: 203, type: !493)
!498 = !DILocalVariable(name: "pckt", arg: 5, scope: !489, file: !3, line: 204, type: !394)
!499 = !DILocalVariable(name: "protocol", arg: 6, scope: !489, file: !3, line: 205, type: !395)
!500 = !DILocalVariable(name: "off", arg: 7, scope: !489, file: !3, line: 206, type: !69)
!501 = !DILocalVariable(name: "pkt_bytes", arg: 8, scope: !489, file: !3, line: 207, type: !396)
!502 = !DILocation(line: 0, scope: !489, inlinedAt: !503)
!503 = distinct !DILocation(line: 604, column: 14, scope: !485, inlinedAt: !384)
!504 = !DILocation(line: 208, column: 7, scope: !489, inlinedAt: !503)
!505 = !DILocalVariable(name: "xdp", arg: 1, scope: !506, file: !507, line: 159, type: !314)
!506 = distinct !DISubprogram(name: "decap_v4", scope: !507, file: !507, line: 159, type: !508, scopeLine: 159, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !510)
!507 = !DIFile(filename: "./pckt_encap.h", directory: "/home/sayandes/codequery/extraction")
!508 = !DISubroutineType(types: !509)
!509 = !{!365, !314, !492, !492}
!510 = !{!505, !511, !512, !513, !514}
!511 = !DILocalVariable(name: "data", arg: 2, scope: !506, file: !507, line: 159, type: !492)
!512 = !DILocalVariable(name: "data_end", arg: 3, scope: !506, file: !507, line: 159, type: !492)
!513 = !DILocalVariable(name: "new_eth", scope: !506, file: !507, line: 160, type: !327)
!514 = !DILocalVariable(name: "old_eth", scope: !506, file: !507, line: 161, type: !327)
!515 = !DILocation(line: 0, scope: !506, inlinedAt: !516)
!516 = distinct !DILocation(line: 221, column: 12, scope: !517, inlinedAt: !503)
!517 = distinct !DILexicalBlock(scope: !518, file: !3, line: 221, column: 11)
!518 = distinct !DILexicalBlock(scope: !519, file: !3, line: 217, column: 12)
!519 = distinct !DILexicalBlock(scope: !520, file: !3, line: 209, column: 9)
!520 = distinct !DILexicalBlock(scope: !521, file: !3, line: 208, column: 34)
!521 = distinct !DILexicalBlock(scope: !489, file: !3, line: 208, column: 7)
!522 = !DILocation(line: 164, column: 19, scope: !506, inlinedAt: !516)
!523 = !DILocation(line: 164, column: 38, scope: !506, inlinedAt: !516)
!524 = !DILocation(line: 164, column: 3, scope: !506, inlinedAt: !516)
!525 = !DILocation(line: 165, column: 3, scope: !506, inlinedAt: !516)
!526 = !DILocation(line: 166, column: 12, scope: !506, inlinedAt: !516)
!527 = !DILocation(line: 166, column: 20, scope: !506, inlinedAt: !516)
!528 = !DILocation(line: 167, column: 27, scope: !529, inlinedAt: !516)
!529 = distinct !DILexicalBlock(scope: !506, file: !507, line: 167, column: 7)
!530 = !DILocation(line: 167, column: 7, scope: !529, inlinedAt: !516)
!531 = !DILocation(line: 167, column: 7, scope: !506, inlinedAt: !516)
!532 = !DILocation(line: 226, column: 41, scope: !533, inlinedAt: !503)
!533 = distinct !DILexicalBlock(scope: !534, file: !3, line: 226, column: 9)
!534 = distinct !DILexicalBlock(scope: !535, file: !3, line: 225, column: 41)
!535 = distinct !DILexicalBlock(scope: !521, file: !3, line: 225, column: 14)
!536 = !DILocation(line: 226, column: 66, scope: !533, inlinedAt: !503)
!537 = !DILocation(line: 226, column: 9, scope: !534, inlinedAt: !503)
!538 = !DILocalVariable(name: "xdp", arg: 1, scope: !539, file: !507, line: 138, type: !314)
!539 = distinct !DISubprogram(name: "decap_v6", scope: !507, file: !507, line: 138, type: !540, scopeLine: 138, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !542)
!540 = !DISubroutineType(types: !541)
!541 = !{!365, !314, !492, !492, !365}
!542 = !{!538, !543, !544, !545, !546, !547}
!543 = !DILocalVariable(name: "data", arg: 2, scope: !539, file: !507, line: 138, type: !492)
!544 = !DILocalVariable(name: "data_end", arg: 3, scope: !539, file: !507, line: 138, type: !492)
!545 = !DILocalVariable(name: "inner_v4", arg: 4, scope: !539, file: !507, line: 138, type: !365)
!546 = !DILocalVariable(name: "new_eth", scope: !539, file: !507, line: 139, type: !327)
!547 = !DILocalVariable(name: "old_eth", scope: !539, file: !507, line: 140, type: !327)
!548 = !DILocation(line: 0, scope: !539, inlinedAt: !549)
!549 = distinct !DILocation(line: 229, column: 10, scope: !550, inlinedAt: !503)
!550 = distinct !DILexicalBlock(scope: !534, file: !3, line: 229, column: 9)
!551 = !DILocation(line: 142, column: 19, scope: !539, inlinedAt: !549)
!552 = !DILocation(line: 143, column: 19, scope: !539, inlinedAt: !549)
!553 = !DILocation(line: 143, column: 38, scope: !539, inlinedAt: !549)
!554 = !DILocation(line: 143, column: 3, scope: !539, inlinedAt: !549)
!555 = !DILocation(line: 144, column: 3, scope: !539, inlinedAt: !549)
!556 = !DILocation(line: 0, scope: !557, inlinedAt: !549)
!557 = distinct !DILexicalBlock(scope: !539, file: !507, line: 145, column: 7)
!558 = !DILocation(line: 150, column: 27, scope: !559, inlinedAt: !549)
!559 = distinct !DILexicalBlock(scope: !539, file: !507, line: 150, column: 7)
!560 = !DILocation(line: 150, column: 7, scope: !559, inlinedAt: !549)
!561 = !DILocation(line: 150, column: 7, scope: !539, inlinedAt: !549)
!562 = !DILocation(line: 629, column: 1, scope: !362, inlinedAt: !384)
!563 = !DILocation(line: 651, column: 5, scope: !385)
!564 = !DILocation(line: 0, scope: !362, inlinedAt: !565)
!565 = distinct !DILocation(line: 653, column: 12, scope: !566)
!566 = distinct !DILexicalBlock(scope: !567, file: !3, line: 652, column: 42)
!567 = distinct !DILexicalBlock(scope: !386, file: !3, line: 652, column: 14)
!568 = !DILocation(line: 580, column: 3, scope: !362, inlinedAt: !565)
!569 = !DILocation(line: 580, column: 9, scope: !362, inlinedAt: !565)
!570 = !DILocation(line: 0, scope: !391, inlinedAt: !571)
!571 = distinct !DILocation(line: 585, column: 12, scope: !362, inlinedAt: !565)
!572 = !DILocation(line: 129, column: 14, scope: !573, inlinedAt: !571)
!573 = distinct !DILexicalBlock(scope: !574, file: !3, line: 129, column: 9)
!574 = distinct !DILexicalBlock(scope: !456, file: !3, line: 127, column: 16)
!575 = !DILocation(line: 129, column: 18, scope: !573, inlinedAt: !571)
!576 = !DILocation(line: 129, column: 9, scope: !574, inlinedAt: !571)
!577 = !DILocation(line: 134, column: 23, scope: !574, inlinedAt: !571)
!578 = !{!579, !343, i64 6}
!579 = !{!"ipv6hdr", !343, i64 0, !343, i64 0, !343, i64 1, !359, i64 4, !343, i64 6, !343, i64 7, !580, i64 8, !580, i64 24}
!580 = !{!"in6_addr", !343, i64 0}
!581 = !DILocation(line: 138, column: 19, scope: !582, inlinedAt: !571)
!582 = distinct !DILexicalBlock(scope: !574, file: !3, line: 138, column: 9)
!583 = !DILocation(line: 138, column: 9, scope: !574, inlinedAt: !571)
!584 = !DILocation(line: 592, column: 16, scope: !362, inlinedAt: !565)
!585 = !DILocation(line: 593, column: 8, scope: !473, inlinedAt: !565)
!586 = !DILocation(line: 593, column: 7, scope: !362, inlinedAt: !565)
!587 = !DILocation(line: 597, column: 15, scope: !362, inlinedAt: !565)
!588 = !DILocation(line: 597, column: 21, scope: !362, inlinedAt: !565)
!589 = !DILocation(line: 598, column: 32, scope: !481, inlinedAt: !565)
!590 = !DILocation(line: 600, column: 19, scope: !591, inlinedAt: !565)
!591 = distinct !DILexicalBlock(scope: !484, file: !3, line: 599, column: 18)
!592 = !DILocation(line: 600, column: 28, scope: !591, inlinedAt: !565)
!593 = !{!478, !479, i64 8}
!594 = !DILocation(line: 0, scope: !489, inlinedAt: !595)
!595 = distinct !DILocation(line: 604, column: 14, scope: !485, inlinedAt: !565)
!596 = !DILocation(line: 208, column: 7, scope: !489, inlinedAt: !595)
!597 = !DILocation(line: 0, scope: !539, inlinedAt: !598)
!598 = distinct !DILocation(line: 214, column: 12, scope: !599, inlinedAt: !595)
!599 = distinct !DILexicalBlock(scope: !600, file: !3, line: 214, column: 11)
!600 = distinct !DILexicalBlock(scope: !519, file: !3, line: 209, column: 19)
!601 = !DILocation(line: 142, column: 19, scope: !539, inlinedAt: !598)
!602 = !DILocation(line: 143, column: 19, scope: !539, inlinedAt: !598)
!603 = !DILocation(line: 143, column: 38, scope: !539, inlinedAt: !598)
!604 = !DILocation(line: 143, column: 3, scope: !539, inlinedAt: !598)
!605 = !DILocation(line: 144, column: 3, scope: !539, inlinedAt: !598)
!606 = !DILocation(line: 0, scope: !557, inlinedAt: !598)
!607 = !DILocation(line: 150, column: 27, scope: !559, inlinedAt: !598)
!608 = !DILocation(line: 150, column: 7, scope: !559, inlinedAt: !598)
!609 = !DILocation(line: 150, column: 7, scope: !539, inlinedAt: !598)
!610 = !DILocation(line: 0, scope: !539, inlinedAt: !611)
!611 = distinct !DILocation(line: 229, column: 10, scope: !550, inlinedAt: !595)
!612 = !DILocation(line: 142, column: 19, scope: !539, inlinedAt: !611)
!613 = !DILocation(line: 143, column: 19, scope: !539, inlinedAt: !611)
!614 = !DILocation(line: 143, column: 38, scope: !539, inlinedAt: !611)
!615 = !DILocation(line: 143, column: 3, scope: !539, inlinedAt: !611)
!616 = !DILocation(line: 144, column: 3, scope: !539, inlinedAt: !611)
!617 = !DILocation(line: 0, scope: !557, inlinedAt: !611)
!618 = !DILocation(line: 150, column: 27, scope: !559, inlinedAt: !611)
!619 = !DILocation(line: 150, column: 7, scope: !559, inlinedAt: !611)
!620 = !DILocation(line: 150, column: 7, scope: !539, inlinedAt: !611)
!621 = !DILocation(line: 629, column: 1, scope: !362, inlinedAt: !565)
!622 = !DILocation(line: 653, column: 5, scope: !566)
!623 = !DILocation(line: 658, column: 1, scope: !311)
