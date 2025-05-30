import 'package:flutter/widgets.dart' ;
import 'widget_builder.dart';

/// Container构建器
class ContainerBuilder
    extends SingleChildWidgetBuilder<Container, ContainerBuilder>
    with
        CommonWidgetPropertiesMixin<Container, ContainerBuilder>,
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
      _margin = (left ?? horizontal ?? 0.0) +
          (right ?? horizontal ?? 0.0) +
          (top ?? vertical ?? 0.0) +
          (bottom ?? vertical ?? 0.0);
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
    with
        CommonWidgetPropertiesMixin<Widget, ImageBuilder>,
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
  })  : _asset = asset,
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
class SizedBoxBuilder
    extends SingleChildWidgetBuilder<SizedBox, SizedBoxBuilder>
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
    with
        CommonWidgetPropertiesMixin<Padding, PaddingBuilder>,
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
    with
        CommonWidgetPropertiesMixin<Align, AlignBuilder>,
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
class CustomWidgetBuilder
    extends BaseWidgetBuilder<Widget, CustomWidgetBuilder> {
  final Widget _widget;

  CustomWidgetBuilder(this._widget);

  @override
  Widget build() {
    return _widget;
  }
}

/// Row构建器
class RowBuilder extends MultiChildWidgetBuilder<Row, RowBuilder>
    with CommonWidgetPropertiesMixin<Row, RowBuilder> {
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;
  MainAxisSize _mainAxisSize = MainAxisSize.max;

  /// 设置主轴对齐方式
  RowBuilder mainAxisAlignment(MainAxisAlignment alignment) {
    _mainAxisAlignment = alignment;
    return self;
  }

  /// 设置交叉轴对齐方式
  RowBuilder crossAxisAlignment(CrossAxisAlignment alignment) {
    _crossAxisAlignment = alignment;
    return self;
  }

  /// 设置主轴尺寸
  RowBuilder mainAxisSize(MainAxisSize size) {
    _mainAxisSize = size;
    return self;
  }

  /// 设置子组件间距
  RowBuilder spacing(double space) {
    final List<Widget> spacedChildren = [];
    final childs = childrenWidgets;

    for (int i = 0; i < childs.length; i++) {
      spacedChildren.add(childs[i]);
      if (i < childs.length - 1) {
        spacedChildren.add(SizedBox(width: space));
      }
    }

    return children(spacedChildren);
  }

  @override
  Row build() {
    return Row(
      key: widgetKey,
      mainAxisAlignment: _mainAxisAlignment,
      crossAxisAlignment: _crossAxisAlignment,
      mainAxisSize: _mainAxisSize,
      children: childrenWidgets,
    );
  }
}

/// Column构建器
class ColumnBuilder extends MultiChildWidgetBuilder<Column, ColumnBuilder>
    with CommonWidgetPropertiesMixin<Column, ColumnBuilder> {
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;
  MainAxisSize _mainAxisSize = MainAxisSize.max;

  /// 设置主轴对齐方式
  ColumnBuilder mainAxisAlignment(MainAxisAlignment alignment) {
    _mainAxisAlignment = alignment;
    return self;
  }

  /// 设置交叉轴对齐方式
  ColumnBuilder crossAxisAlignment(CrossAxisAlignment alignment) {
    _crossAxisAlignment = alignment;
    return self;
  }

  /// 设置主轴尺寸
  ColumnBuilder mainAxisSize(MainAxisSize size) {
    _mainAxisSize = size;
    return self;
  }

  /// 设置子组件间距
  ColumnBuilder spacing(double space) {
    final List<Widget> spacedChildren = [];
    final childs = childrenWidgets;

    for (int i = 0; i < childs.length; i++) {
      spacedChildren.add(childs[i]);
      if (i < childs.length - 1) {
        spacedChildren.add(SizedBox(height: space));
      }
    }

    return children(spacedChildren);
  }

  @override
  Column build() {
    return Column(
      key: widgetKey,
      mainAxisAlignment: _mainAxisAlignment,
      crossAxisAlignment: _crossAxisAlignment,
      mainAxisSize: _mainAxisSize,
      children: childrenWidgets,
    );
  }
}

