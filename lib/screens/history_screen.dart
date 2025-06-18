import 'package:flutter/material.dart';
import '../widgets/bottom_menu.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<Map<String, String>> _history = [
    {'title': 'Gülümse', 'artist': 'Sezen Aksu'},
    {'title': 'Yalnızlık Senfonisi', 'artist': 'Müslüm Gürses'},
    {'title': 'Bu Aşk Fazla Sana', 'artist': 'Tarkan'},
    {'title': 'Resimdeki Gözyaşları', 'artist': 'Barış Manço'},
    {'title': 'Rakkas', 'artist': 'Ajda Pekkan'},
    {'title': 'Ele Güne Karşı', 'artist': 'MFÖ'},
    {'title': 'Fikrimin İnce Gülü', 'artist': 'Zeki Müren'},
    {'title': 'Tamam Aşkım', 'artist': 'Kenan Doğulu'},
    {'title': 'İstanbul Hatırası', 'artist': 'Teoman'},
    {'title': 'Zalim', 'artist': 'Sezen Aksu'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Dinleme Geçmişi'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _history.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final song = _history[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              title: Text(
                song['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(song['artist']!),
              trailing: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.play_arrow, size: 18),
                label: const Text("Dinle"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filtrele'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Wrap(
              spacing: 8,
              children: const [
                FilterChip(
                    label: Text('Pop'), selected: false, onSelected: null),
                FilterChip(
                    label: Text('Rock'), selected: false, onSelected: null),
                FilterChip(
                    label: Text('Jazz'), selected: false, onSelected: null),
              ],
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('İptal'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Uygula'),
          ),
        ],
      ),
    );
  }
}
