import 'package:flutter/material.dart';
import 'package:classico/image_data.dart';

class CatagoryScreen extends StatefulWidget {
  const CatagoryScreen({super.key});

  @override
  State<CatagoryScreen> createState() => _CatagoryScreenState();
}

class _CatagoryScreenState extends State<CatagoryScreen> {
  @override
  int _crossAxisCount = 2;

  double _aspectRatio = 1.5;

  ViewType _viewType = ViewType.grid;

  List<ImageData> itemList = getImageDataList();

  static List<ImageData> getImageDataList() {
    return [
      ImageData(
          'assets/images/mint.png', 'mint', 'grow your savings. 3x faster.'),
      ImageData('assets/images/bank_accounts.png', 'bank accounts',
          'check your bank balance'),
      ImageData(
          'assets/images/scan_and_pay.png', 'Scan n Pay', 'Scan and Pay&pay'),
      ImageData('assets/images/utility_and_all_bills.png',
          'utility & all bills', 'the most rewarding way to pay.'),
      ImageData('assets/images/house_rent.png', 'house rent',
          'pay rent with your credit card'),
      ImageData('assets/images/education_fees_test.png', 'education fees',
          'pay education fees with credit card'),
      ImageData(
          'assets/images/rewards.png', 'rewards', 'redeem coins for cashback'),
      ImageData('assets/images/refer_and_earn.png', 'refer & earn',
          'assured cashback for bringing friends'),
      ImageData('assets/images/coins.png', 'coins',
          'use coins to claim rewards'),
      ImageData(
          'assets/images/vouchers.png', 'vouchers', 'vouchers you have won'),
      ImageData('assets/images/brand_offers.png', 'brand offers',
          'get exclusive offers')
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
          title: const Text("CRED", style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(
              icon: Icon(
                  _viewType == ViewType.list ? Icons.grid_on : Icons.view_list),
              onPressed: () {
                if (_viewType == ViewType.list) {
                  _crossAxisCount = 2;
                  _aspectRatio = 1.5;
                  _viewType = ViewType.grid;
                } else {
                  _crossAxisCount = 1;
                  _aspectRatio = 5;
                  _viewType = ViewType.list;
                }
                setState(() {});
              },
            )
          ],
        ),
        body: Container(
            // margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(15.0),
              color: Colors.black,

              // boxShadow: const [
              //   BoxShadow(
              //     color: Colors.grey,
              //     offset: Offset(0.0, 1.0), //(x,y)
              //     blurRadius: 6.0,
              //   ),
              // ],
            ),
            child: Container(
                margin: const EdgeInsets.all(10),
                child: GridView.count(
                  crossAxisCount: _crossAxisCount,
                  childAspectRatio: _aspectRatio,
                  children: itemList.map((ImageData imageData) {
                    return getGridItem(imageData);
                  }).toList(),
                ))));
  }

  GridTile getGridItem(ImageData imageData) {
    return GridTile(
      child: (_viewType == ViewType.list)
          ? Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        imageData.path,
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        imageData.title,
                        softWrap: false,
                        maxLines: 2,
                        style: const TextStyle(
                          // fontWeight: FontWeight.w100,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        imageData.date,
                        maxLines: 2,
                        softWrap: false,
                        style: const TextStyle(
                          // fontWeight: FontWeight.w100,
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          imageData.path,
                        ))),
                Text(
                  imageData.title,
                  style: const TextStyle(
                    // fontWeight: FontWeight.w100,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
    );
  }
}

enum ViewType { grid, list }
