@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Currency Code Projection View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_I_CURRENCY_PROJ_11563 provider contract transactional_query
as projection on Z_I_CURRENCY_11563
{
    key CurrencyCode as CurrencyCode, //CurrencyCode
    CurrText as CurrencyCodeText      //CurrencyCodeText
}
