@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Produt interface basic'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_EY_AAA_PRODUCT as select from zey_aaa_product
{
   key product_id as ProductId,
   name as Name,
   category as Category,
   --@Semantics.amount.currencyCode: 'Currency'
   price as Price,
   currency as Currency,
   discount as Discount
}
