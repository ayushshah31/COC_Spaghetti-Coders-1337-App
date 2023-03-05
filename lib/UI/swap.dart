import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import '../constants/constants.dart';
import '../services/functions-dai.dart';
import '../services/functions-exc.dart';
import 'package:coc_app/constants/constants.dart';

class Swap extends StatefulWidget {
  final String? address;
  const Swap({Key? key, required this.address}) : super(key: key);

  @override
  State<Swap> createState() => _SwapState();
}

class _SwapState extends State<Swap> {
  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  TextEditingController c = TextEditingController();
  TextEditingController d = TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;

  String dropValue1 = "ETH",dropValue2 = "DAI",dropValue3 = "ETH",dropValue4 = "DAI";

  var _coins = [
    "ETH","DAI"
  ];

  Client? httpClient;
  Web3Client? ethClient;

  @override
  void initState() {
    httpClient = Client();
    ethClient = Web3Client(Alchemy_url, httpClient!);
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: Container(
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
                                  child: Container(height:40,width:200,
                                      child: TextField(controller: a, style: GoogleFonts.poppins(fontSize: 15,color: Color(0xff5c6784)),decoration: InputDecoration(hintText: '1',hintStyle: GoogleFonts.poppins(color: Colors.grey)),keyboardType: TextInputType.number
                                        ,)),
                                ),
                                DropdownButton(
                                  dropdownColor: Color(0xff323b53),
                                  value: dropValue1,
                                    style: TextStyle(fontSize: 14,color: Color(0xffffffff)),
                                    elevation: 5,
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    borderRadius: BorderRadius.circular(20),
                                    items:   _coins
                                        .map((String item) =>
                                        DropdownMenuItem<String>(child: Text(item), value: item))
                                        .toList(),
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
                                      child: Container(height:40,width:200,child: TextField(controller: b, style: GoogleFonts.poppins(fontSize: 15,color: Color(0xff5c6784)),decoration: InputDecoration(hintText: '1',hintStyle: GoogleFonts.poppins(color: Colors.grey)),keyboardType: TextInputType.number)),
                                    ),
                                    DropdownButton(
                                      dropdownColor: Color(0xff323b53),
                                      value: dropValue2,
                                      style: TextStyle(fontSize: 14,color: Color(0xffffffff)),
                                      elevation: 5,
                                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      borderRadius: BorderRadius.circular(20),
                                      items: _coins
                                          .map((String item) =>
                                          DropdownMenuItem<String>(child: Text(item), value: item))
                                          .toList(),
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
                              side: BorderSide(width: 2.0, color: Color(0xff4fbcd3),strokeAlign: 0),
                            ),
                            onPressed: (){print("Swap");},
                            child: Text("Swap",style: GoogleFonts.poppins(color: Color(0xff4fbcd3)),)
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
                    Text("Add ",style: GoogleFonts.poppins(fontSize: 20,color: Colors.white),),
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
                                    child: Container(height:40,width:200,child: TextField(controller: c, style: GoogleFonts.poppins(fontSize: 15,color: Color(0xff5c6784)),decoration: InputDecoration(hintText: '1',hintStyle: GoogleFonts.poppins(color: Colors.grey)),keyboardType: TextInputType.number)),
                                  ),
                                  DropdownButton(
                                    dropdownColor: Color(0xff323b53),
                                    value: dropValue3,
                                    style: TextStyle(fontSize: 14,color: Color(0xffffffff)),
                                    elevation: 5,
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    borderRadius: BorderRadius.circular(20),
                                    items:  _coins
                                        .map((String item) =>
                                        DropdownMenuItem<String>(child: Text(item), value: item))
                                        .toList(),
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
                                      child: Container(height:40,width:200,child: TextField(controller: d, style: GoogleFonts.poppins(fontSize: 15,color: Color(0xff5c6784)),decoration: InputDecoration(hintText: '1',hintStyle: GoogleFonts.poppins(color: Colors.grey)),keyboardType: TextInputType.number)),
                                    ),
                                    DropdownButton(
                                      dropdownColor: Color(0xff323b53),
                                      value: dropValue4,
                                      style: TextStyle(fontSize: 14,color: Color(0xffffffff)),
                                      elevation: 5,
                                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      borderRadius: BorderRadius.circular(20),
                                      items:  _coins
                                          .map((String item) =>
                                          DropdownMenuItem<String>(child: Text(item), value: item))
                                          .toList(),
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
                              side: BorderSide(width: 2.0, color: Color(0xff4fbcd3),strokeAlign: 0),
                            ),
                            onPressed: () async{
                              print("Add");
                              EthereumAddress addr = EthereumAddress.fromHex(contractAddress1);
                              print(addr);
                              print(widget.address.toString());
                              var appr = await approve(addr,int.parse(c.text),ethClient!);
                              var res = await addLiquidity(100, ethClient!);
                              print(res);
                              },
                            child: Text("Add",style: GoogleFonts.poppins(color: Color(0xff4fbcd3)),)
                        )
                      ],
                    )
                  ],
                ),
              )
            ]
          )
        ),
      ),
    );
  }
}
