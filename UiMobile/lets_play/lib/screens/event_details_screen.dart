import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lets_play/model/event.dart';
import 'package:lets_play/model/user.dart';
import 'package:lets_play/model/user_event.dart';
import 'package:lets_play/screens/new_event_tab.dart';
import 'package:lets_play/services/authentication.dart';
import 'package:lets_play/services/event_service.dart';
import 'package:lets_play/services/userevents_service.dart';

import 'comment_screen.dart';

class EventDetails extends StatefulWidget {
  final Event event;
  User user;

  EventDetails({@required this.event, @required this.user});

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {

  List<UserEvent> userEvents;

  joinToEvent(User user, context) {
    User currentUser = Auth.currentUser;
    bool userAlreadyExist =
        userEvents.any((userEvent) => userEvent.user.userName == currentUser.userName);
    if (!userAlreadyExist && user.uid != widget.event.createdByUser.uid ) {
      setState(() {
        widget.event.peopleNeeded--;
      });
      EventService.updateEvent(widget.event);
      UserEvent userEvent = new UserEvent(event: this.widget.event, user: this.widget.user);
      UserEventService.createUserEvent(userEvent);
      setState(() {
        userEvents.add(userEvent);
      });
    } else {
      final snackbar = SnackBar(
        content: Text("You have already joined this event!"),
        duration: Duration(milliseconds: 900),
      );

      Scaffold.of(context).showSnackBar(snackbar);
    }
  }

  @override
  void initState() {
    userEvents = [];
    widget.user = Auth.currentUser;
    super.initState();
  }

  void createUser(User user, Event event){
    UserEvent userEvent = UserEvent(user: user, event: event);
    UserEventService.createUserEvent(userEvent);

  }
  @override
  Widget build(BuildContext context) {
    User currentUser = Auth.currentUser;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            widget.event.title,
            textAlign: TextAlign.center,
          ),
          actions: currentUser.uid == widget.event.createdByUser.uid
              ? <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        textColor: Colors.white,
                        onPressed: () {
                          setState(() {
                            widget.event.isActive = false;
                          });
                          EventService.updateEvent(widget.event);
                          createUser(widget.user, widget.event);
                          //update request to BE
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.stop),
                            Text(
                              "STOP",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                letterSpacing: 0.5,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                        shape: CircleBorder(
                            side: BorderSide(color: Colors.transparent)),
                      ),
                    ],
                  ),
                ]
              : <Widget>[]),
      body: Builder(builder: (context) => _eventDetailsWidget(context)),
    );
  }

  Widget _eventDetailsWidget(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipOval(
                  child: Image.asset(
                    'assets/images/profile_image.png',
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      widget.event.createdByUser.userName,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                widget.event.status == null ? SizedBox() : Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child :Text(
                      widget.event.status,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(
                              16.0) //         <--- border radius here
                          ),
                      color: Colors.green),
                ),
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.location_city,
                        size: 35,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.event.city.name,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  widget.event.exactAddress != null ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.place,
                        size: 35,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.event.exactAddress,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ) : SizedBox(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.access_time,
                        size: 35,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        DateFormat('yyyy-MM-dd – kk:mm')
                            .format(widget.event.startDate),
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  OutlineButton(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.person_add,
                          size: 35,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.event.peopleNeeded.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    color: Colors.blueAccent,
                    borderSide: BorderSide(color: Colors.blue),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    textColor: Colors.white,
                    onPressed: () => joinToEvent(widget.user, context),
                  ),
                  _descriptionBox(widget.event),
                  OutlineButton(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Comments',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          FontAwesomeIcons.comment,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    color: Colors.blueAccent,
                    borderSide: BorderSide(color: Colors.blue),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    textColor: Colors.white,
                    onPressed: () { goToComments(context: context, mediaUrl: null, owner: widget.user,postId: widget.event.id ); },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _descriptionBox(Event event) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(bottom: 100),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          event.description == null ? "Description" : event.description,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          border: new Border(
            left: new BorderSide(),
            right: new BorderSide(),
            top: new BorderSide(),
            bottom: new BorderSide(),
          )),
    );
  }

  void goToComments(
      {BuildContext context, int postId, User owner, String mediaUrl}) {
    Navigator.of(context)
        .push(MaterialPageRoute<bool>(builder: (BuildContext context) {
      return CommentScreen(
        postId: postId,
        postUserOwner: owner,
        postMediaUrl: mediaUrl,
      );
    }));
  }
}
