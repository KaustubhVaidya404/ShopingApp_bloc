import 'package:flutter/material.dart';
import 'package:shopingapp_bloc/features/cart/bloc/cart_bloc.dart';
import 'package:shopingapp_bloc/features/home/block/home_bloc.dart';
import 'package:shopingapp_bloc/features/home/model/homeproductdata.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget({super.key, required this.productDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.00),
      padding: const EdgeInsets.all(12.00),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.00),
          border: Border.all(color: Colors.black)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imageurl)
                )
            ),
          ),
          const SizedBox(height: 10.00,),
          Text(
            productDataModel.name,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          ),
          Text(productDataModel.description),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${productDataModel.price}',
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
              ),
              Row(
                children: [
                  // IconButton(onPressed: (){
                  //   homeBloc.add(HomeProductWishListButtonClickEvent(productDataModelClicked: productDataModel));
                  // }, icon: const Icon(Icons.favorite_border)),
                  IconButton(onPressed: (){
                    cartBloc.add(CartProductRemovedFromCartEvent(productDataModel: productDataModel));
                  }, icon: const Icon(Icons.remove_shopping_cart)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

