import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/repsoistries/shared_prefrence_repository.dart';
import 'package:flight_app/features/auth_feature/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Locale locale = getLocal();

    return GetMaterialApp(
      locale: locale,
      debugShowCheckedModeBanner: false,
      title: 'تذكرتي',
      theme: ThemeData(
        textTheme: GoogleFonts.cairoTextTheme(),

        fontFamily: GoogleFonts.cairo().fontFamily,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.transparentColor,
          elevation: 0,
          centerTitle: true,
        ),
        scaffoldBackgroundColor: AppColors.secondwhiteColor,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
        useMaterial3: true,
      ),
      home: SignUpView(),
      builder: (context, child) {
        return Directionality(
          textDirection: locale.languageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: child!,
        );
      },
    );
  }
}

Locale getLocal() {
  String langCode = SharedPrefrenceRepository().getAppLanguge();

  if (langCode == 'ar') {
    return const Locale('ar', 'SA');
  } else if (langCode == 'en') {
    return const Locale('en', 'US');
  } else {
    return const Locale('fr', 'FR');
  }
}
