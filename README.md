# Flutter DSL 库使用文档

## 简介

Flutter DSL 是一个用于简化 Flutter UI 开发的库，它通过提供链式调用风格的 API 来减少嵌套地狱问题，使代码更加简洁、可读和易于维护。本文档详细介绍了如何使用 Flutter DSL 库来构建各种 UI 界面。

## 安装

在 `pubspec.yaml` 文件中添加依赖：

```yaml
dependencies:
  flutter_dsl:
    git:
      url: https://github.com/Dartly/flutter_dsl.git
      ref: master
```

然后运行：

```bash
flutter pub get
```

## 基本用法

首先导入库：

```dart
import 'package:flutter_dsl/flutter_dsl.dart';
```

### 基础组件

#### 文本

传统的 Flutter 代码：

```dart
Text(
  'Hello World',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  ),
)
```

使用 Flutter DSL：

```dart
UI.text('Hello World')
  .style(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  )
  ()
```

#### 容器

传统的 Flutter 代码：

```dart
Container(
  width: 200,
  height: 100,
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 4,
        offset: Offset(0, 2),
      ),
    ],
  ),
  child: Text('Container'),
)
```

使用 Flutter DSL：

```dart
UI.container()
  .size(width: 200, height: 100)
  .padding(all: 16)
  .decoration(
    DslUtils.decoration(
      color: Colors.white,
      borderRadius: DslUtils.circular(8),
      boxShadow: [
        DslUtils.shadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
    )
  )
  .child(UI.text('Container')())
  ()
```

或者更简洁的方式：

```dart
UI.container()
  .size(width: 200, height: 100)
  .padding(all: 16)
  .color(Colors.white)
  .borderRadius(DslUtils.circular(8))
  .childBuilder(UI.text('Container'))
  ()
```

### 布局组件

#### 行布局

传统的 Flutter 代码：

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text('Left'),
    Text('Center'),
    Text('Right'),
  ],
)
```

使用 Flutter DSL：

```dart
UI.row()
  .mainAxisAlignment(MainAxisAlignment.spaceBetween)
  .children([
    UI.text('Left')(),
    UI.text('Center')(),
    UI.text('Right')(),
  ])
  ()
```

#### 列布局

传统的 Flutter 代码：

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    SizedBox(height: 8),
    Text('Subtitle'),
    SizedBox(height: 16),
    ElevatedButton(
      onPressed: () {},
      child: Text('Button'),
    ),
  ],
)
```

使用 Flutter DSL：

```dart
UI.column()
  .crossAxisAlignment(CrossAxisAlignment.start)
  .children([
    UI.text('Title')
      .style(fontSize: 18, fontWeight: FontWeight.bold)
      (),
    UI.sizedBox(height: 8)(),
    UI.text('Subtitle')(),
    UI.sizedBox(height: 16)(),
    UI.elevatedButton('Button')
      .onPressed(() {})
      (),
  ])
  ()
```

或者使用间距简化：

```dart
UI.column()
  .crossAxisAlignment(CrossAxisAlignment.start)
  .spacing(8)
  .children([
    UI.text('Title')
      .style(fontSize: 18, fontWeight: FontWeight.bold)
      (),
    UI.text('Subtitle')(),
    UI.elevatedButton('Button')
      .onPressed(() {})
      (),
  ])
  ()
```

### Material 组件

#### Scaffold

传统的 Flutter 代码：

```dart
Scaffold(
  appBar: AppBar(
    title: Text('My App'),
    actions: [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      ),
    ],
  ),
  body: Center(
    child: Text('Hello World'),
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
)
```

使用 Flutter DSL：

```dart
UI.scaffold()
  .appBar(
    UI.appBar()
      .title(UI.text('My App')())
      .actions([
        UI.iconButton(Icons.search)
          .onPressed(() {})
          (),
      ])
      ()
  )
  .body(
    UI.center()
      .child(UI.text('Hello World')())
      ()
  )
  .floatingActionButton(
    UI.custom(
      FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      )
    )()
  )
  ()
```

