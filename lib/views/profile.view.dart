import 'package:flutter/material.dart';
import 'package:project1/models/usercomment.dart';
import 'package:project1/models/userdata.dart';
import 'package:project1/models/userpost.dart';

// ProfileView now Stateful to allow interactive features like "Like"
class ProfileView extends StatefulWidget {
  final Userpost userPost;

  const ProfileView({super.key, required this.userPost});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final Userdata userData = Userdata();

  final TextStyle nameTxtStyle =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle boldTxtStyle = const TextStyle(fontWeight: FontWeight.bold);
  final TextStyle boldTxtStyle1 =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  // Comment Widgets
  Widget commentBtn(Usercomment userComment) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(userComment.commenterTime),
            const SizedBox(width: 15),
            const Text('Like'),
            const SizedBox(width: 15),
            const Text('Reply'),
          ],
        ),
      );

  Widget commentDesc(Usercomment userComment) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userComment.commenterName, style: boldTxtStyle),
            const SizedBox(height: 5),
            Text(userComment.commenterContent),
          ],
        ),
      );

  Widget commentSpace(Usercomment userComment) => Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(35, 158, 158, 158),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: commentDesc(userComment),
      );

  Widget commenterPic(Usercomment userComment) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          backgroundImage: AssetImage(userComment.commenterImg),
          radius: 20,
        ),
      );

  Widget userCommenterLine(Usercomment userComment) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commenterPic(userComment),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [commentSpace(userComment), commentBtn(userComment)],
          )
        ],
      );

  Widget userPostDetails(Usercomment userComment) => Column(
        children: [
          const SizedBox(height: 15),
          userCommenterLine(userComment),
        ],
      );

  // Post Widgets
  Widget userLine(Userpost userPost) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage(userPost.userimg),
              radius: 20,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userPost.username, style: nameTxtStyle),
              const SizedBox(height: 5),
              Row(
                children: const [
                  Text('.'),
                  SizedBox(width: 5),
                  Icon(Icons.group, size: 15, color: Colors.grey),
                ],
              ),
            ],
          )
        ],
      );

  Widget postImage(Userpost userPost) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(userPost.postcontent),
            const SizedBox(height: 15),
            Container(
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(userPost.postimg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      );

  Widget buttons(Userpost userPost) => Column(
        children: [
          const Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor:
                        userPost.isLiked ? Colors.grey : Colors.blue,
                  ),
                  onPressed: () {
                    setState(() {
                      userPost.isLiked = !userPost.isLiked;
                    });
                  },
                  icon: const Icon(Icons.thumb_up, size: 20),
                  label: const Text('Like'),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: Colors.grey),
                  onPressed: () {},
                  icon: const Icon(Icons.chat_bubble, size: 20),
                  label: const Text('Comment'),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: Colors.grey),
                  onPressed: () {},
                  icon: const Icon(Icons.share, size: 20),
                  label: const Text('Share'),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.grey),
        ],
      );

  Widget commenters(Userpost userPost) => Column(
        children: [
          const Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [Text(userPost.numshare, style: boldTxtStyle)],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text('All comments', style: boldTxtStyle1),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: userData.commentList
                .map((userComment) => userPostDetails(userComment))
                .toList(),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final Userpost post = widget.userPost;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
        ),
      ),
      body: ListView(
        children: [
          userLine(post),
          postImage(post),
          buttons(post),
          commenters(post),
        ],
      ),
    );
  }
}
