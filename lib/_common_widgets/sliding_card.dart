import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/preload_page_view.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';

class SlidingPageView extends StatelessWidget{

  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final ValueNotifier<double?>? notifier;
  final PageController? controller;
  final bool grow;
  final Function(int)? onPageChanged;
  final ScrollPhysics? physics;

  final Axis scrollDirection;
  final int extents;

  const SlidingPageView({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    required this.controller,
    required this.notifier,
    this.grow = false,
    this.scrollDirection = Axis.horizontal,
    this.extents = 1,
    this.onPageChanged,
    this.physics,
  }):super(key: key);

  static SlidingPageView builder({
    Key? key,
    required Widget Function(BuildContext context, int index) itemBuilder,
    required int itemCount,
    PageController? controller,
    ValueNotifier<double>? notifier,
    bool grow = false,
    Axis scrollDirection =Axis.horizontal,
    int extents = 1,
    Function(int)? onPageChanged,
    ScrollPhysics? physics,
  }) => SlidingPageView(
    key: key,
    itemBuilder: itemBuilder,
    itemCount: itemCount,
    controller: controller??PageController(),
    notifier: notifier??ValueNotifier(controller!.initialPage.toDouble()),
    grow: grow,
    scrollDirection: scrollDirection,
    extents: extents,
    onPageChanged: onPageChanged,
    physics: physics,
  );

  void _onScroll() => notifier!.value = controller!.page;

  @override
  Widget build(BuildContext context) {

    controller!.addListener(_onScroll);

    return PreloadPageView.extents(
      extents: extents,
      itemBuilder: (context, index){
        if(grow) return SizeContainer(
            index: index,
            child: itemBuilder(context, index),
            notifier: notifier
        );
        else return itemBuilder(context, index);
      },
      itemCount: itemCount,
      controller: controller,
      scrollDirection: scrollDirection,
      onPageChanged: onPageChanged,
      physics: physics,
    );
  }
}

class SizeContainer extends StatelessWidget{

  final int index;
  final Widget child;
  final ValueNotifier? notifier;

  const SizeContainer({required this.index, required this.child, required this.notifier, super.key});

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: notifier!,
      child: child,
      builder: (context, child) => Transform.scale(
          scale: cos((index - notifier!.value)/1.8),
          child: child
      )
    );
  }
}

class SlidingCard extends StatelessWidget{

  final Widget? child;
  final EdgeInsets padding;
  final Color? color;
  final Function? onTap;

  const SlidingCard({
    this.child,
    this.padding = const EdgeInsets.all(0),
    this.color =Colors.transparent,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return AppCard(
      elevation: AppCard.bigElevation,
      radius: AppCard.BIG_RADIUS,
      padding: padding,
      child: child,
      color: color,
      onTap: onTap as void Function()?,
    );
  }
}