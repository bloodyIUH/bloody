import 'package:bloody/blocs/bloc_login/login_cubit.dart';
import 'package:bloody/model/Register/question_check.dart';
import 'package:bloody/widgets/buttton.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../config/routes/app_route_constants.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static String verify = '';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final List<QuestionRegisterCheck> ques = [];
  final urlImages = [
    'assets/images/Frame 2608145.png',
    'assets/images/Frame 2608146.png',
    'assets/images/Frame 2608147.png'
  ];
  String countryCode = '+84';
  var phone = '';
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Positioned(
                        child: Container(
                          margin: const EdgeInsets.only(top: 67),
                          width: double.maxFinite,
                          child: CarouselSlider.builder(
                            itemCount: urlImages.length,
                            itemBuilder: (BuildContext context, int index,
                                int reaIndex) {
                              final urlImage = urlImages[index];

                              return buildImage(urlImage, index);
                            },
                            options: CarouselOptions(
                              height: 200,
                              viewportFraction: 0.9,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.decelerate,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  const Text(
                    "????ng nh???p",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        phone = value.substring(1);
                      },
                      decoration: const InputDecoration(
                        labelText: "Nh???p s??? ??i???n tho???i c???a b???n ??? ????y",
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () async {
                      // await _firebaseAuth.verifyPhoneNumber(
                      //     phoneNumber: countryCode + phone,
                      //     verificationCompleted:
                      //         (PhoneAuthCredential phoneAuthCredential) async {
                      //       await _firebaseAuth
                      //           .signInWithCredential(phoneAuthCredential);
                      //     },
                      //     verificationFailed: (error) {
                      //       throw Exception(error.message);
                      //     },
                      //     codeSent: (verificationId, forceResendingToken) {
                      //       context.read<LoginCubit>().setPhone(phone);
                      //       GoRouter.of(context).pushNamed(
                      //           MyAppRouteConstants.otpLoginRouteName,
                      //           queryParams: {
                      //             'phone': "0$phone",
                      //           });
                      //       Login.verify = verificationId;
                      //     },
                      //     codeAutoRetrievalTimeout: (verificationId) {});
                      GoRouter.of(context).pushNamed(
                          MyAppRouteConstants.otpLoginRouteName,
                          queryParams: {
                            'phone': "0$phone",
                          });
                    },
                    child: const Text(
                      "Ti???p t???c",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 329,
                    height: 20,
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Khi b???n ch???n ti???p t???c, b???n ???? ?????ng ?? v???i c??c ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "??i???u Kho???n\n",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 329,
                    height: 20,
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "v?? ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "Ch??nh S??ch B???o M???t",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline),
                          ),
                          TextSpan(
                            text: " c???a ch??ng t??i",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildImage(String urlImage, int index) => SizedBox(
        width: double.infinity,
        child: Image.asset(
          urlImage,
          fit: BoxFit.fill,
        ),
      );
}
