import 'package:flutter/material.dart';
import '../ui/beranda.dart';
import '../ui/login.dart';
import '../ui/dongeng_page.dart';
import '../ui/ulasan_page.dart'; // Pastikan untuk mengimpor UlasanPage dengan benar

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Cerita Dongeng"),
            accountEmail: Text("jangan lupa dibaca ya!"),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Beranda"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Beranda()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shutter_speed),
            title: const Text("Kumpulan Cerita Dongeng"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DongengPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text("Ulasan"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UlasanPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text("Keluar"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
