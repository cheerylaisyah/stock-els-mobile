import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:stock_els/models/item.dart';
import 'package:stock_els/screens/menu.dart';
import 'package:stock_els/widgets/left_drawer.dart';

class ItemPage extends StatefulWidget {
    const ItemPage({Key? key}) : super(key: key);

    @override
    _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
    Future<List<Item>> fetchItem() async {
        var url = Uri.parse('http://127.0.0.1:8000/json/');
        var response = await http.get(url, headers: {"Content-Type": "application/json"});

        var data = jsonDecode(utf8.decode(response.bodyBytes));
        List<Item> list_item = [];
        for (var d in data) {
            if (d != null) {
                list_item.add(Item.fromJson(d));
            }
        }
        return list_item;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Daftar Item'),
            ),
            drawer: const LeftDrawer(),
            body: FutureBuilder(
                future: fetchItem(),
                builder: (context, AsyncSnapshot<List<Item>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                            child: Text(
                                "Tidak ada data produk.",
                                style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                            ),
                        );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) {
                            var item = snapshot.data![index];
                            return InkWell(
                                onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyHomePage(), // changethis!
                                        ),
                                    );
                                },
                                child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                    Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.price}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.description}"),
                                        ],
                                    ),
                                ),
                            );
                        },
                    );
                },
            ),
        );
    }
}
