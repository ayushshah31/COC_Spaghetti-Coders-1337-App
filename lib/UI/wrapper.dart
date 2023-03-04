import 'dart:convert';

import 'package:coc_app/UI/bottomBar.dart';
import 'package:coc_app/UI/home.dart';
import 'package:coc_app/UI/kyc.dart';
import 'package:coc_app/UI/loginMeta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User?>(context);
    // final userMeta
    if(user == null) {
      // return const LoginPage();
      return const LoginMeta();
    }
    return BottomBarStart();
  }
}
