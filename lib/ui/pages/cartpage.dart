import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_emporium/controllers/user_controller.dart';
import 'package:ecommerce_emporium/model/product_model.dart';
import 'package:ecommerce_emporium/ui/widgets/cartitem.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: userProvider.shoppingCartUser(0),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasData){
            List<ProductModel>? myProducts = snapshot.data;
            if (myProducts!.isEmpty){
              return const Text('nada por aqui, ainda.');
            }
            return ListView.builder(
              itemCount: myProducts.length,
              itemBuilder: (context, index) {
                return CartItem(product: myProducts[index]);
              }
            );
          }
          return const Text('nada por aqui, ainda.');
        },
      ),
    );
  }
}