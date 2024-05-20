import 'package:flutter/material.dart';

class Tutorial12Page extends StatefulWidget {
  const Tutorial12Page({Key? key}) : super(key: key);

  @override
  _Tutorial12PageState createState() => _Tutorial12PageState();
}

class _Tutorial12PageState extends State<Tutorial12Page> {
  final List<String> _dataList = [];
  final TextEditingController _controller = TextEditingController();

  void _addData(String data) {
    setState(() {
      _dataList.add(data);
    });
    _controller.clear();
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Tambah Data'),
          content: TextField(
            controller: _controller,
            decoration: const InputDecoration(hintText: 'Masukkan data baru'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _addData(_controller.text);
                Navigator.of(context).pop();
              },
              child: const Text('Tambah'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Tambahkan tombol di bagian atas halaman untuk menambah data
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _showDialog,
              child: const Text('Tambah Data'),
            ),
          ),
          // ListView untuk menampilkan data
          Expanded(
            child: ListView.builder(
              itemCount: _dataList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_dataList[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
