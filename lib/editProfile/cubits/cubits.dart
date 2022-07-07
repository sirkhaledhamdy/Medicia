import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:textmatemd/editProfile/states/states.dart';
import 'package:textmatemd/home/models.dart';
import 'package:textmatemd/home/models.dart';
import 'package:textmatemd/home/states.dart';

import '../../getStorage.dart';


class AddressDetailsController extends Cubit<AddressDetailsStates>{
  AddressDetailsController() : super(AddressDetailsIntial());
  static AddressDetailsController of (context) =>BlocProvider.of(context);
  // HomeModel? HomeModels;
   String? numbers;
   String? nameds;
  late final TextEditingController nameController=TextEditingController();
  late final TextEditingController numberController=TextEditingController();


  SaveAddressDetails(String named,String number) async{
    emit(AddressDetailsLoading());

    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
   await FirebaseFirestore.instance
        .collection('users')
        .doc(named)
        .set({
      'named': named,
      'age': '25',
      'namber': number,
      'phone': '0000000000000000000000000000000100000000001',
    });
    nameController.text=named;
    // Get.find<Database>().storeName(nameController);

    numberController.text=number;

    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');

    emit(AddressDetailsIntial());
  }
//   Future <void>GetDetals(index) async{
//
//     print('aaaaaaaaaaaa');
//     emit(HomeLoading());
//     final data= await FirebaseFirestore.instance
//         .collection('users').get();
//
//     age0=data.docs[index]['age'] ;
//      number0=data.docs[index]['namber'] ;
//      named0=data.docs[index]['named'] ;
//       phone0=data.docs[index]['phone'] ;
// //      Name=named;
//
//     print(age0);
//     // print(Name.toString()+'0124566qqqqqqqqqqqqqqqqqqqqqqqqqq');
//     print(number0.toString()+'124566qqqqqqqqqqqqqqqqqqqqqqqqqq');
//     print(phone0.toString()+'124566qqqqqqqqqqqqqqqqqqqqqqqqqq');
//
//     emit(HomeIntial());
//   }



}