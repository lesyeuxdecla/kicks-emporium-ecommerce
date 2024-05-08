import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_emporium/ui/pages/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_emporium/controllers/product_controller.dart';
import 'package:ecommerce_emporium/controllers/user_controller.dart';
import 'package:ecommerce_emporium/model/product_model.dart';
import 'package:ecommerce_emporium/ui/pages/favorites.dart';
import 'package:ecommerce_emporium/ui/pages/cartpage.dart';
import 'package:ecommerce_emporium/ui/widgets/card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //sign out
  void signOut() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kicks Emporium',
            style: GoogleFonts.dmSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 3, 102, 102))),
        actions: [
          //sign out button
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout),
          ),

          //profile button
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const ProfileScreen()),
                    (route) => false);
              },
              icon: const Icon(Icons.person_3)),
          //favorite button
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const Favorites()),
                    (route) => false);
              },
              icon: const Icon(Icons.favorite)),
          //cart button
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const CartPage()),
                    (route) => false);
              },
              icon: const Icon(Icons.shopping_cart)),
        ],
      ), 
body: Consumer2<ProductController, UserController>(
  builder: (context, productController, userController, child) {
    List<ProductModel> products = productController.products;
    List<String> brands = ['Nike', 'Adidas', 'Puma', 'Reebok', 'New Balance', 'Vans'];

    List<String> brandImages = [
      'assets/nikelogo.png',
      'assets/adidas.png',
      'assets/puma.png',
      'assets/reebok.png',
      'assets/nb.png',
      'assets/vans.png',
    ]; // Lista de marcas

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Barra de pesquisa
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Pesquisar...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        // Carrossel de imagens
        CarouselSlider(
          items: [
            Image.asset('assets/airforcebanner.jpg'),
            Image.asset('assets/airmaxbanner.jpg'),
            Image.asset('assets/dunkbanner.png'),
          ],
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'Marcas',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // rolagem
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            height: 80, 
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: brands.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(brandImages[index]),
                    radius: 50, backgroundColor: Colors.transparent, 
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Produtos',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Os mais populares no momento',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        // Grade de produtos
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.75,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(
                product: products[index],
                userController: userController,
              );
            },
          ),
        ),
      ],
    );
  },
),
);
  }
}
