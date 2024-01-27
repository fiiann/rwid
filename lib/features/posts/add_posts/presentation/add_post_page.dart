import 'package:flutter/material.dart';
import 'package:rwid/core/widget/custom_text.dart';
import 'package:rwid/core/widget/custom_text_field.dart';

class AddPostPage extends StatelessWidget {
  static const String route = '/add_post_page';
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const CustomText('Add Post'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomTextFormField(
                  labelText: 'Title',
                  name: 'title',
                ),
                const SizedBox(height: 16.0),
                /* TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),*/
                const CustomTextFormField(
                  labelText: 'Content',
                  name: 'content',
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      // Form is valid, process the data
                      // For example, you can print the input values
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
