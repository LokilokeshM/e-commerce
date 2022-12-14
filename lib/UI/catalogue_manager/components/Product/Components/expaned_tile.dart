import 'package:flutter/material.dart';

import 'oa_card.dart';

class ExpandedTile extends StatelessWidget {
  final Widget? leftIcon;
  final Widget? rightIcon;
  final Widget? cardChild;
  final String title;
  final Function? onPress;

  const ExpandedTile({
    Key? key,
    this.leftIcon,
    this.rightIcon,
    required this.cardChild,
    required this.title,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OACard(
      cardChild: expandedTileWidget(),
      onPress: onPress,
    );
  }

  Widget expandedTileWidget() {
    var _cardChild = cardChild;
    _cardChild ??= Container();
    return Column(
      children: [
        ListTile(
          title: Text(title,
              style: const TextStyle(fontSize: 20, color: Colors.black)),
          leading: leftIcon ?? Container(),
          trailing: rightIcon ?? Container(),
        ),
        _cardChild,
      ],
    );
  }
}
