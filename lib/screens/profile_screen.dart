import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Kitaplığım',
          style: TextStyle(
            fontFamily: 'Oswald',
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profil bilgileri ve biyografi
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Berrin Yılmaz',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Müziği hayatımın ritmi haline getirdim.',
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 14,
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Takipçiler, Takip edilenler ve Beğeniler
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatBox('Takipçiler', '120'),
                  _buildStatBox('Takip Edilenler', '80'),
                  _buildStatBox('Beğeniler', '200'),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Çalma Listesi Başlığı
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Çalma Listelerim',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontFamily: 'Oswald',
                      ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Playlist Listesi
            Column(
              children: [
                _buildPlaylistTile(
                    context, 'Chill Vibes', 'Rahatlatıcı parçalar'),
                _buildPlaylistTile(
                    context, 'Gym Pump', 'Spor için enerjik müzikler'),
                _buildPlaylistTile(
                    context, 'My Top 2025', 'En çok dinlediklerim'),
                _buildPlaylistTile(
                    context, 'Jazz Nights', 'Gece caz melodileri'),
              ],
            ),

            const SizedBox(height: 30),

            // Kısa yollar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildFeatureCard(Icons.favorite, 'Favori Şarkılarım', () {}),
                  _buildFeatureCard(Icons.settings, 'Ayarlar', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SettingsScreen(),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Takip/Beğeni kutuları
  Widget _buildStatBox(String title, String value) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue.shade200),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade50,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Oswald',
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: 'Oswald',
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  // Playlist kutuları
  Widget _buildPlaylistTile(
      BuildContext context, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue.shade100),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade50,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              shape: BoxShape.circle,
            ),
            child: const Icon(CupertinoIcons.music_note, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontFamily: 'Oswald',
                      ),
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontFamily: 'Oswald',
                        color: Colors.black54,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Kısa yol kartları
  Widget _buildFeatureCard(IconData icon, String title, VoidCallback onTap) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        leading: Icon(icon, color: Colors.blue.shade400),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Oswald',
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

// AYARLAR SAYFASI (Basit örnek)
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayarlar'),
        backgroundColor: Colors.blue.shade400,
      ),
      body: const Center(
        child: Text(
          'Ayarlar buraya gelecek',
          style: TextStyle(fontSize: 18, fontFamily: 'Oswald'),
        ),
      ),
    );
  }
}
