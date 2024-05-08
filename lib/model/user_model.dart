import 'package:ecommerce_emporium/model/product_model.dart';

class UserModel {
  String email;
  String password;
  List<ProductModel> products = [];
  List<ProductModel> favorites = [ProductModel(name: 'Nike Air Max ', price: 789.00, description: 'Em uma cor azul céu refrescante, o Air Max chega para ficar ', pictureURL: 'assets/nike1.png')
    ];

  UserModel({required this.email, required this.password});

  void addProduct(ProductModel product){
    products.add(product);
  }

  void removeProduct(int id){
    ProductModel product = products[id];
    products.remove(product);
  }

  void addFavorite(ProductModel product){
    if(!favorites.contains(product)) favorites.add(product);
  }

  void removeFavorite(ProductModel product){
    if(favorites.contains(product)) favorites.remove(product);
  }
}