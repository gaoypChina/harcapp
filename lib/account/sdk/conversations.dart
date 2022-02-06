
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:harcapp/_common_classes/color.dart';
import 'package:harcapp/_new/api/conversations.dart';

class Participant{

  final String id;
  final String name;

  const Participant({@required this.id, @required this.name});
}

class Message{
  final String prtcpntId;
  final String text;
  final DateTime timeSent;

  const Message({this.prtcpntId, this.text, this.timeSent});

  @override
  String toString() {
    return 'Message'
        '\prtcpntId: $prtcpntId'
        '\ntext: $text'
        '\ntimeSent: ${timeSent.toString()}';
  }
}

class Conversation{

  final String id;
  final String title;
  final Color color;
  final DateTime createdTime;
  final List<Participant> participants;

  const Conversation({
    @required this.id,
    @required this.title,
    @required this.color,
    @required this.createdTime,
    @required this.participants
  });
}

class ConvSDK{

  static Future<List<Conversation>> allConversation() async {
    Response response = await API_CONVERS.getAll();

    if(response.statusCode == HttpStatus.ok)
      try {
        List<Conversation> conversations = [];

        for(Map map in response.data){

          List<Participant> participants = [];
          for(Map prtcpntMap in map['participants'])
            participants.add(Participant(
                id: prtcpntMap['id'],
                name: prtcpntMap['name']
            ));

          conversations.add(Conversation(
              id: map['id'],
              title: map['title'],
              color: hexToColor(map['color']),
              createdTime: DateTime.parse(map['created_time']),
              participants: participants
          ));

        }
        return conversations;
      } catch (e) {
        return null;
      }

    return null;
  }

  static Future<String> createConversation({
    @required String title,
    @required Color color,
    @required List<String> othParticipantIds,
  })async {
    Response response = await API_CONVERS.create(
        title: title,
        color: color,
        othParticipantIds: othParticipantIds
    );

    if(response.statusCode == HttpStatus.ok)
      try {
        return response.data['id'];
      } catch (e) {
        return null;
      }


    return null;
  }

  static Future<bool> postMessage({
    @required String convId,
    @required String message,
  }) async {
    Response response = await API_CONVERS.post(
        convId: convId,
        text: message
    );

    if(response.statusCode == HttpStatus.ok)
      return true;
    else
      return false;
  }

  static Future<List<Message>> getAllMessages({@required String convId})async{

    Response response = await API_CONVERS.allMessages(convId: convId);

    if(response.statusCode == HttpStatus.ok){
      List<Message> messages = [];
      try{
        for(Map map in response.data)
          messages.add(Message(
              prtcpntId: map['author'],
              text: map['text'],
              timeSent: DateTime.tryParse(map['time_sent'])
          ));

      } catch (e){
        return null;
      }
      return messages;
    }

    return null;
  }

}
