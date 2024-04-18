part of 'meal_cubit.dart';

class MealState extends Equatable {
  const MealState(this.allMeal, this.status, this.check);
  final List<Meal> allMeal;
  final FormzSubmissionStatus status;
  final int check;

  @override
  List<Object> get props => [allMeal, status, check];
}
