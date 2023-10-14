part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

//Event which should happen when user first opens the application
class HomeInitialEvent extends HomeEvent{

}

//Handling event of Wishlist button clicked on home page
class HomeProductWishListButtonClickEvent extends HomeEvent{
  final ProductDataModel productDataModelClicked;
  HomeProductWishListButtonClickEvent({
    required this.productDataModelClicked,
});
}

//Handling event of Cart button clicked on home page
class HomeProductCartButtonClickedEvent extends HomeEvent{
  final ProductDataModel productDataModelClicked;
  HomeProductCartButtonClickedEvent({
    required this.productDataModelClicked,
  });
}

//Handling event of navigating to wishlist page from home page
class HomeWishListButtonNavigateEvent extends HomeEvent{}

//Handling event of navigating to cart page from home page
class HomeCartButtonNavigateEvent extends HomeEvent{}
