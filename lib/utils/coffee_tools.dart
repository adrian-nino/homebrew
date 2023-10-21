import 'dart:ffi';

class CoffeeTools {
  // Input: number of cups (positive integer)
  // Output: number of ounces in a cup
  static int cupsToOunces(int cups) {
    if (cups <= 0) {
      throw ArgumentError();
    }
    return cups * 6;
  }

  static double cupsToGrams(int cups) {
    if (cups <= 0) {
      throw ArgumentError();
    }
    return cupsToOunces(cups) * 28.35;
  }

  static double calculateGrounds(String machine, int cups) {
    if (cups <= 0) throw ArgumentError();
    if (machine == "French_Press") {
      return cupsToGrams(cups) / 14.0;
    } else if (machine == "Drip_Machine") {
      return cupsToGrams(cups) / 17.0;
    }
    else {
      throw ArgumentError();
    }
  }
}
