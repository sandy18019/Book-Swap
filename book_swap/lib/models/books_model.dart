class BooksModel {
  var title, author, price, image, description;

  BooksModel(this.title, this.author, this.price, this.image, this.description);
}

List<BooksModel> books = BookData.map((item) => BooksModel(
    item['title'],
    item['author'],
    item['price'],
    item['image'],
    item['description'])).toList();

var BookData = [
  {
    "title": "sherlock holmes",
    "author": "Conan Doyle",
    "price": "100",
    "image": "assets/images/sherlock.png",
    "description": "short description about the book here......."
  },
  {
    "title": "Mask Of Zorro",
    "author": "Randall Jahnson",
    "price": "120",
    "image": "assets/images/zorro.png",
    "description": "short description about the book here......."
  },
  {
    "title": "The Prisoner Of Zenda",
    "author": "Anthony Hope",
    "price": "200",
    "image": "assets/images/zenda.png",
    "description": "short description about the book here......."
  },
  {
    "title": "Hamlet",
    "author": "William Shakespeare",
    "price": "150",
    "image": "assets/images/hamlet.png",
    "description": "short description about the book here......"
  },
  {
    "title": 'The 7 Habits Of Highly\nEffective People',
    "author": "Stephen R. Covey",
    "price": "250",
    "image": "assets/images/habits.png",
    "description": "short description about the book here......."
  },
  {
    "title": "Blood Honey",
    "author": "Shelby Mahurin",
    "price": "200",
    "image": "assets/images/bloodHoney.png",
    "description": "short description about the book here......."
  },
  {
    "title": "Julius Caeser",
    "author": "William Shakespeare",
    "price": "70",
    "image": "assets/images/caeser.png",
    "description": "short description about the book here......."
  },
  {
    "title": "The Secret",
    "author": "Rhonda Byrne",
    "price": "180",
    "image": "assets/images/secret.png",
    "description": "short description about the book here......."
  },
  {
    "title": "beauty & beast",
    "author": "Gabrielle-Susan de Villeneuve",
    "price": "120",
    "image": "assets/images/beast.png",
    "description": "short description about the book here......."
  },
];
