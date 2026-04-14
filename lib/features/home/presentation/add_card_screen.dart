import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  String _cardNumber = "0000 0000 0000 0000";
  String _expiry = "MM/YY";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
        title: Text("Yangi karta qo'shish", style: GoogleFonts.publicSans(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card Preview
            Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E293B), Color(0xFF334155)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.nfc, color: Colors.white),
                      Text("KARTA", style: GoogleFonts.publicSans(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Text(
                    _cardNumber,
                    style: GoogleFonts.robotoMono(color: Colors.white, fontSize: 22, letterSpacing: 2),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("MUROJAAT MUDDATI", style: GoogleFonts.publicSans(color: Colors.white.withValues(alpha: 0.6), fontSize: 10)),
                          Text(_expiry, style: GoogleFonts.publicSans(color: Colors.white, fontWeight: FontWeight.w500)),
                        ],
                      ),
                      const Icon(Icons.credit_card, color: Colors.white, size: 40),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Form
            Text("Karta raqami", style: GoogleFonts.publicSans(fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xFF334155))),
            const SizedBox(height: 8),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (val) => setState(() => _cardNumber = val.isEmpty ? "0000 0000 0000 0000" : val),
              decoration: const InputDecoration(hintText: "8600 **** **** ****"),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Amal qilish muddati", style: GoogleFonts.publicSans(fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xFF334155))),
                      const SizedBox(height: 8),
                      TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (val) => setState(() => _expiry = val.isEmpty ? "MM/YY" : val),
                        decoration: const InputDecoration(hintText: "MM/YY"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Karta nomi (Ixtiyoriy)", style: GoogleFonts.publicSans(fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xFF334155))),
                      const SizedBox(height: 8),
                      const TextField(decoration: InputDecoration(hintText: "Masalan: Asosiy")),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Kartani qo'shish"),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const Icon(Icons.shield_outlined, color: Color(0xFF10B981), size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Sizning ma'lumotlaringiz xavfsiz himoyalangan.",
                    style: GoogleFonts.publicSans(fontSize: 12, color: const Color(0xFF64748B)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
