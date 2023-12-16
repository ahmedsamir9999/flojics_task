import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TakeScreen extends StatelessWidget {
  const TakeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Take Screen',
          style: TextStyle(fontSize: 15.sp),
        ),
      ),
    );
  }
}
