import 'package:nyxx/nyxx.dart';

import '../models/bot_tokens.dart';

Future<INyxxWebsocket> connect(BotTokens params) async {
  final bot = NyxxFactory.createNyxxWebsocket(
    params.secretToken,
    GatewayIntents.allUnprivileged,
  )
    ..registerPlugin(Logging())
    ..registerPlugin(CliIntegration())
    ..registerPlugin(IgnoreExceptions())
    ..connect();

  return bot;
}
