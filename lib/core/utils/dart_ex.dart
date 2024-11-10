import 'package:intl/intl.dart';
extension DateEx on DateTime{
   String get toFormattedDate=> '$day / $month / $year';
 //  String get toFormattedDate{
 // DateFormat formater = DateFormat.yMMMd();
 // return formater.format(this);
 //  }
String get getDayName{
   DateFormat formater = DateFormat("E");
   return formater.format(this);
}
}