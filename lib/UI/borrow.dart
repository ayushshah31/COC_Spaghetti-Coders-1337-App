import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Borrow extends StatefulWidget {
  const Borrow({Key? key}) : super(key: key);

  @override
  State<Borrow> createState() => _BorrowState();
}

class _BorrowState extends State<Borrow> {

  var assets = [
    {'assets':'AAVE','APY':'2.7%','collateral':true},
    {'assets':'DAI','APY':'3.1%','collateral':false},
    {'assets':'USDC','APY':'4.5%','collateral':true},
    {'assets':'USDT','APY':'1.6%','collateral':false},
    {'assets':'LINK','APY':'2.7%','collateral':false},
    {'assets':'USDT','APY':'3.6%','collateral':true},
    {'assets':'LINK','APY':'2.6%','collateral':true},
    {'assets':'ETH','APY':'3.7%','collateral':false},
    {'assets':'DAI','APY':'1.7%','collateral':true},
  ];

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
                    Container(
                      height: 100,
                      child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context,index){
                            return const Text("Nothing Supplied Yet");
                          }
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color(0xff0d101d),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Assets to Borrow ",style: GoogleFonts.poppins(fontSize: 20,color: Color(0xff8C89B4)),),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(width: 28,),
                                Text("Sr.",style: GoogleFonts.poppins(fontSize: 15,color: Colors.grey[400]),),
                                SizedBox(width: 15,),
                                Text("Assets",style: GoogleFonts.poppins(fontSize: 15,color: Colors.grey[400]),),
                                SizedBox(width: 18,),
                                Text("APY",style: GoogleFonts.poppins(fontSize: 15,color: Colors.grey[400]),),
                                SizedBox(width: 10,),
                                Text("Collateral",style: GoogleFonts.poppins(fontSize: 15,color: Colors.grey[400]),)
                              ],
                            ),
                            Container(
                              height: 200,
                              child: ListView.builder(
                                  itemCount: assets.length,
                                  itemBuilder: (context, index){
                                    return Container(
                                      padding: EdgeInsets.fromLTRB(25, 10, 10, 10),
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Color(0xff121b2a),
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(flex:2,child: Text('${index+1}. ',style: GoogleFonts.poppins(fontSize: 14,color: Colors.white),)),
                                          Expanded(flex:3,child: Text(assets[index]['assets'].toString(),style: GoogleFonts.poppins(fontSize: 14,color: Colors.white),)),
                                          Expanded(flex:3,child: Text(assets[index]['APY'].toString(),style: GoogleFonts.poppins(fontSize: 14,color: Colors.white),)),
                                          Expanded(flex:2,child: Text(assets[index]['collateral']==true?"✔️":"-",style: GoogleFonts.poppins(fontSize: 14,color: Colors.white),)),
                                          Expanded(flex:3,child: OutlinedButton(style: OutlinedButton.styleFrom(
                                            side: BorderSide(width: 2.0, color: Color(0xff4fbcd3),strokeAlign: 0),
                                          ),child: Icon(Icons.account_balance_wallet,color: Colors.white,size: 18,),onPressed: (){},)),
                                        ],
                                      ),
                                    );
                                  }
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
            )
          ]
      ),
    );
  }
}
