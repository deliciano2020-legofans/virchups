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
    "你不是光，却能照亮我一天的心情。",
    "走出舒适圈，扩大舒适圈。",
    "习惯性用你的方式做事情，也是一种相见。",
    "喧哗的世俗，怎么拦得住自由的灵魂。",
    "多点笑，少点愁。",
    "你不用发光，我也会被你吸引。",
    "Age doesn't have the priority than rights.",
    "你的魔力是否还在？明天可以让我下班后骑轿车吗？",
    "When the why is clear, the how is easy.",
    "Sometims the right choice isn't the best choice.",
    "慢一点也没关系，每一步都在向前。",
    "我不是不想运动，我是害怕地球转太快我跟不上。",
    "Unknown is unknown until known.",
    "Embrace the detour.",
    "人生有某些瞬间就足够了。",
    "我还在loop着那首歌 ya allah",
    "肚子开始有点饿了。",
    "偶尔迷路没关系，重来一次也是前进。",
    "你不用努力发光，本来就很耀眼。",
    "我觉得我挺优秀的，但是你更优秀。",
  ];

  final Random _random = Random();

  /// Get a random quote
  void getRandomQuote() {
    final index = _random.nextInt(_quotes.length);
    _currentQuote.value = _quotes[index];
  }

  /// Clear the current quote
  void clearQuote() {
    _currentQuote.value = '';
  }
}
