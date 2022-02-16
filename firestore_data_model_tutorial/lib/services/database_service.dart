import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_data_model_tutorial/model/employee.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  addEmployee(Employee employeeData) async {
    await _db.collection("Employees").add(employeeData.toMap());
  }

    updateEmployee(Employee employeeData) async {
    await _db.collection("Employees").doc(employeeData.id).update(employeeData.toMap());
  }

  Future<void> deleteEmployee(String documentId) async {
    await _db.collection("Employees").doc(documentId).delete();

  }

  Future<List<Employee>> retrieveEmployees() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Employees").get();
    return snapshot.docs
        .map((docSnapshot) => Employee.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}
