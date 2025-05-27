import 'package:flutter/widgets.dart';
/// 
/// 泛型参数:
/// - T: 构建器最终生成的Widget类型
/// - B: 构建器自身类型，用于链式调用返回正确的类型
abstract class BaseWidgetBuilder<T extends Widget, B extends BaseWidgetBuilder<T, B>> {
  /// 允许 builder 实例像函数一样直接返回 build 结果
  T call() => build();
  /// 构建最终的Widget
  T build();
  
  /// 返回构建器自身，用于链式调用
  B get self => this as B;
}

/// 单子组件构建器基类
abstract class SingleChildWidgetBuilder<T extends Widget, B extends SingleChildWidgetBuilder<T, B>> 
    extends BaseWidgetBuilder<T, B> {
  Widget? _child;
  
  /// 设置子组件
  B child(Widget child) {
    _child = child;
    return self;
  }
  
  /// 使用构建器作为子组件
  B childBuilder<W extends Widget>(BaseWidgetBuilder<W, dynamic> builder) {
    return child(builder.build());
  }
  
  /// 获取子组件
  Widget? get childWidget => _child;
}

/// 多子组件构建器基类
abstract class MultiChildWidgetBuilder<T extends Widget, B extends MultiChildWidgetBuilder<T, B>> 
    extends BaseWidgetBuilder<T, B> {
  final List<Widget> _children = [];
  
  /// 设置子组件列表
  B children(List<Widget> children) {
    _children.clear();
    _children.addAll(children);
    return self;
  }
  
  /// 添加单个子组件
  B addChild(Widget child) {
    _children.add(child);
    return self;
  }
  
  /// 使用构建器列表作为子组件
  B childrenBuilders<W extends Widget>(List<BaseWidgetBuilder<W, dynamic>> builders) {
    return children(builders.map((builder) => builder.build()).toList());
  }
  
  /// 获取子组件列表
  List<Widget> get childrenWidgets => List.unmodifiable(_children);
}

/// 无子组件构建器基类
abstract class LeafWidgetBuilder<T extends Widget, B extends LeafWidgetBuilder<T, B>> 
    extends BaseWidgetBuilder<T, B> {
  // 无子组件的构建器基类，主要用于文本、图标等叶子节点
}

/// 通用属性混入，提供常见的Widget属性设置
mixin CommonWidgetPropertiesMixin<T extends Widget, B extends BaseWidgetBuilder<T, B>> on BaseWidgetBuilder<T, B> {
  Key? _key;
  
  /// 设置Widget的key
  B key(Key key) {
    _key = key;
    return self;
  }
  
  /// 获取key
  Key? get widgetKey => _key;
}

/// 尺寸约束混入，提供尺寸相关的属性设置
mixin SizeConstraintsMixin<T extends Widget, B extends BaseWidgetBuilder<T, B>> on BaseWidgetBuilder<T, B> {
  double? _width;
  double? _height;
  BoxConstraints? _constraints;
  
  /// 设置宽度
  B width(double width) {
    _width = width;
    return self;
  }
  
  /// 设置高度
  B height(double height) {
    _height = height;
    return self;
  }
  
  /// 同时设置宽度和高度
  B size({double? width, double? height}) {
    _width = width;
    _height = height;
    return self;
  }
  
  /// 设置约束条件
  B constraints(BoxConstraints constraints) {
    _constraints = constraints;
    return self;
  }
  
  /// 获取宽度
  double? get widgetWidth => _width;
  
  /// 获取高度
  double? get widgetHeight => _height;
  
  /// 获取约束条件
  BoxConstraints? get widgetConstraints => _constraints;
}

