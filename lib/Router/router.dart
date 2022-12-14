import 'package:ecommerce/UI/cart/cart_screen.dart';
import 'package:ecommerce/UI/catalogue_manager/catalogue_management_page.dart';
import 'package:ecommerce/UI/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Router/router_path.dart';
import 'package:ecommerce/UI/dashboard/dashboard_page.dart';

///App routing Navigation
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterPath.DASHBOARD:
        return MaterialPageRoute(builder: (_) => DashboardPage());
      case RouterPath.PRODUCT_DETAILS:
        return MaterialPageRoute(
            builder: (_) => DetailsScreen(
                  agrs: settings.arguments as ProductDetailsArguments,
                ));
      case RouterPath.CART_PAGE:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case RouterPath.CATALOG_MANAGENMENT_PAGE:
        return MaterialPageRoute(builder: (_) => CatalogueManaganemtPage());
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
