import 'package:flutter/material.dart';
import 'package:flutter_info/Frame.dart';
import 'package:flutter/services.dart';
import 'package:flutter_info/special_note.dart';
import 'Basic_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class task{
  String id;
  String income;
  String outcome;

  task({
    this.id,
    this.income,
    this.outcome,
  });

  factory task.fromJson(Map<String, dynamic> taskJson){
    return task(
        id: taskJson["user"],
        income: taskJson["income"],
        outcome: taskJson["outcome"]
    );
  }
}

class InOutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UDIBacode',
      home: Scaffold(
        body: InOut_Page(),
      ),
    );
  }
}

class InOut_Page extends StatefulWidget {
  @override
  _InOut_PageState createState() => _InOut_PageState();
}

class _InOut_PageState extends State<InOut_Page> {

  String base = 'http://ec2-3-35-137-113.ap-northeast-2.compute.amazonaws.com:3000';

  String url3;
  String itemName;
  String di;
  String id;
  var datauser;

  List<task> listOfColumns = [
  ];

  @override
  Widget build(BuildContext context) {

    void _loadCounter() async {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        di = (prefs.getString('di'));
        url3 = (prefs.getString('url2'));
        itemName = (prefs.getString('itemName'));
        id = (prefs.getString('id'));
      });
    }

    void _login() async {

      final response = await http.get(Uri.parse("$base/incomes/$di"), headers: {

        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      });


      datauser = json.decode(response.body);
      print(datauser);
      listOfColumns = (datauser['result'] as List)
          .map((itemWord) => task.fromJson(itemWord))
          .toList();
    }


    if (listOfColumns.length == 0){
      _loadCounter();
      _login();
    }


    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return SafeArea(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width * 0.33,
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => basicPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        '기본 정보',
                        style: TextStyle(fontSize: 18),
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
                          builder: (context) => InOutPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        '입출고 정보',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.33,
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => special_Note()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        '특이 사항',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
              ),
            ],
          ),

          SizedBox(width: 50, height: 40,),

          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            width: 330,
            height: 550,

            child: Column(
              children: <Widget>[
                SizedBox(width: 50, height: 50,),

                Center(
                  child: Image.network(url3,
                    fit: BoxFit.fill,
                    width: 90,
                    height: 90,
                  ),
                ),

                SizedBox(width: 10, height: 10,),

                Container(
                  child: Text(
                    '$itemName',
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                SizedBox(width: 10, height: 20,),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  width: 220,
                  height: 40,

                  padding: const EdgeInsets.all(5.0),

                  child: Center(
                    child: Text(
                      '$di',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 10, height: 20,),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  width: 330,
                  height: 1,

                  child: Center(
                    child: Text(
                      ' ',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),

                Container(
                  height: 270,
                  width: 324,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      child: DataTable(
                          horizontalMargin: 10.0,
                        columnSpacing: 8.0,
                        columns:
                        [
                          DataColumn(
                              label:
                              Container(child: Text('담당자',softWrap: true, style: TextStyle(fontSize: 12)), width: 50,)),
                          DataColumn(
                              label: Container(child: Text('입고',softWrap: true, style: TextStyle(fontSize: 12)), width: 120,)),
                          DataColumn(
                              label: Container(child: Text('출고',softWrap: true, style: TextStyle(fontSize: 12)), width: 120,)),
                        ],
                        rows: listOfColumns
                            .map(((element) => DataRow(
                          cells: <DataCell>[
                            DataCell(
                                Container(
                                  width: 50,
                                  child: Text(
                              element.id, style: TextStyle(fontSize: 12),softWrap: true,),
                                )), //Map 요소에서 값 추출
                            DataCell(Container(
                              width: 120,
                                child: Text(element.income, style: TextStyle(fontSize: 12),softWrap: true,))),
                            DataCell(Container(
                              width: 120,
                                child: Text(element.outcome, style: TextStyle(fontSize: 12),softWrap: true,))),
                          ],
                        )),
                        ).toList(), ),
                    ),
                  ),
                ),

                //위치 , 입고 , 출고 출력
              ],
            ),
          ),

          Padding(padding: EdgeInsets.all(15),),

          Container(
            width: 330,
            margin: EdgeInsets.fromLTRB(25,0,25,0),
            child: RaisedButton(
              //그림자 제거
              elevation: 0,
              hoverElevation: 0,
              focusElevation: 0,
              highlightElevation: 0,
              color: Colors.black.withOpacity(0.07),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => defaultPage()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 40,
                    height: 60,
                    child: Icon(Icons.arrow_back_ios,size: 25),
                  ),
                  Text('돌아가기', style: TextStyle(fontSize: 15),),
                ],
              ),
            ),
          )
        ],

      ),
    );
  }
}
