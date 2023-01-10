import 'package:ecommerce/UI/catalogue_manager/components/side_menu/theme_content.dart';
import 'package:ecommerce/common/widget/button/custom_button.dart';
import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class EndMenuPage extends StatelessWidget {
  const EndMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: secondaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Positioned(
            //     right: 5,
            //     child: IconButton(
            //       onPressed: () {
            //         Scaffold.of(context).closeEndDrawer();
            //       },
            //       icon: const Icon(Icons.close),
            //     )),
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
                ])),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomDefaultButton(
                    backgroundColor: Colors.grey,
                    text: "My Account",
                    press: () {},
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: CustomDefaultButton(
                  backgroundColor: Colors.grey,
                  text: "Sign Out",
                  press: () {},
                ))
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            ThemeContent()
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
