@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Currency Code CDS View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity Z_I_CURRENCY_11563 as select from ztm_curr_11563
{
    key currency_code as CurrencyCode,  //Currency Code
    curr_text as CurrText   //Currency Text
}
