import 'package:coc_app/UI/borrow.dart';
import 'package:coc_app/UI/supply.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
  String name = "Ayush";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5,),
                  Text('Welcome,',style: TextStyle(fontSize: 19,color: Color(0xffA6A6A6)),),
                  const SizedBox(height:5),
                  Text('$name👋',style: const TextStyle(fontSize: 24,color: Colors.white),)
                ],
              ),
              CircleAvatar(
                  minRadius: 20,
                  child: Image.asset('assets/Mask group.png')
              )
              // Image.asset('assets/homephotos.png')
              // Image.asset('assets/')
            ],
          ),
          SizedBox(height:20),
          Container(
            // margin: EdgeInsets.all(10),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xff0d101d),
            ),
            height:100,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("My Balance",style: GoogleFonts.poppins(color: const Color(0xff8C89B4),fontSize: 22)),
                      Text("3.00",style: GoogleFonts.poppins(color: Colors.white,fontSize: 22)),
                      // Stack(
                      //   children: [
                      //     Image.asset('assets/Rectangle 34.png',scale: 0.9,),
                      //     const Padding(padding: EdgeInsets.fromLTRB(10, 3, 0, 0),child: Text('+1.29%',style: TextStyle(
                      //       color: Colors.green,
                      //     ),),)
                      //   ],
                      // )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: Stack(
                    children: [
                      Image.asset('assets/Rectangle_blue.png',scale: 0.9,),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset('assets/Arrow.png'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: (){
              Get.to(Supply());
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xff0d101d),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Assets to Supply ",style: GoogleFonts.poppins(fontSize: 20,color: Color(0xff8C89B4)),),
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
          SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              Get.to(Borrow());
            },
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
      ),
    );
  }
}
