@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assignment 4 Status View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_I_STATUS_R_11563 as select from ztm_status_11563 as _status
association[1..*] to  Z_I_HEADER_11563 as _header on _header.Status = _status.status_cd
{
key language as LanguageKey, // Language Key
key status_cd as StatusCode, // Status Code
statustext as Statustext,   // Status Text

//Making Associations Public
_header
    
}
