import 'package:course_material_app/screen/HomePage.dart';
import 'package:course_material_app/screen/Signup_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  late bool isPasswordTextField = true;
  bool showPassword = true;
  String dropdownvalue = 'Male';
  var items = [
    'Male',
    'Female',
  ];
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Course Material App'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                dveloper(context);
              },
              icon: Icon(
                Icons.account_circle,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              // Spacer(),
              Container(
                child: Form(
                  //  key: ,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 110,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/logo.jpg'),
                        radius: 60,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Hi Welcome',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Please supply login crendentials',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: "Email",
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: _passwordcontroller,
                        obscureText: isPasswordTextField ? showPassword : true,
                        maxLength: 8,
                        decoration: InputDecoration(
                          hintText: "Password should not greather than 8 "
                              "characher",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            icon: Icon(Icons.remove_red_eye),
                          ),
                        ),
                      ),

                      // SizedBox(
                      //   height: 24,
                      // ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                        // decoration: BoxDecoration(
                        //     color: Colors.blue,
                        //     borderRadius: BorderRadius.circular(30)),
                        child: _isLoading
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    _isLoading = true; //
                                  });
                                  try {
                                    final UserCredential credential =
                                        await _auth.signInWithEmailAndPassword(
                                      email: _emailcontroller.text,
                                      password: _passwordcontroller.text,
                                    );
                                    CircularProgressIndicator();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text('Login Successfully')));
                                    final user = credential.user;
                                    if (user != null) {
                                      // Navigator.of(context)
                                      //     .push(MaterialPageRoute(
                                      //     builder: (context) =>
                                      //     )));
                                      //    CircularProgressIndicator();
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => HomePage(
                                                    user: user,
                                                    //  user: user,
                                                  )));
                                    }
                                  } on FirebaseAuthException catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(e.message ?? '')));
                                  }
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                                style: ButtonStyle(
                                  textStyle: MaterialStateProperty.all(
                                      TextStyle(fontSize: 20.0)),
                                  elevation:
                                      MaterialStateProperty.all<double>(0.0),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blueAccent),
                                  //   shadowColor: MaterialStateProperty.all<Color>(Colors.amberAccent),
                                  minimumSize:
                                      MaterialStateProperty.all(Size(50, 50)),
                                  fixedSize:
                                      MaterialStateProperty.all(Size(320, 50)),
                                  side: MaterialStateProperty.all(
                                      BorderSide(color: Colors.white)),
                                ),
                              ),
                        // child: Text(
                        //   "Sign In",
                        //   style: TextStyle(fontSize: 16, color: Colors.white),
                        // ),
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account? ',
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 17)),
                          GestureDetector(
                            onTap: () {
                              //   widget.toogleView();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignupPage(
                                          //    user: user,
                                          )));
                            },
                            child: Container(
                              child: Text('Sign Up',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      decoration: TextDecoration.underline,
                                      fontSize: 17)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: forgotpassword(context),
              ),
              // SizedBox(
              //   height: 80,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void dveloper(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'About Developers',
              style: TextStyle(color: Colors.red),
            ),
            content: SingleChildScrollView(
              child: Container(
                child: Card(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // SizedBox(
                          //   height: 20,
                          // ),
                          Center(
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/mrslawal.jpg'),
                              radius: 60,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Supervisor:    '
                            ' Mrs Lawal Tadese',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Student Project Names'
                            '',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Fatoki Akolade A: '
                            'CS20210200300',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Amoo Emmanuel:'
                            'CS20210203265',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          // Text(
                          //   'Co-Supervisor'
                          //   ' Mr A.O Akinlolu',
                          //   style: TextStyle(
                          //     color: Colors.green,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          Text(
                            'Thank You',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget forgotpassword(BuildContext context) {
    final resetpasswordcontroller = TextEditingController();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: Text(
          'forgot Password'.toUpperCase(),
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.right,
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Forgotten Password'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'link will be sent to your email to reset your '
                        'password',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextField(
                        controller: resetpasswordcontroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'enter your emailaddress',
                          hoverColor: Colors.green,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _auth
                              .sendPasswordResetEmail(
                                  email: resetpasswordcontroller.text)
                              .then((value) => Navigator.of(context).pop());
                        },
                        child: Text('Reset Password'),
                        style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 20.0)),
                          elevation: MaterialStateProperty.all<double>(0.0),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.blueAccent),
                          //   shadowColor: MaterialStateProperty.all<Color>(Colors.amberAccent),
                          minimumSize: MaterialStateProperty.all(Size(50, 50)),
                          fixedSize: MaterialStateProperty.all(Size(320, 50)),
                          side: MaterialStateProperty.all(
                              BorderSide(color: Colors.blueAccent)),
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
