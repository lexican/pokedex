extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String capitalizeAllWordsSepByDash() {
    List<String> strArr = split('-');
    String result = strArr.map((s) => s.capitalize()).join(' ');
    return result;
  }
}
