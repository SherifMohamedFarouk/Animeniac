import 'package:flutter/material.dart';

class AnimeVerticalListView extends StatefulWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const AnimeVerticalListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  State<AnimeVerticalListView> createState() => _AnimeVerticalListViewState();
}

class _AnimeVerticalListViewState extends State<AnimeVerticalListView> {
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
