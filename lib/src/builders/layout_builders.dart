import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widget_builder.dart';

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
