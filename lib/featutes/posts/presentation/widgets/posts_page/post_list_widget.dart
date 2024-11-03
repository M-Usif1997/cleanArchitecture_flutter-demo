import 'package:flutter/material.dart';

import '../../../domain/entities/post.dart';

class PostListWidget extends StatelessWidget {
  const PostListWidget({super.key, required this.posts});

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(posts[index].id.toString()),
            title: Text(posts[index].title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            subtitle: Text(
              posts[index].body,
              style: const TextStyle(fontSize: 15),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            onTap: () {},
          );
        },
        separatorBuilder: (context, index) => const Divider(thickness: 1),
        itemCount: posts.length);
  }
}
