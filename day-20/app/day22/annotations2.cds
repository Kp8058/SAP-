using ProcurementService as service from '../../srv/procurement-service';
annotate service.Products with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'productName',
                Value : productName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'description',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Label : 'unitPrice',
                Value : unitPrice,
            },
            {
                $Type : 'UI.DataField',
                Label : 'currency_code',
                Value : currency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'stock',
                Value : stock,
            },
            {
                $Type : 'UI.DataField',
                Label : 'minStock',
                Value : minStock,
            },
            {
                $Type : 'UI.DataField',
                Label : 'unit',
                Value : unit,
            },
            {
                $Type : 'UI.DataField',
                Label : 'isActive',
                Value : isActive,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Supplier',
            ID : 'author',
            Target : '@UI.FieldGroup#author',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'productName',
            Value : productName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'description',
            Value : description,
        },
        {
            $Type : 'UI.DataField',
            Label : 'unitPrice',
            Value : unitPrice,
        },
        {
            $Type : 'UI.DataField',
            Label : 'currency_code',
            Value : currency_code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'stock',
            Value : stock,Criticality : stockCriticality,
        },
    ],
    UI.FieldGroup #author : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : supplier.ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.email,
                Label : 'email',
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.city,
                Label : 'city',
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.contactPerson,
                Label : 'contactPerson',
            },
        ],
    },
);

annotate service.Products with {
    supplier @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Suppliers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : supplier_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'supplierName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'contactPerson',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'email',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'phone',
            },
        ],
    }
};

