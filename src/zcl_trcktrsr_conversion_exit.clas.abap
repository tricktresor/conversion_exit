class ZCL_TRCKTRSR_CONVERSION_EXIT definition
  public
  final
  create public .

public section.

  methods CONSTRUCTOR
    importing
      !ROLLNAME type CLIKE .
  class-methods FOR_ROLLNAME
    importing
      !ROLLNAME type CHAR05
    returning
      value(OBJ) type ref to ZCL_TRCKTRSR_CONVERSION_EXIT .
  methods INPUT
    importing
      !IN type ANY
    returning
      value(OUT) type STRING .
  methods OUTPUT
    importing
      !IN type ANY
    returning
      value(OUT) type STRING .
  PRIVATE SECTION.
    DATA rollname TYPE string.
    DATA dyntype TYPE REF TO data.
    DATA dynelem TYPE REF TO cl_abap_elemdescr.

ENDCLASS.



CLASS ZCL_TRCKTRSR_CONVERSION_EXIT IMPLEMENTATION.


  METHOD constructor.
    me->rollname = rollname.
    TRY.
        dynelem ?= cl_abap_datadescr=>describe_by_name( rollname ).
        IF dynelem->type_kind = cl_abap_elemdescr=>typekind_char.

          CREATE DATA dyntype TYPE HANDLE dynelem.
        ENDIF.
      CATCH cx_sy_move_cast_error.
    ENDTRY.

  ENDMETHOD.


  METHOD for_rollname.

    obj = NEW #( rollname ).

  ENDMETHOD.


  METHOD input.

    IF dyntype IS BOUND.
      ASSIGN dyntype->* TO FIELD-SYMBOL(<out>).
      DATA(fm) = |CONVERSION_EXIT_{ dynelem->edit_mask+2(5) }_INPUT|.
      CALL FUNCTION fm
        EXPORTING
          input  = in
        IMPORTING
          output = <out>.
      out = <out>.
    ELSE.
      out = in.
    ENDIF.

  ENDMETHOD.


  METHOD output.

    IF dyntype IS BOUND.
      ASSIGN dyntype->* TO FIELD-SYMBOL(<out>).
      DATA(fm) = |CONVERSION_EXIT_{ dynelem->edit_mask+2(5) }_OUTPUT|.
      CALL FUNCTION fm
        EXPORTING
          input  = in
        IMPORTING
          output = <out>.
      out = <out>.
    ELSE.
      out = in.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
