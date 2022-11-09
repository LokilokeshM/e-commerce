import 'package:flutter/material.dart';
import 'package:ecommerce/Router/router_path.dart';
import 'package:ecommerce/UI/dashboard/dashboard_page.dart';

///App routing Navigation
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterPath.DASHBOARD:
        return MaterialPageRoute(builder: (_) => DashboardPage());
      default:
        return defaultRoute(settings);
    }
  }

  ///Default route when the App loads
  static MaterialPageRoute defaultRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => _loadingPage(),
    );
  }

  ///Sample loading screen
  ///Need to add some Shimmer Widget
  static _loadingPage() {
    return Container();
  }
}
