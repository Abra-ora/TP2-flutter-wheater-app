extension StringExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';

  String get allInCaps => this.toUpperCase();

  String get capitalizeFirstOfEach =>
      split(" ").map((str) => str.inCaps).join(" ");
}
