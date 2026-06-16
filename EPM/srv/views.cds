
using {epm.views as views} from '../db/views';

service ReportService {

@readonly
entity ProductCatalog as projection on  views.ProductCatalog;
@readonly
entity OrderReport as projection on views.OrderReport;
@readonly
entity LowStockAlert as projection on views.LowStockAlert;

}

