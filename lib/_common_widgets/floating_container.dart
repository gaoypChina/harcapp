import 'package:flutter/material.dart';



class FloatingContainer extends SliverPersistentHeader{

  FloatingContainer({
    Widget Function(BuildContext context, double shrinkOffset, bool overlapsContent)? builder,
    double? height,
    bool rebuild = false,
    Key? key,
  }):super(
    pinned: true,
    delegate: _Delegate(
        builder,
        height,
        rebuild
    ),
    key: key
  );

  static FloatingContainer child({
    required Widget child,
    required double height,
    bool rebuild=false
  }) => FloatingContainer(
      builder: (BuildContext context, double shrinkOffset, bool overlapsContent) => child,
      height: height,
      rebuild: rebuild
  );

  static FloatingContainer builder({
    required Widget Function(BuildContext context, double shrinkOffset, bool overlapsContent) builder,
    required double height,
    bool rebuild=true
  }) => FloatingContainer(
      builder: builder,
      height: height,
      rebuild: rebuild
  );

}

class _Delegate extends SliverPersistentHeaderDelegate{

  final Widget Function(BuildContext context, double shrinkOffset, bool overlapsContent)? builder;
  final double? height;
  final bool rebuild;

  const _Delegate(this.builder, this.height, this.rebuild);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => builder!(context, shrinkOffset, overlapsContent);

  @override
  double get maxExtent => height!;

  @override
  double get minExtent => height!;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => rebuild;

}