import 'package:course_material_app/function/model/quizdatabase.dart';
import 'package:course_material_app/questions/Addquestion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_string/random_string.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final DatabaseService databaseService = DatabaseService(uid: '');
  final _formKey = GlobalKey<FormState>();

  // late String quizImgUrl,
  late String quizTitle;
  late String quizDesc;

  bool isLoading = false;
  late String quizId;

  ///function....
  createQuiz() {
    quizId = randomAlphaNumeric(16);
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      Map<String, String> quizData = {
        //  "quizImgUrl": quizImgUrl,
        "quizTitle": quizTitle,
        "quizDesc": quizDesc
      };

      // Future<void> addQuizDataAndUpdateState() async {
      //   try {
      //     await databaseService.addQuizData(() => null, quizData, quizId);
      //     setState(() {
      //       isLoading = false;
      //     });
      //     Navigator.pushReplacement(context,
      //         MaterialPageRoute(builder: (context) => AddQuestions(quizId)));
      //   } catch (e) {
      //     print('Error while adding quiz data: $e');
      //     setState(() {
      //       isLoading = false;
      //     });
      //   }
      // }

      databaseService.addQuizData(() => null, quizData, quizId).then((value) {
        setState(() {
          isLoading = false;
        });
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => AddQuestions(quizId)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Course Material App'),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: BackButton(
          color: Colors.black54,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              // TextFormField(
              //   validator: (val) =>
              //       val!.isEmpty ? "Enter Quiz Image Url" : null,
              //   decoration:
              //       InputDecoration(hintText: "Quiz Image Url (Optional)"),
              //   onChanged: (val) {
              //     quizImgUrl = val;
              //   },
              // ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                validator: (val) => val!.isEmpty ? "Enter Quiz Title" : null,
                decoration: InputDecoration(hintText: "Quiz Title"),
                onChanged: (val) {
                  quizTitle = val;
                },
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                validator: (val) =>
                    val!.isEmpty ? "Enter Quiz Description" : null,
                decoration: InputDecoration(hintText: "Quiz Description"),
                onChanged: (val) {
                  quizDesc = val;
                },
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  createQuiz();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    "Create Quiz",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
