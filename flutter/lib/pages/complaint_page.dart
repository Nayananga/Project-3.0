import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Complaint extends State<ComplaintPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: new Color(0xffde5cbc),
        title: Text("Complaint"),
        elevation: Theme.of(ctx).platform == TargetPlatform.iOS ? 0.0 : 6.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: new Color(0xff622F74),
          gradient: LinearGradient(
            colors: [new Color(0xff6094e8), new Color(0xffde5cbc)],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: SafeArea(
          top: false,
          bottom: false,
          child: Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 5.0,
                  ),
                  Center(
                    child: Container(
                      height: 200.0,
                      width: 300.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(color: Colors.indigo, width: 3.0),
                          right: BorderSide(color: Colors.indigo, width: 3.0),
                          left: BorderSide(color: Colors.indigo, width: 3.0),
                          bottom: BorderSide(color: Colors.indigo, width: 3.0),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Icon(
                        Icons.photo_camera,
                        size: 150.0,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.indigo,
                          width: 1.5,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.indigo,
                          width: 1.5,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      prefixIcon: Icon(
                        Icons.my_location,
                        color: Colors.black,
                      ),
                      labelText: "Location",
                      helperText: "Your location",
                      labelStyle: TextStyle(
                        color: Colors.indigo,
                        fontFamily: "Merriweather-Black",
                        fontWeight: FontWeight.bold,
                      ),
                      helperStyle: TextStyle(
                        color: Colors.indigo,
                        fontFamily: "Merriweather-Black",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(height: 30.0),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.indigo,
                          width: 1.5,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.indigo,
                          width: 1.5,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      prefixIcon: Icon(
                        Icons.message,
                        color: Colors.black,
                      ),
                      labelText: "Description",
                      helperText: "Enter your complaint",
                      labelStyle: TextStyle(
                        color: Colors.indigo,
                        fontFamily: "Merriweather-Black",
                        fontWeight: FontWeight.bold,
                      ),
                      helperStyle: TextStyle(
                        color: Colors.indigo,
                        fontFamily: "Merriweather-Black",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    maxLines: 1,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ButtonTheme(
                              minWidth: 150.0,
                              height: 50.0,
                              child: RaisedButton(
                                color: Colors.purpleAccent,
                                shape: StadiumBorder(),
                                onPressed: _handleDone,
                                child: Text(
                                  "Done",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ]))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleDone() async {}
}

class ComplaintPage extends StatefulWidget {
  @override
  State createState() => Complaint();
}
