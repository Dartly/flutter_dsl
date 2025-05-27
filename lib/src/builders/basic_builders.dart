import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' hide WidgetBuilder;
import '../widget_builder.dart';

/// Container构建器
class ContainerBuilder extends SingleChildWidgetBuilder<Container, ContainerBuilder>
    with CommonWidgetPropertiesMixin<Container, ContainerBuilder>,
         SizeConstraintsMixin<Container, ContainerBuilder>,
         PaddingMixin<Container, ContainerBuilder>,
         ColorAndDecorationMixin<Container, ContainerBuilder>,
         AlignmentMixin<Container, ContainerBuilder> {
  
  double? _margin;
  Clip? _clipBehavior;
  
  /// 设置外边距
  ContainerBuilder margin({
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    if (all != null) {
      _margin = all;
    } else {
      // 在实际实现中，这里应该使用EdgeInsets，简化示例
      _margin = (left ?? horizontal ?? 0.0) + (right ?? horizontal ?? 0.0) + 
               (top ?? vertical ?? 0.0) + (bottom ?? vertical ?? 0.0);
    }
    return self;
  }
  
  /// 设置裁剪行为
  ContainerBuilder clipBehavior(Clip clipBehavior) {
    _clipBehavior = clipBehavior;
    return self;
  }
  
  @override
  Container build() {
    return Container(
      key: widgetKey,
      width: widgetWidth,
      height: widgetHeight,
      constraints: widgetConstraints,
      padding: widgetPadding,
      margin: _margin != null ? EdgeInsets.all(_margin!) : null,
      color: widgetColor,
      decoration: widgetDecoration,
      alignment: widgetAlignment,
      clipBehavior: _clipBehavior ?? Clip.none,
      child: childWidget,
    );
  }
}

/// Text构建器
class TextBuilder extends LeafWidgetBuilder<Text, TextBuilder>
    with CommonWidgetPropertiesMixin<Text, TextBuilder> {
  final String _text;
  TextStyle? _style;
  TextAlign? _textAlign;
  int? _maxLines;
  TextOverflow? _overflow;
  
  TextBuilder(this._text);
  
  /// 设置文本样式
  TextBuilder style({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? decoration,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
  }) {
    _style = TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      decoration: decoration,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
    );
    return self;
  }

  /// 设置文本颜色
  TextBuilder color(Color color) {
    _style = (_style ?? const TextStyle()).copyWith(color: color);
    return self;
  }

  /// 设置字体大小
  TextBuilder fontSize(double size) {
    _style = (_style ?? const TextStyle()).copyWith(fontSize: size);
    return self;
  }

  /// 设置字体粗细
  TextBuilder fontWeight(FontWeight weight) {
    _style = (_style ?? const TextStyle()).copyWith(fontWeight: weight);
    return self;
  }

  /// 设置字体样式
  TextBuilder fontStyle(FontStyle style) {
    _style = (_style ?? const TextStyle()).copyWith(fontStyle: style);
    return self;
  }

  /// 设置文本装饰
  TextBuilder decoration(TextDecoration decoration) {
    _style = (_style ?? const TextStyle()).copyWith(decoration: decoration);
    return self;
  }

  /// 设置字母间距
  TextBuilder letterSpacing(double spacing) {
    _style = (_style ?? const TextStyle()).copyWith(letterSpacing: spacing);
    return self;
  }

  /// 设置单词间距
  TextBuilder wordSpacing(double spacing) {
    _style = (_style ?? const TextStyle()).copyWith(wordSpacing: spacing);
    return self;
  }

  /// 设置行高
  TextBuilder height(double height) {
    _style = (_style ?? const TextStyle()).copyWith(height: height);
    return self;
  }
  
  /// 设置文本对齐方式
  TextBuilder textAlign(TextAlign textAlign) {
    _textAlign = textAlign;
    return self;
  }
  
  /// 设置最大行数
  TextBuilder maxLines(int maxLines) {
    _maxLines = maxLines;
    return self;
  }
  
  /// 设置溢出处理方式
  TextBuilder overflow(TextOverflow overflow) {
    _overflow = overflow;
    return self;
  }
  
  @override
  Text build() {
    return Text(
      _text,
      key: widgetKey,
      style: _style,
      textAlign: _textAlign,
      maxLines: _maxLines,
      overflow: _overflow,
    );
  }
}

