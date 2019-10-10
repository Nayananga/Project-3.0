import 'package:flutter/material.dart';
import 'package:project_3s_mobile/pages/complaint_page/complaint_page.dart';
import 'package:project_3s_mobile/pages/home_page/review_page.dart';
import 'package:project_3s_mobile/utils/circle_progress.dart';

class MyHomePage extends StatefulWidget {
  @override
  _CircleProgressState createState() => new _CircleProgressState();
}

class _CircleProgressState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController progressController;
  Animation<double> animation;

  void initState() {
    super.initState();
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animation = Tween<double>(begin: 0, end: 80).animate(progressController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: new Color(0xffde5cbc),
          title: new Text(
            'Home',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Herriweather-Black",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
                color: new Color(0xff622F74),
                gradient: LinearGradient(
                  colors: [new Color(0xff6094e8), new Color(0xffde5cbc)],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                )),
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
                          // margin: EdgeInsets.all(10.0),
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide(color: Colors.indigo, width: 3.0),
                              right:
                                  BorderSide(color: Colors.indigo, width: 3.0),
                              left:
                                  BorderSide(color: Colors.indigo, width: 3.0),
                              bottom:
                                  BorderSide(color: Colors.indigo, width: 3.0),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),

                          child: Icon(
                            Icons.person,
                            size: 80.0,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            const SizedBox(
                              height: 50.0,
                            ),
                            CustomPaint(
                                foregroundPainter:
                                    CircleProgress(animation.value),
                                child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    //alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                        onTap: () {
                                          progressController.forward();
                                        },
                                        child: Center(
                                            child: Text(
                                                "Review \n  count" +
                                                    "\n    ${animation.value.toInt()}%",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                )))))),
                            SizedBox(
                              width: 100.0,
                            ),
                            CustomPaint(
                                foregroundPainter:
                                    CircleProgress(animation.value),
                                child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                        onTap: () {
                                          progressController.forward();
                                        },
                                        child: Center(
                                            child: Text(
                                                "Complaint \n   count" +
                                                    "\n     ${animation.value.toInt()}%",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                )))))),
                          ],
                        ),
                      ),
                      TextFormField(
                          style: TextStyle(
                        fontSize: 20.0,
                      )),
                      TextFormField(
                          style: TextStyle(
                        fontSize: 20.0,
                      )),
                      TextFormField(
                          style: TextStyle(
                        fontSize: 20.0,
                      )),
                      TextFormField(
                          style: TextStyle(
                        fontSize: 20.0,
                      )),
                      Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              ButtonTheme(
                                minWidth: 100.0,
                                height: 50.0,
                                child: RaisedButton(
                                  shape: StadiumBorder(),
                                  color: Colors.purpleAccent,
                                  child: const Text(
                                    'Review',
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.white),
                                  ),
                                  onPressed: _goToReviewPage,
                                ),
                              ),
                              SizedBox(width: 100.0, height: 100.0),
                              ButtonTheme(
                                minWidth: 100.0,
                                height: 50.0,
                                child: RaisedButton(
                                  shape: StadiumBorder(),
                                  color: Colors.purpleAccent,
                                  child: const Text(
                                    'Complaint',
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.white),
                                  ),
                                  onPressed: _goToComplaintPage,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            )));
  }

  _goToComplaintPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ComplaintPage()),
    );
  }

  _goToReviewPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReviewPage()),
    );
  }
}
