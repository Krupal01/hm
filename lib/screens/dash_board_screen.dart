import 'package:flutter/material.dart';
import 'package:hotel_management/network/NetworkService.dart';
import 'package:hotel_management/routes/routes_name.dart';
import 'package:hotel_management/widgets/table_widget.dart';

import '../widgets/custom_app_bar.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dashboard',
        isDrawerIcon: true,
        onLeadPress: () => _openDrawer(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const TableWidget();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(ORDER_DETAILS_SCREEN),
      ),
    );
  }
}
