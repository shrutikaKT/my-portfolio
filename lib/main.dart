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
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  const initialTheme = AdaptiveThemeMode.dark;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(App(initialTheme: initialTheme));
  });
}

final Color primaryColor = Color(0xFF68FFDB); // Light Blue
final Color secondaryColor = Color(0xFFEAE2C6); // Beige
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
    return buildHomeApp();
  }

  AdaptiveTheme buildHomeApp() {
    return AdaptiveTheme(
      light: _buildLightTheme(),
      dark: _buildDarkTheme(),
      debugShowFloatingThemeButton: false,
      initial: AdaptiveThemeMode.dark,
      builder: (light, dark) {
        return _buildMultiBlocProvider(light, dark);
      },
    );
  }

  ThemeData _buildDarkTheme() {
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
        headlineMedium:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(color: Colors.black87),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.black,
          textStyle: TextStyle(color: Colors.black),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
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
        textStyle: TextStyle(
          color: primaryColor,
        ),
      )),
      iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom()),
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
        useMaterial3: false,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.red,
        fontFamily: Constants().fontFamily,
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary));
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

  ScreenUtilInit _buildGetMaterialApp(ThemeData light, ThemeData dark) {
    return ScreenUtilInit(
      designSize: Size(1200, 800), // Base design (width, height)
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        theme: light,
        darkTheme: dark,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        initialRoute: ApplicationRoutes.dashboard,
        routes: _initialRoutes,
      ),
    );
  }

  @visibleForTesting
  Map<String, WidgetBuilder> get initialRoutes => _initialRoutes;
  final _initialRoutes = {
    ApplicationRoutes.dashboard: (context) {
      return Dashboard();
    },
  };
}
