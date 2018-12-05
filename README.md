![](https://github.com/jerry-D/IEEE-754-2008_ISA_CPU/blob/master/images/SYMPL_CPU_LOGO.png)
## IEEE 754-2008 Universal Fused Multiply-Add (FMA) 
### Double-Precision FLoating-Point Operator for Xilinx Kintex Ultra Family FPGAs

(December 5, 2018) Written in Verilog RTL for implementation in Xilinx Kintex Ultra brand FPGAs, this is probably the world's only synthesizable IEEE 754-2008 compliant, 
double-precision Fused Multiply-Add floating-point operator that can directly accept H=20 decimalCharacterSequence, binary16, binary32 and binary64 formatted numbers without having to explicitly convert them beforehand.

Stated another way, this universal FMA can directly perform double-precision operations between decimalCharacterSequence, binary16, binary32 and binary64 formatted numbers, in any combination.  If your application involves web-based Artificial Intelligence, where the data you are collecting is only available in human-readable form (such as the New York Stock Exchange) then this operator can be your secret weapon, especially if it involves long series dot product type computations in real time.  

It is fully pipelined and designed for ready incorporation into the new 64-bit, IEEE 754-2008 Floating-Point Instruction Set Architecture (ISA) CPU and Compute Units presently in development.

Here is a link to the Universal Fused Multiply-Add Operator in .pdf format:


This design features 32 result buffers and 32 “fat” C-register/accumulators results automatically spill into.  When used with the SYMPL ISA “Repeat” instruction, the effective/apparent latency is only one clock per computation, regardless of what format or combination of formats the operands are submitted in.  This is because by the time all 32 operandA-operandB pairs have been pushed into the operator, the result of the first push is already available for reading. 

To facilitate processor context save/restore operations, results and intermediate results (including their 5-bit exceptions) stored in the 32 result buffers and 32 fat C-register/accumulators can be read out and written back in without having to recompute them.

This universal FMA operator is unique in the industry, in that it can directly accept binary16, binary32, binary64 and H=20 decimalCharacterSequence formatted numbers—directly--in any combination.  Below are some example H=20 decimalCharacterSequence numbers that can be used as operandA, operandB and/or operandC:

```
 operandA                                            operandB                           operandC
 “33.33”                                             <binary16>                         “0”
 <binary64>                                          “-139357401298464326617.3598132”   “.00000025
 “3.14159265358979323846”                            “.96789359216732176993”            <binary32>            
“+00000000001345778821977446639871288665000e-020”    “445581.89445”                     “-93756”
```
Note that in the above examples this universal FMA operator can accept decimalCharacterSequences with or without exponent.  However, if the character sequence has an exponent, it must use the default 47-character format shown above, padding to the left and/or to the right with zeros. DecimalCharacterSequences with exponent employ the fixed default format shown below:

```
  s                                          s
  i                                          i
  g                                          g
  n                                          n                                        
  |                                          |                                        
  +00000000001345778821977446639871288665000e-020”
   |<--integer part -->||<--fractn part -->|| |_|<--must be 3 digits
                                            |
                                            e/E
Rules:
1) signs for both significand and exponent must be present
2) exactly 21 digits for integer part with digit 21 never exceeding “1”
3) exactly 20 digits for fraction part
4) there must be an upper or lower case “e” preceding exponent sign
5) exactly 3 digits for exponent 
```
Here is some example code written in a mix of SYMPL Intermediate Language (IL) and straight assembly language that computes 32, correctly rounded, binary64 formatted FMAs, with an apparent latency of only two clocks per computation, regardless of the format the operands are submitted in. Note that one of the above two clocks is used to initialize each C-register/accumulator.

```
    w4 AR0 = r4:#C_vect             ;load read pointer with location of source C vector
    w4 AR1 = r4:#C.0                ;load write pointer with location of first C-register/accumulator
       REPEAT, R1:#31               ;load repeat counter with number of extra times to execute the following instruction
    w8	  *AR1++[1] = r8:*AR0++[8]	  ;initialize all 32 C-register/accumulators

    w4 AR2 = r4:#A_vect             ;load read pointer with location of source A vector
    w4 AR3 = r4:#B_vect             ;load read pointer with location of source B vector
    w4 AR4 = r4:#FMA.0              ;load write pointer with location of first FMA input
       REPEAT, R1:#31               ;load repeat counter with number of extra times to execute the following instruction
    w32   *AR4++[1], r8:*AR2++[8], x32:AR3++[32]  ;push operandA and operandB into the pointed-to FMA input
```
### Dot Product Example
Here is some example code written in a mix of SYMPL Intermediate Language (IL) and straight assembly language that does dot product computations on quantity (32) vector pairs of 256 elements each, with an apparent latency of only one clock per computation:

```
            w4   AR1 = r4:#C.0                                ;load write pointer with location of first C-register/accumulator
                 REPEAT, R1:#31                               ;load repeat counter with number of extra times to execute the following instruction
            w8   	  *AR1++[1] = r1:#0                       	 ;initialize all 32 C-register/accumulators to 0

            w4   AR2 = r4:#A_vect                             ;load read pointer with location of source A vector
            w4   AR3 = r4:#B_vect                             ;load read pointer with location of source B vector
            
                 FOR (LPCNT0 = r2:#256) (                     ;load LPCNT0 with number of elements in each vector 
   loop:    w4      AR4 = r4:#FMA.0                           ;load write pointer with location of first FMA input
                    REPEAT, R1:#31                            ;load repeat counter with number of extra times to execute the following instruction
            w32        *AR4++[1], r8:*AR2++[8], x32:AR3++[32] ;push operandA and operandB into the pointed-to FMA input
                 NEXT LPCNT0 GOTO: loop )                     ;continue looping until LPCNT0 reaches 0
