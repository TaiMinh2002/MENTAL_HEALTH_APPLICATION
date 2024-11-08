import 'package:mental_healing/base/base_mixin.dart';
import 'package:mental_healing/import.dart';

class MessageListItem extends StatelessWidget with BaseMixin {
  const MessageListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_avatarWidget(), _messageWidget(), _timeWidget()],
      ),
    );
  }

  Widget _avatarWidget() {
    return CircleAvatar(
      backgroundColor: color.whiteColor,
      backgroundImage: const AssetImage(AssetImages.noPerson),
      radius: 30,
    );
  }

  Widget _messageWidget() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 9.0, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: textStyle.bold(size: 15, color: color.blackColor),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                'Last Message jdbnfjebjlwbnrjklbdnfjklewbqtjklqrt;erwfjbdnskjbftno234[bdhsfjkbfne4jkwbfdkshjgtbvh]',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textStyle.regular(size: 15, color: color.blackColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _timeWidget() {
    return Text(
      'Time',
      style: textStyle.regular(size: 10, color: color.color727272),
    );
  }
}
