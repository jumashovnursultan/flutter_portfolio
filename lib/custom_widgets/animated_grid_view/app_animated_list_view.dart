import 'package:flutter/material.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AppAnimatedListView extends StatelessWidget {
  final double? verticalOffset;
  final double? horizontalOffset;

  final int count;
  final bool shrinkWrap;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;
  final ScrollController? controller;
  final Axis? scrollDirection;
  final Clip? clipBehavior;

  final Widget Function(BuildContext context, int index) builder;
  final Widget Function(BuildContext context, int index)? separatorBuilder;

  const AppAnimatedListView({
    super.key,
    this.verticalOffset,
    this.horizontalOffset,
    required this.count,
    required this.builder,
    this.separatorBuilder,
    this.controller,
    this.padding,
    this.physics,
    this.shrinkWrap = false,
    this.scrollDirection,
    this.clipBehavior,
  });

  Widget _buildAnimation(BuildContext context, int index, Widget child) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 375),
      child: SlideAnimation(
        curve: Curves.ease,
        verticalOffset: verticalOffset,
        horizontalOffset: horizontalOffset,
        child: FadeInAnimation(
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        physics: physics,
        shrinkWrap: shrinkWrap,
        controller: controller,
        primary: true,
        clipBehavior: clipBehavior ?? Clip.none,
        padding: padding ?? const EdgeInsets.all(0.0),
        scrollDirection: scrollDirection ?? Axis.vertical,
        itemCount:
            separatorBuilder != null && count > 0 ? (count * 2) - 1 : count,
        itemBuilder: (context, index) {
          // ignore: no_leading_underscores_for_local_identifiers
          var _index = separatorBuilder != null ? index ~/ 2 : index;

          if (separatorBuilder != null && index.isOdd) {
            return _buildAnimation(
              context,
              _index,
              separatorBuilder!(context, _index),
            );
          }

          return _buildAnimation(
            context,
            _index,
            builder(context, _index),
          );
        },
      ),
    );
  }
}
