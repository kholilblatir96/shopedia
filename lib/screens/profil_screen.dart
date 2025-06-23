import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView(
        children: [
          // Header Profil
          Container(
            color: Colors.deepPurple,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/images/user.png'), // Gambar avatar
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Nama Pengguna',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    SizedBox(height: 4),
                    Text('Lihat dan kelola akun anda',
                        style: TextStyle(fontSize: 14, color: Colors.white70)),
                  ],
                )
              ],
            ),
          ),

          // Menu Ringkasan
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _MenuRingkasan(icon: Icons.wallet, label: 'Saldo'),
                _MenuRingkasan(icon: Icons.discount, label: 'Voucher'),
                _MenuRingkasan(icon: Icons.local_shipping, label: 'Pesanan'),
                _MenuRingkasan(icon: Icons.help_outline, label: 'Bantuan'),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Menu Lainnya
          _buildMenuSection([
            _MenuItem(icon: Icons.shopping_bag, title: 'Pesanan Saya'),
            _MenuItem(icon: Icons.favorite, title: 'Favorit'),
            _MenuItem(icon: Icons.location_on, title: 'Alamat Pengiriman'),
          ]),

          const SizedBox(height: 8),

          _buildMenuSection([
            _MenuItem(icon: Icons.lock, title: 'Keamanan'),
            _MenuItem(icon: Icons.settings, title: 'Pengaturan'),
            _MenuItem(icon: Icons.logout, title: 'Keluar'),
          ]),
        ],
      ),
    );
  }

  Widget _buildMenuSection(List<_MenuItem> items) {
    return Container(
      color: Colors.white,
      child: Column(
        children: items
            .map((item) => ListTile(
                  leading: Icon(item.icon, color: Colors.deepPurple),
                  title: Text(item.title),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ))
            .toList(),
      ),
    );
  }
}

class _MenuRingkasan extends StatelessWidget {
  final IconData icon;
  final String label;

  const _MenuRingkasan({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.deepPurple[50],
          child: Icon(icon, color: Colors.deepPurple),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String title;

  const _MenuItem({required this.icon, required this.title});
}
