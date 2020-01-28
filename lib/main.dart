
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
void main() => runApp(MyApp());

class Product{
  final String name;
  final String description;
  final int price;
  final String topic;
  Product(this.name,this.description,this.price,this.topic);

  static List<Product>getProducts(){
    List <Product>items=<Product>[];
    items.add(
      Product(
        "Pixel",
        "Pixel is the most feature",
        800,
        "Pixel page"
      )
    );
    items.add(
      Product(
        "Acer",
        "Acer is the most feature",
        800,
        "Acer page"
      )
    );
    items.add(
      Product(
        "Dell",
        "Dell is the most feature",
        800,
        "Dell page"
      )
    );
    items.add(
      Product(
        "Hp",
        "Hp is the most feature",
        800,
        "Hp page"
      )
    );
    items.add(
      Product(
        "Lenovo",
        "Lenovo is the most feature",
        800,
        "Lenovo page"
      )
    );
    items.add(
      Product(
        "Cloud",
        "Cloud is the most feature",
        800,
        "Cloud page"
      )
    );
    return items;
  }
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            title:'Flutter Demo',
            theme: ThemeData(primarySwatch:Colors.blue,),
            home:MyHomePage(title: 'Product List',)
     );          
  }
}

class MyHomePage extends StatelessWidget{
  MyHomePage({Key key,this.title}):super(key:key);
  final String title;
  final items=Product.getProducts();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index){
          return GestureDetector(
            child: ProductBox(item:items[index]),
            onTap: (){
              Navigator.push(
                context,
                 MaterialPageRoute(
                  builder:(context)=>ProductPage(item:items[index]),
                   
                    ),
                 );
            },
          );
        },
      )
    );
  }
}

class ProductPage extends StatelessWidget{
  ProductPage({Key key,this.item}) : super(key:key);
  final Product item;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text(this.item.name),
    ),
    body: Center(
      child: Container(
        padding: EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(this.item.topic),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(this.item.name,style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(this.item.description),
                    Text("Price:"+this.item.price.toString()),
                    RatingBox(),
                  ],
                )
              )
            )
          ]
        ),
      ),
    ),
    );
  }
}

class RatingBox extends StatefulWidget{
  @override
  _RatingBoxState createState()=>_RatingBoxState();

}

class _RatingBoxState extends State<RatingBox>{
  int _rating=0;
  void _setRatingAsOne(){
    setState((){
      _rating=1;
    });
  }
  void _setRatingAsTwo(){
    setState((){
      _rating=1;
    });
  }
  void _setRatingAsThree(){
    setState((){
      _rating=1;
    });
  }
  
  Widget build(BuildContext context) {
    double _size=20;
    print(_rating);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
     mainAxisSize: MainAxisSize.max,
     children: <Widget>[
      Container(
         padding: EdgeInsets.all(0),
         child: IconButton(
           icon: (
             _rating>=1?Icon(
                Icons.star,
               size: _size,
             )
             :Icon(
               Icons.star_border,
               size:_size,
             )
           ),
           color: Colors.green[500],
           onPressed: _setRatingAsOne,
           iconSize: _size,
         ),
       ),
      Container(
         padding: EdgeInsets.all(0),
         child: IconButton(
           icon: (
             _rating>=2?
             Icon(
                Icons.star,
               size: _size,
             )
             :Icon(
               Icons.star_border,
               size:_size,
             )
           ),
           color: Colors.green[500],
           onPressed: _setRatingAsTwo,
           iconSize: _size,
         ),
       ),
      Container(
         padding: EdgeInsets.all(0),
         child: IconButton(
           icon: (
             _rating>=3?
             Icon(
                Icons.star,
               size: _size,
             )
             :Icon(
               Icons.star_border,
               size:_size,
             )
           ),
           color: Colors.green[500],
           onPressed: _setRatingAsThree,
           iconSize: _size,
         ),
       ),
     ],
    );
  }
}

class ProductBox extends StatelessWidget{
  ProductBox({Key key,this.item}):super(key:key);
  final Product item;

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      height: 140,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(this.item.topic,style: TextStyle(fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            )
            ),
            Expanded(
              child:Container(
                padding: EdgeInsets.all(5),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:<Widget>[
                    Text(
                      this.item.name,
                      style:TextStyle(fontWeight: FontWeight.bold)
                    ),
                    Text(
                      this.item.description
                    ),
                    Text(
                      "price:"+this.item.price.toString()),
                      RatingBox(),
                  ],
                )
              ) 
            )
          ]
        ),
      )
    );
  }
}

