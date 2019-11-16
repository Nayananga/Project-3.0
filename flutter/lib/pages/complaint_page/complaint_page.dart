import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:project_3s_mobile/models/api_request.dart';
import 'package:project_3s_mobile/models/api_response.dart';
import 'package:project_3s_mobile/utils/constants.dart';
import 'package:project_3s_mobile/utils/geo_location.dart';

class Complaint extends State<ComplaintPage> {
  Future<File> _file;
  String _base64Image;
  File _tmpFile;
  bool _isFileLoaded = false;
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext ctx) {
    ProgressDialog pr =
        new ProgressDialog(context, type: ProgressDialogType.Normal);
    pr.style(
      message: 'Uploading complaint..',
      backgroundColor: Colors.white30,
    );
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: new Color(0xffde5cbc),
        title: Text("Complaint"),
        elevation: Theme.of(ctx).platform == TargetPlatform.iOS ? 0.0 : 6.0,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [new Color(0xff6094e8), new Color(0xffde5cbc)],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
          padding: EdgeInsets.all(15.0),
          width:double.infinity,
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 5.0,
              ),
              _isFileLoaded
                  ? _showImage()
                  : Center(
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
              SizedBox(height: 10.0),
              OutlineButton(
                onPressed: _chooseImage,
                child: Text('Choose Image'),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: _textController,
                // keyboardType: TextInputType.emailAddress,
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
                Expanded(child: Container()),

              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 150.0,
                      height: 50.0,
                      child: RaisedButton(
                        color: Colors.purpleAccent,
                        shape: StadiumBorder(),
                        onPressed: () async {
                          pr.show();
                          await _handleDone();
                          pr.hide();
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                        },
                        child: Text(
                          "Done",
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _chooseImage() {
    setState(
      () {
        _isFileLoaded = true;
        _file = ImagePicker.pickImage(source: ImageSource.camera);
      },
    );
  }

  _handleDone() async {
    if (_textController.text != null) {
      const String _url =
          APIConstants.API_BASE_URL + APIRoutes.CREATE_COMPLAINTS;
      final String description = _textController.text;
      String _fileName;
      if (_base64Image != null) {
        _fileName = _tmpFile.path.split('/').last;
      }
      await GeoLocation().locationToJson().then((jsonLocation) async {
        final body = jsonEncode({
          'geo_location': jsonLocation,
          'description': description,
          'image': {
            'name': _fileName,
            'file': _base64Image,
          }
        },);
        print(body);
        http.Response _response = await ApiRequest().apiPostRequest(_url, body);
        ApiResponse().handleCreateReviewResponse(_response);
      });
    } else {
      throw new Exception("can`t send empty description");
    }
  }

  Widget _showImage() {
    return FutureBuilder<File>(
      future: _file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          _tmpFile = snapshot.data;
          _base64Image = base64Encode(snapshot.data.readAsBytesSync());
          return Container(
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
            child: Image.file(
              snapshot.data,
              fit: BoxFit.fill,
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }
}

class ComplaintPage extends StatefulWidget {
  @override
  createState() => Complaint();
}
