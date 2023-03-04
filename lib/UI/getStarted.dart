import 'package:coc_app/UI/loginMeta.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import './wrapper.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141332),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: 'logo',
            child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 300, 10, 30),
              child: Image.asset('assets/logo.png',scale: 0.5,)
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15,10,10,10),
            child: Text('Transforming finance, one block at a time',
            style: GoogleFonts.aladin(
              fontSize: 28,
              color: Color(0xffF9FBFF)
            ),),
          ),
          const SizedBox(height:140),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: (){
                Get.to(const LoginMeta());
                // Get.to(LoginMeta());
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(double.infinity, 45)),
                backgroundColor: MaterialStateProperty.all(const Color(0xff4fbcd3))),
              child: Text("Get Started",style: GoogleFonts.poppins(fontSize: 20),),
            )
          ),
        ],
      ),
    );
  }
}