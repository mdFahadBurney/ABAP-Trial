CLASS zcl_hello_world_mfb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES IF_OO_ADT_CLASSRUN.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_hello_world_mfb IMPLEMENTATION.
METHOD IF_OO_ADT_CLASSRUN~main.
out->write( |Hello World { cl_abap_context_info=>get_user_technical_name(  ) } | )."--Technical User Name
ENDMETHOD.
ENDCLASS.
