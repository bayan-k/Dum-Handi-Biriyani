import 'package:dum/constants/routes.dart';
import 'package:dum/product.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:country_picker/country_picker.dart';
import 'package:badges/badges.dart' as badges;




  int currentIndex = 0;

 
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
    'Flat Rs 200 Discount on First Order Discount',
    'Flat Rs 300 Discount'
  ];

  final List<Menutype> products = [
    // Products datafinal List<Menutype> products = [
    Menutype(
        upname: 'Hyderabadi',
        downname: 'Biriyani',
        imageUrl: 'lib/assets/images/hyderabadi_biryani.jpeg'),
    Menutype(
        upname: 'Lucknow',
        downname: 'Biriyani',
        imageUrl: 'lib/assets/images/biryani.jpeg'),
    Menutype(
        upname: 'DHB',
        downname: 'Signature',
        imageUrl: 'lib/assets/images/bowl_rice_with_meat.jpeg'),
    Menutype(
        upname: 'karma &',
        downname: 'curries',
        imageUrl: 'lib/assets/images/indian_curry_food_plate.jpeg'),
    Menutype(
        upname: 'Breads',
        downname: '',
        imageUrl: 'lib/assets/images/sandwich.jpeg'),
    Menutype(
        upname: 'Beverages',
        downname: '',
        imageUrl: 'lib/assets/images/beverage_drinks.jpeg'),
    Menutype(
        upname: 'Hot Meals &',
        downname: 'Promotions',
        imageUrl: 'lib/assets/images/shawarma_or_al_faham.jpeg'),
    Menutype(
        upname: 'Kolkata',
        downname: 'Biriyani & Rolls',
        imageUrl: 'lib/assets/images/hyderabadi_biryani.jpeg'),
    Menutype(
        upname: 'Kebabs',
        downname: '',
        imageUrl: 'lib/assets/images/chicken_kebab.jpeg'),
    Menutype(
        upname: 'extra & side',
        downname: 'Dish',
        imageUrl: 'lib/assets/images/tea_and_snacks.jpeg'),
    Menutype(
        upname: 'Desserts',
        downname: '',
        imageUrl: 'lib/assets/images/desserts.jpeg')
  ];

  final List<Services> services = [
    Services(
        upname: 'Oder Delivery',
        downname: 'A Trendy Food Delivery',
        imageUrl: 'https://i.ibb.co/TcM9C9Y/delivery.png'),
    Services(
        upname: 'Book Table',
        downname: 'Save up to 30 %',
        imageUrl: 'https://i.ibb.co/1XyMmmt/reserved.png'),
    Services(
        upname: 'Dine - In',
        downname: 'Eat at Restaurant',
        imageUrl: 'https://i.ibb.co/Brx8RFT/dinner.png'),
    Services(
        upname: 'Pick - Up',
        downname: 'Save up to 50 %',
        imageUrl: 'https://i.ibb.co/grgzd5f/order-tracking.png'),
    Services(
        upname: 'Book Event & Group Dining',
        downname: 'Indoor - Outdoor catering',
        imageUrl: 'https://i.ibb.co/n6ZFdQs/time.png'),
    Services(
        upname: 'Deals/Promotions',
        downname: 'Save Up to 50 %',
        imageUrl: 'https://i.ibb.co/GRqwFGw/tag.png'),
  ];






