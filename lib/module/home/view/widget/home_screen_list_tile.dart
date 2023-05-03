import 'package:flutter/material.dart';

import '../../model/posts_data_model.dart';

class HomeScreenListTile extends StatelessWidget {
  const HomeScreenListTile({super.key, required this.postData});
  final PostsDataModel postData;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Row(
          children: [
            Text(
              postData.id.toString(),
              style: const TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Expanded(
              child: Text(
                postData.title ?? '',
                style: const TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          postData.body ?? '',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
