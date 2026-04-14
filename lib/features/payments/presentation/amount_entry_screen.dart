import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_system/core/app_theme.dart';

class AmountEntryScreen extends StatefulWidget {
  final String title;
  const AmountEntryScreen({super.key, this.title = "To'lov"});

  @override
  State<AmountEntryScreen> createState() => _AmountEntryScreenState();
}

class _AmountEntryScreenState extends State<AmountEntryScreen> {
  String _amount = "0";

  void _onKeyPress(String value) {
    setState(() {
      if (value == "back") {
        if (_amount.length > 1) {
          _amount = _amount.substring(0, _amount.length - 1);
        } else {
          _amount = "0";
        }
      } else {
        if (_amount == "0") {
          _amount = value;
        } else {
          _amount += value;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
        title: Text(widget.title, style: GoogleFonts.publicSans(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          // Recipient Info
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFF1F5F9)),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.1),
                  child: const Icon(Icons.bolt, color: AppTheme.primaryColor, size: 28),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Elektr energiyasi', style: GoogleFonts.publicSans(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text('ID: 123456789', style: GoogleFonts.publicSans(color: const Color(0xFF64748B), fontSize: 14)),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          // Amount Display
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _amount,
                style: GoogleFonts.publicSans(fontSize: 48, fontWeight: FontWeight.bold, color: AppTheme.textPrimary),
              ),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  'UZS',
                  style: GoogleFonts.publicSans(fontSize: 20, fontWeight: FontWeight.bold, color: const Color(0xFF64748B)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(20)),
            child: Text('Balans: 12,450,000 UZS', style: GoogleFonts.publicSans(fontSize: 12, color: const Color(0xFF64748B))),
          ),
          const Spacer(),
          // Quick Amounts
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tezkor tanlov', style: GoogleFonts.publicSans(fontSize: 14, fontWeight: FontWeight.w500, color: const Color(0xFF64748B))),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildQuickAmount('50,000'),
                    _buildQuickAmount('100,000'),
                    _buildQuickAmount('500,000'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Comment
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Izoh (ixtiyoriy)',
                fillColor: const Color(0xFFF1F5F9),
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Keypad
          _Keypad(onPressed: _onKeyPress),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: _amount == "0" ? null : () => context.push('/confirm'),
              child: const Text("To'lovni davom ettirish"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAmount(String val) {
    return GestureDetector(
      onTap: () => setState(() => _amount = val.replaceAll(',', '')),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Text(val, style: GoogleFonts.publicSans(fontWeight: FontWeight.w600)),
      ),
    );
  }
}

class _Keypad extends StatelessWidget {
  final Function(String) onPressed;
  const _Keypad({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          _buildRow(['1', '2', '3']),
          _buildRow(['4', '5', '6']),
          _buildRow(['7', '8', '9']),
          _buildRow(['000', '0', 'back']),
        ],
      ),
    );
  }

  Widget _buildRow(List<String> keys) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: keys.map((k) {
          return GestureDetector(
            onTap: () => onPressed(k),
            child: SizedBox(
              width: 60,
              child: Center(
                child: k == "back"
                    ? const Icon(Icons.backspace_outlined, size: 24)
                    : Text(k, style: GoogleFonts.publicSans(fontSize: 24, fontWeight: FontWeight.w600)),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
