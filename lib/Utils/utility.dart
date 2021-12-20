import 'package:flutter/material.dart';

class Utility {
  static Utility? utility;

  static Utility? getInstance() {
    if (utility == null) {
      utility = Utility();
    }
    return utility;
  }

  showAlertDialog(BuildContext context, String alertTitle, String alertMessage,
      [String btnText = 'OK']) {
    Widget okButton = ElevatedButton(
      child: Text(
        btnText,  
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        alertTitle,
        style: TextStyle(color: Colors.black),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: [Text(alertMessage)],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 20.0,
            bottom: 10.0,
          ),
          child: okButton,
        ),
      
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
