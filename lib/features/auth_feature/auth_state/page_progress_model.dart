
class FormStepModel {
  final int phase;
  final int subStep;
  final int pageIndex;
  final int progressValue;

  const FormStepModel({
    required this.phase,
    required this.subStep,
    required this.pageIndex,
    required this.progressValue,
  });
  String get stepAsString => '$phase.$subStep';
  // double get stepAsDouble => double.parse('${phase + subStep / 100}');


  factory FormStepModel.fromString(String step) {
    final parts = step.split('.');
    final phase = int.parse(parts[0]);
    final subStep = int.parse(parts[1]);

    return FormStepModel(
      phase: phase,
      subStep: subStep,
      pageIndex: subStep,
      progressValue: subStep,
    );
  }





}
