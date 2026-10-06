import 'package:flutter/material.dart';

class Product {
  final String nama;
  final int harga;
  final String deskripsi;
  final IconData ikon;

  const Product({
    required this.nama,
    required this.harga,
    this.deskripsi = '',
    this.ikon = Icons.inventory_2,
  });
}

/// 350000 -> "Rp 350.000"
String formatRupiah(int angka) {
  final s = angka.toString();
  final buf = StringBuffer();
  for (int i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
    buf.write(s[i]);
  }
  return 'Rp $buf';
}
