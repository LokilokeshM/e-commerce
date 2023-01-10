import 'package:flutter/material.dart';

import '../constant/constant.dart';

class TopListTabCardHelper {
  final String? svgSrc, title;
  int? level, rank, totalCount;
  final Color? color;

  TopListTabCardHelper({
    this.totalCount,
    this.svgSrc,
    this.title,
    this.color,
    this.level,
    this.rank,
  });
}
