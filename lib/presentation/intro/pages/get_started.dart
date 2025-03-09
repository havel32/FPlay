import 'package:f_play/common/widgets/button/basic_app_button.dart';
import 'package:f_play/core/configs/assets/app_vectors.dart';
import 'package:f_play/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/configs/assets/app_images.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.getStartedBackground),
                    fit: BoxFit.fill)),
          ),
          Container(
            color: Colors.black.withOpacity(0.50),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      AppVectors.logo,
                      width: 200,
                    )),
                const Spacer(),
                const Text(
                  "Enjoy listening the music",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17),
                ),
                const SizedBox(
                  height: 20,
                ),
                BasicAppButton(
                    onPressed: () {
                      context.pushNamed(MainNavigationRoutesNames.chooseMode);
                    },
                    title: "Get started")
              ],
            ),
          )
        ],
      ),
    );
  }
}
