part of 'core_cubit.dart';

@immutable
sealed class CoreState {}

final class CoreInitial extends CoreState {}
final class ChangeMode extends CoreState {
 final bool isDark;
  ChangeMode(this.isDark);
}
