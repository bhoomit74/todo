enum Greet {
  morning("Good Morning"),
  afternoon("Good Afternoon"),
  evening("Good Evening"),
  night("Good Night");

  final String greetMessage;
  const Greet(this.greetMessage);

  static Greet currentGreet(int hour) {
    if (hour >= 5 && hour < 12) {
      return Greet.morning;
    } else if (hour >= 12 && hour < 17) {
      return Greet.afternoon;
    } else if (hour >= 17 && hour < 24) {
      return Greet.evening;
    } else {
      return Greet.morning;
    }
  }

  static String get message => currentGreet(DateTime.now().hour).greetMessage;
}
