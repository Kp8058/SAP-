namespace hospital.management;

type Name        : String(100);
type Phone       : String(20);
type Email       : String(255);
type Amount      : Decimal(15, 2);
type MedicalNote : String(1000);

type Gender : String enum {
   Male;
   Female;
   Other;
};

type BloodGroup : String enum {

   A_Positive='A+';
   A_Negative='A-';
   B_Positive='B+';
   B_Negative='B-';
   AB_Positive='AB+';
   AB_Negative='AB-';
   O_Positive='O+';
   O_Negative='O-';
};

type AppointmentStatus : String enum {
   Scheduled;
   Completed;
   Cancelled;
   NoShow;
};