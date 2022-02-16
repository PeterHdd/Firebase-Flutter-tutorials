// ignore_for_file: prefer_null_aware_operators

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_data_model_tutorial/model/address.dart';

class Employee {
  final String? id;
  final String name;
  final int age;
  final int salary;
  final Address address;
  final List<String>? employeeTraits;
  Employee(
      {this.id,
      required this.name,
      required this.age,
      required this.salary,
      required this.address,
      this.employeeTraits});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'salary': salary,
      'address': address.toMap(),
      'employeeTraits': employeeTraits
    };
  }

  Employee.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        name = doc.data()!["name"],
        age = doc.data()!["age"],
        salary = doc.data()!["salary"],
        address = Address.fromMap(doc.data()!["address"]),
        employeeTraits = doc.data()?["employeeTraits"] == null
            ? null
            : doc.data()?["employeeTraits"].cast<String>();
}
