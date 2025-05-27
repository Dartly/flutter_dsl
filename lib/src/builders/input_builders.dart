import 'package:flutter/material.dart';
import '../widget_builder.dart';

/// 通用按钮构建器
class ButtonBuilder extends BaseWidgetBuilder<Widget, ButtonBuilder>
    with CommonWidgetPropertiesMixin<Widget, ButtonBuilder> {
  final String _text;
  VoidCallback? _onPressed;
  ButtonStyle? _style;
  
  ButtonBuilder(this._text);
  
  /// 设置点击回调
  ButtonBuilder onPressed(VoidCallback onPressed) {
    _onPressed = onPressed;
    return self;
  }
  
  /// 设置按钮样式
  ButtonBuilder style(ButtonStyle style) {
    _style = style;
    return self;
  }
  
  @override
  Widget build() {
    return TextButton(
      key: widgetKey,
      onPressed: _onPressed,
      style: _style,
      child: Text(_text),
    );
  }
}

/// ElevatedButton构建器
class ElevatedButtonBuilder extends BaseWidgetBuilder<ElevatedButton, ElevatedButtonBuilder>
    with CommonWidgetPropertiesMixin<ElevatedButton, ElevatedButtonBuilder> {
  final String _text;
  VoidCallback? _onPressed;
  ButtonStyle? _style;
  
  ElevatedButtonBuilder(this._text);
  
  /// 设置点击回调
  ElevatedButtonBuilder onPressed(VoidCallback onPressed) {
    _onPressed = onPressed;
    return self;
  }
  
  /// 设置按钮样式
  ElevatedButtonBuilder style(ButtonStyle style) {
    _style = style;
    return self;
  }
  
  @override
  ElevatedButton build() {
    return ElevatedButton(
      key: widgetKey,
      onPressed: _onPressed,
      style: _style,
      child: Text(_text),
    );
  }
}

/// OutlinedButton构建器
class OutlinedButtonBuilder extends BaseWidgetBuilder<OutlinedButton, OutlinedButtonBuilder>
    with CommonWidgetPropertiesMixin<OutlinedButton, OutlinedButtonBuilder> {
  final String _text;
  VoidCallback? _onPressed;
  ButtonStyle? _style;
  
  OutlinedButtonBuilder(this._text);
  
  /// 设置点击回调
  OutlinedButtonBuilder onPressed(VoidCallback onPressed) {
    _onPressed = onPressed;
    return self;
  }
  
  /// 设置按钮样式
  OutlinedButtonBuilder style(ButtonStyle style) {
    _style = style;
    return self;
  }
  
  @override
  OutlinedButton build() {
    return OutlinedButton(
      key: widgetKey,
      onPressed: _onPressed,
      style: _style,
      child: Text(_text),
    );
  }
}

/// TextButton构建器
class TextButtonBuilder extends BaseWidgetBuilder<TextButton, TextButtonBuilder>
    with CommonWidgetPropertiesMixin<TextButton, TextButtonBuilder> {
  final String _text;
  VoidCallback? _onPressed;
  ButtonStyle? _style;
  
  TextButtonBuilder(this._text);
  
  /// 设置点击回调
  TextButtonBuilder onPressed(VoidCallback onPressed) {
    _onPressed = onPressed;
    return self;
  }
  
  /// 设置按钮样式
  TextButtonBuilder style(ButtonStyle style) {
    _style = style;
    return self;
  }
  
  @override
  TextButton build() {
    return TextButton(
      key: widgetKey,
      onPressed: _onPressed,
      style: _style,
      child: Text(_text),
    );
  }
}

/// IconButton构建器
class IconButtonBuilder extends BaseWidgetBuilder<IconButton, IconButtonBuilder>
    with CommonWidgetPropertiesMixin<IconButton, IconButtonBuilder> {
  final IconData _icon;
  VoidCallback? _onPressed;
  double? _iconSize;
  Color? _color;
  
  IconButtonBuilder(this._icon);
  
  /// 设置点击回调
  IconButtonBuilder onPressed(VoidCallback onPressed) {
    _onPressed = onPressed;
    return self;
  }
  
  /// 设置图标大小
  IconButtonBuilder iconSize(double iconSize) {
    _iconSize = iconSize;
    return self;
  }
  
  /// 设置颜色
  IconButtonBuilder color(Color color) {
    _color = color;
    return self;
  }
  
  @override
  IconButton build() {
    return IconButton(
      key: widgetKey,
      icon: Icon(_icon),
      onPressed: _onPressed,
      iconSize: _iconSize,
      color: _color,
    );
  }
}

