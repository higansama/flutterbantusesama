class RecommendedModel {
  String name;
  String image;

  RecommendedModel(this.name, this.image);
}

List<RecommendedModel> recommendations = recommendationsData
    .map((item) => RecommendedModel(item['name'], item['image']))
    .toList();

var recommendationsData = [
  {
    "name": "Kiaracondong, Bandung",
    "image":
    "https://images.unsplash.com/photo-1477905109790-f957c747d7c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"

  },
//  {
//    "name": "Sukamenak, Bandung",
//    "image":
//        "https://images.unsplash.com/photo-1539367628448-4bc5c9d171c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80"
//  },
  {
    "name": "Cicaheum, Bandung",
    "image":
    "https://images.unsplash.com/photo-1507144159582-ee8a88b0ce07?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1216&q=80"
  },
  {
    "name": "Babakan Siliwangi, Bandung",
    "image":
        "https://images.unsplash.com/photo-1528181304800-259b08848526?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
  },
  {
    "name": "Padasuka, Bandung",
    "image":
    "https://images.unsplash.com/photo-1547496614-99b29879c916?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
  },
];
