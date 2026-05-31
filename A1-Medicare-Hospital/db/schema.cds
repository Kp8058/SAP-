namespace hospital.management;

using { hospital.management as common } from './common';

entity Departments {

    key ID    : UUID;
    name      : common.Name;
    floor     : Integer;
    head      : common.Name;
    capacity  : Integer;
    phone     : common.Phone;
    isActive  : Boolean default true;
}

entity Doctors {

    key ID            : UUID;
    firstName         : common.Name;
    lastName          : common.Name;
    specialization    : String(100);
    qualification     : String(100);
    experience        : Integer;
    fee               : common.Amount;
    departmentId      : Association to Departments;
    phone             : common.Phone;
    email             : common.Email;
    availableDays     : String(10);
    isActive          : Boolean default true;
}

entity Patients {

    key ID              : UUID;
    firstName           : common.Name;
    lastName            : common.Name;
    dateOfBirth         : Date;
    gender              : common.Gender;
    bloodGroup          : common.BloodGroup;
    phone               : common.Phone;
    email               : common.Email;
    address             : String(255);
    emergencyContact    : common.Phone;
    registrationDate    : Date;
}

entity Appointments {

    key ID            : UUID;
    patientId         : Association to Patients;
    doctorId          : Association to Doctors;
    appointmentDate   : Date;
    appointmentTime   : Time;
    status            : common.AppointmentStatus default 'Scheduled';
    reason            : String(255);
    notes             : common.MedicalNote;
    fee               : common.Amount;
}

entity MedicalRecords {

    key ID              : UUID;
    patientId           : Association to Patients;
    doctorId            : Association to Doctors;
    appointmentId       : Association to Appointments;
    diagnosis           : String(255);
    prescription        : String(255);
    testRecommended     : String(255);
    recordDate          : Date;
}
 