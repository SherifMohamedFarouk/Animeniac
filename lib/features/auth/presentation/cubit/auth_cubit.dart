import 'package:animeniac/features/auth/domain/entites/user_data.dart';
import 'package:animeniac/features/auth/domain/use_cases/sign_in_usecase.dart';
import 'package:animeniac/features/auth/domain/use_cases/sign_up_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {

  final SignInUseCase signInUseCases;
  final SignUpUseCase signUpUseCase;
  AuthCubit({required this.signInUseCases, required this.signUpUseCase}) : super(AuthInitial());

  Future<void> signIn({
    required String email,
    required String password,
  })async {
    emit(AuthLoading());
    try{
      await signInUseCases.call(UserData(email:email ,password: password));
      emit(AuthSuccess());
    }catch(error){
      emit(AuthFailure());
    }
  }
  Future<void> signUp({
    required String email,
    required String password,
    required String name
  })async {
    emit(AuthLoading());
    try{
      await signUpUseCase.call(UserData(email:email ,password: password,name: name));
      emit(AuthSuccess());
    }catch(error){
      emit(AuthFailure());
    }
  }


}
