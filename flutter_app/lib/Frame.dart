import 'package:flutter/material.dart';
import 'package:flutter_info/shoot.dart';

class defaultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UDIBacode',
      home: Scaffold(
        body: default_Page(),
      ),
    );
  }
}

class default_Page extends StatefulWidget
{
  @override
  _default_PageState createState() => _default_PageState();
}

class _default_PageState extends State<default_Page>
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: DefaultTabController(
          length: 1,
          child: Scaffold(
            body: TabBarView(
              children: [
                shootPage(),
              ],
            ),
          )),
    );
  }
}
