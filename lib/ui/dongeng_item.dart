import 'package:flutter/material.dart';
import '../model/penulis.dart'; // Sesuaikan path dengan lokasi model Penulis

class DongengItem extends StatelessWidget {
  final Penulis dongeng;
  final VoidCallback onTap;

  const DongengItem({
    Key? key,
    required this.dongeng,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('URL gambar: ${dongeng.gambarUrl}'); // Tambahkan ini untuk debugging

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: dongeng.gambarUrl!.isNotEmpty
          ? Image.network(
              dongeng.gambarUrl!,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            )
          : Container(
              width: 100,
              height: 100,
              color: Colors.grey,
              child: const Icon(
                Icons.image,
                color: Colors.white,
              ),
            ),
      title: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 230, 185, 202), // Warna latar belakang kotak
          borderRadius: BorderRadius.circular(8.0), // Bentuk border kotak
        ),
        child: Text(
          dongeng.judulDongeng,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      subtitle: Text(dongeng.author), // Tambahkan pengecekan null di sini
      onTap: onTap,
    );
  }
}
