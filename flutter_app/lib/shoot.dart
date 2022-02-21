import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_info/List.dart';
import 'package:flutter_info/Setting.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Basic_Page.dart';

class shootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UDIBacode',
      home: Scaffold(
        body: shoot_Page(),
      ),
    );
  }
}

class shoot_Page extends StatefulWidget
{


  @override
  _shoot_PageState createState() => _shoot_PageState();
}

class _shoot_PageState extends State<shoot_Page>
{

  String base = "http://ec2-3-35-137-113.ap-northeast-2.compute.amazonaws.com:3000";

  File _image; //이미지 파일
  final picker = ImagePicker();
  String url2;

  @override
  Widget build(BuildContext context) {
    //이미지 파일을 받아온다

    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children:
            [
              SizedBox(height: 120,),

              Icon(
                  Icons.camera,
                size: 90,
              ),

              SizedBox(height: 40,),
              
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(10)
                ),
                width: 280,
                height: 330,

                child: Column(
                  children: [
                    SizedBox(height: 50,),

                    FlatButton(
                      minWidth: 200,
                      height: 90,
                      color: Colors.blueAccent,
                      onPressed: ()
                      {
                        _navigateAndDisplaySelection2(context);
                      },
                      child: Container(
                        width: 150,
                        height: 30,
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_a_photo,
                              size: 25,
                            ),

                            Text(' 사진 촬영',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 25,
                                  color: Colors.black,)
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 50),

                    FlatButton(
                      minWidth: 200,
                      height: 90,
                      color: Colors.blueAccent,
                      onPressed: ()
                      {
                        _navigateAndDisplaySelection(context);
                      },
                      child: Container(
                        width: 150,
                        height: 30,
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_photo_alternate,
                              size: 25,
                            ),

                            Text(' 갤러리',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 25,
                                  color: Colors.black,)
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),

              SizedBox(height: 151.5),

              Column(
                children: [
                  Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.33,
                          child: ElevatedButton(
                            style: ButtonStyle( backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent), ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => shootPage()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(33.0),
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
                              padding: const EdgeInsets.all(33.0),
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
                              padding: const EdgeInsets.all(33.0),
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
  _navigateAndDisplaySelection2(BuildContext context) async {

    await getImage(ImageSource.camera);
    await postRequest();

    final result = await Navigator.push(
      context,
      MaterialPageRoute (builder: (context) => Basic_Page(url: url2)),
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {

    await getImage(ImageSource.gallery);
    await postRequest();

    final result = await Navigator.push(
      context,
      MaterialPageRoute (builder: (context) => Basic_Page(url: url2)),
    );
  }

  Future  getImage(ImageSource imageSource) async
  {
    final pickedFile = await picker.getImage(source: imageSource);

    setState(()
    {
      _image = File(pickedFile.path);
    });
  }

  postRequest() async
  {
    // obtain shared preferences

    final prefs = await SharedPreferences.getInstance();

// set value

    var datauser;
    var postUri = Uri.parse("$base/upload");//URi파싱
    var request = new http.MultipartRequest("POST", postUri);//이미지 포함 전송

    var multipartFile = http.MultipartFile.fromBytes("file", _image.readAsBytesSync(),filename: "code_ex.jpg");
    request.files.add(multipartFile);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    datauser = json.decode(response.body);

    print(datauser);

    url2 = '$base/img/'+datauser['img'];


    prefs.setString('url2', url2);
    prefs.setString('company', datauser["company"]);
    prefs.setString('date_manufacture', datauser["date_manufacture"]);
    prefs.setString('itemName', datauser["itemName"]);
    prefs.setString('di', datauser["di"]);

  }

  Widget showImage()  {

    if(_image == null)
    {
      return Container();
    }
    else
    {
      postRequest();
      return Image.file(_image);
    }
  }
}
