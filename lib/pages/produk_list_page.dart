import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widget_basic/product_card.dart';
import 'produk_detail_page.dart';
import 'tambah_produk_page.dart';

class ProdukListPage extends StatelessWidget {
  final List<Product> produk;
  final int jumlahKeranjang;
  final VoidCallback onTambahKeranjang;
  final void Function(Product) onTambahProduk;
  final void Function(Product) onHapusProduk;

  const ProdukListPage({
    super.key,
    required this.produk,
    required this.jumlahKeranjang,
    required this.onTambahKeranjang,
    required this.onTambahProduk,
    required this.onHapusProduk,
  });

  // Dialog konfirmasi hapus (Bagian 5)
  Future<void> _konfirmasiHapus(BuildContext context, Product p) async {
    final yakin = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus Produk?'),
        content: Text('"${p.nama}" akan dihapus dari daftar.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (yakin == true) {
      onHapusProduk(p);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${p.nama} berhasil dihapus')),
        );
      }
    }
  }

  // Ambil data balik dari form (Bagian 4.2)
  Future<void> _bukaFormTambah(BuildContext context) async {
    final Product? hasil = await Navigator.push<Product>(
      context,
      MaterialPageRoute(builder: (_) => const TambahProdukPage()),
    );
    if (hasil != null) {
      onTambahProduk(hasil);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${hasil.nama} berhasil ditambahkan')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk'),
        actions: [
          // Ikon keranjang + badge (Stack + Positioned, W4S2 2.11)
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Isi keranjang: $jumlahKeranjang item')),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart, size: 28),
                ),
                if (jumlahKeranjang > 0)
                  Positioned(
                    top: 2,
                    right: 0,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                      child: Text(
                        '$jumlahKeranjang',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: produk.isEmpty
          ? const Center(child: Text('Belum ada produk. Tekan + untuk menambah.'))
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: produk.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final item = produk[index];
                return ProductCard(
                  nama: item.nama,
                  harga: item.harga,
                  icon: item.ikon,
                  onDelete: () => _konfirmasiHapus(context, item),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProdukDetailPage(
                          produk: item,
                          onTambahKeranjang: onTambahKeranjang,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _bukaFormTambah(context),
        tooltip: 'Tambah Produk',
        child: const Icon(Icons.add),
      ),
    );
  }
}
