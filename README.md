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


### 📝Tugas 9

<details>
<summary><b>Details</b></summary>

### 1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Kita dapat melakukan pengambilan data JSON tanpa membuat model yaiutu dengan melakukan parsing JSON atau deserialization. Pada proyek Flutter, parsing JSON ini dapat menggunakan library yaitu `dart:convert`. Pembuatan model sebelum melakukan pengambilan data JSON akan lebih baik dalam beberapa kasus. Misalnya, jika struktur JSON kompleks dan perlu mengelola data yang lebih terstruktur pembuatan model akan lebih menguntungkan untuk memastikan bahwa tipe data yang diharapkan sesuai dengan yang diinginkan, membuat kode lebih mudah dibaca, dan mempermudah untuk refaktorisasi kode.

Oleh karena itu, tidak membuat model cocok untuk pengembangan yang cepat, sementara membuat model adalah pilihan yang lebih baik untuk kode yang lebih terstruktur, mudah dikembangkan, dan lebih aman untuk jangka panjang.

### 2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest biasanya digunakan dalam permintaan HTTP untuk melacak sesi pengguna atau menyimpan informasi spesifik pengguna. Dalam konteks Flutter, pengiriman cookies dilakukan saat melakukan permintaan HTTP. 

Mengenai pembagian instance CookieRequest ke semua komponen, hal ini biasanya dilakukan untuk memastikan konsistensi data dan status pengguna di seluruh aplikasi. Misalnya, jika pengguna memiliki data yang disimpan dalam cookies dan perlu diakses oleh banyak widget atau layar dalam aplikasi, maka perlu membagikan instance yang berisi data tersebut ke semua komponen yang membutuhkannya. Dengan cara ini, setiap komponen dapat mengakses informasi yang sama tentang pengguna yang terautentikasi dan sesi pengguna.

### 3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
Mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter adalah sebagai berikut:
1. Membuat Permintaan HTTP: Pertama, buat permintaan HTTP ke endpoint yang menyediakan data JSON (.../json). Ini biasanya dilakukan dengan menggunakan paket seperti `http` di Flutter.

2. Mendapatkan dan Mem-parsing Data JSON: Setelah mendapatkan respons dari permintaan HTTP, parsing data JSON dari respons tersebut. Ini bisa dilakukan dengan menggunakan fungsi `jsonDecode` dari paket `dart:convert`.

3. Mengubah Data JSON ke Model: Setelah data JSON diparsing, biasanya data diubah ke dalam model atau struktur data yang lebih mudah digunakan. Ini bisa dilakukan dengan membuat kelas model dan fungsi `fromJson`. Fungsi `fromJson` ini mengubah data JSON (dalam bentuk `Map<String, dynamic>`) menjadi instance dari model.

4. Menampilkan Data pada Widget: Setelah data diubah ke dalam model, data akan dapat ditampilkan pada widget di Flutter. Misalnya menggunakan `ListView.builder` untuk menampilkan daftar data, dan `Text` widget untuk menampilkan teks.

### 4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
1. Input Informasi Akun di Flutter: Pengguna memasukkan data akun mereka, seperti `username` dan `password`, melalui interface Flutter.

2. Mengirim Permintaan Autentikasi ke Django: Setelah informasi akun diambil dari pengguna, Flutter mengirimkan permintaan otentikasi ke server backend yang menggunakan Django. Ini biasanya dilakukan melalui permintaan `HTTP POST` yang mencakup detail akun pengguna.

3. Verifikasi Akun oleh Django: Server Django, setelah menerima permintaan autentikasi, memverifikasi kebenaran informasi akun. Untuk manajemen otentikasi, Django biasanya memanfaatkan metode seperti `JSON Web Token (JWT)` atau sesi.

4. Respon Django dan Navigasi UI di Flutter: Flutter, setelah mendapat respon dari Django, memprosesnya dan beraksi sesuai dengan hasilnya. Jika pengguna berhasil terotentikasi, mereka biasanya diarahkan ke halaman menu utama atau bagian lain dari aplikasi.

### 5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
1. `AppBar`: Baris di bagian atas layar untuk judul aplikasi.

2. `Scaffold`: Struktur utama dalam aplikasi Flutter.

3. `FutureBuilder`: Mengolah hasil dari Future (seperti fetchProduct()) untuk membentuk UI berdasarkan status Future.

4. `ListView.builder`: Membangun daftar item dengan jumlah yang berubah-ubah.

5. `Column`: Menata elemen dalam susunan vertikal.

6. `Text`: Widget untuk menampilkan teks di UI.

7. `Container`: Wadah untuk elemen UI, dengan opsi margin dan padding.

8. `SizedBox`: Digunakan untuk memberikan ruang vertikal antar elemen.

9. `ElevatedButton`: Tombol dengan efek elevasi, sering digunakan untuk navigasi.

10. `LeftDrawer`: Widget samping yang biasanya berisi opsi navigasi atau link.

