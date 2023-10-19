import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> addData(userData) async {
    firestore.collection("users").add(userData).catchError((e) {
      print(e);
    });
  }

  getData() async {
    return await firestore.collection("users").snapshots();
  }

  Future<void> addQuizData(Map(), quizData, String quizId) async {
    await firestore
        .collection("Quiz")
        .doc(quizId)
        .set(quizData)
        .catchError((e) {
      print(e);
    });
  }

  Future<void> addQuestionData(quizData, String quizId) async {
    await firestore
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .add(quizData)
        .catchError((e) {
      print(e);
    });
  }

  getQuizData() async {
    return await firestore.collection("Quiz").snapshots();
  }

  getQuestionData(String quizId) async {
    return await firestore
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .get();
  }
}
