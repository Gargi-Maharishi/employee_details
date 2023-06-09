// To parse this JSON data, do
//
//     final employeeModel = employeeModelFromJson(jsonString);

import 'dart:convert';

EmployeeModel employeeModelFromJson(String str) => EmployeeModel.fromJson(json.decode(str));

String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());

class EmployeeModel {
    int id;
    String imageUrl;
    String firstName;
    String lastName;
    String email;
    String contactNumber;
    int age;
    String dob;
    int salary;
    String address;

    EmployeeModel({
        required this.id,
        required this.imageUrl,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.contactNumber,
        required this.age,
        required this.dob,
        required this.salary,
        required this.address,
    });

    factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json["id"],
        imageUrl: json["imageUrl"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        contactNumber: json["contactNumber"],
        age: json["age"],
        dob: json["dob"],
        salary: json["salary"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "imageUrl": imageUrl,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "contactNumber": contactNumber,
        "age": age,
        "dob": dob,
        "salary": salary,
        "address": address,
    };
}
