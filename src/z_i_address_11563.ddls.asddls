@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assignment 1 Address CDS View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_I_ADDRESS_11563
  as select from ztd_address_1156
  association to parent Z_I_HEADER_11563 as _header on $projection.Docno = _header.Docno
{
  key docno       as Docno,
  key address_no  as AddressNo,
      name        as Name,
      street_addr as StreetAddr,
      city        as City,
      country     as Country,
      contact_no  as ContactNo,

      // Association as Public
      _header

}
