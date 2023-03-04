import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height:20),
        Container(
          margin: EdgeInsets.all(10),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xff1D1D40),
          ),
          height:150,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("My Balance",style: GoogleFonts.poppins(color: const Color(0xff8C89B4),fontSize: 25)),
                    Text("3.00",style: GoogleFonts.poppins(color: Colors.white,fontSize: 25)),
                    Stack(
                      children: [
                        Image.asset('assets/Rectangle 34.png',scale: 0.9,),
                        const Padding(padding: EdgeInsets.fromLTRB(10, 3, 0, 0),child: Text('+1.29%',style: TextStyle(
                          color: Colors.green,
                        ),),)
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(width: 25,),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Stack(
                  children: [
                    Image.asset('assets/Rectangle_blue.png',scale: 0.65,),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Image.asset('assets/Arrow.png'),
                    ),

                  ],
                ),
              ),
              // const SizedBox(width: 25),
            ],
          ),
        ),
      ],
    );
  }
}
