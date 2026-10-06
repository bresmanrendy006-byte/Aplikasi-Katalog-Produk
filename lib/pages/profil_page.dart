import 'package:flutter/material.dart';
import 'demo_menu_page.dart';

class ProfilPage extends StatelessWidget {
  final int jumlahKeranjang;
  final int jumlahProduk;

  const ProfilPage({
    super.key,
    required this.jumlahKeranjang,
    required this.jumlahProduk,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/men/32.jpg',
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Rendy Bresman S',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text('42325028', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),
            Card(
              child: ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: const Text('Item di keranjang'),
                trailing: Text('$jumlahKeranjang'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.inventory_2),
                title: const Text('Total produk'),
                trailing: Text('$jumlahProduk'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.science),
                title: const Text('Latihan Modul W4S2 & W4S3'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DemoMenuPage()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
