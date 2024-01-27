import 'package:flutter/material.dart';

const kModalBottomShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  ),
);

Future<bool?> showConfirmationBottomSheet({
  required BuildContext context,
  required String image,
  required String title,
  required Object message,
  double? imageWidth,
  String negativeButton = 'Batalkan',
  String positiveButton = 'Lanjutkan',
  bool isScrollControlled = true,
}) async {
  assert(
    message is String || message is Text,
    'Use message type either String or Text widget',
  );
  return showCustomBottomSheet(
    context: context,
    isScrollControlled: isScrollControlled,
    builder: (context, constraints) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 32),
          Center(
            child: image.isEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.grey.shade100,
                    ),
                  )
                : Image.asset(
                    image,
                    width: imageWidth ?? constraints.maxWidth * 0.6,
                  ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: message is String
                ? Text(
                    message,
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  )
                : message as Text,
          ),
          const SizedBox(height: 32),
          SafeArea(
            minimum: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    child: Text(negativeButton),
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    child: Text(positiveButton),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ],
      );
    },
  );
}

Future<T?> showCustomBottomSheet<T>({
  required BuildContext context,
  required LayoutWidgetBuilder builder,
  ShapeBorder? shape = kModalBottomShape,
  bool isScrollControlled = false,
  bool isDismissible = true,
  Color? backgroundColor,
  String? title,
}) async {
  return showModalBottomSheet(
    context: context,
    shape: shape,
    isScrollControlled: isScrollControlled,
    isDismissible: isDismissible,
    backgroundColor: backgroundColor ?? Colors.white,
    builder: (BuildContext bc) {
      if (title != null) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: InkWell(
                    child: const Icon(Icons.close),
                    onTap: () => Navigator.pop(context),
                  ),
                  minLeadingWidth: 0,
                  title: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.close,
                    color: Colors.transparent,
                  ),
                ),
                builder(context, constraints),
              ],
            );
          },
        );
      }

      return LayoutBuilder(builder: builder);
    },
  );
}

Future<T?> showCustomDraggableBottomSheet<T>({
  required BuildContext context,
  required LayoutWidgetBuilder builder,
  EdgeInsetsGeometry padding = const EdgeInsets.symmetric(horizontal: 16),
  bool isDismissible = true,
  double initialChildSize = 0.5,
  double minChildSize = 0.25,
  double maxChildSize = 1.0,
  String? title,
  Widget? bottom,
}) async {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: isDismissible,
    builder: (BuildContext bc) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return DraggableScrollableSheet(
            minChildSize: minChildSize,
            initialChildSize: initialChildSize,
            maxChildSize: maxChildSize,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: kModalBottomShape.borderRadius,
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListTile(
                      leading: InkWell(
                        child: const Icon(Icons.close),
                        onTap: () => Navigator.pop(context),
                      ),
                      minLeadingWidth: 0,
                      title: title == null
                          ? null
                          : Text(
                              title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      trailing: const Icon(
                        Icons.close,
                        color: Colors.transparent,
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        padding: padding,
                        child: builder(context, constraints),
                      ),
                    ),
                    if (bottom != null) bottom,
                  ],
                ),
              );
            },
          );
        },
      );
    },
  );
}

Future<DateTime?> showDatePickerBottomSheet({
  required BuildContext context,
  String title = 'Pilih Tanggal',
  String button = 'Pilih Tanggal',
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  final now = DateTime.now();
  var selected = now;
  return showCustomBottomSheet(
    context: context,
    builder: (context, constraints) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: InkWell(
              child: const Icon(Icons.close),
              onTap: () => Navigator.pop(context),
            ),
            title: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.close, color: Colors.transparent),
          ),
          Flexible(
            child: CalendarDatePicker(
              initialDate: initialDate ?? now,
              firstDate: firstDate ?? now,
              lastDate: lastDate ?? DateTime(2037),
              onDateChanged: (DateTime value) {
                selected = value;
              },
            ),
          ),
          SafeArea(
            minimum: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, selected);
              },
              child: Text(button),
            ),
          ),
        ],
      );
    },
  );
}

Future<T?> showSelectionBottomSheet<T>({
  required BuildContext context,
  required String title,
  required Map<String, T> mapLabelData,
  T? selected,
}) async {
  return showCustomBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context, constraints) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: InkWell(
              child: const Icon(Icons.close),
              onTap: () => Navigator.pop(context),
            ),
            minLeadingWidth: 0,
            title: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: const Icon(Icons.close, color: Colors.transparent),
          ),
          ...mapLabelData.keys.map((label) {
            final value = mapLabelData[label];
            final active = selected == value;

            if (active) {
              return ListTile(
                title: Text(
                  label,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                selected: active,
                selectedTileColor:
                    Theme.of(context).primaryColor.withOpacity(0.015),
                trailing: Icon(
                  Icons.check_circle,
                  color: Theme.of(context).primaryColor,
                ),
                onTap: () {
                  Navigator.pop(context, value);
                },
              );
            }

            return ListTile(
              title: Text(label),
              onTap: () {
                Navigator.pop(context, value);
              },
            );
          }),
          const SafeArea(child: SizedBox(height: 12)),
        ],
      );
    },
  );
}