### 6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
- [x] **Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.**

    Melakukan pengecekan terhadap url web tugas deployed (cheeryl-aisyah-tugas.pbp.cs.ui.ac.id).
- [x] **Membuat halaman login pada proyek tugas Flutter.**

    Membuat file `login.dart` pada folder `screens` dan isi dengan kode di bawah ini:
    ```
    import 'package:stock_els/screens/menu.dart';
    import 'package:flutter/material.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    void main() {
        runApp(const LoginApp());
    }

    class LoginApp extends StatelessWidget {
    const LoginApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Login',
            theme: ThemeData(
                primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
        );
        }
    }

    class LoginPage extends StatefulWidget {
        const LoginPage({super.key});

        @override
        _LoginPageState createState() => _LoginPageState();
    }

    class _LoginPageState extends State<LoginPage> {
        final TextEditingController _usernameController = TextEditingController();
        final TextEditingController _passwordController = TextEditingController();

        @override
        Widget build(BuildContext context) {
            final request = context.watch<CookieRequest>();
            return Scaffold(
                appBar: AppBar(
                    title: const Text('Login'),
                ),
                body: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            TextField(
                                controller: _usernameController,
                                decoration: const InputDecoration(
                                    labelText: 'Username',
                                ),
                            ),
                            const SizedBox(height: 12.0),
                            TextField(
                                controller: _passwordController,
                                decoration: const InputDecoration(
                                    labelText: 'Password',
                                ),
                                obscureText: true,
                            ),
                            const SizedBox(height: 24.0),
                            ElevatedButton(
                                onPressed: () async {
                                    String username = _usernameController.text;
                                    String password = _passwordController.text;

                                    // Cek kredensial
                                    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                    // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                    // gunakan URL http://10.0.2.2/
                                    final response = await request.login("http://127.0.0.1:8000/auth/login/", {
                                    'username': username,
                                    'password': password,
                                    });
                        
                                    if (request.loggedIn) {
                                        String message = response['message'];
                                        String uname = response['username'];
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => MyHomePage()),
                                        );
                                        ScaffoldMessenger.of(context)
                                            ..hideCurrentSnackBar()
                                            ..showSnackBar(
                                                SnackBar(content: Text("$message Selamat datang, $uname.")));
                                        } else {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                title: const Text('Login Gagal'),
                                                content:
                                                    Text(response['message']),
                                                actions: [
                                                    TextButton(
                                                        child: const Text('OK'),
                                                        onPressed: () {
                                                            Navigator.pop(context);
                                                        },
                                                    ),
                                                ],
                                            ),
                                        );
                                    }
                                },
                                child: const Text('Login'),
                            ),
                        ],
                    ),
                ),
            );
        }
    }
    ```
- [x] **Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.**

    DJANGO:
    Membuat `django-app` baru dengan nama `authentication` pada `stock_els`, tambahkan `authentication` ke `INSTALLED_APPS` pada `settings.py`. 

    Setelah itu, install juga library `django-cors-headers` pada `stock_els` dan tambahkan `corsheaders` ke `INSTALLED_APPS` dan  `corsheaders.middleware.CorsMiddleware` ke `MIDDLEWARE` pada `settings.py`. Tambahkan pula variabel berikut ke `settings.py`:
    ```
    CORS_ALLOW_ALL_ORIGINS = True
    CORS_ALLOW_CREDENTIALS = True
    CSRF_COOKIE_SECURE = True
    SESSION_COOKIE_SECURE = True
    CSRF_COOKIE_SAMESITE = 'None'
    SESSION_COOKIE_SAMESITE = 'None'
    ```
    
    Membuat fungsi `login` dan `logout` pada `authentication/views.py` dan routing fungsi tersebut pada `authentication/urls.py`. Tambahkan pula `path('auth/', include('authentication.urls')),` pada file `stock_els/urls.py`.

    FLUTTER:
    Install package `flutter pub add provider` dan `flutter pub add pbp_django_auth` pada proyek Flutter.
    Setelah itu, pada `main.dart` ubah class `MyApp` menjadi seperti dibawah ini:
    ```
    class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                title: 'Stock Els',
                theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                    useMaterial3: true,
                ),
                home: LoginPage()),
            );
        }
    }
    ```

