import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_system/core/app_theme.dart';

class SecurityConfirmationScreen extends StatefulWidget {
  const SecurityConfirmationScreen({super.key});

  @override
  State<SecurityConfirmationScreen> createState() => _SecurityConfirmationScreenState();
}

class _SecurityConfirmationScreenState extends State<SecurityConfirmationScreen> {
  final List<String> _pin = [];

  void _onKeyPress(String val) {
    if (val == "back") {
      if (_pin.isNotEmpty) setState(() => _pin.removeLast());
    } else {
      if (_pin.length < 4) setState(() => _pin.add(val));
    }

    if (_pin.length == 4) {
      // Simulate confirmation
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) context.go('/receipt');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(color: AppTheme.primaryColor.withValues(alpha: 0.1), shape: BoxShape.circle),
            child: const Icon(Icons.shield_outlined, color: AppTheme.primaryColor, size: 32),
          ),
          const SizedBox(height: 24),
          Text(
            "Tasdiqlash kodi",
            style: GoogleFonts.publicSans(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.textPrimary),
          ),
          const SizedBox(height: 12),
          Text(
            "Amaliyotni tasdiqlash uchun PIN-kodni kiriting",
            style: GoogleFonts.publicSans(fontSize: 16, color: const Color(0xFF64748B)),
          ),
          const SizedBox(height: 48),
          // PIN indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              bool isFilled = index < _pin.length;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isFilled ? AppTheme.primaryColor : const Color(0xFFE2E8F0),
                  border: isFilled ? null : Border.all(color: const Color(0xFFCBD5E1)),
                ),
              );
            }),
          ),
          const Spacer(),
          // Keypad
          _NumericKeypad(onPressed: _onKeyPress),
          const SizedBox(height: 32),
          TextButton(
            onPressed: () {},
            child: Text(
              "PIN-kodni unutdingizmi?",
              style: GoogleFonts.publicSans(fontWeight: FontWeight.w600, color: AppTheme.primaryColor),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _NumericKeypad extends StatelessWidget {
  final Function(String) onPressed;
  const _NumericKeypad({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        children: [
          _buildRow(['1', '2', '3']),
          _buildRow(['4', '5', '6']),
          _buildRow(['7', '8', '9']),
          _buildRow(['fingerprint', '0', 'back']),
        ],
      ),
    );
  }

  Widget _buildRow(List<String> keys) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: keys.map((k) {
          return GestureDetector(
            onTap: () => onPressed(k),
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Center(
                child: _buildKeyContent(k),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildKeyContent(String k) {
    if (k == "back") return const Icon(Icons.backspace_outlined, size: 24, color: Color(0xFF475569));
    if (k == "fingerprint") return const Icon(Icons.fingerprint, size: 32, color: AppTheme.primaryColor);
    return Text(k, style: GoogleFonts.publicSans(fontSize: 28, fontWeight: FontWeight.w500, color: const Color(0xFF1E293B)));
  }
}
