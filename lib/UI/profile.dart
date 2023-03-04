import 'package:flutter/material.dart';

import '../auth/auth.dart';
import 'package:get/get.dart';

import 'getStarted.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text("Signout"),
        onPressed: (){
          _auth.handleSignOut();
          Get.to(GetStarted());
        },
      ),
    );
  }
}
