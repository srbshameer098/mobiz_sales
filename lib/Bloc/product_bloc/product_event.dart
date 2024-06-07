part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class FetchProduct extends ProductEvent {
  final String productId;

  FetchProduct({required this.productId});
}