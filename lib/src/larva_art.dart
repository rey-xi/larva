library larva.art;

import 'dart:convert';

import 'package:crypto/crypto.dart';

import 'larva_tone.dart';

part 'larva_art/a_team.dart';
part 'larva_art/afro_hair.dart';
part 'larva_art/asian.dart';
part 'larva_art/bitch.dart';
part 'larva_art/blond.dart';
part 'larva_art/blonde.dart';
part 'larva_art/country.dart';
part 'larva_art/dude.dart';
part 'larva_art/fire_hair.dart';
part 'larva_art/girl.dart';
part 'larva_art/guy.dart';
part 'larva_art/meta.dart';
part 'larva_art/older.dart';
part 'larva_art/punk.dart';
part 'larva_art/rasta.dart';
part 'larva_art/robot.dart';
part 'larva_art/temp.dart';
part 'larva_art/utils.dart';

/// ## Avatar Link or Larva Art
/// Larva Art class. Reference larva arts provided by
/// [AvatarCurl] objects. Call [print] to get it's SVG
/// equivalent.
/// ```dart
/// final art = Avatar.lockTo('Emmanuel');
/// ```
class Avatar {
  //...Enum
  /// LarvaArt [00]
  static const robot = Avatar.at(00);

  /// LarvaArt [01]
  static const girl = Avatar.at(01);

  /// LarvaArt [02]
  static const blonde = Avatar.at(02);

  /// LarvaArt [03]
  static const guy = Avatar.at(03);

  /// LarvaArt [04]
  static const country = Avatar.at(04);

  /// LarvaArt [05]
  static const dude = Avatar.at(05);

  /// LarvaArt [06]
  static const asian = Avatar.at(06);

  /// LarvaArt [07]
  static const punk = Avatar.at(07);

  /// LarvaArt [08]
  static const afroHair = Avatar.at(08);

  /// LarvaArt [09]
  static const bitch = Avatar.at(09);

  /// LarvaArt [10]
  static const older = Avatar.at(10);

  /// LarvaArt [11]
  static const fireHair = Avatar.at(11);

  /// LarvaArt [12]
  static const blond = Avatar.at(12);

  /// LarvaArt [13]
  static const aTeam = Avatar.at(13);

  /// LarvaArt [14]
  static const rasta = Avatar.at(14);

  /// LarvaArt [15]
  static const meta = Avatar.at(15);

  //...Fields
  final int env;
  final int head;
  final int cloth;
  final int mouth;
  final int eyes;
  final int hair;
  final String phrase;
  final LarvaTone tone;

  const Avatar._({
    this.env = -0x1,
    this.head = 0x0,
    this.cloth = 0x0,
    this.mouth = 0x0,
    this.eyes = 0x0,
    this.hair = 0x0,
    this.phrase = '',
    this.tone = LarvaTone.A,
  });

  /// Get the complete [Avatar] defined at [index]. This
  /// constructor was used in defining each contemporary
  /// Avatar.
  const Avatar.at(int index)
      //...
      : this._(
          env: index,
          head: index,
          cloth: index,
          mouth: index,
          eyes: index,
          hair: index,
        );

  /// Read out art from a direct literal avatar [slug]
  /// Supported Slug format: `00 00 00 00 00 00 A` .*
  const Avatar.read(String slug) : this._(phrase: slug);

  /// Create a random LarvaArt using [key]. The result
  /// is not so random as same [key] value will always
  /// produce the same [Avatar] object
  const Avatar.lockOn(String key) : this._(phrase: key);

  //...Methods
  Avatar get _init {
    //...
    final code = RegExp(
      r'^\s*(-?\d+\w?) (-?\d+\w?) (-?\d+\w?) (-?\d+'
      r'\w?) (-?\d+\w?) (-?\d+\w?)( [ABCabc])?\s*$',
    );
    final match = code.matchAsPrefix(phrase);
    final env = _abbrev(match?.group(1) ?? '-1');
    final head = _abbrev(match?.group(2) ?? '0');
    final cloth = _abbrev(match?.group(3) ?? '0');
    final mouth = _abbrev(match?.group(4) ?? '0');
    final eyes = _abbrev(match?.group(5) ?? '0');
    final hair = _abbrev(match?.group(6) ?? '0');
    final toneStr = match?.group(7)?.trim();
    //...
    if (phrase.isEmpty) return this;
    if ((match?.groupCount ?? 0) == 0) {
      final code = RegExp(r'(.+?)( ?: ?([ABCabc]))?$');
      final match = code.matchAsPrefix(phrase);
      final lock = match?.group(1) ?? 'empty text';
      final toneStr = match?.group(3)?.trim();
      Digest hash = sha256.convert(utf8.encode(lock));
      String digits = '$hash'.replaceAll(RegExp(r'\D'), '');
      digits = digits.substring(0, 12);
      //...
      return Avatar._(
        env: _abbrev('${digits[0]}${digits[1]}'),
        head: _abbrev('${digits[2]}${digits[3]}'),
        cloth: _abbrev('${digits[4]}${digits[5]}'),
        mouth: _abbrev('${digits[6]}${digits[7]}'),
        eyes: _abbrev('${digits[8]}${digits[9]}'),
        hair: _abbrev('${digits[10]}${digits[11]}'),
        tone: LarvaTone.literal(toneStr),
      );
    }
    return Avatar._(
      env: env,
      head: head,
      cloth: cloth,
      mouth: mouth,
      eyes: eyes,
      hair: hair,
      tone: LarvaTone.literal(toneStr),
    );
  }

  static int _abs(value) {
    //...
    if (value is String) {
      final odd = RegExp(r'(-?\d+)([ABCabc])?');
      final match = odd.matchAsPrefix(value);
      value = int.tryParse(match?.group(1) ?? '');
    }
    if (value > 31) return value - 32;
    if (value > 15) return value - 16;
    return value;
  }

