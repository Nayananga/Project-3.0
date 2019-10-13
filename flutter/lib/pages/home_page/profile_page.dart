import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';
import 'package:project_3s_mobile/models/api_request.dart';
import 'package:project_3s_mobile/models/api_response.dart';
import 'package:project_3s_mobile/models/entities/user.dart';
import 'package:project_3s_mobile/utils/constants.dart';

class ProfilePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<ProfilePage> {
  bool _isUserDataLoaded = false;
  TextEditingController _textControllerNic;
  TextEditingController _textControllerPhoneNo;
  User _userProfileData;
  ProgressDialog pr;

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);
    pr.style(
      message: 'Uploading profile..',
      backgroundColor: Colors.white30,
    );
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: new Color(0xffde5cbc),
        title: new Text(
          'Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Herriweather-Black",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            color: new Color(0xff622F74),
            gradient: LinearGradient(
              colors: [new Color(0xff6094e8), new Color(0xffde5cbc)],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
          child: _buildBody(),
        ),
      ),
    );
  }

  @override
  initState() {
    super.initState();
    _getUserProfileData().then((receivedUserData) {
      if (mounted) {
        setState(() {
          _userProfileData = receivedUserData;
          _textControllerNic =
              TextEditingController(text: receivedUserData?.nic);
          _textControllerPhoneNo =
              TextEditingController(text: receivedUserData?.phoneNo);
          _isUserDataLoaded = true;
        });
      }
    });
  }

  Widget _buildBody() {
    return SafeArea(
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: _isUserDataLoaded
            ? _editProfileForm()
            : Center(child: const CircularProgressIndicator()),
      ),
    );
  }

  Widget _editProfileForm() {
    return Form(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                height: 100.0,
                width: 100.0,
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
                  Icons.person,
                  size: 80.0,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _textControllerNic,
              keyboardType: TextInputType.text,
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
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                prefixIcon: Icon(
                  Icons.contacts,
                  color: Colors.black,
                ),
//                suffixText: "v",
//                suffixStyle: TextStyle(
//                  color: Colors.black,
//                  fontSize: 25.0,
//                ),
                labelText: 'NIC',
                helperText: "your NIC number",
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
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _textControllerPhoneNo,
              keyboardType: TextInputType.number,
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
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                prefixIcon: Icon(
                  Icons.call,
                  color: Colors.black,
                ),
//                prefixText: "+94",
//                prefixStyle: TextStyle(
//                  color: Colors.black,
//                  fontSize: 16,
//                ),
                labelText: 'TP number',
                helperText: "your phone number",
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
            const SizedBox(
              height: 190.0,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 150.0,
                    height: 50.0,
                    child: RaisedButton(
                      shape: StadiumBorder(),
                      color: Colors.purpleAccent,
                      onPressed: () async {
                        pr.show();
                        await _handleSave();
                        pr.hide();
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<User> _getUserProfileData() async {
    User _userProfileData;
    const String url = APIConstants.API_BASE_URL + APIRoutes.GET_ONE_USER;
    await ApiRequest().apiGetRequest(url).then((http.Response response) {
      _userProfileData = ApiResponse().handleGetOneUserResponse(response);
    });
    return _userProfileData;
  }

  _handleSave() async {
    if (_validateMobile(_textControllerPhoneNo.text) ||
        _validateNic(_textControllerNic.text)) {
      const String _url = APIConstants.API_BASE_URL + APIRoutes.UPDATE_USER;
      final _body = jsonEncode({
        'phoneNo': _validateMobile(_textControllerPhoneNo.text)
            ? _textControllerPhoneNo.text
            : _userProfileData?.phoneNo,
        'nic': _validateNic(_textControllerNic.text)
            ? _textControllerNic.text
            : _userProfileData?.nic,
      });
      print(_body);
      await ApiRequest()
          .apiPutRequest(_url, _body)
          .then((http.Response response) {
        setState(() {
          _userProfileData = ApiResponse().handleGetOneUserResponse(response);
          _textControllerNic =
              TextEditingController(text: _userProfileData?.nic);
          _textControllerPhoneNo =
              TextEditingController(text: _userProfileData?.phoneNo);
        });
      });
    } else {
      print("Both Inputs are invalid");
    }
  }

  bool _validateMobile(String value) {
    final String _pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(_pattern);
    if (regExp.hasMatch(value)) {
      return true;
    }
    return false;
  }

  bool _validateNic(String value) {
    final String _pattern =
        r'(^(?:19|20)?\d{2}(?:[01235678]\d\d(?<!(?:000|500|36[7-9]|3[7-9]\d|86[7-9]|8[7-9]\d)))\d{4}(?:[vVxX])$)';
    RegExp regExp = new RegExp(_pattern);
    if (regExp.hasMatch(value)) {
      return true;
    }
    return false;
  }
}
