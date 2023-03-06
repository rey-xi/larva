import 'larva_art.dart';

/// ## Larva Tone
/// [Avatar] Theme enumerations.
/// Can be passed literally in [LarvaArt.lockTo]
/// and [LarvaArt.read]. Can either be 'A' or 'B'
/// or 'C'.
/// ```dart
/// LarvaArt(
///   ...
///   tone: LarvaTone.A,
/// )
/// ```
enum LarvaTone {
  //...Enum
  /// Tone A. Literal: 'A' or 'a'
  A('A or a'),

  /// Tone B. Literal: 'B' or 'b'
  B('B or b'),

  /// Tone C. Literal: 'C' or 'c'
  C('C or c');

  //...Fields
  final String literal;

  const LarvaTone(this.literal);

  /// Generate Larva Tone from a dynamic value.
  /// Supports only integer and string. String
  /// only supports valid formats which includes
  /// '-12B' or '38'
  factory LarvaTone.from(value) {
    //...
    if (value is String) {
      final odd = RegExp(r'(-?\d+)([ABCabc])?');
      final match = odd.matchAsPrefix(value);
      final tone = match?.group(2);
      value = int.tryParse(match?.group(1) ?? '') ?? 0;
      if (tone != null) return LarvaTone.literal(tone);
    }
    if (value > 31) return C;
    if (value > 15) return B;
    return A;
  }

  /// Generate Larva Tone from it's literal form.
  /// Literal forms: 'A', 'a', 'B', 'b', 'C' and
  /// 'c'.
  factory LarvaTone.literal(String? slug) {
    //...
    if (slug == null) return A;
    if (slug.toLowerCase() == 'a') return A;
    if (slug.toLowerCase() == 'b') return B;
    if (slug.toLowerCase() == 'c') return C;
    return A;
  }

  //...Methods
  /// Deduce [LarvaToneCurl] from [AvatarCurl]
  /// using this tone as a request card.
  LarvaToneCurl themeOf(AvatarCurl curl) {
    //...
    final hash = {A: curl.a, B: curl.b, C: curl.c};
    return hash[this] ?? curl.a; // :) Loving this.
  }
}

class LarvaToneCurl {
  //...Fields
  final List<String> env, cloth;
  final List<String> head, mouth;
  final List<String> eyes, hair;

  const LarvaToneCurl({
    required this.env,
    required this.cloth,
    required this.head,
    required this.mouth,
    required this.eyes,
    required this.hair,
  });

  //...Operators
  List<String> operator [](String? key) {
    switch (key) {
      case 'env':
        return env;
      case 'cloth':
        return cloth;
      case 'head':
        return head;
      case 'mouth':
        return mouth;
      case 'eyes':
        return eyes;
      case 'hair':
        return hair;
    }
    return [];
  }
}