class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _currentFlagUrl = 'https://i.ibb.co/34HNxRs/world.png';
  void _openCountryPicker() {
    showCountryPicker(
        context: context,
        countryFilter: ['IN', 'TH'],
        showPhoneCode: true,
        onSelect: (Country country) {
          setState(() {
            if (country.countryCode == 'IN') {
              _currentFlagUrl = 'https://i.ibb.co/34HNxRs/world.png';
            } else {
              _currentFlagUrl = 'https://i.ibb.co/gZL34TG/flag.png';
            }
          });
        });
  }

 void onTabTapped(int index){
    switch (index) {
      case 0:
        Navigator.pushNamed(context, homeRoute);
        break;
      // case 1:
      //   Navigator.pushNamed(context, loginRoute);
      //   break;
      case 2:
        Navigator.pushNamed(context, menuRoute);
        break;
      // case 3:
      //   navi
      //   break;
      // case 4:
        
      //   break;  
      // case 5:
        
      //   break;        
      default:
      Navigator.pushNamed(context, homeRoute);
    }
  }
  final List icons = [
    'https://i.ibb.co/6BLWY1J/facebook.png',
    'https://i.ibb.co/q9YxWqM/instagram.png',
    'https://i.ibb.co/hB8DDXv/twitter-logo.png',
    'https://i.ibb.co/Zh49Nnj/youtube.png',
    'https://i.ibb.co/vdJQkz2/whatsapp.png',
    'https://i.ibb.co/tzCB5SK/line.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.location_city_outlined)),
          actions: [
            IconButton(
                onPressed: () {
                  _openCountryPicker();
                },
                icon: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(_currentFlagUrl, height: 38, width: 75),
                ))
          ],
          backgroundColor: const Color(0xffC2272D),
          toolbarHeight: 90,
        ),
        backgroundColor: const Color.fromARGB(255, 249, 245, 245),
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(height: 20),
            buildImageCarousel(),
            const SizedBox(height: 20),
            buildDiscountCarousel(),
            const SizedBox(height: 5),
            sectionTitle("What's on your mind"),

            buildProductGrid(),
            // SizedBox(height: 500, child: buildProductGrid()),

            buildServiceGrid(),

            sectionContainer(),
            
          ],
        )),
        bottomNavigationBar: buildBottomNavigationBar());
  }

  Widget buildImageCarousel() {
    return CarouselSlider(
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
    );
  }

  Widget buildDiscountCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 80.0,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.95,
      ),
      items: List.generate(
        list2.length,
        (index) => Stack(
          children: [
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
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
                      const SizedBox(height: 4),
                      Text(
                        subtitle[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }

  Widget buildProductGrid() {
    return SizedBox(
      height: 300,
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        // physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.1,
          crossAxisSpacing: 1,
          mainAxisSpacing: 0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage(item.imageUrl),
                ),
                const SizedBox(height: 8),
                Text(
                  item.upname,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                Text(
                  item.downname,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildServiceGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 15,
              childAspectRatio: 1.39),
          itemCount: services.length,
          itemBuilder: (context, index) {
            final item = services[index];
            return Container(
              height: 80,
              width: 100,
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Image.network(
                        item.imageUrl,
                        height: 40,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            item.upname,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            item.downname,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget sectionContainer() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 140,
        width: double.infinity,
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
            ),
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Stay One Step Ahead',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  'Follow us on Social Media to get the latest update',
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: icons.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Image.network(
                              icons[index],
                              width: 30,
                              height: 40,
                            )
                            );
                            
                      }

                      ),

                ),

              ],
            )),
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return ConvexAppBar(
      initialActiveIndex: currentIndex,
      color: Colors.black,
      activeColor: const Color(0xffC2272D),
      shadowColor: Colors.black,
      backgroundColor: Colors.white,
      height: 66,
      items: [
        const TabItem(icon: Icons.home, title: 'Home'),
        const TabItem(icon: Icons.local_activity, title: 'Activities'),
        TabItem(
            icon: Image.network(
              'https://i.ibb.co/JK3Pxht/menu.png',
              height: 24,
              width: 24,
            ),
            title: 'Menu'),
        // Add a badge to the Cart icon
        TabItem(
          icon: badges.Badge(
            position: badges.BadgePosition.topEnd(top: -10, end: -10),
            badgeContent: const Text(
              '3', // Replace '3' with your notification count
              style: TextStyle(color: Colors.white),
            ),
            child: const Icon(Icons.shopping_cart),
          ),
          title: 'Cart',
        ),
        const TabItem(icon: Icons.people, title: 'My Account'),
      ],
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
        onTabTapped( currentIndex);
      },
      
    );
  }
}
