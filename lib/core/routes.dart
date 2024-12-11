import 'package:carplay_flutter/screens/profile_screen.dart';
import 'package:carplay_flutter/screens/search_screen.dart';
import 'package:carplay_flutter/screens/voice_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import '../screens/loading_screen.dart';
import '../screens/home_screen.dart';

// Router yapılandırması
final router = GoRouter(
  initialLocation: '/',  // Başlangıç rotası
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoadingScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder:(context, state) => const ProfileScreen(),
      
    ),
    GoRoute(
      path: '/voice',
      builder:(context, state) => const VoiceScreen(),
    ),

    GoRoute(
      path: '/screen',
      builder:(context, state) => const SearchScreen(),
    ),
  ],


);

 

