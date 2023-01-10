import 'package:ecommerce/Providers/menu_controller.dart';
import 'package:ecommerce/common/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'percentage_card.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: context.read<MenuController>().controlMenu,
          ),
        Expanded(
            flex: 2,
            child: Text("Order Managenment",
                style: Theme.of(context).textTheme.headline6)),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        // const Expanded(flex: 3, child: PercentageCard())
      ],
    );
  }
}
