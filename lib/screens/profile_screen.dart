import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROFİLİM'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profil bilgileri
            Container(
              padding: const EdgeInsets.all(40),
              color: const Color.fromARGB(255, 143, 140, 140), // Profil arka planı
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile_picture.png'), // Profil fotoğrafı
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Berrin Yılmaz',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    ' Kafama Göre :))',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Takipçi ve Takip Edilenler
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStat('Takipçiler', '120'),
                  _buildStat('Takip Edilenler', '80'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Çalma Listeleri Başlığı
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Çalma Listeleri',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Çalma listeleri
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildPlaylistTile('Chill Hits', 'Rahatlatıcı şarkılarım'),
                _buildPlaylistTile('Workout', 'Enerji dolu şarkılarım'),
                _buildPlaylistTile('Top Hits', 'Popüler şarkılarım'),
                _buildPlaylistTile('Classical', 'Klasik müzik'),
                _buildPlaylistTile('Rock Anthems', 'Efsanevi rock şarkılarım'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Takipçi ve Takip Edilenler için yardımcı fonksiyon
  Widget _buildStat(String title, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ],
    );
  }

  // Çalma listesi elemanlarını gösteren fonksiyon
  Widget _buildPlaylistTile(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        // Çalma listesine tıklanıldığında yapılacak işlem
      },
    );
  }
}
