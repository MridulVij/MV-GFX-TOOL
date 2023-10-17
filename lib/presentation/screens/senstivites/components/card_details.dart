import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mv_tool/domain/colors/colors.dart';

class CardDetails extends StatefulWidget {
  final String contributerName;
  final String sensiCode;

  const CardDetails(
      {super.key, required this.contributerName, required this.sensiCode});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  int _index = 10;

  // String sensiCode = "";
  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    const snackBar = SnackBar(
      content: Text('Sensitivity Code Copied!'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Preview By: ${widget.contributerName}',
            style: const TextStyle(
              fontSize: 17,
              color: CustomColors.blackColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            // Image.network
            // Text("Get Senstivity Code")
            // Image.network("")

            SizedBox(
              height: 200, // card height
              child: PageView.builder(
                itemCount: 2,
                controller: PageController(viewportFraction: 0.93),
                onPageChanged: (int index) => setState(() => _index = index),
                itemBuilder: (_, i) {
                  return Transform.scale(
                    scale: 0.98,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                            'https://wallpapers.com/images/hd/awesome-pubg-game-cover-hd-lsmq43oghjmfskd2.webp')),
                  );
// -Why-Google-and-Apple-removed-BGMI-from-their-respective-app-stores-2-years-after-PUBG-ban-2.jpg
                },
              ),
            ),

            // GestureDetector(
            //   onScaleStart: (ScaleStartDetails details) => print(details),
            //   onScaleUpdate: (ScaleUpdateDetails details) => print(details),
            //   onScaleEnd: (ScaleEndDetails details) => print(details),
            //   child: Transform(
            //     transform: Matrix4.rotationZ(10),
            //     alignment: FractionalOffset.center,
            //     child: Image.network(
            //         'https://images.firstpost.com/wp-content/uploads/2022/07/Explained'),
            //   ),
            // ),
            // InteractiveImage(
            //   image: Image.network(
            //       'https://wallpapers.com/images/hd/awesome-pubg-game-cover-hd-lsmq43oghjmfskd2.webp'),
            // ),

            Align(
              alignment: Alignment.center,
              child: InkWell(
                  onTap: () {
                    _copyToClipboard(context, widget.sensiCode);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 1, color: CustomColors.blackColor)),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(widget.sensiCode,
                              style: TextStyle(
                                  color: CustomColors.primaryColor,
                                  fontSize: 18)),
                        ),
                        Text(
                          "Click to Copy Code",
                          style: TextStyle(
                              color: CustomColors.darkGreyColor, fontSize: 12),
                        )
                      ],
                    ),
                  )),
            ),
          ]),
        ));
  }
}

class InteractiveImage extends StatefulWidget {
  const InteractiveImage({required this.image});

  final Image image;

  @override
  State<InteractiveImage> createState() => _InteractiveImageState();
}

class _InteractiveImageState extends State<InteractiveImage> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new GestureDetector(
        onScaleStart: (ScaleStartDetails details) => print(details),
        onScaleUpdate: (ScaleUpdateDetails details) => print(details),
        onScaleEnd: (ScaleEndDetails details) => print(details),
        child: new Transform(
          transform: new Matrix4.rotationZ(0),
          alignment: FractionalOffset.center,
          child: widget.image,
        ),
      ),
    );
  }
}