- [x] **Membuat model kustom sesuai dengan proyek aplikasi Django.**

    Buka endpoint `JSON` pada proyek Django yang telah dibuat (ex: http://127.0.0.1:8000/json) dan salin data `JSON` tersebut.

    Pada situs web `Quicktype`, ubah name menjadi `Item`, sourcetype menjadi `JSON`, dan language menjadi `Dart`. Tempel data `JSON` yang telah disalin sebelumnya ke dalam textbox pada `Quicktype`. Setelah itu, copy code hasil dari data `JSON` dengan tombol yang tersedia di sisi kanan.

    Pada `lib` proyek Flutter, buat folder baru bernama `models` dan buat file `item.dart`. Isi kode `item.dart` dengan code yang telah disalin dari `Quicktype`.
- [x] **Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.**

    Pada proyek Flutter, pada `lib/screens` buat file baru bernama `list_item.dart`. Isi file baru tersebut dengan kode:
    ```
    import 'package:flutter/material.dart';
    import 'package:http/http.dart' as http;
    import 'dart:convert';
    import 'package:stock_els/models/item.dart';
    import 'package:stock_els/screens/detail_item.dart';
    import 'package:stock_els/widgets/left_drawer.dart';

    class ItemPage extends StatefulWidget {
    const ItemPage({Key? key}) : super(key: key);

    @override
    _ItemPageState createState() => _ItemPageState();
    }

    class _ItemPageState extends State<ItemPage> {
    Future<List<Item>> fetchItem() async {
        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
        var url = Uri.parse(
            'http://127.0.0.1:8000/json/');
        var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object Item
        List<Item> list_item = [];
        for (var d in data) {
        if (d != null) {
            list_item.add(Item.fromJson(d));
        }
        }
        return list_item;
    }
    ...
    ```
    - [x] **Tampilkan name, amount, dan description dari masing-masing item pada halaman ini.**

    Pada `list_item.dart`, override `Widget build` dan isi `Scaffold` hingga kodenya menjadi seperti berikut:
    ```
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
            title: const Text('Item'),
            ),
            drawer: const LeftDrawer(),
            body: FutureBuilder(
                future: fetchItem(),
                builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data produk.",
                            style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                    } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
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
                                Text("${snapshot.data![index].fields.amount}"),
                                const SizedBox(height: 10),
                                Text(
                                    "${snapshot.data![index].fields.description}"),
                            ],
                            ),
                        ));
                    }
                }
                }
            )
            );
    }
    ```

- [x] **Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.**

    Pada proyek Flutter, pada `lib/screens` buat file baru bernama `detail_item.dart`. Isi file baru tersebut dengan kode:
    ```
    import 'package:flutter/material.dart';
    import 'package:http/http.dart' as http;
    import 'dart:convert';
    import 'package:stock_els/models/item.dart';
    import 'package:stock_els/widgets/left_drawer.dart';
    import 'package:stock_els/screens/list_item.dart';

    class DetailItemPage extends StatelessWidget {
        const DetailItemPage({Key? key, required this.id}) : super(key: key);
        final int id;

        Future<List<Item>> fetchItem() async {
            // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
            var url = Uri.parse(
                'http://127.0.0.1:8000/json/${id}');
            var response = await http.get(
            url,
            headers: {"Content-Type": "application/json"},
            );

            // melakukan decode response menjadi bentuk json
            var data = jsonDecode(utf8.decode(response.bodyBytes));

            // melakukan konversi data json menjadi object Item
            List<Item> list_item = [];
            for (var d in data) {
            if (d != null) {
                list_item.add(Item.fromJson(d));
            }
            }
            return list_item;
        }
    ...
    }
    ```
    - [x] **Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item.**

        Pada file `screens/list_item.dart`, tambahkan kode berikut di bagian `return ListView.builder(...)`:
        ```
        ...
        ElevatedButton(
            onPressed: () async {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DetailItemPage(id: snapshot.data![index].pk)),
            );
            },
            child: const Text('Detail Item'),
        ),
        ...
        ```

    - [x] **Tampilkan seluruh atribut pada model item kamu pada halaman ini.**

        Pada file `screens/detail_item.dart`, tambahkan kode berikut ini menyesuaikan dengan model yang telah didefinisikan pada proyek Django:
        ```
        @override
        Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                title: const Text('Detail Item'),
                ),
                drawer: const LeftDrawer(),
                body: FutureBuilder(
                    future: fetchItem(),
                    builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                    } else {
                        if (!snapshot.hasData) {
                        return const Column(
                            children: [
                            Text(
                                "Tidak ada data produk.",
                                style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                            ),
                            SizedBox(height: 8),
                            ],
                        );
                        } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
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
                                    Text("Amount: ${snapshot.data![index].fields.amount}"),
                                    const SizedBox(height: 10),
                                    Text("Price: ${snapshot.data![index].fields.price}"),
                                    const SizedBox(height: 10),
                                    Text("Size: ${snapshot.data![index].fields.size}"),
                                    const SizedBox(height: 10),
                                    Text("Description: ${snapshot.data![index].fields.description}"),
                                ],
                                ),
                            )
                            );
                        }
                    }
                    }
                )
            );
        }
        ```
    - [x] **Tambahkan tombol untuk kembali ke halaman daftar item.**
    
        Pada file `screens/detail_item.dart`, tambahkan kode berikut  pada bagian `FutureBuilder(..)`:
        ```
        ...
        ElevatedButton(
            onPressed: () async {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ItemPage()),
                );
            },
            child: const Text('Kembali'),
            ),
        ...
        ```
- [x] **Melakukan add-commit-push ke GitHub.**

    Pada *root folder*, lakukan add-commit-push ke dalam repository GitHub yang telah ditetapkan di awal.

</details>