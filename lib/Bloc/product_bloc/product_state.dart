part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductblocLoading extends ProductState {}
final class ProductblocLoaded extends ProductState {}
final class ProductblocError extends ProductState {}

