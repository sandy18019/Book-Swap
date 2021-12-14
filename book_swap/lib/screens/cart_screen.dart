import 'package:flutter/material.dart';


class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  get img => null;
  get name => null;
  get price => null;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:Column(
       children:[
      Expanded(
     child: Container(
       child:ListView.separated(
         itemBuilder:(context, index) {
         return Container(
           height:150,
         child:Row(
           children: [
             Container(
                padding: EdgeInsets.all(10),
               width: 100,
               height: 120,
             child: Image.asset(
               img[index],
               fit: BoxFit.fill,)
             ),
           Padding(
             padding:const EdgeInsets.only(left: 40),
             child:
                Column(
                  children: [
                     Text(name[index],
                style:TextStyle(fontSize: 18),textAlign: TextAlign.center,
                     ),
                    SizedBox(height: 60,),

                     Text(price[index].toString(),
                style: TextStyle(color:Colors.green,fontSize: 18 ),),
                    SizedBox(height: 20,),
           Container(
             width:120,
             height: 25,
             color:Colors.grey.shade200,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(
                Icons.add,
                color: Colors.black,),
                SizedBox(width: 20,),
              Text('1',textAlign:TextAlign.center,
              style:TextStyle(fontSize: 18, color:Colors.black),
              ),
               SizedBox(width: 20,),
              Container(
                padding: EdgeInsets.only(bottom: 100,),
                   child: Icon(
                Icons.minimize,
                color: Colors.black,),
              ),
            ],),
                    ),
                  ],
                ),
           ),
           ],
         )
         );
         },
         itemCount:name.length, separatorBuilder: (BuildContext context, int index) { 
           return SizedBox(height:10 ,);
          } ,),   
),
     ),
      Padding(
        padding: const EdgeInsets.only(left: 30,right: 30),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
       Column(
         children: [
Text('TOTAL',
          style:
           TextStyle(fontSize: 22,color:Colors.grey)
          ),
              SizedBox(height: 20,),
          Text('2000',
          style: TextStyle(),
          ),
         ],),
       Container(
        padding: EdgeInsets.all(20),
         height:100,
          width: 180,
  child:TextButton(
  style: ButtonStyle(
    foregroundColor:
     MaterialStateProperty.all<Color>(Colors.blue),
  ),
  onPressed: () { },
  child: Text('CHECKOUT'),
      ),
      ),],
       ),
       ), ],
      ),
    );
  }
}