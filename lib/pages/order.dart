import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medimitra/widgets.dart/Database.dart';
import 'package:medimitra/widgets.dart/app_Widgets.dart';
import 'package:medimitra/widgets.dart/shared.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String? id;
  int totals = 0;

 void startTimer(){
 try{
   Timer(Duration(seconds: 3), () { 
    // amount2=total;
    setState(() {
      
    });
  });
  
 }
 catch(e){
   print(e);
 }
}

  getthesharedpreferences() async { 
    id = await SharePreferencesHelper().getUserId();
  
    setState(() {
      
    });  
  }
  ontheload() async {
    await getthesharedpreferences();
    medicineStream = await DatabaseMethods().getMedicineCart(id!);
    setState(() {

      
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    ontheload();
    super.initState();
    startTimer();
  }


  Stream? medicineStream;


    Widget medicineCart(  ) {
    return StreamBuilder(
        stream: medicineStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    totals = totals+ int.parse(ds["Total"]);
                    return   Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 5,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  padding:const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 70,
                        width: 30,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text(ds["Quantity"])),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.network(
                            ds["Image"],
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          )),
                          const SizedBox(width: 20,),
                          Column(children: [
                            Text(ds["Name"],style: AppWidget.semiTextStyle(),),
                            Text("NPR " +ds["Total"],style: AppWidget.semiTextStyle(),)
                          ],)
                    ],
                  ),
                ),
              ),
            );
                  })
              : CircularProgressIndicator();
        });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 2,
              child: Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Center(
                  child: Text(
                    "Medicine Cart",
                    style: AppWidget.HeadlineTextStyle(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
           
            Container(
              height: MediaQuery.of(context).size.height/2,
              child: medicineCart()),
            Spacer(),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Price",style: AppWidget.boldTextStyle(),),
              Text("NRP "+ totals.toString(),style: AppWidget.semiTextStyle(),)
              
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              width: MediaQuery.of(context).size.width,
              margin:const EdgeInsets.fromLTRB(20, 0, 20, 40),
                    decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Text("Checkout", style: GoogleFonts.poppins(color: Colors.white, fontSize: 20.0,fontWeight:FontWeight.bold),)),
                  ),
          ],

        ),
      ),
    );
  }
}
