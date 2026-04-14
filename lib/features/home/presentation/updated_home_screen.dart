import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_system/core/app_theme.dart';

class UpdatedHomeScreen extends StatelessWidget {
  const UpdatedHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=shehroz'),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Xush kelibsiz',
              style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF6B7280)),
            ),
            Text(
              'Shehrozbek',
              style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xFF111827)),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined, color: Color(0xFF111827)),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Color(0xFF111827)),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Balance Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryColor.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Umumiy balans',
                    style: GoogleFonts.inter(color: Colors.white.withValues(alpha: 0.8), fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '16,700,000',
                        style: GoogleFonts.inter(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text(
                          'UZS',
                          style: GoogleFonts.inter(color: Colors.white.withValues(alpha: 0.8), fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      _buildBalanceAction(Icons.add_circle_outline, 'To\'ldirish'),
                      const SizedBox(width: 12),
                      _buildBalanceAction(Icons.arrow_downward, 'Yechib olish'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Quick Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _QuickAction(Icons.swap_horiz, 'O\'tkazmalar', Color(0xFFEFF6FF)),
                _QuickAction(Icons.qr_code_scanner, 'To\'lovlar', Color(0xFFF0FDF4)),
                _QuickAction(Icons.account_balance_wallet, 'Hamyon', Color(0xFFFAF5FF)),
                _QuickAction(Icons.more_horiz, 'Barchasi', Color(0xFFFFF7ED)),
              ],
            ),
            const SizedBox(height: 32),
            // Cards Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mening kartalarim',
                  style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xFF111827)),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Barchasi'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _CardItem(
                    bank: 'Humo',
                    number: '**** 4412',
                    balance: '12,400,000 UZS',
                    color: Color(0xFF1E293B),
                    isMain: true,
                  ),
                  SizedBox(width: 16),
                  _CardItem(
                    bank: 'Uzcard',
                    number: '**** 8842',
                    balance: '4,300,000 UZS',
                    color: Color(0xFF3B82F6),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Recent Transactions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Oxirgi amaliyotlar',
                  style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xFF111827)),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Tarix'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _TransactionTile(Icons.bolt, 'Elektr energiyasi', 'Bugun, 14:20', '- 125,000 UZS', Colors.orange),
            _TransactionTile(Icons.shopping_bag_outlined, 'Korzinka.uz', 'Kecha, 18:45', '- 450,000 UZS', Colors.green),
            _TransactionTile(Icons.phone_android, 'Beeline', 'Kecha, 10:15', '- 20,000 UZS', Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceAction(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 16),
          const SizedBox(width: 8),
          Text(label, style: GoogleFonts.inter(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _QuickAction(this.icon, this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
          child: Icon(icon, color: AppTheme.primaryColor),
        ),
        const SizedBox(height: 8),
        Text(label, style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF64748B))),
      ],
    );
  }
}

class _CardItem extends StatelessWidget {
  final String bank;
  final String number;
  final String balance;
  final Color color;
  final bool isMain;
  const _CardItem({required this.bank, required this.number, required this.balance, required this.color, this.isMain = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(bank, style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              if (isMain)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(8)),
                  child: Text('Asosiy', style: GoogleFonts.inter(color: Colors.white, fontSize: 10)),
                ),
            ],
          ),
          const SizedBox(height: 20),
          Text(number, style: GoogleFonts.robotoMono(color: Colors.white, fontSize: 16, letterSpacing: 2)),
          const Spacer(),
          Text(balance, style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        ],
      ),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String time;
  final String amount;
  final Color iconColor;
  const _TransactionTile(this.icon, this.title, this.time, this.amount, this.iconColor);

  @override
  Widget build(BuildContext context) {
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
            decoration: BoxDecoration(color: iconColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: const Color(0xFF1E293B))),
                Text(time, style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF64748B))),
              ],
            ),
          ),
          Text(amount, style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: const Color(0xFFEF4444))),
        ],
      ),
    );
  }
}
