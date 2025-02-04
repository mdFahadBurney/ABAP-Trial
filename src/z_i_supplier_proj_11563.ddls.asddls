@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Supplier CDS View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_I_SUPPLIER_PROJ_11563 
provider contract transactional_query as projection on Z_I_SUPPLIER_11563
{
    key SupplierNo,
    SuppName,       // Supplier Name
    CompCode,      // Company Code
    Country,
    SuppGroup,  // Supplier Group
    ValidUpto       //Valid Upto
}
