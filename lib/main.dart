import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/auth_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: 'https://dzjwbvdhdlkuxeacftcr.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR6andidmRoZGxrdXhlYWNmdGNyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzgyMjQ2ODYsImV4cCI6MjA5MzgwMDY4Nn0.9KK7i81VEDJLhYaDTOjiCqPKpfYVGf-Q1uluH4DRvNU',
  );
  
  runApp(const EKbargiApp());
}

final supabase = Supabase.instance.client;

class EKbargiApp extends StatelessWidget {
  const EKbargiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EKbargi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF9933), // Saffron
          primary: const Color(0xFFFF9933),
          secondary: const Color(0xFF000080), // Navy
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFF9933),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF9933),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFFF9933), width: 2),
          ),
        ),
      ),
      home: const AuthScreen(),
    );
  }
}