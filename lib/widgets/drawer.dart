
import 'package:ecommersapp/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class drawerPage extends StatelessWidget {
  AuthService auth = AuthService();
   drawerPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return  Drawer(
      backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 200,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 60,left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   auth.auth.currentUser!.displayName??'',
                    //   style: GoogleFonts.montserrat(color: Colors.black,
                    //     fontSize: 40,)
                    // ),
                    // Text(
                    //   auth.auth.currentUser!.email??'',
                    //   style: GoogleFonts.montserrat(color: Colors.black,
                    //     fontSize: 20,)
                    // ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text('Log out',style: GoogleFonts.montserrat(color: Colors.black,
                        fontSize: 20,),),
              trailing: Icon(Icons.logout),
              onTap: () {
               showDialog(context: context, 
               builder: (context) {
                 return AlertDialog(
                  title:Text('Log out..?',style: GoogleFonts.montserrat(color: Colors.black,
                        fontSize: 18,),), 
                  backgroundColor:  Colors.white,
                 actions: [
                    TextButton(onPressed: () {
                    AuthService().signOutWithEmail();
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