library multiavatar;

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'larva_art.dart';

/// ## Larva
/// Create new larva SVG widget. [art] specifies the
/// avatar art that's being rendered. [fit] defaults
/// to [BoxFit.contain].
/// ```dart
/// Larva(
///   width: 100,
///   height: 100,
///   fit: BoxFit.contain,
///   art: LarvaArt.read('0 24 12 38 23 10 A'),
/// )
/// ```
class Larva extends StatelessWidget {
  //...Fields
  final LarvaArt art;
  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final bool matchTextDirection;
  final bool allowDrawingOutsideViewBox;
  final WidgetBuilder? placeholderBuilder;
  final String? semanticsLabel;
  final bool excludeFromSemantics;
  final ColorFilter? colorFilter;
  final SvgTheme theme;

  const Larva({
    super.key,
    required this.art,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.matchTextDirection = false,
    this.allowDrawingOutsideViewBox = false,
    this.placeholderBuilder,
    this.semanticsLabel,
    this.excludeFromSemantics = false,
    this.colorFilter,
    this.theme = const SvgTheme(),
  });

  //...Methods
  @override
  Widget build(BuildContext context) {
    //...
    return SvgPicture.string(
      art.print(),
      key: key,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      matchTextDirection: matchTextDirection,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter,
      theme: theme,
    );
  }
}
