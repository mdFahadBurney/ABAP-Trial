class ZCL_ZMFB_CHANGE_DOC_CHDO definition
  public
  create public .

public section.

  interfaces IF_CHDO_ENHANCEMENTS .

  types:
     BEGIN OF TY_ZTD_ITEM_E1156 .
      INCLUDE TYPE ZTD_ITEM_E1156.
      INCLUDE TYPE IF_CHDO_OBJECT_TOOLS_REL=>TY_ICDIND.
 TYPES END OF TY_ZTD_ITEM_E1156 .
  types:
    TT_ZTD_ITEM_E1156 TYPE STANDARD TABLE OF TY_ZTD_ITEM_E1156 .

  class-data OBJECTCLASS type IF_CHDO_OBJECT_TOOLS_REL=>TY_CDOBJECTCL read-only value 'ZMFB_CHANGE_DOC' ##NO_TEXT.

  class-methods WRITE
    importing
      !OBJECTID type IF_CHDO_OBJECT_TOOLS_REL=>TY_CDOBJECTV
      !UTIME type IF_CHDO_OBJECT_TOOLS_REL=>TY_CDUZEIT
      !UDATE type IF_CHDO_OBJECT_TOOLS_REL=>TY_CDDATUM
      !USERNAME type IF_CHDO_OBJECT_TOOLS_REL=>TY_CDUSERNAME
      !PLANNED_CHANGE_NUMBER type IF_CHDO_OBJECT_TOOLS_REL=>TY_PLANCHNGNR default SPACE
      !OBJECT_CHANGE_INDICATOR type IF_CHDO_OBJECT_TOOLS_REL=>TY_CDCHNGINDH default 'U'
      !PLANNED_OR_REAL_CHANGES type IF_CHDO_OBJECT_TOOLS_REL=>TY_CDFLAG default SPACE
      !NO_CHANGE_POINTERS type IF_CHDO_OBJECT_TOOLS_REL=>TY_CDFLAG default SPACE
      !XZTD_ITEM_E1156 type TT_ZTD_ITEM_E1156 optional
      !YZTD_ITEM_E1156 type TT_ZTD_ITEM_E1156 optional
      !UPD_ZTD_ITEM_E1156 type IF_CHDO_OBJECT_TOOLS_REL=>TY_CDCHNGINDH default SPACE
    exporting
      value(CHANGENUMBER) type IF_CHDO_OBJECT_TOOLS_REL=>TY_CDCHANGENR
    raising
      CX_CHDO_WRITE_ERROR .
protected section.
private section.
ENDCLASS.



CLASS ZCL_ZMFB_CHANGE_DOC_CHDO IMPLEMENTATION.


  method WRITE.
*"----------------------------------------------------------------------
*"         this WRITE method is generated for object ZMFB_CHANGE_DOC
*"         never change it manually, please!        :02/04/2025
*"         All changes will be overwritten without a warning!
*"
*"         CX_CHDO_WRITE_ERROR is used for error handling
*"----------------------------------------------------------------------

    DATA: l_upd        TYPE if_chdo_object_tools_rel=>ty_cdchngind.

    CALL METHOD cl_chdo_write_tools=>changedocument_open
      EXPORTING
        objectclass             = objectclass
        objectid                = objectid
        planned_change_number   = planned_change_number
        planned_or_real_changes = planned_or_real_changes.

    IF ( YZTD_ITEM_E1156 IS INITIAL ) AND
       ( XZTD_ITEM_E1156 IS INITIAL ).
      l_upd  = space.
    ELSE.
      l_upd = UPD_ZTD_ITEM_E1156.
    ENDIF.

    IF l_upd NE space.
      CALL METHOD CL_CHDO_WRITE_TOOLS=>changedocument_multiple_case
        EXPORTING
          tablename              = 'ZTD_ITEM_E1156'
          change_indicator       = UPD_ZTD_ITEM_E1156
          docu_delete            = ''
          docu_insert            = ''
          docu_delete_if         = ''
          docu_insert_if         = ''
          table_old              = YZTD_ITEM_E1156
          table_new              = XZTD_ITEM_E1156
                  .
    ENDIF.

    CALL METHOD cl_chdo_write_tools=>changedocument_close
      EXPORTING
        objectclass             = objectclass
        objectid                = objectid
        date_of_change          = udate
        time_of_change          = utime
        username                = username
        object_change_indicator = object_change_indicator
        no_change_pointers      = no_change_pointers
      IMPORTING
        changenumber            = changenumber.

  endmethod.
ENDCLASS.
