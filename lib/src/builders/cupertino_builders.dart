import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dsl/flutter_dsl.dart';

/// 创建CupertinoPageScaffold构建器
class CupertinoPageScaffoldBuilder extends BaseWidgetBuilder<
    CupertinoPageScaffold, CupertinoPageScaffoldBuilder> {
  CupertinoNavigationBar? _navigationBar;
  Color? _backgroundColor;
  bool _resizeToAvoidBottomInset = true;
  Widget? _child;

  /// 设置子组件
  CupertinoPageScaffoldBuilder child(Widget child) {
    _child = child;
    return self;
  }

  /// 设置导航栏
  CupertinoPageScaffoldBuilder navigationBar(
      CupertinoNavigationBar navigationBar) {
    _navigationBar = navigationBar;
    return self;
  }

  /// 设置背景颜色
  CupertinoPageScaffoldBuilder backgroundColor(Color backgroundColor) {
    _backgroundColor = backgroundColor;
    return self;
  }

  @override
  CupertinoPageScaffold build() {
    return CupertinoPageScaffold(
      child: _child ?? SizedBox.shrink(),
      navigationBar: _navigationBar,
      backgroundColor: _backgroundColor,
      resizeToAvoidBottomInset: _resizeToAvoidBottomInset,
    );
  }
}

/// 创建CupertinoNavigationBar构建器
class CupertinoNavigationBarBuilder extends BaseWidgetBuilder<
    CupertinoNavigationBar, CupertinoNavigationBarBuilder> {
  Widget? _leading;
  Widget? _middle;
  Widget? _trailing;
  Color? _backgroundColor;
  bool _automaticallyImplyLeading = true;
  bool _automaticallyImplyMiddle = true;

  String? _previousPageTitle;

  bool _automaticBackgroundVisibility = true;

  bool _enableBackgroundFilterBlur = true;

  Brightness? _brightness;
  bool _transitionBetweenRoutes = true;

  EdgeInsetsDirectional? _padding;

  /// 设置导航栏组件
  CupertinoNavigationBarBuilder leading(Widget leading) {
    _leading = leading;
    return self;
  }

  /// 设置导航栏中间组件
  CupertinoNavigationBarBuilder middle(Widget middle) {
    _middle = middle;
    return self;
  }

  /// 设置导航栏尾部组件
  CupertinoNavigationBarBuilder trailing(Widget trailing) {
    _trailing = trailing;
    return self;
  }

  /// 设置导航栏背景颜色
  CupertinoNavigationBarBuilder backgroundColor(Color backgroundColor) {
    _backgroundColor = backgroundColor;
    return self;
  }

  /// 设置导航栏内边距
  CupertinoNavigationBarBuilder padding(EdgeInsetsDirectional padding) {
    _padding = padding;
    return self;
  }

  /// 设置导航栏是否自动实现头部
  CupertinoNavigationBarBuilder automaticallyImplyLeading(
      bool automaticallyImplyLeading) {
    _automaticallyImplyLeading = automaticallyImplyLeading;
    return self;
  }

  /// 设置导航栏是否自动实现中间
  CupertinoNavigationBarBuilder automaticallyImplyMiddle(
      bool automaticallyImplyMiddle) {
    _automaticallyImplyMiddle = automaticallyImplyMiddle;
    return self;
  }

  /// 设置导航栏上一个页面标题
  CupertinoNavigationBarBuilder previousPageTitle(String previousPageTitle) {
    _previousPageTitle = previousPageTitle;
    return self;
  }

  /// 设置导航栏是否自动实现背景可见性
  CupertinoNavigationBarBuilder automaticBackgroundVisibility(
      bool automaticBackgroundVisibility) {
    _automaticBackgroundVisibility = automaticBackgroundVisibility;
    return self;
  }

  /// 设置导航栏是否启用背景模糊
  CupertinoNavigationBarBuilder enableBackgroundFilterBlur(
      bool enableBackgroundFilterBlur) {
    _enableBackgroundFilterBlur = enableBackgroundFilterBlur;
    return self;
  }

  /// 设置导航栏亮度
  CupertinoNavigationBarBuilder brightness(Brightness brightness) {
    _brightness = brightness;
    return self;
  }

  /// 设置导航栏是否在路由之间过渡
  CupertinoNavigationBarBuilder transitionBetweenRoutes(
      bool transitionBetweenRoutes) {
    _transitionBetweenRoutes = transitionBetweenRoutes;
    return self;
  }

  @override
  CupertinoNavigationBar build() {
    throw CupertinoNavigationBar(
      leading: _leading,
      middle: _middle,
      trailing: _trailing,
      backgroundColor: _backgroundColor,
      padding: _padding,
      automaticallyImplyLeading: _automaticallyImplyLeading,
      automaticallyImplyMiddle: _automaticallyImplyMiddle,
      previousPageTitle: _previousPageTitle,
      automaticBackgroundVisibility: _automaticBackgroundVisibility,
      enableBackgroundFilterBlur: _enableBackgroundFilterBlur,
      brightness: _brightness,
      transitionBetweenRoutes: _transitionBetweenRoutes,
    );
  }
}

