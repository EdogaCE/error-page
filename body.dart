// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:abcc/Dashboard/Doctor/bottom_nav.dart';
import 'package:abcc/Dashboard/Doctor/custom-app-bar.dart';
import 'package:abcc/components/api.dart';
import 'package:abcc/components/text_field_container.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_auth/Screens/Doctor/Login_Doc/components/background.dart';
// import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:abcc/Screens/Login_Doc/components/background.dart';
// import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:abcc/Screens/Signup_Doc/signup_screen.dart';
import 'package:abcc/Screens/resetpassword.dart';
import 'package:abcc/components/already_have_an_account_acheck.dart';
import 'package:abcc/components/rounded_button.dart';
import 'package:abcc/components/rounded_input_field.dart';
import 'package:abcc/components/rounded_password_field.dart';
// import 'package:abcc/constants.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
// import 'dart:ui';

import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  // final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // final String hintText;
  // final TextEditingController _emailController = TextEditingController();
  // final IconData icon;
  late final ValueChanged<String> onChanged;
  MultiValidator? validator;
  bool hidePassword = true;
  bool _isLoading = false;

  final url = 'https://medicalapp10.herokuapp.com/doctorLogin';

  postData() async {
    Map data = {
      "email": emailController.text,
      "password": passwordController.text,
    };
    var jsonData;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(url), body: data);
    // ignore: avoid_print
    print(response.body);
    if (_formKey.currentState!.validate()) {
      // Sign up form is done
      // It saved our inputs
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Processing Data'),
        ),
      );
      await sharedPreferences.setString("token", jsonData.toString());
      if (response.statusCode == 200) {
        jsonData = json.decode(response.body);
        setState(() {
          _isLoading = false;

          // jsonData.toString;
        });

        //  Sign in also done
      }

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            // ignore: prefer_const_constructors
            builder: (BuildContext context) => BottomNav(),
          ),
          (Route<dynamic> route) => false);
    } else {
      print(response.body);
    }
  }

  late String _email, _password;
  ScaffoldMessengerState? scaffoldMessenger;
// class Body extends StatelessWidget {
//   const Body({
//     Key key,
//   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "LOGIN",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: size.height * 0.03),
                    SvgPicture.asset(
                      "assets/icons/login.svg",
                      height: size.height * 0.25,
                    ),
                    SizedBox(height: size.height * 0.03),
                    TextFieldContainer(
                      child: TextFormField(
                        controller: emailController,
                        onChanged: (value) {},
                        cursorColor: kPrimaryColor,
                        validator:
                            EmailValidator(errorText: "Use a valid email!"),
                        // onSaved: (email) => _email = email!,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: kPrimaryColor,
                          ),
                          hintText: "Put your email here",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: hidePassword,
                        onChanged: (value) {},
                        cursorColor: kPrimaryColor,
                        // validator: passwordValidator,
                        onSaved: (password) => _password = password!,
                        decoration: InputDecoration(
                          hintText: "Password",
                          icon: const Icon(
                            Icons.lock,
                            color: kPrimaryColor,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            icon: Icon(hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                            color: kPrimaryColor,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     // TextButton(
                    //     //   onPressed: () {},
                    //     //   child: Text("Forgot Password"),
                    //     // ),
                    //   ],
                    // ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ResetPasswordScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 50),
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    RoundedButton(
                      text: "LOGIN",
                      press: postData,
                    ),
                    SizedBox(height: size.height * 0.02),
                    AlreadyHaveAnAccountCheck(
                      press: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const SignUpDoctor();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
        ),
      ),
    );
  }

//   login(email, password) async {
//     Map data = {'email': email, 'password': password};
//     print(data.toString());
//     final response = await http.post(Uri.parse("$Root/api/doctorLogin"),
//         headers: {
//           "Accept": "application/json",
//           "Content-Type": "application/x-www-form-urlencoded"
//         },
//         body: data,
//         encoding: Encoding.getByName("utf-8"));
//     setState(() {
//       isLoading = false;
//     });
//     if (response.statusCode == 200) {
//       Map<String, dynamic> resposne = jsonDecode(response.body);
//       if (!resposne['error']) {
//         Map<String, dynamic> user = resposne['data'];
//         print(" User name ${user['id']}");
//         savePref(1, user['name'], user['email'], user['id']);

//         Navigator.pushReplacementNamed(context, "/home");
//       } else {
//         print(" ${resposne['message']}");
//       }
//       scaffoldMessenger
//           ?.showSnackBar(SnackBar(content: Text("${resposne['message']}")));
//     } else {
//       scaffoldMessenger
//           ?.showSnackBar(SnackBar(content: Text("Please try again!")));
//     }
//   }

//   savePref(int value, String name, String email, int id) async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();

//     preferences.setInt("value", value);
//     preferences.setString("name", name);
//     preferences.setString("email", email);
//     preferences.setString("id", id.toString());
//     preferences.commit();
//   }
// }
}
