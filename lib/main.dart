import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'core/routes.dart';
import 'core/themes.dart';
import 'package:flutter/material.dart';
import 'core/routes.dart';
import 'core/themes.dart'; // ✅ TEMALAR DOĞRU ŞEKİLDE İMPORT EDİLDİ


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark; // Varsayılan olarak gece modu açık

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CarPlay',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: _themeMode, // Tema dinamik olacak
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}



class ThemeProvider with ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;

  String get logoAsset =>
      _isDark ? 'assets/logo/logo-orange.png' : 'assets/logo/logo-darkblue.png';
}

const colors = {
  "primary": Color(0xFFFF7043),
  "onPrimary": Color(0xFFFFFFFF),
  "secondary": Color(0xFFFFF3E0),
  "onSecondary": Color(0xFF012169),
  "surface": Color(0xFFFFFFFF),
  "onSurface": Color(0xFF012169),
  "success": Colors.green,
  "error": Colors.red,
  "onError": Colors.white,
};

const darkColors = {
  "primary": Color(0xFF012169),
  "onPrimary": Color(0xFFFFF3E0),
  "secondary": Color(0xFF81D4FA),
  "onSecondary": Color(0xFFFFFFFF),
  "surface": Color.fromARGB(255, 0, 9, 29),
  "onSurface": Color(0xFFFFFFFF),
  "success": Colors.green,
  "error": Colors.red,
  "onError": Colors.white,
};

final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: colors["primary"]!,
    onPrimary: colors["onPrimary"]!,
    secondary: colors["secondary"]!,
    onSecondary: colors["onSecondary"]!,
    error: colors["error"]!,
    onError: colors["onError"]!,
    surface: colors["surface"]!,
    onSurface: colors["onSurface"]!,
  ),
  textTheme: GoogleFonts.openSansTextTheme(),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: darkColors["primary"]!,
    onPrimary: darkColors["onPrimary"]!,
    secondary: darkColors["secondary"]!,
    onSecondary: darkColors["onSecondary"]!,
    error: darkColors["error"]!,
    onError: darkColors["onError"]!,
    surface: darkColors["surface"]!,
    onSurface: darkColors["onSurface"]!,
  ),
  textTheme: GoogleFonts.openSansTextTheme(),
);

