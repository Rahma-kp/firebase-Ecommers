import 'package:ecommers/view/details_screen.dart';
import 'package:ecommers/widget/alert_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "Cart",
          style: GoogleFonts.abrilFatface(color: Colors.black),
        )),
        body: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index) {
              return Card(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          height: 110,
                          width: 140,
                          child: Image.asset("assets/shoes.webp",
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        Text("shodfghjkl"),
                        Text("599"),
                        Row(
                          children: [
                            Text("Size:M"),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Qty:1")
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      MaterialButton(onPressed: (){
                        showBottomAlertBox(context);
                      },child: Text("Remove",style: TextStyle(color: Colors.white)),color: Colors.black,)

                      ],
                    ),
                    SizedBox(width: 60,),
                    IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsScreen(),));}, icon: Icon(Icons.arrow_forward_ios_outlined))
                  ],
                ),
              );
            }));
  }
}
