import 'package:churchapp/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'videoplayerscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    const HomeContent(),
    Container(), // Placeholder for Feed
    Container(), // Placeholder for Messages
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[0],
      bottomNavigationBar: const CustomBottomNavigationBar(
          currentIndex: 0), // Use the custom navigation bar
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final List<Video> sermons = [
    Video(
      title: 'Sermon on Faith',
      url: 'https://example.com/video3.mp4',
      thumbnailUrl: 'assets/images/image.jpg',
      views: 305,
      uploadTime: '1 yr ago',
    ),
    Video(
      title: 'Set free from Stomach ulcers - Walkthrough Altar Testimony',
      url: 'https://example.com/video1.mp4',
      thumbnailUrl: 'assets/images/image2.jpg',
      views: 203,
      uploadTime: '9 mo ago',
    ),
    Video(
      title: 'Mental Illness Testimony - Walkthrough Altar',
      url: 'https://example.com/video2.mp4',
      thumbnailUrl: 'assets/images/image3.jpg',
      views: 119,
      uploadTime: '9 mo ago',
    ),
    // Add more videos here
  ];

  final List<Video> teachings = [
    Video(
      title: 'Understanding the Bible',
      url: 'https://example.com/video4.mp4',
      thumbnailUrl: 'assets/images/image1.png',
      views: 150,
      uploadTime: '6 mo ago',
    ),
    Video(
      title: 'Set free from Stomach ulcers - Walkthrough Altar Testimony',
      url: 'https://example.com/video1.mp4',
      thumbnailUrl: 'assets/images/image2.jpg',
      views: 203,
      uploadTime: '9 mo ago',
    ),
    Video(
      title: 'Mental Illness Testimony - Walkthrough Altar',
      url: 'https://example.com/video2.mp4',
      thumbnailUrl: 'assets/images/image.jpg',
      views: 119,
      uploadTime: '9 mo ago',
    ),
    // Add more videos here
  ];

  final List<Video> prophecies = [
    Video(
      title: 'Future Predictions',
      url: 'https://example.com/video5.mp4',
      thumbnailUrl: 'assets/images/image2.jpg',
      views: 300,
      uploadTime: '1 yr ago',
    ),
    // Add more videos here
  ];

  final List<Video> testimonies = [
    Video(
      title: 'Life Changing Testimony',
      url: 'https://example.com/video6.mp4',
      thumbnailUrl: 'assets/images/image3.jpg',
      views: 450,
      uploadTime: '2 yrs ago',
    ),
    Video(
      title: 'Mental Illness Testimony - Walkthrough Altar',
      url: 'https://example.com/video2.mp4',
      thumbnailUrl: 'assets/images/image2.jpg',
      views: 119,
      uploadTime: '9 mo ago',
    ),
    // Add more videos here
  ];

  String selectedCategory = 'Sermons';

  List<Video> getSelectedVideos() {
    switch (selectedCategory) {
      case 'Sermons':
        return sermons;
      case 'Testimonies':
        return testimonies;
      case 'Prophecies':
        return prophecies;
      case 'Teachings':
        return teachings;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          'assets/images/logo.png',
          height: 40,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryButton(
                    label: 'Sermons',
                    isSelected: selectedCategory == 'Sermons',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Sermons';
                      });
                    },
                  ),
                  CategoryButton(
                    label: 'Testimonies',
                    isSelected: selectedCategory == 'Testimonies',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Testimonies';
                      });
                    },
                  ),
                  CategoryButton(
                    label: 'Prophecies',
                    isSelected: selectedCategory == 'Prophecies',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Prophecies';
                      });
                    },
                  ),
                  CategoryButton(
                    label: 'Teachings',
                    isSelected: selectedCategory == 'Teachings',
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Teachings';
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                        'assets/images/livetv.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Positioned(
                      bottom: 10.0,
                      right: 10.0,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.play_arrow, color: Colors.white),
                        label: const Text(
                          'WATCH LIVE TV',
                          style: TextStyle(
                              color: Colors.white), // Set text color to white
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
              itemCount: getSelectedVideos().length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final video = getSelectedVideos()[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.asset(
                                video.thumbnailUrl,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            Positioned(
                              right: 10,
                              bottom: 10,
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.share),
                                    color: Colors.white,
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.play_arrow),
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              VideoPlayerScreen(video: video),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        video.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text('${video.views} views • ${video.uploadTime}'),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: isSelected ? Colors.blue : Colors.grey.shade800,
        shadowColor: isSelected ? Colors.blueAccent : Colors.transparent,
        elevation: isSelected ? 10 : 0,
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        minimumSize: const Size(
            80, 40), // Minimum size to ensure buttons fit in one line
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 12), // Reduced font size
      ),
    );
  }
}

class Video {
  final String title;
  final String url;
  final String thumbnailUrl;
  final int views;
  final String uploadTime;

  Video({
    required this.title,
    required this.url,
    required this.thumbnailUrl,
    required this.views,
    required this.uploadTime,
  });
}
