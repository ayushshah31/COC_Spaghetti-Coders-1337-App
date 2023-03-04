import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Swap extends StatefulWidget {
  const Swap({Key? key}) : super(key: key);

  @override
  State<Swap> createState() => _SwapState();
}

class _SwapState extends State<Swap> {
  int a=0,b=0,c=0,d=0;
  String dropValue1 = "Enter",dropValue2 = "Enter",dropValue3 = "Enter",dropValue4 = "Enter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfer"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: Color(0xff141332),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xff0d101d),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Swap ",style: GoogleFonts.poppins(fontSize: 20,color: Colors.white),),
                  Container(
                    height: 150,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff121b2a),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                                child: Text("$a",style: GoogleFonts.poppins(fontSize: 15,color: Color(0xff5c6784)),),
                              ),
                              DropdownButton(
                                dropdownColor: Color(0xff323b53),
                                value: dropValue1,
                                  style: TextStyle(fontSize: 14,color: Color(0xffffffff)),
                                  elevation: 5,
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  borderRadius: BorderRadius.circular(20),
                                  items:  const [DropdownMenuItem(child: Text("Eth"),value: 'ETH',),DropdownMenuItem(child: Text("Den"),value: 'DEN',)],
                                  onChanged: (String? newValue){
                                    setState(() {
                                      dropValue1 = newValue!;
                                    });
                                  },
                              )
                            ],
                          )
                        ),
                        Positioned(
                          top: 80,
                          child: Container(
                            width: 317,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xff121b2a),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                                    child: Text("$b",style: GoogleFonts.poppins(fontSize: 15,color: Color(0xff5c6784)),),
                                  ),
                                  DropdownButton(
                                    dropdownColor: Color(0xff323b53),
                                    // value: dropValue,
                                    style: TextStyle(fontSize: 14,color: Color(0xffffffff)),
                                    elevation: 5,
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    borderRadius: BorderRadius.circular(20),
                                    items:  const [DropdownMenuItem(child: Text("Eth"),value: 'ETH',),DropdownMenuItem(child: Text("Den"),value: 'DEN',)],
                                    onChanged: (String? newValue){
                                      setState(() {
                                        dropValue2 = newValue!;
                                      });
                                    },
                                  )
                                ],
                              )
                          ),
                        ),
                        Positioned(
                          right: 150,
                          top:50,
                          child: Container(
                            height:40,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Color(0xff283349)
                            ),
                            child: Icon(Icons.arrow_downward_sharp),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      OutlinedButton(
                          // borderSide: BorderSide(
                          //   width: 5.0,
                          //   color: Colors.blue,
                          //   style: BorderStyle.solid,
                          // ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(width: 2.0, color: Colors.blue,strokeAlign: 0),
                          ),
                          onPressed: (){print("Swap");},
                          child: Text("Swap")
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xff0d101d),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Swap ",style: GoogleFonts.poppins(fontSize: 20,color: Colors.white),),
                  Container(
                    height: 150,
                    child: Stack(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xff121b2a),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                                  child: Text("$c",style: GoogleFonts.poppins(fontSize: 15,color: Color(0xff5c6784)),),
                                ),
                                DropdownButton(
                                  dropdownColor: Color(0xff323b53),
                                  // value: dropValue,
                                  style: TextStyle(fontSize: 14,color: Color(0xffffffff)),
                                  elevation: 5,
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  borderRadius: BorderRadius.circular(20),
                                  items:  const [DropdownMenuItem(child: Text("Eth"),value: 'ETH',),DropdownMenuItem(child: Text("Den"),value: 'DEN',)],
                                  onChanged: (String? newValue){
                                    setState(() {
                                      dropValue3 = newValue!;
                                    });
                                  },
                                )
                              ],
                            )
                        ),
                        Positioned(
                          top: 80,
                          child: Container(
                              width: 317,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xff121b2a),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                                    child: Text("$d",style: GoogleFonts.poppins(fontSize: 15,color: Color(0xff5c6784)),),
                                  ),
                                  DropdownButton(
                                    dropdownColor: Color(0xff323b53),
                                    // value: dropValue,
                                    style: TextStyle(fontSize: 14,color: Color(0xffffffff)),
                                    elevation: 5,
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    borderRadius: BorderRadius.circular(20),
                                    items:  const [DropdownMenuItem(child: Text("Eth"),value: 'ETH',),DropdownMenuItem(child: Text("Den"),value: 'DEN',)],
                                    onChanged: (String? newValue){
                                      setState(() {
                                        dropValue4 = newValue!;
                                      });
                                    },
                                  )
                                ],
                              )
                          ),
                        ),
                        Positioned(
                          right: 150,
                          top:50,
                          child: Container(
                            height:40,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: Color(0xff283349)
                            ),
                            child: Icon(Icons.arrow_downward_sharp),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      OutlinedButton(
                        // borderSide: BorderSide(
                        //   width: 5.0,
                        //   color: Colors.blue,
                        //   style: BorderStyle.solid,
                        // ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(width: 2.0, color: Colors.blue,strokeAlign: 0),
                          ),
                          onPressed: (){print("Swap");},
                          child: Text("Swap")
                      )
                    ],
                  )
                ],
              ),
            )
          ]
        )
      ),
    );
  }
}
