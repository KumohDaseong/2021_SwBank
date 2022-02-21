import 'package:flutter/material.dart';
import 'package:flutter_info/List.dart';
import 'package:flutter_info/shoot.dart';
import 'package:flutter_info/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setpage extends StatefulWidget {

  @override
  _SetpageState createState() => _SetpageState();
}

class _SetpageState extends State<Setpage> {
  String name;
  String id;
  String pwd;
  int m_type;
  String type;

  @override

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = (prefs.getString('name'));
      id = (prefs.getString('id'));
      pwd = (prefs.getString('pwd'));
      m_type = (prefs.getInt('m_type'));

      if(m_type ==0){
        type = "입출고 담장자";
      }
      else{
        type ="관리자";
      }
    });
  }


  Widget build(BuildContext context) {
    _loadCounter();
    return Scaffold(

      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(110),),

            Text('설정', style: TextStyle(fontSize: 40)),

            Padding(padding: EdgeInsets.all(30),),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), //둥글게
                border: Border.all(color: Colors.black, width: 1), //테두리 두께
                //color: Colors.white70,
              ),
              width: 300,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(10),),
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: Icon(Icons.account_circle,size: 80),
                    ),
                    Text('$name', style: TextStyle(fontSize: 25),),
                    Text('$type', style: TextStyle(fontSize: 15),),
                    Text('아이디 : $id', style: TextStyle(fontSize: 15),),

                    Padding(padding: EdgeInsets.all(15),),
                  ],
                ),
              ),
            ),

            Padding(padding: EdgeInsets.all(20),),

            SizedBox(
              width: 230,
              height: 50,
              child: RaisedButton(
                  color: Colors.blueAccent,
                  child: Text('로그아웃',style: TextStyle(color: Colors.white,fontSize: 20),),
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Userpage()));
                  }
              ),
            ),

            Padding(padding: EdgeInsets.all(69),),

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
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        )
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.34,
                        child: RaisedButton(
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
                        child: ElevatedButton(
    style: ButtonStyle( backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent), ),
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

    );
  }
}


