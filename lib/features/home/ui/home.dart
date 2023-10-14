import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopingapp_bloc/features/cart/ui/cart.dart';
import 'package:shopingapp_bloc/features/home/block/home_bloc.dart';
import 'package:shopingapp_bloc/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = HomeBloc();
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
        );
      },
    );
  }
}
