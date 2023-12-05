

class Post {
  final String postTitle;
  final String details;
  late final bool isSwitchOn;

  Post({required this.postTitle, required this.details, required this.isSwitchOn });
}


List<Post> samplePosts = [
  Post(
    postTitle: 'Flutter Basics',
    details: 'This post covers the basics of Flutter development including widgets, state management, and layouts.',
    isSwitchOn: false,
  ),
  Post(
    postTitle: 'State Management in Flutter',
    details: 'Explore various state management techniques in Flutter like Provider, Riverpod, Bloc, etc.',
    isSwitchOn: false,
  ),
  Post(
    postTitle: 'Building Responsive UI',
    details: 'Learn how to build a responsive UI in Flutter that adapts to various screen sizes and orientations.',
    isSwitchOn: true,
  ),
  Post(
    postTitle: 'Adopting Dark Mode in Apps',
    details: 'Should apps offer a dark mode option? Discuss the importance and implementation strategies for dark mode in mobile applications.',
    isSwitchOn: false,
  ),
  Post(
    postTitle: 'Future of Artificial Intelligence',
    details: 'How will AI technology evolve in the next decade, and what impacts will it have on society and industry?',
    isSwitchOn: false,
  ),
  Post(
    postTitle: 'Sustainability in Tech',
    details: 'Discuss the role of technology in promoting environmental sustainability and reducing carbon footprint.',
    isSwitchOn: true,
  ),
  Post(
    postTitle: 'Remote Work: Pros and Cons',
    details: 'Debate the effectiveness of remote work versus traditional office settings in the post-pandemic era.',
    isSwitchOn: true,
  ),
];
