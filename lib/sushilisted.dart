import 'package:aktivitas/api/apicontroller.dart';
import 'package:flutter/material.dart';
import 'package:aktivitas/widget/sushilist.dart';

class ListSushi extends StatefulWidget {
  const ListSushi({super.key});

  @override
  State<ListSushi> createState() => _ListSushiState();
}

class _ListSushiState extends State<ListSushi> {
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
                    image: 'https://saiyaapi.site/${item['download_']}',
                    desc: item['description'] ?? 'No description available',
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
