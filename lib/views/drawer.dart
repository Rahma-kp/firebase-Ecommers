import 'package:firebase_login/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';


class drawerPage extends StatelessWidget {
  AuthService auth = AuthService();
   drawerPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return  Drawer(
      backgroundColor: Color.fromARGB(255, 24, 30, 41),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 200,
              color: Color.fromARGB(255, 24, 29, 41),
              child: Padding(
                padding: const EdgeInsets.only(top: 60,left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      auth.auth.currentUser!.displayName??'',
                      style: GoogleFonts.montserrat(color: Colors.white,
                        fontSize: 20,)
                    ),
                    Text(
                      auth.auth.currentUser!.email??'',
                      style: GoogleFonts.montserrat(color: Colors.white,
                        fontSize: 12,)
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text('Log out',style: GoogleFonts.montserrat(color: Colors.white,
                        fontSize: 12,),),
              trailing: Icon(Iconsax.logout),
              onTap: () {
               showDialog(context: context, 
               builder: (context) {
                 return AlertDialog(
                  title:Text('Log out..?',style: GoogleFonts.montserrat(color: Colors.white,
                        fontSize: 18,),), 
                  backgroundColor:  Color.fromARGB(255, 24, 30, 41),
                 actions: [
                    TextButton(onPressed: () {
                    AuthService().signOut();
                    Navigator.pop(context);
                    }, child: Text('Yes')),
                    TextButton(onPressed: () {
                      Navigator.pop(context);
                    }, child: Text('No')),
                 ],
                 );
               },);
              },
            ),
          ],
        ),
      );}}