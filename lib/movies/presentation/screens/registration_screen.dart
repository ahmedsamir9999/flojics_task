import 'package:flojics_task/core/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/services/services.dart';
import '../controller/register_provider.dart';

class RegistrationScreen extends StatelessWidget {
  final ser = Services();

  RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<RegisterProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24.sp, right: 24.sp),
          child: SingleChildScrollView(
            child: Form(
              key: K.formKey2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  Text("Hey, Hello",
                      style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text("Enter your credentials to access your account",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                      )),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text("Name",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 45.h,
                    child: TextFormField(
                      onChanged: (value) {
                        if (K.formKey2.currentState!.validate()) {
                        } else {}
                      },
                      validator: (value) {
                        if (value == "") {
                          return "you should fill this ";
                        } else {
                          return null;
                        }
                      },
                      controller: prov.nameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.7.sp),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text("Email address",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 45.h,
                    child: TextFormField(
                      onChanged: (value) {
                        if (K.formKey2.currentState!.validate()) {
                        } else {}
                      },
                      controller: prov.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.7.sp),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text("Password",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 45.h,
                    child: TextFormField(
                      onChanged: (value) {
                        if (K.formKey2.currentState!.validate()) {
                        } else {}
                      },
                      validator: (value) {
                        if (value!.length < 8) {
                          return "it should more than 8 letters or numbers ";
                        } else {
                          return null;
                        }
                      },
                      controller: prov.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: prov.show,
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              prov.changeIcon();
                            },
                            child: Consumer<RegisterProvider>(
                              builder: (context, prove, child) {
                                return Icon(prove.show == true
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off);
                              },
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.7.sp),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          shape: const CircleBorder(),
                          value: prov.check,
                          onChanged: (value) {
                            prov.changeCheck();
                          }),
                      Text("I agree to the",
                          style: TextStyle(color: Colors.grey, fontSize: 8.sp)),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Terms & Privacy",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.sp,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (prov.check == true) {
                        await ser.register(
                            emailSignUp: prov.emailController.text,
                            passwordSignUp: prov.passwordController.text,
                            context: context);
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                                  title: Center(child: Text('failed')),
                                  content: Text(
                                    'Check Terms & Privacy',
                                    textAlign: TextAlign.center,
                                  ),
                                ));
                      }
                    },
                    child: Container(
                      height: 45.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: const Color(0xff110E47),
                          borderRadius: BorderRadius.circular(10.7.sp)),
                      child: Center(
                        child: Text("Sign up",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",
                          style:
                              TextStyle(color: Colors.black, fontSize: 14.sp)),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: const Color(0xff110E47),
                              fontSize: 14.sp,
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
