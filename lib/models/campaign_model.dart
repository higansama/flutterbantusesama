class AllCampaign {
  String kecamatan;
  String kelurahan;
  String image;

  AllCampaign(this.kecamatan, this.image, this.kelurahan);
}

List<AllCampaign> allcampaigndatas = allcampaigndata
    .map((item) =>
        AllCampaign(item['kecamatan'], item['image'], item['kelurahan']))
    .toList();
var allcampaigndata = [
  {
    "kecamatan": "Kiaracondong",
    "kelurahan": "Babakan Surabaya",
    "image":
        "https://images.unsplash.com/photo-1523881374236-dd34f6ac1226?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1488&q=80",
  },
  {
    "kecamatan": "Kiaracondong",
    "kelurahan": "Babakan Sari",
    "image":
        "https://images.unsplash.com/photo-1534068590799-09895a701e3e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1300&q=80",
  },
  {
    "kecamatan": "Kiaracondong",
    "kelurahan": "Babakan Cicaheum",
    "image":
        "https://images.unsplash.com/photo-1488521787991-ed7bbaae773c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
  },
  {
    "kecamatan": "Kiaracondong",
    "kelurahan": "Babakan Compreng",
    "image":
        "https://images.unsplash.com/photo-1518949142393-f1d68174c92a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
  },
  {
    "kecamatan": "Sumur Bandung",
    "kelurahan": "Babakan Compreng",
    "image":
    "https://images.unsplash.com/photo-1477905109790-f957c747d7c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
  },
  {
    "kecamatan": "Sumur Bandung",
    "kelurahan": "Babakan Ciamis",
    "image":
        "https://images.unsplash.com/photo-1477905109790-f957c747d7c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
  },
  {
    "kecamatan": "Sumur Bandung",
    "kelurahan": "Braga",
    "image":
        "https://images.unsplash.com/photo-1477905109790-f957c747d7c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
  },
  {
    "kecamatan": "Sumur Bandung",
    "kelurahan": "Kebon Pisang",
    "image":
        "https://images.unsplash.com/photo-1477905109790-f957c747d7c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
  },
  {
    "kecamatan": "Sumur Bandung",
    "kelurahan": "Babakan Compreng",
    "image":
        "https://images.unsplash.com/photo-1477905109790-f957c747d7c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
  },
  {
    "kecamatan": "Sumur Bandung",
    "kelurahan": "Babakan Compreng",
    "image":
        "https://images.unsplash.com/photo-1477905109790-f957c747d7c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
  },
  {
    "kecamatan": "Lengkong",
    "kelurahan": "Burangrang",
    "image":
        "https://images.unsplash.com/photo-1477905109790-f957c747d7c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
  },
  {
    "kecamatan": "Lengkong",
    "kelurahan": "Cijagra",
    "image":
        "https://images.unsplash.com/photo-1477905109790-f957c747d7c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
  },
  {
    "kecamatan": "Lengkong",
    "kelurahan": "Lingkar Selatan",
    "image":
        "https://images.unsplash.com/photo-1477905109790-f957c747d7c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
  },
  {
    "kecamatan": "Lengkong",
    "kelurahan": "Malabar",
    "image":
        "https://images.unsplash.com/photo-1477905109790-f957c747d7c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
  },
];
