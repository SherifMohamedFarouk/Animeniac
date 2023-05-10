import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entites/user_data.dart';
import 'firebase_data_source.dart';

class FirebaseDataSourceImpl implements FirebaseDataSource {
  final FirebaseFirestore fireStore;
  final FirebaseAuth auth;
  FirebaseDataSourceImpl(this.fireStore, this.auth);

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  Future<void> signIn(UserData user) async {
    await auth.signInWithEmailAndPassword(
        email: user.email, password: user.password);
  }

  @override
  Future<void> signUp(UserData user) async {
    final userCredential = await auth.createUserWithEmailAndPassword(
        email: user.email, password: user.password);

    await fireStore.collection('users').doc(userCredential.user!.uid).set(
        UserData(name: user.name, email: user.email, uid: user.uid).toJson());
  }
}
