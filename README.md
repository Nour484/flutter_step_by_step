# Types of Constructors in Dart  final vs const

## Generative Constructors
Generative constructors are used to create instances of a class.
```dart
class Point {
  double x;
  double y;

  // Generative constructor with initializing formal parameters:
  Point(this.x, this.y);
}
```

## Default Constructors
If no constructor is declared, Dart provides a default constructor, which is a generative constructor without arguments or names.

## Named Constructors
Named constructors allow a class to have multiple constructors or provide extra clarity.
```dart
const double xOrigin = 0;
const double yOrigin = 0;

class Point {
  final double x;
  final double y;

  // Sets the x and y instance variables before the constructor body runs.
  Point(this.x, this.y);

  // Named constructor
  Point.origin() : x = xOrigin, y = yOrigin;
}
```

## Constant Constructors
Constant constructors are used for classes that produce immutable objects.
```dart
class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);

  final double x, y;

  const ImmutablePoint(this.x, this.y);
}
```

## Redirecting Constructors
A constructor may redirect to another constructor in the same class using `this`.
```dart
class Point {
  double x, y;

  // The main constructor for this class.
  Point(this.x, this.y);

  // Redirecting constructor.
  Point.alongXAxis(double x) : this(x, 0);
}
```

## Factory Constructors
Factory constructors are used when:
- The constructor does not always create a new instance.
- Additional processing is needed before instantiation.
```dart
class Logger {
  final String name;
  bool mute = false;

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}

// Usage
var logger = Logger('UI');
logger.log('Button clicked');

var logMap = {'name': 'UI'};
var loggerJson = Logger.fromJson(logMap);
```

### Note:
- Factory constructors cannot access `this`.
- They can return an existing instance or a new instance of a subtype.

