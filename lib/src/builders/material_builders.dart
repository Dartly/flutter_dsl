import 'package:flutter/material.dart';
import 'widget_builder.dart';

/// Scaffold构建器
class ScaffoldBuilder extends BaseWidgetBuilder<Scaffold, ScaffoldBuilder>
    with CommonWidgetPropertiesMixin<Scaffold, ScaffoldBuilder> {
  Widget? _appBar;
  Widget? _body;
  Widget? _floatingActionButton;
  Widget? _drawer;
  Widget? _endDrawer;
  Widget? _bottomNavigationBar;
  Color? _backgroundColor;
  bool _resizeToAvoidBottomInset = true;
  
  /// 设置应用栏
  ScaffoldBuilder appBar(Widget appBar) {
    _appBar = appBar;
    return self;
  }
  
  /// 设置主体内容
  ScaffoldBuilder body(Widget body) {
    _body = body;
    return self;
  }
  
  /// 设置浮动操作按钮
  ScaffoldBuilder floatingActionButton(Widget floatingActionButton) {
    _floatingActionButton = floatingActionButton;
    return self;
  }
  
  /// 设置抽屉
  ScaffoldBuilder drawer(Widget drawer) {
    _drawer = drawer;
    return self;
  }
  
  /// 设置尾部抽屉
  ScaffoldBuilder endDrawer(Widget endDrawer) {
    _endDrawer = endDrawer;
    return self;
  }
  
  /// 设置底部导航栏
  ScaffoldBuilder bottomNavigationBar(Widget bottomNavigationBar) {
    _bottomNavigationBar = bottomNavigationBar;
    return self;
  }
  
  /// 设置背景颜色
  ScaffoldBuilder backgroundColor(Color backgroundColor) {
    _backgroundColor = backgroundColor;
    return self;
  }
  
  /// 设置是否调整大小以避免底部插入
  ScaffoldBuilder resizeToAvoidBottomInset(bool resize) {
    _resizeToAvoidBottomInset = resize;
    return self;
  }
  
  @override
  Scaffold build() {
    return Scaffold(
      key: widgetKey,
      appBar: _appBar as PreferredSizeWidget?,
      body: _body,
      floatingActionButton: _floatingActionButton,
      drawer: _drawer,
      endDrawer: _endDrawer,
      bottomNavigationBar: _bottomNavigationBar,
      backgroundColor: _backgroundColor,
      resizeToAvoidBottomInset: _resizeToAvoidBottomInset,
    );
  }
}

/// AppBar构建器
class AppBarBuilder extends BaseWidgetBuilder<AppBar, AppBarBuilder>
    with CommonWidgetPropertiesMixin<AppBar, AppBarBuilder> {
  Widget? _title;
  List<Widget> _actions = [];
  Widget? _leading;
  Color? _backgroundColor;
  bool _centerTitle = false;
  double? _elevation;
  
  /// 设置标题
  AppBarBuilder title(Widget title) {
    _title = title;
    return self;
  }
  
  /// 设置操作按钮
  AppBarBuilder actions(List<Widget> actions) {
    _actions = actions;
    return self;
  }
  
  /// 添加操作按钮
  AppBarBuilder addAction(Widget action) {
    _actions.add(action);
    return self;
  }
  
  /// 设置前导组件
  AppBarBuilder leading(Widget leading) {
    _leading = leading;
    return self;
  }
  
  /// 设置背景颜色
  AppBarBuilder backgroundColor(Color backgroundColor) {
    _backgroundColor = backgroundColor;
    return self;
  }
  
  /// 设置标题是否居中
  AppBarBuilder centerTitle(bool centerTitle) {
    _centerTitle = centerTitle;
    return self;
  }
  
  /// 设置阴影高度
  AppBarBuilder elevation(double elevation) {
    _elevation = elevation;
    return self;
  }
  
  @override
  AppBar build() {
    return AppBar(
      key: widgetKey,
      title: _title,
      actions: _actions,
      leading: _leading,
      backgroundColor: _backgroundColor,
      centerTitle: _centerTitle,
      elevation: _elevation,
    );
  }
}

/// Card构建器
class CardBuilder extends SingleChildWidgetBuilder<Card, CardBuilder>
    with CommonWidgetPropertiesMixin<Card, CardBuilder>,
         ColorAndDecorationMixin<Card, CardBuilder> {
  double? _elevation;
  ShapeBorder? _shape;
  EdgeInsetsGeometry? _margin;
  
  /// 设置阴影高度
  CardBuilder elevation(double elevation) {
    _elevation = elevation;
    return self;
  }
  
  /// 设置形状
  CardBuilder shape(ShapeBorder shape) {
    _shape = shape;
    return self;
  }
  
  /// 设置外边距
  CardBuilder margin(EdgeInsetsGeometry margin) {
    _margin = margin;
    return self;
  }
  
  @override
  Card build() {
    return Card(
      key: widgetKey,
      color: widgetColor,
      elevation: _elevation,
      shape: _shape,
      margin: _margin,
      child: childWidget,
    );
  }
}

