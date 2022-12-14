import 'package:ecommerce/Providers/menu_controller.dart';
import 'package:ecommerce/UI/catalogue_manager/catalogue_management_bloc.dart';
import 'package:ecommerce/UI/catalogue_manager/components/dashboard_screen/dashboard_screen.dart';
import 'package:ecommerce/common/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/side_menu/side_menu.dart';

class CatalogueManaganemtPage extends StatefulWidget {
  CatalogueManaganemtPage({Key? key}) : super(key: key);

  @override
  State<CatalogueManaganemtPage> createState() =>
      _CatalogueManaganemtPageState();
}

class _CatalogueManaganemtPageState extends State<CatalogueManaganemtPage> {
  CatalogueManagementBloc bloc = CatalogueManagementBloc();
  @override
  void initState() {
    super.initState();
    bloc.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(bloc: bloc),
            ),
          ],
        ),
      ),
    );
  }
}
