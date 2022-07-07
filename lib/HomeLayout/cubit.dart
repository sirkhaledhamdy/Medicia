import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textmatemd/HomeLayout/states.dart';
import 'package:textmatemd/cart/cartsView.dart';
import 'package:textmatemd/favourite/favouriteView.dart';
import 'package:textmatemd/header_icons.dart';
import 'package:textmatemd/home/view.dart';
import 'package:textmatemd/notifications/notificationsView.dart';
import 'package:textmatemd/setting/settingView.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(HomeLayoutInit());

  static HomeLayoutCubit of(context) => BlocProvider.of(context);

  int currentIndex = 0;

  final List<List<dynamic>> screens = [
    [Header.home, HomeView(), "الرئسية"],
    [Header.database, NotificationsView(), "الاشعارات"],
    [Header.heart, FavouriteView(), "المفضلة"],
    [Header.cog, SettingView(), "المزيد"],
  ];

  void changeIndex(int value) {
    if (currentIndex == value) return;
    currentIndex = value;
    emit(HomeLayoutInit());
  }

  Widget get getCurrentView => screens[currentIndex][1];
}
