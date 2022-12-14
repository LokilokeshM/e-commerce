// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/common/widget/forms/simple_input_form.dart';
import 'package:ecommerce/common/widget/forms/text_editor.dart';
import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';

import 'Components/expaned_tile.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: addProductRightContent(context)),
                Expanded(flex: 3, child: addProductLeftContent(context))
              ],
            ),
            bottomButton(context),
          ],
        ),
      ),
    );
  }

  Column addProductRightContent(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ListTile(
                title: const Text(
                  "Title",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: SimpleInputForm(),
              ),
              ListTile(
                title: const Text(
                  "Description",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Container(
                    color: Colors.white, height: 200, child: TextEditor()),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: ListTile(
            title: const Text(
              "Pricing",
            ),
            subtitle: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ListTile(
                  title: const Text(
                    "Price",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: SimpleInputForm(),
                ),
                ListTile(
                  title: const Text(
                    "Compare at price",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: SimpleInputForm(),
                ),
                ListTile(
                  title: const Text(
                    "cost per item",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: SimpleInputForm(),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: ListTile(
            title: const Text(
              "Inventory",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: ListTile(
                        title: const Text(
                          "Name",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: SimpleInputForm(),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: ListTile(
                        title: const Text(
                          "Name",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: SimpleInputForm(),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Quantity",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Location",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    "Available",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Row(children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "location_name",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: SimpleInputForm(),
                  ),
                ]),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: ListTile(
            title: const Text(
              "Shipping",
            ),
            subtitle: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: const Text(
                      "Weight",
                    ),
                  ),
                ),
                const Text(
                  "Used to calculate shipping rates at checkout and label prices during fulfillment. See guidelines for estimating product weight.",
                ),
                ListTile(
                  title: Text(
                    "Weight",
                  ),
                  subtitle: SimpleInputForm(),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: ListTile(
            title: const Text(
              "Customer Information",
            ),
            subtitle: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "",
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: const Text(
                    "Country/Region of origin",
                  ),
                  subtitle: SimpleInputForm(),
                ),
                ListTile(
                  title: const Text(
                    "HS (Harmonized System) code",
                  ),
                  subtitle: SimpleInputForm(),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Container(
          height: 40,
          child: Text(""),
        )
      ],
    );
  }

  Column addProductLeftContent(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 3,
          child: ListTile(
            title: Text("Product Status",
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(""),
                  subtitle: SimpleInputForm(),
                ),
                Divider(
                  height: 1,
                ),
                Text(
                  "Sales Channels and Apps".toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Title",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 3,
          child: ListTile(
            title: Text("Product Status",
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              children: [
                ListTile(
                  title: Text(
                    "Product Category",
                  ),
                  subtitle: SimpleInputForm(),
                ),
                ListTile(
                  title: Text(
                    "Product Type",
                  ),
                  subtitle: SimpleInputForm(),
                ),
                ListTile(
                  title: Text(
                    "Vendor",
                  ),
                  subtitle: SimpleInputForm(),
                ),
                ListTile(
                  title: Text(
                    "Collections",
                  ),
                  subtitle: SimpleInputForm(),
                ),
                ListTile(
                  title: Text(
                    "Tags",
                  ),
                  subtitle: SimpleInputForm(),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 3,
          child: ListTile(
            title: Text("Online Store",
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              children: [
                ListTile(
                  title: Text(
                    "Theme template",
                  ),
                  subtitle: SimpleInputForm(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomButton(BuildContext context) {
    return Container();
  }
}













// showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     content: Stack(
//                       overflow: Overflow.visible,
//                       children: <Widget>[
//                         Positioned(
//                           right: -40.0,
//                           top: -40.0,
//                           child: InkResponse(
//                             onTap: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: CircleAvatar(
//                               child: Icon(Icons.close),
//                               backgroundColor: Colors.red,
//                             ),
//                           ),
//                         ),
//                         Form(
//                           key: _formKey,
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: TextFormField(),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: TextFormField(),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: RaisedButton(
//                                   child: Text("Submitß"),
//                                   onPressed: () {
//                                     if (_formKey.currentState.validate()) {
//                                       _formKey.currentState.save();
//                                     }
//                                   },
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 });
