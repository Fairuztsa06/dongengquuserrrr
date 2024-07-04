// file: model/penulis.dart

class Penulis {
  final String judulDongeng;
  final String author;
  final String cerita;
  final String? gambarUrl; // Gunakan tipe nullable untuk gambar

  Penulis({
    required this.judulDongeng,
    required this.author,
    required this.cerita,
    this.gambarUrl, // Jadikan gambarUrl sebagai parameter opsional
  });
}

