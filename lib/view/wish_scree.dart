import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishScreen extends StatelessWidget {
  const WishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("Wish-List", style: GoogleFonts.abrilFatface(color: Colors.black,fontWeight: FontWeight.w100),)),
        body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(height: 300,
              child: Card(
                elevation: 2.0,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/shoes.webp",
                          height: 100,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        Text("sjjjs"),
                        Text("Prize:${'599'}"),
                       Container(color: Colors.black,height:10,width: 50,)
                      ],
                    ),
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