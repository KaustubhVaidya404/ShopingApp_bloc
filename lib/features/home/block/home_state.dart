part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

//State loading the data from server
class HomeLoadingState extends HomeState{}

//State building the ui after loading the data from server
class HomeSuccessState extends HomeState{}

//State to display if there is any error
class HomeErrorState extends HomeState{}

//State for navigating to wishlist state
class HomeProductWishListNavigationActionState extends HomeActionState{}

//State for navigating to cart state
class HomeCartNavigationActionState extends HomeActionState{}

//State for adding the product to wishlist


//State for adding the product to cart
