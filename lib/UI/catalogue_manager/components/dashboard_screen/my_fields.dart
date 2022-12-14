import 'package:ecommerce/UI/catalogue_manager/components/Product/product_page.dart';
import 'package:ecommerce/common/responsive.dart';
import 'package:ecommerce/constant/constant.dart';
import 'package:ecommerce/model/MyFiles.dart';
import 'package:flutter/material.dart';

import 'file_info_card.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.black),
            ),
            Row(
              children: [
                ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical: defaultPadding /
                          (Responsive.isMobile(context) ? 2 : 0.9),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("Bulk Manage"),
                ),
                ElevatedButton.icon(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical: defaultPadding /
                          (Responsive.isMobile(context) ? 2 : 1),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              backgroundColor: secondaryColor,
                              content: Container(
                                width: MediaQuery.of(context).size.width - 200,
                                height:
                                    MediaQuery.of(context).size.height - 100,
                                child: Stack(children: <Widget>[
                                  Positioned(
                                    right: 20,
                                    top: 5.0,
                                    child: InkResponse(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: CircleAvatar(
                                        radius: 20,
                                        child: Icon(Icons.close),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10.0,
                                    child: InkResponse(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          "Add Prodcut",
                                        )),
                                  ),
                                  Positioned(
                                    top: 50,
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                200,
                                        height:
                                            MediaQuery.of(context).size.height -
                                                100,
                                        child: SingleChildScrollView(
                                            child: ProductPage())),
                                  )
                                ]),
                              ));
                        });
                  },
                  icon: Icon(Icons.add),
                  label: Text("Add New"),
                ),
              ],
            ),
          ],
        ),
        // const SizedBox(height: defaultPadding),
        // Responsive(
        //   mobile: FileInfoCardGridView(
        //     crossAxisCount: _size.width < 650 ? 2 : 4,
        //     childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
        //   ),
        //   tablet: const FileInfoCardGridView(),
        //   desktop: FileInfoCardGridView(
        //     childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
        //   ),
        // ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => FileInfoCard(info: demoMyFiles[index]),
    );
  }
}
