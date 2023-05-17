import 'package:flutter/material.dart';

class MangaVerticalListView extends StatefulWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const MangaVerticalListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  State<MangaVerticalListView> createState() => _MangaVerticalListViewState();
}

class _MangaVerticalListViewState extends State<MangaVerticalListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      physics: const BouncingScrollPhysics(),
      itemCount: widget.itemCount,
      itemBuilder: widget.itemBuilder,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
    );
  }
}
