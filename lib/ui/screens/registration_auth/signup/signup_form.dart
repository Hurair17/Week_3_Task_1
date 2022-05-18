import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3_task/ui/custom_widget/custom_form_field.dart';
import 'package:week_3_task/ui/custom_widget/eleveted_button.dart';
import 'package:week_3_task/ui/custom_widget/validation_button.dart';
import 'package:week_3_task/ui/custom_widget/wrap_txt_button.dart';
import 'package:week_3_task/ui/screens/home/home.dart';
import 'package:week_3_task/ui/screens/registration_auth/signup/signup.dart';
import 'package:week_3_task/ui/screens/registration_auth/signup/signup_view_model.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  late SignUpFormProvider _formProvider;
  @override
  Widget build(BuildContext context) {
    Provider.of<SignUpFormProvider>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     color: lightgreen,
          //     borderRadius: BorderRadius.circular(15.r),
          //   ),
          //   child: TextFormField(
          //     obscureText: false,
          //     decoration: InputDecoration(
          //       prefixIcon: Icon(
          //         Icons.person,
          //         color: darkgren,
          //       ),
          //       border: InputBorder.none,
          //       hintText: 'Full Name',
          //       hintStyle: TextStyle(color: darkgren),
          //       focusColor: darkgren,
          //     ),
          //     validator: (value) {
          //       if (value == null || value.isEmpty) {
          //         return 'Please Enter Name';
          //       }
          //       return null;
          //     },
          //     cursorColor: darkgren,
          //   ),
          // ),
          CustomFormField(
            hint: 'Name',
            icn: Icon(Icons.person),
            // onChanged: _formProvider.validateName('Name'),
            errorText: _formProvider.name.error,
          ),
          SizedBox(
            height: 20.h,
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     color: lightgreen,
          //     borderRadius: BorderRadius.circular(15.r),
          //   ),
          //   child: TextFormField(
          //     obscureText: false,
          //     decoration: InputDecoration(
          //       prefixIcon: Icon(
          //         Icons.email,
          //         color: darkgren,
          //       ),
          //       border: InputBorder.none,
          //       hintText: 'jhonsmith@gmail.com',
          //       hintStyle: TextStyle(color: darkgren),
          //       focusColor: darkgren,
          //     ),
          //     validator: (value) {
          //       if (value == null || value.isEmpty) {
          //         return 'Please Enter Email';
          //       }
          //       return null;
          //     },
          //     cursorColor: darkgren,
          //   ),
          // ),
          CustomFormField(
            hint: 'Email',
            icn: Icon(Icons.mail),
            // validator: (val) {
            // if (val!.isValidName) {
            //   return 'enter Name';
            // }
            // },
          ),
          SizedBox(
            height: 20.h,
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     color: lightgreen,
          //     borderRadius: BorderRadius.circular(15.r),
          //   ),
          //   child: TextFormField(
          //     obscureText: true,
          //     decoration: InputDecoration(
          //       prefixIcon: Icon(
          //         Icons.lock,
          //         color: darkgren,
          //       ),
          //       border: InputBorder.none,
          //       hintText: 'Password',
          //       hintStyle: TextStyle(color: darkgren),
          //       focusColor: darkgren,
          //     ),
          //     validator: (value) {
          //       if (value == null || value.isEmpty && value.length < 6) {
          //         return 'Please Enter Password';
          //       }
          //       return null;
          //     },
          //     cursorColor: darkgren,
          //   ),
          // ),
          CustomFormField(
            hint: 'Password',
            obsecure: true,
            icn: Icon(Icons.person),
            // validator: (val) {
            // if (val!.isValidName) {
            //   return 'enter Password';
            // }
            // },
          ),
          SizedBox(
            height: 20.h,
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     color: lightgreen,
          //     borderRadius: BorderRadius.circular(15.r),
          //   ),
          //   child: TextFormField(
          //     obscureText: true,
          //     decoration: InputDecoration(
          //       prefixIcon: Icon(
          //         Icons.lock,
          //         color: darkgren,
          //       ),
          //       border: InputBorder.none,
          //       hintText: 'Confirm Password',
          //       hintStyle: TextStyle(color: darkgren),
          //       focusColor: darkgren,
          //     ),
          //     validator: (value) {
          //       if (value == null || value.isEmpty && value.length < 6) {
          //         return 'Please Enter Password';
          //       }
          //       return null;
          //     },
          //     cursorColor: darkgren,
          //   ),
          // ),
          CustomFormField(
            hint: 'Confirm Password',
            icn: Icon(Icons.person),
            // validator: (val) {
            //   if (val == null) {
            //     return 'enter Name';
            //   }
            // },
          ),
          SizedBox(
            height: 20.h,
          ),
          Wrap(
            children: [
              CustWrapButton2(
                txt1: ' Term of use',
                btntxt: 'By signing you agree to our',
                wdth: 270.w,
              ),
              CustWrapButton2(
                txt1: ' privacy notice',
                btntxt: 'and',
                wdth: 160.w,
              ),
            ],
          ),
          SizedBox(
            height: 100.h,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: darkgren,
              onPrimary: black,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r)),
              minimumSize: Size(320.w, 45.h),
              alignment: Alignment.center,
            ),
            onPressed: () {
              print(_formKey.currentState!.validate());

              if (_formKey.currentState!.validate()) {
              } else {
                null;
              }

              // if (_formKey.currentState!.validate()) {
              //   return null;
              // } else {
              //   // Navigator.push(
              //   //     context, MaterialPageRoute(builder: (context) => Home()));
              // }
            },
            child: Text(
              'SignUp',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          // ValButton(
          //   next: Home(),
          //   txt: 'SignUp',
          //   check: _formKey.currentState! .validate(),
          // )
        ],
      ),
    );
  }
}
