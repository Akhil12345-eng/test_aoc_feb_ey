@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking supplement processor'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZEY_AAA_BOOKING_SUPL_APPROVER as projection on ZEY_Aaa_BOOKSUPPL
{
   key TravelId,
   key BookingId,
   key BookingSupplementId,
   SupplementId,
   Price,
   CurrencyCode,
   LastChangedAt,
   /* Associations */
   _Booking: redirected to parent ZEY_Aaa_BOOKING_APPROVER,
   _Product,
   _SupplementText,
   _Travel: redirected to zey_aaa_travel_approver
}
