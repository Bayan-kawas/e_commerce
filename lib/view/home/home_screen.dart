import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import '../../constant.dart';
import '../../core/viewModel/home_view_model.dart';
import '../widgets/custom_catigory_item.dart';
import '../widgets/custom_text.dart';

List products = [
  's',
  's',
  's',
  's',
  's',
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bottomNavigationBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 49,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(50)),
                  child: _searchTextFormField(),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoryItem(
                        imgPath: 'assets/images/men_shoes_icon.png',
                        lable: 'men',
                      ),
                      CategoryItem(
                        imgPath: 'assets/images/women_shoes_icon.png',
                        lable: 'Women',
                      ),
                      CategoryItem(
                        imgPath: 'assets/images/devices_icon.png',
                        lable: 'Devices',
                      ),
                      CategoryItem(
                        imgPath: 'assets/images/gadgets_icon.png',
                        lable: 'Gadgets',
                      ),
                      CategoryItem(
                        imgPath: 'assets/images/gaming_icon.png',
                        lable: 'Gaming',
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomText(
                        text: "Best Selling",
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    CustomText(
                      text: "See all",
                      fontSize: 16,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                _productsList(),
              ],
            ),
          ),
        ));
  }
}

Widget bottomNavigationBar() {
  return Consumer<HomeViewModel>(
    builder: (context, viewModel, child) {
      return BottomNavigationBar(
        currentIndex: viewModel.selectedItem,
        items: [
          BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'Explore',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Image.asset(
                  'assets/images/Icon_Explore.png',
                  width: 20,
                  fit: BoxFit.contain,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text('Cart',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Image.asset(
                'assets/images/Icon_Cart.png',
                width: 20,
                fit: BoxFit.contain,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text('Account',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Image.asset(
                'assets/images/Icon_User.png',
                width: 20,
                fit: BoxFit.contain,
              ),
            ),
            label: '',
          ),
        ],
        onTap: (index) {
          viewModel.changeSelectedItem(index);

        },
        backgroundColor: Colors.grey.shade100,
        elevation:0,
      );
    },
  );
}

Widget _productsList() {
  return SizedBox(
    height: 289,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Image.asset(
              'assets/images/Image.png',
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomText(
            text: 'BeoPlay Speaker',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomText(
            text: 'Bang and Olufsen',
            fontSize: 12,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomText(
            text: '\$755',
            fontSize: 16,
            color: primaryColor,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(
            height:5,
          ),
        ]);
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        width: 20,
      ),
    ),
  );
}

Widget _searchTextFormField() {
  return TextFormField(
    autofocus: false,
    decoration: InputDecoration(
      border: InputBorder.none,
      prefixIcon: Icon(
        Icons.search,
        color: Colors.black,
      ),
      // border: OutlineInputBorder(
      //   borderSide:
      //       BorderSide(width: 1.5, color: Color(0xff707070)),
      //   borderRadius: BorderRadius.circular(50),
      // ),
      // focusedBorder: OutlineInputBorder(
      //   borderSide: BorderSide(
      //     width: 1.5,
      //     color: Color(0xff707070),
      //   ),
      //   borderRadius: BorderRadius.circular(50),
      // ),
      // enabledBorder: OutlineInputBorder(
      //   borderSide: BorderSide(
      //     width: 1.5,
      //     color: Color(0xff707070),
      //   ),
      //   borderRadius: BorderRadius.circular(50),
      // ),
    ),
    cursorColor: Color(0xff707070),
  );
}
