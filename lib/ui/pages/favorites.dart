import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_emporium/controllers/user_controller.dart';
import 'package:ecommerce_emporium/model/product_model.dart';
import 'package:ecommerce_emporium/ui/widgets/cartitem.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserController>(context);
     return Scaffold(
      appBar: AppBar(
      title: const Text('Favoritos'),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
      body: FutureBuilder<List<ProductModel>>(
        future: userProvider.favoriteProductsUser(0),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasData){
            List<ProductModel>? myFavorites = snapshot.data;
            if (myFavorites!.isEmpty){
              return const Text('Sem dados');
            }
            return ListView.builder(
              itemCount: myFavorites.length,
              itemBuilder: (context, index) {
               return CartItem(product: myFavorites[index]);
              }
            );
          }
          return const Text('Sem dados');
        },
      ),
    );
  }
}