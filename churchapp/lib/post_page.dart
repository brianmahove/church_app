import 'package:churchapp/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PostPage(),
      routes: {
        '/comments': (context) => const CommentsPage(),
      },
    );
  }
}

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: ListView(
        children: [
          postWidget(
            context,
            'Church App',
            '4 mo ago',
            'assets/images/image1.jpg', // image path
            'Impontant Announcement about Church\n International youtube channel',
          ),
          postWidget(
            context,
            'Bryn Mahove',
            '2 mo ago',
            'assets/images/image1.jpg', // image path
            'Impontant Announcement about church app...',
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
          currentIndex: 1), // Use the custom navigation bar
    );
  }

  Widget postWidget(BuildContext context, String username, String timeAgo,
      String imageUrl, String caption) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/images/logo.png'), // Corrected profile image path
            ),
            title: Text(username),
            subtitle: Text(timeAgo),
            trailing: const Icon(Icons.more_vert),
          ),
          Image.network(imageUrl),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                const SizedBox(width: 5.0),
                IconButton(
                  icon: const Icon(Icons.comment_outlined),
                  onPressed: () {
                    Navigator.pushNamed(context, '/comments');
                  },
                ),
                const SizedBox(width: 5.0),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(caption),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

class CommentsPage extends StatelessWidget {
  const CommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: const Center(
        child: Text('Comments will be shown here.'),
      ),
    );
  }
}
