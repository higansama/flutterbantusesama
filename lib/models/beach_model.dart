class BeachModel {
  String image;

  BeachModel(this.image);
}

List<BeachModel> beaches =
    beachesData.map((item) => BeachModel(item['image'])).toList();

var beachesData = [
  {
    "image": "https://images.unsplash.com/photo-1488521787991-ed7bbaae773c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
  },
  {
    "image":
    "https://images.unsplash.com/photo-1582307811683-75b18a39ab71?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
  },
  {
    "image":
    "https://images.unsplash.com/photo-1517596301415-0e77e9e18eaf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
  },
  {
    "image":
    "https://images.unsplash.com/photo-1507144159582-ee8a88b0ce07?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1216&q=80"
  },
  {
    "image":
    "https://images.unsplash.com/photo-1477905109790-f957c747d7c2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
  },
  {
    "image":
    "https://images.unsplash.com/photo-1547496614-99b29879c916?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
  },
//  {
//    "image":
//    "https://images.unsplash.com/photo-1591152348786-b37131d37840?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
//  },
//  {
//    "image":
//    "https://images.unsplash.com/photo-1540690448301-9f7ead5263ec?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1268&q=80"
//  },
];

