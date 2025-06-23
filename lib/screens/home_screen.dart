import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          // AppBar Shopee-style
          SliverAppBar(
            backgroundColor: Colors.deepPurple,
            pinned: true,
            expandedHeight: 120,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 16, bottom: 8),
              title: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 36,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.search, size: 20, color: Colors.grey),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Cari produk, toko, atau kategori',
                              style: TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.qr_code, color: Colors.white),
                  const SizedBox(width: 12),
                  const Icon(Icons.notifications_none, color: Colors.white),
                ],
              ),
            ),
          ),

          // Banner Promo
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(12),
              height: 160,
              decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  '🎉 Promo Spesial Hari Ini!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          // Menu Kategori
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildMenuItem(Icons.phone_android, 'Elektronik'),
                  _buildMenuItem(Icons.chair, 'Perabot'),
                  _buildMenuItem(Icons.shopping_bag, 'Fashion'),
                  _buildMenuItem(Icons.spa, 'Kecantikan'),
                  _buildMenuItem(Icons.sports_soccer, 'Olahraga'),
                  _buildMenuItem(Icons.local_grocery_store, 'Sembako'),
                  _buildMenuItem(Icons.toys, 'Mainan'),
                  _buildMenuItem(Icons.more_horiz, 'Lainnya'),
                ],
              ),
            ),
          ),

          // Produk Populer Grid
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '🔥 Produk Populer',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.6,
                    children: [
                      _buildProductCard('assets/images/1.jpg', 'Kaos pria kekinian', 'Rp 199.000', 'Tiba 3 hari lagi'),
                      _buildProductCard('assets/images/2.jpg', 'Kaos distro', 'Rp 250.000', 'Tiba besok'),
                      _buildProductCard('assets/images/3.jpg', 'Outfit pria', 'Rp 180.000', 'Tiba 2 hari lagi'),
                      _buildProductCard('assets/images/4.jpg', 'Kaos Distro Keren', 'Rp 99.000', 'Tiba 4 hari lagi'),
                      _buildProductCard('assets/images/5.jpg', 'Sepatu cewek viral', 'Rp 300.000', 'Tiba 3 hari lagi'),
                      _buildProductCard('assets/images/6.jpg', 'Sandal cewek trend', 'Rp 85.000', 'Tiba lusa'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildMenuItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.deepPurple[100],
          child: Icon(icon, size: 28, color: Colors.deepPurple),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 13),
        ),
      ],
    );
  }

  static Widget _buildProductCard(String imagePath, String title, String price, String estimation) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              price,
              style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
            child: Text(
              estimation,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
