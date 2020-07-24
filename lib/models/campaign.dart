class Campaign {
  String namaCampaign, kota, kecamatan, kelurahan, foto, id, description;
  Campaign(
      {this.namaCampaign,
      this.kota,
      this.kecamatan,
      this.kelurahan,
      this.id,
      this.foto,
      this.description});

  Campaign.fromJSON(Map<String, dynamic> parsedJSON)
      : namaCampaign = parsedJSON["nama_campaign"],
        kota = parsedJSON["kota"],
        kecamatan = parsedJSON["kecamatan"],
        kelurahan = parsedJSON["kelurahan"],
        foto = parsedJSON["foto"],
        description = parsedJSON["latar_cerita"],
        id = parsedJSON["id"];
}
