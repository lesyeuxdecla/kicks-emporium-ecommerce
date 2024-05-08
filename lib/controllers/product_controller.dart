import 'package:flutter/material.dart';
import 'package:ecommerce_emporium/model/product_model.dart';

class ProductController with ChangeNotifier {
  final List<ProductModel> _products = [
    ProductModel(name: 'Nike Air Max ', price: 789.00, description: 'Em uma cor azul céu refrescante, o Air Max chega para ficar ', pictureURL: 'assets/nike1.png'),
    ProductModel(name: 'Nike Dunk 90', price: 399.00, description: 'Trazendo o design blackndwhite reconhecido da Nike, o Dunk 90 é um dos mais vendidos', pictureURL: 'assets/nike2.png'),
    ProductModel(name: 'Nike Air Force 1', price: 499.00, description: 'Em tom branco, o Air Force 1 é, com certeza, a melhor pedida', pictureURL: 'assets/nike3.png'),
  ];

  List<ProductModel> get products => _products;
}