/// 边距混入，提供边距相关的属性设置
mixin PaddingMixin<T extends Widget, B extends BaseWidgetBuilder<T, B>> on BaseWidgetBuilder<T, B> {
  EdgeInsetsGeometry? _padding;
  
  /// 设置边距
  B padding({
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    if (all != null) {
      _padding = EdgeInsets.all(all);
    } else {
      _padding = EdgeInsets.only(
        left: left ?? horizontal ?? 0.0,
        top: top ?? vertical ?? 0.0,
        right: right ?? horizontal ?? 0.0,
        bottom: bottom ?? vertical ?? 0.0,
      );
    }
    return self;
  }
  
  /// 获取边距
  EdgeInsetsGeometry? get widgetPadding => _padding;
}

/// 边框混入，提供边框相关的属性设置
mixin BorderMixin<T extends Widget, B extends BaseWidgetBuilder<T, B>> on BaseWidgetBuilder<T, B> {
  BoxBorder? _border;
  BorderRadius? _borderRadius;
  
  /// 设置边框
  B border(BoxBorder border) {
    _border = border;
    return self;
  }
  
  /// 设置边框圆角
  B borderRadius(BorderRadius borderRadius) {
    _borderRadius = borderRadius;
    return self;
  }
  
  /// 获取边框
  BoxBorder? get widgetBorder => _border;
  
  /// 获取边框圆角
  BorderRadius? get widgetBorderRadius => _borderRadius;
}

/// 颜色和装饰混入，提供颜色和装饰相关的属性设置
mixin ColorAndDecorationMixin<T extends Widget, B extends BaseWidgetBuilder<T, B>> on BaseWidgetBuilder<T, B> {
  Color? _color;
  BoxDecoration? _decoration;
  BorderRadiusGeometry? _borderRadius;
  BoxBorder? _border;
  List<BoxShadow>? _boxShadow;
  Gradient? _gradient;
  DecorationImage? _image;

  /// 设置背景颜色
  B color(Color color) {
    _color = color;
    return self;
  }

  /// 设置圆角
  B borderRadius(BorderRadiusGeometry borderRadius) {
    _borderRadius = borderRadius;
    return self;
  }

  /// 设置边框
  B border(BoxBorder border) {
    _border = border;
    return self;
  }

  /// 设置阴影
  B boxShadow(List<BoxShadow> boxShadow) {
    _boxShadow = boxShadow;
    return self;
  }

  /// 设置渐变
  B gradient(Gradient gradient) {
    _gradient = gradient;
    return self;
  }

  /// 设置背景图片
  B image(DecorationImage image) {
    _image = image;
    return self;
  }

  /// 设置装饰
  B decoration(BoxDecoration decoration) {
    _decoration = decoration;
    return self;
  }

  /// 获取背景颜色
  Color? get widgetColor => _color;

  /// 获取装饰
  BoxDecoration? get widgetDecoration {
    if (_decoration != null) return _decoration;
    if (_color != null || _borderRadius != null || _border != null || _boxShadow != null || _gradient != null || _image != null) {
      return BoxDecoration(
        color: _color,
        borderRadius: _borderRadius,
        border: _border,
        boxShadow: _boxShadow,
        gradient: _gradient,
        image: _image,
      );
    }
    return null;
  }
}

/// 对齐混入，提供对齐相关的属性设置
mixin AlignmentMixin<T extends Widget, B extends BaseWidgetBuilder<T, B>> on BaseWidgetBuilder<T, B> {
  AlignmentGeometry? _alignment;
  
  /// 设置对齐方式
  B alignment(AlignmentGeometry alignment) {
    _alignment = alignment;
    return self;
  }
  
  /// 居中对齐
  B alignCenter() {
    return alignment(Alignment.center);
  }
  
  /// 左对齐
  B alignLeft() {
    return alignment(Alignment.centerLeft);
  }
  
  /// 右对齐
  B alignRight() {
    return alignment(Alignment.centerRight);
  }
  
  /// 顶部对齐
  B alignTop() {
    return alignment(Alignment.topCenter);
  }
  
  /// 底部对齐
  B alignBottom() {
    return alignment(Alignment.bottomCenter);
  }
  
  /// 获取对齐方式
  AlignmentGeometry? get widgetAlignment => _alignment;
}

/// 手势混入，提供手势相关的属性设置
mixin GestureMixin<T extends Widget, B extends BaseWidgetBuilder<T, B>> on BaseWidgetBuilder<T, B> {
  GestureTapCallback? _onTap;
  GestureLongPressCallback? _onLongPress;
  
  /// 设置点击回调
  B onTap(GestureTapCallback onTap) {
    _onTap = onTap;
    return self;
  }
  
  /// 设置长按回调
  B onLongPress(GestureLongPressCallback onLongPress) {
    _onLongPress = onLongPress;
    return self;
  }
  
  /// 获取点击回调
  GestureTapCallback? get widgetOnTap => _onTap;
  
  /// 获取长按回调
  GestureLongPressCallback? get widgetOnLongPress => _onLongPress;
}
