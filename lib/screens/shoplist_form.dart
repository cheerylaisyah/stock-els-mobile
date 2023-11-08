import 'package:flutter/material.dart';
// TODO: Impor drawer yang sudah dibuat sebelumnya
import 'package:stock_els/widgets/left_drawer.dart';

class ShopFormPage extends StatefulWidget {
    const ShopFormPage({super.key});

    @override
    State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _price = 0;
    int _size = 0;
    int _amount = 0;
    String _description = "";
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Center(
                child: Text(
                    'Form Tambah Item',
                ),
                ),
                backgroundColor: Colors.grey[900],
                foregroundColor: Colors.white,
            ),
            // TODO: Tambahkan drawer yang sudah dibuat di sini
            drawer: const LeftDrawer(),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                hintText: "Nama Item",
                                labelText: "Nama Item",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                ),
                                ),
                                onChanged: (String? value) {
                                setState(() {
                                    _name = value!;
                                });
                                },
                                validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                    return "Nama tidak boleh kosong!";
                                }
                                return null;
                                },
                            ),
                            ),
                            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                hintText: "Harga",
                                labelText: "Harga",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                ),
                                ),
                                // TODO: Tambahkan variabel yang sesuai
                                onChanged: (String? value) {
                                setState(() {
                                    _price = int.parse(value!);
                                });
                                },
                                validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                    return "Harga tidak boleh kosong!";
                                }
                                if (int.tryParse(value) == null) {
                                    return "Harga harus berupa angka!";
                                }
                                return null;
                                },
                            ),
                            ),
                            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                hintText: "Ukuran",
                                labelText: "Ukuran",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                ),
                                ),
                                // TODO: Tambahkan variabel yang sesuai
                                onChanged: (String? value) {
                                setState(() {
                                    _size = int.parse(value!);
                                });
                                },
                                validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                    return "Ukuran tidak boleh kosong!";
                                }
                                if (int.tryParse(value) == null) {
                                    return "Ukuran harus berupa angka!";
                                }
                                return null;
                                },
                            ),
                            ),
                            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                hintText: "Jumlah",
                                labelText: "Jumlah",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                ),
                                ),
                                // TODO: Tambahkan variabel yang sesuai
                                onChanged: (String? value) {
                                setState(() {
                                    _amount = int.parse(value!);
                                });
                                },
                                validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                    return "Jumlah tidak boleh kosong!";
                                }
                                if (int.tryParse(value) == null) {
                                    return "Jumlah harus berupa angka!";
                                }
                                return null;
                                },
                            ),
                            ),
                            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                hintText: "Deskripsi",
                                labelText: "Deskripsi",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                ),
                                ),
                                onChanged: (String? value) {
                                setState(() {
                                    // TODO: Tambahkan variabel yang sesuai
                                    _description = value!;
                                });
                                },
                                validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                    return "Deskripsi tidak boleh kosong!";
                                }
                                return null;
                                },
                            ),
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(Colors.green[900]),
                                        ),
                                        onPressed: () {
                                            if (_formKey.currentState!.validate()) {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                return AlertDialog(
                                                    title: const Text('Item berhasil tersimpan!'),
                                                    content: SingleChildScrollView(
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                        children: [
                                                        Text('Nama: $_name'),
                                                        Text('Harga: $_price'),
                                                        Text('Ukuran: $_size'),
                                                        Text('Jumlah: $_amount'),
                                                        Text('Deskripsi: $_description'),
                                                        // TODO: Munculkan value-value lainnya
                                                        ],
                                                    ),
                                                    ),
                                                    actions: [
                                                    TextButton(
                                                        child: const Text('OK'),
                                                        onPressed: () {
                                                        Navigator.pop(context);
                                                        },
                                                    ),
                                                    ],
                                                );
                                                },
                                            );
                                            _formKey.currentState!.reset();
                                            }
                                        },
                                        child: const Text(
                                            "Save",
                                            style: TextStyle(color: Colors.white),
                                        ),
                                    ),
                                ),
                            ),
                        ]
                    )
                ),
            ),
        );
    }
}