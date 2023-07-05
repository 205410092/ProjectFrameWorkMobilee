class ProductDataModel{
  int? id;
  String? name;   // merupakan deklarasi variabel
                // name dengan tipe data String?.
              // Tanda tanya (?) setelah tipe data
            // String menunjukkan bahwa variabel
          // tersebut dapat memiliki nilai null (nullable).
  String? category; // deklarasi variabel category dengan tipe
                  // data String?. Tanda tanya (?) setelah tipe
                // data String menunjukkan bahwa variabel tersebut
              // dapat memiliki nilai null (nullable).
  String? imageURL; // deklarasi variabel imageURL dengan tipe
                  // data String?. Tanda tanya (?) setelah tipe
                // data String menunjukkan bahwa variabel tersebut
              // dapat memiliki nilai null (nullable).
  String? oldPrice; //deklarasi variabel oldPrice dengan tipe
                  // data String?. Tanda tanya (?) setelah tipe
                // data String menunjukkan bahwa variabel tersebut
              // dapat memiliki nilai null (nullable).
  String? price; // deklarasi variabel price dengan tipe
                // data String?. Tanda tanya (?) setelah tipe
              // data String menunjukkan bahwa variabel tersebut
            // dapat memiliki nilai null (nullable).

  ProductDataModel(
      {
        this.id,
      this.name,
      this.category,
      this.imageURL,
      this.oldPrice,
      this.price
      });

  ProductDataModel.fromJson(Map<String,dynamic> json)
  {
    id = json['id']; // id = json['id'] merupakan penggunaan
                    // sintaksis untuk mengambil nilai yang
                  // terkandung dalam objek JSON dengan kunci
                // "id" dan mengassignnya ke variabel id.
    name =json['name']; // name = json['name'] adalah penggunaan
                      // sintaksis untuk mengambil nilai yang
                    // terkandung dalam objek JSON dengan kunci
                  // "name" dan mengassignnya ke variabel name.
    category = json['category']; // category = json['category'] merupakan penggunaan
                                // sintaksis untuk mengambil nilai yang terkandung
                              // dalam objek JSON dengan kunci "category" dan
                            // mengassignnya ke variabel category.
    imageURL = json['imageUrl']; // imageURL = json['imageUrl'] merupakan penggunaan
                                // sintaksis untuk mengambil nilai yang terkandung
                               // dalam objek JSON dengan kunci "imageURL" dan
                              // mengassignnya ke variabel imageURL.
    oldPrice = json['oldPrice']; // oldPrice = json['oldPrice'] merupakan penggunaan
                               // sintaksis untuk mengambil nilai yang terkandung
                             // dalam objek JSON dengan kunci "oldPrice" dan
                          // mengassignnya ke variabel oldPrice.
    price = json['price']; // price = json['price'] merupakan penggunaan
                          // sintaksis untuk mengambil nilai yang terkandung
                         // dalam objek JSON dengan kunci "price" dan
                        // mengassignnya ke variabel price.
  }
}