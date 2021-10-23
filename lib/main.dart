import 'package:flutter/material.dart';
import 'package:payment_app/theme.dart';
import 'theme.dart';

void main() {
  runApp(const PaymentApps());
}

class PaymentApps extends StatefulWidget {
  const PaymentApps({Key? key}) : super(key: key);

  @override
  State<PaymentApps> createState() => _PaymentAppsState();
}

class _PaymentAppsState extends State<PaymentApps> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    Widget option(int index, String tittle, String subTittle, String pricing) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: selectedIndex == index
                  ? Color(0xff0047FF)
                  : Color(0xffFFFFFF),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectedIndex == index
                      ? Image.asset(
                          'assets/Union.png',
                          width: 18,
                          height: 18,
                        )
                      : Image.asset(
                          'assets/Ellipse.png',
                          width: 18,
                          height: 18,
                        ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tittle,
                        style: planTextStyle,
                      ),
                      Text(subTittle, style: descTextStyle)
                    ],
                  ),
                  SizedBox(
                    width: 52,
                  ),
                  Text(
                    pricing,
                    style: priceTextStyle,
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 120, right: 120),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/Bag.png',
                width: 154,
                height: 169,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upgrade to Pro',
                  style: tittleTextStyle,
                ),
              ],
            ),
            SizedBox(
              height: 19,
            ),
            Text(
              'Go unlock all features and build \nyour own business bigger.',
              style: subTittleTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    Widget checkoutButton() {
      return Column(
        children: [
          Container(
            width: 233,
            height: 40,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff0038FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Checkout Now',
                style: buttonTextStyle,
              ),
            ),
          )
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff181A53),
        body: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              option(0, 'Monthly', 'Good fo startingup', '\$20'),
              option(1, 'Quarterly', 'Focus on building', '\$55'),
              option(2, 'Yearly', 'Steady Company', '\$220'),
              SizedBox(
                height: 10,
              ),
              selectedIndex == -1 ? SizedBox() : checkoutButton(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
