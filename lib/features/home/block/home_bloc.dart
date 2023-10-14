import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductWishListButtonClickEvent>(homeProductWishListButtonClickEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishListButtonNavigateEvent>(homeWishListButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeWishListButtonNavigateEvent(HomeWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Wishlist navigated');
    emit(HomeProductWishListNavigationActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Cart navigated');
    emit(HomeCartNavigationActionState());
  }

  FutureOr<void> homeProductWishListButtonClickEvent(HomeProductWishListButtonClickEvent event, Emitter<HomeState> emit) {
    print('Product added to wishlist');
  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Product addded to cart');
  }
}
