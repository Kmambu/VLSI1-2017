/*----------------------------------------------------------------
//           Mon premier programme                              //
//           Test branch good                                   //
----------------------------------------------------------------*/
	.text
	.globl	_start 
_start:               
	/* 0x00 Reset Interrupt vector address */
  mov R2, #8
	b	_good
	nop

_bad :
	nop
	nop
_good :
	nop
	nop
