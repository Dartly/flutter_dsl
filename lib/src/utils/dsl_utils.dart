import 'package:flutter/material.dart';

/// 工具类，提供DSL相关的辅助函数
class DslUtils {
  /// 创建圆角边框
  static BorderRadius circular(double radius) {
    return BorderRadius.circular(radius);
  }
  
  /// 创建阴影
  static BoxShadow shadow({
    Color color = const Color(0x33000000),
    double blurRadius = 4.0,
    double spreadRadius = 0.0,
    Offset offset = Offset.zero,
  }) {
    return BoxShadow(
      color: color,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
      offset: offset,
    );
  }
  
  /// 创建边框
  static Border border({
    Color color = const Color(0xFF000000),
    double width = 1.0,
    BorderStyle style = BorderStyle.solid,
  }) {
    return Border.all(
      color: color,
      width: width,
      style: style,
    );
  }
  
  /// 创建渐变
  static LinearGradient linearGradient({
    AlignmentGeometry begin = Alignment.centerLeft,
    AlignmentGeometry end = Alignment.centerRight,
    required List<Color> colors,
    List<double>? stops,
  }) {
    return LinearGradient(
      begin: begin,
      end: end,
      colors: colors,
      stops: stops,
    );
  }
  
  /// 创建径向渐变
  static RadialGradient radialGradient({
    AlignmentGeometry center = Alignment.center,
    double radius = 0.5,
    required List<Color> colors,
    List<double>? stops,
  }) {
    return RadialGradient(
      center: center,
      radius: radius,
      colors: colors,
      stops: stops,
    );
  }
  
  /// 创建装饰
  static BoxDecoration decoration({
    Color? color,
    BorderRadiusGeometry? borderRadius,
    BoxBorder? border,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    DecorationImage? image,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: borderRadius,
      border: border,
      boxShadow: boxShadow,
      gradient: gradient,
      image: image,
    );
  }
}
