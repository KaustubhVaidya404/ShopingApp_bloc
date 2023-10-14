import 'package:flutter/material.dart';
import 'package:shopingapp_bloc/features/home/model/homeproductdata.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  const ProductTileWidget({super.key, required this.productDataModel});

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
                  IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border)),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart_outlined)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

