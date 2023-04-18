import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../api/models/category.dart';
import '../../api/models/products.dart';
import '../../api/response.dart';
import '../../widgets/search_field.dart';
import '../cart/view.dart';
import '../product_details/view.dart';


class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key, required this.c_id}) : super(key: key);
  final String c_id;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            color: Colors.black,
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 30,
            ),
            onPressed: () { Navigator.of(context).pop(); },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade, child: const Cart())); },
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SearchField(),
              const SizedBox(height: 25,),
              Expanded(
                child: FutureBuilder<ProductDetails>(
                  future: getdata(c_id),
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                     return GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.products.length,
                    padding: const EdgeInsets.all(10),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                     Products products = snapshot.data!.products[index];
                      return InkWell(
                        onTap: (){
                          Navigator.push(context,
                            PageTransition(type: PageTransitionType.bottomToTop, child: Details(products)));},
                        child: Container(
                          margin: const EdgeInsets.only(right: 15,left: 15),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Image.network('https://${snapshot.data!.products.elementAt(index).imageUrl}',),
                                ),
                              ),
                              Text(
                              snapshot.data!.products.elementAt(index).name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Icon(Icons.favorite, color: Colors.redAccent,),
                                ],),
                            ],),
                        ),
                      );
                    });}
                if (snapshot.hasError) {
                 if (kDebugMode) {
                   print(snapshot.error);
                 }
                 return Container();
                  }
                 return const Center(child: CircularProgressIndicator(),);
                }),
                ),
            ],),
        ),
      ),
    );
  }
}

