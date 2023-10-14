import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopingapp_bloc/data/wishlistitems.dart';
import 'package:shopingapp_bloc/features/home/model/homeproductdata.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishListProductRemovedFromWishListEvent>(wishListProductRemovedFromWishListEvent);
  }

  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishlistState> emit) {
    if(wishListItems.isEmpty){
      emit(WishListEmptyState());
    }
    else{
      emit(WishListSuccessState(wishlistItems: wishListItems));
    }
  }

  FutureOr<void> wishListProductRemovedFromWishListEvent(WishListProductRemovedFromWishListEvent event, Emitter<WishlistState> emit) {
    wishListItems.remove(event.productDataModel);
    if(wishListItems.isEmpty){
      emit(WishListEmptyState());
    }
    else{
      emit(WishListSuccessState(wishlistItems: wishListItems));
    }
  }
}
