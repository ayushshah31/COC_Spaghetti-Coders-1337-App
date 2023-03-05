import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coc_app/UI/bottomBar.dart';
import 'package:coc_app/UI/kyc.dart';
import 'package:coc_app/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import '../auth/auth.dart';

class LoginMeta extends StatefulWidget {
  const LoginMeta({Key? key}) : super(key: key);

  @override
  State<LoginMeta> createState() => _LoginMetaState();
}

class _LoginMetaState extends State<LoginMeta> {
  // final CollectionReference _users = FirebaseFirestore.instance.collection('users');
  // User? user = FirebaseAuth.instance.currentUser;
  // bool isLoading = true;
  // dynamic fetchData;
  // void func() async{
  //   var res1 = await _users.doc('wi2uxEiqGl86kP5Qd575').get();
  //   fetchData = res1.data();
  //   print("result: " + fetchData.toString());
  //   print(fetchData['address']);
  //   print(fetchData['kycCompleted']);
  //   // print(jsonDecode(res.data));
  //   setState(() {
  //     isLoading = false;
  //   });
  //
  // }
  final _auth = AuthService();
  var connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
          name: 'My App',
          description: 'An app for converting pictures to NFT',
          url: 'https://walletconnect.org',
          icons: [
            'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
          ]));

  var _session, _uri;

  bool success = false;
  loginUsingMetamask(BuildContext context) async {
    if (!connector.connected) {
      try {
        var session = await connector.createSession(onDisplayUri: (uri) async {
          _uri = uri;
          await launchUrlString(uri, mode: LaunchMode.externalApplication);
        });
        setState(() {
          _session = session;
          success = true;
        });
      } catch (exp) {
        print(exp);
        print("Error");
      }
    }
  }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   func();
  // }

  @override
  Widget build(BuildContext context) {
    connector.on(
        'connect',
            (session) => setState(
              () {
            _session = _session;
            print("Success");
            print(_session.accounts[0]);
            print(_session);
            _auth.signIpWithEmailPassword("${_session.accounts[0]}@gmail.com", "pass@123");
            Get.to(BottomBarStart(address: _session.accounts[0]));
          },
        ));
    connector.on(
        'session_update',
            (payload) => setState(() {
          _session = payload;
          print(payload);
          // print(payload);
        }));
    connector.on(
        'disconnect',
            (payload) => setState(() {
              print("Disconnect");
          _session = null;
        }));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Login Page',style: GoogleFonts.poppins(fontSize: 28),),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: const Color(0xff141332),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'logo',
            child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 240, 10, 30),
                child: Image.asset('assets/logo.png',scale: 0.5,)
            ),
          ),
          (_session != null) ? Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account',
                      style: GoogleFonts.merriweather(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      '${_session.accounts[0]}',
                      style: GoogleFonts.inconsolata(fontSize: 16),
                    ),
                  ]
              )
          ) :
              Image.asset('wallet.png'),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 2.0, color: Color(0xff4fbcd3),strokeAlign: 0),
                ),
                onPressed: (){
                  loginUsingMetamask(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Connect with Metamask",style: GoogleFonts.poppins(fontSize: 18,color: Color(0xff4fbcd3)),),
                    Image.asset('assets/metamask.png',scale: 2,)
                ]
                 )),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}