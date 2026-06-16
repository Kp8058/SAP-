using AdminService as service from '../../srv/sales-service';
using from '@sap/cds/common';


 
annotate service.PurchaseOrders with @UI: {
 
    SelectionFields: [
        poNumber,status,supplier_ID,
    ],
 
    LineItem: [
        { Value: poNumber, Label: 'PO Number' },
        { Value: supplier.name, Label: 'Supplier' },
        { Value: orderDate, Label: 'Order Date' },
        { Value: amount, Label: 'Amount' },
        { $Type:'UI.DataField',Value: status, Label: 'Status', Criticality: statusCriticality }
    ],
 
    HeaderInfo: {
        TypeName: 'Purchase Order',
        TypeNamePlural: 'Purchase Orders',
        Title: { Value: poNumber },
        Description: { Value: supplier.name }
    },
 
    HeaderFacets: [
        { $Type: 'UI.ReferenceFacet', Target: '@UI.DataPoint#Amount' },
        { $Type: 'UI.ReferenceFacet', Target: '@UI.DataPoint#Status' },
    ],
 
    DataPoint#Amount: {
        Value: amount,
        Title: 'Total Amount'
    },
 
    DataPoint#Status: {
        Value: status,
        Title: 'Status',
        Criticality: statusCriticality
    },
 
    Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#General',
            Label: 'General Information'
        },
        {
            $Type: 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#Dates',
            Label: 'Dates & Delivery'
        },
        {
            $Type: 'UI.ReferenceFacet',
            Target: 'items/@UI.LineItem',
            Label: 'Line Items'
        }
    ],
 
    FieldGroup#General: {
        Data: [
            { Value: poNumber, Label: 'PO Number' },
            { Value: supplier_ID, Label: 'Supplier' },
            { Value: status, Label: 'Status' },
            { Value: amount, Label: 'Amount' },
            { Value: totalBudget, Label: 'Total Budget' },
        ]
    },
 
    FieldGroup#Dates: {
        Data: [
            { Value: orderDate, Label: 'Order Date' },
            { Value: expectedDate, Label: 'Expected Delivery' },
            { Value: createdAt, Label: 'Created On' },
            { Value: createdBy, Label: 'Created By' }
        ]
    },
 
    Identification: [
        {
            $Type: 'UI.DataFieldForAction',
            Action: 'PurchasingService.submit',
            Label: 'Submit for Approval'
        },
        {
            $Type: 'UI.DataFieldForAction',
            Action: 'PurchasingService.approve',
            Label: 'Approve'
        },
        {
            $Type: 'UI.DataFieldForAction',
            Action: 'PurchasingService.reject',
            Label: 'Reject'
        }
    ]
};
 
annotate service.PurchaseOrders with {
 
    supplier @(
        Common : {
            Text : supplier.name,
            TextArrangement : #TextOnly,
            ValueList : {
                CollectionPath : 'Suppliers',
                Parameters : [
                    {
                        $Type : 'Common.ValueListParameterInOut',
                        LocalDataProperty : supplier_ID,
                        ValueListProperty : 'ID'
                    }
                ]
            }
        },
        Common.ValueListWithFixedValues : true,
        Common.Label : 'supplier_ID',
    );
 
    status @(
        Common.ValueListWithFixedValues,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'PurchaseOrders',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : status,
                    ValueListProperty : 'status',
                },
            ],
        },
    );
};
 
annotate service.PurchaseOrderItems with @UI: {
 
    LineItem: [
        { Value: product.name, Label: 'Product' },
        { Value: quantity, Label: 'Quantity' },
     
    ],
 
    HeaderInfo: {
        TypeName: 'PO Item',
        TypeNamePlural: 'PO Items',
        Title: { Value: product.name },
        Description: { Value: quantity }
    },
 
    Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#ItemDetail',
            Label: 'Item Details'
        }
    ],
 
    FieldGroup#ItemDetail: {
        Data: [
            { Value: product_ID, Label: 'Product' },
            { Value: quantity, Label: 'Ordered Qty' },
            { Value: unitPrice, Label: 'Unit Price' },
            { Value: totalPrice, Label: 'Total' },
        ]
    }

    
};
 
annotate service.PurchaseOrderItems with {
 
    product @(
        Common : {
            Text : product.name,
            TextArrangement : #TextOnly,
            ValueList : {
                CollectionPath : 'Products',
                Parameters : [
                    {
                        $Type : 'Common.ValueListParameterInOut',
                        LocalDataProperty : product_ID,
                        ValueListProperty : 'ID'
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'name'
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'unitPrice'
                    }
                ]
            }
        }
    );
};
 
 
annotate service.PurchaseOrderItems with @(
 Common.SideEffects: {
   SourceProperties: ['quantity', 'unitPrice'],    // When these change...
   TargetProperties: ['totalPrice']                // ...refresh this
 }
);





