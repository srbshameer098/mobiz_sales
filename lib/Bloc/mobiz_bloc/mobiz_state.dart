part of 'mobiz_bloc.dart';

@immutable
sealed class MobizState {}

final class MobizInitial extends MobizState {}
final class MobizblocLoading extends MobizState {}
final class MobizblocLoaded extends MobizState {}
final class MobizblocError extends MobizState {}

