import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_material_app/function/Navigation.dart';
import 'package:course_material_app/screen/LoginPage.dart';
import 'package:course_material_app/widgetn/category_detail_widget.dart';
import 'package:course_material_app/widgetn/category_header_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../data/categories.dart';
import '../data/user.dart';
import '../widgets/new_Questions/questionshnd.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: AdviserDrawer(
          user: widget.user,
        ),
        appBar: AppBar(
          // backgroundColor: Colors.transparent,
          elevation: 0,
          // title: Text('School Quiz'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: buildWelcome(username),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepOrange, Colors.purple],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(16),
          children: [
            SizedBox(height: 8),
            buildCategories(),
            SizedBox(height: 32),
            buildPopular(context),
          ],
        ),
      );

  Widget buildWelcome(String username) => StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('StudentDetails')
            .doc(widget.user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var data = snapshot.data!.data() as Map<String, dynamic>?;
          if (data == null) {
            return Center(
              child: Text('No data found'),
            );
          }

          String name = data['names'] as String; // Cast to String
          String imageURL = data['photo'] as String; // Cast to String

          return Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(imageURL),
                ),
                SizedBox(height: 20),
                Text(
                  'Hello, $name!'.toUpperCase(),
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          );
        },
      );
  void signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => LoginPage(
                  //user: widget.user,
                  )));
      // If the sign-out is successful, navigate the user to the login page or the home page.
      // Example: Navigator.pushReplacementNamed(context, '/login');
      // Use the appropriate route based on your app's navigation setup.
    } catch (e) {
      print('Error occurred while signing out: $e');
      // Handle any errors that occur during the sign-out process.
    }
  }
}

// Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     Text(
//       'Hello',
//       style: TextStyle(fontSize: 16, color: Colors.white),
//     ),
//     Text(
//       widget.user.email!,
//       // username,
//
//       style: TextStyle(
//         fontSize: 24,
//         fontWeight: FontWeight.bold,
//         color: Colors.white,
//       ),
//     )
//   ],
//);

Widget buildCategories() => Container(
      height: 300,
      child: GridView(
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: categories
            .map((category) => CategoryHeaderWidget(category: category))
            .toList(),
      ),
    );

Widget buildPopular(BuildContext context) => Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'HND Applicant',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 16),
        Container(
            height: 250,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryDetailWidget(
                  category: category,
                  onSelectedCategory: (category) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => myquestions(),
                      ),
                    );
                  },
                );
              },
            )

            //   Navigator.of(context).push(
            // MaterialPageRoute(
            //   builder: (context) => CategoryPage(category: category),
            // ),
            // ListView(
            //   physics: BouncingScrollPhysics(),
            //   scrollDirection: Axis.horizontal,
            //   children: categories
            //       .map((category) => CategoryDetailWidget(
            //             category: category,
            //             onSelectedCategory: (category) {
            //               Navigator.of(context).push(MaterialPageRoute(
            //                 builder: (context) =>
            //                     CategoryPage(category: category),
            //               ));
            //             },
            //           ))
            //       .toList(),
            // ),
            ),
        GestureDetector(
          onTap: () async {
            try {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
              // If the sign-out is successful, navigate the user to the login page or the home page.
              // Example: Navigator.pushReplacementNamed(context, '/login');
              // Use the appropriate route based on your app's navigation setup.
            } catch (e) {
              print('Error occurred while signing out: $e');
              // Handle any errors that occur during the sign-out process.
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(30)),
            child: Text(
              "Logout",
              style: TextStyle(color: Colors.white, fontSize: 19),
            ),
          ),
        ),
      ],
    );

