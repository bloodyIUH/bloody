import 'package:bloody/screens/otp_login/constains.dart';
import 'package:bloody/screens/otp_login/size_config.dart';
import 'package:bloody/screens/signUp/signup_info.dart';
import 'package:bloody/widgets/buttton.dart';
import 'package:flutter/material.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Row(
            children: [
              const SizedBox(
                width: 40,
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  autofocus: true,
                  obscureText: false,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  obscureText: false,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin3FocusNode),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  obscureText: false,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin4FocusNode),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  obscureText: false,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin4FocusNode!.unfocus();
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const SizedBox(height: 25),
          ElevatedButton(
            style: buttonPrimary,
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpInfo()),
              ),
            },
            child: const Text(
              "Tiếp tục",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
