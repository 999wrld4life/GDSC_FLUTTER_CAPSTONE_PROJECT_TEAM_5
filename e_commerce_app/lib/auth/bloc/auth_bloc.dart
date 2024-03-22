import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/auth/models/user_model.dart';
import 'package:e_commerce_app/auth/repositories/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthRepo repo;
  AuthBloc({required this.repo}) : super(AuthInitialState()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        MyUser? userCredential = await repo.signIn(email: event.email, password: event.password);
        emit(AuthSuccessState(user: userCredential!));
      } catch (e) {
        emit(AuthFailureState(errorMessage: e.toString()));
      }
    });
    on<SignUpEvent>((event, emit) async{
      emit(AuthLoadingState());
      try {
        MyUser? userCred = await repo.signUp(email: event.email, password: event.password, name: event.name);
        userCred!.copyWith(imageUrl: 'https://icons.iconarchive.com/icons/papirus-team/papirus-status/256/avatar-default-icon.png');
        emit(AuthSuccessState(user: userCred));
        print('---------Debug Print--------------------------------');
        print(userCred.email);
        print(userCred.name);
        print(userCred.uid);
        print(userCred.imageUrl);
        print('---------Debug Print--------------------------------');
      } catch (e) {
        emit(AuthFailureState(errorMessage: e.toString()));
      }
    });

    on<ForgotPasswordEvent>((event, emit) async{
      emit(AuthLoadingState());
      try {
        await repo.forgotPassword(email: event.email);
        emit(const ForgotPasswordState(message: 'Forgot Password sent successfully'));
      } catch (e) {
        emit(AuthFailureState(errorMessage: e.toString()));
      }
    });
    on<UploadProfileEvent>((event, emit) async{
      emit(AuthLoadingState());
      try {
        final aUser = _auth.currentUser;
        MyUser myUser = MyUser(uid: aUser!.uid, name: aUser.displayName!, email: aUser.email!);
        
        await repo.uploadImage(user: myUser,image: event.image);
        emit(UploadProfileSuccessfullState());
      } catch (e) {
        emit(AuthFailureState(errorMessage: e.toString()));
      }
    });

    on<LogoutEvent>((event, emit) async{
      emit(AuthLoadingState());
      try {
        await repo.signOut();
        emit(AuthInitialState());
      } catch (e) {
        emit(AuthFailureState(errorMessage: e.toString()));
      }
    });
  }

  
}
