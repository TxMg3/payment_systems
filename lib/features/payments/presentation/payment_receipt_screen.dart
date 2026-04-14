import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_system/core/app_theme.dart';

class PaymentReceiptScreen extends StatelessWidget {
  const PaymentReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.close)),
        title: Text("To'lov kvitansiyasi", style: GoogleFonts.publicSans(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 20, offset: const Offset(0, 4)),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: const BoxDecoration(color: Color(0xFFF0FDF4), shape: BoxShape.circle),
                    child: const Icon(Icons.check_circle, color: Color(0xFF10B981), size: 40),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "To'lov muvaffaqiyatli",
                    style: GoogleFonts.publicSans(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xFF10B981)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "14 Aprel 2026, 14:20",
                    style: GoogleFonts.publicSans(fontSize: 14, color: const Color(0xFF64748B)),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "125,000 UZS",
                    style: GoogleFonts.publicSans(fontSize: 32, fontWeight: FontWeight.bold, color: AppTheme.textPrimary),
                  ),
                  const SizedBox(height: 24),
                  const Divider(color: Color(0xFFF1F5F9)),
                  const SizedBox(height: 16),
                  _buildReceiptRow("To'lov turi", "Elektr energiyasi"),
                  _buildReceiptRow("Hisob raqami", "123456789"),
                  _buildReceiptRow("Kvitansiya raqami", "#TR-984512"),
                  _buildReceiptRow("Karta", "Humo **** 4412"),
                  _buildReceiptRow("Komissiya", "0 UZS"),
                  const SizedBox(height: 16),
                  const Divider(color: Color(0xFFF1F5F9)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Umumiy miqdor", style: GoogleFonts.publicSans(fontWeight: FontWeight.w600, color: const Color(0xFF64748B))),
                      Text("125,000 UZS", style: GoogleFonts.publicSans(fontWeight: FontWeight.bold, fontSize: 18, color: AppTheme.primaryColor)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.share_outlined, size: 18),
                    label: const Text("Ulashish"),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(0, 56),
                      side: const BorderSide(color: AppTheme.primaryColor),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.download_outlined, size: 18),
                    label: const Text("Saqlash"),
                    style: ElevatedButton.styleFrom(minimumSize: const Size(0, 56)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => context.go('/'),
              child: const Text("Asosiy sahifaga qaytish"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReceiptRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: GoogleFonts.publicSans(color: const Color(0xFF64748B))),
          Text(value, style: GoogleFonts.publicSans(fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
        ],
      ),
    );
  }
}
