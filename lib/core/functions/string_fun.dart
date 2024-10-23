extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');

  String cutZeros() {
    double? num = double.tryParse(this);
    if (num!=null) {
      int intNum = num.toInt();
     final result =  num - intNum;
     if (result == 0) {
       return intNum.toString();
     }  else{
       return num.toString();
     }
    }  else{
      return '';
    }
  }

}
