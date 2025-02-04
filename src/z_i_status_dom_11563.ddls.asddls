@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Status Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_I_STATUS_DOM_11563 as select from
 DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name : 'ZTSTATUS_ST')
{
    key domain_name,
    key value_position,
    @Semantics.language: true
    key language,
    value_low as Value,
    @Semantics.text: true
    text as Description
}
