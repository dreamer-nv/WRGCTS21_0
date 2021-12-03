CLASS lcl_Wrgcts21_00_Tst DEFINITION DEFERRED.
CLASS zcl_Wrgcts21_00 DEFINITION LOCAL FRIENDS lcl_Wrgcts21_00_Tst.

CLASS lcl_Wrgcts21_00_Tst DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS
.
*?﻿<asx:abap xmlns:asx="http://www.sap.com/abapxml" version="1.0">
*?<asx:values>
*?<TESTCLASS_OPTIONS>
*?<TEST_CLASS>lcl_Wrgcts21_00_Tst
*?</TEST_CLASS>
*?<TEST_MEMBER>f_Cut
*?</TEST_MEMBER>
*?<OBJECT_UNDER_TEST>ZCL_WRGCTS21_00
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
    DATA:
      f_Cut TYPE REF TO zcl_Wrgcts21_00.  "class under test

    METHODS: sum FOR TESTING.
ENDCLASS.       "lcl_Wrgcts21_00_Tst


CLASS lcl_Wrgcts21_00_Tst IMPLEMENTATION.

  METHOD sum.
    DATA: lo_object TYPE REF TO zcl_wrgcts21_00,
          lv_result TYPE i.
    CREATE OBJECT lo_object.
    lv_result = lo_object->sum( 3 ).


    cl_Abap_Unit_Assert=>assert_Equals(
      act   = lv_result
      exp   = 6          "<--- please adapt expected value
      msg   = 'Testing value is not expected'
*     level =
    ).
  ENDMETHOD.




ENDCLASS.