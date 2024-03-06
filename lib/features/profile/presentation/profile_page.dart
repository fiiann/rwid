import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rwid/core/constant/constant.dart';
import 'package:rwid/core/domain/model/user_rwid.dart';
import 'package:rwid/core/widget/custom_text.dart';
import 'package:rwid/features/profile/presentation/components/custom_cupertino_section.dart';
import 'package:rwid/features/profile/presentation/edit_profile_page.dart';
import 'package:rwid/features/profile/presentation/profile_utils.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Hive.box(authBoxName).listenable(),
        builder: (context, box, widget) {
          final UserRWID user = box.get('user');
          final listProfile = [
            ('Name', user.name, Icons.person, null),
            ('Email', user.email, Icons.mail, null),
            ('Phone', user.phone, Icons.phone, null),
            ('Address', user.address, Icons.location_on, null),
          ];

          final listSetting = [
            ('Theme Mode', 'White Theme', Icons.dark_mode_outlined, () {}),
            ('Language', 'English', Icons.language, () {})
          ];
          return CustomScrollView(
            slivers: [
              buildSliverAppBar(),
              buildPhoto(user),
              buildInfoProfile(listProfile, context),
              buildInfoSetting(listSetting, context),
            ],
          );
        },
      ),
    );
  }

  SliverToBoxAdapter buildInfoProfile(List<ProfileTuple> list,
      BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomCupertinoSection(
        title: 'Personal Information',
        data: list,
        edit: TextButton(
          onPressed: () => context.push(EditProfilePage.routeName),
          child: const CustomText('Edit'),
        ),
      ),
    );
  }

  SliverToBoxAdapter buildInfoSetting(List<ProfileTuple> list,
      BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomCupertinoSection(
        title: 'Setting',
        data: list,
      ),
    );
  }

  SliverToBoxAdapter buildPhoto(UserRWID user) {
    return SliverToBoxAdapter(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(user.photo),
            radius: 75.0,
          ),
        ),
      ),
    );
  }

  SliverAppBar buildSliverAppBar() {
    return const SliverAppBar(
      pinned: true,
      title: Text('Profile'),
    );
  }
}
