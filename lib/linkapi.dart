class ApiLink {
  //=======================Route===========================

  // static const server = "http://192.168.1.103/firstproject";
  static const server = "https://192.168.1.106/firstproject";
  // static const server =
  //     "https://firstprojectflutter.000webhostapp.com/firstproject";
  //=======================Auth===========================

  static const login = "$server/auth/login.php";
  static const signup = "$server/auth/signup.php";
  static const verifycodesignup = "$server/auth/verifycodesignup.php";
  static const resendverifycode = "$server/auth/resendverifycode.php";

  static const verifycoderesetpassword =
      "$server/auth/resetpassword/verifycoderesetpassword.php";
  static const resendverifycoderesetpassword =
      "$server/auth/resetpassword/resendverifycoderesetpassword.php";
  static const forgetpassword = "$server/auth/resetpassword/forgetpassword.php";
  static const resetpassword = "$server/auth/resetpassword/resetpassword.php";
}