///创建CupertinoButton构建器
class CupertinoButtonBuilder
    extends BaseWidgetBuilder<CupertinoButton, CupertinoButtonBuilder> {
  Widget? _child;
  Color? _color;
  Color? _disabledColor;
  VoidCallback? _onPressed;
  EdgeInsetsGeometry? _padding;
  double? _borderRadius;
  Size? _minimumSize;
  CupertinoButtonBuilder child(Widget child) {
    _child = child;
    return self;
  }

  CupertinoButtonBuilder color(Color color) {
    _color = color;
    return self;
  }

  CupertinoButtonBuilder disabledColor(Color disabledColor) {
    _disabledColor = disabledColor;
    return self;
  }

  CupertinoButtonBuilder onPressed(VoidCallback onPressed) {
    _onPressed = onPressed;
    return self;
  }

  CupertinoButtonBuilder padding(EdgeInsetsGeometry padding) {
    _padding = padding;
    return self;
  }

  CupertinoButtonBuilder borderRadius(double borderRadius) {
    _borderRadius = borderRadius;
    return self;
  }

  CupertinoButtonBuilder minimumSize(Size minimumSize) {
    _minimumSize = minimumSize;
    return self;
  }

  @override
  CupertinoButton build() {
    return CupertinoButton(
      child: _child ?? SizedBox.shrink(),
      color: _color,
      disabledColor: _disabledColor ?? CupertinoColors.quaternarySystemFill,
      onPressed: _onPressed,
      padding: _padding,
      borderRadius: BorderRadius.circular(_borderRadius ?? 0),
      minimumSize: _minimumSize,
    );
  }
}

