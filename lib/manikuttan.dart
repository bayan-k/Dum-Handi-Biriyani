import 'package:dum/product.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imgList = [
    'lib/assets/images/1.jpg',
    'lib/assets/images/2.jpg',
    'lib/assets/images/3.jpg',
    'lib/assets/images/4.jpg',
    'lib/assets/images/5.jpg'
  ];

  final List<String> list2 = [
    'lib/assets/images/6.jpeg',
    'lib/assets/images/7.jpeg',
  ];

  final List<String> subtitle = ['DHB2020 | ABOVE 500', 'FLAT300 | ABOVE 1499'];

  final List<String> title = [
    'Flat Rs 200 Discount on FIrst Order Discount',
    'Flat Rs 300 Discount'
  ];

  
  final List<Services> services = [
    Services(
        upname: 'Oder Delivery',
        downname: 'A Trendy Food Delivery',
        imageUrl: 'https://i.ibb.co/TcM9C9Y/delivery.png'),
    Services(
        upname: 'Dine - In',
        downname: 'Eat at Restaurant',
        imageUrl: 'https://i.ibb.co/Brx8RFT/dinner.png'),
    Services(
        upname: 'Book Event & Group Dining',
        downname: 'Indoor - Outdoor catering',
        imageUrl: 'https://i.ibb.co/n6ZFdQs/time.png'),
    Services(
        upname: 'Book Table',
        downname: 'Save up to 30 %',
        imageUrl: 'https://i.ibb.co/1XyMmmt/reserved.png'),
    Services(
        upname: 'Pick - Up',
        downname: 'Save up to 50 %',
        imageUrl: 'https://i.ibb.co/grgzd5f/order-tracking.png'),
    Services(
        upname: 'Deals/Promotions',
        downname: 'Save Up to 50 %',
        imageUrl: 'https://i.ibb.co/GRqwFGw/tag.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.location_city_outlined)),
          backgroundColor: Colors.red,
          toolbarHeight: 100,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(height: 20),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.9,
              ),
              items: imgList
                  .map((item) => Container(
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(item),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 20),
            CarouselSlider(
              options: CarouselOptions(
                height: 80.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.95,
              ),
              items: List.generate(
                list2.length,
                (index) => Stack(children: [
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(list2[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title[index],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              subtitle[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            )
                          ],
                        )
                        // child: Text(
                        //   text[index],
                        //   style:
                        //       const TextStyle(color: Colors.white, fontSize: 16),
                        // ),
                        ),
                  )
                ]),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              alignment: Alignment.centerLeft,
              child: const Text(
                "What's on your mind",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 400,
              child: GridView.builder(
                  //  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  reverse: false,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: p.length,
                  itemBuilder: (context, index) {
                    final item = products[index];

                    return Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              item.imageUrl,
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item.upname,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            item.downname,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Flexible(child: 
            SizedBox(
              height: 800,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 8,
                      childAspectRatio: 8),
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    final item = services[index];
                    return Container(
                      padding: const EdgeInsets.all(4.0),
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Column(
                        children: [
                          Image.network(item.imageUrl),
                          const SizedBox(height: 8),
                          Text(
                            item.upname,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item.upname,
                            style: const TextStyle(fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }
                  ),
            )
            )
          ],
        )),
        bottomNavigationBar: SafeArea(
            child: ConvexAppBar(
          color: Colors.black,
          activeColor: const Color.fromARGB(255, 151, 21, 12),
          shadowColor: Colors.black,
          backgroundColor: (Colors.white),
          height: 66,
          items: const [
            TabItem(
              icon: Icons.home,
              title: 'Home',
            ),
            TabItem(icon: Icons.local_activity, title: 'Activities '),
            TabItem(icon: Icons.add, title: 'Menu'),
            TabItem(icon: Icons.shopping_cart, title: 'Cart'),
            TabItem(
              icon: Icons.people,
              title: 'My Account',
            ),
          ],
          // onTap: (int i) {
          //   print('click index=$i');
          //   if (i == 1) {
          //     Navigator.of(context).pushNamed(loginRoute);
          //     Navigator.pop(context);
          //   }
          // }
        )));
  }
}
