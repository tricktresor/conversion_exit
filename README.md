# conversion_exit
general routine for converting field values from internal to extern format and vice versa.

# usage
```
DATA(vbeln) TYPE vbeln.
"converting unformatted number to internal format (leading zeros):
vbeln = zcl_trcktrsr_conversion_exit=>for_rollname( 'VBELN' )->input( '12345' ).

"converting number in internal format to output: 
vbeln = zcl_trcktrsr_conversion_exit=>for_rollname( 'VBELN' )->output( '0000012345' ).
```
