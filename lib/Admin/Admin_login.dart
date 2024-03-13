import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medimitra/Admin/home_Admin.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  String email = "", password = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController AdminNameController = TextEditingController();
  TextEditingController AdminPasswordController = TextEditingController();

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
            child: Container(
              margin: EdgeInsets.only(top: 44),
              child: Text(
                'ADMIN',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                //Email
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 15, 20, 20),
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
                    controller: AdminNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter username";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.redAccent),
                      hintText: 'Username',
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
                    controller: AdminPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.redAccent,
                      ),
                      hintText: 'Password',
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 23, vertical: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled:
                          true, // Specify whether the input field should be filled
                      fillColor:
                          Colors.white, // Color used to fill the input field
                    ),
                  ),
                ),

                //button
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                        loginAdmin();
                        });
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                      width: 337,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
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
        ],
      ),
    ));
  }
loginAdmin(){
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if(result.data()['id'] != AdminNameController.text.trim()){
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.blueAccent,
          content: Text(
            "Username is incorrect !",
            style: GoogleFonts.outfit(
              fontSize: 18,
            ),
          )));
        } else if(result.data()['password'] != AdminPasswordController.text.trim()){
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.blueAccent,
          content: Text(
            "Password is incorrect !",
            style: GoogleFonts.outfit(
              fontSize: 18,
            ),
          )));
        } 
        else{
          Route route = MaterialPageRoute(builder: (context) =>AdminHome());
          Navigator.pushReplacement(context, route);
        }
       });
  });
    
  }
}