/// TextField构建器
class TextFieldBuilder extends BaseWidgetBuilder<TextField, TextFieldBuilder>
    with CommonWidgetPropertiesMixin<TextField, TextFieldBuilder> {
  String? _hint;
  TextEditingController? _controller;
  ValueChanged<String>? _onChanged;
  bool _obscureText = false;
  TextInputType? _keyboardType;
  InputDecoration? _decoration;
  int? _maxLines;
  int? _maxLength;
  
  /// 设置提示文本
  TextFieldBuilder hint(String hint) {
    _hint = hint;
    return self;
  }
  
  /// 设置控制器
  TextFieldBuilder controller(TextEditingController controller) {
    _controller = controller;
    return self;
  }
  
  /// 设置文本变化回调
  TextFieldBuilder onChanged(ValueChanged<String> onChanged) {
    _onChanged = onChanged;
    return self;
  }
  
  /// 设置是否隐藏文本
  TextFieldBuilder obscureText(bool obscureText) {
    _obscureText = obscureText;
    return self;
  }
  
  /// 设置键盘类型
  TextFieldBuilder keyboardType(TextInputType keyboardType) {
    _keyboardType = keyboardType;
    return self;
  }
  
  /// 设置装饰
  TextFieldBuilder decoration(InputDecoration decoration) {
    _decoration = decoration;
    return self;
  }
  
  /// 设置最大行数
  TextFieldBuilder maxLines(int maxLines) {
    _maxLines = maxLines;
    return self;
  }
  
  /// 设置最大长度
  TextFieldBuilder maxLength(int maxLength) {
    _maxLength = maxLength;
    return self;
  }
  
  @override
  TextField build() {
    final decoration = _decoration ?? 
        (_hint != null ? InputDecoration(hintText: _hint) : const InputDecoration());
    
    return TextField(
      key: widgetKey,
      controller: _controller,
      onChanged: _onChanged,
      obscureText: _obscureText,
      keyboardType: _keyboardType,
      decoration: decoration,
      maxLines: _maxLines,
      maxLength: _maxLength,
    );
  }
}

/// Checkbox构建器
class CheckboxBuilder extends BaseWidgetBuilder<Checkbox, CheckboxBuilder>
    with CommonWidgetPropertiesMixin<Checkbox, CheckboxBuilder> {
  final bool _value;
  final ValueChanged<bool?>? _onChanged;
  Color? _activeColor;
  
  CheckboxBuilder({required bool value, required ValueChanged<bool?>? onChanged})
      : _value = value,
        _onChanged = onChanged;
  
  /// 设置激活颜色
  CheckboxBuilder activeColor(Color activeColor) {
    _activeColor = activeColor;
    return self;
  }
  
  @override
  Checkbox build() {
    return Checkbox(
      key: widgetKey,
      value: _value,
      onChanged: _onChanged,
      activeColor: _activeColor,
    );
  }
}

/// Radio构建器
class RadioBuilder extends BaseWidgetBuilder<Radio, RadioBuilder>
    with CommonWidgetPropertiesMixin<Radio, RadioBuilder> {
  final dynamic _value;
  final dynamic _groupValue;
  final ValueChanged? _onChanged;
  Color? _activeColor;
  
  RadioBuilder({required dynamic value, required dynamic groupValue, required ValueChanged? onChanged})
      : _value = value,
        _groupValue = groupValue,
        _onChanged = onChanged;
  
  /// 设置激活颜色
  RadioBuilder activeColor(Color activeColor) {
    _activeColor = activeColor;
    return self;
  }
  
  @override
  Radio build() {
    return Radio(
      key: widgetKey,
      value: _value,
      groupValue: _groupValue,
      onChanged: _onChanged,
      activeColor: _activeColor,
    );
  }
}

/// Switch构建器
class SwitchBuilder extends BaseWidgetBuilder<Switch, SwitchBuilder>
    with CommonWidgetPropertiesMixin<Switch, SwitchBuilder> {
  final bool _value;
  final ValueChanged<bool>? _onChanged;
  Color? _activeColor;
  Color? _activeTrackColor;
  
  SwitchBuilder({required bool value, required ValueChanged<bool>? onChanged})
      : _value = value,
        _onChanged = onChanged;
  
  /// 设置激活颜色
  SwitchBuilder activeColor(Color activeColor) {
    _activeColor = activeColor;
    return self;
  }
  
  /// 设置激活轨道颜色
  SwitchBuilder activeTrackColor(Color activeTrackColor) {
    _activeTrackColor = activeTrackColor;
    return self;
  }
  
  @override
  Switch build() {
    return Switch(
      key: widgetKey,
      value: _value,
      onChanged: _onChanged,
      activeColor: _activeColor,
      activeTrackColor: _activeTrackColor,
    );
  }
}

/// Slider构建器
class SliderBuilder extends BaseWidgetBuilder<Slider, SliderBuilder>
    with CommonWidgetPropertiesMixin<Slider, SliderBuilder> {
  final double _value;
  final ValueChanged<double>? _onChanged;
  double _min = 0.0;
  double _max = 1.0;
  int? _divisions;
  String? _label;
  
  SliderBuilder({required double value, required ValueChanged<double>? onChanged})
      : _value = value,
        _onChanged = onChanged;
  
  /// 设置最小值
  SliderBuilder min(double min) {
    _min = min;
    return self;
  }
  
  /// 设置最大值
  SliderBuilder max(double max) {
    _max = max;
    return self;
  }
  
  /// 设置分段数
  SliderBuilder divisions(int divisions) {
    _divisions = divisions;
    return self;
  }
  
  /// 设置标签
  SliderBuilder label(String label) {
    _label = label;
    return self;
  }
  
  @override
  Slider build() {
    return Slider(
      key: widgetKey,
      value: _value,
      onChanged: _onChanged,
      min: _min,
      max: _max,
      divisions: _divisions,
      label: _label,
    );
  }
}
