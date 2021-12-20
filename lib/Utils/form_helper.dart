import 'package:flutter/material.dart';
import 'package:newsflutter/Theme/colors.dart';

class FormHelper {
  //textinput

  static Widget inputFieldWidget(BuildContext context, Icon icon,
      String keyName, String labelName, Function onValidate, Function onSaved,
      {String initialValue = "", obscureText: false, Widget? suffixIcon}) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: TextFormField(
        initialValue: initialValue,
        key: Key(keyName),
        obscureText: obscureText,
        validator: (val) {
          return onValidate(val);
        },
        onSaved: (val) {
          return onSaved(val);
        },
        style: TextStyle(fontSize: 18.0),
        decoration: InputDecoration(
          hintText: labelName,
          hintStyle: TextStyle(
              fontSize: 15.0,
              color: textColorSecondary,
              fontWeight: FontWeight.bold),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 1),
          ),
          suffixIcon: suffixIcon,
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              left: 25.0,
              right: 10.0,
            ),
            child: IconTheme(
              data: IconThemeData(color: Theme.of(context).primaryColor),
              child: icon,
            ),
          ),
        ),
      ),
    );
  }

  //saveButtonWidget

  static Widget saveButon(String buttonText, Function onTap,
      {String? color, String? textColor, bool? fullWidth}) {
    return Container(
      height: 50.0,
      width: 150.0,
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.redAccent, style: BorderStyle.solid, width: 1.0),
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
