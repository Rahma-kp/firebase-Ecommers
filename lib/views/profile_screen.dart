
import 'package:ecommersapp/helpers/helpers.dart';
import 'package:ecommersapp/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Profile extends StatelessWidget {
   Profile({super.key});
  AuthService auth =AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [IconButton(onPressed: (){
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
                    }, child: const Text('Yes')),
                    TextButton(onPressed: () {
                      Navigator.pop(context);
                    }, child: Text('No')),
                 ],
                 );
               },);
      }, icon: Icon(Icons.logout))],),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.person,size:50,),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(auth.firebaseAuth.currentUser!.email??'',style: GoogleFonts.montserrat(color:Colors.black,fontSize: 17),),
                         spacingHeight(10),
                        Text(auth.firebaseAuth.currentUser!.uid,style:GoogleFonts.montserrat(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600)),
                        // spacingHeight(10),
                        // Text(auth.auth.currentUser!.uid,style:GoogleFonts.montserrat(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w600)),
                        
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
