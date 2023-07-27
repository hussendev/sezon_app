import 'package:flutter/material.dart';
import 'package:sezon_app/app/modules/home/views/widgets/complete_orders.dart';
import 'package:sezon_app/app/modules/home/views/widgets/pending_orders.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key});
  @override
  State<OrderWidget> createState() => _MyOrderWidgetState();
}

class _MyOrderWidgetState extends State<OrderWidget>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Pending Orders',
    ),
    Tab(text: 'Completed Orders'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          labelColor: Colors.black,
          indicatorColor: Colors.red,
          controller: _tabController,
          tabs: myTabs,
        ),
        Expanded(
          child: TabBarView(controller: _tabController, children:const [
            PendingOrders(),

            CompletedOrders(),
          ]),
        ),
      ],
    );
  }
}



