import '../entites/user_data.dart';

abstract class FirebaseRepository {
  Future<void> signUp(UserData user);
  Future<void> signIn(UserData user);
  Future<void> signOut();
}