/// Icon构建器
class IconBuilder extends LeafWidgetBuilder<Icon, IconBuilder>
    with CommonWidgetPropertiesMixin<Icon, IconBuilder> {
  final IconData _icon;
  Color? _color;
  double? _size;
  
  IconBuilder(this._icon);
  
  /// 设置图标颜色
  IconBuilder color(Color color) {
    _color = color;
    return self;
  }
  
  /// 设置图标大小
  IconBuilder size(double size) {
    _size = size;
    return self;
  }
  
  @override
  Icon build() {
    return Icon(
      _icon,
      key: widgetKey,
      color: _color,
      size: _size,
    );
  }
}

/// Image构建器
class ImageBuilder extends LeafWidgetBuilder<Widget, ImageBuilder>
    with CommonWidgetPropertiesMixin<Widget, ImageBuilder>,
         SizeConstraintsMixin<Widget, ImageBuilder> {
  final String? _asset;
  final String? _network;
  final dynamic _file; // 实际应为File类型
  final dynamic _memory; // 实际应为Uint8List类型
  BoxFit? _fit;
  
  ImageBuilder({
    String? asset,
    String? network,
    dynamic file,
    dynamic memory,
  }) : _asset = asset,
       _network = network,
       _file = file,
       _memory = memory;
  
  /// 设置图片填充方式
  ImageBuilder fit(BoxFit fit) {
    _fit = fit;
    return self;
  }
  
  @override
  Widget build() {
    if (_asset != null) {
      return Image.asset(
        _asset!,
        key: widgetKey,
        width: widgetWidth,
        height: widgetHeight,
        fit: _fit,
      );
    } else if (_network != null) {
      return Image.network(
        _network!,
        key: widgetKey,
        width: widgetWidth,
        height: widgetHeight,
        fit: _fit,
      );
    } else if (_file != null) {
      return Image.file(
        _file,
        key: widgetKey,
        width: widgetWidth,
        height: widgetHeight,
        fit: _fit,
      );
    } else if (_memory != null) {
      return Image.memory(
        _memory,
        key: widgetKey,
        width: widgetWidth,
        height: widgetHeight,
        fit: _fit,
      );
    } else {
      return Container(key: widgetKey);
    }
  }
}

/// SizedBox构建器
class SizedBoxBuilder extends SingleChildWidgetBuilder<SizedBox, SizedBoxBuilder>
    with CommonWidgetPropertiesMixin<SizedBox, SizedBoxBuilder> {
  double? _width;
  double? _height;
  
  SizedBoxBuilder({double? width, double? height})
      : _width = width,
        _height = height;
  
  /// 设置宽度
  SizedBoxBuilder width(double width) {
    _width = width;
    return self;
  }
  
  /// 设置高度
  SizedBoxBuilder height(double height) {
    _height = height;
    return self;
  }
  
  @override
  SizedBox build() {
    return SizedBox(
      key: widgetKey,
      width: _width,
      height: _height,
      child: childWidget,
    );
  }
}

/// Padding构建器
class PaddingBuilder extends SingleChildWidgetBuilder<Padding, PaddingBuilder>
    with CommonWidgetPropertiesMixin<Padding, PaddingBuilder>,
         PaddingMixin<Padding, PaddingBuilder> {
  
  @override
  Padding build() {
    return Padding(
      key: widgetKey,
      padding: widgetPadding ?? EdgeInsets.zero,
      child: childWidget,
    );
  }
}

/// Center构建器
class CenterBuilder extends SingleChildWidgetBuilder<Center, CenterBuilder>
    with CommonWidgetPropertiesMixin<Center, CenterBuilder> {
  
  @override
  Center build() {
    return Center(
      key: widgetKey,
      child: childWidget,
    );
  }
}

/// Align构建器
class AlignBuilder extends SingleChildWidgetBuilder<Align, AlignBuilder>
    with CommonWidgetPropertiesMixin<Align, AlignBuilder>,
         AlignmentMixin<Align, AlignBuilder> {
  
  AlignBuilder([AlignmentGeometry? alignment]) {
    if (alignment != null) {
      this.alignment(alignment);
    }
  }
  
  @override
  Align build() {
    return Align(
      key: widgetKey,
      alignment: widgetAlignment ?? Alignment.center,
      child: childWidget,
    );
  }
}

/// 自定义Widget构建器
class CustomWidgetBuilder extends BaseWidgetBuilder<Widget, CustomWidgetBuilder> {
  final Widget _widget;
  
  CustomWidgetBuilder(this._widget);
  
  @override
  Widget build() {
    return _widget;
  }
}
