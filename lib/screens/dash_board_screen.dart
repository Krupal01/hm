import 'package:flutter/material.dart';
import 'package:hotel_management/network/NetworkService.dart';
import 'package:hotel_management/routes/routes_name.dart';
import 'package:hotel_management/widgets/custom_drawer.dart';
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
      key: _scaffoldKey,
      appBar: CustomAppBar(
        title: 'Dashboard',
        isDrawerIcon: true,
        onLeadPress: () => _openDrawer(),
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return TableWidget(
                onLeftSwap: (isClean) {},
                onRightSwap: () => Navigator.of(context).pushNamed(
                  ORDER_DETAILS_SCREEN,
                  arguments: {
                    ARG_IS_DETAILS: true,
                  },
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed(
          ORDER_DETAILS_SCREEN,
          arguments: {
            ARG_IS_DETAILS: false,
          },
        ),
      ),
    );
  }
}
