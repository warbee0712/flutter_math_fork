import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';
import '../ast/options.dart';
import '../ast/syntax_tree.dart';
import '../parser/tex/parse_error.dart';
import '../parser/tex/parser.dart';
import '../parser/tex/settings.dart';
// import 'controller.dart';
// import 'scope.dart';

enum FlutterMathMode {
  edit,
  select,
  view,
}

extension FlutterMathModeExt on FlutterMathMode {
  bool get canEdit => this == FlutterMathMode.edit;
  bool get canSelect => this != FlutterMathMode.view;
}

class FlutterMath {
  // final FlutterMathController controller;
  // final FocusNode focusNode;
  // final TextSelectionControls selectionControls;
  // final bool autofocus;
  // final FlutterMathMode mode;
  // const FlutterMath({
  //   Key key,
  //   @required this.controller,
  //   @required this.focusNode,
  //   this.selectionControls,
  //   this.autofocus = true,
  //   this.mode = FlutterMathMode.edit,
  // })  : assert(mode != null),
  //       assert(controller != null),
  //       assert(focusNode != null),
  //       super(key: key);

  static Widget fromTexString(
    String expression, {
    Options options = Options.displayOptions,
    Settings settings = const Settings(),
    FlutterMathMode mode = FlutterMathMode.view,
  }) {
    if (mode != FlutterMathMode.view) {
      throw UnimplementedError('Other mode is still in development!');
    }
    try {
      final tree = SyntaxTree(
        greenRoot: TexParser(expression, settings).parse(),
      );
      return tree.buildWidget(options);
    } on ParseError catch (e) {
      return Text(e.message);
    } on Object catch (e) {
      return Text('Internal error: $e. Please report.');
    }
  }

  // const FlutterMath.fromAst({
  //   Key key,
  //   @required SyntaxTree equation,
  //   @required this.focusNode,
  //   this.selectionControls,
  //   this.autofocus = true,
  //   this.mode = FlutterMathMode.edit,
  // })  : controller = FlutterMathController(equation),
  //       super(key: key);
  // @override
  // _FlutterMathState createState() => _FlutterMathState();
}

// class _FlutterMathState extends State<FlutterMath> {
//   SyntaxTree get equation => widget.controller.equation;

//   TextSelection get selection => widget.controller.selection;

//   @override
//   Widget build(BuildContext context) => ChangeNotifierProvider(
//         create: (_) => FlutterMathScope(),
//       );
// }
