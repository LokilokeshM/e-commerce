// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:rxdart/rxdart.dart';

abstract class BlocBase {
  void dispose();
}

class BlocStreamController<T> {
  BehaviorSubject<T> _streamController = BehaviorSubject<T>();

  Stream<T> get stream => _streamController.stream;

  List<StreamSubscription<T>> subscriptions = [];

  T? value;

  void listenStream(
    void Function(T event) onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    final subscription = stream.listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
    subscriptions.add(subscription);
  }

  void add(T t) {
    value = t;
    if (!_streamController.isClosed) {
      Future(() {
        _streamController.add(t);
      });
    }
  }

  void close() {
    _clearSubscriptions();
    _streamController.close();
  }

  void _clearSubscriptions() {
    final int length = subscriptions.length;
    for (int i = 0; i < length; i++) {
      final StreamSubscription<T> sub = subscriptions[i];
      sub.cancel();
    }
  }
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  BlocProvider({
    Key? key,
    required this.child,
    required this.bloc,
  }) : super(key: key);

  final Widget child;
  final T bloc;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T? of<T extends BlocBase>(BuildContext context) {
    _BlocProviderInherited<T>? provider = context
        .getElementForInheritedWidgetOfExactType<_BlocProviderInherited<T>>()
        ?.widget as _BlocProviderInherited<T>?;

    return provider?.bloc;
  }
}

class _BlocProviderState<T extends BlocBase> extends State<BlocProvider<T>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _BlocProviderInherited<T>(
      bloc: widget.bloc,
      child: widget.child,
    );
  }
}

class _BlocProviderInherited<T> extends InheritedWidget {
  _BlocProviderInherited({
    Key? key,
    required Widget child,
    required this.bloc,
  }) : super(key: key, child: child);

  final T bloc;

  @override
  bool updateShouldNotify(_BlocProviderInherited oldWidget) => false;
}
