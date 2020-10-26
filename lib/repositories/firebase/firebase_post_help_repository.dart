import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tasuke_ai/model/post_help/post_help.dart';
import 'package:tasuke_ai/model/post_help/post_help_repository.dart';

class FirebasePostHelpRepository implements PostHelpRepository {
  CollectionReference _query;

  FirebasePostHelpRepository() {
    _query = FirebaseFirestore.instance.collection('post_helps');
  }

  @override
  Future store({@required PostHelp postHelp}) async {
    await _query
      .doc()
      .set(postHelp.toMap());
  }
}
