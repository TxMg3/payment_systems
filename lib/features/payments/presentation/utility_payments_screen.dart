import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';


class UtilityPaymentsScreen extends StatelessWidget {
  const UtilityPaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
        title: Text("Kommunal to'lovlar", style: GoogleFonts.publicSans(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildUtilityTile(context, Icons.bolt, "Elektr energiyasi", "Toshkent shahar elektr tarmoqlari", Colors.orange),
          _buildUtilityTile(context, Icons.opacity, "Tabiiy gaz", "Hududgazta'minot AJ", Colors.blue),
          _buildUtilityTile(context, Icons.water_drop, "Sovuq suv va oqova", "Uzsuvta'minot AJ", Colors.cyan),
          _buildUtilityTile(context, Icons.fireplace, "Issiq suv", "Toshkent issiqlik markazi", Colors.red),
          _buildUtilityTile(context, Icons.delete_outline, "Chiqindi", "Maxsustrans", Colors.brown),
          _buildUtilityTile(context, Icons.home_outlined, "Uy-joy to'lovi", "E-Uy-joy xizmati", Colors.green),
        ],
      ),
    );
  }

  Widget _buildUtilityTile(BuildContext context, IconData icon, String title, String subtitle, Color color) {
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
          decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: GoogleFonts.publicSans(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: GoogleFonts.publicSans(fontSize: 12, color: const Color(0xFF64748B))),
        trailing: const Icon(Icons.chevron_right, color: Color(0xFFCBD5E1)),
        onTap: () => context.push('/payments/amount'),
      ),
    );
  }
}
