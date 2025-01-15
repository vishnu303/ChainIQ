import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(selectedIndex: 0));

  void navigateTo(int index) {
    emit(NavigationState(selectedIndex: index));
  }
}
