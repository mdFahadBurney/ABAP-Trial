@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assignment 5 Company CDS View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity Z_I_COMPANY_11563 as select from ztm_comp_11563
{
    key comp_code as CompanyCode,   
    purch_org as PurchOrg,          // Purchasing Organization
    comp_code_txt as CompanyCodeText
}
