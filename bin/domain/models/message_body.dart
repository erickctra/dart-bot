import 'package:nyxx/nyxx.dart';

class EmbedMessage {
  String? title;
  String? description;
  String? url;
  String? thumbnail;
  DiscordColor? color;

  EmbedMessage({
    this.title,
    this.description,
    this.url,
    this.thumbnail,
    this.color,
  });

  toNyxx() {
    EmbedBuilder message = EmbedBuilder();
    message.title = title;
    message.description = description;
    message.url = url;
    message.thumbnailUrl = thumbnail;
    message.color = color;

    return message;
  }
}
