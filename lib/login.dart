import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userNameController = TextEditingController();
  final _passWordController = TextEditingController();
  final _unfocusedColor = Colors.grey[600];
  final _userNameFocusNode = FocusNode();
  final _passWordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _userNameFocusNode.addListener(() {
      setState(() {

      });
    });

    _passWordFocusNode.addListener(() {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: [
            SizedBox(height: 80.0),
            Column(
              children: [
                Image.asset('assets/diamond.png'),
                SizedBox(height: 16.0),
                Text('SmallHome',
                style: Theme.of(context).textTheme.headline5,
                )
              ],
            ),
            SizedBox(
              height: 120.0,
            ),
            TextField(
              controller: _userNameController,
              decoration: InputDecoration( labelText: 'Username',
                labelStyle: TextStyle(color:
                _userNameFocusNode.hasFocus ?
                Theme.of(context).accentColor : _unfocusedColor)
              ),
              focusNode: _userNameFocusNode,
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _passWordController,
              decoration: InputDecoration(labelText: 'Password',labelStyle: TextStyle(color: _passWordFocusNode.hasFocus ? Theme.of(context).accentColor : _unfocusedColor)),
              focusNode: _passWordFocusNode,
              obscureText: true,
            ),
            ButtonBar(
              children: [
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    _userNameController.clear();
                    _passWordController.clear();
                  },
                ),
                RaisedButton(
                  child: Text('Login'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  elevation: 0,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
