import 'dart:math';

class NameGenerator {
  final _random = Random();
  final _names = [
    'newstay',
    'lightstream',
    'mainbrake',
    'gray pine',
    'blue river',
    'dark cloud',
  ];

  String generate() {
    return _names[_random.nextInt(_names.length)];
  }
}
