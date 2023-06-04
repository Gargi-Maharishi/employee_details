import 'package:flutter/material.dart';
import 'package:project/view/model.dart';

class EmployeeDetailPage extends StatefulWidget {
final EmployeeModel employee;

   EmployeeDetailPage({super.key, required this.employee });

  @override
  State<EmployeeDetailPage> createState() => _EmployeeDetailPageState();
}

class _EmployeeDetailPageState extends State<EmployeeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        title:  Text("Employee Details",
        ),
        ),
        body:  Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height*0.25,
            width: MediaQuery.of(context).size.width*0.98,
            decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(10)
            ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      CircleAvatar(
                        radius: 51,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: 52,
                          foregroundImage: NetworkImage(widget.employee.imageUrl),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                          children: [
                              Text(widget.employee.firstName),
                              SizedBox(width: 10),
                              Text(widget.employee.lastName),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Number:"),
                              Text(widget.employee.contactNumber.toString()),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Email:"),
                              Text(widget.employee.email),
                            ],
                          ),
                          Row(
                    children: [
                      Text("DOB:"),
                      Text(widget.employee.dob),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Address:"),
                      Text(widget.employee.address),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Salary:"),
                      Text(widget.employee.salary.toString()),
                    ],
                  ),
                        ],
                      ),
                    ],
                  ),
              ]),
          ),
          ),
        ),
    );
  }
}