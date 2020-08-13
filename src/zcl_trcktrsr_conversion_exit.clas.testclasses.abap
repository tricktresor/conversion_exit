
CLASS ltcl_demo DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS
.
*?﻿<asx:abap xmlns:asx="http://www.sap.com/abapxml" version="1.0">
*?<asx:values>
*?<TESTCLASS_OPTIONS>
*?<TEST_CLASS>ltcl_Demo
*?</TEST_CLASS>
*?<TEST_MEMBER>f_Cut
*?</TEST_MEMBER>
*?<OBJECT_UNDER_TEST>ZCL_TRCKTRSR_CONVERSION_EXIT
*?</OBJECT_UNDER_TEST>
*?<OBJECT_IS_LOCAL/>
*?<GENERATE_FIXTURE/>
*?<GENERATE_CLASS_FIXTURE/>
*?<GENERATE_INVOCATION/>
*?<GENERATE_ASSERT_EQUAL>X
*?</GENERATE_ASSERT_EQUAL>
*?</TESTCLASS_OPTIONS>
*?</asx:values>
*?</asx:abap>
  PRIVATE SECTION.
    METHODS number_input_output_alpha FOR TESTING.
    METHODS number_output_input_alpha FOR TESTING.
    METHODS char_input_output_alpha FOR TESTING.
    METHODS char_output_input_alpha FOR TESTING.

ENDCLASS.       "ltcl_Demo


CLASS ltcl_demo IMPLEMENTATION.

  METHOD number_input_output_alpha.
    cl_abap_unit_assert=>assert_equals(
      act   = zcl_trcktrsr_conversion_exit=>for_rollname( 'VBELN' )->output( '0000012345' )
      exp   = '12345'  ).
  ENDMETHOD.

  METHOD number_output_input_alpha.
    cl_abap_unit_assert=>assert_equals(
    act   = zcl_trcktrsr_conversion_exit=>for_rollname( 'VBELN' )->input( '12345' )
    exp   = '0000012345'  ).
  ENDMETHOD.

  METHOD char_input_output_alpha.
    cl_abap_unit_assert=>assert_equals(
      act   = zcl_trcktrsr_conversion_exit=>for_rollname( 'VBELN' )->output( 'ABC' )
      exp   = 'ABC'  ).
  ENDMETHOD.

  METHOD char_output_input_alpha.
    cl_abap_unit_assert=>assert_equals(
      act   = zcl_trcktrsr_conversion_exit=>for_rollname( 'VBELN' )->input( 'ABC' )
      exp   = 'ABC'  ).
  ENDMETHOD.


ENDCLASS.
