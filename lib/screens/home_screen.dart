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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: ClipPath(
          clipper: WaveClipper(),
          child: Container(
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
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
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
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 300,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 4,
                      ),
                    ),
                    child: const Icon(
                      CupertinoIcons.person_circle,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Hoş Geldin, Berrin!',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontFamily: 'Oswald',
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                  Text(
                    'Berrin Yılmaz',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontFamily: 'Oswald',
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ],
              ),
            ),
            AnimatedListTile(
              leading: const Icon(CupertinoIcons.home),
              title: 'Ana Sayfa',
              onTap: () => Navigator.pop(context),
            ),
            AnimatedListTile(
              leading: const Icon(CupertinoIcons.music_note_list),
              title: 'Son Çalınanlar',
              onTap: () => Navigator.pop(context),
            ),
            AnimatedListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: 'Ayarlar',
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Müzik Kontrol Kartı
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: MusicControlCard(),
              ),
            ),
            // SuggestedActionCard'lar
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(24),
                  children: [
                    SuggestedActionCard(
                      icon: CupertinoIcons.music_note_list,
                      title: "Son Çalınanlar",
                      subtitle: "Geçmiş çalınanlarınızı görüntüleyin",
                      onTap: () => context.push("/history"),
                    ),
                    const SizedBox(height: 16),
                    SuggestedActionCard(
                      icon: CupertinoIcons.settings,
                      title: "Ayarlar",
                      subtitle: "Uygulama ayarlarını özelleştirin",
                      onTap: () => context.push("/settings"),
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
}

// Dalgalı AppBar için CustomClipper
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 20);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 20);
    var secondControlPoint = Offset(size.width * 3 / 4, size.height - 40);
    var secondEndPoint = Offset(size.width, size.height - 20);

    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Animasyonlu ListTile
class AnimatedListTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final VoidCallback onTap;

  const AnimatedListTile({
    super.key,
    required this.leading,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              ),
              child: leading,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontFamily: 'Oswald',
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

// Müzik Kontrol Kartı
class MusicControlCard extends StatefulWidget {
  const MusicControlCard({super.key});

  @override
  _MusicControlCardState createState() => _MusicControlCardState();
}

class _MusicControlCardState extends State<MusicControlCard> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Şarkı detay sayfasına yönlendirme
        context.push('/song');
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.1),
              Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Şarkı Bilgisi
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Örnek Şarkı',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontFamily: 'Oswald',
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Sanatçı Adı',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontFamily: 'Oswald',
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.7),
                          ),
                    ),
                  ],
                ),
              ),
              // Kontrol Butonları
              Row(
                children: [
                  IconButton(
                    icon: const Icon(CupertinoIcons.backward_end),
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {
                      // Önceki şarkıya geç
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      isPlaying
                          ? CupertinoIcons.pause_circle
                          : CupertinoIcons.play_circle,
                      size: 40,
                    ),
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(CupertinoIcons.forward_end),
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {
                      // Sonraki şarkıya geç
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
