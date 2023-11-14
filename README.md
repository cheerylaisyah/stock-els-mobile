# 👟*Stock Els*


### 📝Tugas 7

<details>
<summary><b>Details</b></summary>

### 1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
- Stateless Widget:

    Stateless widget adalah widget yang tidak memiliki data berubah (state) di dalamnya. Ini berarti widget ini bersifat statis dan tidak dapat berubah selama masa hidupnya.
    Stateless widget cocok digunakan untuk tampilan atau komponen yang tidak perlu menyimpan atau mengubah data selama interaksi pengguna.
    Ketika data dalam widget perlu diubah, Anda perlu membuat widget yang baru dengan properti atau data yang berbeda.
- Stateful Widget:

    Stateful widget adalah widget yang dapat memiliki data berubah (state) di dalamnya. Data dalam widget ini bisa diubah selama masa hidupnya.
    Stateful widget cocok digunakan untuk komponen yang memerlukan interaksi dan perubahan data selama pengguna berinteraksi dengan aplikasi.
    Stateful widget menggunakan objek yang disebut "State" untuk menyimpan data yang dapat berubah, dan saat data ini berubah, Flutter akan membangun ulang widget ini dengan data yang diperbarui.

Contoh penggunaan:

- Stateless widget biasanya digunakan untuk menampilkan teks statis, gambar, ikon, atau tampilan yang tidak berubah.
- Stateful widget biasanya digunakan untuk hal-hal seperti formulir, daftar yang dapat digulir, permainan, atau tampilan yang perlu merespons interaksi pengguna dengan mengubah data yang terkait.

### 2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

-  MyHomePage (Stateless Widget):

   - Widget utama yang merupakan halaman awal aplikasi. Ini juga adalah
   - Widget yang digunakan sebagai tampilan utama aplikasi. Membungkus seluruh halaman dengan scaffold yang memiliki app bar dan tampilan body.
- Scaffold:

    Widget yang menyediakan kerangka dasar untuk halaman aplikasi dengan app bar dan body.
- AppBar:

    Widget yang digunakan untuk menampilkan bar atas aplikasi dengan judul "Stock Els" dan warna latar belakang serta pengaturan lainnya.
- body (SingleChildScrollView):

    - Widget yang merupakan area konten utama halaman.
    - Menggunakan SingleChildScrollView untuk memungkinkan kontennya dapat di-scroll jika melebihi ukuran layar.
- Padding:

    Widget yang memberikan padding (jarak) dari tepi halaman.
- Column:

    Widget yang mengatur widget-nya secara vertikal.
- Text:

    Widget yang menampilkan teks "Stock Els Shop" dengan style teks tertentu di tengah halaman.
- GridView.count:

    Widget yang digunakan untuk membuat grid dengan jumlah kolom yang telah ditentukan. Dalam program ini, digunakan untuk menampilkan ShopCard untuk setiap item dalam daftar items.
- ShopCard (Stateless Widget):

    - Widget yang digunakan untuk menampilkan setiap item toko sebagai kartu dengan latar belakang warna yang berbeda sesuai dengan nama item.
    - Menggunakan InkWell untuk menambahkan efek interaksi ketika kartu ditekan.
    - Menampilkan ikon dan teks yang sesuai dengan item toko.
- Material:

    - Widget yang digunakan untuk memberikan efek Material Design, termasuk efek elevasi, latar belakang berwarna, dan efek ink splash ketika ditekan.
    - Dalam program ini, digunakan untuk mengatur warna latar belakang kartu (ShopCard) sesuai dengan nama item.
- InkWell:

    - Widget yang digunakan untuk menambahkan efek interaksi seperti ketika kartu ditekan, akan muncul efek splash ink.
    - Dalam program ini, digunakan sebagai pembungkus eksternal untuk Container yang mengandung ikon dan teks item toko.
- Icon:

    Widget yang digunakan untuk menampilkan ikon dengan warna putih. Ikon ini diberikan melalui objek item yang berasal dari ShopItem.
- Container:

    Widget yang digunakan untuk mengelola tata letak dan tampilan di dalam kartu. Memiliki padding dan berisi ikon dan teks.
- SnackBar:

    Widget yang digunakan untuk menampilkan pesan sementara kecil di bagian bawah layar ketika tombol pada kartu ditekan. Pesan SnackBar berisi teks yang memberi tahu pengguna bahwa mereka telah menekan tombol.

