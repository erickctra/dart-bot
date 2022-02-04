import './domain/usecases/commands/commands.dart';
import './domain/usecases/usecases.dart';
import './tokens.dart' as tokens;

void main() async {
  final bot = await connect(tokens.get);

  commands(bot);
}
