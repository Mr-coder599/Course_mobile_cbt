import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_material_app/screen/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'function/model/Userdb.dart';

class RegisterReg extends StatefulWidget {
  const RegisterReg({
    Key? key,
  }) : super(key: key);
  //final User user;
  @override
  State<RegisterReg> createState() => _RegisterRegState();
}

class _RegisterRegState extends State<RegisterReg> {
  final _globalKey = GlobalKey<FormState>();
  final _MatricEdition = TextEditingController();
  final _genderEdition = TextEditingController();
  final _positionEdition = TextEditingController();
  final _phoneNumber = TextEditingController();
  final String imageUri = '';
  final firestore = FirebaseFirestore.instance;
  File? file;
  bool loading = false;
  String dropdownvalue = 'Male';
  // String dropdownbalues = 'Student';
  var items = [
    'Male',
    'Female',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Material App'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Center(
              child: Form(
                key: _globalKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    if (file != null)
                      Container(
                        width: 120,
                        height: 120,
                        child: Image.file(
                          file!,
                          height: 240,
                          width: 220,
                          fit: BoxFit.cover,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                      ),
                    IconButton(
                      onPressed: () {
                        _imageSelection();
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        size: 50,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Take a snap or Gallary',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: _requiredValidator,
                      controller: _MatricEdition,
                      decoration: InputDecoration(
                          label: Text('FullName'),
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DropdownButton(
                        isExpanded: true,
                        // validator: _requiredValidator,
                        hint: Text('Select type '),
                        value: dropdownvalue,
                        icon: Icon(Icons.keyboard_arrow_down),
                        borderRadius: BorderRadius.circular(20),
                        dropdownColor: Colors.white,
                        style: TextStyle(
                            // backgroundColor: Colors.blue,
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            _genderEdition.text = newValue;
                          });
                        }),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: _requiredValidator,
                      controller: _positionEdition,
                      decoration: InputDecoration(
                          label: Text('Department'),
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: _requiredValidator,
                      controller: _phoneNumber,
                      decoration: InputDecoration(
                          label: Text('Phone Number'),
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.phone,
                      maxLength: 11,
                    ),
                    SizedBox(height: 20),

                    loading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                loading = true;
                              });
                              if (_globalKey.currentState != null) {
                                if (_globalKey.currentState!.validate()) {
                                  _uploadImageToFirebase();
                                }
                              }
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            style: ButtonStyle(
                              textStyle: MaterialStateProperty.all(
                                  TextStyle(fontSize: 20.0)),
                              elevation: MaterialStateProperty.all<double>(0.0),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              //   shadowColor: MaterialStateProperty.all<Color>(Colors.amberAccent),
                              minimumSize:
                                  MaterialStateProperty.all(Size(70, 50)),
                              fixedSize:
                                  MaterialStateProperty.all(Size(350, 40)),
                              side: MaterialStateProperty.all(
                                  BorderSide(color: Colors.white)),
                            ),
                          ),
                    SizedBox(
                      height: 20,
                    ),
                    // TextButton(
                    //   onPressed: () {
                    //     // Navigator.pushReplacement(
                    //     //     context,
                    //     //     MaterialPageRoute(
                    //     //         builder: (context) => const ShowRecords(user:
                    //     //         ,)));
                    //   },
                    //   child: Text(
                    //     'Show '
                    //     'Informations',
                    //     style: TextStyle(
                    //         color: Colors.red, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _imageSelection() async {
    return showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            title: Text('Choose Images'),
            content: SingleChildScrollView(
              padding: EdgeInsets.all(8),
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _ImageFromGallery(context);
                    },
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Gallery'),
                        SizedBox(
                          width: 25,
                        ),
                        Icon(
                          Icons.camera,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                      onTap: () {
                        _ImageFromCamera(context);
                      },
                      child: Row(
                        children: <Widget>[
                          Text('Camera'),
                          SizedBox(
                            width: 25,
                          ),
                          Icon(
                            Icons.camera_alt,
                            size: 20,
                          ),
                        ],
                      )),
                ],
              ),
            ),
          );
        });
  }

  //function for both camera and Gallary
  void _ImageFromGallery(BuildContext context) async {
    final pickImage = ImagePicker();
    final imagepicked = await pickImage.pickImage(source: ImageSource.gallery);
    if (imagepicked != null) {
      setState(() {
        file = File(imagepicked.path);
      });
    }
    Navigator.of(context).pop();
  }

  void _ImageFromCamera(BuildContext context) async {
    final pickImage = ImagePicker();
    final imagepicked = await pickImage.pickImage(source: ImageSource.camera);
    if (imagepicked != null) {
      setState(() {
        file = File(imagepicked.path);
      });
    }
    Navigator.of(context).pop();
  }

  /// databse saving record
  Future RentalDataSaved(String imageUrl) async {
    setState(() {
      loading = true;
    });

    try {
      // firestore.collection('Advisor').doc(widget.user.uid).snapshots();
      // var snapshot;
      // //builder(context, snapshot){}
      // final data = snapshot.data?.data();
      // if (data! != null) {
      //   final staff = StaffReg.froJson(data);

      final Students = UserReg(
        // uid: widget.user,
        photo: imageUrl.toString(),
        gender: _genderEdition.text,
        depart: _positionEdition.text,
        names: _MatricEdition.text,
        // uid: uid.toString(),
        phone: _phoneNumber.text,
      );
      // FutureBuilder(
      //   future: Future.delayed(Duration.zero),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return CircularProgressIndicator();
      //     }
      //   },
      // );
      await firestore
          .collection('StudentDetails')
          .doc(Students.depart)
          .set(Students.toJson());
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Saved Successfully'),
                content: Text('Data Uploaded'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage(
                                    //user: widget.user,
                                    )));
                      },
                      child: Text('Ok')),
                ],
              ));
      // _MatricEdition.clear();
      // _positionEdition.clear();
      // _genderEdition.clear();
      // _phoneNumber.clear();
      //Image.file('' as File);
      // Navigator.of(context).pop();
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (context) => AgentDashboard(user: widget.user)));
      // }
    } on FirebaseAuthException catch (e) {}
  }

  String? _requiredValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return "This field is required";
    }
    return null;
  }

  ///
  ///
  Future<void> _uploadImageToFirebase() async {
    if (file != null) {
      try {
        FirebaseStorage storage = FirebaseStorage.instance;
        Reference storageRef = storage
            .ref()
            .child('StudentImage/${DateTime.now().toString()}.png');
        UploadTask uploadTask = storageRef.putFile(file!);
        TaskSnapshot storageSnapshot = await uploadTask.whenComplete(() {});
        String imageUrl = await storageSnapshot.ref.getDownloadURL();
        RentalDataSaved(imageUrl);
      } catch (e) {
        print('Error uploading');
      }
    }
  }
}
