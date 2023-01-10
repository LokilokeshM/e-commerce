import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  SideMenu({Key? key, required this.onPress}) : super(key: key);
  Function(String title) onPress;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {
              onPress("Dashboard");
            },
          ),
          DrawerListTile(
            title: "Products",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              onPress("Products");
            },
          ),
          DrawerListTile(
            title: "Orders",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {
              onPress("Orders");
            },
          ),
          DrawerListTile(
            title: "Marketing Center",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              onPress("Marketing Center");
            },
          ),
          // DrawerListTile(
          //   title: "",
          //   svgSrc: "assets/icons/menu_store.svg",
          //   press: () {},
          // ),
          // DrawerListTile(
          //   title: "Notification",
          //   svgSrc: "assets/icons/menu_notification.svg",
          //   press: () {
          //     onPress("Notification");
          //   },
          // ),
          // DrawerListTile(
          //   title: "Profile",
          //   svgSrc: "assets/icons/menu_profile.svg",
          //   press: () {},
          // ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {
              onPress("Settings");
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
