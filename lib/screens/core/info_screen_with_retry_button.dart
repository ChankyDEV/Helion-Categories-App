import 'package:flutter/material.dart';
import 'package:helion/screens/styles.dart';
import 'package:helion/screens/utils.dart';

class InfoScreenWithRetryButton extends StatelessWidget {
  final String information;
  final Image image;
  final bool isRetryButtonClicked;
  final VoidCallback onRetryButtonClick;

  const InfoScreenWithRetryButton({
    Key? key,
    required this.information,
    required this.image,
    required this.isRetryButtonClicked,
    required this.onRetryButtonClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: image,
          ),
          Expanded(
              flex: 4,
              child: Column(
                children: [
                  Container(
                    width: width * 0.8,
                    child: Text(
                      information,
                      textAlign: TextAlign.center,
                      style: Styles.general.headerSmall,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Utils.buildButton(
                    context,
                    isButtonClicked: isRetryButtonClicked,
                    onTap: onRetryButtonClick,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
