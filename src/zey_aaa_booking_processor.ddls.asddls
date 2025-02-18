@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking processor projection'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZEY_Aaa_BOOKING_PROCESSOR as projection on ZEy_AAA_BOOKING
{
   key TravelId,
   key BookingId,
   BookingDate,
   CustomerId,
   CarrierId,
   ConnectionId,
   FlightDate,
   FlightPrice,
   CurrencyCode,
   BookingStatus,
   LastChangedAt,
   /* Associations */
   _BookingStatus,
   _BookingSupplement: redirected to composition child ZEY_Aaa_BOOKING_SUPL_PROCESSOR,
   _Carrier,
   _Connection,
   _Customer,
   _Travel: redirected to parent zey_aaa_travel_processor
}
