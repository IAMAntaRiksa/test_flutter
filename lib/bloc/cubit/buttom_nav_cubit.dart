import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'buttom_nav_state.dart';

class ButtomNavCubit extends Cubit<ButtomNavState> {
  ButtomNavCubit() : super(const ButtomNavState(selectedIndexBody: 0));

  void navigateTo(int index) {
    emit(ButtomNavState(selectedIndexBody: index));
  }
}
