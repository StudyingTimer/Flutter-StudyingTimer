class Timer {
  final String subject;
  int hour = 0;
  int minute = 0;
  int second = 0;
  bool ispressed = false;
  Timer(this.subject);
}

// timer 페이지 구현
// 1. 위젯은 listtile로
// 2. model class subject_timer를 만들어 string subject, bool ispressed, 
// int hour, int minute ,int second을 생성
// 3. +누르면 list가 펼쳐지고 과목추가를 누르면 dialog가 뜨면서 과목명을 입력해주세요, textfield
// 4. textfield에 입력된 subject를 initstate에서 list.add 하기
// 5. 그렇게 들어온 list를 화면에 보여주기
// 6. 버튼을 누르면 icon 변경, 다른버튼 누르려고 하면 경고 toast message 띄우기
// 7. listIcon -> delete를 누를시 list에서 제외하고 새로고침