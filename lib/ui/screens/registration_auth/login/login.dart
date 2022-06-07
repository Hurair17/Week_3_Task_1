import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_3_task/core/constants/color.dart';
import 'package:week_3_task/ui/custom_widget/custom_form_field.dart';
import 'package:week_3_task/ui/custom_widget/wavy_path.dart';
import 'package:week_3_task/ui/custom_widget/wrap_txt_button.dart';
import 'package:week_3_task/ui/screens/registration_auth/login/login_view_model.dart';
import 'package:week_3_task/ui/screens/registration_auth/signup/signup.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LogInFormProvider>(
        create: (context) => LogInFormProvider(),
        child: Consumer<LogInFormProvider>(builder: (context, provider, child) {
          // final TextEditingController emailController =
          //     TextEditingController(text: provider.logInModel.email);
          // final TextEditingController passwordController =
          //     TextEditingController(text: provider.logInModel.password);

          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // Top Plant Image with Bottom wavy
                  ClipPath(
                    child: Image.asset(
                      'assets/plant1.jpg',
                      fit: BoxFit.fitWidth,
                    ),
                    // Bottom Wavy Shape

                    clipper: BottomWaveClipper(),
                  ),

                  // User Welcome Text and Side Image Stack
                  Stack(
                    children: [
                      Column(
                        children: [
                          Center(
                            child: Text(
                              'Welcome back',
                              style: TextStyle(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                                color: darkgren,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Login to your account',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: gry,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Side Plant Image
                      Positioned(
                        right: -20.w,
                        child: RotationTransition(
                          turns: const AlwaysStoppedAnimation(300 / 360),
                          child: Image.asset(
                            'assets/side.png',
                            width: 90.w,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // TextFields Form

                  Form(
                    key: _formKey,
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
                      child: Column(
                        children: [
                          CustomFormField(
                            hint: 'email',
                            icn: Icon(
                              Icons.person,
                              color: darkgren,
                            ),
                            validator: LogInFormProvider().nameValidation,
                            controller: TextEditingController(
                                text: provider.logInModel.email),
                            onChanged: (value) {
                              provider.logInModel.email = value;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomFormField(
                            hint: '*******',
                            icn: Icon(
                              Icons.person,
                              color: darkgren,
                            ),
                            validator: LogInFormProvider().passwordValidation,
                            obsecure: true,
                            controller: TextEditingController(
                                text: provider.logInModel.password),
                            onChanged: (value) {
                              provider.logInModel.password = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Remember Button
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                    child: Row(
                      children: [
                        //CheckBox Button
                        Checkbox(
                          value: provider.isNotifiable,
                          onChanged: (bool? value) {
                            provider.toggleNotification(isNotifiable: value);
                          },
                          checkColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          activeColor: darkgren,
                        ),
                        // }),
                        Text(
                          'Remember me',
                          style: TextStyle(
                            color: gry,
                            fontSize: 12.sp,
                          ),
                        ),
                        const Spacer(),

                        //Forget Password Button
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(
                              color: darkgren,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 130.h,
                  ),

                  //Text Button of Login
                  Center(
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          provider.login();
                        }
                      },
                      child: Text(
                        'LogIn',
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: darkgren,
                        fixedSize: Size(350.w, 45.h),
                        shape: const StadiumBorder(),
                      ),
                    ),
                  ),

                  //Wrap Sign Up Text Button
                  Center(
                    child: CustWrapButton1(
                      txt1: 'Don\'t have an account',
                      btntxt: 'Sign Up',
                      nxtscreen: SignUp(),
                    ),
                  ),
                ],
              ),
            ),
            // ),
          );
        }));
  }
}
