import 'package:ecommerce/Providers/menu_controller.dart';
import 'package:ecommerce/UI/catalogue_manager/Product/product_page.dart';
import 'package:ecommerce/UI/catalogue_manager/catalogue_management_bloc.dart';
import 'package:ecommerce/UI/catalogue_manager/components/side_menu/end_menu.dart';
import 'package:ecommerce/common/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/side_menu/side_menu.dart';
import 'dashboard_screen/dashboard_screen.dart';
import 'order/order_page.dart';

class CatalogueManaganemtPage extends StatefulWidget {
  CatalogueManaganemtPage({Key? key}) : super(key: key);

  @override
  State<CatalogueManaganemtPage> createState() =>
      _CatalogueManaganemtPageState();
}

class _CatalogueManaganemtPageState extends State<CatalogueManaganemtPage> {
  CatalogueManagementBloc bloc = CatalogueManagementBloc();
  int index = 0;
  @override
  void initState() {
    super.initState();
    bloc.init();
  }

  late BuildContext _context;
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(
          // onPress: sideMenuOnPress
          ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(
                    // onPress: sideMenuOnPress,
                    ),
              ),

            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: Material(
                  child: Navigator(
                onGenerateRoute: (_) =>
                    MaterialPageRoute(builder: (materialContext) {
                  return Builder(builder: (builderContext) {
                    return OrderPage();
                  });
                }),
              )),
            )
          ],
        ),
      ),
      endDrawer: const EndMenuPage(),
    );
  }

  Widget switchScreen() {
    switch (index) {
      case 1:
        return const DashboardPage();
      case 2:
        return ProductPage(
          bloc: bloc,
        );
      case 3:
        return OrderPage();
      case 4:
        return Container();
      case 5:
        return Container();
      case 6:
        return Container();
      // case 111:
      //   return const ProfilePage();
      default:
        return const DashboardPage();
    }
  }

  // sideMenuOnPress(String title) {
  //   List<String> sideMenu = [
  //     "",
  //     "Dashboard",
  //     "Products",
  //     "Orders",
  //     "Marketing Center",
  //     "Notification",
  //     "Settings",
  //   ];
  //   setState(() {
  //     index = sideMenu.indexOf(title);
  //   });
  // }
}
