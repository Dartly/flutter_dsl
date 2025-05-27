import 'package:flutter/material.dart';
import 'package:flutter_dsl/flutter_dsl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DSL Examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ExamplesPage(),
    );
  }
}

class ExamplesPage extends StatefulWidget {
  @override
  _ExamplesPageState createState() => _ExamplesPageState();
}

class _ExamplesPageState extends State<ExamplesPage> {
  int _selectedIndex = 0;

  final List<Widget> _examples = [
    BasicComponentsExample(),
    LayoutComponentsExample(),
    MaterialComponentsExample(),
    InputComponentsExample(),
    ComplexUIExample(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return UI
        .scaffold()
        .appBar(UI.appBar().title(UI.text('Flutter DSL Examples')())())
        .body(_examples[_selectedIndex])
        .bottomNavigationBar(UI
            .bottomNavigationBar()
            .items([
              BottomNavigationBarItem(
                icon: Icon(Icons.widgets),
                label: 'Basic',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Layout',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.style),
                label: 'Material',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.input),
                label: 'Input',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                label: 'Complex',
              ),
            ])
            .currentIndex(_selectedIndex)
            .onTap(_onItemTapped)())();
  }
}

class BasicComponentsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UI.padding(all: 16).child(UI.column().spacing(16).children([
          UI
              .text('Basic Components')
              .style(fontSize: 24, fontWeight: FontWeight.bold)(),

          // Text example
          UI.card().child(UI.padding(all: 16).child(UI
                  .column()
                  .crossAxisAlignment(CrossAxisAlignment.start)
                  .spacing(8)
                  .children([
                UI
                    .text('Text Component')
                    .style(fontSize: 18, fontWeight: FontWeight.bold)(),
                UI.text('Regular text')(),
                UI.text('Styled text').style(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    )(),
                UI
                    .text(
                        'Very long text that will wrap to the next line if it exceeds the available width')
                    .maxLines(2)
                    .overflow(TextOverflow.ellipsis)(),
              ])())())(),

          // Container example
          UI.card().child(UI.padding(all: 16).child(UI
                  .column()
                  .crossAxisAlignment(CrossAxisAlignment.start)
                  .spacing(8)
                  .children([
                UI
                    .text('Container Component')
                    .style(fontSize: 18, fontWeight: FontWeight.bold)(),
                UI
                    .container()
                    .size(width: double.infinity, height: 50)
                    .color(Colors.blue.shade100)
                    .padding(all: 8)
                    .child(UI
                        .text('Basic Container')
                        .textAlign(TextAlign.center)())(),
                UI
                    .container()
                    .size(width: double.infinity, height: 50)
                    .borderRadius(DslUtils.circular(8))
                    .color(Colors.white)
                    .border(DslUtils.border(color: Colors.blue))
                    .boxShadow([
                      DslUtils.shadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ])
                    .padding(all: 8)
                    .child(UI
                        .text('Decorated Container')
                        .textAlign(TextAlign.center)())(),
              ])())())(),

          // Icon example
          UI.card().child(UI.padding(all: 16).child(UI
                  .column()
                  .crossAxisAlignment(CrossAxisAlignment.start)
                  .spacing(8)
                  .children([
                UI
                    .text('Icon Component')
                    .style(fontSize: 18, fontWeight: FontWeight.bold)(),
                UI
                    .row()
                    .spacing(16)
                    .mainAxisAlignment(MainAxisAlignment.center)
                    .children([
                  UI.icon(Icons.favorite).color(Colors.red).size(32)(),
                  UI.icon(Icons.star).color(Colors.amber).size(32)(),
                  UI.icon(Icons.thumb_up).color(Colors.blue).size(32)(),
                ])(),
              ])())())(),
        ])())();
  }
}

class LayoutComponentsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UI.padding(all: 16).child(UI.column().spacing(16).children([
          UI
              .text('Layout Components')
              .style(fontSize: 24, fontWeight: FontWeight.bold)(),

          // Row example
          UI.card().child(UI.padding(all: 16).child(UI
                  .column()
                  .crossAxisAlignment(CrossAxisAlignment.start)
                  .spacing(8)
                  .children([
                UI
                    .text('Row Component')
                    .style(fontSize: 18, fontWeight: FontWeight.bold)(),
                UI
                    .row()
                    .mainAxisAlignment(MainAxisAlignment.spaceBetween)
                    .children([
                  UI
                      .container()
                      .size(width: 50, height: 50)
                      .color(Colors.red)(),
                  UI
                      .container()
                      .size(width: 50, height: 50)
                      .color(Colors.green)(),
                  UI
                      .container()
                      .size(width: 50, height: 50)
                      .color(Colors.blue)(),
                ])(),
              ])())())(),

          // Column example
          UI.card().child(UI.padding(all: 16).child(UI
                  .column()
                  .crossAxisAlignment(CrossAxisAlignment.start)
                  .spacing(8)
                  .children([
                UI
                    .text('Column Component')
                    .style(fontSize: 18, fontWeight: FontWeight.bold)(),
                UI.container().height(150).child(UI
                        .column()
                        .mainAxisAlignment(MainAxisAlignment.spaceBetween)
                        .children([
                      UI
                          .container()
                          .size(width: 100, height: 30)
                          .color(Colors.red)(),
                      UI
                          .container()
                          .size(width: 100, height: 30)
                          .color(Colors.green)(),
                      UI
                          .container()
                          .size(width: 100, height: 30)
                          .color(Colors.blue)(),
                    ])())(),
              ])())())(),

          // Stack example
          UI.card().child(UI.padding(all: 16).child(UI
                  .column()
                  .crossAxisAlignment(CrossAxisAlignment.start)
                  .spacing(8)
                  .children([
                UI
                    .text('Stack Component')
                    .style(fontSize: 18, fontWeight: FontWeight.bold)(),
                UI
                    .container()
                    .height(100)
                    .child(UI.stack().alignment(Alignment.center).children([
                      UI
                          .container()
                          .size(width: 100, height: 100)
                          .color(Colors.blue.shade200)(),
                      UI
                          .container()
                          .size(width: 80, height: 80)
                          .color(Colors.blue.shade400)(),
                      UI
                          .container()
                          .size(width: 60, height: 60)
                          .color(Colors.blue.shade600)(),
                      UI.text('Stack').style(color: Colors.white)(),
                    ])())(),
              ])())())(),
        ])())();
  }
}

class MaterialComponentsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UI.padding(all: 16).child(UI.column().spacing(16).children([
          UI
              .text('Material Components')
              .style(fontSize: 24, fontWeight: FontWeight.bold)(),

          // Card example
          UI.card().elevation(4).child(UI.padding(all: 16).child(UI
                  .column()
                  .crossAxisAlignment(CrossAxisAlignment.start)
                  .spacing(8)
                  .children([
                UI
                    .text('Card Component')
                    .style(fontSize: 18, fontWeight: FontWeight.bold)(),
                UI.text('This is a card with elevation and padding.')(),
              ])())())(),

          // ListTile example
          UI.card().child(UI.column().children([
                UI
                    .text('ListTile Component')
                    .style(fontSize: 18, fontWeight: FontWeight.bold)(),
                UI
                    .listTile()
                    .leading(UI.icon(Icons.person)())
                    .title(UI.text('John Doe')())
                    .subtitle(UI.text('Software Engineer')())
                    .trailing(UI.icon(Icons.arrow_forward_ios)())
                    .onTap(() {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('ListTile tapped')));
                })(),
                UI
                    .listTile()
                    .leading(UI.icon(Icons.email)())
                    .title(UI.text('jane@example.com')())
                    .subtitle(UI.text('Email address')())
                    .trailing(UI.icon(Icons.arrow_forward_ios)())
                    .onTap(() {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Email ListTile tapped')));
                })(),
              ])())(),
        ])())();
  }
}

class InputComponentsExample extends StatefulWidget {
  @override
  _InputComponentsExampleState createState() => _InputComponentsExampleState();
}

class _InputComponentsExampleState extends State<InputComponentsExample> {
  String _textValue = '';
  bool _checkboxValue = false;
  bool _switchValue = false;
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return UI.padding(all: 16).child(UI.column().spacing(16).children([
          UI
              .text('Input Components')
              .style(fontSize: 24, fontWeight: FontWeight.bold)(),

          // Button example
          UI.card().child(UI.padding(all: 16).child(UI
                  .column()
                  .crossAxisAlignment(CrossAxisAlignment.start)
                  .spacing(8)
                  .children([
                UI
                    .text('Button Components')
                    .style(fontSize: 18, fontWeight: FontWeight.bold)(),
                UI.row().spacing(8).children([
                  UI.elevatedButton('Elevated').onPressed(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Elevated button pressed')));
                  })(),
                  UI.outlinedButton('Outlined').onPressed(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Outlined button pressed')));
                  })(),
                  UI.textButton('Text').onPressed(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Text button pressed')));
                  })(),
                ])(),
              ])())())(),

          // TextField example
          UI.card().child(UI.padding(all: 16).child(UI
                  .column()
                  .crossAxisAlignment(CrossAxisAlignment.start)
                  .spacing(8)
                  .children([
                UI
                    .text('TextField Component')
                    .style(fontSize: 18, fontWeight: FontWeight.bold)(),
                UI.textField().hint('Enter some text').onChanged((value) {
                  setState(() {
                    _textValue = value;
                  });
                })(),
                UI.text('You entered: $_textValue')(),
              ])())())(),

