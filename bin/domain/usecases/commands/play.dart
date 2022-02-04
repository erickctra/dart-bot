import 'package:nyxx/nyxx.dart';

import '../../models/models.dart';
import '../../utils/utils.dart' as utils;

void play(CommandParams params) async {
  final node = params.node;
  final currentGuildData = params.currentGuildData;
  final event = params.event;
  final bot = params.bot;

  if (currentGuildData.currentVoiceChannel != null) {
    String searchQuery = event.message.content.substring(3);
    if (event.message.content.contains('https://www.youtube.com/')) {
      if (searchQuery.contains('list')) {
        late String query;
        const start = "list=";
        const end = "&";

        final startIndex = searchQuery.indexOf(start);
        final endIndex = searchQuery.indexOf(end, startIndex + start.length);

        if (searchQuery.contains('index')) {
          query = searchQuery.substring(startIndex + start.length, endIndex);
        } else {
          query = searchQuery.substring(startIndex + start.length);
        }

        final searchResults = await node.searchTracks(query);
        for (var item in searchResults.tracks) {
          node.play(currentGuildData.guildID, item).queue();
        }
      }
    }

    final searchResults = await node.autoSearch(
      event.message.content.substring(3),
    );
    node.play(currentGuildData.guildID, searchResults.tracks[0]).queue();
    final channel = await bot.fetchChannel<IVoiceGuildChannel>(
      Snowflake(
        currentGuildData.currentVoiceChannel?.id,
      ),
    );
    channel.connect();
    EmbedMessage messageData = EmbedMessage(
        title: '${searchResults.tracks[0].info?.title}',
        url: '${searchResults.tracks[0].info?.uri}',
        thumbnail:
            'https://img.youtube.com/vi/${searchResults.tracks[0].info?.identifier}/0.jpg',
        color: DiscordColor.azure);
    utils.sendMessenge(messageData, event);
  } else {
    EmbedMessage messageData = EmbedMessage(
        description:
            'Você precisa estar em um canal de voz para utilizar esse comando');
    utils.sendMessenge(messageData, event);
  }
}
