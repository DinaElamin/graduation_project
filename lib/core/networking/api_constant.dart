class ApiConstant {
 static const String apiBaseUrl = "http://ablexav1.runasp.net/";
 static const String login = "api/User/login";
 static const String getAllTeacherData = "api/User/getallteachers";
 static const String getAllStudentData = "api/User/getallstudentd";
 static const String getAllClassesData = "api/PClass/getallclasses";
 static const String getAllStudentByClassId = "api/User/getstudentsbyclass";
 static const String verifyCode = "api/User/send_reset_code";
 static const String verifyPinCode ="api/User/verify_pin";

}

class ApiErrors {
 static const String badRequestError = 'badRequestError';
 static const String noContent = 'noContent';
 static const String forbiddenError = 'forbiddenError';
 static const String unauthorizedError = 'unauthorizedError';
 static const String notFoundError = 'notFoundError';
 static const String conflictError = 'conflictError';
 static const String internalServerError = 'internalServerError';
 static const String unknownError = 'unknownError';
 static const String timeoutError = 'timeoutError';
 static const String defaultError = 'defaultError';
 static const String cacheError = 'cacheError';
 static const String noInternetError = 'noInternetError';
 static const String loadingMessage = 'loadingMessage';
 static const String retryAgainMessage = 'retryAgainMessage';
 static const String ok = 'ok';
}