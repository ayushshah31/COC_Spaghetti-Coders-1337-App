import 'dart:io' as io;
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class KYC extends StatefulWidget {
  const KYC({Key? key}) : super(key: key);

  @override
  State<KYC> createState() => _KYCState();
}

class _KYCState extends State<KYC> {

  bool textScanning = false;
  bool gotAadhar = false;

  XFile? imageFile;

  String scannedText = "";
  String aadhar = "";
  String name= "",gender="";
  var intValue = Random().nextInt(1000);

  //collection
  final CollectionReference _productss = FirebaseFirestore.instance.collection('products');

  Future<UploadTask?> uploadFile(XFile? file) async {
    if (file == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No file was selected'),
        ),
      );

      return null;
    }

    UploadTask uploadTask;

    // Create a Reference to the file
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('flutter-tests').child("/img$intValue.png");

    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': file.path},
    );

    if (kIsWeb) {
      uploadTask = ref.putData(await file.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(io.File(file.path), metadata);
    }
    print(ref.fullPath);
    print("url: " + await ref.getDownloadURL());
    return Future.value(uploadTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("KYC"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (textScanning) const CircularProgressIndicator(),
                    if (!textScanning && imageFile == null)
                      Container(
                        width: 300,
                        height: 300,
                        color: Colors.grey[300]!,
                      ),
                    if (imageFile != null) Image.file(io.File(imageFile!.path)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.grey,
                                shadowColor: Colors.grey[400],
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                              ),
                              onPressed: () {
                                getImage(ImageSource.gallery);
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.image,
                                      size: 30,
                                    ),
                                    Text(
                                      "Gallery",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey[600]),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.grey,
                                shadowColor: Colors.grey[400],
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                              ),
                              onPressed: () {
                                getImage(ImageSource.camera);
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.camera_alt,
                                      size: 30,
                                    ),
                                    Text(
                                      "Camera",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey[600]),
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text('aadhar No: $aadhar',style: TextStyle(fontSize: 20),),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text('Name: $name',style: TextStyle(fontSize: 20),),
                    ),
                    (imageFile != null && aadhar!="" && gotAadhar)?
                    ElevatedButton(
                        onPressed: () async{
                          UploadTask? result = await uploadFile(imageFile);
                          print(result!.snapshot.printInfo);
                        },
                        child: const Text("Verify")
                    ): Text("Recapture aadhar"),
                    // Container(
                    //   child: Text(
                    //     scannedText,
                    //     style: TextStyle(fontSize: 20),
                    //   ),
                    // )
                  ],
                )),
          )),
    );
  }

  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        setState(() {});
        getRecognisedText(pickedImage);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      scannedText = "Error occured while scanning";
      setState(() {});
    }
  }

  void getRecognisedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = "";
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = scannedText + line.text + "\n";
        var splitT = line.text.split(" ");
        if(line.text.length == 14 && splitT.length==3 && splitT.any((element) => element.isNum)){
          print("ans: " + line.text);
          aadhar = line.text;
          gotAadhar = true;
        }
        if(splitT.length == 3 && line.text!="Government of India" && splitT[0].isAlphabetOnly){
          name = line.text;
        }
        // if(splitT.contains('Male')){
        //   print("Male found");
        // }
        // else if(splitT.contains('Female')){
        //   print("Female");
        // }
        // else{
        //   print("Not Found");
        // }
      }
    }
    // print(scannedText.runtimeType);
    // print(scannedText.matchAsPrefix("DOB"));
    // var stripT = scannedText.split(" ");
    print("ans: " + scannedText);
    // for(var line in scannedText as List){
    //   print("Line: " + line);
    // }
    textScanning = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }
}
/*
cheap
have
plastic
size
beach
solid
define
urge
snow
neytral
evoke
inherit
* */