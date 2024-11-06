import 'package:carousel_slider/carousel_slider.dart';
import 'package:dum/home_page.dart';
import 'package:dum/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

List<Menu> menu = [
  Menu(
      imgurl: 'https://i.ibb.co/x1y16Y3/egg-hyderabadi-biryani.jpg',
      foodname: 'Egg Hyderabadi BIriyani',
      foodtype:
          'https://i.ibb.co/47QK48C/a-red-lined-rectangle-containing-red-dot.jpg',
      cost: 200),
  Menu(
      imgurl: 'https://i.ibb.co/zNqM5h0/chicken-hyderabadi-biryani.jpg',
      foodname: 'Chicken Hyderabadi BIriyani',
      foodtype:
          'https://i.ibb.co/47QK48C/a-red-lined-rectangle-containing-red-dot.jpg',
      cost: 200),
  Menu(
      imgurl: 'https://i.ibb.co/zf3T0dY/vegetable-hyderabadi-biryani.jpg',
      foodname: 'Vegetable Hyderabadi BIriyani',
      foodtype:
          'https://i.ibb.co/yqThNz4/a-white-empty-space-image-must-be.jpg',
      cost: 300),
  Menu(
      imgurl: 'https://i.ibb.co/RDZmvyy/mutton-hyderabadi-biryani.jpg',
      foodname: 'Mutton Hyderabadi BIriyani',
      foodtype:
          'https://i.ibb.co/47QK48C/a-red-lined-rectangle-containing-red-dot.jpg',
      cost: 400),
  Menu(
      imgurl: 'https://i.ibb.co/qg9w35T/paneer-hyderabadi-biryani.jpg',
      foodname: 'Paneer Hyderabadi BIriyani',
      foodtype:
          'https://i.ibb.co/yqThNz4/a-white-empty-space-image-must-be.jpg',
      cost: 500),
  Menu(
      imgurl: 'https://i.ibb.co/xg8y5FB/beef-hyderabadi-biryani.jpg',
      foodname: 'beef Hyderabadi BIriyani',
      foodtype:
          'https://i.ibb.co/47QK48C/a-red-lined-rectangle-containing-red-dot.jpg',
      cost: 600),
];

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: const Color(0xffC2272D),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: const Color.fromRGBO(249, 245, 245, 1),
      body: CustomScrollView(
        slivers: [
          // Sticky header section
          const SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xffC2272D),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 20, bottom: 15),
              title: Text(
                'Hyderabadi Biriyani',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 238, 236, 236),
                ),
              ),
            ),
          ),

          // Main content section
          SliverList(
            delegate: SliverChildListDelegate([
              // Delivery row with switches
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  children: [
                    Image.network(
                      'https://i.ibb.co/TcM9C9Y/delivery.png',
                      height: 30,
                    ),
                    const SizedBox(width: 15),
                    const Text(
                      'Delivery',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 55),
                    // First FlutterSwitch container
                    _buildSwitchContainer(
                      'https://i.ibb.co/fp3QzjP/circle-1.png',
                      Colors.green,
                      const Color.fromARGB(139, 219, 213, 213),
                      isTapped,
                    ),
                    const SizedBox(width: 10),
                    // Second FlutterSwitch container
                    _buildSwitchContainer(
                      'https://i.ibb.co/hs2W7Jb/circle.png',
                      Colors.red,
                      const Color.fromARGB(255, 219, 213, 213),
                      !isTapped,
                    ),
                  ],
                ),
              ),
              // Additional list items as cards
              Card(
                child: ListTile(
                  leading: Image.network(
                    'https://i.ibb.co/V295YG7/restaurant-1.png',
                    height: 30,
                  ),
                  title: const Text('Choose Outlet'),
                  trailing: const Icon(Icons.arrow_forward),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              buildDiscountCarousel(),

              buildContainer1(),
              
              menuBuilder()
            ]),
          ),
        ],
      ),
    );
  }

  // Helper method for switch containers
  Widget _buildSwitchContainer(
      String imageUrl, Color activeColor, Color inactiveColor, bool value) {
    return Container(
      height: 38,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(255, 193, 202, 193),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              height: 25,
              width: 20,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, size: 30);
              },
            ),
            const SizedBox(width: 10),
            FlutterSwitch(
              value: value,
              onToggle: (newValue) {
                setState(() {
                  isTapped = newValue;
                });
              },
              activeColor: activeColor,
              inactiveColor: inactiveColor,
              width: 40.0,
              height: 25.0,
              toggleSize: 20.0,
              borderRadius: 25.0,
              padding: 4.0,
            ),
          ],
        ),
      ),
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

  Widget buildContainer1() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xffC2272D),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        width: 200,
        height: 50,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hyderabadi Biriyani',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text('6 Items',
                  style: TextStyle(fontSize: 12, color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }

  Widget menuBuilder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            childAspectRatio: 0.7,
            mainAxisSpacing: 1,
          ),
          itemCount: menu.length,
          itemBuilder: (context, index) {
            final number = menu[index];

            return SizedBox(
              height: 500,
              child: Container(
                height: 350,
                width: 120,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: Colors.white),
                child: Column(
                  children: [
                    Image.network(number.imgurl),
                    Row(
                      children: [
                        Image.network(
                          number.foodtype,
                          width: 10,
                          height: 10,
                        ),
                        Text(number.foodname,style: const TextStyle(fontSize: 12),)
                      ],
                    ),
                    Row(
                      children: [
                        Text('\$${number.cost}'),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              minimumSize: const Size(20, 20),
                            ),
                            child: const Text('Add'))
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