          // Checkbox and Switch example
          UI.card().child(UI.padding(all: 16).child(UI
                  .column()
                  .crossAxisAlignment(CrossAxisAlignment.start)
                  .spacing(8)
                  .children([
                UI
                    .text('Toggle Components')
                    .style(fontSize: 18, fontWeight: FontWeight.bold)(),
                UI.row().children([
                  UI.checkbox(
                    value: _checkboxValue,
                    onChanged: (value) {
                      setState(() {
                        _checkboxValue = value ?? false;
                      });
                    },
                  )(),
                  UI.sizedBox(width: 8)(),
                  UI.text(
                      'Checkbox is ${_checkboxValue ? 'checked' : 'unchecked'}')(),
                ])(),
                UI.row().children([
                  UI.switch_(
                    value: _switchValue,
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  )(),
                  UI.sizedBox(width: 8)(),
                  UI.text('Switch is ${_switchValue ? 'on' : 'off'}')(),
                ])(),
              ])())())(),

          // Slider example
          UI.card().child(UI.padding(all: 16).child(UI
                  .column()
                  .crossAxisAlignment(CrossAxisAlignment.start)
                  .spacing(8)
                  .children([
                UI
                    .text('Slider Component')
                    .style(fontSize: 18, fontWeight: FontWeight.bold)(),
                UI
                    .slider(
                      value: _sliderValue,
                      onChanged: (value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                    )
                    .min(0)
                    .max(1)
                    .divisions(10)(),
                UI.text(
                    'Slider value: ${(_sliderValue * 100).toStringAsFixed(0)}%')(),
              ])())())(),
        ])())();
  }
}

class ComplexUIExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UI.padding(all: 16).child(UI.column().spacing(16).children([
          UI
              .text('Complex UI Example')
              .style(fontSize: 24, fontWeight: FontWeight.bold)(),

          // Profile card example
          UI.card().elevation(4).child(UI.column().children([
                UI.container().height(120).decoration(DslUtils.decoration(
                      gradient: DslUtils.linearGradient(
                        colors: [Colors.blue.shade800, Colors.blue.shade400],
                      ),
                    ))(),
                UI
                    .container()
                    .padding(all: 16)
                    .child(UI.column().spacing(8).children([
                      UI.row().children([
                        UI
                            .container()
                            .size(width: 80, height: 80)
                            .decoration(DslUtils.decoration(
                              color: Colors.grey.shade300,
                              borderRadius: DslUtils.circular(40),
                              border: DslUtils.border(
                                color: Colors.white,
                                width: 3,
                              ),
                            ))
                            .child(UI.center().child(UI.text('JD').style(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700,
                                )())())(),
                        UI.sizedBox(width: 16)(),
                        UI
                            .column()
                            .crossAxisAlignment(CrossAxisAlignment.start)
                            .spacing(4)
                            .children([
                          UI.text('John Doe').style(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )(),
                          UI.text('Software Engineer').style(
                                color: Colors.grey.shade600,
                              )(),
                          UI.text('San Francisco, CA').style(
                                color: Colors.grey.shade600,
                                fontSize: 12,
                              )(),
                        ])(),
                      ])(),
                      UI.sizedBox(height: 16)(),
                      UI
                          .row()
                          .mainAxisAlignment(MainAxisAlignment.spaceAround)
                          .children([
                        UI.column().children([
                          UI.text('1.5K').style(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )(),
                          UI.text('Posts').style(
                                color: Colors.grey.shade600,
                              )(),
                        ])(),
                        UI.column().children([
                          UI.text('2.5K').style(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )(),
                          UI.text('Followers').style(
                                color: Colors.grey.shade600,
                              )(),
                        ])(),
                        UI.column().children([
                          UI.text('350').style(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )(),
                          UI.text('Following').style(
                                color: Colors.grey.shade600,
                              )(),
                        ])(),
                      ])(),
                      UI.sizedBox(height: 16)(),
                      UI.row().spacing(8).children([
                        UI.elevatedButton('Follow').onPressed(() {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Follow button pressed')));
                        })(),
                        UI.outlinedButton('Message').onPressed(() {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Message button pressed')));
                        })(),
                      ])(),
                    ])())(),
              ])())(),

          // Login form example
          UI.card().elevation(4).child(
              UI.padding(all: 16).child(UI.column().spacing(16).children([
                    UI.text('Login Form').style(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )(),
                    UI.textField().hint('Email').decoration(InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ))(),
                    UI
                        .textField()
                        .hint('Password')
                        .obscureText(true)
                        .decoration(InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                        ))(),
                    UI.elevatedButton('Login').onPressed(() {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login button pressed')));
                    })(),
                    UI
                        .row()
                        .mainAxisAlignment(MainAxisAlignment.center)
                        .children([
                      UI.text('Don\'t have an account? ')(),
                      UI.textButton('Sign up').onPressed(() {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Sign up button pressed')));
                      })(),
                    ])(),
                  ])())())(),
        ])())();
  }
}
