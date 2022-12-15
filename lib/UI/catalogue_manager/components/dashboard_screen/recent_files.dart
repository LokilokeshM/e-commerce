import 'dart:js';

import 'package:ecommerce/Apis/entity/prodcut_list_response.dart' as p;
import 'package:ecommerce/UI/catalogue_manager/catalogue_management_bloc.dart';
import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Product/product_page.dart';

class RecentFiles extends StatefulWidget {
  const RecentFiles({
    Key? key,
    required this.bloc,
    required this.context,
  }) : super(key: key);
  final BuildContext context;
  final CatalogueManagementBloc bloc;

  @override
  State<RecentFiles> createState() => _RecentFilesState();
}

class _RecentFilesState extends State<RecentFiles> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Files",
          ),
          SizedBox(
            width: double.infinity,
            child: StreamBuilder<List<p.Product>?>(
                stream: widget.bloc.productList,
                builder: (context, snapshot) {
                  return DataTable(
                    showCheckboxColumn: true,
                    dividerThickness: 2,
                    columnSpacing: defaultPadding,
                    columns: const [
                      DataColumn(
                        label: Text(
                          "Product",
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Status",
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Inventory",
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Type",
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Vendor",
                        ),
                      ),
                    ],
                    rows: snapshot.data != null
                        ? List.generate(
                            snapshot.data!.length,
                            (index) => recentFileDataRow(snapshot.data![index]),
                          )
                        : [],
                  );
                }),
          ),
        ],
      ),
    );
  }

  DataRow recentFileDataRow(p.Product product) {
    return DataRow(
      onSelectChanged: (_) {},
      selected: isSelected,
      onLongPress: () {
        showDialog(
            context: widget.context,
            builder: (BuildContext context) {
              return AlertDialog(
                  backgroundColor: secondaryColor,
                  content: Container(
                    width: MediaQuery.of(context).size.width - 200,
                    height: MediaQuery.of(context).size.height - 100,
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
                            width: MediaQuery.of(context).size.width - 200,
                            height: MediaQuery.of(context).size.height - 100,
                            child: SingleChildScrollView(
                                child: ProductPage(
                                    product: product, bloc: widget.bloc))),
                      )
                    ]),
                  ));
            });
      },
      cells: [
        DataCell(
          Row(
            children: [
              Image.network(
                product.image != null ? product.image!.src ?? "" : "",
                height: 30,
                width: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(
                  product.title!,
                ),
              ),
            ],
          ),
        ),
        DataCell(
          Chip(
              label: Text(product.status ?? "Active"),
              backgroundColor: Colors.white,
              labelStyle: TextStyle(color: Colors.black)),
        ),
        DataCell(Text(
          product.variants!.isNotEmpty
              ? "${product.variants!.first.inventoryQuantity} in stock"
              : "",
        )),
        DataCell(Text(
          product.productType ?? "",
        )),
        DataCell(Text(
          product.vendor ?? "",
        )),
      ],
    );
  }
}