  static int _abbrev(value) {
    //...
    if (value is String) {
      final odd = RegExp(r'(-?\d+)([ABCabc])?');
      final match = odd.matchAsPrefix(value);
      final tone = match?.group(2);
      value = int.tryParse(match?.group(1) ?? '');
      if (tone != null) {
        if (tone.toLowerCase() == 'c') return value + 32;
        if (tone.toLowerCase() == 'b') return value + 16;
        if (tone.toLowerCase() == 'a') return value;
      }
    }
    return value;
  }

  Avatar copyWith({
    int? env,
    int? head,
    int? cloth,
    int? mouth,
    int? eyes,
    int? hair,
    LarvaTone? tone,
  }) {
    //...
    return Avatar._(
      tone: tone ?? this.tone,
      env: env ?? this.env,
      head: head ?? this.head,
      cloth: cloth ?? this.cloth,
      mouth: mouth ?? this.mouth,
      eyes: eyes ?? this.eyes,
      hair: hair ?? this.hair,
    );
  }

  String print() {
    //...
    final init = _init;
    final env = _abs(init.env).clamp(-1, 15);
    final head = _abs(init.head).clamp(-1, 15);
    final cloth = _abs(init.cloth).clamp(-1, 15);
    final mouth = _abs(init.mouth).clamp(-1, 15);
    final eyes = _abs(init.eyes).clamp(-1, 15);
    final hair = _abs(init.hair).clamp(-1, 15);
    //...
    final curl = AvatarCurl._(
      env: (_ht[env] ?? _temp).printEnv(LarvaTone.from(init.env)),
      head: (_ht[head] ?? _robot).printHead(LarvaTone.from(init.head)),
      cloth: (_ht[cloth] ?? _robot).printCloth(LarvaTone.from(init.cloth)),
      mouth: (_ht[mouth] ?? _robot).printMouth(LarvaTone.from(init.mouth)),
      eyes: (_ht[eyes] ?? _robot).printEyes(LarvaTone.from(init.eyes)),
      hair: (_ht[hair] ?? _robot).printHair(LarvaTone.from(init.hair)),
      a: LarvaToneCurl(
        env: (_ht[env] ?? _robot).a.env,
        cloth: (_ht[cloth] ?? _robot).a.cloth,
        head: (_ht[head] ?? _robot).a.head,
        mouth: (_ht[mouth] ?? _robot).a.mouth,
        eyes: (_ht[eyes] ?? _robot).a.eyes,
        hair: (_ht[hair] ?? _robot).a.hair,
      ),
      b: LarvaToneCurl(
        env: (_ht[env] ?? _robot).b.env,
        cloth: (_ht[cloth] ?? _robot).b.cloth,
        head: (_ht[head] ?? _robot).b.head,
        mouth: (_ht[mouth] ?? _robot).b.mouth,
        eyes: (_ht[eyes] ?? _robot).b.eyes,
        hair: (_ht[hair] ?? _robot).b.hair,
      ),
      c: LarvaToneCurl(
        env: (_ht[env] ?? _robot).c.env,
        cloth: (_ht[cloth] ?? _robot).c.cloth,
        head: (_ht[head] ?? _robot).c.head,
        mouth: (_ht[mouth] ?? _robot).c.mouth,
        eyes: (_ht[eyes] ?? _robot).c.eyes,
        hair: (_ht[hair] ?? _robot).c.hair,
      ),
    );
    return curl.print(tone);
  }
}

/// ## Avatar Curl or Larva Art Curl
/// [Avatar] configuration. Used to encode it's data
/// to ensure attribute mixing. Soft* Passively used!
/// Deemed to be less important;
class AvatarCurl {
  //...Fields
  final LarvaToneCurl a, b, c;
  final String env, cloth;
  final String head, mouth;
  final String eyes, hair;

  const AvatarCurl._({
    this.env = _env,
    this.head = _head,
    required this.cloth,
    required this.mouth,
    required this.eyes,
    required this.hair,
    required this.a,
    required this.b,
    required this.c,
  });

  //...Methods
  String print([LarvaTone tone = LarvaTone.A]) {
    //...
    String curl = '';
    curl += _resolve('env', tone) + _resolve('head', tone);
    curl += _resolve('cloth', tone) + _resolve('hair', tone);
    curl += _resolve('eyes', tone) + _resolve('mouth', tone);
    return '<svg xmlns="http://www.w3.org/2000/svg" viewBox'
        '="0 0 231 231">$curl</svg>'; //@+xmlns'...2000/svg'
  }

  String printEnv(LarvaTone tone) => _resolve('env', tone);

  String printHead(LarvaTone tone) => _resolve('head', tone);

  String printCloth(LarvaTone tone) => _resolve('cloth', tone);

  String printEyes(LarvaTone tone) => _resolve('eyes', tone);

  String printMouth(LarvaTone tone) => _resolve('mouth', tone);

  String printHair(LarvaTone tone) => _resolve('hair', tone);

  String _resolve(String part, LarvaTone tone) {
    //...
    final parts = {
      'env': env,
      'cloth': cloth,
      'head': head,
      'mouth': mouth,
      'eyes': eyes,
      'hair': hair,
    };
    //...
    final colors = tone.themeOf(this)[part];
    final svg = parts[part];
    String regex = r"(#.*?;)";
    String resultFinal = svg ?? '';
    final matches = RegExp(regex).allMatches(svg ?? '');
    final result = matches.map((e) => e.group(1)).toList();
    for (var i = 0; i < result.length; i++) {
      resultFinal = resultFinal.replaceFirst(
        result[i] ?? '',
        '${colors[i]};',
      );
    }
    return resultFinal;
  }
}
