import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medimitra/Screens/Login_Register/register.dart';
import 'package:medimitra/pages/bottomNvarbar.dart';
import 'package:medimitra/pages/forgotPassword.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email ="", password ="";
  TextEditingController loginemailController = TextEditingController();
  TextEditingController loginpasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  userLogin() async {
  try {
    String email = loginemailController.text;
    String password = loginpasswordController.text;
    print("Email: $email, Password: $password"); // Add this line to check if email and password are correctly retrieved
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.blueAccent,
        content: Text("Login successful!", style: GoogleFonts.poppins(fontSize: 18,),)));
    print("Login successful"); // Add this line to check if login is successful
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavbar()));
  } on FirebaseAuthException catch (e) {
    print("Error during login: ${e.message}"); // Add this line to check if there's any error during login
    if (e.code == 'user-not-found') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No User found!", style: GoogleFonts.outfit(fontSize: 18, color: Colors.black,))));
    } else if (e.code == 'wrong-password') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong Password!", style: GoogleFonts.outfit(fontSize: 18, color: Colors.black,))));
    }
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/head.png',
                fit: BoxFit.fill,
                width: 500,
                height: 250,
              ),
              Positioned(
                top: 60,
                child: Image.asset(
                  'assets/register.png',
                  width: 200,
                  height: 200,
                ),
              ),
              Positioned(
                top: 40,
                child: Text(
                  "MEDIMITRA",
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: Color(0xFF6FC8B8),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              'Welcome Back',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Color(0xFF6FC8B8)),
            ),
          ),
          Center(
            child: Text(
              'Login to your account',
              style: GoogleFonts.outfit(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Color(0xFFC0C0C0)),
            ),
          ),


        Form(
          key: _formKey,
          child: Column(
            children: [
              
            //Emails valudation
            Container(
              margin: const EdgeInsets.fromLTRB(20, 4, 20, 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(95, 176, 176, 176),
                    blurRadius: 10,
                    offset: Offset(2, 5),
                  ),
                ],
              ),
              child: TextFormField(
                controller: loginemailController,
                validator: (value){
              if(value==null || value.isEmpty){
                return "Please enter email";
              }
              return null;
                              },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail, color: Color(0xFF6FC8B8)),
                  hintText: 'Email',
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 23, vertical: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          
          
            //Password
            Container(
              margin: const EdgeInsets.fromLTRB(20, 4, 20, 20),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(95, 176, 176, 176),
                    blurRadius: 10,
                    offset: Offset(2, 5),
                  ),
                ],
              ),
              child: TextFormField(
                obscureText: true,
                controller: loginpasswordController,
                validator: (value){
              if(value==null || value.isEmpty){
                return "Please enter password";
              }
              return null;
                              },
        
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color(0xFF6FC8B8),
                  ),
                  hintText: 'Password',
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 23, vertical: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled:
                      true, // Specify whether the input field should be filled
                  fillColor: Colors.white, // Color used to fill the input field
                ),
              ),
            ),
            
            
  
          GestureDetector(
            onTap: (){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ForgotPassword()));

            },
            child: Container(
              margin: EdgeInsets.only(
                left: 240,
              ),
              child: Text(
                "Forget Password?",
                style: GoogleFonts.outfit(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Color(0xFF6FC8B8)),
              ),
            ),
          ),

          //button
          Center(
            child: GestureDetector(
              onTap: () async {
                 if (_formKey.currentState!.validate()) {
                    setState(() {
                      
                      email = loginemailController.text;
                      password = loginpasswordController.text;
                    });
                  }
                  userLogin();
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                width: 337,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFF6FC8B8),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ],
          ),
        ),

          Container(
            margin: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Dont have an Account?',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (RegisterPage())));
                  },
                  child: const Text(
                    'Create new Account !',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6FC8B8),
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: const Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'or continue with',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Color.fromARGB(255, 209, 209, 209),
                  ),
                ),
              ],
            ),
          ),
          //sign in with google
          Center(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                width: 337,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(95, 141, 141, 141),
                      blurRadius: 10,
                      offset: Offset(2, 5),
                    ),
                  ],
                ),
                child: Text(
                  'Sign in with google',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
