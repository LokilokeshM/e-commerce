import 'package:ecommerce/UI/dashboard/tileCards.dart';
import 'package:ecommerce/UI/home/home_bloc.dart';

import 'package:ecommerce/common/size_congig.dart';
import 'package:ecommerce/common/widget/rating/rating.dart';
import 'package:flutter/material.dart';

import '../../common/kitchnomics_String.dart';
import '../../constant/constant.dart';
import '../../model/card_helper_entity.dart';
import '../dashboard/title_with_button.dart';
import '../home/components/categories.dart';
import 'components/discount_banner.dart';
import 'components/popular_product.dart';
import 'components/special_offers.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc _bloc = HomeBloc();
  @override
  void initState() {
    super.initState();
    _bloc.init();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  ///Main Content Start
  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Stack(children: [
          const Positioned(
              left: 20,
              child: Text(
                "Fashion",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.transparent],
              ).createShader(Rect.fromLTRB(
                rect.width,
                rect.height,
                0,
                0,
              ));
            },
            blendMode: BlendMode.dstIn,
            child: Image.asset(
              "assets/images/Image Banner 3.png",
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 10,
            right: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  EcommerceString.of(context: context).mixedVegsBakedText,
                  style: const TextStyle(
                    fontSize: 20,
                    color: kPrimaryColor,
                  ),
                ),
                StarRating(
                  color: Colors.amber[500],
                  rating: 3,
                )
              ],
            ),
          ),
        ]),
        SizedBox(height: getProportionateScreenWidth(10)),
        DiscountBanner(),
        Categories(),
        SpecialOffers(),
        SizedBox(height: getProportionateScreenWidth(30)),
        PopularProducts(),
      ]),
    );
  }
}
