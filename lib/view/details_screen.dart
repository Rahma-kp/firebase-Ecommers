import 'package:ecommers/view/cart_screen.dart';
import 'package:ecommers/view/wish_scree.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back_ios_new)),
      actions: [
      IconButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen(),));
      }, icon: Icon(Icons.favorite_border_outlined)),
      IconButton(onPressed: (){ 
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => WishScreen(),));
      }, icon: Icon(Icons.shopping_cart_outlined)),
      
      ]),
      body: Column(children: [ 
        Center(
          child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(10)),
            child: SizedBox(height: 300,
            width: 300,
            child: Image.asset("assets/images1.jpeg",
            fit: BoxFit.fill,)),
          ),
        ),
        SizedBox(height: 10,),
        Card(child: Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [Column(
          children: [
            Text("asdfghjklsxfcgvhjvhjbhjvhjkhchvnb hch"),
            Text("sdfghjkl"),
            Text("MRP:${599}")
          ],
        )]),),
         SizedBox(height: 10,),
        Card(child: Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [Column(
          children: [
            Text("asdfghjklsxfcgvhjvhjbhjvhjkhchvnb hch"),
            Text("sdfghjkl"),
            Text("MRP:${599}")
          ],
        )]),)

        ]),
      );
  }
}