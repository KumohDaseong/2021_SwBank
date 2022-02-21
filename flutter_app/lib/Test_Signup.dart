import 'package:flutter/material.dart';

class LoginSixPage extends StatelessWidget {
  static final String path = "lib/src/pages/login/login6.dart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 100.0),
            Stack(
              children: <Widget>[
                Positioned(
                  left: 20.0,
                  top: 15.0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    width: 70.0,
                    height: 20.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Text(
                    "Sign Up",
                    style:
                    TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),

            SizedBox(height: 30,),

            Center(
              child: Container(
                width:350,
                height:60,

                child: Row(
                  children: <Widget>[
                    Container(
                      width: 170,
                      height: 80,

                      child: RaisedButton(
                        child: Text(
                          '입출고 담당',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),
                        ),
                        color: Colors.amber,

                        elevation: 0.0,
                        splashColor: Colors.grey,
                        onPressed: () {
                          //
                        },
                      ),
                    ),

                    Container(
                      width: 5,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                    ),

                    Container(
                      width: 170,
                      height: 80,

                      child: RaisedButton(
                        child: Text(
                          '관리자 담당',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),
                        ),
                        color: Colors.amber,

                        elevation: 0.0,
                        splashColor: Colors.grey,
                        onPressed: () {
                          //
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Center(
              child: Container(
                width: 400,
                height: 300,

                child: Column(
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "성명", hasFloatingPlaceholder: true),
                      ),
                    ),

                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "전화번호", hasFloatingPlaceholder: true),
                      ),
                    ),

                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: "아이디", hasFloatingPlaceholder: true),
                      ),
                    ),

                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 8.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "비밀번호", hasFloatingPlaceholder: true),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(right: 16.0),
              alignment: Alignment.centerRight,
            ),

            const SizedBox(height: 80.0),
            Align(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                padding: const EdgeInsets.fromLTRB(40.0, 16.0, 30.0, 16.0),
                color: Colors.indigoAccent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0))),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Sign Up".toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    const SizedBox(width: 50.0),
                    Icon(
                      Icons.arrow_forward,
                      size: 18.0,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}