CLASS lhc_Z_I_HEADER_11563 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR z_i_header_11563 RESULT result.

    METHODS changestatus FOR MODIFY
      IMPORTING keys FOR ACTION z_i_header_11563~changestatus RESULT result.

ENDCLASS.

CLASS lhc_Z_I_HEADER_11563 IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD changestatus.

  READ ENTITIES OF z_i_header_11563 IN LOCAL MODE
  ENTITY z_i_header_11563 ALL FIELDS WITH CORRESPONDING #( KEYS )
  RESULT DATA(LT_HEADER)
  FAILED DATA(LT_FAILED).

  loop at LT_HEADER assigning FIELD-SYMBOL(<fs_header>).


    CASE <fs_header>-Status.

    WHEN 'Open'.<fs_header>-Status = 'In Process'.
    WHEN 'In Process'.<fs_header>-Status = 'Completed'.
    WHEN 'Completed'.<fs_header>-Status = 'Open'.
    WHEN OTHERS.<fs_header>-Status = 'Changed'.

    ENDCASE.

  endloop.

   MODIFY ENTITIES OF z_i_header_11563 IN LOCAL MODE
   ENTITY z_i_header_11563
   UPDATE FIELDS ( Status )
   WITH VALUE #( FOR LS_RESULT IN LT_HEADER INDEX INTO i (
   %key-docno = <fs_header>-%key-Docno
   Status = <fs_header>-Status
   %control = VALUE #(
   Status = if_abap_behv=>mk-on
   )
    ) )
    FAILED lt_failed
    REPORTED DATA(lt_reported)
    MAPPED DATA(lt_mapped).


  ENDMETHOD.

ENDCLASS.

CLASS lhc_Z_I_ITEM_R_11563 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR z_i_item_r_11563 RESULT result.

    METHODS addAmount FOR MODIFY
      IMPORTING keys FOR ACTION z_i_item_r_11563~addAmount RESULT result.

    METHODS updateItemAmt FOR DETERMINE ON MODIFY
      IMPORTING keys FOR z_i_item_r_11563~updateItemAmt.

    METHODS updateTaxAmt FOR DETERMINE ON SAVE
      IMPORTING keys FOR z_i_item_r_11563~updateTaxAmt.

    METHODS createDate FOR VALIDATE ON SAVE
      IMPORTING keys FOR z_i_item_r_11563~createDate.

    METHODS dateValidate FOR VALIDATE ON SAVE
      IMPORTING keys FOR z_i_item_r_11563~dateValidate.

ENDCLASS.

CLASS lhc_Z_I_ITEM_R_11563 IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD addAmount.
  ENDMETHOD.

  METHOD updateItemAmt."---Determination 2

 READ ENTITIES OF Z_I_HEADER_11563 IN LOCAL MODE
 ENTITY z_i_item_r_11563 ALL FIELDS WITH CORRESPONDING #( KEYS )
 RESULT DATA(LT_ITEMQUAN)
 FAILED DATA(LT_FAILITEM).

 LOOP AT LT_ITEMQUAN ASSIGNING FIELD-SYMBOL(<FS_ITEMQUAN>).
 IF <FS_ITEMQUAN>-Quantity GE 10.
<FS_ITEMQUAN>-ItemAmt *= 10.
ELSE.
<FS_ITEMQUAN>-ItemAmt *= 5.
 ENDIF.
 ENDLOOP.