#### Card

传统的 Flutter 代码：

```dart
Card(
  elevation: 4,
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Card Title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('Card content goes here'),
      ],
    ),
  ),
)
```

使用 Flutter DSL：

```dart
UI.card()
  .elevation(4)
  .child(
    UI.padding(all: 16)
      .child(
        UI.column()
          .crossAxisAlignment(CrossAxisAlignment.start)
          .spacing(8)
          .children([
            UI.text('Card Title')
              .style(fontSize: 18, fontWeight: FontWeight.bold)
              (),
            UI.text('Card content goes here')(),
          ])
          ()
      )
      ()
  )
  ()
```

### 输入组件

#### 按钮

传统的 Flutter 代码：

```dart
ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    primary: Colors.blue,
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  ),
  child: Text('Click Me'),
)
```

使用 Flutter DSL：

```dart
UI.elevatedButton('Click Me')
  .onPressed(() {})
  .style(
    ElevatedButton.styleFrom(
      primary: Colors.blue,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    )
  )
  ()
```

#### 文本输入框

传统的 Flutter 代码：

```dart
TextField(
  controller: _controller,
  decoration: InputDecoration(
    hintText: 'Enter your name',
    border: OutlineInputBorder(),
  ),
  onChanged: (value) {
    // Handle text change
  },
)
```

使用 Flutter DSL：

```dart
UI.textField()
  .controller(_controller)
  .hint('Enter your name')
  .decoration(
    InputDecoration(
      border: OutlineInputBorder(),
    )
  )
  .onChanged((value) {
    // Handle text change
  })
  ()
```

## 高级用法

### 组合构建器

Flutter DSL 允许你组合多个构建器来创建复杂的 UI：

```dart
UI.container()
  .padding(all: 16)
  .color(Colors.white)
  .borderRadius(DslUtils.circular(8))
  .child(
    UI.column()
      .spacing(16)
      .children([
        UI.text('Welcome')
          .style(fontSize: 24, fontWeight: FontWeight.bold)
          (),
        UI.textField()
          .hint('Username')
          (),
        UI.textField()
          .hint('Password')
          .obscureText(true)
          (),
        UI.elevatedButton('Login')
          .onPressed(() {})
          (),
      ])
      ()
  )
  ()
```

### 链式方法扩展

你可以通过扩展 `SingleChildWidgetBuilder` 类来添加便捷方法：

```dart
extension ContainerBuilderExtension on ContainerBuilder {
  ContainerBuilder column(List<Widget> children) {
    return child(
      UI.column()
        .children(children)
        ()
    );
  }
  
  ContainerBuilder row(List<Widget> children) {
    return child(
      UI.row()
        .children(children)
        ()
    );
  }
}
```

使用扩展方法：

```dart
UI.container()
  .padding(all: 16)
  .column([
    UI.text('Title')(),
    UI.text('Subtitle')(),
  ])
  ()
```

### 自定义构建器

你可以创建自己的构建器来封装常用的 UI 模式：

```dart
class ProfileCardBuilder extends WidgetBuilder<Widget, ProfileCardBuilder> {
  String _name = '';
  String _title = '';
  String? _avatarUrl;
  
  ProfileCardBuilder name(String name) {
    _name = name;
    return self;
  }
  
  ProfileCardBuilder title(String title) {
    _title = title;
    return self;
  }
  
  ProfileCardBuilder avatarUrl(String avatarUrl) {
    _avatarUrl = avatarUrl;
    return self;
  }
  
  @override
  Widget build() {
    return UI.card()
      .elevation(2)
      .child(
        UI.row()
          .spacing(16)
          .padding(all: 16)
          .children([
            _avatarUrl != null
              ? UI.image(network: _avatarUrl)
                  .size(width: 50, height: 50)
                  ()
              : UI.container()
                  .size(width: 50, height: 50)
                  .color(Colors.grey)
                  .borderRadius(DslUtils.circular(25))
                  (),
            UI.column()
              .crossAxisAlignment(CrossAxisAlignment.start)
              .children([
                UI.text(_name)
                  .style(fontSize: 16, fontWeight: FontWeight.bold)
                  (),
                UI.text(_title)
                  .style(color: Colors.grey)
                  (),
              ])
              (),
          ])
          ()
      )
      ();
  }
}

// 使用自定义构建器
ProfileCardBuilder()
  .name('John Doe')
  .title('Software Engineer')
  .avatarUrl('https://example.com/avatar.jpg')
  ()
```

