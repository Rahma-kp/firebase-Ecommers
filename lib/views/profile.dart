import 'package:firebase_login/helpers/helpers.dart';
import 'package:firebase_login/services/auth_service.dart';
import 'package:firebase_login/views/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Profile extends StatelessWidget {
   Profile({super.key});
  AuthService auth =AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor:Color.fromARGB(255, 24, 30, 41),
      appBar: AppBar(backgroundColor:Color.fromARGB(255, 24, 30, 41), ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 29, 36, 49)
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(auth.auth.currentUser!.displayName??'',style: GoogleFonts.montserrat(color:Colors.white,fontSize: 17),),
                     spacingHeight(10),
                    Text(auth.auth.currentUser!.email!,style:GoogleFonts.montserrat(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600)),
                    spacingHeight(10),
                    Text(auth.auth.currentUser!.uid,style:GoogleFonts.montserrat(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w600)),
                    
                  ],
                ),
              ),
            ),
            Expanded(child: CartPage()),
          ],
        ),
      )
    );
  }
}
