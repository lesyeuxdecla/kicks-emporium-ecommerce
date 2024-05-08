import 'dart:js';
import 'package:ecommerce_emporium/ui/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ecommerce_emporium/ui/pages/login.dart';
import 'package:ecommerce_emporium/ui/widgets/buttonup.dart';
import 'package:ecommerce_emporium/ui/widgets/square_tile.dart';
import 'package:ecommerce_emporium/ui/widgets/textfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce_emporium/controllers/product_controller.dart';

class SignUp extends StatelessWidget {
  final Function()? onTap;
  SignUp({super.key, required this.onTap});

  // text editing controllers
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign user in method
  void signUserUp() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            //logo
            Padding(
              padding: const EdgeInsets.only(
                left: 60.0,
                right: 60.0,
                top: 50,
                bottom: 10,
              ),
              child: Image.asset('assets/cadastrologo.png',
                  height: 250, width: 250),
            ),

            const SizedBox(height: 5),

            //welcome back you've been missed
            const Text(
              'Crie sua conta',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),

            const SizedBox(height: 25),

            //username textfield
            MyTextField(
              controller: usernameController,
              hintText: 'username',
              obscureText: false,
            ),

            const SizedBox(height: 10),

            // email textfield
            MyTextField(
              controller: emailController,
              hintText: 'seuemail@gmail.com',
              obscureText: false,
            ),

            const SizedBox(height: 10),

            // password textfield
            MyTextField(
              controller: passwordController,
              hintText: 'senha',
              obscureText: true,
            ),

            const SizedBox(height: 10),

            // confirm password textfield
            MyTextField(
              controller: passwordController,
              hintText: 'confirme sua senha',
              obscureText: true,
            ),

            const SizedBox(height: 25),

            // sign up button
           GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Login(onTap: (){});
                  },
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                child: const Text(
                  "Cadastrar-se",
                  style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // or continue with
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Ou entre com:',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // google + facebook sign in buttons
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // google button
                SquareTile(imagePath: 'assets/google.png'),

                SizedBox(width: 25),

                // facebook button
                SquareTile(imagePath: 'assets/facebook.png')
              ],
            ),

            const SizedBox(height: 30),

            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Já tem uma conta?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Login(onTap: () {});
                      },
                    ),
                  ),
                  child: const Text(
                    'Entre',
                    style: TextStyle(
                      color: Color.fromARGB(255, 3, 102, 102),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
