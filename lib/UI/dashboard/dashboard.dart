import 'package:flutter/material.dart';
import 'package:kitchenomics/UI/dashboard/tileCards.dart';
import 'package:kitchenomics/UI/dashboard/title_with_button.dart';
import 'package:kitchenomics/common/widget/rating/rating.dart';
import 'package:kitchenomics/constant/bottom_bar.dart';
import 'package:kitchenomics/constant/constant.dart';
import 'package:kitchenomics/model/card_helper_entity.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomAppBar,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 7, 103, 32),
        onTap: _onItemTapped,
      ),
    );
  }

  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
      selectedItemColor: const Color.fromARGB(255, 15, 228, 125),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icon/Plan.png",
            height: 40,
            width: 40,
          ),
          label: 'Plan',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icon/Cook Now.png",
            height: 40,
            width: 40,
          ),
          label: 'Cook Now',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icon/Home.png",
            height: 40,
            width: 40,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icon/Learn.png",
            height: 40,
            width: 40,
          ),
          label: 'Learn',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/icon/Store.png",
            height: 40,
            width: 40,
          ),
          label: 'Shop',
        ),
      ],
      onTap: _onItemTapped,
    );
  }

  AppBar _appBar() {
    return AppBar(
        leading: const Icon(
          Icons.notifications_outlined,
          color: kPrimaryBlackColor,
        ),
        title: const Center(
          child: Text(
            "Kitchenomics",
            style: TextStyle(
              color: kHeadingTextColor,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: kPrimaryColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: kPrimaryBlackColor,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_outline),
            color: kPrimaryBlackColor,
          )
        ]);
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(children: [
        Stack(children: [
          const Positioned(
              left: 20,
              child: Text(
                "Recipe of the Day",
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
              "assets/image/Mask Group 175@2x.png",
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
                const Text(
                  "Mixed Veges Baked",
                  style: TextStyle(
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
        const Divider(
          thickness: 1,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 10,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
//when I remove this line, background color will change with the BoxShadow color
            color: Color.fromARGB(255, 9, 190, 15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 3,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(6.0),
          ),
          height: 100,
          child: Stack(children: [
            Container(
              margin: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              height: 95,
              decoration: BoxDecoration(
//when I remove this line, background color will change with the BoxShadow color
                color: Color.fromARGB(255, 9, 190, 15),

                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: const Text(""),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(children: [
                Image.asset("assets/image/Chef@2x.png"),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Find the recipes",
                        style: TextStyle(color: Colors.white70, fontSize: 18),
                      ),
                      Text(
                        "based on what",
                        style: TextStyle(color: Colors.white70, fontSize: 18),
                      ),
                      Text(
                        "YOU HAVE AT HOME",
                        style: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: CircleAvatar(
                      child: Image.asset("assets/icon/See More Button.png")),
                )
              ]),
            )
          ]),
        ),
        const Divider(
          thickness: 1,
        ),
        _popularRecipies(),
        const Divider(
          thickness: 1,
        ),
        _suggestedMealPlan(),
        const Divider(
          thickness: 1,
        ),
        _suggestedContents()
      ]),
    );
  }

  Column _suggestedContents() {
    return Column(
      children: [
        const TitleWithBtn(title: "Suggested Contents", buttonText: "View All"),
        SizedBox(
          height: 160,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SuggestedContentCard(
                      title: suggestedContentEntityList[index].title,
                      imgPath: suggestedContentEntityList[index].image,
                      subTitle: suggestedContentEntityList[index].subTitle,
                      description:
                          suggestedContentEntityList[index].description),
                );
              }),
        ),
      ],
    );
  }

  Column _suggestedMealPlan() {
    return Column(
      children: [
        const TitleWithBtn(
            title: "Suggested Meal Plan", buttonText: "Meal Planner"),
        SizedBox(
          height: 210,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: suggestedMealPlanList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: suggestedMealPlanCard(
                      image: suggestedMealPlanList[index].image,
                      title: suggestedMealPlanList[index].days,
                      description: suggestedMealPlanList[index].description),
                );
              }),
        ),
      ],
    );
  }

  Column _popularRecipies() {
    return Column(
      children: [
        const TitleWithBtn(
            title: "Popular Recipes", buttonText: "All Recipies"),
        SizedBox(
          height: 140,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: popularRecipiesList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: recipiesCard(
                    image: popularRecipiesList[index].image,
                    title: popularRecipiesList[index].title,
                  ),
                );
              }),
        ),
      ],
    );
  }

  void _onItemTapped(int value) {}
}
