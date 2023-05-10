import 'package:flutter/material.dart';

class MangaVerticalListView extends StatefulWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Function addEvent;

  const MangaVerticalListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.addEvent,
  });

  @override
  State<MangaVerticalListView> createState() => _MangaVerticalListViewState();
}

class _MangaVerticalListViewState extends State<MangaVerticalListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.itemCount,
      itemBuilder: widget.itemBuilder,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
    );
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0) {
        widget.addEvent();
      }
    }
  }
}