/// ListTile构建器
class ListTileBuilder extends BaseWidgetBuilder<ListTile, ListTileBuilder>
    with CommonWidgetPropertiesMixin<ListTile, ListTileBuilder>,
         GestureMixin<ListTile, ListTileBuilder> {
  Widget? _leading;
  Widget? _title;
  Widget? _subtitle;
  Widget? _trailing;
  bool _dense = false;
  bool _enabled = true;
  bool _selected = false;
  
  /// 设置前导组件
  ListTileBuilder leading(Widget leading) {
    _leading = leading;
    return self;
  }
  
  /// 设置标题
  ListTileBuilder title(Widget title) {
    _title = title;
    return self;
  }
  
  /// 设置副标题
  ListTileBuilder subtitle(Widget subtitle) {
    _subtitle = subtitle;
    return self;
  }
  
  /// 设置尾部组件
  ListTileBuilder trailing(Widget trailing) {
    _trailing = trailing;
    return self;
  }
  
  /// 设置是否紧凑
  ListTileBuilder dense(bool dense) {
    _dense = dense;
    return self;
  }
  
  /// 设置是否启用
  ListTileBuilder enabled(bool enabled) {
    _enabled = enabled;
    return self;
  }
  
  /// 设置是否选中
  ListTileBuilder selected(bool selected) {
    _selected = selected;
    return self;
  }
  
  @override
  ListTile build() {
    return ListTile(
      key: widgetKey,
      leading: _leading,
      title: _title,
      subtitle: _subtitle,
      trailing: _trailing,
      dense: _dense,
      enabled: _enabled,
      selected: _selected,
      onTap: widgetOnTap,
      onLongPress: widgetOnLongPress,
    );
  }
}

/// Drawer构建器
class DrawerBuilder extends SingleChildWidgetBuilder<Drawer, DrawerBuilder>
    with CommonWidgetPropertiesMixin<Drawer, DrawerBuilder> {
  Color? _backgroundColor;
  double? _elevation;
  
  /// 设置背景颜色
  DrawerBuilder backgroundColor(Color backgroundColor) {
    _backgroundColor = backgroundColor;
    return self;
  }
  
  /// 设置阴影高度
  DrawerBuilder elevation(double elevation) {
    _elevation = elevation;
    return self;
  }
  
  @override
  Drawer build() {
    return Drawer(
      key: widgetKey,
      backgroundColor: _backgroundColor,
      elevation: _elevation,
      child: childWidget,
    );
  }
}

/// BottomNavigationBar构建器
class BottomNavigationBarBuilder extends BaseWidgetBuilder<BottomNavigationBar, BottomNavigationBarBuilder>
    with CommonWidgetPropertiesMixin<BottomNavigationBar, BottomNavigationBarBuilder> {
  List<BottomNavigationBarItem> _items = [];
  int _currentIndex = 0;
  ValueChanged<int>? _onTap;
  Color? _backgroundColor;
  double? _elevation;
  BottomNavigationBarType _type = BottomNavigationBarType.fixed;
  
  /// 设置导航项
  BottomNavigationBarBuilder items(List<BottomNavigationBarItem> items) {
    _items = items;
    return self;
  }
  
  /// 添加导航项
  BottomNavigationBarBuilder addItem({required Widget icon, required String label, Widget? activeIcon}) {
    _items.add(BottomNavigationBarItem(
      icon: icon,
      label: label,
      activeIcon: activeIcon,
    ));
    return self;
  }
  
  /// 设置当前索引
  BottomNavigationBarBuilder currentIndex(int currentIndex) {
    _currentIndex = currentIndex;
    return self;
  }
  
  /// 设置点击回调
  BottomNavigationBarBuilder onTap(ValueChanged<int> onTap) {
    _onTap = onTap;
    return self;
  }
  
  /// 设置背景颜色
  BottomNavigationBarBuilder backgroundColor(Color backgroundColor) {
    _backgroundColor = backgroundColor;
    return self;
  }
  
  /// 设置阴影高度
  BottomNavigationBarBuilder elevation(double elevation) {
    _elevation = elevation;
    return self;
  }
  
  /// 设置类型
  BottomNavigationBarBuilder type(BottomNavigationBarType type) {
    _type = type;
    return self;
  }
  
  @override
  BottomNavigationBar build() {
    return BottomNavigationBar(
      key: widgetKey,
      items: _items,
      currentIndex: _currentIndex,
      onTap: _onTap,
      backgroundColor: _backgroundColor,
      elevation: _elevation,
      type: _type,
    );
  }
}

/// TabBar构建器
class TabBarBuilder extends BaseWidgetBuilder<TabBar, TabBarBuilder>
    with CommonWidgetPropertiesMixin<TabBar, TabBarBuilder> {
  List<Widget> _tabs = [];
  TabController? _controller;
  bool _isScrollable = false;
  
  /// 设置标签页
  TabBarBuilder tabs(List<Widget> tabs) {
    _tabs = tabs;
    return self;
  }
  
  /// 添加标签页
  TabBarBuilder addTab(Widget tab) {
    _tabs.add(tab);
    return self;
  }
  
  /// 设置控制器
  TabBarBuilder controller(TabController controller) {
    _controller = controller;
    return self;
  }
  
  /// 设置是否可滚动
  TabBarBuilder isScrollable(bool isScrollable) {
    _isScrollable = isScrollable;
    return self;
  }
  
  @override
  TabBar build() {
    return TabBar(
      key: widgetKey,
      tabs: _tabs,
      controller: _controller,
      isScrollable: _isScrollable,
    );
  }
}

/// TabBarView构建器
class TabBarViewBuilder extends MultiChildWidgetBuilder<TabBarView, TabBarViewBuilder>
    with CommonWidgetPropertiesMixin<TabBarView, TabBarViewBuilder> {
  TabController? _controller;
  
  /// 设置控制器
  TabBarViewBuilder controller(TabController controller) {
    _controller = controller;
    return self;
  }
  
  @override
  TabBarView build() {
    return TabBarView(
      key: widgetKey,
      controller: _controller,
      children: childrenWidgets,
    );
  }
}


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
