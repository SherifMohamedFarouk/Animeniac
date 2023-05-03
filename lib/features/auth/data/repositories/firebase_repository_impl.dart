

import 'package:animeniac/features/auth/data/data_sources/firebase_data_source.dart';
import 'package:animeniac/features/auth/domain/entites/user_data.dart';
import 'package:animeniac/features/auth/domain/repositories/firebase_repository.dart';


class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseDataSource remoteDataSource;

  FirebaseRepositoryImpl({
    required this.remoteDataSource
});

  @override
  Future<void> signIn(UserData user) async {
   await remoteDataSource.signIn(user);
  }

  @override
  Future<void> signOut() async{
    await remoteDataSource.signOut();
  }

  @override
  Future<void> signUp(UserData user) async{
    await remoteDataSource.signUp(user);
  }

}
