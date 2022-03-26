import 'package:flutter_test/flutter_test.dart';

Matcher listWhoseElementAt(int index, Object? matcher) =>
    _ListWhoseElementAt(index, wrapMatcher(matcher));

class _ListWhoseElementAt extends Matcher {
  final int _index;
  final Matcher _matcher;

  const _ListWhoseElementAt(this._index, this._matcher);

  @override
  Description describe(Description description) {
    return StringDescription('matches Matcher at index $_index');
  }

  @override
  bool matches(Object? item, Map matchState) {
    if (item is List) {
      try {
        return _matcher.matches(item[_index], matchState);
      } on RangeError {
        return false;
      }
    }
    return false;
  }
}
