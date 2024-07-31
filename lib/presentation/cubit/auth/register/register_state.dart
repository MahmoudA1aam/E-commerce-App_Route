import '../../../../domain/entitiy/auth_entitiy/register_entitiy/RegisterResponseEntitiy.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {
  String? loadingMessage;

  RegisterLoadingState({this.loadingMessage});
}

class RegisterSuccessState extends RegisterState {
  RegisterResponseModelEntity registerResponseModelEntity;

  RegisterSuccessState({required this.registerResponseModelEntity});
}

class RegisterErrorState extends RegisterState {
  String? errorMessage;

  RegisterErrorState({this.errorMessage});
}
