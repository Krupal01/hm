import 'package:flutter/material.dart';
import 'package:hotel_management/repository/NetworkRepository.dart';
import 'package:hotel_management/routes/routes.dart';
import 'package:hotel_management/routes/routes_name.dart';

void main() {
  runApp(MyApp(
    routes: Routes(NetworkRepository()),
  ));
}

class MyApp extends StatelessWidget {
  final Routes routes;
  const MyApp({super.key, required this.routes});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      initialRoute: DASHBOARD_SCREEN,
      onGenerateRoute: (settings) => routes.onGenerateRoute(settings),
    );
  }
}
