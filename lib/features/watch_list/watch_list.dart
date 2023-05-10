import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WatchListView extends StatefulWidget {
  const WatchListView({
    super.key,
  });

  @override
  State<WatchListView> createState() => _WatchListViewState();
}

class _WatchListViewState extends State<WatchListView> {
  FirebaseAuth myId = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Text('my watchList ${myId.currentUser!.uid}');
  }
}
