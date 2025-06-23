import 'package:flutter/material.dart';

class FavoritScreen extends StatelessWidget {
  const FavoritScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorit Saya'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          _buildFavoriteItem('assets/images/1.jpg', 'Kaos Pria Kekinian', 'Rp 199.000'),
          _buildFavoriteItem('assets/images/2.jpg', 'Kaos Distro', 'Rp 250.000'),
          _buildFavoriteItem('assets/images/3.jpg', 'Outfit Pria Stylish', 'Rp 180.000'),
        ],
      ),
    );
  }

  Widget _buildFavoriteItem(String imagePath, String title, String price) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(8)),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 6),
                  Text(price,
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
