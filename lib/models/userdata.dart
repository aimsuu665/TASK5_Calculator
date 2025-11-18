import 'package:project1/models/account.dart';
import 'package:project1/models/friend.dart';
import 'package:project1/models/usercomment.dart';
import 'package:project1/models/userpost.dart';


class Userdata {
  List<Userpost> userList = [
    Userpost(
      userimg: 'assets/prof1.jpg',
      username: 'John Doe',
      time: '2 hrs ago',
      postcontent: 'love it:',
      postimg: 'assets/person1.jpg',
      numcomments: '8k',
      numshare: '10.3k',
      isLiked: false,
    ),
    Userpost(
      userimg: 'assets/prof3.jpg',
      username: 'Clyde Fructoso',
      time: '3 hrs ago',
      postcontent: 'Nature',
      postimg: 'assets/Nature.png',
      numcomments: '12.3k',
      numshare: '64.3k',
      isLiked: false,
    ),
    Userpost(
      userimg: 'assets/prof2.jpg',
      username: 'Raven',
      time: '4 hrs ago',
      postcontent: 'Gamer Era? (2).',
      postimg: 'assets/person4.jpg',
      numcomments: '18.8k',
      numshare: '31.2k',
      isLiked: false,
    ),
    Userpost(
      userimg: 'assets/.png',
      username: 'Brylle',
      time: '5 hrs ago',
      postcontent: 'Loving when the Sunsets:',
      postimg: 'assets/Sunset.png',
      numcomments: '24.7k',
      numshare: '51.1k',
      isLiked: false,
    ),
  ];

  List<Friend> friendList = [
    Friend(img: 'assets/Rocky1.png', name: 'Rocky'),
    Friend(img: 'assets/Raven1.png', name: 'vinbane'),
    Friend(img: 'assets/Gilgre1.png', name: 'Gilgre'),
    Friend(img: 'assets/Bayona1.png', name: 'Bayonax'),
    Friend(img: 'assets/Dexter1.png', name: 'Dextoy'),
    Friend(img: 'assets/Oquindo1.png', name: 'John David'),
  ];

  List<Usercomment> commentList = [
    Usercomment(
      commenterImg: 'assets/prof2.jpg',
      commenterName: 'Earl',
      commenterTime: '3hrs',
      commenterContent: 'nice photo',
    ),
    
  ];

  Account myUserAccount = Account(
    name: 'Earl Austine Fructoso',
    email: 'earlaustinefructoso1@gmail.com',
    img: 'assets/Earl1.png',
    numFollowers: '515M',
    numPosts: '3',
    numFollowing: '0',
    numFriends: '300',
  );
}
