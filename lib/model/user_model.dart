class User{
  final String uid;
  final String? photoURL;
  final String? email;
  final String? password;
  final String? name;
  final String? age;
  final String? tel;

  User(
    {required this.uid,
      this.photoURL,
      this.email,
      this.password,
      this.name,
      this.age,
      this.tel
    }
  );

 User.fromMap({required Map<String, dynamic> userMap})
      : uid = userMap['uid'],
        photoURL = userMap['photoURL'],
        email = userMap['email'],
        password = userMap['password'],
        name = userMap['name'],
        age = userMap['age'],
        tel = userMap['tel'];

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'photoURL' :photoURL,
        'email': email,
        'password' : password,
        'name': name,
        'age':  age,
        'tel': tel
      };
}