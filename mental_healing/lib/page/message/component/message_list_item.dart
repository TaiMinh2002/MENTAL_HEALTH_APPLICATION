import 'package:mental_healing/import.dart';

class MessageListItem extends BaseWidget with BaseMixin {
  MessageListItem(
      {super.key,
      required this.name,
      this.avatar,
      required this.latestMessage,
      required this.time,
      required this.onTap});

  final String name;
  final String? avatar;
  final String latestMessage;
  final VoidCallback onTap;
  final String time;

  @override
  Widget builder() {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 28.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_avatarWidget(), _messageWidget()],
        ),
      ),
    );
  }

  Widget _avatarWidget() {
    return CircleAvatar(
      backgroundColor: color.whiteColor,
      backgroundImage: avatar != null
          ? NetworkImage(avatar!) as ImageProvider<Object>
          : const AssetImage(AssetImages.noPerson) as ImageProvider<Object>,
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
                '$latestMessage · $time',
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
}
