import 'package:flutter/material.dart';
import 'package:flutter_info/Frame.dart';
import 'package:flutter_info/Basic_Page.dart';
import 'package:flutter_info/in_out.dart';
import 'package:shared_preferences/shared_preferences.dart';

class specialNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UDIBacode',
      home: Scaffold(
        body: special_Note(),
      ),
    );
  }
}

class special_Note extends StatefulWidget {
  @override
  _special_NoteState createState() => _special_NoteState();
}

class _special_NoteState extends State<special_Note> {

  String url3;
  String itemName;
  String di;
  @override
  Widget build(BuildContext context) {
    void _loadCounter() async {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        di = (prefs.getString('di'));
        url3 = (prefs.getString('url2'));
        itemName = (prefs.getString('itemName'));
      });
    }

    _loadCounter();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: RaisedButton(
                      onPressed: () {
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
                      onPressed: () {
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
                    child:ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),),
                      onPressed: () {
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
                        color: Colors.black,
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
                          color: Colors.black,
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
                    height: 190,

                    child: Container(

                      child: Column(
                        children: [
                          Text(
                            '특이사항',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),

                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            width: 220,
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

                          Text(
                            '...',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
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
                      child: Icon(Icons.arrow_back_ios,size: 25),
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