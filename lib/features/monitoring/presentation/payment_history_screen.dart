import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_system/core/app_theme.dart';

class PaymentHistoryScreen extends StatelessWidget {
  const PaymentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To'lovlar tarixi", style: GoogleFonts.publicSans(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.tune_outlined, color: AppTheme.textPrimary)),
        ],
      ),
      body: Column(
        children: [
          // Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                _buildFilterChip('Barchasi', true),
                _buildFilterChip('Kirim', false),
                _buildFilterChip('Chiqim', false),
                _buildFilterChip('O\'tkazmalar', false),
                _buildFilterChip('Xizmatlar', false),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildDateHeader('Bugun, 14 Aprel'),
                _buildHistoryItem(Icons.phone_android, 'Payer: Beeline', '14:20', '- 20,000 UZS', Colors.blue),
                _buildHistoryItem(Icons.account_balance_wallet_outlined, 'Kirim: Azizbek T.', '12:45', '+ 1,200,000 UZS', Colors.green, isPositive: true),
                _buildHistoryItem(Icons.shopping_bag_outlined, 'Korzinka.uz', '10:15', '- 345,000 UZS', Colors.green),
                const SizedBox(height: 24),
                _buildDateHeader('Kecha, 13 Aprel'),
                _buildHistoryItem(Icons.bolt, 'Elektr energiyasi', '18:30', '- 125,000 UZS', Colors.orange),
                _buildHistoryItem(Icons.language, 'Uzonline', '15:20', '- 100,000 UZS', Colors.purple),
                _buildHistoryItem(Icons.tv, 'Uzdigital TV', '09:45', '- 45,000 UZS', Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isSelected ? AppTheme.primaryColor : const Color(0xFFE2E8F0)),
      ),
      child: Text(
        label,
        style: GoogleFonts.publicSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: isSelected ? Colors.white : const Color(0xFF64748B),
        ),
      ),
    );
  }

  Widget _buildDateHeader(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        date,
        style: GoogleFonts.publicSans(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF64748B),
        ),
      ),
    );
  }

  Widget _buildHistoryItem(IconData icon, String title, String time, String amount, Color iconColor, {bool isPositive = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.publicSans(fontWeight: FontWeight.bold, color: AppTheme.textPrimary)),
                Text(time, style: GoogleFonts.publicSans(fontSize: 12, color: const Color(0xFF64748B))),
              ],
            ),
          ),
          Text(
            amount,
            style: GoogleFonts.publicSans(
              fontWeight: FontWeight.bold,
              color: isPositive ? const Color(0xFF10B981) : const Color(0xFFEF4444),
            ),
          ),
        ],
      ),
    );
  }
}
