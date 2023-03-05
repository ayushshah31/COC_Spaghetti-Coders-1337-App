import 'package:coc_app/UI/kyc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../auth/auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'getStarted.dart';

class ProfilePage extends StatefulWidget {
  final String? address;
  const ProfilePage({Key? key, required this.address}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final CollectionReference _users = FirebaseFirestore.instance.collection('users');
  AuthService _auth = AuthService();
  User? _person = FirebaseAuth.instance.currentUser;
  var status;

  void func() async{
    await _users.doc('PpoSiB8Vs3D7JQ44mm3C').get().then((value) {
      print(value.data());
      // print(value['kycCompleted']);
      status = value['kycCompleted'];
    });
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    func();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(100, 120, 100, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OutlinedButton(
            child: Text("Signout"),
            style: OutlinedButton.styleFrom(
              side: BorderSide(width: 2.0, color: Color(0xff4fbcd3),strokeAlign: 0),
            ),
            onPressed: (){
              _auth.handleSignOut();
              Get.to(GetStarted());
            },
          ),
          SizedBox(height:20),
          Text("KYC Status: ",style: GoogleFonts.poppins(fontSize: 20,color: Colors.white),),
          SizedBox(height:20),
          (status)?Text("KYC VERIFIED",style: GoogleFonts.poppins(fontSize: 20,color: Colors.white),):
          Column(
            children: [
              Text("KYC Not verified",style: GoogleFonts.poppins(fontSize: 20,color: Colors.white),),
              SizedBox(height: 20,),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                side: BorderSide(width: 2.0, color: Color(0xff4fbcd3),strokeAlign: 0),
                ),
                onPressed: ()=>Get.to(KYC(address: widget.address.toString())),
                child: Text("Verify"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
