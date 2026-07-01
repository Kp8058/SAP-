
using com.epm from '../db/schema';
//using epm.views from '../db/views';

service SalesService {

entity Products as projection on epm.Products {
 ID,
 name,
 description,
 price,
 currency,
 stock,
 rating,
 supplier,
 category
};



entity Customers as projection on epm.Customers;
 entity SalesOrders as projection on epm.SalesOrders
   actions {
     action confirm() returns { status: String; message: String; };
     action cancel(reason: String(500)) returns { status: String; message: String; };
     action ship(trackingNumber: String(50), carrier: String(50)) returns { status: String; };
   };

entity SalesOrderItems as projection on epm.SalesOrderItems;


 // Bound action — tied to SalesOrders entity
 // "You can call this action ON a specific order"

 action confirmOrder() returns {
   status  : String(20);
   message : String(200);
 };
 action cancelOrder(
   reason : String(500)       // Why are you cancelling?
 ) returns {
   status  : String(20);
   message : String(200);
   refundAmount : Decimal(12,2);
 };
 action shipOrder(
   trackingNumber : String(50),
   carrier        : String(50)
 ) returns {
   status       : String(20);
   message      : String(200);
   estimatedDelivery : Date;
 };
}





service AdminService {

entity Suppliers as projection on epm.Suppliers;
entity Categories as projection on epm.Categories;
entity Products as projection on epm.Products;
entity Customers as projection on epm.Customers;
entity SalesOrders as projection on epm.SalesOrders;
entity SalesOrderItems as projection on epm.SalesOrderItems;
entity PurchaseOrders as projection on epm.PurchaseOrders;
entity PurchaseOrderItems as projection on epm.PurchaseOrderItems;
}

// service ReportingService {
//    @readonly entity ProductCatalogReport as projection on epm.views.ProductCatalog;
//    @readonly entity OrderReport as projection on epm.views.OrderReport;
//    @readonly entity LowStockAlert as projection on epm.views.LowStockAlert;

// }

// service AnalyticsService @(path: '/analytics') {

//  // Unbound action — belongs to the service, not an entity
//  action GenerateReport(
//    reportType : String(20),     // Input parameter
//    startDate  : Date,          // Input parameter
//    endDate    : Date            // Input parameter
//  ) returns {                    // Output
//    reportId   : UUID;
//    status     : String(20);
//    message    : String(200)
//  };
//  // Another unbound action — no parameters
//  action PingHealth() returns {
//    status    : String(10);
//    timestamp : DateTime;
//    version   : String(20)
//  };


// }

