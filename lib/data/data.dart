import 'package:avadhesh_assignment/models/card_model.dart';
import 'package:avadhesh_assignment/models/user_model.dart';

List<UserModel> getUsersCard() {
  List<UserModel> userCards = [
    UserModel("Avadhesh", "assets/user.png"),
    UserModel("Ram", "assets/user1.png"),
    UserModel("Abhishek", "assets/user2.png"),
    UserModel("Rohan", "assets/user.png"),
    UserModel("Appu", "assets/user1.png"),
    UserModel("Yash", "assets/user2.png"),
  ];

  return userCards;
}
List<CardModel> getCardList() {
  List<CardModel> cardList = [
    CardModel("Avadhesh", "assets/user.png", "Hey!", "11:13 AM"),
    CardModel("Ram", "assets/user1.png", "You: Hi there. Can you help me?", "9:01 AM"),
    CardModel("Abhishek", "assets/user2.png", "Hi, I wanna see you!",  "8:24 PM"),
    CardModel("Rohan", "assets/user.png", "Hey, What's up?",  "7:50 PM"),
    CardModel("Avadhesh", "assets/user.png", "Hey!",  "11:13 AM"),
    CardModel("Ram", "assets/user1.png", "You: Hi there. Can you help me?",  "9:01 AM"),
    CardModel("Abhishek", "assets/user2.png", "Hi, I wanna see you!",  "8:24 PM"),
    CardModel("Rohan", "assets/user.png", "Hey, What's up?", "7:50 PM"),
    CardModel("Avadhesh", "assets/user.png", "Hey!", "11:13 AM"),
    CardModel("Ram", "assets/user1.png", "You: Hi there. Can you help me?", "9:01 AM"),
    CardModel("Abhishek", "assets/user2.png", "Hi, I wanna see you!", "8:24 PM"),
    CardModel("Rohan", "assets/user.png", "Hey, What's up?", "7:50 PM"),
  ];
  return cardList;
}