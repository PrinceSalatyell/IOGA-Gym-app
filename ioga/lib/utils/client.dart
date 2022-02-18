class Client {
  String name;
  String email;
  String address;
  String photo;
  String phoneNumber;
  String gender;
  int yearOfRegistry;

  Client(
      {required this.name,
        required this.email,
        this.address = '',
        this.photo = '',
        required this.phoneNumber,
        required this.gender,
        required this.yearOfRegistry});
}