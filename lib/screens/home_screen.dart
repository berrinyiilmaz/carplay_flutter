import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Spotify tarzı koyu tema

      // AppBar
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        title: const Text('Müzik Uygulaması', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.bell, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),

      // Drawer (Yan Menü)
      drawer: Drawer(
        child: Column(
          children: [
            // Drawer Header
            Container(
              height: 200,
              color: Colors.blueGrey,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.person_circle,
                    size: 80,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Kullanıcı Adı',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            // Menü öğeleri
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Ana Sayfa'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: const Text('Ayarlar'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // Ana içerik (Çalma Listeleri)
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Çalma Listeleri',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Çalma listesi sayısı
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(CupertinoIcons.music_note, color: Colors.white),
                  title: Text('Çalma Listesi ${index + 1}', style: const TextStyle(color: Colors.white)),
                  onTap: () {},
                );
              },
            ),
          ),

          // Oynatma Kontrolleri
          Container(
            color: const Color(0xFF1DB954), // Spotify yeşili
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Şarkı Bilgisi
                Row(
                  children: [
                    const Icon(CupertinoIcons.music_note, color: Colors.white, size: 40),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Şarkı Adı',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Sanatçı Adı',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(CupertinoIcons.heart, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),

                // İlerleme Çubuğu
                Slider(
                  value: 30,
                  max: 100,
                  onChanged: (value) {},
                  activeColor: Colors.white,
                  inactiveColor: Colors.white54,
                ),

                // Oynatma Tuşları
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(CupertinoIcons.backward_fill, color: Colors.white, size: 32),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(CupertinoIcons.play_fill, color: Colors.white, size: 40),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(CupertinoIcons.forward_fill, color: Colors.white, size: 32),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

      // Alt navigasyon çubuğu
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 204, 141, 187),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(137, 176, 149, 182),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Arama',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profil',
          ),
        ],
        onTap: (index) {
          // Navigasyon işlemleri buraya gelecek
        },
      ),
    );
  }
}
