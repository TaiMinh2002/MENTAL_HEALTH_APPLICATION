import 'package:mental_healing/import.dart';

class MessageListItem extends BaseWidget with BaseMixin {
  MessageListItem(
      {super.key,
      required this.name,
      required this.avatar,
      required this.latestMessage,
      required this.onTap});

  final String name;
  final String avatar;
  final String latestMessage;
  final VoidCallback onTap;

  @override
  Widget builder() {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 28.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_avatarWidget(), _messageWidget(), _timeWidget()],
        ),
      ),
    );
  }

  Widget _avatarWidget() {
    return CircleAvatar(
      backgroundColor: color.whiteColor,
      backgroundImage: NetworkImage(avatar),
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
              name,
              style: textStyle.bold(size: 15, color: color.blackColor),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                latestMessage,
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
