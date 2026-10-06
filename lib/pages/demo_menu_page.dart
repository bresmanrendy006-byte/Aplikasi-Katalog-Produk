import 'package:flutter/material.dart';

import '../widget_basic/avatar1.dart';
import '../widget_basic/button1.dart';
import '../widget_basic/column1.dart';
import '../widget_basic/container1.dart';
import '../widget_basic/counter_widget.dart';
import '../widget_basic/dialog_widget.dart';
import '../widget_basic/expanded_widget.dart';
import '../widget_basic/form_widget.dart';
import '../widget_basic/gridview_widget.dart';
import '../widget_basic/icon1.dart';
import '../widget_basic/image1.dart';
import '../widget_basic/list_view_widget.dart';
import '../widget_basic/padding_widget.dart';
import '../widget_basic/row1.dart';
import '../widget_basic/sizedbox_widget.dart';
import '../widget_basic/stack_widget.dart';
import '../widget_basic/text1.dart';
import '../widget_basic/textfield_widget.dart';
import '../widget_basic/wrap_widget.dart';
import 'home_page.dart';

/// Menu untuk membuka semua contoh dari modul W4S2 dan W4S3.
class DemoMenuPage extends StatelessWidget {
  const DemoMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<MapEntry<String, Widget Function()>>> grup = {
      'W4S2 — Widget Dasar': [
        MapEntry('HomePage', () => const HomePage()),
        MapEntry('2.1 Container', () => const Container1()),
        MapEntry('2.2 Text', () => const Text1()),
        MapEntry('2.3 Button', () => const Button1()),
        MapEntry('2.4 Icon', () => const Icon1()),
        MapEntry('2.5 Image', () => const Image1()),
        MapEntry('2.6 CircleAvatar', () => const Avatar1()),
        MapEntry('2.7 Column', () => const Column1()),
        MapEntry('2.8 Row', () => const Row1()),
        MapEntry('2.9 ListView', () => ListViewWidget()),
        MapEntry('2.10 GridView', () => const GridViewWidget()),
        MapEntry('2.11 Stack', () => const StackWidget()),
        MapEntry('2.12 Padding', () => const PaddingWidget()),
        MapEntry('2.12 Expanded', () => const ExpandedWidget()),
        MapEntry('2.13 SizedBox', () => const SizedBoxWidget()),
        MapEntry('2.14 Wrap', () => WrapWidget()),
      ],
      'W4S3 — Interaktivitas': [
        MapEntry('1. Counter (setState)', () => const CounterWidget()),
        MapEntry('2. TextField', () => const TextFieldWidget()),
        MapEntry('3. Form & Validasi', () => const FormWidget()),
        MapEntry('5. Dialog & SnackBar', () => const DialogWidget()),
      ],
    };

    return Scaffold(
      appBar: AppBar(title: const Text('Latihan Modul')),
      body: ListView(
        children: [
          for (final g in grup.entries) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
              child: Text(
                g.key,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            for (final e in g.value)
              ListTile(
                title: Text(e.key),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => e.value()),
                ),
              ),
          ],
        ],
      ),
    );
  }
}
