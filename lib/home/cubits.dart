import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textmatemd/home/models.dart';
import 'package:textmatemd/home/models.dart';
import 'package:textmatemd/home/states.dart';

import 'models.dart';
import 'models.dart';

class HomeController extends Cubit<HomeStates>{
  HomeController() : super(HomeIntial());
  static HomeController of (context) =>BlocProvider.of(context);
  // HomeModel? HomeModels;
  String? age;
   String? number;
   String? named;
   String? phone;
  String? age0;
  String? number0;
  String? named0;
  String? phone0;

  Future <void>GetItems() async{

    print('aaaaaaaaaaaa');
    emit(HomeLoading());
    final data= await FirebaseFirestore.instance
        .collection('users')
        .doc('jack')
        .get();
     age=data['age'] ;
     number=data['namber'] ;
     named=data['named'] ;
      phone=data['phone'] ;
//      Name=named;

    print(age);
    // print(Name.toString()+'0124566qqqqqqqqqqqqqqqqqqqqqqqqqq');
    print(number.toString()+'124566qqqqqqqqqqqqqqqqqqqqqqqqqq');
    print(phone.toString()+'124566qqqqqqqqqqqqqqqqqqqqqqqqqq');

    emit(HomeIntial());
  }
  Future <void>GetDetals(index) async{

    print('aaaaaaaaaaaa');
    emit(HomeLoading());
    final data= await FirebaseFirestore.instance
        .collection('users').get();

    age0=data.docs[index]['age'] ;
     number0=data.docs[index]['namber'] ;
     named0=data.docs[index]['named'] ;
      phone0=data.docs[index]['phone'] ;
//      Name=named;

    print(age0);
    // print(Name.toString()+'0124566qqqqqqqqqqqqqqqqqqqqqqqqqq');
    print(number0.toString()+'124566qqqqqqqqqqqqqqqqqqqqqqqqqq');
    print(phone0.toString()+'124566qqqqqqqqqqqqqqqqqqqqqqqqqq');

    emit(HomeIntial());
  }



}