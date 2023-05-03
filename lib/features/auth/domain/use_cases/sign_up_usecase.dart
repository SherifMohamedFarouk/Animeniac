
import 'package:animeniac/features/auth/domain/entites/user_data.dart';
import 'package:animeniac/features/auth/domain/repositories/firebase_repository.dart';
class SignUpUseCase{
  final FirebaseRepository repository;

  SignUpUseCase({required this.repository});

  Future<void> call(UserData user){
    return repository.signUp(user);
  }
}