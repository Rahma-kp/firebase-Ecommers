import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showBottomAlertBox(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black45,
    transitionDuration: Duration(milliseconds: 200),
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 250,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'REMOVE PRODUCT FROM CART',
                      style: GoogleFonts.aBeeZee(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 15),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.close))
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                          "assets/shoes.webp",
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("shodfghjkl",
                            style: GoogleFonts.aBeeZee(fontSize:15,decoration: TextDecoration.none,color: Colors.black)),
                        Text(
                          "599",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontSize: 15),
                        ),
                        Row(
                          children: [
                            Text(
                              "Size:M",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                  color: Colors.black,
                                  fontSize: 15),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Qty:1",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                  color: Colors.black,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.close,color: Colors.black),
                        label: Text("Remove",style: TextStyle(color: Colors.black),)),
                        ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.favorite,color: Color.fromARGB(255, 154, 31, 31),),
                        label: Text("Move to Wishlist",style: TextStyle(color: Colors.black),))
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
