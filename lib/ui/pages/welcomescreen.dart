import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce_emporium/ui/pages/login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // logo
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 250,
                top: 10,
                bottom: 30,
              ),
              child: Image.asset('assets/logo.png', height: 250, width: 100),
            ),

            // initial phrase
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text(
                'Desbloqueie seus medos, descubra \nseu \npotencial.',
                textAlign: TextAlign.left,
                style: GoogleFonts.dmSans(
                    fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 24),

            const Spacer(),

            // comece por aqui button,,, problems to solve on the return
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
                  "Comece por aqui",
                  style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}