import 'package:nyxx/nyxx.dart';

class MessageData {
  final Snowflake guildID;
  Snowflake? authorID;
  Snowflake? currentVoiceChannel;

  MessageData({
    required this.guildID,
    this.authorID,
    this.currentVoiceChannel,
  });
}
