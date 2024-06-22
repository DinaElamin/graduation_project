class ApiConstant {
 static const String apiBaseUrl = "http://ablexav1.runasp.net/";
 static const String login = "api/User/login";
 static const String getAllTeacherData = "api/User/getallteachers";
 static const String getAllStudentData = "api/User/getallstudentd";
 static const String getAllClassesData = "api/PClass/getallclasses";
 static const String getViolenceData = "api/GettingAttendance/getBehavior";
 static const String getAllStudentByClassId = "api/User/getstudentsbyclass";
 static const String verifyCode = "api/User/send_reset_code";
 static const String verifyPinCode ="api/User/verify_pin";
 static const String changePassword  ="api/User/forget_password";
 static const String addTeacher = "api/User/addteacher";
 static const String addStudent ="api/User/addStudent";
 static const String deleteUser = "api/User/deleteuser";
 static const String getAllSemester = "api/Term/getallSemester";
 static const String getAllYear = "api/Year/getallyears";
 static const String getAllMaterials = "api/defaultMaterial/getallmaterialsNamesAndIds";
 static const String editStudentProfile = "api/User/editstudent";
 static const String getStudentById = "api/User/getStudentById";
 static const String addYear = "api/Year/addyear";
 static const String addExam = "api/Exam/addexams";
 static const String deleteGrade = "api/Year/deleteyear";
 static const String editTeacherProfile ="api/User/editTeacher";
 static const String addClass = "api/PClass";
 static const String addMaterialGrade ="api/Material/addMaterialGrade";
 static const String getSemesterByYearId ="api/Term/getSemesterbyYear";
 static const String getAllMaterialByTermId ="api/Material/getmaterials";
 static const String getAllTeacherById = "api/User/getTeacherById";
 static const String getMaterialByTeacherId = "api/Material/GetMaterialsByTeacherId";
 static const String getStudentMaterialGrade = "api/Material/getstudentmaterialgrade";
 static const String getStudentAttendance = "api/GettingAttendance/getAttendanceOneStudent?";
 static const String getStudentGradesDetailsForOneMaterial = "api/Material/getStudentGradesDetailsForOneMaterial";
 static const String addGrade = "api/StudentGrades/addgrades";
 static const String editGradeExam = "api/StudentGrades/updategrade";
 static const String getClassesByTeacherId ="api/PClass/getClassesByTeacherId";
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