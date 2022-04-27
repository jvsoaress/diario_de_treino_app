import 'package:flutter/material.dart';

class DefaultStreamBuilder<T> extends StatelessWidget {
  final Stream<T> stream;
  final Widget Function(T data) onData;
  final Widget Function()? onLoading;
  final Widget Function()? onError;

  const DefaultStreamBuilder({
    Key? key,
    required this.stream,
    required this.onData,
    this.onLoading,
    this.onError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return onLoading != null
              ? onLoading!()
              : const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return onError != null ? onError!() : Text(snapshot.error.toString());
        }
        return onData(snapshot.data!);
      },
    );
  }
}
