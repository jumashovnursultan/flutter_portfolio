import 'package:flutter/material.dart';
import 'package:my_portfolio_app/custom_widgets/animated_grid_view/app_animated_list_view.dart';

import 'grid_row.dart';

class AnimatedGridView extends StatelessWidget {
  final IndexedWidgetBuilder builder;
  final int itemCount;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;
  final ScrollController? controller;
  final bool shrinkWrap;
  final Clip? clipBehavior;

  const AnimatedGridView({
    super.key,
    required this.itemCount,
    this.crossAxisCount = 2,
    this.crossAxisSpacing = 10,
    this.mainAxisSpacing = 10,
    this.rowCrossAxisAlignment = CrossAxisAlignment.start,
    this.controller,
    this.shrinkWrap = false,
    this.clipBehavior = Clip.none,
    this.physics = const BouncingScrollPhysics(),
    this.padding = const EdgeInsets.all(10),
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return AppAnimatedListView(
      physics: physics,
      controller: controller,
      shrinkWrap: shrinkWrap,
      padding: padding ?? EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      clipBehavior: clipBehavior,
      builder: (ctx, columnIndex) {
        return GridRow(
          columnIndex: columnIndex,
          builder: builder,
          itemCount: itemCount,
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisAlignment: rowCrossAxisAlignment,
        );
      },
      count: _columnLength(),
    );
  }

  int _columnLength() {
    if (itemCount % crossAxisCount == 0) {
      return itemCount ~/ crossAxisCount;
    } else {
      return (itemCount ~/ crossAxisCount) + 1;
    }
  }
}
