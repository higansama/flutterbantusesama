class Campaign {
  String namaCampaign, kota, kecamatan, kelurahan, foto;
  Campaign(
      {this.namaCampaign,
      this.kota,
      this.kecamatan,
      this.kelurahan,
      this.foto,});

  Campaign.fromJSON(Map<String, dynamic> parsedJSON)
  : namaCampaign= parsedJSON["nama_campaign"],
      kota= parsedJSON["kota"],
      kecamatan= parsedJSON["kecamatan"],
      kelurahan= parsedJSON["kelurahan"],
      foto= parsedJSON["foto"];
}
