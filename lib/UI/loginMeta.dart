import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coc_app/UI/bottomBar.dart';
import 'package:coc_app/UI/kyc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:get/get.dart';

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
            Get.to(BottomBarStart());
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
        title: const Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   'assets/images/main_page_image.png',
            //   fit: BoxFit.fitHeight,
            // ),
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
            ElevatedButton(
                onPressed: (){
                  loginUsingMetamask(context);
                },
                child: const Text("Connect with Metamask")),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}