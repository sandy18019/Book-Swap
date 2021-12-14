class NewModel {
  var image;

  NewModel(this.image);
}

List<NewModel> newbooks =
    newBookData.map((item) => NewModel(item['image'])).toList();

var newBookData = [
  {"image": "assets/images/zenda.png"},
  {"image": "assets/images/habits.png"},
  {"image": "assets/images/bloodHoney.png"},
  {"image": "assets/images/beast.png"},
  {"image": "assets/images/hamlet.png"},
];
