class WeekDays {
  List<int> days = [];
  List<String> convertedDays = [];

  _getDays() {
    int today = DateTime.now().weekday;
    for (int i = 0; i <= 7; i++) {
      if (today == 0) {
        today = 7;
        days.add(today);
        today--;
      } else {
        days.add(today);
        today--;
      }
    }
  }

  convertDay() {
    _getDays();
    for (int i in days) {
      String newDay = _weekDayConversion(i);
      convertedDays.add(newDay);
    }
    return convertedDays;
  }

  _weekDayConversion(int d) {
    switch (d) {
      case 1:
        return 'Seg';
      case 2:
        return 'Ter';
      case 3:
        return 'Qua';
      case 4:
        return 'Qui';
      case 5:
        return 'Sex';
      case 6:
        return 'Sáb';
      case 7:
        return 'Dom';
    }
  }
}
