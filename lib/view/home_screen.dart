import 'package:ecommers/view/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "shoesy",
          style: GoogleFonts.abrilFatface(color: Colors.black),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: (){}, icon: Icon( Icons.search))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder:  (context) => DetailsScreen(),));
            },
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),color: Color.fromARGB(41, 0, 0, 0),),
                height: 700,width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        child: SizedBox(
                          height: 100,
                          width: 180,
                          child: Image.asset(
                            "assets/shoes.webp",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                       "Product:${ "sjjjs"}",style:  GoogleFonts.aBeeZee(color: Colors.black,fontWeight: FontWeight.w300,fontSize:15),
                      ),   SizedBox(height: 5,),
                      Text(
                        "Prize: ${'599'}",style:  GoogleFonts.aBeeZee(color: Colors.black,fontWeight: FontWeight.bold,),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
