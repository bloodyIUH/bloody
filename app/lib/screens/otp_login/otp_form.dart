// ignore_for_file: use_build_context_synchronously

import 'package:bloody/config/routes/app_route_constants.dart';
import 'package:bloody/widgets/buttton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
    this.name,
  }) : super(key: key);
  final String? name;

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  var code = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Pinput(
            length: 6,
            showCursor: true,
            onChanged: (value) {
              code = value;
            },
          ),
          const SizedBox(height: 30),
          const Text(
            "Gửi lại mã OTP",
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            style: buttonPrimary,
            onPressed: () async {
              // try {
              //   PhoneAuthCredential phoneAuthCredential =
              //       PhoneAuthProvider.credential(
              //           verificationId: Login.verify, smsCode: code);
              //   await _auth.signInWithCredential(phoneAuthCredential);
              //   if (widget.name != null) {
              //     GoRouter.of(context)
              //         .pushNamed(MyAppRouteConstants.homeRouteName);
              //   } else {
              //     GoRouter.of(context)
              //         .pushNamed(MyAppRouteConstants.signUpRouteName);
              //   }
              // } catch (e) {
              //   if (kDebugMode) {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       const SnackBar(
              //         content: Text("Mã OTP không đúng !"),
              //       ),
              //     );
              //   }
              // }
              if (widget.name != null) {
                GoRouter.of(context)
                    .pushNamed(MyAppRouteConstants.homeRouteName);
              } else {
                GoRouter.of(context)
                    .pushNamed(MyAppRouteConstants.signUpRouteName);
              }
            },
            child: const Text(
              "Tiếp tục",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
