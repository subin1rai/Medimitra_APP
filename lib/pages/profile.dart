import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medimitra/widgets.dart/Database.dart';
import 'package:medimitra/widgets.dart/auth.dart';
import 'package:medimitra/widgets.dart/shared.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? profile, name , email;
  
  getthesharedpref()async {
    profile = await SharePreferencesHelper().getUserProfile();
    name = await SharePreferencesHelper().getUserName();
    email = await SharePreferencesHelper().getUserEmail();
    setState(() {});
  }

onthisloaded() async {
  await getthesharedpref();
  setState(() {
    
  });
}
@override
  void initState() {
    onthisloaded();
    // TODO: implement initState
    super.initState();
  }
  File? selectImage;
  @override
  Future getImg() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    selectImage = File(image!.path);
    setState(() {
      uploadItem();
    });
  }

  uploadItem() async{
   if (selectImage != null) {
      String addId = randomAlphaNumeric(10);

      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child("blogImages").child(addId);
      final UploadTask task = firebaseStorageRef.putFile(selectImage!);

      var downloadUrl = await (await task).ref.getDownloadURL();

     await SharePreferencesHelper().saveUserProfile(downloadUrl);
     setState(() {
       
     });
  }}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: name==null? CircularProgressIndicator(): Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 45, 20, 0),
                  height: MediaQuery.of(context).size.height / 4.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(0xFF6FC8B8),
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width, 105))),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 6.5),
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(60),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: selectImage==null? GestureDetector(
                          onTap: () {
                            getImg();
                          },
                          child:profile==null? Image.asset('assets/home.png', height: 120,
                            width: 120,fit: BoxFit.cover):
                             Image.network(
                            profile!,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ):Image.file(selectImage!),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name!,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                        Icon(Icons.person, color: Colors.black,),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name: ',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),Text(
                              name!,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10,),
                            
                          ],
                        )
                      ],),
                    )
                    )
                    )
                    ,
                    SizedBox(height: 20),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(children: [
                        Icon(Icons.email, color: Colors.black,),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email: ',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),Text(
                              email!, 
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10,),
                            
                          ],
                        )
                      ],),
                    )
                    )
                    ),
                    SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                AuthMethod().deleteUser();
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(children: [
                          Icon(Icons.delete, color: Colors.black,),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              Text(
                                'Delete Account',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10,),
                              
                            ],
                          )
                        ],),
                      )
                      )
                      ),
            ),
                    SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                AuthMethod().SignOut();
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(children: [
                          Icon(Icons.logout, color: Colors.black,),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Logout',
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10,),
                              
                            ],
                          )
                        ],),
                      )
                      )
                      ),
            )
          ],
        ),
      ),
    );
  }
}
