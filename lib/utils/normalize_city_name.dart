String normalizeCityName(String name) {
  return name
      .toLowerCase()
      .replaceAll('ş', 's')
      .replaceAll('ı', 'i')
      .replaceAll('ö', 'o')
      .replaceAll('ü', 'u')
      .replaceAll('ç', 'c')
      .replaceAll('ğ', 'g');
}
