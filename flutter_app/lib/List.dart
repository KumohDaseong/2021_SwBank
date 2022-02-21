import 'package:flutter/material.dart';
import 'package:flutter_info/Setting.dart';
import 'package:flutter_info/shoot.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Listpage extends StatefulWidget {
  @override
  _ListpageState createState() => _ListpageState();
}

class task{
  String date;
  String itemName;
  String method;

  task({
    this.date,
    this.itemName,
    this.method,
  });

  factory task.fromJson(Map<String, dynamic> taskJson){
    return task(
        date: taskJson["date"],
        itemName: taskJson["itemName"],
        method: taskJson["method"]
    );
  }
}



class _ListpageState extends State<Listpage> {
  String base = 'http://ec2-3-35-137-113.ap-northeast-2.compute.amazonaws.com:3000';
  String id = "";
  var datauser;

  List<task> listOfColumns = [
  ];

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      id = (prefs.getString('id'));
    });
  }


  void _login() async {

    _loadCounter();

    final response = await http.get(Uri.parse("$base/record/$id"),headers: {

      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    });
    datauser = json.decode(response.body);

    print(datauser["result"]);

    listOfColumns = (datauser['result'] as List)
        .map((itemWord) => task.fromJson(itemWord))
        .toList();
  }


  @override
  Widget build(BuildContext context) {
    if (listOfColumns.length == 0){
      _login();
    }
    return Scaffold(

      body:Padding(

        padding: EdgeInsets.all(0.0),
        child: Container(
          child: Column(
            children: <Widget>[

              SizedBox(height: 70),

              Padding(padding: EdgeInsets.all(0),),

              Text('이전 바코드 스캔 기록', style: TextStyle(fontSize: 25)),

              Padding(padding: EdgeInsets.all(10),),

              Container(
                height: 643,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('일시')),
                        DataColumn(label: Text('제품명')),
                        DataColumn(label: Text('입출고')),
                      ],
                      rows://dataColumnText를 반복하며 각 반복은 요소에 값을 할당합니다.
                      listOfColumns
                          .map(((element) => DataRow(
                        cells: <DataCell>[
                          DataCell(Text(element.date)), //Map 요소에서 값 추출
                          DataCell(Text(element.itemName)),
                          DataCell(Text(element.method)),
                        ],
                      )),
                      ).toList(),
                    ),
                  ),
                ),
              ),



              //SizedBox(height: 454),

              Column(
                children: [
                  Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.33,
                          child: RaisedButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => shootPage()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Text(
                                '바코드',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          )
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.34,
                          child: ElevatedButton(
                            style: ButtonStyle( backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent), ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => Listpage()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Text(
                                '기록',
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                          )
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.33,
                          child: RaisedButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => Setpage()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Text(
                                '설정',
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );

  }

}