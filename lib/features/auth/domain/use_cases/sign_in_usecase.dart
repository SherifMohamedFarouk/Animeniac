

import 'package:animeniac/features/auth/domain/entites/user_data.dart';
import 'package:animeniac/features/auth/domain/repositories/firebase_repository.dart';

class SignInUseCase{
  final FirebaseRepository repository;

  SignInUseCase({required this.repository});

  Future<void> call(UserData user){
    return repository.signIn(user);
  }
}