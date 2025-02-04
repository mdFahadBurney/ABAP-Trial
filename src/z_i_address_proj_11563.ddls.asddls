@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assignment 3 Address Projection View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity Z_I_ADDRESS_PROJ_11563  
 as projection on Z_I_ADDRESS_11563
{
key Docno,
key AddressNo,
Name,
StreetAddr,
City,
Country,
ContactNo,
/* Associations */
_header : redirected to parent Z_I_HEADER_PROJ_11563

}
