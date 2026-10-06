import 'package:flutter/material.dart';
import '../models/product.dart';
import 'produk_list_page.dart';
import 'profil_page.dart';

/// Menyimpan state bersama (daftar produk & jumlah keranjang) lalu
/// membungkus dua halaman dengan BottomNavigationBar.
class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _tabTerpilih = 0;
  int _jumlahKeranjang = 0;

  final List<Product> _produk = [
    const Product(nama: 'Kursi Minimalis', harga: 350000, ikon: Icons.event_seat,
        deskripsi: 'Kursi kayu dengan desain minimalis, nyaman untuk ruang tamu.'),
    const Product(nama: 'Meja Kerja Kayu', harga: 750000, ikon: Icons.desk,
        deskripsi: 'Meja kerja dari kayu jati dengan permukaan luas.'),
    const Product(nama: 'Lampu Meja LED', harga: 120000, ikon: Icons.lightbulb,
        deskripsi: 'Lampu LED hemat energi dengan cahaya hangat.'),
    const Product(nama: 'Sofa Santai', harga: 2500000, ikon: Icons.weekend,
        deskripsi: 'Sofa 2 dudukan dengan bantalan empuk.'),
    const Product(nama: 'Rak Buku', harga: 480000, ikon: Icons.menu_book,
        deskripsi: 'Rak buku 4 tingkat, muat banyak koleksi.'),
    const Product(nama: 'Tempat Tidur', harga: 3200000, ikon: Icons.bed,
        deskripsi: 'Tempat tidur queen size dengan rangka kokoh.'),
  ];

  void _tambahKeranjang() {
    setState(() => _jumlahKeranjang++);
  }

  void _tambahProduk(Product p) {
    setState(() => _produk.add(p));
  }

  void _hapusProduk(Product p) {
    setState(() => _produk.remove(p));
  }

  @override
  Widget build(BuildContext context) {
    final halaman = <Widget>[
      ProdukListPage(
        produk: _produk,
        jumlahKeranjang: _jumlahKeranjang,
        onTambahKeranjang: _tambahKeranjang,
        onTambahProduk: _tambahProduk,
        onHapusProduk: _hapusProduk,
      ),
      ProfilPage(
        jumlahKeranjang: _jumlahKeranjang,
        jumlahProduk: _produk.length,
      ),
    ];

    return Scaffold(
      body: halaman[_tabTerpilih],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabTerpilih,
        onTap: (index) => setState(() => _tabTerpilih = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Produk'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
