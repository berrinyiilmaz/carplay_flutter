import 'package:carplay_flutter/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../widgets/bottom_menu.dart';
import '../widgets/suggested_action_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'CarPlay',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontFamily: 'Oswald',
              ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              CupertinoIcons.bell,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 4,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 220,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(
                      CupertinoIcons.person_fill,
                      size: 50,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Hoş Geldin!',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontFamily: 'Oswald',
                          color: Colors.white,
                        ),
                  ),
                  Text(
                    'Müziğin tadını çıkar 🎧',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontFamily: 'Oswald',
                          color: Colors.white70,
                        ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Ana Sayfa'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.music_note_list),
              title: const Text('Son Çalınanlar'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Üstte 4 tane playlist ismi göstermek için örnek kartlar
            Container(
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _playlistCard(context, 'Pop Hits'),
                  _playlistCard(context, 'Rock Classics'),
                  _playlistCard(context, 'Chill Vibes'),
                  _playlistCard(context, 'Jazz Lounge'),
                ],
              ),
            ),

            // Önerilen Şarkılar Listesi
            Container(
              height: 180,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _suggestedSongCard(context, 'Shape of You', 'Ed Sheeran'),
                  _suggestedSongCard(context, 'Blinding Lights', 'The Weeknd'),
                  _suggestedSongCard(context, 'Levitating', 'Dua Lipa'),
                ],
              ),
            ),

            // Arkadaş etkileşimlerini gösteren basit placeholder liste
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Text(
                      'Arkadaş Etkileşimleri',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontFamily: 'Oswald',
                          ),
                    ),
                    const SizedBox(height: 12),
                    ListTile(
                      leading: const CircleAvatar(
                        child: Icon(CupertinoIcons.person),
                      ),
                      title: const Text('Ali Can'),
                      subtitle: const Text('Yeni bir playlist oluşturdu!'),
                      trailing: const Icon(CupertinoIcons.chevron_forward),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        child: Icon(CupertinoIcons.person),
                      ),
                      title: const Text('Ayşe Yılmaz'),
                      subtitle: const Text('Şarkı beğendi: "Imagine"'),
                      trailing: const Icon(CupertinoIcons.chevron_forward),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }

  Widget _playlistCard(BuildContext context, String title) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontFamily: 'Oswald',
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _suggestedSongCard(BuildContext context, String title, String artist) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            CupertinoIcons.music_note,
            size: 50,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontFamily: 'Oswald',
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            artist,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontFamily: 'Oswald', color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
