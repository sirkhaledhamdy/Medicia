import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textmatemd/home/cubits.dart';
import 'package:textmatemd/home/view.dart';
import 'package:textmatemd/login/components/header.dart';
import 'package:textmatemd/login/components/loginBlock.dart';
import 'package:textmatemd/login/cubits/LoginController.dart';
import 'package:textmatemd/login/states/states.dart';
import 'package:textmatemd/signup/view.dart';
import 'package:textmatemd/widgets/textButtonColor.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  // final formKey = GlobalKey<FormState>();
  // TextEditingController _Emailcontroller = TextEditingController();
  // TextEditingController _Passcontroller = TextEditingController();
  // LoginController _loginController = LoginController();
  bool isPasswordShow = false;


  @override
  Widget build(BuildContext context) {
    // final login = LoginController.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [


          LoginHeader(),
          LoginBlock(),
          // BlocBuilder(
          //   bloc: HomeController.of(context),
          //   builder: (context, state) {
          //     return TextButton(onPressed: () {
          //       HomeController.of(context)
          //         .GetItems();
          //     }
          //         , child: Text("teee"));
          //   },
          // ),
          // TextButton(onPressed: () {
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (context) => HomeView()));
          // }, child: Text("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa")),
          // // TextButtonName("Dont have an Accont? ", "Sign up",
          //     Colors.purpleAccent, SignUpView()),
        ],
      ),
    );
  }
}

