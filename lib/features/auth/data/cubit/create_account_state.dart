part of 'create_account_cubit.dart';

@immutable
sealed class CreateAccountState {}

final class CreateAccountInitial extends CreateAccountState {}
final class CreateAccountLoading extends CreateAccountState {}
final class CreateAccountSuccess extends CreateAccountState {}
final class CreateAccountError extends CreateAccountState {}

final class LoginLoading extends CreateAccountState {}
final class LoginSuccess extends CreateAccountState {}
final class LoginError extends CreateAccountState {}
