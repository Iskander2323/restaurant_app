import 'package:equatable/equatable.dart';

// import '../../local_db/local_db.dart';

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

  // OrderModel.fromLocal(Order data)
  //     : id = data.id,
  //       placementName = data.title;

  @override
  List<Object?> get props => [id, sum, placementId, isPaid];
}