## 最佳实践

### 减少嵌套

Flutter DSL 的主要目标是减少嵌套，以下是一些最佳实践：

1. 使用 `childBuilder` 方法代替 `child` 方法，避免调用 `()` 方法：

```dart
// 不推荐
UI.container()
  .child(UI.text('Hello')())
  ()

// 推荐
UI.container()
  .childBuilder(UI.text('Hello'))
  ()
```

2. 使用 `spacing` 方法代替手动添加 `SizedBox`：

```dart
// 不推荐
UI.column()
  .children([
    UI.text('Item 1')(),
    UI.sizedBox(height: 8)(),
    UI.text('Item 2')(),
    UI.sizedBox(height: 8)(),
    UI.text('Item 3')(),
  ])
  ()

// 推荐
UI.column()
  .spacing(8)
  .children([
    UI.text('Item 1')(),
    UI.text('Item 2')(),
    UI.text('Item 3')(),
  ])
  ()
```

3. 使用扩展方法简化常见模式：

```dart
// 不推荐
UI.container()
  .child(
    UI.column()
      .children([
        UI.text('Title')(),
        UI.text('Subtitle')(),
      ])
      ()
  )
  ()

// 推荐
UI.container()
  .column([
    UI.text('Title')(),
    UI.text('Subtitle')(),
  ])
  ()
```

### 性能考虑

1. 避免在构建方法中创建构建器：

```dart
// 不推荐
@override
Widget build(BuildContext context) {
  return UI.container()
    .child(
      UI.text('Created every build')()
    )
    ();
}

// 推荐
final textBuilder = UI.text('Created once');

@override
Widget build(BuildContext context) {
  return UI.container()
    .child(textBuilder())
    ();
}
```

2. 对于复杂的 UI，考虑分解成多个构建器：

```dart
Widget buildProfileSection() {
  return UI.column()
    .spacing(16)
    .children([
      buildHeader(),
      buildDetails(),
      buildActions(),
    ])
    ();
}

Widget buildHeader() {
  return UI.row()
    // ...
    ();
}

Widget buildDetails() {
  return UI.column()
    // ...
    ();
}

Widget buildActions() {
  return UI.row()
    // ...
    ();
}
```

## 常见问题

### 如何处理状态管理？

Flutter DSL 专注于 UI 构建，不涉及状态管理。你可以将它与任何状态管理解决方案（如 Provider、Bloc、Riverpod 等）结合使用。

### 如何处理事件回调？

每个构建器都提供了相应的事件回调方法，例如 `onTap`、`onPressed`、`onChanged` 等。

### 如何与现有 Flutter 代码集成？

Flutter DSL 可以与现有的 Flutter 代码无缝集成。你可以在任何需要 `Widget` 的地方使用 Flutter DSL 构建的组件，也可以使用 `UI.custom()` 方法包装任何现有的 Flutter 组件。

## 总结

Flutter DSL 库通过提供链式调用风格的 API，有效减少了 Flutter UI 代码中的嵌套层级，使代码更加简洁、可读和易于维护。它保持了与 Flutter 原生组件的兼容性，同时提供了更加流畅的开发体验。

通过使用 Flutter DSL，你可以：

1. 减少代码嵌套层级
2. 提高代码可读性
3. 简化复杂 UI 的构建
4. 保持与 Flutter 原生组件的兼容性
5. 享受流畅的链式调用体验

希望这个库能够帮助你更高效地开发 Flutter 应用！
