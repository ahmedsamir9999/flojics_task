import 'package:flojics_task/movies/presentation/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/services/services.dart';
import '../../../core/utils/const.dart';
import '../controller/login_provider.dart';

class LoginScreen extends StatelessWidget {
  final ser = Services();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "lib/core/assets/image/Rectangle 9.png",
                width: double.infinity,
                height: 256.h,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                child: SingleChildScrollView(
                  child: Form(
                    key: K.formKey1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                          child: Text("Let’s Connect With Us!",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700)),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 44.14.h,
                          child: TextFormField(
                            onChanged: (value) {
                              if (K.formKey1.currentState!.validate()) {
                              } else {}
                            },
                            controller: prov.emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                label: const Text("Email Address"),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.7.sp),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 44.14.h,
                          child: TextFormField(
                            onChanged: (value) {
                              if (K.formKey1.currentState!.validate()) {
                              } else {}
                            },
                            obscureText: prov.show,
                            controller: prov.passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                label: const Text("Password"),
                                suffixIcon: GestureDetector(onTap: () {
                                  prov.changeIcon();
                                }, child: Consumer<LoginProvider>(
                                  builder: (context, prove, child) {
                                    return Icon(prove.show == true
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off);
                                  },
                                )),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.7.sp),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forgot password?",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10.sp),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await ser.signIn(
                                emailSignIn: prov.emailController.text,
                                passwordSignIn: prov.passwordController.text,
                                context: context);
                          },
                          child: Container(
                            height: 41.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: const Color(0xff110E47),
                                borderRadius: BorderRadius.circular(85.58.sp)),
                            child: Center(
                              child: Text("Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10.sp)),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => RegistrationScreen(),
                                  ));
                                },
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                    color: const Color(0xff110E47),
                                    fontSize: 10.sp,
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
