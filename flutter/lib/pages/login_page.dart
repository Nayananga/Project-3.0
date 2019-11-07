import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:project_3s_mobile/models/api_request.dart';
import 'package:project_3s_mobile/models/api_response.dart';
import 'package:project_3s_mobile/pages/complaint_page/complaint_page.dart';
import 'package:project_3s_mobile/pages/home_page/profile_page.dart';
import 'package:project_3s_mobile/pages/home_page/review_page.dart';
import 'package:project_3s_mobile/pages/home_page/settings_page.dart';
import 'package:project_3s_mobile/pages/search_page/search_page.dart';
import 'package:project_3s_mobile/utils/app_shared_preferences.dart';
import 'package:project_3s_mobile/utils/constants.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'https://www.googleapis.com/auth/userinfo.profile',
    'https://www.googleapis.com/auth/userinfo.email',
  ],
);

class LogInPage extends StatefulWidget {
  @override
  State createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool _isUserLoggedIn = false;

  //  bool _isUserLoggedIn = true;

  GoogleSignInAccount _currentUser;

  @override
  Widget build(BuildContext context) {
    if (_currentUser != null) {
      return Scaffold(
        appBar: AppBar(
            backgroundColor: new Color(0xffde5cbc), title: const Text('Home')),
        body: Container(
          decoration: BoxDecoration(
            color: new Color(0xff622F74),
            gradient: LinearGradient(
              colors: [new Color(0xff6094e8), new Color(0xffde5cbc)],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: _buildBody(),
          ),
        ),
        drawer: Drawer(
          child: _buildDrawer(),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
            backgroundColor: new Color(0xffde5cbc), title: const Text('Login')),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [new Color(0xff6094e8), new Color(0xffde5cbc)],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              )),
          child: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: _buildBodyBeforeLogin(),
          ),
        ),
      );
    }
  }

  @override
  initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      if (mounted) {
        setState(() {
          _currentUser = account;
        });
      }
    });
    _handleSignInCredential();
  }

  Widget _buildBody() {
    return SafeArea(
      child: AnimatedSwitcher(
        duration: Duration(seconds: 1),
        child: _isUserLoggedIn
            ? _buildBodyAfterLogin()
            : Center(child: const CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildBodyAfterLogin() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          "Signed in successfull.",
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        ButtonTheme(
          minWidth: 150.0,
          height: 50.0,
          child: RaisedButton(
            shape: StadiumBorder(),
            color: Colors.purpleAccent,
            child: const Text(
              ' Survey ',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            onPressed: _goToQuizPage,
          ),
        ),
        ButtonTheme(
          minWidth: 150.0,
          height: 50.0,
          child: RaisedButton(
            shape: StadiumBorder(),
            color: Colors.purpleAccent,
            child: const Text(
              'Complaint',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            onPressed: _goToComplaintPage,
          ),
        ),
        ButtonTheme(
          minWidth: 150.0,
          height: 50.0,
          child: RaisedButton(
            color: Colors.purpleAccent,
            shape: StadiumBorder(),
            child: const Text(
              'SIGN OUT',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            onPressed: _handleSignOut,
          ),
        )
      ],
    );
  }

  Widget _buildBodyBeforeLogin() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "You are not currently signed in.",
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(
          height: 30.0,
        ),
        ButtonTheme(
          minWidth: 150.0,
          height: 50.0,
          child: RaisedButton(
            color: Colors.purpleAccent,
            shape: StadiumBorder(),
            onPressed: _handleSignInCredential,
            child: const Text(
              'SIGN IN',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildDrawer() {
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(top: 60.0, left: 15.0),
            width: double.infinity,
            color: new Color(0xffde5cbc),
            height: 200.0,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  leading: GoogleUserCircleAvatar(
                    backgroundColor: Colors.white,
                    identity: _currentUser,
                  ),
                  title: Text(
                    _currentUser.displayName ?? 'Example Name',
                    style: new TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                  subtitle: Text(
                    _currentUser.email ?? 'example.email@example.email',
                    style: new TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
              ],
            )),
        ListTile(
          onTap: _goToProfilePage,
          leading: Icon(Icons.details),
          title: Text("Profile"),
        ),
        ListTile(
          onTap: _goToReviewPage,
          leading: Icon(Icons.playlist_add_check),
          title: Text("Review"),
        ),
        ListTile(
          onTap: _goToSettingPage,
          leading: Icon(Icons.settings),
          title: Text("Settings"),
        ),
      ],
    );
  }

  _goToComplaintPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ComplaintPage()),
    );
  }


  _goToProfilePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
  }

  _goToQuizPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchDemo()),
    );
  }

  _goToReviewPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReviewPage()),
    );
  }

  _goToSettingPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingPage()),
    );
  }

  _handleSignInCredential() async {
    const String _url = APIConstants.API_BASE_URL + APIRoutes.LOGIN_USER;
    try {
      await _googleSignIn.signIn().then((GoogleSignInAccount account) async {
        await account.authentication
            .then((GoogleSignInAuthentication googleAuth) async {
          await AppSharedPreferences.setUserLoggedIdToken(googleAuth.idToken)
              .whenComplete(() async {
            await ApiRequest()
                .apiGetRequest(_url)
                .then((http.Response response) {
              if (mounted) {
                setState(() {
                  _isUserLoggedIn = ApiResponse().handleLoginResponse(response);
                  //  _isUserLoggedIn = true;
                });
              }
            });
          });
        });
      });
    } catch (error) {
      print(error);
    }
  }

  _handleSignOut() async {
    _googleSignIn.disconnect();
    AppSharedPreferences.clear();
  }
}
