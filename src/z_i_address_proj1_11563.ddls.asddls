@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assignment 3 Address Projection View'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_I_ADDRESS_PROJ1_11563 
provider contract transactional_query
as projection on Z_I_ADDRESS_R_11563
{
    key Docno,
    key AddressNo,
    Name,
    StreetAddress,
    City,
    Country,
    ContactNo
}
