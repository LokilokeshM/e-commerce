import 'package:ecommerce/Apis/entity/prodcut_list_response.dart';
import 'package:ecommerce/UI/catalogue_manager/catalogue_management_bloc.dart';
import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key? key,
    required this.bloc,
  }) : super(key: key);
  final CatalogueManagementBloc bloc;
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
            child: StreamBuilder<List<Product>?>(
                stream: bloc.productList,
                builder: (context, snapshot) {
                  return DataTable(
                    columnSpacing: defaultPadding,
                    columns: [
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
}

DataRow recentFileDataRow(Product product) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              product.image!.src ?? "",
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(product.title!,
                  style: const TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
      DataCell(
          Text("product.status", style: const TextStyle(color: Colors.black))),
      DataCell(Text("", style: const TextStyle(color: Colors.black))),
      DataCell(Text(product.productType ?? "",
          style: const TextStyle(color: Colors.black))),
      DataCell(Text(product.vendor ?? "",
          style: const TextStyle(color: Colors.black))),
    ],
  );
}
