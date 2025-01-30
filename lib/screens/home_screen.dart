import 'package:carplay_flutter/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 190, 223), // Spotify tarzı koyu tema

  
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 182, 238),
        title: const Text('CarPlay', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.bell, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),

      
      drawer: Drawer(
        child: Column(
          children: [
            
            Container(
              height: 200,
              color: const Color.fromARGB(255, 233, 194, 238),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.person_circle,
                    size: 120,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Berrin Yılmaz',
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
              leading: const Icon(CupertinoIcons.music_note_list),
              title: const Text('Son Çalınanlar'),
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
            child: ListView(
              children: [
                ListTile(

                  title: const Text(
                    'Chill Hits',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: const Text(
                    'Rahatlatıcı şarkılar',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  
                  title: const Text(
                    'Workout',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: const Text(
                    'Enerji dolu şarkılar',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  
                  title: const Text(
                    'Top Hits',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: const Text(
                    'Popüler şarkılar',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  
                  title: const Text(
                    'Classical',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: const Text(
                    'Klasik müzik',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  onTap: () {},
                ),
                ListTile(
                 
                    
                  title: const Text(
                    'Rock Anthems',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: const Text(
                    'Efsanevi rock şarkıları',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),

          
          Container(
            color: const Color.fromARGB(255, 154, 206, 243), // Spotify yeşili
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                
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
                
                Slider(
                  value: 30,
                  max: 100,
                  onChanged: (value) {},
                  activeColor: Colors.white,
                  inactiveColor: Colors.white54,
                ),

                
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

      


      
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 204, 141, 187), 
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(
                CupertinoIcons.home,
                color: Color.fromARGB(255, 240, 236, 239), 
              ),
              onPressed: () {
                
              },
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.search,
                color: Color.fromARGB(255, 255, 255, 255), 
              ),
              onPressed: () {
              
              },
            ),
            IconButton(
              onPressed:() {
                context.go ("/profile");
              },
              icon: const Icon(
              CupertinoIcons.person,
                color: Color.fromARGB(255, 255, 255, 255), 
              ),
              
                
              
            ),
          ],
        ),
      ),
    );
  }
}