// // import 'dart:js';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:course_material_app/function/model/Userdb.dart';
// import 'package:course_material_app/function/model/quizdatabase.dart';
// import 'package:course_material_app/screen/quiz_play.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class HomePage extends StatefulWidget {
//   // const HomePage({Key? key}) : super(key: key);
//   final User user;
//   const HomePage({required this.user});
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   // Stream quizStream;
//   final firestore = FirebaseFirestore.instance;
//
//   Future getQuized() async {
//     var firestor = FirebaseFirestore.instance;
//     QuerySnapshot qn = await firestor.collection("Quiz").get();
//     return qn.docs;
//   }
//
//   NavigateToDetail(DocumentSnapshot quizplay) {
//     //   User user;
//     Navigator.push(
//         context as BuildContext,
//         MaterialPageRoute(
//             builder: (context) => QuizPlay(
//                   quizId: '',
//                   quizPlay: quizplay,
//                 )));
//   }
//
//   Stream<dynamic>? quizStream;
//   DatabaseService databaseService = DatabaseService(uid: '');
//
//   Widget quizList() {
//     return Container(
//       child: Column(
//         children: [
//           FutureBuilder(
//             future: getQuized(),
//             // stream: getQuized,
//             builder: (BuildContext context, snapshot) {
//               return snapshot.data == null
//                   ? Container()
//                   : ListView.builder(
//                       shrinkWrap: true,
//                       // physics: ClampingScrollPhysics(),
//                       itemCount: snapshot.data.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           title: Text(snapshot.data[index].data()['quizTitle']),
//                           // title: snapshot.data[index].data()['quizTitle'],
//                           subtitle:
//                               Text(snapshot.data[index].data()["quizDesc"]),
//                           // leading: Image.network(
//                           //   'quizImgUrl',
//                           //   fit: BoxFit.cover,
//                           // ),
//                           onTap: () => NavigateToDetail(snapshot.data[index]),
//                           // onTap: ()=>Navigator.push(context,
//                           // MaterialPageRoute(builder: (context)=>
//                           //OptionTile())),
//                         );
//                       }
//                       //   return QuizTile(
//                       // noOfQuestions: snapshot.data.docs.length,
//                       //   // imageUrl: snapshot.data.docs[index]['quizImgUrl'],
//                       //   imageUrl:
//                       //   snapshot.data.docs[index].data()['quizImgUrl'],
//                       //   // title: snapshot.data.docs[index]['quizTitle'],
//                       //   title: snapshot.data.docs[index].data()['quizTitle'],
//                       //   // description: snapshot.data.docs[index]['quizDesc'],
//                       //   description:
//                       //   snapshot.data.docs[index].data()['quizDesc'],
//                       //   // id: snapshot.data.docs[index]["id"],
//                       //   id: snapshot.data.docs[index].data["id"],
//                       // );
//
//                       );
//             },
//           )
//         ],
//       ),
//     );
//   }
//
//   @override
//   void initState() {
//     databaseService.getQuizData().then((value) {
//       quizStream = value;
//       setState(() {});
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//         backgroundColor: Colors.white,
//         // appBar: AppBar(
//         //   title: Text('Course Materials App'),
//         //   elevation: 0.0,
//         //   backgroundColor: Colors.transparent,
//         //   systemOverlayStyle: SystemUiOverlayStyle.dark,
//         //   //brightness: Brightness.li,
//         // ),
//         body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//           stream: firestore
//               .collection('StudentDetails')
//               .doc(widget.user.uid)
//               .snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               return Center(
//                 child: Text(snapshot.error?.toString() ?? ''),
//               );
//             }
//             if (snapshot.hasData) {
//               final data = snapshot.data?.data();
//               if (data != null) {
//                 final student = UserReg.froJson(data);
//                 return Column(
//                   children: [
//                     Container(
//                       height: size.height * .3,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           alignment: Alignment.topCenter,
//                           image:
//                               AssetImage('assets/images/HeaderBackground.png'),
//                         ),
//                       ),
//                       child: Row(
//                         // crossAxisAlignment: CrossAxisAlignment.start,
//                         // mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(student.names)
//                           // Image.network(
//                           //   student.photo.toString(),
//                           //   width: 120,
//                           //   height: 30,
//                           //   fit: BoxFit.cover,
//                           //),
//                           // CircleAvatar(
//                           //   radius: 32,
//                           //   backgroundImage: AssetImage('assets/images/logo'
//                           //       '.jpg'),
//                           // ),
//                         ],
//                       ),
//                     ),
//                     // SizedBox(
//                     //   height: 20,
//                     // ),
//
//                     // quizList(),
//                     // floatingActionButton: FloatingActionButton(
//                     //   child: Icon(Icons.add),
//                     //   onPressed: () {
//                     //     Navigator.push(
//                     //         context, MaterialPageRoute(builder: (context) => CreateQuiz()));
//                     //   },
//                     // ),
//                   ],
//                 );
//               }
//             }
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           },
//         )
//
//         // return  quizList(),
//
//         );
//   }
// }
//
// class QuizTile extends StatelessWidget {
//   late final String imageUrl;
//   late final String title;
//   late final String id;
//   late final String description;
//   late final int noOfQuestions;
//
//   QuizTile(
//       {required this.title,
//       required this.imageUrl,
//       required this.description,
//       required this.id,
//       required this.noOfQuestions});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Navigator.push(
//         //     context, MaterialPageRoute(builder: (context) => QuizPlay(quizId:)));
//       },
//       child: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 24),
//           height: 150,
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: Stack(
//               children: [
//                 // Image.network(
//                 //   imageUrl,
//                 //   fit: BoxFit.cover,
//                 //   width: MediaQuery.of(context).size.width,
//                 // ),
//                 Container(
//                   color: Colors.black26,
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           title,
//                           style: TextStyle(
//                               fontSize: 18,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         SizedBox(
//                           height: 4,
//                         ),
//                         Text(
//                           description,
//                           style: TextStyle(
//                               fontSize: 13,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w500),
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
