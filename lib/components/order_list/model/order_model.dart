import 'dart:ffi';

import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';

import '../../local_db/local_db.dart';

class OrderModel extends Equatable {
  const OrderModel(
      {required this.id,
      required this.sum,
      required this.placementId,
      required this.isPaid});

  final int id;
  final double sum;
  final int placementId;
  final bool isPaid;

  OrderModel.fromLocal(Order data)
      : id = data.id,
        sum = data.sum,
        placementId = data.placementId,
        isPaid = data.isPaid;

  OrdersCompanion toOrderCompanion() {
    final sumCompanion = Value<double>(sum);
    final placementIdCompanion = Value<int>(placementId);
    final isPaidCompanion = Value<bool>(isPaid);
    return OrdersCompanion(
      sum: sumCompanion,
      placementId: placementIdCompanion,
      isPaid: isPaidCompanion,
    );
  }

  OrderModel copyWith({
    int? id,
    double? sum,
    int? placementId,
    bool? isPaid,
  }) {
    return OrderModel(
      id: id ?? this.id,
      sum: sum ?? this.sum,
      placementId: placementId ?? this.placementId,
      isPaid: isPaid ?? this.isPaid,
    );
  }

  @override
  List<Object?> get props => [id, sum, placementId, isPaid];
}
