import 'package:aktivitas/api/apicontroller.dart';
import 'package:flutter/material.dart';
import 'package:aktivitas/widget/sushilist.dart';

class secretpage extends StatefulWidget {
  const secretpage({super.key});

  @override
  State<secretpage> createState() => _secretpageState();
}

class _secretpageState extends State<secretpage> {
  Future<List<dynamic>>? _data;

  @override
  void initState() {
    super.initState();
    _data = ApiController().getdatas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Secret Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<List<dynamic>>(
          future: _data,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Terjadi kesalahan: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('Data tidak tersedia.'));
            } else {
              final data = snapshot.data!;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return SushiListWidget(
                    // image: 'https://picsum.photos/${item['photo']}',
                    image: item['download_url'] ?? '',
                    desc: item['author'] ?? 'No author available',
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
