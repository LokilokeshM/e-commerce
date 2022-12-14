import 'package:ecommerce/UI/catalogue_manager/catalogue_management_bloc.dart';
import 'package:ecommerce/UI/catalogue_manager/components/dashboard_screen/my_fields.dart';
import 'package:ecommerce/UI/catalogue_manager/components/dashboard_screen/storage_details.dart';
import 'package:ecommerce/common/responsive.dart';
import 'package:flutter/material.dart';

import '../../../../constant/constant.dart';
import 'filter_screen.dart';
import 'header.dart';
import 'recent_files.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key, required this.bloc}) : super(key: key);
  final CatalogueManagementBloc bloc;
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const MyFiles(),
                      const SizedBox(height: defaultPadding),
                      _bottomNavBar(),
                      const SizedBox(height: defaultPadding),
                      FilterScreen(),
                      const SizedBox(height: defaultPadding),
                      RecentFiles(bloc: widget.bloc),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) const StorageDetails(),
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
    );
  }

  ///Dummy on tap Function
  void _onItemTapped(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  ///Bottom Navigation Content Widget
  Row _bottomNavBar() {
    return Row(children: [
      Expanded(
        flex: 4,
        child: BottomNavigationBar(
          elevation: 0,
          selectedItemColor: Colors.blue,
          backgroundColor: Colors.transparent,
          selectedIconTheme: IconTheme.of(context),
          currentIndex: currentIndex,
          selectedLabelStyle: const TextStyle(color: Colors.blue),
          unselectedLabelStyle: const TextStyle(color: Colors.blue),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Text(
                "All",
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Text(
                "Active",
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Text(
                "InActive",
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Text(
                "Draft",
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Text(
                "Pending QC",
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Text(
                "Violation",
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Text(
                "Deleted",
              ),
              label: '',
            )
          ],
          onTap: _onItemTapped,
        ),
      ),
      Expanded(
        flex: 5,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  "424/20,0000",
                ),
                Icon(
                  Icons.warning_rounded,
                )
              ],
            )
          ],
        ),
      )
    ]);
  }
}
