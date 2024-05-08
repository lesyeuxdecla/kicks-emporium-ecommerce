import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_emporium/controllers/product_controller.dart';
import 'package:ecommerce_emporium/controllers/user_controller.dart';
import 'package:ecommerce_emporium/ui/pages/homepage.dart';
import 'package:ecommerce_emporium/ui/pages/welcomescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserController()),
        ChangeNotifierProvider(create: (context) => ProductController()),
      ],
      child: const MaterialApp(
        title: 'kicks emporium',
        home: HomePage(),
      ),
    );
  }
}
