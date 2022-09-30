class GoogleModel{
  String userName ='';
  String password ='';
  String userEmail ='';
 GoogleModel({required this.userEmail,required this.password,required this.userName});
 Map<String,String>toJson(){
  return
  {
    "email" : userEmail,
    "fullname" : userName,
    "password" : password
  };
  }
}