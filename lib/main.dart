
import 'package:ecommersapp/controller/authentication.dart';
import 'package:ecommersapp/controller/connectivity_provider.dart';
import 'package:ecommersapp/controller/product_provider.dart';
import 'package:ecommersapp/controller/widget_provider.dart';
import 'package:ecommersapp/firebase_options.dart';
import 'package:ecommersapp/view/welcome%20screens/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthenticationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DatabaseProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ConnectivityProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WidgetProviders(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color.fromARGB(182, 217, 101, 81),
          textTheme: TextTheme(
            titleLarge: GoogleFonts.montserrat(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            bodyMedium: GoogleFonts.montserrat(
              color: Colors.black,
            ),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(182, 217, 101, 81),
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(182, 217, 101, 81),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const Welcome(),
      ),
    );
  }
}
