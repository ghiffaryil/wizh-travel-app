import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerCard(BuildContext context, double getHeight) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.white,
    child: Container(
      height: MediaQuery.of(context).size.height * getHeight,
      color: Colors.grey.shade300,
    ),
  );
}
