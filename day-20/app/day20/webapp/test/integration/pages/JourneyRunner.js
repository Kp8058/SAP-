sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"day20/test/integration/pages/PurchaseOrdersList",
	"day20/test/integration/pages/PurchaseOrdersObjectPage",
	"day20/test/integration/pages/PurchaseOrderItemsObjectPage"
], function (JourneyRunner, PurchaseOrdersList, PurchaseOrdersObjectPage, PurchaseOrderItemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('day20') + '/test/flp.html#app-preview',
        pages: {
			onThePurchaseOrdersList: PurchaseOrdersList,
			onThePurchaseOrdersObjectPage: PurchaseOrdersObjectPage,
			onThePurchaseOrderItemsObjectPage: PurchaseOrderItemsObjectPage
        },
        async: true
    });

    return runner;
});

