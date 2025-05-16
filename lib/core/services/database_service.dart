abstract class DatabaseService {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? docID});
  //this method is used to fetch data from the database
   Future<dynamic> fetchData({
    required String path,
    String? docID,
    Map<String, dynamic>? query,
  });

    Stream<dynamic> fetchStreamData({
    required String path,
    
    Map<String, dynamic>? query,
  });

   Future<void> updateData(
      {required String path,
      required Map<String, dynamic> data,
      String? docID});

  Future<bool> checkIfDataExists({
    required String path,
    required String docID,
  });
}
