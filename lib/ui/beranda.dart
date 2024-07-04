import 'package:flutter/material.dart';
import 'ulasan_page.dart'; // Sesuaikan path sesuai dengan struktur proyek Anda
import '../widget/sidebar.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text("Beranda"),
        backgroundColor: const Color.fromARGB(255, 250, 244, 249),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 182, 44, 90),
                    Color.fromARGB(255, 245, 147, 193),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selamat Datang, Teman-temanku!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Ini adalah beranda cerita dongeng kita",
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  _buildDashboardItem(
                    icon: Icons.home,
                    title: "Beranda",
                    onTap: () {},
                  ),
                  _buildDashboardItem(
                    icon: Icons.shutter_speed,
                    title: "Dongeng",
                    onTap: () {},
                  ),
                  _buildDashboardItem(
                    icon: Icons.book,
                    title: "Ulasan",
                    onTap: () {
                      // Navigasi ke halaman untuk memberikan ulasan
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UlasanPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardItem(
      {required IconData icon, required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [Colors.white, Colors.blue[50]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 100, color: const Color.fromRGBO(238, 197, 218, 1)),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(190, 117, 8, 32),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
