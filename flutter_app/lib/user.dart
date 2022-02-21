
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_info/signup_page.dart';

import 'log_in_page.dart';

class Userpage extends StatefulWidget {

  @override
  _UserpageState createState() => _UserpageState();
}

class _UserpageState extends State<Userpage> {

  int m_type = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(5.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(80),),
                Text('사용자 선택', style: TextStyle(fontSize: 45)),

                Padding(padding: EdgeInsets.all(40),),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1), //테두리 두께
                    //color: Colors.white70,
                  ),
                  width: 260,
                  child: RaisedButton(
                    child: Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(4),),
                        SizedBox(
                          width: 80,
                          height: 90,
                          child: Image.asset("assets/manager.png"),
                        ),
                        Padding(padding: EdgeInsets.all(7),),
                        Text('입출고 담당', style: TextStyle(fontSize: 20),)
                      ],
                    ),
                    onPressed: () {
                      m_type=0;
                      print('타입 1 입출고 담당');

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Loginpage(m_type:0)),
                        //버튼이 눌리는 이벤트 발생 시, 다음 페이지에서 전달 받을 string 변수와 value('SecondRoute_Delivered')값을 직접 전달
                      );
                    },
                  ),
                ),

                Padding(padding: EdgeInsets.all(15),),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1), //테두리 두께
                    //color: Colors.white70,
                  ),
                  width: 260,
                  child: RaisedButton(
                    child: Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(4),),
                        SizedBox(
                          width: 90,
                          height: 90,
                          child: Image.asset("assets/work.png"),
                        ),
                        Padding(padding: EdgeInsets.all(7),),
                        Text('관리자', style: TextStyle(fontSize: 20),)
                      ],
                    ),
                    onPressed: () {
                      m_type=1;
                      print('타입 2 관리자');

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Loginpage(m_type:1)),
                        //버튼이 눌리는 이벤트 발생 시, 다음 페이지에서 전달 받을 string 변수와 value('SecondRoute_Delivered')값을 직접 전달
                      );
                    },
                  ),
                ),

                Padding(padding: EdgeInsets.all(15),),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1), //테두리 두께
                    //color: Colors.white70,
                  ),
                  width: 260,
                  height: 90,
                  //color: Colors.white,
                  child: RaisedButton(
                      child: Row(
                        children: [
                          Text('       처음 방문하신다면  ',
                            style: TextStyle(fontSize: 17),),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 16,
                          ),
                        ],
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Signup_Page()));
                      }
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}