import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist),
        ShopItem("Tambah Item", Icons.add_shopping_cart),
        ShopItem("Logout", Icons.logout),
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text(
                'Stock Els',
                style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.grey[900],
                elevation: 5, // Control the shadow depth
                shadowColor: Colors.black, // Color of the shadow
            ),
            body: SingleChildScrollView(
                // Widget wrapper yang dapat discroll
                child: Padding(
                    padding: const EdgeInsets.all(10.0), // Set padding dari halaman
                    child: Column(
                        // Widget untuk menampilkan children secara vertikal
                        children: <Widget>[
                            const Padding(
                                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                                child: Text(
                                    'Stock Els Shop', // Text yang menandakan toko
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),
                            ),
                            // Grid layout
                            GridView.count(
                                // Container pada card kita.
                                primary: true,
                                padding: const EdgeInsets.all(20),
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                crossAxisCount: 3,
                                shrinkWrap: true,
                                children: items.map((ShopItem item) {
                                    // Iterasi untuk setiap item
                                    return ShopCard(item);
                                }).toList(),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}

class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}

class ShopCard extends StatelessWidget {
   final ShopItem item;

   const ShopCard(this.item, {super.key});

   @override
   Widget build(BuildContext context) {
    var buttonColor;
    if (item.name.compareTo("Lihat Item") == 0) {
      buttonColor= Colors.pink[900];
    }
    else if (item.name.compareTo("Tambah Item") == 0) {
      buttonColor= Colors.pink[700];
    }
    else if (item.name.compareTo("Logout") == 0) {
      buttonColor= Colors.grey[700];
    }

    return Material(
      color: buttonColor, 
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white, // Set warna text icon menjadi putih
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
