import 'option.dart';

class Question {
  final String text;
  final List<Option> options;
  final String solution;
  late final bool isLocked;
  Option? selectedOption;

  Question({
    required this.text,
    required this.options,
    required this.solution,
    this.isLocked = false,
    this.selectedOption,
  });
}
