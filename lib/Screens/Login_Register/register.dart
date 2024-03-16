import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medimitra/Screens/Login_Register/Login.dart';
import 'package:medimitra/pages/bottomNvarbar.dart';
import 'package:medimitra/widgets.dart/Database.dart';
import 'package:medimitra/widgets.dart/app_Widgets.dart';
import 'package:medimitra/widgets.dart/shared.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  String  name="", email ="", password="";
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

registration() async {
  if (password != null) {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.blueAccent,
        content: Text("Registered Successfully!", style: GoogleFonts.poppins(fontSize: 18,),)));
        String id = randomAlphaNumeric(10);
        Map<String,dynamic> addUserInfo ={
          "Name": nameController.text,
          "Email": emailController.text,
          "Id": id
        };
DatabaseMethods databaseMethods = DatabaseMethods();
await databaseMethods.addUserDetail(addUserInfo, id);
        await SharePreferencesHelper().saveUserName(nameController.text);
        await SharePreferencesHelper().saveUserEmail(emailController.text);
        await SharePreferencesHelper().saveUserId(id);
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>BottomNavbar()));

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password provided is too weak.", style: GoogleFonts.poppins(fontSize: 18),)));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,  
            content: Text("Account already exists.", style: GoogleFonts.poppins(fontSize: 18,),),
          ),
        );
      } else {
        // Handle other FirebaseAuthExceptions here
        print('Firebase Auth Error: ${e.message}');
      }
    } catch (e) {
      // Handle other errors here
      print('Error: $e');
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          //top image
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
          //register text
          Center(
            child: Text(
              'Register',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Color(0xFF6FC8B8)),
            ),
          ),
          //create you
          Center(
            child: Text(
              'Create your new Account',
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
            //UserName
            Container(
              margin: const EdgeInsets.fromLTRB(20, 4, 20, 20),
              child: TextFormField(
                controller: nameController,
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Please enter username";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: const Color(0xFF6FC8B8),
                  ), // Icon of a person
                  hintText: 'User Name', // Hint text displayed in the input field
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 23,
                      vertical: 18), // Padding around the input field's content
                  border: OutlineInputBorder(
                    // Border around the input field
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled:
                      true, // Specify whether the input field should be filled
                  fillColor: Colors.white, // Color used to fill the input field
                ),
              ),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(95, 176, 176, 176),
                    blurRadius: 10,
                    offset: Offset(2, 5),
                  ),
                ],
              ),
            ),
           
           
           
            //Email
            Container(
              margin: const EdgeInsets.fromLTRB(20, 4, 20, 20),
              child: TextFormField(
                controller: emailController,
                 validator: (value){
                  if(value==null || value.isEmpty){
                    return "Please enter Email";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.mail,
                    color: const Color(0xFF6FC8B8),
                  ), // Icon of a person
                  hintText: 'Email', // Hint text displayed in the input field
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 23,
                      vertical: 18), // Padding around the input field's content
                  border: OutlineInputBorder(
                    // Border around the input field
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled:
                      true, // Specify whether the input field should be filled
                  fillColor: Colors.white, // Color used to fill the input field
                ),
              ),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(95, 176, 176, 176),
                    blurRadius: 10,
                    offset: Offset(2, 5),
                  ),
                ],
              ),
            ),
           
            //Password
            Container(
              margin: const EdgeInsets.fromLTRB(20, 4, 20, 20),
              child: TextFormField(
                controller: passwordController,
                 validator: (value){
                  if(value==null || value.isEmpty){
                    return "Please enter your password";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: const Color(0xFF6FC8B8),
                  ), // Icon of a person
                  hintText: 'Password', // Hint text displayed in the input field
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 23,
                      vertical: 18), // Padding around the input field's content
                  border: OutlineInputBorder(
                    // Border around the input field
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled:
                      true, // Specify whether the input field should be filled
                  fillColor: Colors.white, // Color used to fill the input field
                ),
              ),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(95, 176, 176, 176),
                    blurRadius: 10,
                    offset: Offset(2, 5),
                  ),
                ],
              ),
            ),
           
            //button
            Center(
              child: GestureDetector(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      name = nameController.text;
                      email = emailController.text;
                      password = passwordController.text;
                    });
                  }
                  registration();
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                  width: 337,
                  height: 56,
                  child: Text(
                    'Register',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6FC8B8),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
           ],
           ),
         ),
          //Login option
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => (Login())));
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF6FC8B8),
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: const Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Color.fromARGB(255, 137, 137, 137),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'or continue with',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 137, 137, 137),
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Color.fromARGB(255, 137, 137, 137),
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
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(95, 141, 141, 141),
                      blurRadius: 10,
                      offset: Offset(2, 5),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
