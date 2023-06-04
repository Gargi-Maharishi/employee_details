import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';
import 'package:flutter/services.dart';
import 'package:project/view/detail_page.dart';
import 'package:project/view/model.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<EmployeeModel> _items  = [];

  ///fetch data from json file
 Future<void> readJson() async{
  String data = await DefaultAssetBundle.of(context).loadString("assets/sample.json");
 final jsonResult = jsonDecode(data); //latest Dart
  setState(() {
    _items = jsonResult.map<EmployeeModel>((json) => EmployeeModel.fromJson(json))
              .toList();
     print("...number of items ${_items.length}");
  });
 }

 @override
 void initState() {
    // TODO: implement initState
     readJson();
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text("Employee List"),
      ),
      body:Column(
        children: [
          Expanded(
            child: AlphabetScrollView(
              list: _items.map((e) => AlphaModel(e.firstName + " " + e.lastName)).toList(),
              // isAlphabetsFiltered: false,
              alignment: LetterAlignment.right,
              itemExtent: 50,
              unselectedTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.black
              ),
              selectedTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
              ),
              overlayWidget: (value) => Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.star,
                    size: 50,
                    color: Colors.red,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Theme.of(context).primaryColor,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '$value'.toUpperCase(),
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
              itemBuilder: (_, k, id) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ListTile(
                    title: Text('$id'),
                    //  subtitle: Text(_items[k]["lastName"]),
                    leading: CircleAvatar(child: Image.network(_items[k].imageUrl)),
                    onTap: ()  {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeDetailPage(employee: _items[k],)));
                      }
                  ),
                );
              },
            ),
          )
        ],),
          );
      
      
      
      
      
      
      
      
      
    
      
      // Column(
      //   children: [
      //     Expanded(
      //       child: AlphabetScrollView(
      //         list: _items.map((e) => AlphaModel(e)).toList(),
      //         // isAlphabetsFiltered: false,
      //         alignment: LetterAlignment.right,
      //         itemExtent: 50,
      //         unselectedTextStyle: TextStyle(
      //           fontSize: 18,
      //           fontWeight: FontWeight.normal,
      //           color: Colors.black
      //         ),
      //         selectedTextStyle: TextStyle(
      //             fontSize: 20,
      //             fontWeight: FontWeight.bold,
      //             color: Colors.blue.shade400
      //         ),
      //         overlayWidget: (value) => Stack(
      //           alignment: Alignment.center,
      //           children: [
      //             Icon(
      //               Icons.star,
      //               size: 50,
      //               color: Colors.red,
      //             ),
      //             Container(
      //               height: 50,
      //               width: 50,
      //               decoration: BoxDecoration(
      //                 shape: BoxShape.circle,
      //                 // color: Theme.of(context).primaryColor,
      //               ),
      //               alignment: Alignment.center,
      //               child: Text(
      //                 '$value'.toUpperCase(),
      //                 style: TextStyle(fontSize: 18, color: Colors.white),
      //               ),
      //             ),
      //           ],
      //         ),
      //         itemBuilder: (_, k, id) {
      //           return Padding(
      //             padding: const EdgeInsets.only(right: 20),
      //             child: ListTile(
      //               title: Text('$id'),
      //               subtitle: Text("sbchs"),
      //                leading: Text("cnjx"),
      //               onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeDetailPage()),
      //               // trailing: Radio<bool>(
      //               //   value: false,
      //               //   groupValue: selectedIndex != k,
      //               //   onChanged: (value) {
      //               //     setState(() {
      //               //       selectedIndex = k;
      //               //     });
      //               //   },
      //               // ),
      //             ),
      //           ));
      //         },
      //       ),
      //     )
      //   ],
      // ),
      
    
  }
}