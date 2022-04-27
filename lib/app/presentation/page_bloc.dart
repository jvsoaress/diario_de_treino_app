import 'package:diario_de_treino_app/app/presentation/base_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class PageBloc extends BaseBloc {
  final _pageController = PageController();
  PageController get pageController => _pageController;

  final _currentPageIndexController = BehaviorSubject<int>.seeded(0);
  Stream<int> get onCurrentPageIndexChanged => _currentPageIndexController;

  PageBloc() {
    _pageController.addListener(() {
      _currentPageIndexController.add(_pageController.page!.toInt());
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
    _currentPageIndexController.close();
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
