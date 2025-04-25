import 'constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/userList/user_list_screen.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        scaffoldMessengerKey: scaffoldKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: colorPrimary),
          scaffoldBackgroundColor: colorMainBackground,
          appBarTheme: AppBarTheme(backgroundColor: colorPrimary, surfaceTintColor: colorPrimary),
        ),
        debugShowCheckedModeBanner: false,
        home: const UserListScreen(),
      ),
    );
  }
}
