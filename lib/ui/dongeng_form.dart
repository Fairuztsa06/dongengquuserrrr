import 'package:flutter/material.dart';
import '../model/penulis.dart'; // Pastikan path menuju model Penulis sudah benar

class DongengForm extends StatefulWidget {
  final Penulis? penulis;

  const DongengForm({Key? key, this.penulis}) : super(key: key);

  @override
  State<DongengForm> createState() => _DongengFormState();
}

class _DongengFormState extends State<DongengForm> {
  final _formKey = GlobalKey<FormState>();
  late String _judulDongeng;
  late String _author;
  late String _cerita; // Tambahkan variabel untuk cerita

  @override
  void initState() {
    super.initState();
    _judulDongeng = widget.penulis?.judulDongeng ?? '';
    _author = widget.penulis?.author ?? '';
    _cerita = widget.penulis?.cerita ?? ''; // Inisialisasi cerita jika tersedia
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final penulis = Penulis(
        judulDongeng: _judulDongeng,
        author: _author,
        cerita: _cerita,
        gambarUrl: '', // Sesuaikan jika ada properti gambarUrl
      );
      Navigator.of(context).pop(penulis);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir Dongeng'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _judulDongeng,
                decoration: const InputDecoration(labelText: 'Judul Dongeng'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Judul dongeng tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) {
                  _judulDongeng = value!;
                },
              ),
              TextFormField(
                initialValue: _author,
                decoration: const InputDecoration(labelText: 'Author'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Author tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) {
                  _author = value!;
                },
              ),
              TextFormField(
                initialValue: _cerita,
                decoration: const InputDecoration(labelText: 'Cerita'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Cerita tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) {
                  _cerita = value!;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveForm,
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
