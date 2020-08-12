final kTextRegEx = RegExp(
  r'^[a-zA-Z]+$',
  caseSensitive: false,
);
final kNumberRegEx = RegExp(r'^[0-9]+$');
final kEmailRegEx = RegExp(
  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  caseSensitive: false,
);
final kUrlRegEx = RegExp(
  r"(https?|http|ftp)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?",
  caseSensitive: false,
);
