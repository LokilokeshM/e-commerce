// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/Apis/entity/prodcut_list_response.dart' as p;
import 'package:ecommerce/Apis/entity_helper/add_product_request_body.dart'
    as r;
import 'package:ecommerce/UI/catalogue_manager/catalogue_management_bloc.dart';
import 'package:ecommerce/common/widget/button/custom_button.dart';
import 'package:ecommerce/common/widget/forms/simple_input_form.dart';
import 'package:ecommerce/common/widget/forms/text_editor.dart';
import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({Key? key, this.product, required this.bloc})
      : super(key: key);
  final p.Product? product;
  final CatalogueManagementBloc bloc;
  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  HtmlEditorController descriptionController = HtmlEditorController();
  TextEditingController price = TextEditingController();
  TextEditingController comparePrice = TextEditingController();
  TextEditingController costPerItem = TextEditingController();
  TextEditingController sku = TextEditingController();
  TextEditingController barcode = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController hs = TextEditingController();
  TextEditingController productCategory = TextEditingController();
  TextEditingController productType = TextEditingController();
  TextEditingController vendor = TextEditingController();
  TextEditingController collections = TextEditingController();
  TextEditingController tags = TextEditingController();
  TextEditingController themeTemplate = TextEditingController();
  String selectedValue = "Active";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Active"), value: "Active"),
      DropdownMenuItem(child: Text("InActive"), value: "InActive"),
    ];
    return menuItems;
  }

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      addValueToTextBox();
    }
  }

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
            SizedBox(
              height: 100,
            )
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
                subtitle: SimpleInputForm(
                  textEditingController: title,
                ),
              ),
              ListTile(
                title: const Text(
                  "Description",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Container(
                    color: Colors.white,
                    height: 200,
                    child: TextEditor(
                      controller: descriptionController,
                    )),
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
                  subtitle: SimpleInputForm(
                    textEditingController: price,
                    keyboardType: TextInputType.number,
                  ),
                ),
                ListTile(
                  title: const Text(
                    "Compare at price",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: SimpleInputForm(
                    keyboardType: TextInputType.number,
                    textEditingController: comparePrice,
                  ),
                ),
                ListTile(
                  title: const Text(
                    "cost per item",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: SimpleInputForm(
                    keyboardType: TextInputType.number,
                    textEditingController: costPerItem,
                  ),
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
                          "SKU",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: SimpleInputForm(
                          textEditingController: sku,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: ListTile(
                        title: const Text(
                          "Barcode",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: SimpleInputForm(
                          textEditingController: barcode,
                        ),
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
                    child: SimpleInputForm(
                      keyboardType: TextInputType.number,
                      textEditingController: quantity,
                    ),
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
                  subtitle: SimpleInputForm(
                    keyboardType: TextInputType.number,
                    textEditingController: weight,
                  ),
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
                  subtitle: SimpleInputForm(
                    textEditingController: country,
                  ),
                ),
                ListTile(
                  title: const Text(
                    "HS (Harmonized System) code",
                  ),
                  subtitle: SimpleInputForm(textEditingController: hs),
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
                  subtitle: DropdownButton(
                      value: selectedValue,
                      style: TextStyle(fontSize: 30),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: dropdownItems),
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
                  subtitle: SimpleInputForm(
                    textEditingController: productCategory,
                  ),
                ),
                ListTile(
                  title: Text(
                    "Product Type",
                  ),
                  subtitle: SimpleInputForm(
                    textEditingController: productType,
                  ),
                ),
                ListTile(
                  title: Text(
                    "Vendor",
                  ),
                  subtitle: SimpleInputForm(
                    textEditingController: vendor,
                  ),
                ),
                // ListTile(
                //   title: Text(
                //     "Collections",
                //   ),
                //   subtitle: SimpleInputForm(
                //     textEditingController: colle,
                //   ),
                // ),
                ListTile(
                  title: Text(
                    "Tags",
                  ),
                  subtitle: SimpleInputForm(
                    textEditingController: tags,
                  ),
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
                  subtitle: SimpleInputForm(
                    textEditingController: themeTemplate,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomButton(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.bottomRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (widget.product != null)
              SizedBox(
                  width: 100,
                  child: CustomDefaultButton(
                    text: "Delete",
                    press: () {
                      widget.bloc.deleteProduct(widget.product!.id!);
                    },
                  )),
            SizedBox(
              width: 100,
              child: CustomDefaultButton(
                text: "Save",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    // ProductRequest request = ProductRequest(
                    //   bodyHtml: descriptionController.getText().toString(),
                    //   productType: productType.text,
                    //   title: title.text,
                    //   tags: [],
                    //   vendor: '',
                    // );
                    r.ProductRequest request = r.ProductRequest(
                        product: r.Product(
                            title: title.text,
                            bodyHtml:
                                descriptionController.getText().toString(),
                            vendor: "",
                            productType: productType.text,
                            tags: []));
                    if (widget.product == null) {
                      widget.bloc.addProduct(request);
                    } else {
                      widget.bloc.updateProduct(widget.product!.id!, request);
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addValueToTextBox() {
    title.text = widget.product!.title ?? "";

    // price.text = "";
    // comparePrice.text =  "";
    // costPerItem.text =  "";
    // sku.text = widget.product ?? "";
    // barcode.text = widget.product ?? "";
    // quantity.text = widget.product ?? "";
    // weight.text = widget.product ?? "";
    // country.text = widget.product ?? "";
    // hs.text = widget.product ?? "";
    // productCategory.text = widget.product ?? "";
    productType.text = widget.product!.productType ?? "";
    // vendor.text = widget.product.vendor.fir ?? "";
    // collections.text = widget.product ?? "";
    // tags.text = widget.product ?? "";
    // themeTemplate.text = widget.product ?? "";
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
