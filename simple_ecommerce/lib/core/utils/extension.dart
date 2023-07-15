extension StringExtension on String {
  String toCapital() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
