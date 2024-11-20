import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Sepak Bola',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login - Aplikasi Sepak Bola'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (emailController.text == 'user@example.com' &&
                    passwordController.text == 'password') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Email atau password salah!')),
                  );
                }
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[900],
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Berita Sepak Bola'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('User Name'),
              accountEmail: Text('user@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.black),
              ),
              decoration: BoxDecoration(
                color: Colors.red[900],
              ),
            ),
            ListTile(
              title: Text('Berita Bola'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewsPage()),
                );
              },
            ),
            ListTile(
              title: Text('Sejarah Sepak Bola'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryPage()),
                );
              },
            ),
            ListTile(
              title: Text('Informasi Bola'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BallInfoPage()),
                );
              },
            ),
            ListTile(
              title: Text('Pengaturan'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Selamat datang di aplikasi berita sepak bola!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class NewsPage extends StatelessWidget {
  final List<String> newsHeadlines = [
    'Piala Dunia 2022: Timnas Indonesia Lolos ke Babak 16 Besar!',
    'Cristiano Ronaldo Mengumumkan Pensiun dari Tim Nasional Portugal',
    'Barcelona Mendominasi La Liga Musim Ini',
    'Manchester United Tertinggal Jauh dari Papan Atas Premier League',
    'Kylian Mbappe Meraih Ballon d\'Or 2024!',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Berita Sepak Bola Terbaru'),
        backgroundColor: Colors.red[900],
      ),
      body: ListView.builder(
        itemCount: newsHeadlines.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              title: Text(
                newsHeadlines[index],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Diposting pada 20 November 2024',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.red[900],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewsDetailPage(newsHeadlines[index])),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class NewsDetailPage extends StatelessWidget {
  final String headline;
  NewsDetailPage(this.headline);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(headline),
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              headline,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Berita ini memberikan informasi terbaru tentang perkembangan di dunia sepak bola...',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Detail berita akan ditambahkan di sini...',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// Sejarah Sepak Bola
class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sejarah Sepak Bola'),
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Sejarah Sepak Bola',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Sepak bola adalah olahraga yang dimainkan oleh dua tim beranggotakan sebelas orang. Setiap tim berusaha untuk mencetak gol dengan menendang bola ke dalam gawang lawan. Olahraga ini pertama kali dimainkan di Inggris pada abad ke-19...',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// Informasi Bola
class BallInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Bola'),
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Jenis Bola Sepak',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Bola sepak yang digunakan dalam pertandingan profesional harus memenuhi standar ukuran dan berat tertentu. Bola sepak biasanya berukuran 22 cm hingga 24 cm dan memiliki berat sekitar 410 hingga 450 gram.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Sejarah Bola Sepak',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Bola sepak pertama kali dibuat oleh bangsa Inggris pada abad ke-19. Sebelumnya, bola sepak terbuat dari bahan kulit yang diisi dengan udara atau bahkan angin...',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// Pengaturan Aplikasi
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Pengaturan Tema',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SwitchListTile(
              title: Text('Mode Gelap'),
              value: false,  // Change this according to your state
              onChanged: (bool value) {
                // Update the theme mode (Dark/Light)
              },
            ),
          ],
        ),
      ),
    );
  }
}
