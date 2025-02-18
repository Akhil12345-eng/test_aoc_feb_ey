@AbapCatalog.sqlViewName: 'ZEYAAATF2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds view on TF'
@Metadata.ignorePropagatedAnnotations: false
define view ZEY_AAA_TF2
  with parameters
    p_company_name : abap.char(256)
  as select from ZEY_AAA_TF(p_clnt : $session.client)
{
 company_name,
   @Semantics.amount.currencyCode: 'currency_code'
   total_sales,
   currency_code,
   customer_rank
}
where
  company_name = $parameters.p_company_name
