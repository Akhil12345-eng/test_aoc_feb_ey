@AbapCatalog.sqlViewName: 'ZEYAAACDSVIEW'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'My first CDS view'
@Metadata.ignorePropagatedAnnotations: true
define view zey_aaa_cds_view as select from zey_aaa_bpa
{
  key bp_id as BpId,
  bp_role as BpRole,
  company_name as CompanyName,
  street as Street,
  country as Country,
  region as Region,
  city as City  
}
