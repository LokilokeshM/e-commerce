import 'package:ecommerce/UI/catalogue_manager/order/Components/header.dart';
import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 200,
            padding: const EdgeInsets.all(defaultPadding),
            decoration: const BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: SingleChildScrollView(
                child: Column(
              children: [
                headerContent(),
                bussinessWidget(),
              ],
            )),
          ),
        ],
      ),
    );
  }

  Widget bussinessWidget() {
    return Column(
      children: [
        const Text(""),
        Row(
          children: [
            Expanded(
              child: Card(
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    debugPrint('Card tapped.');
                  },
                  child: const ListTile(
                    title: Text('A card that can be tapped'),
                    subtitle: Text('A card that can be tapped'),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    debugPrint('Card tapped.');
                  },
                  child: const ListTile(
                    title: Text('A card that can be tapped'),
                    subtitle: Text('A card that can be tapped'),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    debugPrint('Card tapped.');
                  },
                  child: const ListTile(
                    title: Text('A card that can be tapped'),
                    subtitle: Text('A card that can be tapped'),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget headerContent() {
    return Row(
      children: [
        CircleAvatar(
          maxRadius: 30,
          child: Image.asset(
            "assets/images/profile_pic.png",
            height: 100.h,
          ),
        ),
        const SizedBox(
          width: 50,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Aardae",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            RichText(
                textAlign: TextAlign.start,
                text: const TextSpan(children: [
                  TextSpan(
                    text: "Seller ID: ",
                  ),
                  TextSpan(
                    style: TextStyle(color: Colors.blue),
                    text: "SGLU6V47",
                  )
                ])),

            RichText(
                textAlign: TextAlign.start,
                text: TextSpan(children: [
                  const TextSpan(text: "Store URL: "),
                  TextSpan(
                      style: const TextStyle(color: Colors.blue),
                      text: "https://www.lazada.sg/shop/aardae",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _launchUrl(
                              Uri.parse('https://www.lazada.sg/shop/aardae'));
                        }),
                ]))
            // InkWell(
            //     child: const Text("https://www.lazada.sg/shop/aardae"),
            //     onTap: () =>
            //         _launchUrl(Uri.parse('https://www.lazada.sg/shop/aardae'))),
            // Text("Store URL: https://www.lazada.sg/shop/aardae"),
          ],
        ),
      ],
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
