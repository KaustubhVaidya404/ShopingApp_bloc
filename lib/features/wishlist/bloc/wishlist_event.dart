part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

//Initial wishlist event
class WishlistInitialEvent extends WishlistEvent{}

//Event for removing the product from wishlist
class WishListProductRemovedFromWishListEvent extends WishlistEvent{
  final ProductDataModel productDataModel;

  WishListProductRemovedFromWishListEvent({required this.productDataModel});
  
}
