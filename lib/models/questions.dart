class Questions{
  const Questions(this.questions,this.answer);

  final String questions;
  final List<String>answer;

  List<String>shuffledList(){
    final shuffledList = List.of(answer);
    shuffledList.shuffle();
    return shuffledList;
  }
}