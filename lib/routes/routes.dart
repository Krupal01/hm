import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_management/cubit/login_cubit.dart';
import 'package:hotel_management/routes/routes_name.dart';
import 'package:hotel_management/screens/dash_board_screen.dart';
import 'package:hotel_management/screens/login_screen.dart';
import 'package:hotel_management/screens/menu_screen.dart';
import 'package:hotel_management/screens/oder_details_screen.dart';

import '../repository/NetworkRepository.dart';
import '../screens/splash_screen.dart';

class Routes {
  final NetworkRepository networkRepository;

  Routes(this.networkRepository);

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASH_SCREEN:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
      case LOGIN_SCREEN:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: LoginCubit(networkRepository),
            child: LoginScreen(),
          ),
        );
      case DASHBOARD_SCREEN:
        return MaterialPageRoute(
          builder: (context) => DashBoardScreen(),
        );
      case ORDER_DETAILS_SCREEN:
        return MaterialPageRoute(
          builder: (context) => OrderDetailsScreen(
            isDetails: (settings.arguments as Map)[ARG_IS_DETAILS],
            orderId: (settings.arguments as Map)[ARG_ORDER_ID],
          ),
        );
      case MENU_SCREEN:
        return MaterialPageRoute(
          builder: (context) => const MenuScreen(),
        );
    }
    return null;
  }
}
