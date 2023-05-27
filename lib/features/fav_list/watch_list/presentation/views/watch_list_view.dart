import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../core/color/colors.dart';
import '../../../widget/empty_list_text.dart';
import '../../data/models/watch_list_model.dart';
import '../widgets/watch_list_view_card.dart';

class WatchListView extends StatefulWidget {
  const WatchListView({
    super.key,
    required this.auth,
  });

  final FirebaseAuth auth;

  @override
  State<WatchListView> createState() => _WatchListViewState();
}

class _WatchListViewState extends State<WatchListView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(widget.auth.currentUser!.uid)
            .collection('watchList')
            .orderBy('date')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data != null && snapshot.data!.docs.isNotEmpty) {
            var getData = snapshot.data!.docs;
            return ListView.separated(
              reverse: true,
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
                        .doc(widget.auth.currentUser!.uid)
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
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            );
          } else {
            return const EmptylistText();
          }
        });
  }
}
