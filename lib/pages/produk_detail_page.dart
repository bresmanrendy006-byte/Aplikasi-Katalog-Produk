import 'package:flutter/material.dart';
import '../models/product.dart';

class ProdukDetailPage extends StatefulWidget {
  final Product produk;
  final VoidCallback onTambahKeranjang;

  const ProdukDetailPage({
    super.key,
    required this.produk,
    required this.onTambahKeranjang,
  });

  @override
  State<ProdukDetailPage> createState() => _ProdukDetailPageState();
}

class _ProdukDetailPageState extends State<ProdukDetailPage> {
  int _ditambahkan = 0; // berapa kali produk ini ditambahkan dari halaman ini

  void _tambah() {
    widget.onTambahKeranjang(); // update state keranjang di halaman utama
    setState(() => _ditambahkan++);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.produk.nama} ditambahkan ke keranjang'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.produk;
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(p.ikon, size: 100, color: Colors.deepPurple),
            ),
            const SizedBox(height: 16),
            Text(
              p.nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              formatRupiah(p.harga),
              style: const TextStyle(fontSize: 20, color: Colors.deepPurple),
            ),
            const SizedBox(height: 12),
            if (p.deskripsi.isNotEmpty)
              Text(p.deskripsi, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _tambah,
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Tambah ke Keranjang'),
              ),
            ),
            if (_ditambahkan > 0) ...[
              const SizedBox(height: 8),
              Text('Sudah ditambahkan $_ditambahkan kali dari halaman ini'),
            ],
          ],
        ),
      ),
    );
  }
}
