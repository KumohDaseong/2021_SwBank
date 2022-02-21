import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_info/Frame.dart';
import 'package:flutter_info/in_out.dart';
import 'package:flutter_info/special_note.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class basicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UDIBacode',
      home: Scaffold(
        body: Basic_Page(),
      ),
    );
  }
}

class Basic_Page extends StatefulWidget {
  String url;
  Basic_Page({Key key, @required this.url}) : super(key: key);//변수 선언 후 초기화 및 입력

  @override
  _Basic_PageState createState() => _Basic_PageState();
}

class _Basic_PageState extends State<Basic_Page> {

  final formKey = GlobalKey<FormState>();
  String base = 'http://ec2-3-35-137-113.ap-northeast-2.compute.amazonaws.com:3000';


  String msg1, msg2;
  String id;
  String url3;
  String company;
  String date_manufacture;
  String itemName;
  String di;
  var datauser;

  @override
  Widget build(BuildContext context)
  {
    void _loadCounter() async {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        id = (prefs.getString('id'));
        di = (prefs.getString('di'));
        url3 = (prefs.getString('url2'));
        company = (prefs.getString('company'));
        date_manufacture = (prefs.getString('date_manufacture'));
        itemName = (prefs.getString('itemName'));
      });
    }

    _loadCounter();


    Future<List> _login() async {
      var body = json.encode({
        "userId": id,
      });

      final response = await http.post(Uri.parse("$base/income/$di"), headers: {
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      }, body: body);

      datauser = json.decode(response.body);
      print(datauser["msg"]);

      msg1 = datauser["msg"];

      if(datauser["msg"] == "success"){
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('입고 성공'),
              );
            }
        );
      }
      else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('입고 실패'),
              );
            }
        );
      }
    }


    Future<List> _login2() async {

      final response = await http.get(Uri.parse("$base/outcome/$di"), headers: {
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      });


      datauser = json.decode(response.body);
      print(datauser["msg"]);

      msg2 = datauser["msg"];

      if(datauser["msg"] == "success"){
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('출고 성공'),
              );
            }
        );
      }
      else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('출고 실패'),
              );
            }
        );
      }

    }




    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: ElevatedButton(
                      style: ButtonStyle( backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent), ),
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
                    child: RaisedButton(
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
                      width: 110,
                      height: 110,
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

                  SizedBox(width: 10, height: 30,),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    width: 220,
                    height: 120,

                    padding: const EdgeInsets.all(10.0),

                    child: Center(
                      child: Text(
                        '제조사 : $company\n제조일자 : $date_manufacture',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 10, height: 30,),

                  //입고버튼, 출고버튼 2개 만들기
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    width: 220,
                    height: 50,

                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 110,
                          height: 50,

                          child: RaisedButton(
                            elevation: 0.0,
                            splashColor: Colors.orange,
                            color: Colors.white,

                            child: Text(
                              "입고",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            onPressed: () {
                              _login();
                            },
                          ),
                        ),

                        Container(
                          width: 108,
                          height: 50,

                          child: RaisedButton(
                            elevation: 0.0,
                            splashColor: Colors.orange,
                            color: Colors.white,

                            child: Text(
                              "출고",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),

                            onPressed: () {
                              _login2();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

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
                      child: Icon(Icons.arrow_back_ios,size: 20),
                    ),
                    Text('돌아가기', style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}