///创建CupertinoTextField构建器
class CupertinoTextFieldBuilder
    extends BaseWidgetBuilder<CupertinoTextField, CupertinoTextFieldBuilder> {
  String? _placeholder;
  TextEditingController? _controller;
  TextInputType? _keyboardType;
  TextInputAction? _textInputAction;
  TextAlign _textAlign = TextAlign.start;
  TextStyle? _style;
  int? _maxLines;
  int? _minLines;
  bool _autofocus = false;
  bool _readOnly = false;
  bool _enabled = true;
  bool? _showCursor;
  bool _autocorrect = true;
  bool _obscureText = false;
  String _obscuringCharacter = '•';
  bool? _enableInteractiveSelection;
  SmartDashesType? _smartDashesType;
  SmartQuotesType? _smartQuotesType;
  bool _enableSuggestions = true;
  bool _expands = false;
  int _maxLength = 1;
  MaxLengthEnforcement? _maxLengthEnforcement;
  ValueChanged<String>? _onChanged;
  GestureTapCallback? _onTap;
  ValueChanged<String>? _onSubmitted;
  VoidCallback? _onEditingComplete;
  Iterable<String>? _autofillHints;
  List<TextInputFormatter>? _inputFormatters;
  TextSelectionControls? _selectionControls;
  ScrollController? _scrollController;
  ScrollPhysics? _scrollPhysics;
  double _cursorWidth = 2.0;
  double? _cursorHeight;
  bool _cursorOpacityAnimates = true;
  Radius _cursorRadius = const Radius.circular(2.0);

  bool _enableIMEPersonalizedLearning = true;

  CupertinoTextFieldBuilder placeholder(String placeholder) {
    _placeholder = placeholder;
    return self;
  }

  CupertinoTextFieldBuilder controller(TextEditingController controller) {
    _controller = controller;
    return self;
  }

  CupertinoTextFieldBuilder keyboardType(TextInputType keyboardType) {
    _keyboardType = keyboardType;
    return self;
  }

  CupertinoTextFieldBuilder textInputAction(TextInputAction textInputAction) {
    _textInputAction = textInputAction;
    return self;
  }

  CupertinoTextFieldBuilder textAlign(TextAlign textAlign) {
    _textAlign = textAlign;
    return self;
  }

  CupertinoTextFieldBuilder style(TextStyle style) {
    _style = style;
    return self;
  }

  CupertinoTextFieldBuilder maxLines(int maxLines) {
    _maxLines = maxLines;
    return self;
  }

  CupertinoTextFieldBuilder minLines(int minLines) {
    _minLines = minLines;
    return self;
  }

  CupertinoTextFieldBuilder autofocus(bool autofocus) {
    _autofocus = autofocus;
    return self;
  }

  CupertinoTextFieldBuilder readOnly(bool readOnly) {
    _readOnly = readOnly;
    return self;
  }

  CupertinoTextFieldBuilder enabled(bool enabled) {
    _enabled = enabled;
    return self;
  }

  CupertinoTextFieldBuilder showCursor(bool showCursor) {
    _showCursor = showCursor;
    return self;
  }

  CupertinoTextFieldBuilder autocorrect(bool autocorrect) {
    _autocorrect = autocorrect;
    return self;
  }

  CupertinoTextFieldBuilder obscureText(bool obscureText) {
    _obscureText = obscureText;
    return self;
  }

  CupertinoTextFieldBuilder obscuringCharacter(String obscuringCharacter) {
    _obscuringCharacter = obscuringCharacter;
    return self;
  }

  CupertinoTextFieldBuilder enableInteractiveSelection(
      bool enableInteractiveSelection) {
    _enableInteractiveSelection = enableInteractiveSelection;
    return self;
  }

  CupertinoTextFieldBuilder smartDashesType(SmartDashesType smartDashesType) {
    _smartDashesType = smartDashesType;
    return self;
  }

  CupertinoTextFieldBuilder smartQuotesType(SmartQuotesType smartQuotesType) {
    _smartQuotesType = smartQuotesType;
    return self;
  }

  CupertinoTextFieldBuilder enableSuggestions(bool enableSuggestions) {
    _enableSuggestions = enableSuggestions;
    return self;
  }

  CupertinoTextFieldBuilder expands(bool expands) {
    _expands = expands;
    return self;
  }

  CupertinoTextFieldBuilder maxLength(int maxLength) {
    _maxLength = maxLength;
    return self;
  }

  CupertinoTextFieldBuilder maxLengthEnforcement(
      MaxLengthEnforcement maxLengthEnforcement) {
    _maxLengthEnforcement = maxLengthEnforcement;
    return self;
  }

  CupertinoTextFieldBuilder onChanged(ValueChanged<String> onChanged) {
    _onChanged = onChanged;
    return self;
  }

  CupertinoTextFieldBuilder onTap(GestureTapCallback onTap) {
    _onTap = onTap;
    return self;
  }

  CupertinoTextFieldBuilder onSubmitted(ValueChanged<String> onSubmitted) {
    _onSubmitted = onSubmitted;
    return self;
  }

  CupertinoTextFieldBuilder onEditingComplete(VoidCallback onEditingComplete) {
    _onEditingComplete = onEditingComplete;
    return self;
  }

  CupertinoTextFieldBuilder autofillHints(Iterable<String> autofillHints) {
    _autofillHints = autofillHints;
    return self;
  }

  CupertinoTextFieldBuilder inputFormatters(
      List<TextInputFormatter> inputFormatters) {
    _inputFormatters = inputFormatters;
    return self;
  }

  CupertinoTextFieldBuilder selectionControls(
      TextSelectionControls selectionControls) {
    _selectionControls = selectionControls;
    return self;
  }

  CupertinoTextFieldBuilder scrollController(
      ScrollController scrollController) {
    _scrollController = scrollController;
    return self;
  }

  CupertinoTextFieldBuilder scrollPhysics(ScrollPhysics scrollPhysics) {
    _scrollPhysics = scrollPhysics;
    return self;
  }

  CupertinoTextFieldBuilder cursorWidth(double cursorWidth) {
    _cursorWidth = cursorWidth;
    return self;
  }

  CupertinoTextFieldBuilder cursorHeight(double cursorHeight) {
    _cursorHeight = cursorHeight;
    return self;
  }

  CupertinoTextFieldBuilder cursorOpacityAnimates(bool cursorOpacityAnimates) {
    _cursorOpacityAnimates = cursorOpacityAnimates;
    return self;
  }

  CupertinoTextFieldBuilder cursorRadius(Radius cursorRadius) {
    _cursorRadius = cursorRadius;
    return self;
  }

  CupertinoTextFieldBuilder enableIMEPersonalizedLearning(
      bool enableIMEPersonalizedLearning) {
    _enableIMEPersonalizedLearning = enableIMEPersonalizedLearning;
    return self;
  }

  @override
  CupertinoTextField build() {
    return CupertinoTextField(
      placeholder: _placeholder,
      controller: _controller,
      keyboardType: _keyboardType,
      textInputAction: _textInputAction,
      textAlign: _textAlign,
      style: _style,
      maxLines: _maxLines,
      minLines: _minLines,
      autofocus: _autofocus,
      readOnly: _readOnly,
      enabled: _enabled,
      showCursor: _showCursor,
      autocorrect: _autocorrect,
      obscureText: _obscureText,
      obscuringCharacter: _obscuringCharacter,
      enableInteractiveSelection: _enableInteractiveSelection,
      smartDashesType: _smartDashesType,
      smartQuotesType: _smartQuotesType,
      enableSuggestions: _enableSuggestions,
      expands: _expands,
      maxLength: _maxLength,
      maxLengthEnforcement: _maxLengthEnforcement,
      onChanged: _onChanged,
      onTap: _onTap,
      onSubmitted: _onSubmitted,
      onEditingComplete: _onEditingComplete,
      autofillHints: _autofillHints,
      inputFormatters: _inputFormatters,
      selectionControls: _selectionControls,
      scrollController: _scrollController,
      scrollPhysics: _scrollPhysics,
      cursorWidth: _cursorWidth,
      cursorHeight: _cursorHeight,
      cursorOpacityAnimates: _cursorOpacityAnimates,
      cursorRadius: _cursorRadius,
      enableIMEPersonalizedLearning: _enableIMEPersonalizedLearning,
    );
  }
}

