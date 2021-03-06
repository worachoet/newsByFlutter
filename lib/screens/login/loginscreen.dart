import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsflutter/Network/rest_api.dart';
import 'package:newsflutter/Utils/form_helper.dart';
import 'package:newsflutter/Utils/utility.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //กำหนดตัวแปรเก็บ key

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  // กำหนดตัวแปรค่า username/password
  String _username = "";
  String _password = "";
  bool hidePassword = true;
  bool isAPICallProcess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: isAPICallProcess
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: SingleChildScrollView(
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 250,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xffe64980),
                                    Color(0xffff8787)
                                  ]),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(80))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Align(
                                alignment: Alignment.center,
                                child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundImage:
                                      AssetImage('images/SignInLogo.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: 20.0,
                              top: 40,
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          child: FormHelper.inputFieldWidget(
                            context,
                            Icon(Icons.verified_user),
                            'username',
                            'Username',
                            (onValidateVal) {
                              if (onValidateVal.isEmpty) {
                                return 'Username is require';
                              }
                              return null;
                            },
                            (onSavedVal) {
                              _username = onSavedVal;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: FormHelper.inputFieldWidget(
                              context, Icon(Icons.lock), 'password', 'Password',
                              (onValidateVal) {
                            if (onValidateVal.isEmpty) {
                              return 'Password is require';
                            } else if (onValidateVal.length < 6) {
                              return 'Password min 6 character';
                            }
                            return null;
                          }, (onSavedVal) {
                            _password = onSavedVal;
                          },
                              obscureText: hidePassword,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                                color: Colors.redAccent.withOpacity(0.5),
                                icon: Icon(
                                  hidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Center(
                          child: FormHelper.saveButon(
                            'Login',
                            () async {
                              if (validateAndSave()) {
                                print("Username: $_username");
                                print("Password: $_password");

                                setState(() {
                                  //โชว์ progressbar
                                  this.isAPICallProcess = true;
                                });

                                //เรียกใช้งาน API เพื่อ login
                                var response = await CallAPI().LoginCustomer({
                                  "username": _username,
                                  "password": _password
                                });

                                var body = json.decode(response.body);
                                print(body);


                                if (body['success']) {
                                  setState(() {
                                    //ซ่อน progressbar
                                    this.isAPICallProcess = false;
                                  });
                                  // สร้าง Object SharedPreferences
                                  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

                                  //เก็บค่าตัวแปรแบบ SharedPreferences
                                  sharedPreferences.setString("storefirstName", body['data']['firstName']);
                                  sharedPreferences.setString("storelastName", body['data']['lastName']);
                                  sharedPreferences.setString("storeemail", body['data']['email']);

                                  //เก็บ step ไว้ว่าlogin ไปแล้วหรือยัง
                                  sharedPreferences.setInt("storeStep", 1);


                                  //ส่งไปหน้า dashboard
                                  Navigator.pushReplacementNamed(
                                      context, '/dashboard');
                                } else {
                                  // ถ้า login ผิด จะแจ้งเตือนเป็น popup
                                  Utility().showAlertDialog(context, 'มีข้อมูลผิดพลาด', 'ข้อมูลเข้าระบบผิดพลาด', 'ตกลง');
                                  setState(() {
                                    //ซ่อน progressbar
                                    this.isAPICallProcess = false;
                                  });
                                }
                                // print(response);

                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  //validate and Save form
  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }

    return false;
  }
}
