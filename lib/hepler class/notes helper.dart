import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreHelper {
  CloudFirestoreHelper._();

  static final CloudFirestoreHelper cloudFirestoreHelper =
      CloudFirestoreHelper._();

  //static final
  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference notesRef;
  late CollectionReference countersRef;

  //todo: connectWithStudentsCollection

  void connectWithNotessCollection() {
    notesRef = firebaseFirestore.collection("notes");
  }

  void connectWithCountersCollection() {
    countersRef = firebaseFirestore.collection("counters");
  }

//todo:insertRecord
  Future<void> insertRecord({required Map<String, dynamic> data}) async {
    connectWithNotessCollection();
    connectWithCountersCollection();
    DocumentSnapshot documentSnapshot =
        await countersRef.doc('notes-counter').get();
    Map<String, dynamic> counterData =
        documentSnapshot.data() as Map<String, dynamic>;
    int counter = counterData['counter']; //0
    await notesRef.doc('${++counter}').set(data);
    await countersRef.doc('notes-counter').update({'counter': counter});
  }

  Stream<QuerySnapshot<Object?>> selectRecord() {
    connectWithNotessCollection();

    return notesRef.snapshots();
  }
//todo: updateRecord

  Future<void> updateRecord(
      {required String id, required Map<String, dynamic> updateData}) async {
    connectWithNotessCollection();

    await notesRef.doc(id).update(updateData);
  }

//todo: deleteRecord
  Future<void> deleteRecord({required String id}) async {
    connectWithNotessCollection();

    await notesRef.doc(id).delete();
  }
}
