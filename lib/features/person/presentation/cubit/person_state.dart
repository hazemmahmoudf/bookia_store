part of 'person_cubit.dart';

@immutable
sealed class PersonState {}

final class PersonInitial extends PersonState {}

final class PersonSuccess extends PersonState {
 final ProfileModel profileModel;
  PersonSuccess(this.profileModel);
}
final class PersonLoading extends PersonState {}
final class PersonError extends PersonState {}

class ChangeName extends PersonState {
 late final bool isShow;
 ChangeName(this.isShow);
}
