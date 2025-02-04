@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Assignment 5.3 Supplier CDS'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_I_SUPPLIER_11563 as select from ztm_supp_11563
{
    key supplier_no as SupplierNo,  //Supplier Number
    supp_name as SuppName,          // Supplier Name
    comp_code as CompCode,          // Company Code
    country as Country,             // Country
    supp_group as SuppGroup,        // Supplier Group
    valid_upto as ValidUpto         // Valid Upto
}
