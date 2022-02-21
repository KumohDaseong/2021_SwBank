import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_info/log_in_page.dart';

//기본 틀 설정
class Signup_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp
      (
      debugShowCheckedModeBanner: false,
      title: 'UDIBacode',
      home: Scaffold
        (
        //회원가입 페이지 불러오기
        body: Signup(),
      ),
    );
  }
}

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  //폼 키 사용해서 폼 구분
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //텍스트컨트롤러 달아줘서 값 가져오기
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phonenumController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  String base = 'http://ec2-3-35-137-113.ap-northeast-2.compute.amazonaws.com:3000';

  int m_type = 10;//사용자 or 관리자
  String name = '';//이름
  String p_number = '';//전화번호
  String id = '';//아이디
  String pwd = '';//비밀번호
  var datauser;//

  final formKey = GlobalKey<FormState>();

  Future<List> _singup() async {

    //암호기를 거친 텍스트 정보를 넘겨주자
    var body = json.encode({
      "id" : id,
      "pwd" : pwd,
      "name" : name,
      "p_number" : p_number,
      "m_type" : m_type
    });

    //해당 uri에 post로
    final response = await http.post(Uri.parse("$base/signup"),headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    },body : body);

    //해독기를 거친 텍스트 정보를 가져온다.
    datauser = json.decode(response.body);
    print(datauser);

    if(datauser["msg"] == "회원가입 성공")
    {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => Login()));
      _showDialog_Success();
    }

    else
      _showDialog_Fail();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(45.0,15, 45.0, 20),

            //키보드 올라왔을 때 대비
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(30),),

                  Text('회원가입',style: TextStyle(fontSize: 40),),

                  Padding(padding: EdgeInsets.all(15),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 70,
                        height: 100,
                        child: RaisedButton(
                          child: Image.asset("assets/manager.png",
                          ),
                          color: Color.fromRGBO(250, 250, 250, 0),
                          elevation: 0.0,
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            m_type = 0;
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(23.0)),

                      Container(
                        width: 70,
                        height: 100,
                        child: RaisedButton(
                          child: Image.asset("assets/work.png"),
                          color: Color.fromRGBO(250, 250, 250, 0),
                          elevation: 0.0,
                          splashColor: Colors.blueGrey,
                          onPressed: () {
                            m_type = 1;
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),

                  //이름 넣는 텍스트 필드
                  TextFormField(
                    autofocus: true,
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: '이름',
                      //border: borderMaker(Colors.green),
                      icon: Icon(Icons.account_box_rounded),
                    ),

                    onSaved: (val)
                    {
                      setState(()
                      {
                        name = val;
                      });
                    },

                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return '내용을 입력해주세요';
                      }

                      if(value.length >= 8) {
                        return '6자 이상로 구성해주세요';
                      }
                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),

                  TextFormField(

                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter(RegExp('[0-9]')),
                      LengthLimitingTextInputFormatter(11)
                    ],

                    controller: _phonenumController,
                    decoration: InputDecoration(
                      labelText: '전화번호',
                      //border: borderMaker(Colors.green),
                      icon: Icon(Icons.add_call),
                      hintText: '-없이 전화번호 입력',
                    ),

                    onSaved: (val){
                      setState(() {
                        p_number = val;
                      });
                    },

                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return '내용을 입력해주세요';
                      }

                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),

                  TextFormField(
                    controller: _idController,
                    decoration: InputDecoration(
                      labelText: '아이디',
                      //border: borderMaker(Colors.green),
                      icon: Icon(Icons.account_circle),
                      //hintText: '아이디',
                    ),

                    onSaved: (val){
                      setState(() {
                        id = val;
                      });
                    },

                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return '내용을 입력해주세요';
                      }
                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.all(12.0)),

                  TextFormField(
                    controller: _pwController,
                    decoration: InputDecoration(
                      labelText: '비밀번호',
                      //border: borderMaker(Colors.blue),
                      icon: Icon(Icons.vpn_key),
                      //hintText: '비밀번호',
                    ),

                    onSaved: (val){
                      setState(() {
                        pwd = val;
                      });
                    },

                    obscureText: true,

                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return '내용을 입력해주세요';
                      }
                      return null;
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),

                    //다 작성시 누르는 버튼
                    child: Container(
                      width: 250,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate())
                          {
                            this.name = _nameController.text;
                            this.p_number = _phonenumController.text;
                            this.id = _idController.text;
                            this.pwd =_pwController.text;

                            _singup();
                          }
                          print(_nameController.text);
                          print(_phonenumController.text);
                          print(_idController.text);
                          print(_pwController.text);
                          print(p_number);
                        },
                        child: Text('제출',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //알림창 구현
  void _showDialog_Success() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pop(context);
        });
        // return object of type Dialog
        return AlertDialog(
          title: new Text("알 림"),
          content: new Text("회원가입을 성공했습니다!"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("닫기"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialog_Fail() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pop(context);
        });
        // return object of type Dialog
        return AlertDialog(
          title: new Text("알 림"),
          content: new Text("(회원가입 실패)중복된 아이디가 존재합니다!"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("닫기"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}