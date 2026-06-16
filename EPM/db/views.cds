namespace epm.views;
using com.epm from './schema';

view ProductCatalog as select from epm.Products {
 ID,
 name,
 price,
 supplier.name as supplierName,
 category.name as categoryName,

 case
   when stock <= minStock
   then 'LOW'
   else 'AVAILABLE'
 end as stockStatus : String
};

view OrderReport as select from epm.SalesOrders {
 orderNumber,
 customer.name as customerName,
 totalAmount,
 orderDate,
 status
};

view LowStockAlert as select from epm.Products {
 name,
 stock,
 minStock,

 supplier.name as supplierName,
 supplier.contact as supplierContact,
 supplier.phone as supplierPhone
}
where stock <= minStock;

