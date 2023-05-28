import 'read_list/data/models/read_list_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/color/colors.dart';

import 'read_list/presentation/views/read_list_view.dart';
import 'watch_list/data/models/watch_list_model.dart';
import 'watch_list/presentation/views/watch_list_view.dart';

class FavListView extends StatefulWidget {
  const FavListView({
    super.key,
  });

  @override
  State<FavListView> createState() => _FavListViewState();
}

class _FavListViewState extends State<FavListView> {
  FirebaseAuth auth = FirebaseAuth.instance;
  List<WatchListModel> watchList = [];
  List<ReadListModel> readList = [];
  bool isAnime = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ListTile(
          trailing: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(primaryColor),
              ),
              onPressed: () {
                setState(() {
                  isAnime = !isAnime;
                });
              },
              child: Text(isAnime ? 'Switch To Manga' : 'Switch To Anime')),
          leading: Column(
            children: [
              SizedBox(
                height: 1.h,
              ),
              Text(
                isAnime ? 'Anime WatchList' : 'Manga ReadList',
                style: const TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              const Text(
                'Drag to Delete',
                style: TextStyle(fontSize: 14, color: secondaryColor),
              ),
            ],
          ),
        ),
      ),
      body: isAnime ? WatchListView(auth: auth) : ReadListView(auth: auth),
    );
  }
}
