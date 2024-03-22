part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthFailureState extends AuthState{
  final String errorMessage;

  const AuthFailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final MyUser user;

  const AuthSuccessState({required this.user});

  @override
  List<Object> get props => [user];
}

class ForgotPasswordState extends AuthState {
  final String message;

  const ForgotPasswordState({required this.message});

  @override
  List<Object> get props => [message];
}

class UploadProfileSuccessfullState extends AuthState {}
