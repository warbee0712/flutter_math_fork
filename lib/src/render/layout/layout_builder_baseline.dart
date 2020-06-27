import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class LayoutBuilderPreserveBaseline
    extends ConstrainedLayoutBuilder<BoxConstraints> {
  /// Creates a widget that defers its building until layout.
  ///
  /// The [builder] argument must not be null.
  const LayoutBuilderPreserveBaseline({
    Key key,
    @required LayoutWidgetBuilder builder,
  })  : assert(builder != null),
        super(key: key, builder: builder);

  @override
  LayoutWidgetBuilder get builder => super.builder;

  @override
  _RenderLayoutBuilderPreserveBaseline createRenderObject(
          BuildContext context) =>
      _RenderLayoutBuilderPreserveBaseline();
}

class _RenderLayoutBuilderPreserveBaseline extends RenderBox
    with
        RenderObjectWithChildMixin<RenderBox>,
        RenderConstrainedLayoutBuilder<BoxConstraints, RenderBox> {
  @override
  double computeDistanceToActualBaseline(TextBaseline baseline) =>
      child.getDistanceToActualBaseline(baseline);

  @override
  double computeMinIntrinsicWidth(double height) {
    assert(_debugThrowIfNotCheckingIntrinsics());
    return 0.0;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    assert(_debugThrowIfNotCheckingIntrinsics());
    return 0.0;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    assert(_debugThrowIfNotCheckingIntrinsics());
    return 0.0;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    assert(_debugThrowIfNotCheckingIntrinsics());
    return 0.0;
  }

  @override
  void performLayout() {
    final constraints = this.constraints;
    layoutAndBuildChild();
    if (child != null) {
      child.layout(constraints, parentUsesSize: true);
      size = constraints.constrain(child.size);
    } else {
      size = constraints.biggest;
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {Offset position}) {
    return child?.hitTest(result, position: position) ?? false;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) context.paintChild(child, offset);
  }

  bool _debugThrowIfNotCheckingIntrinsics() {
    assert(() {
      if (!RenderObject.debugCheckingIntrinsics) {
        throw FlutterError(
            'LayoutBuilder does not support returning intrinsic dimensions.\n'
            'Calculating the intrinsic dimensions would require '
            'running the layout '
            'callback speculatively, which might mutate the live '
            'render object tree.');
      }
      return true;
    }());

    return true;
  }
}
