part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}
abstract class WishlistActionState extends WishlistState{}

class WishlistInitial extends WishlistState {}


//Success state of wishlist
class WishListSuccessState extends WishlistState{
  final List<ProductDataModel> wishlistItems;

  WishListSuccessState({required this.wishlistItems});

}


//State to render when there is no product in wishlist
class WishListEmptyState extends WishlistState{}