part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

//Error state of cart
class CartErrorState extends CartState{}

//Success state of cart
class CartSuccessState extends CartState {
  final List<ProductDataModel> cartItems;

  CartSuccessState({required this.cartItems});
}

//State to render when cart is empty
class CartEmptyState extends CartState{}
