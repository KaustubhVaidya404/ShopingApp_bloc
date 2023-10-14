import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/cart_items.dart';
import '../../home/model/homeproductdata.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartProductRemovedFromCartEvent>(cartProductRemovedFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
    if(cartItems.isEmpty){
      emit(CartEmptyState());
    }
  }

  FutureOr<void> cartProductRemovedFromCartEvent(CartProductRemovedFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productDataModel);
    if(cartItems.isEmpty){
      emit(CartEmptyState());
    }
    else{
      emit(CartSuccessState(cartItems: cartItems));
    }
  }
}