// // ═══════════════════════════════════════════════════

// // PURCHASE ORDERS — List Report + Object Page

// // ═══════════════════════════════════════════════════

// annotate service.PurchaseOrders with @UI: {

//   // ─── FILTER BAR ────────────────────────────────

//   SelectionFields: [ poNumber ],

//   // ─── TABLE COLUMNS ─────────────────────────────

//   LineItem: [

//     { Value: poNumber, Label: 'PO Number' },

//     { Value: supplier.supplierName, Label: 'Supplier' },

//     { Value: orderDate, Label: 'Order Date' },

//     { Value: totalAmount, Label: 'Amount', },


//     { Value: status, Label: 'Status', Criticality: statusCriticality },

//   ],

//   // ─── OBJECT PAGE HEADER ────────────────────────

//   HeaderInfo: {

//     TypeName: 'Purchase Order',

//     TypeNamePlural: 'Purchase Orders',

//     Title: { Value: poNumber },

//     Description: { Value: supplier.supplierName }

//   },

//   // ─── HEADER KPIs ──────────────────────────────

//   HeaderFacets: [

//     { $Type: 'UI.ReferenceFacet', Target: '@UI.DataPoint#Amount' },

//     { $Type: 'UI.ReferenceFacet', Target: '@UI.DataPoint#Status' },

//     { $Type: 'UI.ReferenceFacet', Target: '@UI.DataPoint#Priority' }

//   ],

//   DataPoint#Amount: { Value: totalAmount, Title: 'Total Amount' },

//   DataPoint#Status: { Value: status, Title: 'Status', Criticality: statusCriticality },


//   // ─── PAGE SECTIONS ─────────────────────────────

//   Facets: [

//     { $Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#General', Label: 'General Information' },

//     { $Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Dates', Label: 'Dates & Delivery' },

//     { $Type: 'UI.ReferenceFacet', Target: 'items/@UI.LineItem', Label: 'Line Items' }

//   ],

//   FieldGroup#General: {

//     Data: [

//       { Value: poNumber, Label: 'PO Number' },

//       { Value: supplier_ID, Label: 'Supplier' },

//       { Value: status, Label: 'Status' },

//       { Value: totalAmount, Label: 'Total Amount' },

//       { Value: notes, Label: 'Notes' }

//     ]

//   },

//   FieldGroup#Dates: {

//     Data: [

//       { Value: orderDate, Label: 'Order Date' },

//       { Value: expectedDate, Label: 'Expected Delivery' },

//       { Value: createdAt, Label: 'Created On' },

//       { Value: createdBy, Label: 'Created By' }

//     ]

//   },

//   // ─── ACTIONS (Buttons on Object Page) ──────────

//   Identification: [

//     { $Type: 'UI.DataFieldForAction', Action: 'PurchasingService.submit', Label: 'Submit for Approval' },

//     { $Type: 'UI.DataFieldForAction', Action: 'PurchasingService.approve', Label: 'Approve' },

//     { $Type: 'UI.DataFieldForAction', Action: 'PurchasingService.reject', Label: 'Reject' }

//   ]

// };

// // ─── VALUE HELPS ─────────────────────────────────

// annotate service.PurchaseOrders with {

//   supplier @(

//     Common: {

//       Text: supplier.supplierName,

//       TextArrangement: #TextOnly,

//       ValueList: {

//         CollectionPath: 'Suppliers',

//         Parameters: [

//           { $Type: 'Common.ValueListParameterInOut', LocalDataProperty: supplier_ID, ValueListProperty: 'ID' },

//           { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'supplierName' },

//           { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'city' }

//         ]

//       }

//     }

//   );

//   status @Common.ValueListWithFixedValues;

//   // priority @Common.ValueListWithFixedValues, --- IGNORE ---;

// };

// // ═══════════════════════════════════════════════════

// // PO ITEMS — Table in PO + Sub-Object Page

// // ═══════════════════════════════════════════════════

// annotate service.PurchaseOrderItems with @UI: {

//   // Shown as table in PO Object Page

//   LineItem: [

//     { Value: product.productName, Label: 'Product' },

//     { Value: quantity, Label: 'Quantity' },

//     { Value: unitPrice, Label: 'Unit Price' },

//     { Value: totalPrice, Label: 'Total' },

//     { Value: receivedQty, Label: 'Received' }

