part of 'create_account_cubit.dart';

@immutable
sealed class CreateAccountState {}

final class CreateAccountInitial extends CreateAccountState {}
final class CreateAccountLoading extends CreateAccountState {}
final class CreateAccountSuccess extends CreateAccountState {}
final class CreateAccountError extends CreateAccountState {
  final String message;
  CreateAccountError(this.message);
}

final class LoginLoading extends CreateAccountState {}
final class LoginSuccess extends CreateAccountState {
  final String message;
  LoginSuccess(this.message);
}
final class LoginError extends CreateAccountState {
  final String message;
  LoginError(this.message);
}
