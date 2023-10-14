part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

//Event which should happen when user first opens the application
class HomeInitialEvent extends HomeEvent{

}

//Handling event of Wishlist button clicked on home page
class HomeProductWishListButtonClickEvent extends HomeEvent{

}

//Handling event of Cart button clicked on home page
class HomeProductCartButtonClickedEvent extends HomeEvent{

}

//Handling event of navigating to wishlist page from home page
class HomeWishListButtonNavigateEvent extends HomeEvent{

}

//Handling event of navigating to cart page from home page
class HomeCartButtonNavigateEvent extends HomeEvent{

}