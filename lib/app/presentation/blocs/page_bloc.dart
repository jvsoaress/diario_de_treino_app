import 'package:diario_de_treino_app/app/presentation/blocs/base_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class PageBloc extends BaseBloc {
  final _pageController = PageController();
  PageController get pageController => _pageController;

  final _currentPageIndexNotifier = ValueNotifier<int>(0);
  ValueNotifier<int> get currentPageIndex => _currentPageIndexNotifier;

  PageBloc() {
    _pageController.addListener(() {
      try {
        _currentPageIndexNotifier.value = _pageController.page!.toInt();
      } on AssertionError {}
    });
  }

  void animateToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPageIndexNotifier.dispose();
    super.dispose();
  }
}

class PageState extends Equatable {
  final int currentPageIndex;
  final int pagesCount;

  const PageState({
    required this.currentPageIndex,
    required this.pagesCount,
  });

  @override
  String toString() =>
      'PageState(currentPageIndex: $currentPageIndex, pagesCount: $pagesCount)';

  @override
  List<Object?> get props => [currentPageIndex, pagesCount];
}
