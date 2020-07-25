class Tanggapan {
  String email, kota, komentar, username, dateCreated;
  Tanggapan({
    this.email,
    this.kota,
    this.komentar,
    this.username,
    this.dateCreated,
  });

  Tanggapan.fromJSON(Map<String, dynamic> parsedJSON)
      : email = parsedJSON["email"],
        kota = parsedJSON["kota"],
        komentar = parsedJSON["isi_komentar"],
        username = parsedJSON["username"],
        dateCreated = parsedJSON["date_created"];
}
