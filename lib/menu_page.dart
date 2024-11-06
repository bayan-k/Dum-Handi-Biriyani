import 'package:carousel_slider/carousel_slider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dum/constants/routes.dart';
import 'package:dum/home_page.dart';
import 'package:dum/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:badges/badges.dart' as badges;

List<Menu> menu = [
  Menu(
    imgurl: 'https://i.ibb.co/x1y16Y3/egg-hyderabadi-biryani.jpg',
    foodname: 'Egg Hyderabadi Biryani',
    foodtype:
        'https://i.ibb.co/47QK48C/a-red-lined-rectangle-containing-red-dot.jpg',
    cost: 200,
  ),
  Menu(
    imgurl: 'https://i.ibb.co/zNqM5h0/chicken-hyderabadi-biryani.jpg',
    foodname: 'Chicken Hyderabadi Biryani',
    foodtype:
        'https://i.ibb.co/47QK48C/a-red-lined-rectangle-containing-red-dot.jpg',
    cost: 200,
  ),
  Menu(
    imgurl: 'https://i.ibb.co/zf3T0dY/vegetable-hyderabadi-biryani.jpg',
    foodname: 'Vegetable Hyderabadi Biryani',
    foodtype: 'https://i.ibb.co/yqThNz4/a-white-empty-space-image-must-be.jpg',
    cost: 300,
  ),
  Menu(
    imgurl: 'https://i.ibb.co/RDZmvyy/mutton-hyderabadi-biryani.jpg',
    foodname: 'Mutton Hyderabadi Biryani',
    foodtype:
        'https://i.ibb.co/47QK48C/a-red-lined-rectangle-containing-red-dot.jpg',
    cost: 400,
  ),
  Menu(
    imgurl: 'https://i.ibb.co/qg9w35T/paneer-hyderabadi-biryani.jpg',
    foodname: 'Paneer Hyderabadi Biryani',
    foodtype: 'https://i.ibb.co/yqThNz4/a-white-empty-space-image-must-be.jpg',
    cost: 500,
  ),
  Menu(
    imgurl: 'https://i.ibb.co/xg8y5FB/beef-hyderabadi-biryani.jpg',
    foodname: 'Beef Hyderabadi Biryani',
    foodtype:
        'https://i.ibb.co/47QK48C/a-red-lined-rectangle-containing-red-dot.jpg',
    cost: 600,
  ),
];

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool isDeliveryEnabled = false;

  void onTabTapped(int index) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffC2272D),
        title: const Text(
          ' Menu',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Container(
              height: 28,
              width: 80,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                children: [
                  Image.network(
                    'https://i.ibb.co/pf26JTX/discount.png',
                    height: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('Offers'),
                ],
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      backgroundColor: const Color.fromRGBO(249, 245, 245, 1),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xffC2272D),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 20, bottom: 15),
              title: Row(
                children: [
                  const Text(
                    'Hyderabadi Biryani',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 100),
                  Container(
                    height: 30,
                    width: 140,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.amber, width: 1)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 4.0),
                          child: Icon(
                            Icons.local_dining,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        Text(
                          'Browse Menu',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildDeliveryRow(),
              _outletInfoTile(),
              const SizedBox(height: 20),
              _buildDiscountCarousel(),
              _buildBiryaniInfo(context),
              _buildMenuGrid(),
            ]),
          ),
        ],
      ),
      bottomNavigationBar : buildBottomNavigationBar()
    );
    
  }

  Widget _buildDeliveryRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Image.network(
            'https://i.ibb.co/TcM9C9Y/delivery.png',
            height: 30,
          ),
          const SizedBox(width: 15),
          const Text(
            'Delivery',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          _buildSwitch('https://i.ibb.co/fp3QzjP/circle-1.png', Colors.green,
              isDeliveryEnabled),
          const SizedBox(width: 10),
          _buildSwitch('https://i.ibb.co/hs2W7Jb/circle.png', Colors.red,
              !isDeliveryEnabled),
        ],
      ),
    );
  }

  Widget _buildSwitch(String imageUrl, Color color, bool value) {
    return Container(
      height: 30,
      width: 100,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 184, 178, 178),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Image.network(
            imageUrl,
            height: 25,
            width: 25,
          ),
          const SizedBox(
            width: 10,
          ),
          FlutterSwitch(
            value: value,
            onToggle: (newValue) {
              setState(() {
                isDeliveryEnabled = newValue;
              });
            },
            activeColor: color,
            width: 45.0,
            height: 25.0,
            toggleSize: 25.0,
            borderRadius: 25.0,
            padding: 4.0,
          ),
        ],
      ),
    );
  }

  Widget _buildDiscountCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 65.0,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.87,
      ),
      items: List.generate(
        list2.length,
        (index) => Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage(list2[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 14,
              top: 8,
              child: Text(
                '${title[index]}\n${subtitle[index]}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _outletInfoTile() {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Image.network(
          'https://i.ibb.co/V295YG7/restaurant-1.png',
          height: 30,
        ),
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Text('Choose Outlet'),
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }

  Widget _buildBiryaniInfo(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xffC2272D),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hyderabadi Biryani',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text('6 Items',
                  style: TextStyle(fontSize: 13, color: Colors.white)),
            ],
          ),
        ));
  }

  Widget _buildMenuGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 1,
            childAspectRatio: 07,
            mainAxisExtent: 285),
        itemCount: menu.length,
        itemBuilder: (context, index) {
          return _buildMenuItem(menu[index]);
        },
      ),
    );
  }

  Widget _buildMenuItem(Menu item) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Image.network(
                item.imgurl,
                height: 165,
                width: 180,
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(item.foodtype, width: 16, height: 22),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    item.foodname,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('\u{20B9} ${item.cost}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xffC2272D))),
                const Spacer(),
                ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: 20, maxWidth: 75),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffC2272D),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.zero)),
                          padding: EdgeInsets.zero,
                          minimumSize: const Size.fromWidth(45)),
                      child: const Text('ADD',
                          style: TextStyle(fontSize: 12, color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
        onTabTapped(currentIndex);
      },
    );
  }
}
