import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';

typedef MyValueBuilderUpdateCallback<T> = void Function(T snapshot);
typedef MyValueBuilderBuilder<T> = Widget Function(
    T snapshot, MyValueBuilderUpdateCallback<T> updater);

/// Manages a local state like ObxValue, but uses a callback instead of
/// a Rx value.
///
/// Example:
/// ```
///  MyValueBuilder<bool>(
///    initialValue: false,
///    builder: (value, update) => Switch(
///    value: value,
///    onChanged: (flag) {
///       update( flag );
///    },),
///    onUpdate: (value) => print("Value updated: $value"),
///  ),
///  ```
class MyValueBuilder<T> extends StatefulWidget {
  final T initialValue;
  final MyValueBuilderBuilder<T> builder;
  final void Function()? onDispose;
  final void Function(T)? onUpdate;

  const MyValueBuilder({
    Key? key,
    required this.initialValue,
    this.onDispose,
    this.onUpdate,
    required this.builder,
  }) : super(key: key);

  @override
  _MyValueBuilderState<T> createState() => _MyValueBuilderState<T>();
}

class _MyValueBuilderState<T> extends State<MyValueBuilder<T>> {
  late T value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) => widget.builder(value, updater);

  void updater(T newValue) {
    if (widget.onUpdate != null) {
      widget.onUpdate?.call(newValue);
    }
    setState(() {
      value = newValue;
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.onDispose?.call();
    if (value is ChangeNotifier) {
      (value as ChangeNotifier?)?.dispose();
    } else if (value is StreamController) {
      (value as StreamController?)?.close();
    }
  }
}

// It's a experimental feature
class SimpleBuilder extends StatefulWidget {
  final Widget Function(BuildContext) builder;

  const SimpleBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  _SimpleBuilderState createState() => _SimpleBuilderState();
}

class _SimpleBuilderState extends State<SimpleBuilder>
    with GetStateUpdaterMixin {
  final disposers = <Disposer>[];

  @override
  void dispose() {
    super.dispose();
    for (final disposer in disposers) {
      disposer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TaskManager.instance.exchange(
      disposers,
      getUpdate,
      widget.builder,
      context,
    );
  }
}
