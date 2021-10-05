class CardModel{
  String _name,_userPic, _latestMessage, _timeStamp;


  CardModel(this._name, this._userPic, this._latestMessage, this._timeStamp, );

  String get name => _name;
  String get latestMessage => _latestMessage;
  String get timeStamp => _timeStamp;

  get profilePic => _userPic;

}