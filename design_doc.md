# Flutter DSL 库设计文档

## 概述

本文档详细描述了一个基于链式调用风格的Flutter DSL库的设计方案。该库旨在解决Flutter开发中常见的"嵌套地狱"问题，通过提供更加简洁、直观的UI构建方式，提高开发效率和代码可读性。

## 设计目标

1. 提供链式调用风格的API，减少UI代码中的嵌套层级
2. 保持与Flutter原生组件的兼容性和互操作性
3. 支持常见的UI布局和组件模式
4. 保持代码的类型安全性
5. 支持IDE代码补全和静态分析
6. 最小化运行时开销

## DSL语法设计

### 核心理念

传统的Flutter UI代码通常采用嵌套的方式构建，例如：

```dart
Container(
  padding: EdgeInsets.all(16.0),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 4.0,
        offset: Offset(0, 2),
      ),
    ],
  ),
  child: Column(
    children: [
      Text('Title'),
      SizedBox(height: 8.0),
      Text('Description'),
    ],
  ),
)
```

使用链式调用风格的DSL后，代码可以变为：

```dart
UI.container()
  .padding(all: 16.0)
  .decoration(
    color: Colors.white,
    borderRadius: circular(8.0),
    boxShadow: [shadow(color: Colors.black.withOpacity(0.1), blurRadius: 4.0, offset: Offset(0, 2))]
  )
  .child(
    UI.column()
      .children([
        UI.text('Title'),
        UI.sizedBox(height: 8.0),
        UI.text('Description')
      ])
  )
  .build();
```

或者更进一步简化为：

```dart
UI.container()
  .padding(all: 16.0)
  .decoration(
    color: Colors.white,
    borderRadius: circular(8.0),
    boxShadow: [shadow(color: Colors.black.withOpacity(0.1), blurRadius: 4.0, offset: Offset(0, 2))]
  )
  .column([
    UI.text('Title'),
    UI.sizedBox(height: 8.0),
    UI.text('Description')
  ])
  .build();
```

### 链式API设计

每个UI组件将通过一个构建器类来表示，该类提供链式方法来设置组件的属性和子组件。基本模式如下：

1. 每个Flutter Widget对应一个构建器类（例如`ContainerBuilder`对应`Container`）
2. 构建器类提供与原生Widget属性对应的链式方法
3. 构建器类提供`build()`方法来生成最终的Flutter Widget
4. 提供一个全局入口点`UI`类，包含创建各种构建器的静态方法

### 类型安全和流畅性

为了保持类型安全性并提供流畅的API体验，我们将：

1. 使用泛型来确保链式调用返回正确的构建器类型
2. 提供适当的方法重载以支持不同的参数组合
3. 使用命名参数来提高代码可读性
4. 提供智能的默认值以减少样板代码

## 架构设计

### 核心组件

1. **UI类**：提供创建各种构建器的静态方法
2. **WidgetBuilder**：所有构建器类的基类，定义通用接口和行为
3. **专用构建器类**：为每种Flutter Widget提供专门的构建器实现
4. **DSL引擎**：处理构建器之间的关系和最终Widget的构建

### 类层次结构

```
WidgetBuilder<T extends Widget, B extends WidgetBuilder>
├── SingleChildWidgetBuilder<T, B>
│   ├── ContainerBuilder
│   ├── PaddingBuilder
│   ├── CenterBuilder
│   └── ...
├── MultiChildWidgetBuilder<T, B>
│   ├── ColumnBuilder
│   ├── RowBuilder
│   ├── StackBuilder
│   └── ...
├── LeafWidgetBuilder<T, B>
│   ├── TextBuilder
│   ├── IconBuilder
│   └── ...
└── ...
```

### 组件集成

为了无缝集成Flutter原生组件，我们将：

1. 为常用的Flutter Widget提供预定义的构建器
2. 提供通用的`custom()`方法来包装任何自定义Widget
3. 支持在DSL链中直接使用原生Widget

## 实现策略

### 核心引擎

核心引擎将负责管理构建器之间的关系和最终Widget的构建过程。它将：

1. 跟踪构建器的属性和子构建器
2. 处理构建器之间的嵌套关系
3. 优化最终生成的Widget树

### 扩展性

为了支持库的扩展和自定义，我们将：

1. 提供扩展机制，允许用户添加自定义构建器
2. 支持主题和样式的自定义
3. 提供钩子来拦截和修改构建过程

### 性能考虑

为了确保库的性能，我们将：

1. 最小化运行时开销，尽可能在编译时处理
2. 避免不必要的对象创建和内存分配
3. 优化构建过程，减少重建次数

## 使用场景

### 基本UI构建

```dart
UI.scaffold()
  .appBar(
    UI.appBar().title(UI.text('My App'))
  )
  .body(
    UI.center().child(
      UI.text('Hello World').style(
        fontSize: 24,
        fontWeight: FontWeight.bold
      )
    )
  )
  .build();
```

### 复杂表单

```dart
UI.column()
  .spacing(16)
  .padding(all: 16)
  .children([
    UI.textField().hint('Username').onChanged((value) => username = value),
    UI.textField().hint('Password').obscureText(true).onChanged((value) => password = value),
    UI.button('Login').onPressed(() => login())
  ])
  .build();
```

### 列表视图

```dart
UI.listView()
  .builder(
    itemCount: items.length,
    itemBuilder: (context, index) => 
      UI.listTile()
        .title(UI.text(items[index].title))
        .subtitle(UI.text(items[index].description))
        .onTap(() => selectItem(items[index]))
  )
  .build();
```

## 下一步计划

1. 实现核心WidgetBuilder基类和UI入口类
2. 实现基础UI组件的构建器（Container, Text, Image等）
3. 实现布局组件的构建器（Row, Column, Stack等）
4. 实现导航和交互组件的构建器（Scaffold, AppBar, Button等）
5. 编写示例应用和文档
