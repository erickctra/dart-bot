import 'package:nyxx/nyxx.dart';

import '../../models/models.dart';
import '../../utils/utils.dart' as utils;

void help(CommandParams params) {
  final event = params.event;

  EmbedMessage messageData = EmbedMessage(
    title: 'Comandos',
    description:
        '**-p** / toca musca \n**-n** / pula musca \n**-pause** / pausa musca \n**-resume** / volta musca \n**-clear** / limpa a fila',
    color: DiscordColor.azure,
  );
  // sendMessage(MessageBuilder.content('content'))
  utils.sendMessenge(messageData, event);
}