//   ],

//   // When item has its own detail page

//   HeaderInfo: {

//     TypeName: 'PO Item',

//     TypeNamePlural: 'PO Items',

//     Title: { Value: product.productName },

//     Description: { Value: quantity }

//   },

//   Facets: [

//     { $Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#ItemDetail', Label: 'Item Details' }

//   ],

//   FieldGroup#ItemDetail: {

//     Data: [

//       { Value: product_ID, Label: 'Product' },

//       { Value: quantity, Label: 'Ordered Qty' },

//       { Value: unitPrice, Label: 'Unit Price' },

//       { Value: totalPrice, Label: 'Line Total' },

//       { Value: receivedQty, Label: 'Received Qty' },

//       { Value: notes, Label: 'Notes' }

//     ]

//   }

// };

// // Product value help for items

// annotate service.PurchaseOrderItems with {

//   product @(

//     Common: {

//       Text: product.productName,

//       TextArrangement: #TextOnly,

//       ValueList: {

//         CollectionPath: 'Products',

//         Parameters: [

//           { $Type: 'Common.ValueListParameterInOut', LocalDataProperty: product_ID, ValueListProperty: 'ID' },

//           { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'productName' },

//           { $Type: 'Common.ValueListParameterDisplayOnly', ValueListProperty: 'unitPrice' }

//         ]

//       }

//     }

//   );

// };
 





// using AdminService as service from '../../srv/sales-service';

// annotate service.PurchaseOrders with @(
//     UI.FieldGroup #GeneratedGroup : {
//         $Type : 'UI.FieldGroupType',
//         Data : [
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'poNumber',
//                 Value : poNumber,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'orderDate',
//                 Value : orderDate,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'totalAmount',
//                 Value : totalAmount,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'taxAmount',
//                 Value : taxAmount,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'netAmount',
//                 Value : netAmount,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'currency_code',
//                 Value : currency_code,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'status',
//                 Value : status,
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
//             Label : 'sales',
//             ID : 'sales',
//             Target : '@UI.FieldGroup#sales',
//         },
//     ],
//     UI.LineItem : [
//         {
//             $Type : 'UI.DataField',
//             Label : 'poNumber',
//             Value : poNumber,
//         },
//         {
//             $Type : 'UI.DataField',
//             Label : 'orderDate',
//             Value : orderDate,
//         },
//         {
//             $Type : 'UI.DataField',
//             Label : 'totalAmount',
//             Value : totalAmount,
//         },
//         {
//             $Type : 'UI.DataField',
//             Label : 'taxAmount',
//             Value : taxAmount,
//         },
//         {
//             $Type : 'UI.DataField',
//             Label : 'netAmount',
//             Value : netAmount,
//         },
//     ],
//     UI.SelectionFields : [
//         poNumber,
//     ],
//     UI.FieldGroup #sales : {
//         $Type : 'UI.FieldGroupType',
//         Data : [
//         ],
//     },
// );

// annotate service.PurchaseOrders with {
//     supplier @Common.ValueList : {
//         $Type : 'Common.ValueListType',
//         CollectionPath : 'Suppliers',
//         Parameters : [
//             {
//                 $Type : 'Common.ValueListParameterInOut',
//                 LocalDataProperty : supplier_ID,
//                 ValueListProperty : 'ID',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'name',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'contact',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'email',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'phone',
//             },
//         ],
//     }
// };

// annotate service.PurchaseOrders with {
//     poNumber @(
//         Common.Label : 'poNumber',
//         Common.ValueList : {
//             $Type : 'Common.ValueListType',
//             CollectionPath : 'PurchaseOrders',
//             Parameters : [
//                 {
//                     $Type : 'Common.ValueListParameterInOut',
//                     LocalDataProperty : poNumber,
//                     ValueListProperty : 'poNumber',
//                 },
//             ],
//         },
//         Common.ValueListWithFixedValues : true,
//     )
// };

// annotate service.PurchaseOrders with {
//     poNumber @(
//         Common.ValueList : {
//             $Type : 'Common.ValueListType',
//             CollectionPath : 'PurchaseOrders',
//             Parameters : [
//                 {
//                     $Type : 'Common.ValueListParameterInOut',
//                     LocalDataProperty : poNumber,
//                     ValueListProperty : 'poNumber',
//                 },
//             ],
//         },
//         Common.ValueListWithFixedValues : true,
//         Common.Text : currency_code,
// )};

annotate service.PurchaseOrders with {
    poNumber @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'PurchaseOrders',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : poNumber,
                    ValueListProperty : 'poNumber',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
)};

