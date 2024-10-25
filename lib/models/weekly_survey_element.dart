class WeeklySurveyElement {
  List<int> sleep;
  List<int> phq;

  WeeklySurveyElement({
    required this.sleep,
    required this.phq,
  });

  List<int> get getSleep => sleep;
  List<int> get getPhq => phq;

  void setSleep(List<int> sl) {
    sleep = sl;
  }

  void setPhq(List<int> pq) {
    phq = pq;
  }
}
