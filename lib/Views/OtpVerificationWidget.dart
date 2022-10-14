import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/Controllers/UserController.dart';
import 'package:flutter_assignment/Models/MyColors.dart';
import 'package:flutter_assignment/Models/UserDetails.dart';
import 'package:flutter_assignment/Models/Users.dart';
import 'package:flutter_assignment/Views/HomeNavigationBar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPVerWidget extends StatefulWidget {
  Users user;
  String countryCode;
  OTPVerWidget({
    Key key,
    @required this.user,
    @required this.countryCode
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return OTPVerWidgetState();
  }
}

class OTPVerWidgetState extends State<OTPVerWidget> {
  bool _saving = false;

  Timer _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (mounted) {
          if (_start == 0) {
            setState(() {
              resendButtonEnabled = true;
              timer.cancel();
            });
          } else {
            setState(() {
              _start--;
            });
          }
        }
      },
    );
  }

  String signature;
  String enteredOTP;
  bool resendButtonEnabled = false;
  @override
  void initState() {
    startTimer();
    super.initState();
    enteredOTP = null;
  }

  TextEditingController txtOTP = new TextEditingController();

  _onOtpCallBack() async {
    if (enteredOTP.length < 6 || enteredOTP != "123456") {
      Fluttertoast.showToast(
          msg: "Enter Valid OTP",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: MyColors.darkred.withOpacity(0.9),
          textColor: MyColors.white,
          fontSize: 14.0);
    } else {

      UserController.saveUserDetails(widget.user);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('id', UserDetails.userId);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeNavigationBarWidget(index: 0)),
          (Route<dynamic> route) => false);
                            }
    
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }


  Widget _buildWidget() {
    return Scaffold(
        backgroundColor: MyColors.white,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding:EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Image.asset("assets/Logo.png",
               height: 80,
                   fit: BoxFit.contain),
                
                Text("Verify OTP",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6.apply(
                        fontSizeFactor: 1.6,
                        fontWeightDelta: 30,
                        color: MyColors.darkgrey)),
Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(12),
                             
                              child: Text("Enter The OTP Sent To "+widget.countryCode+" "+widget.user.mobileNumber,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .apply(
                                          fontSizeFactor: 0.7,
                                          color: MyColors.lightGrey))),
                        
                Container(
                  padding: EdgeInsets.fromLTRB(4, 10, 4, 10),
                  child: PinCodeTextField(
                    appContext: context,
                    controller: txtOTP,
                    enabled: !_saving,
                    backgroundColor: Colors.transparent,
                    length: 6,
                    obscureText: false,
                    textStyle: TextStyle(
                        color: MyColors.black, fontWeight: FontWeight.bold),
                    animationType: AnimationType.slide,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderWidth: 0,
                      borderRadius: BorderRadius.circular(5),
                      fieldWidth: MediaQuery.of(context).size.width * 0.13,
                      activeColor: MyColors.themeColor,
                      inactiveColor: MyColors.verLightGrey.withOpacity(0.6),
                      disabledColor: MyColors.verLightGrey.withOpacity(0.6),
                      selectedColor: MyColors.themeColor,
                      selectedFillColor: MyColors.white,
                      activeFillColor: MyColors.white,
                      inactiveFillColor: MyColors.white,
                    ),
                    autoFocus: false,
                    keyboardType: TextInputType.number,
                    animationDuration: Duration(milliseconds: 300),
                    enableActiveFill: true,
                    boxShadows: [
                      BoxShadow(
                          offset: Offset(2, 2),
                          color: MyColors.verLightGrey.withOpacity(0.7),
                          blurRadius: 3,
                          spreadRadius: 1)
                    ],
                    autoDismissKeyboard: true,
                    onChanged: (value) {
                      setState(() {
                        enteredOTP = value;
                      });
                    }
                  ),
                ),
               const SizedBox(
                  height: 12,
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
                            _onOtpCallBack();
                          },
                          child: Container(
                                  padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: enteredOTP!=null && enteredOTP.length==6 ?MyColors.themeColor:MyColors.extraLightGrey,
                                   ),
                                child: Text("  VERIFY  ",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .apply(
                                            fontWeightDelta: 30,
                                            fontSizeFactor: 0.8,
                                            color: enteredOTP!=null && enteredOTP.length==6 ?MyColors.white:MyColors.grey))),
                        ),
                    ),
               const SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      !resendButtonEnabled
                          ? Text(" 00:$_start ",
                              style: TextStyle(color: MyColors.darkgrey))
                          : Container(),
                      InkWell(
                        child: Text(
                          " RESEND OTP  ",
                          style: TextStyle(
                            color: resendButtonEnabled
                                ? MyColors.black
                                : MyColors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        onTap: () {
                          if (resendButtonEnabled && !_saving) {
                            
                                  setState(() {
                                    _start = 60;
                                    resendButtonEnabled = false;
                                    startTimer();
                                  });
                                  Fluttertoast.showToast(
                                      msg: "OTP Sent To +"+widget.countryCode+" "+ widget.user.mobileNumber,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 3,
                                      backgroundColor:MyColors.black.withOpacity(0.8),
                                      textColor: MyColors.white,
                                      fontSize: 14.0);
                                
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
