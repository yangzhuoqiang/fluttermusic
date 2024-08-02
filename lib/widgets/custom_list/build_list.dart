import 'package:flutter/material.dart';

Widget buildList<T>({
  required Widget Function(T item, int index) itemBuilder,
  required List<T> items,
  Widget Function(T item, int index)? separatorBuilder,
  Function(T item, int index)? onItemTap,
  ScrollPhysics? physics,
  bool shrinkWrap = false,
  EdgeInsetsGeometry? padding,
  Axis scrollDirection = Axis.vertical,
  int? itemCount,
}) {
  return ListView.separated(
    itemBuilder: (ctx, index) {
      return GestureDetector(
        onTap: () => onItemTap?.call(items[index], index),
        child: itemBuilder(items[index], index),
      );
    },
    separatorBuilder: (ctx, index) {
      return separatorBuilder?.call(items[index], index) ?? const SizedBox();
    },
    itemCount: itemCount ?? items.length,
    physics: physics,
    shrinkWrap: shrinkWrap,
    padding: padding ?? EdgeInsets.zero,
    scrollDirection: scrollDirection,
  );
}

SliverList buildSliverList<T>({
  required Widget Function(T item, int index) itemBuilder,
  required List<T> items,
  Function(T item, int index)? onItemTap,
}) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (ctx, index) {
        return GestureDetector(
          onTap: () => onItemTap?.call(items[index], index),
          child: itemBuilder(items[index], index),
        );
      },
      childCount: items.length,
    ),
  );
}
