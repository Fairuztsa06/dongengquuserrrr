import 'package:flutter/material.dart';
import '../model/penulis.dart';

class DongengDetail extends StatelessWidget {
  final Penulis dongeng;

  const DongengDetail({
    Key? key,
    required this.dongeng,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dongeng.judulDongeng),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dongeng.judulDongeng,
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 16.0),
            Text(
              "Penulis: ${dongeng.author}",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 16.0),
            if (dongeng.gambarUrl!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Image.network(
                  dongeng.gambarUrl!, // URL gambar dari objek Penulis
                  width: MediaQuery.of(context).size.width, // Sesuaikan lebar gambar
                  fit: BoxFit.cover, // Penyesuaian gambar
                ),
              ),
            const SizedBox(height: 16.0),
            Text(
              dongeng.cerita,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 16.0),
            // Komentar atau hapus bagian ini untuk menghilangkan tombol "Hapus" dan "Edit"
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     ElevatedButton(
            //       onPressed: onDelete,
            //       child: const Text('Hapus'),
            //     ),
            //     ElevatedButton(
            //       onPressed: () async {
            //         final updatedDongeng = await Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => DongengForm(penulis: dongeng),
            //           ),
            //         );
            //         if (updatedDongeng != null && updatedDongeng is Penulis) {
            //           onUpdate(updatedDongeng);
            //         }
            //       },
            //       child: const Text('Edit'),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
