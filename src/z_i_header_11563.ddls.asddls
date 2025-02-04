@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assignment 1 Header CDS View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity Z_I_HEADER_11563 as select from ztm_header_e1156
composition[1..*] of Z_I_ITEM_R_11563 as _item 
composition[1..*] of Z_I_ADDRESS_11563 as _address    
association[1] to I_CurrencyText as _currency on _currency.Currency = $projection.Currency
                                                and _currency.Language = $session.system_language
association[1] to Z_I_STATUS_R_11563 as _status on _status.StatusCode = $projection.Status
                                                 and _status.LanguageKey = $session.system_language
{
@Search.defaultSearchElement: true
key docno as Docno,      //Document Number
comp_cd as CompCd,       //Company Code
purch_org as PurchOrg,   // Purchasing Organization
currency as Currency,    //Currency
supplier_no as SupplierNo, //Supplier Number
@Consumption.valueHelpDefinition: [{ entity : { name : 'Z_I_STATUS_DOM_11563' , element: 'Value'  } }]
status as Status,          // Status
changed_at as ChangedAt,   //Changed At
created_at as CreatedAt,   //Created At
created_by as CreatedBy,   //Created By

// Make Associations Public
_item,
_address,
_status,
_currency

//:redirected to  child z_i_item_r_11563

}
