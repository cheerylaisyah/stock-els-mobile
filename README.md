# 👟*Stock Els*


### 📝Tugas 1

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