CLASS zcl_ey_aaa_eml DEFINITION
 PUBLIC
 FINAL
 CREATE PUBLIC .
 PUBLIC SECTION.
   data : lv_opr type c VALUE 'R'.
   INTERFACES if_oo_adt_classrun .
 PROTECTED SECTION.
 PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EY_AAA_EML IMPLEMENTATION.


 METHOD if_oo_adt_classrun~main.
   case lv_opr.
       when 'R'.
           READ ENTITIES OF Zey_aaa_TRAVEL
           ENTITY Travel
           FIELDS ( travelid agencyid CustomerId OverallStatus ) WITH
           VALUE #( ( TravelId = '00000011' )
                    ( TravelId = '00000025' )
                    ( TravelId = '009595' )
                  )
           RESULT Data(lt_result)
           FAILED data(lt_failed)
           REPORTED DATA(lt_messages).
           out->write(
             EXPORTING
               data   = lt_result
           ).
           out->write(
             EXPORTING
               data   = lt_failed
           ).
       when 'C'.
           data(lv_description) = 'AKHIL Rocks with RAP'.
           data(lv_agency) = '070019'.
           data(lv_customer) = '000699'.
           MODIFY ENTITIES OF Zey_aaa_TRAVEL
           ENTITY Travel
           CREATE FIELDS ( TravelId AgencyId CurrencyCode BeginDate EndDate Description OverallStatus )
           WITH VALUE #(
                           (
                             %CID = 'AKHIL'
                             TravelId = '00012349'
                             AgencyId = lv_agency
                             CustomerId = lv_customer
                             BeginDate = cl_abap_context_info=>get_system_date( )
                             EndDate = cl_abap_context_info=>get_system_date( ) + 30
                             Description = lv_description
                             OverallStatus = 'O'
                            )
                           ( %CID = 'AKHIL-1'
                             TravelId = '00012359'
                             AgencyId = lv_agency
                             CustomerId = lv_customer
                             BeginDate = cl_abap_context_info=>get_system_date( )
                             EndDate = cl_abap_context_info=>get_system_date( ) + 30
                             Description = lv_description
                             OverallStatus = 'O'
                            )
                            (
                             %CID = 'AKHIL-2'
                             TravelId = '00000012'
                             AgencyId = lv_agency
                             CustomerId = lv_customer
                             BeginDate = cl_abap_context_info=>get_system_date( )
                             EndDate = cl_abap_context_info=>get_system_date( ) + 30
                             Description = lv_description
                             OverallStatus = 'O'
                            )
            )
            MAPPED data(lt_mapped)
            FAILED lt_failed
            REPORTED lt_messages.
            COMMIT ENTITIES.
            out->write(
             EXPORTING
               data   = lt_mapped
           ).
           out->write(
             EXPORTING
               data   = lt_failed
           ).
       when 'U'.
           lv_description = 'Wow, That was an up'.
           lv_agency = '070032'.
           MODIFY ENTITIES OF Zey_aaa_TRAVEL
           ENTITY Travel
           UPDATE FIELDS ( AgencyId Description )
           WITH VALUE #(
                           ( TravelId = '00001133'
                             AgencyId = lv_agency
                             Description = lv_description
                            )
                           ( TravelId = '00001135'
                             AgencyId = lv_agency
                             Description = lv_description
                            )
            )
            MAPPED lt_mapped
            FAILED lt_failed
            REPORTED lt_messages.
            COMMIT ENTITIES.
            out->write(
             EXPORTING
               data   = lt_mapped
           ).
           out->write(
             EXPORTING
               data   = lt_failed
           ).
       when 'D'.
       MODIFY ENTITIES OF Zey_aaa_TRAVEL
           ENTITY Travel
           DELETE FROM VALUE #(
                           ( TravelId = '00012347'
                            )
            )
            MAPPED lt_mapped
            FAILED lt_failed
            REPORTED lt_messages.
            COMMIT ENTITIES.
            out->write(
             EXPORTING
               data   = lt_mapped
           ).
           out->write(
             EXPORTING
               data   = lt_failed
           ).
   endcase.
 ENDMETHOD.
ENDCLASS.
