CLASS lhc_booking DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS earlynumbering_cba_Bookingsupp FOR NUMBERING
      IMPORTING entities FOR CREATE Booking\_Bookingsupplement.

ENDCLASS.

CLASS lhc_booking IMPLEMENTATION.

  METHOD earlynumbering_cba_Bookingsupp.

  data max_booking_id type /dmo/booking_id.
   ""Step 1: get all the travel requests and their booking data
   read ENTITIES OF zey_aaa_travel in local mode
       ENTITY travel by \_Booking
       from CORRESPONDING #( entities )
       link data(bookings).
   ""Loop at unique travel ids
   loop at entities ASSIGNING FIELD-SYMBOL(<travel_group>) GROUP BY <travel_group>-TravelId.
   ""Step 2: get the highest booking number which is already there
       loop at bookings into data(ls_booking) using key entity
           where source-TravelId = <travel_group>-TravelId.
               if max_booking_id < ls_booking-target-BookingId.
                   max_booking_id = ls_booking-target-BookingId.
               ENDIF.
       ENDLOOP.
   ""Step 3: get the asigned booking numbers for incoming request
       loop at entities into data(ls_entity) using key entity
           where TravelId = <travel_group>-TravelId.
               loop at ls_entity-%target into data(ls_target).
                   if max_booking_id < ls_target-BookingId.
                       max_booking_id = ls_target-BookingId.
                   ENDIF.
               ENDLOOP.
       ENDLOOP.
   ""Step 4: loop over all the entities of travel with same travel id
       loop at entities ASSIGNING FIELD-SYMBOL(<travel>)
           USING KEY entity where TravelId = <travel_group>-TravelId.
   ""Step 5: assign new booking IDs to the booking entity inside each travel
           LOOP at <travel>-%target ASSIGNING FIELD-SYMBOL(<booking_wo_numbers>).
               append CORRESPONDING #( <booking_wo_numbers> ) to mapped-booking
               ASSIGNING FIELD-SYMBOL(<mapped_booking>).
               if <mapped_booking>-BookingId is INITIAL.
                   max_booking_id += 10.
                   <mapped_booking>-BookingId = max_booking_id.
               ENDIF.
           ENDLOOP.
       ENDLOOP.
   ENDLOOP.
  ENDMETHOD.

ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
