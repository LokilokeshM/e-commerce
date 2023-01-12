import 'package:ecommerce/Providers/menu_controller.dart';
import 'package:ecommerce/UI/catalogue_manager/catalogue_management_bloc.dart';
import 'package:ecommerce/UI/catalogue_manager/components/header.dart';

import 'package:ecommerce/common/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constant/constant.dart';
import 'components/filter_screen.dart';
import 'components/filter_tabs.dart';
import 'components/my_fields.dart';
import 'components/recent_files.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key, required this.bloc}) : super(key: key);
  final CatalogueManagementBloc bloc;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    widget.bloc.getProductList();
  }

  // int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Navigator(
        onGenerateRoute: (_) => MaterialPageRoute(builder: (materialContext) {
          return Builder(builder: (builderContext) {
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  primary: false,
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      Header(buildContext: context),
                      const SizedBox(height: defaultPadding),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                MyFiles(
                                  bloc: widget.bloc,
                                ),
                                const SizedBox(height: defaultPadding),
                                // _bottomNavBar(),
                                SizedBox(
                                    height: 100,
                                    child: MyTabbedPage(
                                      tabs: productTabs,
                                      onTap: () {},
                                    )),
                                const SizedBox(height: defaultPadding),
                                FilterScreen(),
                                const SizedBox(height: defaultPadding),
                                RecentFiles(
                                    bloc: widget.bloc, context: context),
                                if (Responsive.isMobile(context))
                                  const SizedBox(height: defaultPadding),
                                // if (Responsive.isMobile(context))
                                //   const StorageDetails(),
                              ],
                            ),
                          ),
                          // if (!Responsive.isMobile(context))
                          //   SizedBox(width: defaultPadding),
                          // On Mobile means if the screen is less than 850 we dont want to show it
                          // if (!Responsive.isMobile(context))
                          //   Expanded(
                          //     flex: 2,
                          //     child: StarageDetails(),
                          //   ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        }),
      ),
    );
  }

  // ///Dummy on tap Function
  // void _onItemTapped(int value) {
  //   setState(() {
  //     currentIndex = value;
  //   });
  // }

  // ///Bottom Navigation Content Widget
  // Row _bottomNavBar() {
  //   return Row(children: [
  //     Expanded(
  //       flex: 10,
  //       child: BottomNavigationBar(
  //         elevation: 0,
  //         selectedItemColor: Colors.blue,
  //         backgroundColor: Colors.transparent,
  //         selectedIconTheme: IconTheme.of(context),
  //         currentIndex: currentIndex,
  //         selectedLabelStyle: const TextStyle(color: Colors.blue),
  //         unselectedLabelStyle: const TextStyle(color: Colors.blue),
  //         items: const <BottomNavigationBarItem>[
  //           BottomNavigationBarItem(
  //             icon: Text(
  //               "All",
  //             ),
  //             label: '',
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Text(
  //               "Active",
  //             ),
  //             label: '',
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Text(
  //               "InActive",
  //             ),
  //             label: '',
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Text(
  //               "Draft",
  //             ),
  //             label: '',
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Text(
  //               "Pending QC",
  //             ),
  //             label: '',
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Text(
  //               "Violation",
  //             ),
  //             label: '',
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Text(
  //               "Deleted",
  //             ),
  //             label: '',
  //           )
  //         ],
  //         onTap: _onItemTapped,
  //       ),
  //     ),
  //     Expanded(
  //       flex: 3,
  //       child: Column(
  //         children: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: const [
  //               Text(
  //                 "424/20,0000",
  //               ),
  //               Icon(
  //                 Icons.warning_rounded,
  //               )
  //             ],
  //           )
  //         ],
  //       ),
  //     )
  //   ]);
  // }
}