### 3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
- [x] **Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.**

    Jalankan *command* `flutter create stock_els` untuk men-*generate* proyek Flutter baru untuk aplikasi "Stock Els", lalu masuk ke dalam direktori proyek tersebut dengan *command* `cd stock_els`.
    
- [x] **Membuat tiga tombol sederhana dengan ikon dan teks untuk:**
    - Melihat daftar item (Lihat Item)
    - Menambah item (Tambah Item)
    - Logout (Logout)

    Pada `main.dart`:
    
    hapus `MyHomePage(title: 'Flutter Demo Home Page')` menjadi `MyHomePage()`.

    Pada `menu.dart`:
    - Tambahkan teks dan card dengan menambahkan barang-barang yang dijual. Define tipe pada list seperti berikut:
        ```
        class ShopItem {
            final String name;
            final IconData icon;

            ShopItem(this.name, this.icon);
        }
        ```
    - Ubah sifat widget halaman dari stateful menjadi stateless. Lakukan perubahan pada bagian `({super.key, required this.title})` menjadi `({Key? key}) : super(key: key);`. Selain itu, tambahkan barang-barang yang dijual (nama, harga, dan icon barang tersebut) dengan code berikut:
        ```
        final List<ShopItem> items = [
            ShopItem("Lihat Produk", Icons.checklist),
            ShopItem("Tambah Produk", Icons.add_shopping_cart),
            ShopItem("Logout", Icons.logout),
        ];
        ```
    - Lalu ubah method @override `Widget build(BuildContext context)` hingga menjadi seperti ini:
        ```
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
        ```
    - Tampilkan card dengan membuat widget stateless baru:
        ```
        class ShopCard extends StatelessWidget {
            final ShopItem item;

            const ShopCard(this.item, {super.key}); // Constructor

            @override
            Widget build(BuildContext context) {
                return Material(
                color: Colors.indigo,
                child: InkWell(
                    child: Container(
                    // Container untuk menyimpan Icon dan Text
                    padding: const EdgeInsets.all(8),
                    child: Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Icon(
                            item.icon,
                            color: Colors.white,
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
        ```
- [x] **Memunculkan Snackbar dengan tulisan:**
    - "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan.
    - "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan.
    - "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.

    Di `menu.dart` pada `class ShopCard extends StatelessWidget` tambahkan pada method override hingga menjadi seperti di bawah ini:
    ```
    @override
    Widget build(BuildContext context){
        return Material(
            ....
            child: InkWell(
                onTap: () {
                // Memunculkan SnackBar ketika diklik
                ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("Kamu telah menekan tombol ${item.name}!")));
                },
                ....
            )
        )
    }
               
    ```
- [x] **Melakukan add-commit-push ke GitHub.**

    Pada *root folder*, lakukan add-commit-push ke dalam repository GitHub yang telah ditetapkan di awal.

### Bonus
- Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Item, Tambah Item, dan Logout).

    Di `menu.dart` pada `class ShopCard extends StatelessWidget`gunakan logika if-else agar warna button untuk setiap tombolnya berbeda pada method override berikut:
    ```
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
            ...
        )
    }
    ```
    
</details>

### 📝Tugas 8

<details>
<summary><b>Details</b></summary>

### 1. Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
- **`Navigator.push()`**: Menambahkan *route* baru ke dalam tumpukan *route*, memungkinkan pengguna kembali ke *route* sebelumnya. Method ini menyebabkan *route* yang ditambahkan berada pada paling atas stack, sehingga *route* yang baru saja ditambahkan tersebut akan muncul dan ditampilkan kepada pengguna.

    **Contoh:**
    ```dart
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ShopFormPage()),
    );
    ```

- **`Navigator.pushReplacement()`**: Menghapus *route* yang sedang ditampilkan kepada pengguna dan menggantinya dengan suatu *route*. Method ini menyebabkan aplikasi untuk berpindah dari *route* yang sedang ditampilkan kepada pengguna ke suatu *route* yang diberikan. *Route* lama pada atas stack akan digantikan secara langsung oleh *route* baru yang diberikan tanpa mengubah kondisi elemen stack yang berada di bawahnya.

    **Contoh:**
    ```dart
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
    ```

### 2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

- **`Container`**: Widget serbaguna untuk mengatur widget lain.

- **`Column` dan `Row`**: Digunakan untuk menyusun widget secara vertikal atau horizontal, berturut-turut.

- **`Stack`**: Memungkinkan penumpukan widget.

