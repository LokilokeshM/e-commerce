import 'package:ecommerce/common/widget/social_media_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';

class EndSideBarContent {
  EndSideBarContent({required this.icons, required this.title});
  final IconData icons;
  final String title;
}

class ThemeContent extends StatelessWidget {
  ThemeContent({Key? key}) : super(key: key);
  List<EndSideBarContent> menu = [
    EndSideBarContent(icons: Icons.help, title: "Help"),
    EndSideBarContent(icons: Icons.contact_support, title: "Contact Support"),
    EndSideBarContent(icons: Icons.new_label, title: "What's New"),
    EndSideBarContent(icons: Icons.add, title: "Join The Community"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 27, 26, 26),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const ListTile(
          title: Text("AArkind Technology"),
          trailing: Icon(Icons.settings),
        ),
        const SizedBox(
          height: 50,
        ),
        const Text(
          "Theme",
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        ListTile(
          title: Text("Menu Colors"),
          trailing: GFToggle(
            onChanged: (val) {},
            value: true,
          ),
        ),
        const Divider(
          height: 3,
          color: Colors.white,
        ),
        ListTile(
          title: Text("Theme Colors"),
          trailing: Container(
            width: 80,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GFCheckbox(
                    size: GFSize.SMALL,
                    activeBgColor: GFColors.DANGER,
                    inactiveBgColor: GFColors.DANGER,
                    type: GFCheckboxType.circle,
                    onChanged: (value) {},
                    value: true,
                  ),
                  GFCheckbox(
                    size: GFSize.SMALL,
                    type: GFCheckboxType.circle,
                    activeBgColor: GFColors.SECONDARY,
                    inactiveBgColor: GFColors.SECONDARY,
                    onChanged: (value) {},
                    value: false,
                  ),
                  GFCheckbox(
                    size: GFSize.SMALL,
                    activeBgColor: GFColors.SUCCESS,
                    inactiveBgColor: GFColors.SUCCESS,
                    type: GFCheckboxType.circle,
                    onChanged: (value) {},
                    value: false,
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: ListView.separated(
                itemCount: menu.length,
                separatorBuilder: (context, index) => const Divider(
                      height: 5,
                      color: Colors.white,
                    ),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(menu[index].icons),
                    title: Text(menu[index].title),
                  );
                }),
          ),
        ),
        SizedBox(
          height: 100.h,
        ),
        const SocialMediaIcon()
      ]),
    );
  }
}
