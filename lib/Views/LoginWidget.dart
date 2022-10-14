import 'dart:convert';
import 'package:country_calling_code_picker/picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/Controllers/UserController.dart';
import 'package:flutter_assignment/Models/MyColors.dart';
import 'package:flutter_assignment/Views/OtpVerificationWidget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginWidget> {
  bool _saving = false;
  void submit() {
    setState(() {
      _saving = true;
    });
  }

  @override
  void initState() {
    getDefaultCountry(context).then((value) {
      setState(() {
        countrySelected = value;
      });
    });

    super.initState();
  }

  Country countrySelected;
  TextEditingController txtPhone = TextEditingController(text: '');
  String gender;
  bool loginAsProvider = false;
  Widget _buildWidget() {
    return Scaffold(
        backgroundColor: MyColors.white,
        body: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/Logo.png",
                      height: 80, fit: BoxFit.contain),
                  Text("Welcome to\nHealthNest",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6.apply(
                          fontSizeFactor: 1.8,
                          fontWeightDelta: 30,
                          color: MyColors.darkgrey)),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        countrySelected != null
                            ? InkWell(
                                onTap: () {
                                  showCountryPickerDialog(context)
                                      .then((value) {
                                    if (value != null) {
                                      setState(() {
                                        countrySelected = value;
                                      });
                                    }
                                  });
                                },
                                child: Container(
                                  // height: 45,
                                  width: 60,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        countrySelected.flag,
                                        package: countryCodePackageName,
                                        width: 32,
                                      ),
                                      SizedBox(width: 4,),
                                      Image.asset(
                                        "assets/arrow-down.png",
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                        Container(
                          height: 32,
                          width: MediaQuery.of(context).size.width - 88,

                          child: TextField(
                            maxLength: 10,
                            controller: txtPhone,
                            enabled: !_saving,
                            onChanged: (value) {
                              setState(() {});
                            },
                            style:
                                TextStyle(color: MyColors.black, fontSize: 14),
                            keyboardType: TextInputType.number,
                            decoration: new InputDecoration(
                                hintText: "Enter Mobile Number",
                                suffixIcon: Image.asset(
                                  "assets/phone-icon.png",
                                ),
                                counter: Offstage(),
                                isDense: true,
                                hintStyle: TextStyle(
                                    color: MyColors.verLightGrey, fontSize: 16),
                                labelStyle: new TextStyle(
                                  fontSize: 16,
                                  color: MyColors.verLightGrey,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(12),
                      child: Text(
                          "We never compromise on security!\nHelp us create a safe place by providing your mobile number to maintain authenticity.",
                          style: Theme.of(context).textTheme.headline6.apply(
                              fontSizeFactor: 0.7, color: MyColors.lightGrey))),
                  SizedBox(
                    height: 24,
                  ),
                  _saving
                      ? Center(
                          child: Container(
                            height: 32,
                            width: 32,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: CircularProgressIndicator(
                                  strokeWidth: 2.0,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      MyColors.themeColor)),
                            ),
                          ),
                        )
                      : Center(
                          child: InkWell(
                            onTap: () {
                              if (txtPhone.text.isEmpty ||
                                  txtPhone.text.trim() == "") {
                                Fluttertoast.showToast(
                                    msg: "Enter Phone Number",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 3,
                                    backgroundColor:
                                        MyColors.darkred.withOpacity(0.9),
                                    textColor: MyColors.white,
                                    fontSize: 14.0);
                              } else if (txtPhone.text.trim().length < 10) {
                                Fluttertoast.showToast(
                                    msg: "Enter Valid Phone",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 3,
                                    backgroundColor:
                                        MyColors.darkred.withOpacity(0.9),
                                    textColor: MyColors.white,
                                    fontSize: 14.0);
                              } else {
                                submit();

                                UserController.login(txtPhone.text.trim())
                                    .then((value) {
                                  if (value.isNotEmpty) {
                                    Fluttertoast.showToast(
                                        msg: "Verify Your Phone",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor:
                                            MyColors.black.withOpacity(0.8),
                                        textColor: MyColors.white,
                                        fontSize: 14.0);
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (context) => OTPVerWidget(
                                                  countryCode: countrySelected
                                                      .callingCode,
                                                  user: value[0],
                                                )));
                                  } else {
                                    setState(() {
                                      _saving = false;
                                    });
                                    Fluttertoast.showToast(
                                        msg: "User Not Exist.",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor:
                                            MyColors.darkred.withOpacity(0.9),
                                        textColor: MyColors.white,
                                        fontSize: 14.0);
                                  }
                                });
                              }
                            },
                            child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: txtPhone.text.trim().length == 10
                                      ? MyColors.themeColor
                                      : MyColors.extraLightGrey,
                                ),
                                child: Text("Send OTP",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .apply(
                                            fontWeightDelta: 30,
                                            fontSizeFactor: 0.8,
                                            color:
                                                txtPhone.text.trim().length ==
                                                        10
                                                    ? MyColors.white
                                                    : MyColors.grey))),
                          ),
                        ),
                ],
              )),
        ));
  }

  Widget progress() {
    return Center(
      child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.transparent)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildWidget(),
    );
  }
}
