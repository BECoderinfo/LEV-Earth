import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lvb_earth_admin/routes/app_routes.dart';
import 'package:lvb_earth_admin/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'LVB Earth Admin',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.splash,
    );
  }
}
