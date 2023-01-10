import 'package:ecommerce/UI/catalogue_manager/dashboard_screen/dashboard_bloc.dart';
import 'package:ecommerce/common/responsive.dart';
import 'package:ecommerce/constant/constant.dart';
import 'package:ecommerce/model/MyFiles.dart';
import 'package:flutter/material.dart';
import 'file_info_card.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({
    Key? key,
    required this.bloc,
  }) : super(key: key);
  final DashboardBloc bloc;
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return StreamBuilder<List<TopListTabCardHelper>?>(
        stream: bloc.topBoxList,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Column(
                  children: [
                    Responsive(
                      mobile: FileInfoCardGridView(
                        data: snapshot.data ?? [],
                        crossAxisCount: _size.width < 650 ? 2 : 4,
                        childAspectRatio: _size.width < 650 ? 1.3 : 1,
                      ),
                      tablet: FileInfoCardGridView(
                        data: snapshot.data ?? [],
                      ),
                      desktop: FileInfoCardGridView(
                        data: snapshot.data ?? [],
                        childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
                      ),
                    ),
                  ],
                )
              : Container();
        });
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
    required this.data,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  final List<TopListTabCardHelper> data;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => FileInfoCard(info: data[index]),
    );
  }
}
