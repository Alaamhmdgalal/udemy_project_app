import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:udemy_project/modules/shop_app/login/shop_login_screen.dart';
import 'package:udemy_project/shared/components/components.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel(this.image, this.title, this.body);
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  bool isLast = false;

  List<BoardingModel> boarding = [
    BoardingModel(
        'asserts/images/grocery-cart.png',
        'Welcome to my shopping app',
        'I hope you like it'),
    BoardingModel(
        'asserts/images/online-shopping.png',
        'You will find whatever what you want',
        'No need to go to the store'),
    BoardingModel(
        'asserts/images/buyer.png',
        'Happy Shopping',
        ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: ()
              {
                navigateAndFinish(context, LoginShopScreen(),);
              },
              child: const Text(
                'SKIP',
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => boardingItem(boarding[index]),
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemCount: boarding.length,
                controller: boardController,
                physics: BouncingScrollPhysics(),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.amber,
                    dotHeight: 10.0,
                    expansionFactor: 4,
                    dotWidth: 10.0,
                    spacing: 5.0,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                    onPressed: () {
                      if (isLast) {
                        navigateAndFinish(context, LoginShopScreen());
                      } else {
                        boardController.nextPage(
                            duration: const Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget boardingItem(BoardingModel model) => Column(
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${model.image}'),
              width: 200.0,
              height: 200.0,
            ),
          ),
          Center(
            child: Text(
              '${model.title}',
              style: const TextStyle(
                fontSize: 30.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            '${model.body}',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
        ],
      );
}