- **`ListView`**: Menampilkan daftar item yang dapat di-scroll.

- **`GridView`**: Menampilkan item dalam susunan grid.

- **`Expanded dan Flexible`** : Memberikan ruang yang sesuai berdasarkan proporsi atau prioritas.

- **`SizedBox`** : Memberikan dimensi tetap pada widget atau sebagai pemisah antara elemen.

### 3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
Dalam tugas ini, saya menggunakan beberapa elemen input pada formulir:

1. **`TextFormField`**: Digunakan untuk semua input seperti `nama item`, `harga item`, `ukuran item`, `jumlah item`, dan `deskripsi item`.
    - **Alasan Penggunaan**: TextFormField dipilih karena memungkinkan pengguna memasukkan teks serta dapat dengan mudah diverifikasi dan ditangani perubahan nilai. Setiap kolom formulir memerlukan input teks yang berbeda seperti nama item, harga, ukuran, jumlah, dan deskripsi. Validasi dilakukan untuk memastikan bahwa input tidak kosong dan sesuai dengan yang diharapkan, seperti memastikan bahwa input harga, ukuran, jumlah adalah angka. Selain itu, TextFormField juga menyediakan dekorasi placeholder dan label yang memudahkan pengguna untuk mengetahui keterangan dari input yang mereka isi.

2. **`ElevatedButton`**: Untuk menyimpan dan memvalidasi formulir.
    - **Alasan Penggunaan**: ElevatedButton digunakan untuk menyimpan data formulir setelah memastikan bahwa validasi telah dilalui. Ini memicu tampilan dialog yang memperlihatkan informasi yang dimasukkan, memungkinkan pengguna untuk melihat data yang telah mereka masukkan sebelum menekan tombol "OK" untuk menutup dialog.

Pemilihan elemen input ini didasarkan pada fungsionalitas masing-masing. TextFormField digunakan untuk berbagai input teks yang memerlukan validasi, sementara ElevatedButton digunakan untuk menginisiasi aksi pengguna seperti penyimpanan data setelah validasi formulir berhasil.

### 4. Bagaimana penerapan clean architecture pada aplikasi Flutter?
Clean Architecture adalah konsep yang memisahkan aplikasi ke dalam beberapa lapisan terisolasi:
## 1. Lapisan Fitur
- Merupakan lapisan presentasi yang bergantung pada framework, termasuk UI dan event handler.
- Menggunakan widget Flutter untuk menampilkan elemen pada layar.
- Menerapkan pola manajemen state seperti BLoCs, Provider, atau GetX.

## 2. Lapisan Domain
- Lapisan paling dalam yang tidak bergantung pada lapisan lainnya.
- Berisi Entities, Use Cases, dan Repository Interfaces.
- Digunakan untuk aturan bisnis aplikasi dan tidak terkait dengan implementasi spesifik Flutter.

## 3. Lapisan Data
- Bertanggung jawab atas pengambilan data dari berbagai sumber.
- Berisi implementasi repository dari lapisan domain dan data sources seperti API atau database.
- Memiliki DTO Models untuk representasi struktur JSON.

## 4. Resources dan Shared Library
- Resources: Aset seperti gambar, font, dan konfigurasi lainnya.
- Shared Library: Komponen dan fungsionalitas yang dapat digunakan kembali.
- Struktur proyek memungkinkan pengelompokan lapisan data dan domain dalam direktori "core". Terdapat pembagian direktori untuk setiap fitur (user) dan lapisan (data, domain, presentation).

## 5. Pemisahan Logika Bisnis
- Logika bisnis terletak di lapisan domain, memisahkannya dari lapisan presentasi dan data.
- Data yang dikirim ke lapisan presentasi hanya berupa entities, bukan DTO.

## 6. Dependency Injection
- Menggunakan dependency injection untuk menghubungkan lapisan domain dan data.
- Memisahkan implementasi repository dari lapisan domain untuk fleksibilitas dan perawatan yang lebih baik.

## 7. Kode yang Mudah Dimengerti
- Memberikan nama yang jelas pada kelas dan metode.
- Struktur proyek membantu pembacaan kode dengan memisahkan tugas-tugas dan mengorganisir kode dengan baik.

## 8. Tes Unit
- Menulis tes unit untuk use cases di lapisan domain.
- Memastikan kebenaran logika bisnis dan memudahkan refaktor.

