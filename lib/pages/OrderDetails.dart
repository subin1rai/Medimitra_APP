import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medimitra/widgets.dart/Database.dart';
import 'package:medimitra/widgets.dart/app_Widgets.dart';
import 'package:medimitra/widgets.dart/shared.dart';

class OrderDetails extends StatefulWidget {
  String image,name,detail, price;
  OrderDetails({required this.image,required  this.name,required  this.detail,required this.price});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  int a = 1, total= 0;
  String? id;

  getthesharedpref()async{
    id = await SharePreferencesHelper().getUserId();
    setState(() {
      
    });
  }
  ontheload()async{
    await getthesharedpref();
    setState(() {
      
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ontheload();
    total= int.parse(widget.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.black,
                )),
            Image.network(
              widget.image,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 1,
              fit: BoxFit.fill,
            ),
            // const SizedBox(height: 15),

            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Text(
                      widget.name,
                      style: AppWidget.HeadlineTextStyle(),
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    if (a > 1) {
                      --a;
                    total = total-int.parse(widget.price);

                    }
                    setState(() {});
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  a.toString(),
                  style: AppWidget.semiTextStyle(),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    ++a;
                    total = total+ int.parse(widget.price);
                    setState(() {});
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Text(
              widget.detail,maxLines: 4,
              style: AppWidget.LightTextStyle(),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Price",
                      style: AppWidget.semiTextStyle(),
                    ),
                     Text(
                      "NPR: "+total.toString(),
                      style: AppWidget.HeadlineTextStyle(),
                    ),
                  ],
                ),
                GestureDetector(
                onTap: () async {
                Map<String, dynamic> addMedicinetoCart = {
                        "Name": widget.name,
                        "Quantity": a.toString(),
                        "Total": total.toString(),
                        "Image": widget.image
                      };
                      await DatabaseMethods().addMedicinetoCart(addMedicinetoCart, id.toString());
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Medicine Added to Cart",
                style: TextStyle(fontSize: 18.0),
              )));
                    },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(40,15,40,15),
                    decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(26)),
                    child: Row(children: [
                      Text("Add to Cart", style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),),
                      Container( 
                        child: Icon(Icons.shopping_cart_outlined ,color: Colors.white),
                      )
                    ],),
                  ),
                )
              ],),
            )
          ],
        ),
      ),
    );
  }
}
