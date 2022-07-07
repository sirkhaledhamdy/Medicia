
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textmatemd/core/shared_helper.dart';
import 'package:textmatemd/login/states/states.dart';


class LoginController extends Cubit<LoginStates> {
  LoginController() : super(LoginIntial());

  static LoginController of (context) =>BlocProvider.of(context);
  late final TextEditingController emailController=TextEditingController();



  Future<String> login(String email , String password)async{
    emit(LoginLoading());
    final response =await Dio().post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBoLF-ErX9MDO6ZKfsOGi5pLUHUBa49fug',
     data:jsonEncode({'email':email ,'password':password,
       'returnSecureToken': true,

     }),
        options: Options(validateStatus: (status) {
          return status! < 500;
        })
     );


    emailController.text=email;
    // print(response.data);

    print('='*8);
    final data =response.data as Map;
    print(data);


    // print('omaar, $data');
    if (data.containsValue(true)) {
      print(data);
      await SharedHelper.setToken(data['idToken']);
      await SharedHelper.setId(data['localId']);
      await SharedHelper.setEmail(data['email']);

      return 'ok';
    } else if (data.toString().contains('INVALID_PASSWORD')){
      return 'كلمه المرور غير صحيحه';

    }else if (data.toString().contains('INVALID_EMAIL')){
      return 'البريد الالكتروني غير موجود';

    }
    else
      emit(LoginIntial());
    print(data);

    return '>>>>error>>>>';



  }
  Future<String> getItems()async{
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqaaaaaaaaaaaa');
    emit(LoginLoading());
    final response =await Dio().get(

       'https://shop-app-dcff6.firebaseio.com/users.json',

        options: Options(validateStatus: (status) {
          return status! < 500;
        })
     );
    // print(response.data+"1111111111111aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    print(jsonEncode(response.data)+"2222222222aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

    print('='*8);
    final data =response.data as Map;
     print('omaaraaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa, $data');
    if (data.containsValue(true)) {
      print(data);
      return 'ok';
    } else if (data.toString().contains('INVALID_PASSWORD')){
      return 'كلمه المرور غير صحيحه';

    }else if (data.toString().contains('INVALID_EMAIL')){
      return 'البريد الالكتروني غير موجود';

    }
    else
      emit(LoginIntial());
    print(data);

    return '>>>>error>>>>';



  }
  Future<String> posts()async{
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqaaaaaaaaaaaa');
    emit(LoginLoading());
    final response =await Dio().post(
      'https://testqqqq-13ccf.firebaseio.com/app.json',
        data:{"namedddddddddddddddddddddd":"facebook"},


        options: Options(validateStatus: (status) {
          return status! < 500;
        })
     );
    print(jsonEncode(response.data)+"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

    print('='*8);
    final data =response.data as Map;
     print('omaaraaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa, $data');
    if (data.containsValue(true)) {
      print(data);
      return 'ok';
    } else if (data.toString().contains('INVALID_PASSWORD')){
      return 'كلمه المرور غير صحيحه';

    }else if (data.toString().contains('INVALID_EMAIL')){
      return 'البريد الالكتروني غير موجود';

    }
    else
      emit(LoginIntial());
    print(data);

    return '>>>>error>>>>';



  }
  Future <void>PutItems() async{
   await FirebaseFirestore.instance
        .collection('users')
        .doc('jack')
        .set({
      'named': 'Aabdelaleems',
      'age':'25',
      'namber':'1',
      'phone':'0100000000001000',
    });
  }
  Future <void> LogOut()async{

  }

 }