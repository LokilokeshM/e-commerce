import 'package:ecommerce/UI/catalogue_manager/dashboard_screen/components/chart.dart';
import 'package:ecommerce/constant/constant.dart';
import 'package:ecommerce/model/MyFiles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FileInfoCard extends StatelessWidget {
  const FileInfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final TopListTabCardHelper info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: info.color,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                info.title!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Container(
                padding: const EdgeInsets.all(defaultPadding * 0.75),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: info.color!.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: SvgPicture.asset(
                  info.svgSrc!,
                  color: Colors.white,
                ),
              ),
              // const Icon(Icons.more_vert, color: Colors.black)
            ],
          ),

          Visibility(
            visible: info.level != null,
            child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(children: [
                  const TextSpan(
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                    text: "Level: ",
                  ),
                  TextSpan(
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                    text: " ${info.level ?? ""}",
                  )
                ])),
          ),
          Visibility(
            visible: info.rank != null,
            child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(children: [
                  const TextSpan(
                      text: "Rank: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20)),
                  TextSpan(
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                    text: " ${info.rank ?? ""}",
                  )
                ])),
          ),

          // Visibility(
          //     visible: info.rank == null,
          //     child: const Positioned.fill(
          //         child: Chart(
          //       height: 100,
          //     )))
          // ProgressLine(
          //   color: Colors.white,
          //   percentage: info.totalCount,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (info.totalCount != null)
                Text(
                  "${info.totalCount}",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              // Text(
              //   info.totalStorage!,
              //   style: Theme.of(context)
              //       .textTheme
              //       .caption!
              //       .copyWith(color: Colors.black),
              // ),
            ],
          )
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
