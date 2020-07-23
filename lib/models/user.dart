class UserData {
  String nama;

  UserData(this.nama);
}

List<UserData> usersData =
    listData.map((item) => UserData(item["nama"])).toList();
var listData = [
  {"nama": "John Doe"},
  {"nama": "Jane Doe"},
  {"nama": "Rock Doe"},
  {"nama": "Malk Doe"},
  {"nama": "Kik Doe"},
  {"nama": "Lol Doe"},
  {"nama": "Dream Doe"},
  {"nama": "Sins Doe"},
  {"nama": "Thai Doe"},
  {"nama": "Rose Doe"},
  {"nama": "Lee Doe"},
  {"nama": "Irithel Doe"},
];
