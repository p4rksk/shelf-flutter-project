import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shelf/main.dart';

import '../../../../_core/constants/http.dart';
import '../../../../data/model/home/brandnew_dto.dart';
import '../../../../data/repository/brandnew_repo.dart';

class BrandNewModel {
  final DateTime selectedMonth;
  final List<BrandNewRespDTO> books;

  BrandNewModel({
    required this.selectedMonth,
    required this.books,
  });

  BrandNewModel copyWith({
    DateTime? selectedMonth,
    List<BrandNewRespDTO>? books,
  }) {
    return BrandNewModel(
      selectedMonth: selectedMonth ?? this.selectedMonth,
      books: books ?? this.books,
    );
  }
}

class BrandNewViewModel extends StateNotifier<BrandNewModel?> {
  Ref ref;
  final mContext = navigatorKey.currentContext;

  BrandNewViewModel(super._state, this.ref) {
    fetchBrandNewData();
  }

  Future<void> fetchBrandNewData() async {
    try {
      final responseDTO = await BrandnewRepo().fetchBrandNewData();
      final books = responseDTO.data;
      final initialMonth = DateTime.now();

      state = BrandNewModel(
        selectedMonth: initialMonth,
        books: books,
      );
    } catch (e) {
      print("데이터를 가져오는 중 오류 발생: $e");
    }
  }
}

final brandNewProvider = StateNotifierProvider<BrandNewViewModel, BrandNewModel?>(
      (ref) => BrandNewViewModel(null, ref),
);