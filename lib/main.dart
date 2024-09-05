import 'package:eshop/src/app/controllers/profile/profile_pro.dart';
import 'package:eshop/src/app/presentation/screens/splash/splash_screen.dart';
import 'package:eshop/src/app/presentation/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // <------------------------  PROFILE PROVIDER ------------------------>
          ChangeNotifierProvider<ProfilePro>(create: (_) => ProfilePro()),
        ],
        child: MaterialApp(
          title: 'E-Shop App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Poppins-Regular",
            primaryColor: kPrimaryColor,
            useMaterial3: true,
          ),
          home: const SplashScreen(),
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
        ));
  }
}
