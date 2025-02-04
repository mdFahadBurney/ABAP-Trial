@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assignment 3 Header Projection View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity Z_I_HEADER_PROJ_11563
 as projection on Z_I_HEADER_11563
{
@Search.defaultSearchElement: true
    key Docno,
    CompCd,
    PurchOrg,
    @Consumption.valueHelpDefinition: [{ entity:{name: 'I_CurrencyText', element: 'Currency' } }]
    Currency,
    SupplierNo,
    @Consumption.valueHelpDefinition: [{ entity:{name: 'Z_I_STATUS_DOM_11563', element: 'Value' } }]
    
    Status,
    ChangedAt,
    CreatedAt,
    CreatedBy,
    /* Associations */
    _item : redirected to composition child Z_I_ITEM_PROJ_11563,
    _address : redirected to composition child Z_I_ADDRESS_PROJ_11563
    
}
