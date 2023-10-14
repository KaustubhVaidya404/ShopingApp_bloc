// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopingapp_bloc/features/cart/ui/cart.dart';
import 'package:shopingapp_bloc/features/home/block/home_bloc.dart';
import 'package:shopingapp_bloc/features/home/ui/widgets/producttile.dart';
import 'package:shopingapp_bloc/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is !HomeActionState,
      listener: (context, state) {
        if(state is HomeCartNavigationActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Cart()));
        }
        else if(state is HomeProductWishListNavigationActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const WishList()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType){
          case HomeLoadingState:
            return buildHomeLoadingState();
          case HomeSuccessState:
            return buildHomeSuccessState(state);
          case HomeErrorState:
            return buildHomeErrorState();
        }
        return const Text('No widget build');
      },
    );
  }

  Scaffold buildHomeErrorState() => const Scaffold(body: Center(child: Text('Error'),),);

  Scaffold buildHomeSuccessState(state) {
    final successState = state as HomeSuccessState;
    return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,

              title: const Text(
                  'ShopIt'
              ),
              actions: [
                IconButton(onPressed: (){
                  homeBloc.add(HomeWishListButtonNavigateEvent());
                }, icon: const Icon(Icons.favorite_border)),
                IconButton(onPressed: (){
                  homeBloc.add(HomeCartButtonNavigateEvent());
                }, icon: const Icon(Icons.shopping_cart_outlined)),
              ],
            ),
      body: ListView.builder(
        itemCount: successState.products.length,
          itemBuilder: (context, index){
        return ProductTileWidget(productDataModel: successState.products[index]);
      }),
          );
  }

  Scaffold buildHomeLoadingState() {
    return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
