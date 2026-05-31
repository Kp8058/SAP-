using { platform.events as common } from './common';
namespace platform.events;
entity Venues {
   key ID          : UUID;
   name            : common.Name;
   address         : String;
   city            : String;
   capacity        : Integer;
   type            : String enum { Auditorium; ConferenceHall; Outdoor; Virtual };
   amenities       : String;
   hourlyRate      : common.Amount;
   contactPerson   : common.Name;
   phone           : common.Phone;
   isActive        : Boolean default true;
}
entity Events {
   key ID          : UUID;
   title           : String;
   description     : String;
   eventType       : String enum { Conference; Workshop; Seminar; Webinar; Meetup };
   venue           : Association to Venues;
   startDate       : Date;
   endDate         : Date;
   startTime       : Time;
   endTime         : Time;
   maxAttendees    : Integer;
   registeredCount : Integer default 0;
   ticketPrice     : common.Amount;
   status          : String enum { Draft; Published; Ongoing; Completed; Cancelled } default 'Draft';
   organizerName   : common.Name;
   organizerEmail  : common.Email;
   tags            : String;
}
entity Speakers {
   key ID          : UUID;
   name            : common.Name;
   email           : common.Email;
   phone           : common.Phone;
   bio             : String;
   company         : String;
   designation     : String;
   expertise       : String;
   photoUrl        : common.URL;
   rating          : common.Rating;
   totalTalks      : Integer;
   isActive        : Boolean default true;
}
entity EventSpeakers {
   key event       : Association to Events;
   key speaker     : Association to Speakers;
   topic           : String;
   sessionTime     : Time;
   sessionDuration : Integer;
   roomNumber      : String;
}
entity Registrations {
   key ID          : UUID;
   event           : Association to Events;
   attendeeName    : common.Name;
   attendeeEmail   : common.Email;
   attendeePhone   : common.Phone;
   company         : String;
   ticketType      : String enum { General; VIP; Student };
   registrationDate: DateTime;
   status          : String enum { Confirmed; Cancelled; Waitlisted; Attended } default 'Confirmed';
   amountPaid      : common.Amount;
   paymentId       : String;
}
entity Feedback {
   key ID          : UUID;
   event           : Association to Events;
   attendeeEmail   : common.Email;
   overallRating   : common.Rating;
   contentRating   : common.Rating;
   venueRating     : common.Rating;
   speakerRating   : common.Rating;
   comment         : String;
   submittedAt     : DateTime;
}