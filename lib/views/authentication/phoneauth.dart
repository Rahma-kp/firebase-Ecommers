
import 'package:ecommersapp/helpers/helpers.dart';
import 'package:ecommersapp/services/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';


class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({super.key});

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

AuthService service = AuthService();

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
        TextPosition(offset: phoneController.text.length));
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 24, 30, 41),
      ),
      backgroundColor: Color.fromARGB(255, 24, 30, 41),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Lottie.asset(
                    'assets/Animation - 1703263987973 (1).json',
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              spacingHeight(10),
              TextFormField(
                controller: phoneController,
                onChanged: (value) {
                  setState(() {
                    phoneController.text = value;
                  });
                },
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Enter your number',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Color.fromARGB(255, 30, 38, 52),
                  filled: true,
                  suffixIcon: phoneController.text.length > 9
                      ? Icon(
                          Icons.done_sharp,
                          color: Colors.green,
                        )
                      : null,
                ),
              ),
              spacingHeight(20),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    String countrycode = "+91";
                    String phonenumber = countrycode + phoneController.text;
                    service.signInwithPhone(
                       phonenumber,
                       context,
                    );
                  },
                  child: Text(
                    'Send request',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.amber),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}