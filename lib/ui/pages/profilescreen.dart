import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce_emporium/ui/widgets/textbox.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

 void signOut() {}

  //edit field
  Future<void> editfield(String field) async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu perfil", style: GoogleFonts.dmSans(
          fontSize: 18, 
          fontWeight: FontWeight.bold, 
          color: Color.fromARGB(255, 3, 102, 102))),
        backgroundColor: Colors.transparent,
        actions: [
          //sign out button
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout),
          ),
        ]
      ),

      body: ListView(
        children: [
          
          //pfp pic
          const SizedBox(height: 50),
          CircleAvatar(child: Image.asset('assets/pfppic.png', width: 100, height: 100)),
          
          const SizedBox(height: 30),
          
          //user email
        const Text(
          'jessmariano@gmail.com', 
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18, 
            fontWeight: FontWeight.w500, 
            color: Colors.grey)),

          
          const SizedBox(height: 50),

          //user details
        Padding(
        padding: 
        const EdgeInsets.only(left: 25.0),
        child: Text('Informações da sua conta:',
        style: GoogleFonts.dmSans(
            fontSize: 18, 
            fontWeight: FontWeight.bold, color: 
            Color.fromARGB(255, 3, 102, 102))
            ),
        ),          
          
          //username
        MyTextBox(text: 'marianojess', 
        sectionName: 'username', 
        onPressed: () => editfield('username'),
        ),
          
          
          //bio
        MyTextBox(text: 'nada aqui por enquanto', 
        sectionName: 'bio', 
        onPressed: () => editfield('bio'),
        ),


        //email
        MyTextBox(text: 'jessmariano@gmail.com', 
        sectionName: 'email', 
        onPressed: () => editfield('email'),
        ),



        //password
        MyTextBox(text: '*********', 
        sectionName: 'password', 
        onPressed: () => editfield('password'),
        ),

        //loc
        MyTextBox(text: 'Osasco, SP', 
        sectionName: 'location', 
        onPressed: () => editfield('location'),
        ),

        const SizedBox(height: 50),  
          
          //user latest shopping
        
        
        Padding(
        padding: 
        const EdgeInsets.only(left: 25.0),
        child: Text('Últimas compras',
        style: GoogleFonts.dmSans(
            fontSize: 18, 
            fontWeight: FontWeight.bold, color: 
            Color.fromARGB(255, 3, 102, 102))
            ),
        ),          
        ],
      ),
    );
  }
}
