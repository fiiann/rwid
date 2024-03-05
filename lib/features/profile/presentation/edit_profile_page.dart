import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rwid/core/constant/colors.dart';
import 'package:rwid/core/constant/constant.dart';
import 'package:rwid/core/domain/model/user_rwid.dart';
import 'package:rwid/core/widget/custom_text.dart';
import 'package:rwid/core/widget/custom_text_field.dart';
import 'package:rwid/core/widget/primary_button.dart';
import 'package:rwid/features/dashboard/dashboard_page.dart';

class EditProfilePage extends StatelessWidget {
  static const String routePath = 'edit_profile';
  static const String routeName = '${DashboardPage.routeName}/$routePath';
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box(authBoxName);
    final UserRWID user = box.get('user');
    return Scaffold(
      appBar: AppBar(
        title: const CustomText('Edit Profile'),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: PrimaryButton(
            label: 'EDIT',
            onTap: () {},
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ColorBlendedImage(
                imageUrl: user.photo,
                blendColor: Colors.blueGrey,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextFormField(
            title: 'Email',
            name: 'email',
            labelText: 'Email',
            value: user.email,
            enabled: false,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            title: 'Name',
            name: 'name',
            labelText: 'Name',
            value: user.name,
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomTextFormField(
            title: 'Address',
            name: 'address',
            labelText: 'Address',
            maxLines: 4,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class ColorBlendedImage extends StatelessWidget {
  final String imageUrl;
  final Color blendColor;

  const ColorBlendedImage({
    super.key,
    required this.imageUrl,
    required this.blendColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(imageUrl)),
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(imageUrl, color: blendColor.withOpacity(0.5)),
        ),
        const Icon(
          Icons.add_a_photo,
          color: CustomColors.black,
        )
      ],
    );
  }
}
