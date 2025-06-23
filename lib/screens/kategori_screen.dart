import 'package:flutter/material.dart';

class KategoriScreen extends StatelessWidget {
  const KategoriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Kategori'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Pencarian
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.white,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari kategori atau produk',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Grid Kategori
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(12),
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.8,
              children: _buildCategoryItems(),
            ),
          ),
        ],
      ),
    );
  }

  // Data kategori
  List<Widget> _buildCategoryItems() {
    final List<Map<String, dynamic>> categories = [
      {'icon': Icons.phone_android, 'label': 'Elektronik'},
      {'icon': Icons.chair, 'label': 'Perabotan'},
      {'icon': Icons.shopping_bag, 'label': 'Fashion'},
      {'icon': Icons.spa, 'label': 'Kecantikan'},
      {'icon': Icons.sports_soccer, 'label': 'Olahraga'},
      {'icon': Icons.tv, 'label': 'Elektronik Rumah'},
      {'icon': Icons.fastfood, 'label': 'Makanan'},
      {'icon': Icons.pets, 'label': 'Hewan Peliharaan'},
      {'icon': Icons.book, 'label': 'Buku & Alat Tulis'},
    ];

    return categories.map((category) {
      return Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.deepPurple[100],
            child: Icon(category['icon'], size: 30, color: Colors.deepPurple),
          ),
          const SizedBox(height: 8),
          Text(
            category['label'],
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13),
          ),
        ],
      );
    }).toList();
  }
}
