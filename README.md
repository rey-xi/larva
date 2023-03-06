# random_avatar #

<img src="https://raw.githubusercontent.com/multiavatar/Multiavatar/main/logo.png?v=001" width="65">

Flutter Wrapper for [Multi-avatar](https://multiavatar.com)

[Multi-avatar](https://multiavatar.com) is a multicultural avatar maker.

Random Avatar represents people from multiple races, multiple cultures,
multiple age groups, multiple worldviews and walks of life.

In total, it is possible to generate **12,230,590,464** unique avatars.

### Installation and usage ###

Add random_avatar to your pubspec:

```yaml
dependencies:
  random_avatar: any # or the latest version on Pub
```
larva art 

```dart
String art = LarvaArt(head: 0xF, eyes: 0x3);
// or
String art = LarvaArt.read('06 11 10 13 40 00 A');
// or
String art = LarvaArt.lockTo('Rey Manuel');
```

larva widget

```dart
Widget svgCode = Larva(art: art, height: 50, width: 50);
```

check the example (https://github.com/saytoonz/random_avatar/tree/main/exemple)


### Info ###

To create new avatars, Larva mixes different parts of different avatars,
and different color themes.

The total number of unique avatars: 48^6 = 12,230,590,464

One of the main Larva functions is to work as an identicon. Every unique
avatar can be identified by the unique string of characters, associated
with the avatar.

The string of characters is also the input for the Larva package, which 
converts the provided string into a 6 double-digit numbers (range 00-47),
each representing an individual part of the final avatar.

`00 00 00 00 00 00 A` - this string of numbers represents the very first
avatar + its A theme. You can also read it like this `00A 00A 00A 00A 00A 00A`.

`47 47 47 47 47 47` - this is the 12,230,590,464th avatar (or the 16th 
initial avatar + its "C" color theme).

More info can be found in the `larva.dart` file comments.


### Screenshots ###

<img src="https://multiavatar.com/press/img/screenshots/screenshot-02.png?v=001">

<img src="https://multiavatar.com/press/img/screenshots/screenshot-03.png?v=001">

<img src="https://multiavatar.com/press/img/screenshots/screenshot-09.png?v=001">

<img src="https://multiavatar.com/press/img/screenshots/screenshot-10.png?v=001">


## Visitors Count

<img align="left" src = "https://profile-counter.glitch.me/rendom_avatar/count.svg" alt ="Loading">