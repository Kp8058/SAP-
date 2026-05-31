namespace edu.university;
using { edu.university as common } from './common';
entity Departments {
   key code : String(10);
   name : String(100);
   building : String(50);
   headProfessor : String(100);
   establishedYear : Integer;
}
entity Professors {
   key professorId : UUID;
   firstName : String(50);
   lastName : String(50);
   email : common.Email;
   phone : common.Phone;
   departmentCode : String(10);
   designation : String(20); 
   joinDate : Date;
   salary : Decimal(10, 2);
   officeRoom : String(10);
}
entity Courses {
   key courseCode : String(10);
   title : String(100);
   description : String(255);
   credits : Integer;
   maxStudents : Integer;
   currentEnrolled : Integer default 0;
   semester : common.Semester;
   departmentCode : String(10);
   professorId : UUID;
   schedule : String(50);
   roomNumber : String(10);
   isActive : Boolean default true;
}
entity Students {
   key rollNumber : String(20);
   firstName : String(50);
   lastName : String(50);
   email : common.Email;
   phone : common.Phone;
   dateOfBirth : Date;
   admissionYear : Integer;
   currentSemester : common.Semester;
   cgpa : common.GradePoint;
   departmentCode : String(10);
   isActive : Boolean default true;
}
entity Enrollments {
   key studentId : String(20); // References Students.rollNumber
   key courseCode : String(10); // References Courses.courseCode
   enrollmentDate : Date;
   status : String(20) default 'Enrolled'; // Enum
   grade : String(1); 
   gradePoints : common.GradePoint;
   attendancePercent : common.Percentage;
}
entity exams {
   key examId : UUID;
   courseCode : String(10);
   examType : String(20); // Enum: Midterm, Final, Quiz
   date : Date;
   durationMinutes : Integer;
   maxMarks : Integer;
   weightagePercent : common.Percentage;
}