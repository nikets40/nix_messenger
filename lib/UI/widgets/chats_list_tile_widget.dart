import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ChatsListTile extends StatelessWidget {
  final String image;
  final String name;
  final String lastMessage;
  final String dateTimeLastMessage;
  final int unReadMessages;
  final bool isChatMuted;
  final bool isOnline;

  ChatsListTile(
      {@required this.image,
      @required this.name,
      @required this.lastMessage,
      @required this.dateTimeLastMessage,
      @required this.unReadMessages,
      @required this.isOnline,
      this.isChatMuted = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            children: [
              SizedBox(
                width: 52,
                height: 52,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: CachedNetworkImageProvider(image),
                      backgroundColor: Colors.transparent,
                    ),
                    if(isOnline??false)
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: CircleAvatar(
                        radius: 11,
                        backgroundColor: Color(0xff1f1f1f),
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: Colors.green,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Flexible(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 16)),
                              Text(
                                lastMessage,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            dateTimeLastMessage,
                            style: TextStyle(
                                color: unReadMessages > 0
                                    ? Colors.green
                                    : Colors.grey),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              isChatMuted
                                  ? Icon(
                                      Icons.volume_off,
                                      color: Colors.grey,
                                      size: 18,
                                    )
                                  : Container(),
                              unReadMessages > 0
                                  ? Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.green,
                                        child: Center(
                                          child: Text(
                                            unReadMessages.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 0.5,
              width: MediaQuery.of(context).size.width * 0.73,
              color: Colors.white12,
            ),
          ),
        )
      ],
    );
  }
}
