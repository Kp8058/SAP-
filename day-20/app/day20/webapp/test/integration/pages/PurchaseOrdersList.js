sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'day20',
            componentId: 'PurchaseOrdersList',
            contextPath: '/PurchaseOrders'
        },
        CustomPageDefinitions
    );
});