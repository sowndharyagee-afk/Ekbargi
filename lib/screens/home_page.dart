import 'package:flutter/material.dart';
import '../main.dart';
import 'auth_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ekbargi - Home'),
        backgroundColor: const Color(0xFFFF9933),
        automaticallyImplyLeading: false, // Back button hata de
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'V1 LIVE HO GAYA BHAI! 🔥',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Email: ${supabase.auth.currentUser?.email}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                await supabase.auth.signOut();
                // StreamBuilder apne aap Login pe bhej dega
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
