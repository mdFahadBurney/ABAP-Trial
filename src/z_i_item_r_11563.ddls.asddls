@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assignment 1 Item CDS View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions : true

define view entity Z_I_ITEM_R_11563 as select from ztd_item_e1156
association to parent Z_I_HEADER_11563 as _header on  $projection.Docno = _header.Docno

{
    key docno as Docno,     // Docnument Number
    key item_no as ItemNo, 
    status as Status,       // Status Code
    @Semantics.amount.currencyCode: 'Currency'
    item_amt as ItemAmt,       // Item Amount
    @Semantics.amount.currencyCode: 'Currency'
    tax_amt as TaxAmt,         // Tax Amount
   @Semantics.quantity.unitOfMeasure : 'UOM'
    quantity as Quantity,
    currency as Currency,
    unit_of_measure as UOM,      // Unit Of Measure
    changed_at as ChangedAt,
    created_at as CreatedAt,
    created_by as CreatedBy,
    
    // Association must be Public
    _header
}
