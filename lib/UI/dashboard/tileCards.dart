import 'package:flutter/material.dart';
import 'package:kitchenomics/constant/constant.dart';

Widget recipiesCard({
  Key? key,
  required String image,
  required String title,
}) {
  return Container(
    height: 60,
    decoration: BoxDecoration(
//when I remove this line, background color will change with the BoxShadow color
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 4,
          blurRadius: 3,
          offset: Offset(0, 0), // changes position of shadow
        ),
      ],
      border: Border.all(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset(
          image,
          height: 80,
          fit: BoxFit.contain,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6, left: 10),
          child: Text(
            "$title\n",
          ),
        ),
      ],
    ),
  );
}

Widget suggestedMealPlanCard(
    {Key? key,
    required String image,
    required String title,
    required String description}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("$title", style: const TextStyle(fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: CircleAvatar(
              radius: (50),
              backgroundColor: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              )),
        ),
        Text("$description\n",
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

// ignore: non_constant_identifier_names
Widget SuggestedContentCard(
    {required String title,
    String? subTitle = "",
    String? description,
    required String imgPath,
    context}) {
  return Card(
    elevation: 3,
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imgPath,
              width: 150,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: 150,
            height: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    "$title",
                    softWrap: true,
                    maxLines: 2,
                    style: const TextStyle(
                        // height: 1,
                        // letterSpacing: 4,

                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                        color: Colors.black),
                  ),
                ),
                Visibility(
                  visible: subTitle != "",
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      "$subTitle",
                      style: const TextStyle(
                          // height: 1,
                          // letterSpacing: 4,
                          fontStyle: FontStyle.normal,
                          fontSize: 13.0,
                          color: Colors.black),
                    ),
                  ),
                ),
                Visibility(
                  visible: description != null,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      "$description",
                      style: const TextStyle(
                          // height: 1,
                          // letterSpacing: 4,
                          fontStyle: FontStyle.normal,
                          fontSize: 13.0,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
