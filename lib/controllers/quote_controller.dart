import 'dart:math';
import 'package:get/get.dart';

/// Controller for managing random quotes
class QuoteController extends GetxController {
  // Observable for the current quote
  final _currentQuote = ''.obs;

  /// Get the current quote
  String get currentQuote => _currentQuote.value;

  /// List of inspirational quotes
  final List<String> _quotes = [
    "You are only young once, so make it count",
    "Sometimes when you lose, you win",
    "慢慢去别急",
    "DDD, drink drank drunk",
    "一直选你，这次，下次，次次",
    "The favourite notification",
    "上帝给你关上一扇门，是怕你出去丢人",
    "成长就是把哭泣声调成静音，把难过改成不打扰别人",
    "人生要完成的课题有好多，最难的应该是：成为自己",
    "不撞南墙不回头，我要把墙撞出个门来",
    "我觉得我本身挺讨厌自己的，因为我总是把烦恼丢给明天的自己",
    "TMI: 我曾经投稿给中国报，还赚了RM100的稿费捏",
    "In the dream, you're still the person I want to meet",
    "喜欢情绪稳定的气质，也欣赏自己真诚外放的表达，好看的性格从来不只一种",
    "太久没打球了，我已经觉得我不会开球了",
    "一个人只有在很想得到的时候才会害怕失去",
    "其实我很害怕玩极限运动，但我更害怕下次没机会尝试了",
    "失败嘛就失败nor，此路不通就换条路呗",
    "快告诉我你的理想型是怎样的人，我看看我像不像",
    "想每天对你说：早安，午安，晚安",
  ];

  final Random _random = Random();

  // Track which quotes have been shown
  final List<int> _usedIndices = [];

  /// Get a random quote that hasn't been shown yet
  void getRandomQuote() {
    // If all quotes have been shown, reset
    if (_usedIndices.length >= _quotes.length) {
      _usedIndices.clear();
    }

    // Get list of available (unused) indices
    final availableIndices = <int>[];
    for (int i = 0; i < _quotes.length; i++) {
      if (!_usedIndices.contains(i)) {
        availableIndices.add(i);
      }
    }

    // Pick a random quote from available ones
    final randomIndex = _random.nextInt(availableIndices.length);
    final selectedIndex = availableIndices[randomIndex];

    // Mark this quote as used
    _usedIndices.add(selectedIndex);

    // Set the current quote
    _currentQuote.value = _quotes[selectedIndex];
  }

  /// Clear the current quote
  void clearQuote() {
    _currentQuote.value = '';
  }

  /// Reset all shown quotes (optional - user can call this to start fresh)
  void resetShownQuotes() {
    _usedIndices.clear();
  }
}