## 9. Sederhana Namun Efektif
- Fokus pada sederhana namun efektif untuk memudahkan pengembangan dan pemeliharaan.
- Struktur proyek membantu pemahaman dan navigasi melalui kode.

### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
- [x] **Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:**

    Pada direktori `lib`, buat file `shoplist_form.dart` dan isi dengan kode berikut:
    ```
    import 'package:flutter/material.dart';
    import 'package:stock_els/widgets/left_drawer.dart';

    class ShopFormPage extends StatefulWidget {
        const ShopFormPage({super.key});

        @override
        State<ShopFormPage> createState() => _ShopFormPageState();
    }

    class _ShopFormPageState extends State<ShopFormPage> {
        @override
        Widget build(BuildContext context) {
            return Placeholder();
        }
    }
    ```
    - [x] **Memakai minimal tiga elemen input, yaitu `name`, `amount`, `description`. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.**
    
        Pada class `_ShopFormPageState` di file `shoplist_form.dart`, isi dengan kode berikut:
        ```
        ...
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
                                    ),
                                ),
                            ]
                        )
                    ),
                ),
            );
        }
        ...    
        ```
    - [x] **Memiliki sebuah tombol `Save`.**
    
        Pada class `_ShopFormPageState` di file `shoplist_form.dart`, bagian `return Scaffold(...)` isi dengan kode berikut:
        ```
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
        ```
    - [x] **Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:**
        - [x] **Setiap elemen input tidak boleh kosong.**

            Pada class `_ShopFormPageState` di file `shoplist_form.dart`, bagian `return Scaffold(...)` dan di setiap bagian `child: TextFormField(...)` isi dengan kode berikut:
            ```
            ...
            validator: (String? value) {
                if (value == null || value.isEmpty) {
                    return "(nama variabel) tidak boleh kosong!";
                }
            return null;
            },
            ...
            ```
        - [x] **Setiap elemen input harus berisi data dengan tipe data atribut modelnya.**

            Pada class `_ShopFormPageState` di file `shoplist_form.dart`, bagian `return Scaffold(...)` dan di setiap bagian `child: TextFormField(...)` isi dengan kode berikut:
            ```
            ...
            validator: (String? value) {
                if (int.tryParse(value) == null) {
                    return "Ukuran harus berupa angka!";
                }
            return null;
            },
            ...
            ```
    
- [x] **Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol `Tambah Item` pada halaman utama.**

    Pada class `MyHomePage` di `menu.dart`, bagian `return Scaffold(...)`, isi dengan kode berikut:
    ```
    import 'package:stock_els/widgets/left_drawer.dart';
    ...
    drawer: const LeftDrawer(),
    ...
    ```
    Pada class ShopCard di `shop_card.dart`, bagian `return Material(...)`, isi dengan kode berikut:
    ```
    ...
    if (item.name == "Tambah Item") {
            // TODO: Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShopFormPage()),
            );
    }
    ...
    ```
- [x] **Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah `pop-up` setelah menekan tombol `Save` pada halaman formulir tambah item baru.**

    Pada class `_ShopFormPageState` di `shoplist_form.dart`, bagian `child: Column(...)` dan bagian `Align(...)` isi dengan kode berikut:
    ```
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
        }
    }
    ```
- [x] **Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:**
    - [x] **Drawer minimal memiliki dua buah opsi, yaitu `Halaman Utama` dan `Tambah Item`.**

        Pada class `LeftDrawer` di `left_drawer.dart` bagian `return Drawer(...)` isi dengan kode berikut:
        ```
        ...
        ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: (),
        ),
        ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke ShopFormPage
            onTap: (),
        ),
        ...
        ```
    - [x] **Ketika memiih opsi `Halaman Utama`, maka aplikasi akan mengarahkan pengguna ke halaman utama.**

        Pada class `LeftDrawer` di `left_drawer.dart` dan bagian `ListTile` untuk halaman utama, isi dengan kode berikut:
        ```
        ...
        onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                ));
        },
        ...
        ```
    - [x] **Ketika memiih opsi (`Tambah Item`), maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.**

        Pada class `LeftDrawer` di `left_drawer.dart` dan bagian `ListTile` untuk halaman utama, isi dengan kode berikut:
        ```
        ...
        onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ShopFormPage(),
                ));
        },
        ...
        ```
- [x] **Melakukan add-commit-push ke GitHub.**

    Pada *root folder*, lakukan add-commit-push ke dalam repository GitHub yang telah ditetapkan di awal.
</details>