/// Stack构建器
class StackBuilder extends MultiChildWidgetBuilder<Stack, StackBuilder>
    with CommonWidgetPropertiesMixin<Stack, StackBuilder> {
  AlignmentGeometry _alignment = AlignmentDirectional.topStart;
  StackFit _fit = StackFit.loose;
  Clip _clipBehavior = Clip.hardEdge;

  /// 设置对齐方式
  StackBuilder alignment(AlignmentGeometry alignment) {
    _alignment = alignment;
    return self;
  }

  /// 设置适应方式
  StackBuilder fit(StackFit fit) {
    _fit = fit;
    return self;
  }

  /// 设置裁剪行为
  StackBuilder clipBehavior(Clip clipBehavior) {
    _clipBehavior = clipBehavior;
    return self;
  }

  @override
  Stack build() {
    return Stack(
      key: widgetKey,
      alignment: _alignment,
      fit: _fit,
      clipBehavior: _clipBehavior,
      children: childrenWidgets,
    );
  }
}

/// Wrap构建器
class WrapBuilder extends MultiChildWidgetBuilder<Wrap, WrapBuilder>
    with CommonWidgetPropertiesMixin<Wrap, WrapBuilder> {
  Axis _direction = Axis.horizontal;
  WrapAlignment _alignment = WrapAlignment.start;
  WrapAlignment _runAlignment = WrapAlignment.start;
  double _spacing = 0.0;
  double _runSpacing = 0.0;

  /// 设置方向
  WrapBuilder direction(Axis direction) {
    _direction = direction;
    return self;
  }

  /// 设置对齐方式
  WrapBuilder alignment(WrapAlignment alignment) {
    _alignment = alignment;
    return self;
  }

  /// 设置行对齐方式
  WrapBuilder runAlignment(WrapAlignment runAlignment) {
    _runAlignment = runAlignment;
    return self;
  }

  /// 设置间距
  WrapBuilder spacing(double spacing) {
    _spacing = spacing;
    return self;
  }

  /// 设置行间距
  WrapBuilder runSpacing(double runSpacing) {
    _runSpacing = runSpacing;
    return self;
  }

  @override
  Wrap build() {
    return Wrap(
      key: widgetKey,
      direction: _direction,
      alignment: _alignment,
      runAlignment: _runAlignment,
      spacing: _spacing,
      runSpacing: _runSpacing,
      children: childrenWidgets,
    );
  }
}

/// ListView构建器
class ListViewBuilder extends MultiChildWidgetBuilder<ListView, ListViewBuilder>
    with CommonWidgetPropertiesMixin<ListView, ListViewBuilder> {
  ScrollPhysics? _physics;
  bool _shrinkWrap = false;
  EdgeInsetsGeometry? _padding;
  ScrollController? _controller;
  int? _itemCount;
  IndexedWidgetBuilder? _itemBuilder;

  /// 设置滚动物理特性
  ListViewBuilder physics(ScrollPhysics physics) {
    _physics = physics;
    return self;
  }

  /// 设置是否收缩包裹
  ListViewBuilder shrinkWrap(bool shrinkWrap) {
    _shrinkWrap = shrinkWrap;
    return self;
  }

  /// 设置内边距
  ListViewBuilder padding(EdgeInsetsGeometry padding) {
    _padding = padding;
    return self;
  }

  /// 设置滚动控制器
  ListViewBuilder controller(ScrollController controller) {
    _controller = controller;
    return self;
  }

  /// 设置构建器模式
  ListViewBuilder builder({
    required int itemCount,
    required IndexedWidgetBuilder itemBuilder,
  }) {
    _itemCount = itemCount;
    _itemBuilder = itemBuilder;
    return self;
  }

  @override
  ListView build() {
    if (_itemBuilder != null && _itemCount != null) {
      return ListView.builder(
        key: widgetKey,
        physics: _physics,
        shrinkWrap: _shrinkWrap,
        padding: _padding,
        controller: _controller,
        itemCount: _itemCount,
        itemBuilder: _itemBuilder!,
      );
    } else {
      return ListView(
        key: widgetKey,
        physics: _physics,
        shrinkWrap: _shrinkWrap,
        padding: _padding,
        controller: _controller,
        children: childrenWidgets,
      );
    }
  }
}

