import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_system/core/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppTheme.primaryColor, Color(0xFF1D4ED8)],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=shehroz'),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Shehrozbek Tohirov',
                      style: GoogleFonts.publicSans(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '+998 90 123 45 67',
                      style: GoogleFonts.publicSans(color: Colors.white.withValues(alpha: 0.8), fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader('Shaxsiy ma\'lumotlar'),
                  _buildProfileTile(Icons.person_outline, 'Mening profilim', 'Ma\'lumotlarni o\'zgartirish'),
                  _buildProfileTile(Icons.credit_card_outlined, 'Bank kartalari', '2 ta karta ulangan'),
                  _buildProfileTile(Icons.security_outlined, 'Xavfsizlik', 'Parol va biometrika'),
                  const SizedBox(height: 24),
                  _buildSectionHeader('Ilova sozlamalari'),
                  _buildProfileTile(Icons.language_outlined, 'Ilova tili', 'O\'zbekcha'),
                  _buildProfileTile(Icons.notifications_none_outlined, 'Bildirishnomalar', 'Yoqilgan'),
                  _buildProfileTile(Icons.dark_mode_outlined, 'Tungi rejim', 'O\'chirilgan'),
                  const SizedBox(height: 24),
                  _buildSectionHeader('Yordam'),
                  _buildProfileTile(Icons.help_outline, 'Yordam markazi', 'FAQ va chat'),
                  _buildProfileTile(Icons.info_outline, 'Ilova haqida', 'Versiya 1.0.0'),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () => context.go('/login'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Color(0xFFFEE2E2)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.logout, size: 20),
                        SizedBox(width: 8),
                        Text('Tizimdan chiqish'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title,
        style: GoogleFonts.publicSans(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xFF64748B), letterSpacing: 0.5),
      ),
    );
  }

  Widget _buildProfileTile(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: const Color(0xFF475569), size: 20),
        ),
        title: Text(title, style: GoogleFonts.publicSans(fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
        subtitle: Text(subtitle, style: GoogleFonts.publicSans(fontSize: 12, color: const Color(0xFF64748B))),
        trailing: const Icon(Icons.chevron_right, color: Color(0xFFCBD5E1)),
        onTap: () {},
      ),
    );
  }
}
