import 'package:coc_app/UI/kyc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class LoginMeta extends StatefulWidget {
  const LoginMeta({Key? key}) : super(key: key);

  @override
  State<LoginMeta> createState() => _LoginMetaState();
}

class _LoginMetaState extends State<LoginMeta> {
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

  loginUsingMetamask(BuildContext context) async {
    if (!connector.connected) {
      try {
        var session = await connector.createSession(onDisplayUri: (uri) async {
          _uri = uri;
          await launchUrlString(uri, mode: LaunchMode.externalApplication);
        });
        setState(() {
          _session = session;
        });
      } catch (exp) {
        print(exp);
        print("Error");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    connector.on(
        'connect',
            (session) => setState(
              () {
            _session = _session;
            print("Success");
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
                onPressed: () => loginUsingMetamask(context),
                child: const Text("Connect with Metamask")),
            SizedBox(height: 20),
            (_session!=null)?
            ElevatedButton(
                onPressed: ()=> Get.to(KYC()), child: Text("KYC")
            ): Container()
          ],
        ),
      ),
    );
  }
}