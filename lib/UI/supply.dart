import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Supply extends StatefulWidget {
  const Supply({Key? key}) : super(key: key);

  @override
  State<Supply> createState() => _SupplyState();
}

class _SupplyState extends State<Supply> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Supplies"),
        centerTitle: true,
        backgroundColor: Color(0xff141332),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(14),
            child: Column(
              children: [
                Text("Your Supplies ",style: GoogleFonts.poppins(fontSize: 20,color: Colors.white),),
                Divider(color: Colors.blueGrey),
                ListView.builder(
                  itemCount: 1,
                    itemBuilder: (context,index){
                    return const Text("Nothing Supplied Yet");
                    }
                )
              ],
            )
          )
        ]
      ),
    );
  }
}
