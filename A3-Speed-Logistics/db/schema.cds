namespace logistics.fleet;
using { logistics.fleet as common } from './common';
entity Vehicles {

    key ID           : UUID;
    registrationNumber: String(20);
    type             : common.VehicleType;
    make             : String(50);
    model            : String(50);
    year             : Integer;
    capacity         : Integer;
    fuelType         : common.FuelType;
    status           : common.VehicleStatus default 'Available';
    lastServiceDate  : Date;
    mileage          : Integer;
    insuranceExpiry  : Date;
}

entity Drivers {

    key ID           : UUID;
    name             : String(100);
    licenseNumber    : String(50);
    licenseExpiry    : Date;
    phone            : common.Phone;
    email            : common.Email;
    experience       : Integer;
    rating           : common.Rating;
    status           : common.DriverStatus;
    vehicle          : Association to Vehicles;
    joinDate         : Date;

}

entity Customers {

    key ID           : UUID;
    name             : String(100);
    company          : String(100);
    phone            : common.Phone;
    email            : common.Email;
    address          : common.Address;
    city             : common.City;
    pincode          : String(10);
    gstNumber        : String(20);
    tier             : common.CustomerTier;
}

entity Shipments {

    key ID           : UUID;
    trackingNumber   : String(20);
    customer         : Association to Customers;
    driver           : Association to Drivers;
    vehicle          : Association to Vehicles;
    pickupAddress    : common.Address;
    deliveryAddress  : common.Address;
    pickupCity       : common.City;
    deliveryCity     : common.City;
    weight           : Integer;
    status           : common.ShipmentStatus default 'Booked';
    deliveredAt      : DateTime;
    charges          : common.Amount;
    paymentStatus    : common.PaymentStatus default 'Pending';

}

entity Routes {

    key ID           : UUID;
    fromCity         : common.City;
    toCity           : common.City;
    distance         : common.Distance;
    estimatedHours   : Decimal(5, 2);
    tollCharges      : common.Amount;
    isActive         : Boolean;

}

entity ServiceRecords {

    key ID           : UUID;
    vehicle          : Association to Vehicles;
    serviceDate      : Date;
    serviceType      : String(50);
    cost             : common.Amount;
    description      : String(255);
    nextServiceDate  : Date;
   
    
}
 