part of 'buttom_nav_cubit.dart';

class ButtomNavState extends Equatable {
  final int selectedIndexBody;
  const ButtomNavState({
    required this.selectedIndexBody,
  });

  @override
  List<Object> get props => [selectedIndexBody];
}
