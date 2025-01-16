import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/components/order_list/model/menu_item_model.dart';
import 'package:restaurant_app/components/order_list/model/order_model.dart';
import 'package:restaurant_app/components/order_list/repository/order_repository.dart';
import 'package:restaurant_app/components/order_page/bloc/order_page_bloc.dart';
import 'package:restaurant_app/components/order_page/ui/added_item.dart';
import 'package:restaurant_app/components/order_page/ui/menu_item_card.dart';

class OrderItemAddPage extends StatefulWidget {
  const OrderItemAddPage({super.key});

  @override
  State<OrderItemAddPage> createState() => _OrderItemAddPageState();
}

class _OrderItemAddPageState extends State<OrderItemAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Items'),
        backgroundColor: Colors.amberAccent,
      ),
      body: BlocBuilder<OrderPageBloc, OrderPageState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<OrderPageBloc, OrderPageState>(
                    builder: (context, state) {
                      switch (state.status) {
                        case OrderAddItemsPageStatus.initial:
                        case OrderAddItemsPageStatus.loading:
                          return Center(child: CircularProgressIndicator());
                        case OrderAddItemsPageStatus.success:
                          return CustomScrollView(
                            slivers: [
                              if (state.orderedMenuItems.isNotEmpty)
                                SliverToBoxAdapter(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height /
                                        2.5,
                                    child: ListView.builder(
                                      itemCount: state.orderedMenuItems.length,
                                      itemBuilder: (context, index) {
                                        return AddedItemCard(
                                            menuItem:
                                                state.orderedMenuItems[index]);
                                      },
                                    ),
                                  ),
                                )
                              else
                                SliverToBoxAdapter(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height /
                                        2.5,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Добавьте предмет',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              SliverToBoxAdapter(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  height:
                                      MediaQuery.of(context).size.height / 2.5,
                                  child: GridView.builder(
                                    itemCount: state.menuItems.length,
                                    itemBuilder: (context, index) {
                                      return MenuItemCard(
                                          menuItem: state.menuItems[index]);
                                    },
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio: 1 / 0.6,
                                            mainAxisSpacing: 10,
                                            crossAxisSpacing: 10,
                                            crossAxisCount: 2),
                                  ),
                                ),
                              ),
                            ],
                          );
                        case OrderAddItemsPageStatus.failure:
                          return Center(child: Text('ERROR'));
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      if (state.orderedMenuItems.isNotEmpty) {
                        double totalSum = state.orderedMenuItems.fold(
                          0.0,
                          (sum, item) =>
                              sum + (item.itemPrice * item.itemCount),
                        );
                        final OrderModel newOrder = OrderModel(
                            id: 0,
                            sum: totalSum,
                            placementId: 1,
                            isPaid: false);
                        context.read<OrderRepository>().createOrder(newOrder);
                        context.read<OrderPageBloc>().add(ClearStateEvent());
                        Navigator.of(context).pop();
                      }
                    },
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          'Сохранить',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
