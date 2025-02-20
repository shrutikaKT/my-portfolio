import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/screens/about_me/bloc/about_bloc.dart';
import 'package:portfolio/screens/dashboard/dashboard.dart';
import 'package:portfolio/screens/experiance/bloc/experiance_bloc.dart';
import 'package:portfolio/screens/header/bloc/header_bloc.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/routes.dart';

const initialTheme = AdaptiveThemeMode.light;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(App(initialTheme: initialTheme));
  });
}

// final Color primaryColor = initialTheme == AdaptiveThemeMode.dark
//     ? Color(0xFF68FFDB)
//     : Color(0XFF3B1C32);
// final Color secondaryColor = initialTheme == AdaptiveThemeMode.dark
//     ? Color(0xFFEAE2C6)
//     : Color(0XFFA64D79);

GlobalKey aboutmeKey = GlobalKey();
GlobalKey experianceKey = GlobalKey();
GlobalKey portfolioKey = GlobalKey();
GlobalKey contactKey = GlobalKey();
GlobalKey helloKey = GlobalKey();
GlobalKey headerKey = GlobalKey();

class App extends StatelessWidget {
  final AdaptiveThemeMode initialTheme;
  App({super.key, required this.initialTheme});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(1200, 800), // Base design (width, height)
        minTextAdapt: true,
        builder: (context, child) => buildHomeApp());
  }

  AdaptiveTheme buildHomeApp() {
    return AdaptiveTheme(
      light: _buildLightTheme(),
      dark: _buildDarkTheme(),
      debugShowFloatingThemeButton: false,
      initial: initialTheme,
      builder: (light, dark) {
        return _buildMultiBlocProvider(light, dark);
      },
    );
  }

  ThemeData _buildDarkTheme() {
    final Color primaryColor = 
    Color(0xFF68FFDB);
final Color secondaryColor = Color(0xFFEAE2C6);
    return ThemeData(
        brightness: Brightness.dark,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Color(0XFF0C192D),
        fontFamily: Constants().fontFamily,
        iconTheme: IconThemeData(color: Colors.white70),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: primaryColor,
        ),
        colorScheme: ColorScheme.dark(
          primary: primaryColor,
          secondary: secondaryColor,
          surface: Colors.grey[900]!,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
        ),
        textTheme: TextTheme(
          bodySmall: TextStyle(fontSize: 12.spMax),
          bodyMedium: TextStyle(fontSize: 14.spMax),
          bodyLarge: TextStyle(fontSize: 16.spMax),
          displayLarge: TextStyle(fontSize: 48.spMax, color: Colors.white),
          titleLarge: TextStyle(fontSize: 28.spMax),
          titleMedium: TextStyle(fontSize: 22.spMax),
          titleSmall: TextStyle(fontSize: 20.spMax),
          headlineMedium:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(color: Colors.white60),
        ),
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: primaryColor,
        //     foregroundColor: Colors.black,
        //     textStyle: TextStyle(color: Colors.black),
        //     shape:
        //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        //   ),
        // ),
        filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.black,
          textStyle: TextStyle(
            color: Colors.black,
          ),
        )),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
          side: BorderSide(color: primaryColor),
          iconColor: Colors.grey,
          textStyle: TextStyle(
            color: primaryColor,
          ),
        )),
        dividerColor: Colors.grey,
        iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom()),
        primaryTextTheme:
            TextTheme(bodyMedium: TextStyle(color: Colors.white)));
  }

  ThemeData _buildLightTheme() {
    final Color primaryColor = Color(0XFF3B1C32);
final Color secondaryColor =  Color(0XFFA64D79);
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: Constants().fontFamily,
        iconTheme: IconThemeData(color: Colors.black87),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: primaryColor,
        ),
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
          surface: Colors.grey[200]!,
          onPrimary: Colors.black,
          onSecondary: Colors.black,
          onSurface: Colors.black,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 16.spMax),
          bodySmall: TextStyle(fontSize: 12.spMax),
          bodyMedium: TextStyle(fontSize: 14.spMax),
          displayLarge: TextStyle(fontSize: 48.spMax, color: Colors.black),
          titleLarge: TextStyle(fontSize: 28.spMax),
          titleMedium: TextStyle(fontSize: 22.spMax),
          titleSmall: TextStyle(fontSize: 20.spMax),
          headlineMedium:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(color: Colors.black87),
        ),
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: primaryColor,
        //     foregroundColor: Colors.white,
        //   ),
        // ),
        filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
        )),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
          side: BorderSide(color: primaryColor),
          textStyle: TextStyle(color: primaryColor),
          iconColor: Colors.blue
        )),
        dividerColor: Colors.black87,
        primaryTextTheme:
            TextTheme(bodyMedium: TextStyle(color: Colors.black)));
  }

  MultiBlocProvider _buildMultiBlocProvider(ThemeData light, ThemeData dark) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AboutBloc>(create: (_) => AboutBloc()),
        BlocProvider<ExperianceBloc>(create: (_) => ExperianceBloc()),
        BlocProvider<HeaderBloc>(create: (_) => HeaderBloc()),
      ],
      child: _buildGetMaterialApp(light, dark),
    );
  }

  MaterialApp _buildGetMaterialApp(ThemeData light, ThemeData dark) {
    return MaterialApp(
      theme: light,
      darkTheme: dark,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      initialRoute: ApplicationRoutes.dashboard,
      routes: _initialRoutes,
    );
  }

  @visibleForTesting
  Map<String, WidgetBuilder> get initialRoutes => _initialRoutes;
  final _initialRoutes = {
    ApplicationRoutes.dashboard: (context) {
      return SafeArea(child: Dashboard());
    },
  };
}
