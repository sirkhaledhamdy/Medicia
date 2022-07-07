import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:textmatemd/HomeLayout/cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:textmatemd/HomeLayout/view.dart';
import 'package:textmatemd/addressDetails/addressDetailsView.dart';
import 'package:textmatemd/cart/cartsView.dart';
import 'package:textmatemd/cart/cubits/cubits.dart';
import 'package:textmatemd/contactUs/contactUsView.dart';
import 'package:textmatemd/core/shared_helper.dart';
import 'package:textmatemd/editProfile/cubits/cubits.dart';
import 'package:textmatemd/editProfile/editProfileView.dart';
import 'package:textmatemd/favourite/cubits/cubits.dart';
import 'package:textmatemd/getStorage.dart';
import 'package:textmatemd/home/cubits.dart';
import 'package:textmatemd/home/view.dart';
import 'package:textmatemd/location/cubits/cubits.dart';
import 'package:textmatemd/location/mapView.dart';
import 'package:textmatemd/login/cubits/LoginController.dart';
import 'package:textmatemd/login/view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:textmatemd/notifications/notificationsView.dart';
import 'package:textmatemd/pageView/pageViews.dart';
import 'package:textmatemd/products/products1/cubits/cubits.dart';
import 'package:textmatemd/products/products1/productsView.dart';
import 'package:textmatemd/products/products2/cubits/cubits.dart';
import 'package:textmatemd/products/products3/cubits/cubits.dart';
import 'package:textmatemd/productsDetails/productsDetailsView.dart';
import 'package:textmatemd/setting/settingView.dart';
import 'package:textmatemd/splash/splashView.dart';
import 'package:textmatemd/test.dart';
import 'addressDetails/verfiyOrder/verfiyOrderView.dart';
import 'cheekOut/cheekOutView.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedHelper.init();
  await GetStorage.init();
  await Get.put(Database()).initStorage();

  await Firebase.initializeApp();


  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/langs',
        // <-- change the path of the translation files
        fallbackLocale: Locale('ar'),
        saveLocale: true,

        child: MyApp()
    ),
  );
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    context.setLocale(Locale("ar"));

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginController(),

        ),
        BlocProvider(
          create: (context) => HomeController()..GetItems(),

        ),
        BlocProvider(
          create: (context) => SubjectCubit()..checkGps(),

        ),
        BlocProvider(
          create: (context) => RealTimeController()..get(),

        ),
        BlocProvider(
          create: (context) => RealTimeController2()..get(),

        ),
        BlocProvider(
          create: (context) => RealTimeController3()..get(),

        ),
        BlocProvider(
          create: (context) => FavouriteController(),

        ),
        BlocProvider(
          create: (context) => CartsController(),

        ),
        BlocProvider(
          create: (context) => AddressDetailsController(),

        ),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
            fontFamily: "Anton",
            textTheme: TextTheme(

              headline1: ArabicFonts.cairo(textStyle: TextStyle()),
              headline6: ArabicFonts.cairo(textStyle: TextStyle()),
              bodyText2: ArabicFonts.cairo(textStyle: TextStyle()),

            )


        ),

        home:SplashView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
