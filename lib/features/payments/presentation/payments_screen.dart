import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_system/core/app_theme.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "To'lovlar",
          style: GoogleFonts.publicSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF0F172A),
            letterSpacing: -0.5,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Stack(
              children: [
                const Icon(Icons.notifications_outlined, color: Color(0xFF0F172A)),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppTheme.primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Xizmatlarni qidirish',
                  prefixIcon: const Icon(Icons.search, color: Color(0xFF64748B)),
                  fillColor: const Color(0xFFE2E8F0).withValues(alpha: 0.5),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Favorites
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Saqlangan to'lovlar",
                    style: GoogleFonts.publicSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0F172A),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Hammasi',
                      style: GoogleFonts.publicSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  FavoriteItem(icon: Icons.smartphone, label: "Mening\nraqamim"),
                  SizedBox(width: 16),
                  FavoriteItem(icon: Icons.wifi, label: "Internet uy"),
                  SizedBox(width: 16),
                  FavoriteItem(icon: Icons.bolt, label: "Elektr\nenergiya"),
                  SizedBox(width: 16),
                  FavoriteItem(icon: Icons.opacity, label: "Suv to'lovi"),
                  SizedBox(width: 16),
                  AddFavoriteItem(),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Barcha xizmatlar',
                style: GoogleFonts.publicSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0F172A),
                ),
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.6,
              children: [
                const CategoryCard(icon: Icons.phone_android, label: "Mobil aloqa"),
                GestureDetector(
                  onTap: () => context.push('/payments/utility'),
                  child: const CategoryCard(icon: Icons.home_work_outlined, label: "Kommunal to'lovlar"),
                ),
                const CategoryCard(icon: Icons.language, label: "Internet xizmatlari"),
                const CategoryCard(icon: Icons.tv, label: "Televideniye"),
                const CategoryCard(icon: Icons.account_balance, label: "Davlat xizmatlari"),
                const CategoryCard(icon: Icons.volunteer_activism, label: "Xayriya"),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class FavoriteItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const FavoriteItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE2E8F0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.1,
                  child: Container(color: AppTheme.primaryColor),
                ),
              ),
              Center(child: Icon(icon, color: AppTheme.primaryColor, size: 24)),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.publicSans(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF0F172A),
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

class AddFavoriteItem extends StatelessWidget {
  const AddFavoriteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFCBD5E1), style: BorderStyle.solid, width: 2),
          ),
          child: const Center(child: Icon(Icons.add, color: Color(0xFF64748B))),
        ),
        const SizedBox(height: 8),
        Text(
          "Qo'shish",
          style: GoogleFonts.publicSans(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF64748B),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryCard({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppTheme.primaryColor, size: 20),
          ),
          Text(
            label,
            style: GoogleFonts.publicSans(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF0F172A),
            ),
          ),
        ],
      ),
    );
  }
}
