import 'package:flutter/material.dart';
import 'package:stock_els/screens/shoplist_form.dart';
import 'package:stock_els/screens/menu.dart';

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
                // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Tambah Item") {
            // TODO: Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShopFormPage()),
          );
          }
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
