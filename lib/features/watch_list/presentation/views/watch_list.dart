import '../../../../core/color/colors.dart';
import '../../data/models/watchlist_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../widgets/empty_watchlist_text.dart';
import '../widgets/watch_list_view_card.dart';

class WatchListView extends StatefulWidget {
  const WatchListView({
    super.key,
  });

  @override
  State<WatchListView> createState() => _WatchListViewState();
}

class _WatchListViewState extends State<WatchListView> {
  FirebaseAuth auth = FirebaseAuth.instance;
  List<WatchListModel> watchList = [];

  // getWatchList() async {
  //   var result = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(auth.currentUser!.uid)
  //       .collection('watchList')
  //       .get();
  //   setState(() {
  //     var getData = result.docs;
  //     for (int i = 0; i < result.size; i++) {
  //       watchList.add(WatchListModel(
  //           malId: getData[i].data()['malId'],
  //           posterUrl: getData[i].data()['posterUrl'],
  //           rating: getData[i].data()['rating'],
  //           releaseDate: getData[i].data()['releaseDate'],
  //           score: getData[i].data()['score'],
  //           title: getData[i].data()['title'],
  //           largeImage: getData[i].data()['largeImage'],
  //           rank: getData[i].data()['rank'],
  //           trailer: getData[i].data()['trailer'],
  //           description: getData[i].data()['description'],
  //           episodes: getData[i].data()['episodes']));
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ListTile(
          trailing: Column(
            children: const [
              Text(
                'Anime WatchList',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Drag to Delete',
                style: TextStyle(fontSize: 14, color: secondaryColor),
              ),
            ],
          ),
          leading: Image.asset(
            'assets/images/Animeniac.png',
            fit: BoxFit.cover,
            height: 5.h,
            width: 50.w,
          ),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(auth.currentUser!.uid)
              .collection('watchList')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data != null && snapshot.data!.docs.isNotEmpty) {
              var getData = snapshot.data!.docs;
              return ListView.separated(
                shrinkWrap: true,
                itemCount: snapshot.data!.size,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                itemBuilder: (context, i) {
                  return Dismissible(
                    background: Container(
                      color: errorColor,
                      child: const Icon(Icons.delete),
                    ),
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(auth.currentUser!.uid)
                          .collection('watchList')
                          .doc(getData[i].id)
                          .delete();
                    },
                    child: WatchListViewCard(
                        watchList: WatchListModel(
                            malId: getData[i].data()['malId'],
                            posterUrl: getData[i].data()['posterUrl'],
                            rating: getData[i].data()['rating'],
                            releaseDate: getData[i].data()['releaseDate'],
                            score: getData[i].data()['score'],
                            title: getData[i].data()['title'],
                            largeImage: getData[i].data()['largeImage'],
                            rank: getData[i].data()['rank'],
                            trailer: getData[i].data()['trailer'],
                            description: getData[i].data()['description'],
                            episodes: getData[i].data()['episodes'])),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
              );
            } else {
              return const EmptyWatchlistText();
            }
          }),
    );
  }
}
