double parseDegreeSafe(String? s) {
  if (s == null) return 0;
  String sanitized = s.replaceAll(',', '.');
  return double.tryParse(sanitized) ?? 0;
}