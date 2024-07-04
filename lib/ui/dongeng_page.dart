import 'package:flutter/material.dart';
import '../model/penulis.dart'; // Sesuaikan path dengan lokasi model Penulis
import 'dongeng_detail.dart';
import 'dongeng_form.dart';
import 'dongeng_item.dart';

class DongengPage extends StatefulWidget {
  const DongengPage({Key? key}) : super(key: key);

  @override
  State<DongengPage> createState() => _DongengPageState();
}

class _DongengPageState extends State<DongengPage> {
  final List<Penulis> _dongengList = [
    Penulis(
      judulDongeng: "Kancil dan Buaya",
      author: 'Rahimidin Zahari ',
      cerita:
          'Cerita tentang Kancil dan Buaya. pada suatu hari kancil ingin menyebrangi sungai tetapi didalam sungai itu terdapat buaya yang cukup banyak. kancil pun berfikir bagaimana agar bisa melewati sungai itu, akhirnya kancil pun mempunyai ide yaitu dengan cara membohongi buaya tersebut. kancil pun beraksi, kancil berkata "wahai buaya saya dapat gambar gembira , akan ada pesta besar dikerajaan, dan saya akan menyampaikan pesan ini kepasa sang raja, saya ingin menyebrangi sungai tolong bantu aku," buaya pun menurutinya.',
      gambarUrl: 'lib/asset/my_image.jpeg', 
    ),
    Penulis(
      judulDongeng: "Malin Kundang",
      author: 'A.A Navis',
      cerita: 'Cerita tentang Malin Kundang..heugffgeufgufheugfeufeuhuh.',

      gambarUrl: 'lib/asset/malinkundang.jpeg', 
    ),
    // Tambahkan objek Penulis lainnya sesuai kebutuhan
  ];

  void _addDongeng(Penulis dongeng) {
    setState(() {
      _dongengList.add(dongeng);
    });
  }

  Future<void> _navigateToForm({Penulis? penulis, int? index}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DongengForm(penulis: penulis),
      ),
    );

    if (result != null && result is Penulis) {
      if (index == null) {
        _addDongeng(result);
      } 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 230, 31, 140),
        title: const Text("Data Dongeng"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () => _navigateToForm(),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _dongengList.length,
        itemBuilder: (context, index) {
          return DongengItem(
            dongeng: _dongengList[index],
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DongengDetail(
                  dongeng: _dongengList[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
