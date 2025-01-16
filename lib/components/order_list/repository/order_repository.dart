import 'package:restaurant_app/components/local_db/globals.dart';
import 'package:restaurant_app/components/order_list/model/order_model.dart';

class OrderRepository {
  Future<List<OrderModel>> fetchOrders() async {
    final orders = await database.fetchOrders();
    return orders;
  }

  Future<void> createOrder(OrderModel order) async {
    await database.createOrder(order.toOrderCompanion());
  }

  Future<void> changeOrderStatus(int id, bool isPaid) async {
    await database.changeOrderStatus(id, isPaid);
  }
}
