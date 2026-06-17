// using ProcurementService as service from '../../srv/procurement-service';





// annotate service.Products with @(
//     UI.FieldGroup #GeneratedGroup : {
//         $Type : 'UI.FieldGroupType',
//         Data : [
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'productName',
//                 Value : productName,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'description',
//                 Value : description,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'unitPrice',
//                 Value : unitPrice,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'currency_code',
//                 Value : currency_code,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'stock',
//                 Value : stock,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'minStock',
//                 Value : minStock,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'unit',
//                 Value : unit,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'isActive',
//                 Value : isActive,
//             },
//         ],
//     },
//     UI.Facets : [
//         {
//             $Type : 'UI.ReferenceFacet',
//             ID : 'GeneratedFacet1',
//             Label : 'General Information',
//             Target : '@UI.FieldGroup#GeneratedGroup',
//         },
//         {
//             $Type : 'UI.ReferenceFacet',
//             Label : 'Supplier',
//             ID : 'author',
//             Target : '@UI.FieldGroup#author',
//         },
//     ],
//     UI.LineItem : [
//         {
//             $Type : 'UI.DataField',
//             Label : 'productName',
//             Value : productName,
//         },
//         {
//             $Type : 'UI.DataField',
//             Label : 'description',
//             Value : description,
//         },
//         {
//             $Type : 'UI.DataField',
//             Label : 'unitPrice',
//             Value : unitPrice,
//         },
//         {
//             $Type : 'UI.DataField',
//             Label : 'currency_code',
//             Value : currency_code,
//         },
//         {
//             $Type : 'UI.DataField',
//             Label : 'stock',
//             Value : stock,Criticality : stockCriticality,
//         },
//     ],
//     UI.FieldGroup #author : {
//         $Type : 'UI.FieldGroupType',
//         Data : [
//             {
//                 $Type : 'UI.DataField',
//                 Value : supplier.ID,
//                 Label : 'ID',
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : supplier.email,
//                 Label : 'email',
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : supplier.city,
//                 Label : 'city',
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : supplier.contactPerson,
//                 Label : 'contactPerson',
//             },
//         ],
//     },
// );






// // ═══════════════════════════════════════════════════
// // PRODUCTS — Full Annotation Set
// // ═══════════════════════════════════════════════════
// annotate service.Products with @UI: {
//  // ─── LIST REPORT: Filter Bar ───────────────────
//  SelectionFields: [
//    productName,
//    unitPrice,
//    stock,
//    supplier_ID,
//    isAvailable
//  ],
//  // ─── LIST REPORT: Table Columns ────────────────
//  LineItem: [
//    { Value: productName, Label: 'Product', ![@UI.Importance]: #High },
//    { Value: unitPrice, Label: 'Unit Price' },
//    { Value: stock, Label: 'Stock', Criticality: stockCriticality },
//    { Value: rating, Label: 'Rating' },
//    { Value: supplier.supplierName, Label: 'Supplier' },
  
//    { Value: isAvailable, Label: 'Available' }
//  ],
//  // ─── OBJECT PAGE: Header ───────────────────────
//  HeaderInfo: {
//    TypeName: 'Product',
//    TypeNamePlural: 'Products',
//    Title: { Value: productName },
//    Description: { Value: description }
//  },
//  // ─── OBJECT PAGE: Header KPIs ─────────────────
//  HeaderFacets: [
//    { $Type: 'UI.ReferenceFacet', Target: '@UI.DataPoint#Price' },
//    { $Type: 'UI.ReferenceFacet', Target: '@UI.DataPoint#Stock' },
  
//  ],
//  DataPoint#Price: {
//    Value: price,
//    Title: 'Price'
//  },
//  DataPoint#Stock: {
//    Value: stock,
//    Title: 'In Stock',
//    Criticality: stockCriticality
//  },
//  DataPoint#Rating: {
//    Value: rating,
//    Title: 'Rating',
//    TargetValue: 5,
//    Visualization: #Rating
//  },
//  // ─── OBJECT PAGE: Sections ────────────────────
//  Facets: [
//    {
//      $Type: 'UI.ReferenceFacet',
//      Target: '@UI.FieldGroup#GeneralInfo',
//      Label: 'General Information'
//    },
//    {
//      $Type: 'UI.ReferenceFacet',
//      Target: '@UI.FieldGroup#StockPricing',
//      Label: 'Stock & Pricing'
//    },
//    {
//      $Type: 'UI.ReferenceFacet',
//      Target: '@UI.FieldGroup#Admin',
//      Label: 'Administration'
//    }
//  ],
//  // ─── FIELD GROUPS (Section Content) ────────────
//  FieldGroup#GeneralInfo: {
//    Data: [
//      { Value: productName, Label: 'Product Name' },
//      { Value: description, Label: 'Description' },
//      { Value: supplier.supplierName, Label: 'Supplier' }
//    ]
//  },
//  FieldGroup#StockPricing: {
//    Data: [
//      { Value: unitPrice, Label: 'Unit Price' },
//      { Value: stock, Label: 'Current Stock' },
//      { Value: minStock, Label: 'Minimum Stock Level' },
//      { Value: isAvailable, Label: 'Available for Sale' }
//    ]
//  },
//  FieldGroup#Admin: {
//    Data: [
//      { Value: createdAt, Label: 'Created On' },
//      { Value: createdBy, Label: 'Created By' },
//      { Value: modifiedAt, Label: 'Last Modified' },
//      { Value: modifiedBy, Label: 'Modified By' }
//    ]
//  }
// };






