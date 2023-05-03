
import 'package:animeniac/features/auth/domain/entites/user_data.dart';

abstract class FirebaseDataSource {
  Future<void> signUp(UserData user) ;
  Future<void> signIn(UserData user) ;
  Future<void> signOut();
}