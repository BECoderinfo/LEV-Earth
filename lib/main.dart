import 'package:lvb_earth_admin/imports/imports.dart';

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
      initialRoute: AppRoutes.meetingList,
    );
  }
}
