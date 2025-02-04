@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assignment 1 Address CDS View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_I_ADDRESS_R_11563 as select from ztm_address_1563
association to parent Z_I_HEADER_11563 as _header on $projection.Docno = _header.Docno
{
key docno as Docno, //Document Number
 key address_no as AddressNo, //Address Number
 name as Name, //Name
 street_addr as StreetAddress, //Street Address
 city as City, //City
 country as Country,//Country
 contact_no as ContactNo, //CotactNumber
 
 //Making Association as Public
 _header
}
