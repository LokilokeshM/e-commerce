import 'package:ecommerce/UI/home/home_bloc.dart';
import 'package:ecommerce/common/components/product_card.dart';
import 'package:ecommerce/common/size_congig.dart';
import 'package:ecommerce/model/produt.dart';
import 'package:flutter/material.dart';

import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  final HomeBloc bloc;
  PopularProducts({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        StreamBuilder<List<Product?>>(
            stream: bloc.productList,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return Container(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length - 1,
                    itemBuilder: (context, index) {
                      return ProductCard(product: snapshot.data![index]!);
                    },
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
        SizedBox(width: getProportionateScreenWidth(20)),
      ],
    );
  }
}