/// GridView构建器
class GridViewBuilder extends MultiChildWidgetBuilder<GridView, GridViewBuilder>
    with CommonWidgetPropertiesMixin<GridView, GridViewBuilder> {
  ScrollPhysics? _physics;
  bool _shrinkWrap = false;
  EdgeInsetsGeometry? _padding;
  ScrollController? _controller;
  SliverGridDelegate? _gridDelegate;
  int? _itemCount;
  IndexedWidgetBuilder? _itemBuilder;

  /// 设置滚动物理特性
  GridViewBuilder physics(ScrollPhysics physics) {
    _physics = physics;
    return self;
  }

  /// 设置是否收缩包裹
  GridViewBuilder shrinkWrap(bool shrinkWrap) {
    _shrinkWrap = shrinkWrap;
    return self;
  }

  /// 设置内边距
  GridViewBuilder padding(EdgeInsetsGeometry padding) {
    _padding = padding;
    return self;
  }

  /// 设置滚动控制器
  GridViewBuilder controller(ScrollController controller) {
    _controller = controller;
    return self;
  }

  /// 设置网格委托
  GridViewBuilder gridDelegate(SliverGridDelegate gridDelegate) {
    _gridDelegate = gridDelegate;
    return self;
  }

  /// 设置固定交叉轴数量的网格
  GridViewBuilder crossAxisCount({
    required int crossAxisCount,
    double mainAxisSpacing = 0.0,
    double crossAxisSpacing = 0.0,
    double childAspectRatio = 1.0,
  }) {
    _gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: mainAxisSpacing,
      crossAxisSpacing: crossAxisSpacing,
      childAspectRatio: childAspectRatio,
    );
    return self;
  }

  /// 设置固定最大交叉轴长度的网格
  GridViewBuilder maxCrossAxisExtent({
    required double maxCrossAxisExtent,
    double mainAxisSpacing = 0.0,
    double crossAxisSpacing = 0.0,
    double childAspectRatio = 1.0,
  }) {
    _gridDelegate = SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: maxCrossAxisExtent,
      mainAxisSpacing: mainAxisSpacing,
      crossAxisSpacing: crossAxisSpacing,
      childAspectRatio: childAspectRatio,
    );
    return self;
  }

  /// 设置构建器模式
  GridViewBuilder builder({
    required int itemCount,
    required IndexedWidgetBuilder itemBuilder,
  }) {
    _itemCount = itemCount;
    _itemBuilder = itemBuilder;
    return self;
  }

  @override
  GridView build() {
    final gridDelegate = _gridDelegate ??
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2);

    if (_itemBuilder != null && _itemCount != null) {
      return GridView.builder(
        key: widgetKey,
        physics: _physics,
        shrinkWrap: _shrinkWrap,
        padding: _padding,
        controller: _controller,
        gridDelegate: gridDelegate,
        itemCount: _itemCount,
        itemBuilder: _itemBuilder!,
      );
    } else {
      return GridView(
        key: widgetKey,
        physics: _physics,
        shrinkWrap: _shrinkWrap,
        padding: _padding,
        controller: _controller,
        gridDelegate: gridDelegate,
        children: childrenWidgets,
      );
    }
  }
}

