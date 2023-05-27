import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../core/color/colors.dart';

import '../../../widget/empty_list_text.dart';
import '../../data/models/read_list_model.dart';
import '../widgets/read_list_view_card.dart';

class ReadListView extends StatefulWidget {
  const ReadListView({
    super.key,
    required this.auth,
  });

  final FirebaseAuth auth;

  @override
  State<ReadListView> createState() => _ReadListViewState();
}

class _ReadListViewState extends State<ReadListView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(widget.auth.currentUser!.uid)
            .collection('readList')
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
                        .collection('readList')
                        .doc(getData[i].id)
                        .delete();
                  },
                  child: ReadListViewCard(
                      readList: ReadListModel(
                          malId: getData[i].data()['malId'],
                          posterUrl: getData[i].data()['posterUrl'],
                          status: getData[i].data()['status'],
                          releaseDate: getData[i].data()['releaseDate'],
                          score: getData[i].data()['score'],
                          title: getData[i].data()['title'],
                          largeImage: getData[i].data()['largeImage'],
                          rank: getData[i].data()['rank'],
                          url: getData[i].data()['url'],
                          description: getData[i].data()['description'],
                          chapters: getData[i].data()['chapters'])),
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
