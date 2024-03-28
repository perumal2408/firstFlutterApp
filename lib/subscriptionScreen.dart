import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SubscriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text('Subscription Screen'),
  actions: <Widget>[
    PopupMenuButton<String>(
      onSelected: (String result) {
        switch (result) {
          case 'Home':
            // Navigate to Home
            break;
          case 'Existing Subscriber':
            // Navigate to Existing Subscriber
            break;
          case 'FAQ':
            // Navigate to FAQ
            break;
          case 'Contact Us':
            // Navigate to Contact Us
            break;
          case 'Cart':
            // Navigate to Cart
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'Home',
          child: Text('Home'),
        ),
        const PopupMenuItem<String>(
          value: 'Existing Subscriber',
          child: Text('Existing Subscriber'),
        ),
        const PopupMenuItem<String>(
          value: 'FAQ',
          child: Text('FAQ'),
        ),
        const PopupMenuItem<String>(
          value: 'Contact Us',
          child: Text('Contact Us'),
        ),
        const PopupMenuItem<String>(
          value: 'Cart',
          child: Text('Cart'),
        ),
      ],
    ),
  ],
),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(height: 100.0),
              items: [
                'lib/assets/images/bl_product_img-1.jpg',
                'lib/assets/images/bl_product_img-2.jpg'
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(),
                      child: Image.asset(i, fit: BoxFit.fill),
                    );
                  },
                );
              }).toList(),
            ),
      Row(
  children: <Widget>[
    Expanded(
      child: TextButton(
        child: Text('New Subscriber'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('New Subscriber'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Check availability for print edition at your locality'),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your pincode',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      child: Text('Proceed'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        // Add your action here
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    ),
    Expanded(
      child: TextButton(
        child: Text('Renew Subscription'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {
showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: Text('Renew Subscription'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const TextField(
            decoration: InputDecoration(
              labelText: 'Enter Subscriber ID',
            ),
          ),
          const Text('or'),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Enter Registered Mobile Number',
            ),
          ),
          const Text('or'),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Enter Registered Email ID',
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            child: Text('Sign In'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {
              // Add your action here
            },
          ),
        ],
      ),
    );
  },
);
        },
      ),
    ),
  ],
),
            const SizedBox(height: 10.0),
            const Center(
              child: Text(
                'BUSINESSLINE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10.0),
            const Center(
              child: Text(
                'Brings to you the latest news on India and international business, stock market, finance, economy, opinion and analysis.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10.0),
            CarouselSlider(
              options: CarouselOptions(height: 200.0),
              items: [
                Card(
                  child: Column(
                    children: [
                      const Text(
                        'BL Portfolio',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: YoutubePlayer.convertUrlToId(
                              'https://youtu.be/28VGUBhx-fc')!,
                          flags: const YoutubePlayerFlags(
                            autoPlay: false,
                            mute: false,
                          ),
                        ),
                        showVideoProgressIndicator: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Enjoy the host of benefits',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.payment, color: Colors.blue),
                        Text('Payment Option'),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.card_giftcard_outlined, color: Colors.blue),
                        Text('Exclusive Offer'),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                    height:
                        20), // This will add a gap of 20 pixels between the two rows
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.person, color: Colors.blue),
                        Text('Multiple Tenure'),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.dashboard, color: Colors.blue),
                        Text(
                          'Maintain Dashboard',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
