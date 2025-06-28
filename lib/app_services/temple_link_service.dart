class TempleLinkService {
  static const Map<String, String> samajToTempleMap = {
    'Gujarati': 'Shree Somnaath Temple',
    'Marathi': 'Shree Siddhivinayak Mandir',
    'Rajasthani': 'Birla Mandir',
    'Punjabi': 'Golden Temple',
    'Bengali': 'Dakshineswar Kali Temple',
    'Tamil': 'Meenakshi Temple',
    'Telugu': 'Tirupati Balaji',
    'Malayali': 'Sabarimala Temple',
    'Other': 'Universal Samaj Mandir',
  };

  static String getTempleForSamaj(String samaj) {
    return samajToTempleMap[samaj] ?? 'Default Temple';
  }
}
