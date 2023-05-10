import '../entites/user_data.dart';
import '../repositories/firebase_repository.dart';

class SignUpUseCase {
  final FirebaseRepository repository;

  SignUpUseCase({required this.repository});

  Future<void> call(UserData user) {
    return repository.signUp(user);
  }
}
