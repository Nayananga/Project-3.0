import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_3s_mobile/models/entities/user.dart';
import 'package:project_3s_mobile/utils/app_shared_preferences.dart';
import 'package:project_3s_mobile/pages/chat_page/message.dart';

String defaultUserName = "John Doy";
User loggedUser;

class ChatPage extends StatefulWidget {
  @override
  State createState() => ChatWindow();
}

class ChatWindow extends State<ChatPage> with TickerProviderStateMixin {
  final List<Msg> _messages = <Msg>[];
  final TextEditingController _textController = TextEditingController();
  bool _isWriting = false;

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:  new Color(0xffde5cbc),
          //new Color(0xffde5cbc),
        title: Text("Chat Application"),
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
        child: Column(children: [
          Flexible(
            child: ListView.builder(
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
              reverse: true,
              padding: EdgeInsets.all(6.0),
            ),
          ),
          Divider(height: 1.0),
          Container(
            child: _buildComposer(),
            decoration: BoxDecoration(color: Theme.of(ctx).cardColor),
          ),
        ]),
      ),
    );
  }

  @override
  dispose() {
    for (Msg msg in _messages) {
      msg.animationController.dispose();
    }
    super.dispose();
  }

  @override
  initState() {
    initUserProfile();
    super.initState();
  }

  Future<void> initUserProfile() async {
    final loggedUser = await AppSharedPreferences.getUserProfile();
    setState(() {
      defaultUserName = loggedUser.nickname;
    });
  }

  Widget _buildComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 7.0),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  controller: _textController,
                  onChanged: (String txt) {
                    setState(() {
                      _isWriting = txt.length > 0;
                    });
                  },
                  onSubmitted: _submitMsg,
                  decoration: InputDecoration.collapsed(
                    hintText: "  Enter some text to send a message",
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 3.0),
                  child: Theme.of(context).platform == TargetPlatform.iOS
                      ? CupertinoButton(
                          color: Colors.blueAccent,
                          child: Text("Submit"),
                          onPressed: _isWriting
                              ? () => _submitMsg(_textController.text)
                              : null)
                      : IconButton(
                          icon: Icon(Icons.message),
                          onPressed: _isWriting
                              ? () => _submitMsg(_textController.text)
                              : null,)
                        ),
            ],
          ),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.brown)))
              : null
    ),
    );
  }

  _submitMsg(String txt) {
    _textController.clear();
    setState(() {
      _isWriting = false;
    });
    Msg msg = Msg(
      txt: txt,
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 800)),
      defaultUserName: defaultUserName,
    );
    setState(() {
      _messages.insert(0, msg);
    });
    msg.animationController.forward();
  }
}
