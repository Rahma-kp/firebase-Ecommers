// import 'package:ecommerce_app/view/widgets/text_widgets.dart';
// import 'package:enefty_icons/enefty_icons.dart';
// import 'package:flutter/material.dart';

// class CartPage extends StatefulWidget {
//   @override
//   _CartPageState createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   List<Map<String, dynamic>> cartItems = [
//     {
//       'name': 'Product 1',
//       'price': 20.0,
//       'quantity': 2,
//       'image': 'assets/images/dummy.jpg'
//     },
//     {
//       'name': 'Product 2',
//       'price': 30.0,
//       'quantity': 1,
//       'image': 'assets/images/headset .jpg'
//     },
//     // Add more items as needed
//   ];

//   double getTotalPrice() {
//     double totalPrice = 0.0;
//     cartItems.forEach((item) {
//       totalPrice += item['price'] * item['quantity'];
//     });
//     return totalPrice;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Cart'),
//       ),
//       body: ListView.builder(
//         itemCount: cartItems.length,
//         itemBuilder: (context, index) {
//           final item = cartItems[index];
//           return ListTile(
//             leading: Container(
//               width: 50,
//               height: 50,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 image: DecorationImage(
//                   image: AssetImage('assets/images/headset .jpg'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             title: Text(item['name']),
//             subtitle: Text('Price: \$${item['price']}'),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 IconButton(
//                   icon: Icon(EneftyIcons.minus_outline),
//                   onPressed: () {
//                     setState(() {
//                       if (item['quantity'] > 1) {
//                         item['quantity']--;
//                       }
//                     });
//                   },
//                 ),
//                 Text(item['quantity'].toString()),
//                 IconButton(
//                   icon: Icon(EneftyIcons.add_outline),
//                   onPressed: () {
//                     setState(() {
//                       item['quantity']++;
//                     });
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Padding(
//           padding: EdgeInsets.all(10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Total: \$${getTotalPrice().toStringAsFixed(2)}',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   // Implement checkout functionality
//                 },
//                 child: TextWidgets()
//                     .BodyText(context, text: 'Checkout', color: Colors.white),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
