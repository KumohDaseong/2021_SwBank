import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_info/shoot.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UDIBacode',
      home: Scaffold(
        //회원가입 페이지
        body: Loginpage(),
      ),
    );
  }
}

class Loginpage extends StatefulWidget {

  @override
  _LoginpageState createState() => _LoginpageState();

  int m_type;  //FirstRoute에서 전달 받은 변수를 사용하기 위해 변수 선언

  Loginpage({Key key, @required this.m_type}) : super(key: key);//변수 선언 후 초기화 및 입력
}


class _LoginpageState extends State<Loginpage> {

  final formKey = GlobalKey<FormState>();
  String base = 'http://ec2-3-35-137-113.ap-northeast-2.compute.amazonaws.com:3000';

  String id = '';
  String pwd = '';
  var datauser;

  Future<List> _login() async {

    var body = json.encode({
      "id" : id,
      "pwd" : pwd,
      "m_type" : widget.m_type,
    });

    final response = await http.post(Uri.parse("$base/login"),headers: {

      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    },body : body);


    datauser = json.decode(response.body);
    print(datauser);

    print(widget.m_type);
    if(datauser["msg"] == "success"){

      //---------전역으로 데이터 보내기
      final prefs = await SharedPreferences.getInstance();

      prefs.setString('id', id);
      prefs.setString('name', datauser["name"]);
      prefs.setString('pwd', pwd);
      prefs.setInt('m_type', widget.m_type);

      //---------전역으로 데이터 보내기


      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('로그인 성공'),
            );
          }
      );
      Timer(Duration(seconds: 1), () {
        print("Yeah, this line is printed after 3 seconds");
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => shootPage()));
      });

    }
    else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('로그인 실패'),
            );
          }
      );
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(80),),

            Text('로그인',style: TextStyle(fontSize: 50),),

            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Form(
                  key: this.formKey,
                  child: Column(
                    children: [
                      renderTextFormField1(
                        label:  '아이디',
                        onSaved: (val){
                          setState(() {
                            this.id = val;
                          });
                        },
                        validator: (val){

                          if(val.length <1 ){
                            return '필수 입력란 입니다';
                          }

                          return null;
                        },
                        obscureText: false,
                      ),


                      renderTextFormField2(
                        label:  '비밀번호',

                        onSaved: (val){
                          setState(() {
                            this.pwd = val;
                          });
                        },
                        validator: (val){

                          if(val.length <1 ){
                            return '필수 입력란 입니다';
                          }

                          return null;
                        },
                        obscureText: true,
                      ),

                      Padding(padding: EdgeInsets.all(15),),

                      renderSubmitButton(),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }


  renderSubmitButton(){
    return Container(
      width: 280,
      height: 50,
      child: RaisedButton(
        onPressed: (){
          //만일 validata가 통과하면 true 리턴
          if(this.formKey.currentState.validate()){
            this.formKey.currentState.save();//이게 불리// 면 모든 함수부름
            _login();
          }
        },
        color: Colors.indigoAccent,
        child: Text(
          '로그인',
          style: TextStyle(
              color: Colors.white, fontSize: 20
          ),
        ),
      ),
    );
  }

  renderTextFormField1({
    @required String label,
    @required FormFieldSetter onSaved,
    @required FormFieldValidator validator,
    @required bool obscureText,
  }) {
    assert(onSaved != null);
    assert(validator != null);
    assert(label != null);
    //assert(obscureText != null);


    return Column(
        children: [
          Row(
            children: [
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          TextFormField(
            onSaved: onSaved,
            validator: validator,
            autovalidateMode: AutovalidateMode.always,
            obscureText: false,
          ),
          Container(height: 16.0),
        ]
    );
  }
}


renderTextFormField2({
  @required String label,
  @required FormFieldSetter onSaved,
  @required FormFieldValidator validator,
  @required bool obscureText,
}) {
  assert(onSaved != null);
  assert(validator != null);
  assert(label != null);
  assert(obscureText != null);


  return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        TextFormField(
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: AutovalidateMode.always,
          obscureText: true,
        ),
        Container(height: 16.0),
      ]
  );
}
