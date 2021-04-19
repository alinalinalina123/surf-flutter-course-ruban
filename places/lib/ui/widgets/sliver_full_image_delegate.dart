import 'package:flutter/material.dart';
import 'image_full_widget.dart';


//Sliver delegate for image
class SliverFullImageDelegate extends SliverPersistentHeaderDelegate {
  final List<String> urls;

  SliverFullImageDelegate(this.urls);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ImageFullWidget(urls: urls);
  }

  @override
  double get maxExtent => 300;

  @override
  double get minExtent => 150;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}