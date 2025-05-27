import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'builders/basic_builders.dart';
import 'builders/layout_builders.dart';
import 'builders/material_builders.dart';
import 'builders/input_builders.dart';

/// UI 是Flutter DSL库的主入口点，提供创建各种构建器的静态方法
class UI {
  // 基础组件
  
  /// 创建Container构建器
  static ContainerBuilder container() => ContainerBuilder();
  
  /// 创建Text构建器
  static TextBuilder text(String text) => TextBuilder(text);
  
  /// 创建Icon构建器
  static IconBuilder icon(IconData icon) => IconBuilder(icon);
  
  /// 创建Image构建器
  static ImageBuilder image({
    String? asset,
    String? network,
    File? file,
    Uint8List? memory,
  }) => ImageBuilder(
    asset: asset,
    network: network,
    file: file,
    memory: memory,
  );
  
  /// 创建SizedBox构建器
  static SizedBoxBuilder sizedBox({double? width, double? height}) => 
      SizedBoxBuilder(width: width, height: height);
  
  /// 创建Padding构建器
  static PaddingBuilder padding({
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) => PaddingBuilder().padding(
    all: all,
    horizontal: horizontal,
    vertical: vertical,
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );
  
  /// 创建Center构建器
  static CenterBuilder center() => CenterBuilder();
  
  /// 创建Align构建器
  static AlignBuilder align([AlignmentGeometry alignment = Alignment.center]) => 
      AlignBuilder(alignment);
  
  // 布局组件
  
  /// 创建Row构建器
  static RowBuilder row([List<Widget>? children]) => 
      children != null ? RowBuilder().children(children) : RowBuilder();
  
  /// 创建Column构建器
  static ColumnBuilder column([List<Widget>? children]) => 
      children != null ? ColumnBuilder().children(children) : ColumnBuilder();
  
  /// 创建Stack构建器
  static StackBuilder stack([List<Widget>? children]) => 
      children != null ? StackBuilder().children(children) : StackBuilder();
  
  /// 创建Wrap构建器
  static WrapBuilder wrap([List<Widget>? children]) => 
      children != null ? WrapBuilder().children(children) : WrapBuilder();
  
  /// 创建ListView构建器
  static ListViewBuilder listView([List<Widget>? children]) => 
      children != null ? ListViewBuilder().children(children) : ListViewBuilder();
  
  /// 创建GridView构建器
  static GridViewBuilder gridView() => GridViewBuilder();
  
  // Material组件
  
  /// 创建Scaffold构建器
  static ScaffoldBuilder scaffold() => ScaffoldBuilder();
  
  /// 创建AppBar构建器
  static AppBarBuilder appBar() => AppBarBuilder();
  
  /// 创建Card构建器
  static CardBuilder card() => CardBuilder();
  
  /// 创建ListTile构建器
  static ListTileBuilder listTile() => ListTileBuilder();
  
  /// 创建Drawer构建器
  static DrawerBuilder drawer() => DrawerBuilder();
  
  /// 创建BottomNavigationBar构建器
  static BottomNavigationBarBuilder bottomNavigationBar() => BottomNavigationBarBuilder();
  
  /// 创建TabBar构建器
  static TabBarBuilder tabBar() => TabBarBuilder();
  
  /// 创建TabBarView构建器
  static TabBarViewBuilder tabBarView() => TabBarViewBuilder();
  
  // 输入组件
  
  /// 创建Button构建器
  static ButtonBuilder button(String text) => ButtonBuilder(text);
  
  /// 创建ElevatedButton构建器
  static ElevatedButtonBuilder elevatedButton(String text) => ElevatedButtonBuilder(text);
  
  /// 创建OutlinedButton构建器
  static OutlinedButtonBuilder outlinedButton(String text) => OutlinedButtonBuilder(text);
  
  /// 创建TextButton构建器
  static TextButtonBuilder textButton(String text) => TextButtonBuilder(text);
  
  /// 创建IconButton构建器
  static IconButtonBuilder iconButton(IconData icon) => IconButtonBuilder(icon);
  
  /// 创建TextField构建器
  static TextFieldBuilder textField() => TextFieldBuilder();
  
  /// 创建Checkbox构建器
  static CheckboxBuilder checkbox({required bool value, required ValueChanged<bool?>? onChanged}) => 
      CheckboxBuilder(value: value, onChanged: onChanged);
  
  /// 创建Radio构建器
  static RadioBuilder radio({required dynamic value, required dynamic groupValue, required ValueChanged? onChanged}) => 
      RadioBuilder(value: value, groupValue: groupValue, onChanged: onChanged);
  
  /// 创建Switch构建器
  static SwitchBuilder switch_({required bool value, required ValueChanged<bool>? onChanged}) => 
      SwitchBuilder(value: value, onChanged: onChanged);
  
  /// 创建Slider构建器
  static SliderBuilder slider({required double value, required ValueChanged<double>? onChanged}) => 
      SliderBuilder(value: value, onChanged: onChanged);
  
  // 自定义组件
  
  /// 创建自定义Widget构建器
  static CustomWidgetBuilder custom(Widget widget) => CustomWidgetBuilder(widget);
}

