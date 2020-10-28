import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tasuke_ai/factory/post_help_factory.dart';
import 'package:tasuke_ai/model/post_help/post_help.dart';
import 'package:tasuke_ai/model/post_help/post_help_repository.dart';

class FirebasePostHelpRepository implements PostHelpRepository {
  CollectionReference _query;

  FirebasePostHelpRepository() {
    _query = FirebaseFirestore.instance.collection('post_helps');
  }

  @override
  Future<List<PostHelp>> get() async {
    return await _query
      .orderBy('createdAt', descending: true)
      .get()
        .then((QuerySnapshot querySnapshot) =>
          querySnapshot.docs.map((doc) =>
            PostHelpFactory(
              uid: doc['uid'],
              title: doc['title'],
              description: doc['description'],
              dateTime: doc['dateTime'],
              duration: doc['duration'],
              createdAt: doc['createdAt'],
            ).make()
          ).toList()
        );
  }

  @override
  Future store({@required PostHelp postHelp}) async {
    await _query
      .doc()
      .set(postHelp.toMap());
  }
}
