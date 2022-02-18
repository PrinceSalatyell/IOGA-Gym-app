class PersonalTrainer {

  String name;
  String specialty;
  String email;
  String phoneNumber;
  String photo;
  bool isAdded = false;
  int age;
  late String city;
  late int yearsActive;
  late String secondSpecialty;

  PersonalTrainer(
      {required this.name,
      required this.specialty,
      required this.photo,
      required this.age,
      required this.phoneNumber,
      required this.email});

}
