import 'package:homebrew/utils/coffee_tools.dart';
import 'package:test/test.dart';

void main() {
  group("cupsToOunces", () {
    test('calculates ounces on 1 cup', () {
      var ounces = CoffeeTools.cupsToOunces(1);
      expect(ounces, 6);
    });

    test('calculates ounces on positive number of cups', () {
      var ounces = CoffeeTools.cupsToOunces(4);
      expect(ounces, 24);
    });

    test('throws ArgumentError on zero', () {
      expect(() => CoffeeTools.cupsToOunces(0), throwsArgumentError);
    });

    test('throws ArgumentError on negative number', () {
      expect(() => CoffeeTools.cupsToOunces(-1), throwsArgumentError);
    });
  });

  group('cupsToGrams', () {
    test('calculates grams on 1 cup', () {
      var g = CoffeeTools.cupsToGrams(1);
      expect(g, greaterThan(170));
      expect(g, lessThan(171));
    });

    test('calculates grams on positive number of cups', () {
      var g = CoffeeTools.cupsToGrams(4);
      expect(g, greaterThan(680));
      expect(g, lessThan(681));
    });

    test('throws ArgumentError on zero', () {
      expect(() => CoffeeTools.cupsToGrams(0), throwsArgumentError);
    });

    test('throws ArgumentError on negative number', () {
      expect(() => CoffeeTools.cupsToGrams(-1), throwsArgumentError);
    });
  });

  group("calculateGrounds", () {
    test('calculates for French Press with 5 cups', () {
      var g = CoffeeTools.calculateGrounds("French_Press", 5);
      expect(g, greaterThan(60.0));
      expect(g, lessThan(61.0));
    });

    test('calculates for Drip Machine with 5 cups', () {
      var g = CoffeeTools.calculateGrounds("Drip_Machine", 5);
      expect(g, greaterThan(50.0));
      expect(g, lessThan(51.0));
    });

    test('throws ArgumentError on missing selected machine', () {
      expect(() => CoffeeTools.calculateGrounds("", 5), throwsArgumentError);
    });

    test('throws ArgumentError for missing cups', () {
      expect(() => CoffeeTools.calculateGrounds("Drip_Machine", 0), throwsArgumentError);
    });

  });
}
