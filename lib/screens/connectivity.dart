import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:weather/screens/home.dart';

class ConnectivityScreen extends StatefulWidget {
  @override
  _ConnectivityScreenState createState() => _ConnectivityScreenState();
}

class _ConnectivityScreenState extends State<ConnectivityScreen> {
  String result;
  bool showSpinner = true;
  bool isConnected = false;
  checkStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        showSpinner = true;
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      setState(() {
        showSpinner = false;
      });
      isConnected = false;
    }
  }

  Widget warning() {
    return showSpinner?Container() :AlertDialog(
      backgroundColor: Colors.black26,
      title: Text(
        "Can't access internet",
        style: TextStyle(color: Colors.white),
      ),
      content: const Text(
        'Please make sure you are connected to internet and try again',
        style: TextStyle(color: Colors.white),
      ),
      actions: <Widget>[
        FlatButton(
            splashColor: Colors.white,
            child: Text('Ok'),
            onPressed: () {
              checkStatus();
            })
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Stack( 
        children: <Widget>[
          Image.asset(
            'images/bg2.jpg',
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: Colors.black26,
            body: isConnected ? Container() : warning(),
          )
        ],
      ),
    );
  }
}
