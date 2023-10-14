part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

//Initial cart event
class CartInitialEvent extends CartEvent{}

//Event for removing the product from the cart
class CartProductRemovedFromCartEvent extends CartEvent{
  final ProductDataModel productDataModel;

  CartProductRemovedFromCartEvent({required this.productDataModel});

}
