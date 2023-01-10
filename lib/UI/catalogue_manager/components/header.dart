import 'package:ecommerce/Providers/menu_controller.dart';
import 'package:ecommerce/UI/catalogue_manager/Product/components/header.dart';
import 'package:ecommerce/UI/catalogue_manager/catalogue_management_bloc.dart';
import 'package:ecommerce/UI/catalogue_manager/notification/notification_detail_page.dart';
import 'package:ecommerce/common/responsive.dart';
import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.buildContext,
  });
  final BuildContext buildContext;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: context.read<MenuController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text(
            "Aarkind Shop",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.black),
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        const Expanded(child: SearchField()),
        const SizedBox(
          width: defaultPadding,
        ),
        InkWell(
          onTap: () {
            Scaffold.of(buildContext).openEndDrawer();
          },
          child: CircleAvatar(
            child: Image.asset(
              "assets/images/profile_pic.png",
              height: 38,
            ),
          ),
        ),
        const SizedBox(
          width: defaultPadding,
        ),
        GFIconBadge(
          counterChild: const GFBadge(
            child: Text("12"),
          ),
          child: GFIconButton(
            onPressed: () {
              showDialog(
                  context: buildContext,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        alignment: Alignment.topRight,
                        backgroundColor: secondaryColor,
                        content: Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Stack(children: <Widget>[
                            Positioned(
                              top: 10.0,
                              child: InkResponse(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "Notification",
                                  )),
                            ),
                            Positioned(
                              right: 20,
                              top: 5.0,
                              child: InkResponse(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const CircleAvatar(
                                  radius: 20,
                                  child: Icon(Icons.close),
                                ),
                              ),
                            ),
                            Positioned(
                                top: 50,
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    height: MediaQuery.of(context).size.height -
                                        100,
                                    child: const SingleChildScrollView(
                                      child: NotificationDetailPage(),
                                    )))
                          ]),
                        ));
                  });
            },
            size: GFSize.SMALL,
            icon: const Icon(Icons.notifications),
            shape: GFIconButtonShape.pills,
          ),
        ),
      ],
    );
  }
}
