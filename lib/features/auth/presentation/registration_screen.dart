import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_system/core/app_theme.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Ro'yxatdan o'tish",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hisob yaratish',
                style: GoogleFonts.publicSans(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Davom etish uchun ma’lumotlaringizni kiriting va bank xizmatlaridan foydalaning.",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 40),
              // Full Name
              Text(
                'Ism va familiya',
                style: GoogleFonts.publicSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Ism va familiyangizni kiriting',
                  prefixIcon: const Icon(Icons.person_outline, color: Color(0xFF64748B)),
                ),
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              // Password
              Text(
                'Parol',
                style: GoogleFonts.publicSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF334155),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Kamida 8 ta belgi',
                  prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF64748B)),
                  suffixIcon: const Icon(Icons.visibility_off_outlined, color: Color(0xFF6B7280)),
                ),
              ),
              const SizedBox(height: 24),
              // Terms
              Row(
                children: [
                  Checkbox(
                    value: _agreedToTerms,
                    onChanged: (val) => setState(() => _agreedToTerms = val ?? false),
                    activeColor: AppTheme.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                  Expanded(
                    child: Text(
                      "Men Foydalanish shartlari va maxfiylik siyosatiga roziman.",
                      style: GoogleFonts.publicSans(
                        fontSize: 14,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Register Button
              ElevatedButton(
                onPressed: _agreedToTerms ? () {} : null,
                child: const Text("Ro'yxatdan o'tish"),
              ),
              const SizedBox(height: 40),
              // Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hisobingiz bormi? ",
                    style: GoogleFonts.publicSans(
                      fontSize: 16,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Text(
                      "Tizimga kirish",
                      style: GoogleFonts.publicSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
