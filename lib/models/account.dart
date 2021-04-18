class Account {
  final String name;
  final String username;
  final String password;
// <<<<<<< HEAD
  final String phone;
// =======
// >>>>>>> Moaaz-UI-V1
  final String location;
  final String type;
  final String email;
  final List<String> images;

  Account({
    this.name,
    this.username,
    this.password,
    this.phone,
    this.location,
    this.type,
    this.email,
    this.images,
  });
}
