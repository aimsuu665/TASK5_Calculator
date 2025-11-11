import 'package:flutter/material.dart';
import 'package:project1/models/userdata.dart';
import 'package:project1/models/userpost.dart';
import 'package:project1/views/profile.view.dart';

class Postlist extends StatefulWidget {
  const Postlist({super.key, required this.userdata});

  final Userdata userdata;

  @override
  State<Postlist> createState() => _PostlistState();
}

class _PostlistState extends State<Postlist> {
  final TextStyle nametxtStyle =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  void gotoPage(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }

  Widget buttons(Userpost userPost) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: userPost.isLiked ? Colors.blue : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                userPost.isLiked = !userPost.isLiked;
              });
            },
            icon: const Icon(Icons.thumb_up),
            label: const Text('Like'),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(foregroundColor: Colors.grey),
            onPressed: () {},
            icon: const Icon(Icons.message),
            label: const Text('Comment'),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(foregroundColor: Colors.grey),
            onPressed: () {},
            icon: const Icon(Icons.share),
            label: const Text('Share'),
          ),
        ],
      );

  Widget postCount(Userpost userPost) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('${userPost.numcomments} Comments'),
            const SizedBox(width: 20),
            Text('${userPost.numshare} Shares'),
          ],
        ),
      );

  Widget postImage(Userpost userPost) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: 350,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(userPost.postimg),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  Widget postHeader(Userpost userPost) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(userPost.userimg),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userPost.username, style: nametxtStyle),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(userPost.time),
                  const Text(' • '),
                  const Icon(Icons.public, size: 15, color: Colors.grey),
                ],
              ),
            ],
          ),
        ],
      );

  Widget showPost(Userpost userPost) => InkWell(
        onTap: () {
          gotoPage(context, ProfileView(userPost: userPost));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            postHeader(userPost),
            Container(
              margin: const EdgeInsets.all(8),
              child: Text(
                userPost.postcontent,
                style: nametxtStyle,
              ),
            ),
            postImage(userPost),
            postCount(userPost),
            const Divider(),
            buttons(userPost),
            const SizedBox(height: 15),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.userdata.userList.length,
      itemBuilder: (context, index) {
        final userPost = widget.userdata.userList[index];
        return showPost(userPost);
      },
    );
  }
}
