import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  final void Function()? onPressed;
  const MyTextBox({
    super.key, 
    required this.text, 
    required this.sectionName,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.only(
        left: 15,
        bottom: 15,
      ),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionName,
                style: GoogleFonts.dmSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500]),
              ),

              //edit
              IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.settings),
                color: Colors.grey[400],
              )
            ],
          ),
          Text(text),
        ],
      ),
    );
  }
}