MODIFY ENTITIES OF z_i_header_11563 IN LOCAL MODE
ENTITY z_i_item_r_11563
UPDATE FIELDS ( ItemAmt ) WITH VALUE #( ( %tky = <fs_itemquan>-%tky ItemAmt = <fs_itemquan>-TaxAmt ) ).




  ENDMETHOD.

  METHOD updateTaxAmt.
  "--Write code to Update Tax Amount for Item Based on Item Amount

  READ ENTITIES OF z_i_header_11563 IN LOCAL MODE
  ENTITY z_i_item_r_11563 FIELDS ( ItemAmt ) WITH CORRESPONDING #( KEYS )
  RESULT DATA(LT_ITEM)
  FAILED DATA(LT_FAILITEM).

  LOOP AT lt_item ASSIGNING FIELD-SYMBOL(<fs_item>).

  IF <fs_item>-ItemAmt eq 750000.
  <fs_item>-TaxAmt = ( <fs_item>-ItemAmt * 20 ) / 100.
  MODIFY ENTITIES OF z_i_header_11563 IN LOCAL MODE
  ENTITY z_i_item_r_11563
  UPDATE FIELDS ( TaxAmt ) WITH VALUE #( ( %tky = <fs_item>-%tky TaxAmt = <fs_item>-TaxAmt ) ).

  ELSEIF <fs_item>-ItemAmt > 750000.
  <fs_item>-TaxAmt = ( <fs_item>-ItemAmt * 30 ) / 100.
   MODIFY ENTITIES OF z_i_header_11563 IN LOCAL MODE
  ENTITY z_i_item_r_11563
  UPDATE FIELDS ( TaxAmt ) WITH VALUE #( ( %tky = <fs_item>-%tky TaxAmt = <fs_item>-TaxAmt ) ).

  ELSE.
  <fs_item>-TaxAmt = 0.

   MODIFY ENTITIES OF z_i_header_11563 IN LOCAL MODE
  ENTITY z_i_item_r_11563
  UPDATE FIELDS ( TaxAmt ) WITH VALUE #( ( %tky = <fs_item>-%tky TaxAmt = <fs_item>-TaxAmt ) ).

  ENDIF.

  ENDLOOP.

  ENDMETHOD.

  METHOD createDate.

  "--Validate that Created AT > Changed At
  READ ENTITIES OF z_i_header_11563 IN LOCAL MODE
  ENTITY z_i_item_r_11563
  FIELDS ( ChangedAt ) WITH CORRESPONDING #( KEYS )
  RESULT DATA(LT_DATE)
  FAILED DATA(LT_FAILED).

  FAILED = CORRESPONDING #( DEEP LT_FAILED ).

  LOOP AT LT_DATE ASSIGNING FIELD-SYMBOL(<FS_DATE>).

  IF <fs_date>-CreatedAt > cl_abap_context_info=>get_system_date(  ).

  APPEND VALUE #(   %tky = KEYS[ 1 ]-%tky
                    %msg = new_message_with_text(
                    text = 'Created Date is in Future'
                    severity = if_abap_behv_message=>severity-error
                ) )


   to REPORTED-z_i_item_r_11563.



  ENDIF.
  ENDLOOP.

  ENDMETHOD.

  METHOD dateValidate.
  "--Validate that CREATED AT > CHANGED AT
  READ ENTITIES OF z_i_header_11563 IN LOCAL MODE
  ENTITY z_i_item_r_11563
  FIELDS ( ChangedAt ) WITH CORRESPONDING #( keys )
  RESULT DATA(LT_DATE)
  FAILED DATA(LT_FAILED).

  FAILED = CORRESPONDING #( DEEP lt_failed ).

  LOOP AT LT_DATE ASSIGNING FIELD-SYMBOL(<FS_DATE>).

  IF <FS_DATE>-ChangedAt = <fs_date>-CreatedAt.

  APPEND VALUE #( %tky = KEYS[ 1 ]-%tky
  %msg = new_message_with_text(
               text = 'Please Enter Correct Changed Date'
               severity = if_abap_behv_message=>severity-error )
   ) TO REPORTED-z_i_item_r_11563.

  ENDIF.

  ENDLOOP.

  ENDMETHOD.

ENDCLASS.

CLASS lsc_Z_I_HEADER_11563 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_Z_I_HEADER_11563 IMPLEMENTATION.

  METHOD save_modified.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
