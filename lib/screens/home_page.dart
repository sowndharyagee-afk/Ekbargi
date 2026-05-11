import 'package:flutter/material.dart';
import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // 3 TAB: Complaint, Forum, Profile
  final List<Widget> _pages = [
    const ComplaintPage(),
    const ForumPage(), 
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ekbargi'),
        backgroundColor: const Color(0xFFFF9933),
        automaticallyImplyLeading: false,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFFF9933),
        onTap: (index) {
          setState(() => _selectedIndex = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.report_problem),
            label: 'Complaint',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: 'Forum',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// TAB 1: COMPLAINT PAGE
class ComplaintPage extends StatelessWidget {
  const ComplaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Shikayat Darj Karein',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: const Icon(Icons.lightbulb, color: Colors.orange),
              title: const Text('Bijli ki Samasya'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Yaha complaint form khulega - Agle version me
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('V2 me aayega bhai')),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.water_drop, color: Colors.blue),
              title: const Text('Paani ki Samasya'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('V2 me aayega bhai')),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.construction, color: Colors.brown),
              title: const Text('Sadak/Gaddha'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('V2 me aayega bhai')),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Nayi Shikayat'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF9933),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// TAB 2: FORUM PAGE  
class ForumPage extends StatelessWidget {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Community Forum',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Card(
          child: ListTile(
            leading: const CircleAvatar(child: Text('A')),
            title: const Text('Ankit Kumar'),
            subtitle: const Text('Ward 12 me 3 din se light nahi hai. Koi update?'),
            trailing: const Text('2h'),
          ),
        ),
        Card(
          child: ListTile(
            leading: const CircleAvatar(child: Text('S')),
            title: const Text('Sunita Devi'),
            subtitle: const Text('Nagar nigam ka number kisi ke paas hai?'),
            trailing: const Text('5h'),
          ),
        ),
        const SizedBox(height: 20),
        const Center(child: Text('V2 me asli forum aayega', style: TextStyle(color: Colors.grey))),
      ],
    );
  }
}

// TAB 3: PROFILE PAGE
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = supabase.auth.currentUser;
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFFFF9933),
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 20),
          const Text(
            'User Details',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Email'),
              subtitle: Text(user?.email ?? 'Nahi mila'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.verified_user),
              title: const Text('User ID'),
              subtitle: Text(user?.id.substring(0, 8) ?? 'Nahi mila'),
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () async {
                await supabase.auth.signOut();
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
