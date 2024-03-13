import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medimitra/Screens/Login_Register/register.dart';


class GetStart extends StatefulWidget {
  const GetStart({Key? key}) : super(key: key);

  @override
  State<GetStart> createState() => _GetStartState();
}

class _GetStartState extends State<GetStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignmecenter, //nter,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(
                10, 90, 0, 0), // Add margin to the Text widget
            child: Text(
              "MEDIMITRA",
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  color: Color(0xFF6FC8B8),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Container(
            margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: Center(
              child: Image.asset(
                'assets/homeScotter.png',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text('WELCOME',
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 34))),
                  
                  Container(
                    padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                    margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'order your prescribe medicines, Doctor Assistant will',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Text(
                            'be there always.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (RegisterPage())),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.fromLTRB(20, 12, 20, 0),
                        width: 337,
                        height: 56,
                        child: Text(
                          'Get Started',
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
                          color: Color(0xFF6FC8B8),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}