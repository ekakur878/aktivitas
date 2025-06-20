import 'package:aktivitas/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? name;
  String? nbi;
  String? email;
  String? alamat;
  String? sosmed;
  void data() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? name = prefs.getString('name');
    final String? nbi = prefs.getString('nbi');
    final String? email = prefs.getString('email');
    final String? alamat = prefs.getString('alamat');
    final String? sosmed = prefs.getString('sosmed');

    setState(() {
      this.name = name;
      this.nbi = nbi;
      this.email = email;
      this.alamat = alamat;
      this.sosmed = sosmed;
    });
  }

  @override
  void initState() {
    super.initState();
    data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: const [
                  CircleAvatar(radius: 40, child: Icon(Icons.person, size: 50)),
                  SizedBox(height: 12),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // const Divider(),

            // Informasi kontak
            ListTile(
              leading: Icon(Icons.person, color: Colors.blue),
              title: Text(
                '$nbi',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.card_membership, color: Colors.blue),
              title: Text(
                '$name',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.blue),
              title: Text(
                '$email',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.blue),
              title: Text(
                '$alamat',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            ListTile(
              leading: Icon(Icons.camera_alt, color: Colors.purple),
              title: Text(
                '$sosmed',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[600],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.remove('name');
                  await prefs.remove('nbi');
                  await prefs.remove('email');
                  await prefs.remove('alamat');
                  await prefs.remove('sosmed');

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Splashscreen()),
                  );
                },
                child: const Text(
                  'Keluar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
