@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Company Code Projection View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_I_COMP_PROJ_11563
  provider contract transactional_query as projection on Z_I_COMPANY_11563
{
    key CompanyCode,
    PurchOrg,            // Purchasing Organization
    CompanyCodeText
}
