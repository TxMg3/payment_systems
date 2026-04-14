import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_system/core/app_theme.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Login sahifasiga qaytish",
          style: GoogleFonts.publicSans(fontSize: 16, fontWeight: FontWeight.w500, color: const Color(0xFF64748B)),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.lock_reset, color: AppTheme.primaryColor, size: 32),
              ),
              const SizedBox(height: 24),
              Text(
                'Parolni tiklash',
                style: GoogleFonts.publicSans(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Tasdiqlash kodini olish uchun telefon raqamingizni kiriting. Biz sizga 6 xonali kodni SMS orqali yuboramiz.",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 40),
              // Phone
              Text(
                'Telefon raqami',
                style: GoogleFonts.publicSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: '(_ _) _ _ _ _ _ _ _',
                  prefixIcon: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.phone_outlined, color: Color(0xFF64748B), size: 20),
                        const SizedBox(width: 8),
                        Text(
                          '+998',
                          style: GoogleFonts.publicSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Kodni yuborish"),
                    SizedBox(width: 8),
                    Icon(Icons.send_outlined, size: 18),
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Yordam kerakmi?",
                      style: GoogleFonts.publicSans(fontSize: 14, color: const Color(0xFF64748B)),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Yordam xizmati: 1212",
                      style: GoogleFonts.publicSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
