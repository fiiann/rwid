import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rwid/core/constant/colors.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/domain/model/generic_handler.dart';
import 'package:rwid/core/widget/primary_button.dart';
import 'package:rwid/core/widget/swipe_indicator.dart';

extension CustomBuildContext on BuildContext {
  Future<bool?> showResultDialog({
    required ResponseState status,
    required String message,
    bool barrierDismissible = false,
  }) {
    return showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: this,
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(this).modalBarrierDismissLabel,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return Align(
          child: Container(
            width: double.infinity / 1.75,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Material(
              type: MaterialType.transparency,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    if (status == ResponseState.ok)
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 100,
                      )
                    else
                      const Icon(
                        Icons.error_rounded,
                        color: Colors.red,
                        size: 100,
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PrimaryButton(
                      label: 'OK',
                      onTap: () {
                        context.pop(true);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<T?> showDropdownBottomsheet<T>({
    required List<T> options,
    required String title,
    int valueString = 1,
    bool barrierDismissible = false,
  }) {
    return showModalBottomSheet(
      context: this,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      isScrollControlled: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            const SwipeIndicator(),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: const Icon(Icons.close),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  const borderSide = BorderSide(
                    color: CustomColors.lightActionDisabledBackground,
                  );
                  return InkWell(
                    onTap: () {
                      context.pop(options[index]);
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                          top: borderSide,
                          bottom: index == options.length - 1
                              ? borderSide
                              : BorderSide.none,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          GenericHandler(
                            options[index],
                          ).getStringValue,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> previewImage({required String image}) {
    // return showGeneralDialog(
    //     context: this,
    //     barrierLabel: 'close',
    //     barrierDismissible: true,
    //     pageBuilder: (context, b, c) {
    //       return Container(
    //         width: 500,
    //         child: SimpleDialog(
    //           children: [Assets.promoDummy.image()],
    //         ),
    //       );
    //     });
    return showGeneralDialog(
      context: this,
      barrierDismissible: true,
      barrierLabel: 'close',
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, tween, long) {
        return SizedBox(
          width: double.infinity,
          height: 400,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Image.asset(image),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: GestureDetector(
                        onTap: pop,
                        child: CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(0.5),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
