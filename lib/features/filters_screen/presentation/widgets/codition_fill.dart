import 'package:flutter/material.dart';

// Hava Durumu koşulunu gösteren küçük container
class ConditionPill extends StatelessWidget {
  const ConditionPill({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    String t = text.isEmpty ? '—' : text.toUpperCase();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: Text(
        t,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: .6,
        ),
      ),
    );
  }
}
