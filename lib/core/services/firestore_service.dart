
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? docID}) async {
    if (docID != null) {
      firestore.collection(path).doc(docID).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

//fetch user data
  @override
  Future<Map<String, dynamic>> fetchData(
      {required String path, required String docID}) async {
    var data = await firestore.collection(path).doc(docID).get();
    return data.data() as Map<String, dynamic>;
  }

  //check if data exists
  @override
  Future<bool> checkIfDataExists(
      {required String path, required String docID}) async {
    var data = await firestore.collection(path).doc(docID).get();
    return data.exists;
  }
}
