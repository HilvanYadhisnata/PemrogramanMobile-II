import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Root aplikasi — di sini tema global (ThemeData) didefinisikan.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Warna utama aplikasi (konsisten dipakai di seluruh halaman).
  static const Color kPrimary = Color(0xFF1E3A8A); // biru tua
  static const Color kAccent = Color(0xFF3B82F6); // biru terang
  static const Color kTextDark = Color(0xFF1F2937); // abu gelap untuk teks
  static const Color kBackground = Color(0xFFF1F5F9); // latar lembut

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile App',
      // ===== TEMA GLOBAL =====
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: kBackground,
        // Font custom Poppins dari assets/fonts/ dipakai untuk seluruh aplikasi.
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimary,
          primary: kPrimary,
          secondary: kAccent,
        ),
        // Warna teks global.
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            color: kTextDark,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: kTextDark,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: kPrimary,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
      ),
      home: const ProfilePage(),
    );
  }
}

/// Halaman utama aplikasi (satu halaman).
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil Saya',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            _HeaderCard(),
            SizedBox(height: 16),
            _StatsRow(),
            SizedBox(height: 16),
            _SectionTitle(icon: Icons.person_outline, title: 'Tentang Saya'),
            SizedBox(height: 8),
            _AboutCard(),
            SizedBox(height: 16),
            _SectionTitle(icon: Icons.contact_page_outlined, title: 'Kontak'),
            SizedBox(height: 8),
            _ContactList(),
            SizedBox(height: 16),
            _SectionTitle(icon: Icons.code, title: 'Keahlian'),
            SizedBox(height: 8),
            _SkillChips(),
            SizedBox(height: 24),
            _FooterText(),
          ],
        ),
      ),
    );
  }
}

/// Kartu header: foto/logo, nama, dan jurusan.
class _HeaderCard extends StatelessWidget {
  const _HeaderCard();

  @override
  Widget build(BuildContext context) {
    // Container untuk styling: padding, background gradient, dan sudut membulat.
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [MyApp.kPrimary, MyApp.kAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: MyApp.kPrimary.withValues(alpha: 0.3),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // Widget Image (gambar logo dari assets) dibungkus lingkaran putih.
          Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/Logo-UTB.png',
                width: 90,
                height: 90,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Widget Text untuk nama.
          const Text(
            'Hilvan Yadhisnata',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          // Widget Text untuk jurusan / sub judul.
          const Text(
            'Mahasiswa Teknik Informatika',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 10),
          // Row berisi Icon + Text lokasi.
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.location_on, color: Colors.white, size: 16),
              SizedBox(width: 4),
              Text(
                'Universitas Teknologi Bandung',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Baris statistik (Row berisi beberapa kolom angka).
class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: _StatItem(value: '6', label: 'Proyek')),
        Expanded(child: _StatItem(value: '5', label: 'Semester')),
        Expanded(child: _StatItem(value: '0', label: 'Sertifikat')),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    // Container dengan margin, padding, dan background putih.
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: MyApp.kPrimary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

/// Judul bagian: Icon + Text.
class _SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  const _SectionTitle({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: MyApp.kPrimary, size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: MyApp.kTextDark,
          ),
        ),
      ],
    );
  }
}

/// Kartu deskripsi "Tentang Saya".
class _AboutCard extends StatelessWidget {
  const _AboutCard();

  @override
  Widget build(BuildContext context) {
    // Widget Card untuk menampilkan informasi.
    return Card(
      elevation: 2,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Saya seorang mahasiswa yang menekuni mata kuliah pemrograman mobile II '
          'menggunakan Flutter. Senang mempelajari hal baru di bidang teknologi '
          'dan membangun aplikasi yang bermanfaat serta mudah digunakan.',
          style: TextStyle(fontSize: 14, height: 1.6, color: MyApp.kTextDark),
        ),
      ),
    );
  }
}

/// Daftar kontak menggunakan ListTile di dalam Card.
class _ContactList extends StatelessWidget {
  const _ContactList();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: Column(
        children: const [
          // Beberapa ListTile untuk menampilkan informasi kontak.
          ListTile(
            leading: Icon(Icons.email_outlined, color: MyApp.kAccent),
            title: Text('Email'),
            subtitle: Text('hilvan.career@gmail.com'),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.phone_outlined, color: MyApp.kAccent),
            title: Text('Telepon'),
            subtitle: Text('+62 ---'),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.link, color: MyApp.kAccent),
            title: Text('GitHub'),
            subtitle: Text('github.com/HilvanYadhisnata'),
          ),
        ],
      ),
    );
  }
}

/// Kumpulan chip keahlian — contoh penggunaan Row + Wrap.
class _SkillChips extends StatelessWidget {
  const _SkillChips();

  @override
  Widget build(BuildContext context) {
    const skills = ['Keamanan Jaringan', 'Pentesting', 'Pemrograman Mobile', 'UI/UX', 'Git', 'Rawr'];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: skills.map((s) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: MyApp.kAccent.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: MyApp.kAccent.withValues(alpha: 0.4)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, size: 14, color: MyApp.kPrimary),
              const SizedBox(width: 6),
              Text(
                s,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: MyApp.kPrimary,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

/// Teks footer di bagian bawah halaman.
class _FooterText extends StatelessWidget {
  const _FooterText();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(Icons.favorite, color: MyApp.kAccent, size: 18),
        SizedBox(height: 4),
        Text(
          'Dibuat dengan Flutter © 2026',
          style: TextStyle(fontSize: 12, color: Colors.black45),
        ),
      ],
    );
  }
}
