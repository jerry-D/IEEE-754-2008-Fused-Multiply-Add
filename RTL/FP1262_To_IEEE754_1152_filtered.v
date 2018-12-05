// FP1262_To_IEEE754_1152_filtered.v
 
// Author:  Jerry D. Harthcock
// Version:  1.01  November 27, 2018
// Copyright (C) 2018.  All rights reserved.
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                  //
//                                                Open-Source                                                       //
//                                        SYMPL 64-Bit OpCodeless CPU                                               //
//                                Evaluation and Product Development License                                        //
//                                                                                                                  //
//                                                                                                                  //
// Open-source means that this source code may be freely downloaded, copied, modified, distributed and used in      //
// accordance with the terms and conditons of the licenses provided herein.                                         //
//                                                                                                                  //
// Provided that you comply with all the terms and conditions set forth herein, Jerry D. Harthcock ("licensor"),    //
// the original author and exclusive copyright owner of this SYMPL 64-Bit OpCodeless CPU and related development    //
// software ("this IP") hereby grants recipient of this IP ("licensee"), a world-wide, paid-up, non-exclusive       //
// license to implement this IP within the programmable fabric of Xilinx, Intel, MicroSemi or Lattice               //
// Semiconductor brand FPGAs only and used only for the purposes of evaluation, education, and development of end   //
// products and related development tools.  Furthermore, limited to the purposes of prototyping, evaluation,        //
// characterization and testing of implementations in a hard, custom or semi-custom ASIC, any university or         //
// institution of higher education may have their implementation of this IP produced for said limited purposes at   //
// any foundary of their choosing provided that such prototypes do not ever wind up in commercial circulation,      //
// with such license extending to said foundary and is in connection with said academic pursuit and under the       //
// supervision of said university or institution of higher education.                                               //            
//                                                                                                                  //
// Any copying, distribution, customization, modification, or derivative work of this IP must include an exact copy //
// of this license and original copyright notice at the very top of each source file and any derived netlist, and,  //
// in the case of binaries, a printed copy of this license and/or a text format copy in a separate file distributed //
// with said netlists or binary files having the file name, "LICENSE.txt".  You, the licensee, also agree not to    //
// remove any copyright notices from any source file covered or distributed under this Evaluation and Product       //
// Development License.                                                                                             //
//                                                                                                                  //
// LICENSOR DOES NOT WARRANT OR GUARANTEE THAT YOUR USE OF THIS IP WILL NOT INFRINGE THE RIGHTS OF OTHERS OR        //
// THAT IT IS SUITABLE OR FIT FOR ANY PURPOSE AND THAT YOU, THE LICENSEE, AGREE TO HOLD LICENSOR HARMLESS FROM      //
// ANY CLAIM BROUGHT BY YOU OR ANY THIRD PARTY FOR YOUR SUCH USE.                                                   //
//                                                                                                                  //
//                                               N O T I C E                                                        //
//                                                                                                                  //
// Certain implementations of this IP involving certain floating-point operators may comprise IP owned by certain   //
// contributors and developers at FloPoCo.  FloPoCo's licensing terms can be found at this website:                 //
//                                                                                                                  //
//    http://flopoco.gforge.inria.fr                                                                                //
//                                                                                                                  //
// Licensor reserves all his rights, including, but in no way limited to, the right to change or modify the terms   //
// and conditions of this Evaluation and Product Development License anytime without notice of any kind to anyone.  //
// By using this IP for any purpose, you agree to all the terms and conditions set forth in this Evaluation and     //
// Product Development License.                                                                                     //
//                                                                                                                  //
// This Evaluation and Product Development License does not include the right to sell products that incorporate     //
// this IP or any IP derived from this IP. If you would like to obtain such a license, please contact Licensor.     //           
//                                                                                                                  //
// Licensor can be contacted at:  SYMPL.gpu@gmail.com                                                               //
//                                                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 

 `timescale 1ns/100ps


module FP1262_To_IEEE754_1152_filtered(
    CLK,
    RESET,
    wren,
    round_mode,
    Away,
    trunk_invalid,
    NaN_in,
    invalid_code,
    operator_overflow,
    operator_underflow,
    div_by_0,
    A_invalid,
    B_invalid,
    A_inexact,
    B_inexact,
    X,
    Rq,
    G_in,     //FP 12 62 operator guard
    R_in,     //FP 12 62 operator round
    S_in      //FP 12 62 operator sticky
    );
    
input CLK;
input RESET;
input wren;
input [1:0] round_mode;
input Away;
input trunk_invalid;
input [51:0] NaN_in;       //this is a piped NaN including "signal" bit
input [2:0] invalid_code;
input operator_overflow;
input operator_underflow;
input div_by_0;
input A_invalid;
input B_invalid;
input A_inexact;
input B_inexact;
//input [64:0] X;
input [66:0] X;
output [68:0] Rq;      //all results are aligned right  64bits + 5-bit exception code
input G_in;
input R_in;
input S_in;

//input precision (size) encodings for NaN diagnostic payload generation
parameter _1152_ = 2'b11;     //DP
parameter _823_  = 2'b10;     //SP
parameter _510_  = 2'b01;     //HP
parameter _610_  = 2'b00;     //FP610

// pipe position where exception detected for NaN diagnostic payload generation
parameter _head_  = 2'b01;
parameter _trunk_ = 2'b10;
parameter _tail_  = 2'b11;

// exception codes for five MSBs [68:64] of final result
parameter _no_excpt_   = 5'b00000;  
parameter _inexact_    = 5'b00001;
parameter _underflow_  = 5'b00010;                     
parameter _overflow_   = 5'b00100;  
parameter _invalid_    = 5'b01000;  
parameter _div_x_0_    = 5'b10000;  

// frontend invalid operation codes for NaN diagnostic payload generation
parameter sig_NaN      = 3'b000;  // singnaling NaN is an operand
parameter mult_oob     = 3'b001;  // multiply operands out of bounds, multiplication(0, INF) or multiplication(?INF, 0)
parameter fsd_mult_oob = 3'b010;  // fused multiply operands out of bounds
parameter add_oob      = 3'b011;  // add or subract or fusedmultadd operands out of bounds
parameter div_oob      = 3'b100;  // division operands out of bounds, division(0, 0) or division(?INF, INF) 
parameter rem_oob      = 3'b101;  // remainder operands out of bounds, remainder(x, y), when y is zero or x is infinite (and neither is NaN)
parameter sqrt_oob     = 3'b110;  // square-root or log operand out of bounds, operand is less than zero
parameter quantize     = 3'b111;  // conversion result does not fit in dest, or a converted finite yields (or would yield) infinite result

//rounding mode encodings
parameter NEAREST = 2'b00;
parameter POSINF  = 2'b01;
parameter NEGINF  = 2'b10;
parameter ZERO    = 2'b11;

//FloPoCo exception codes
parameter zero = 2'b00;
parameter infinity = 2'b10;
parameter NaN = 2'b11;
parameter normal = 2'b01;

reg [68:0] Rq;

reg [51:0] interm_DP_fraction;
reg DP_roundit;
reg G, R, S;

reg [4:0] exception_code;

wire [1:0] FPin_exception;
wire FPin_sign;
wire [11:0] FPin_exponent;
wire [51:0] FPin_fraction;
wire FPin_is_invalid;
wire FPin_is_infinite; 
wire FPin_is_normal; 
wire FPin_is_NaN;      
wire FPin_is_zero;     
wire FPin_is_subnormal; 

wire DP_conv_overflow; 
wire DP_conv_underflow;
wire DP_conv_inexact;
  
wire [11:0] denormal_shift_amount;
wire [5:0] shift_amount;
wire [11:0] interm_DP_exponent;  
wire [63:0] DP_interm;     
wire [2:0] GRS;

assign FPin_exception = X[66:65];
assign FPin_sign = X[64];
assign FPin_exponent = X[63:52];
assign FPin_fraction = X[51:0];
assign FPin_is_infinite = wren && (FPin_exception==infinity);  
assign FPin_is_zero = wren && (FPin_exception==zero);
assign FPin_is_NaN = wren && (FPin_exception==NaN);
assign FPin_is_normal = wren && ((FPin_exception==normal) || FPin_is_zero);
assign FPin_is_subnormal = wren && (FPin_exponent < 1025) && FPin_is_normal && ~FPin_is_zero;                         // -1022 + 2047 = 1025
assign FPin_is_invalid = 1'b0;

assign DP_conv_overflow  = wren && (DP_interm[63:52] > 3070) && FPin_is_normal && ~FPin_is_zero;                 //  1023 + 2047 = 3070  overflow due to rounding

//assign DP_conv_underflow = wren && ((DP_interm[63:52] < 1025) || operator_underflow) && DP_roundit  && ~FPin_is_invalid;  // -1022 + 2047 = 1025  only signal underflow if it is also inexact after rounding--per IEEE754-2008
assign DP_conv_underflow = wren && (FPin_is_subnormal || operator_underflow) && DP_roundit  && ~FPin_is_invalid;  // -1022 + 2047 = 1025  only signal underflow if it is also inexact after rounding--per IEEE754-2008
assign DP_conv_inexact   = wren && (DP_conv_overflow || DP_conv_underflow || DP_roundit || |GRS) && ~FPin_is_invalid;    

assign denormal_shift_amount = (12'h401 - FPin_exponent[11:0]);   // -1022 + 2047 = 1025 = 11'h401
assign shift_amount = denormal_shift_amount[5:0];

assign interm_DP_exponent = FPin_is_subnormal ? 12'b0 : (FPin_exponent - 1024);  // -2047 + 1023 --rebias for DP 11 52
assign DP_interm = {interm_DP_exponent, interm_DP_fraction} + DP_roundit;  

assign GRS = {G, R, S};

// to support IEEE754-2008 subnormals for Size of DP, take the normal FP 12 52 subnormal fraction and denormalize it for DP 11 52 format

always@(*)
    if (FPin_is_subnormal) interm_DP_fraction = {1'b1, FPin_fraction[51:1]} >> (shift_amount - 1);
    else interm_DP_fraction = FPin_fraction;
    
always@(*)
    if (FPin_is_subnormal)
        case(shift_amount)
            53 : G = 1'b1;
            54 : G = 1'b0;
        default: G = FPin_fraction[shift_amount-1]; 
        endcase   
    else G = G_in;

always@(*) if (FPin_is_subnormal)
        case(shift_amount)
             1 : R = G_in;
            54 : R = 1'b1;
        default: R = FPin_fraction[shift_amount-2];
        endcase    
    else R = R_in;
            
always@(*) if (FPin_is_subnormal)
        case(shift_amount)
             1 : S = R_in || S_in;
             2 : S = G_in || R_in || S_in;
        default: S = |FPin_fraction[shift_amount-3] || G_in || R_in || S_in; 
        endcase   
    else S = S_in;
    
// DP_roundit           
always @(*)
    if (wren)
        case(round_mode)
            NEAREST : if (((GRS==3'b100) && (interm_DP_fraction[0] || Away) ) || (GRS[2] && |GRS[1:0])) DP_roundit = 1'b1;    //when GRS = (3'b100 && lsb) OR when GRS = 101 or 110 or 111 then round it
                      else DP_roundit = 1'b0;
            POSINF  : if (~FPin_sign && |GRS) DP_roundit = 1'b1;
                      else DP_roundit = 1'b0;
            NEGINF  : if (FPin_sign && |GRS) DP_roundit = 1'b1;
                      else DP_roundit = 1'b0;
            ZERO    : DP_roundit = 1'b0;
        endcase
   else DP_roundit = 1'b0;                  

// prioritized 2-bit exception encoder so that 18-bit RAMs can be used for result buffer
always @(*)
    if (DP_conv_overflow || operator_overflow) exception_code = _overflow_;
    else if (DP_conv_underflow) exception_code = _underflow_;
    else if (DP_conv_inexact || A_inexact || B_inexact) exception_code = _inexact_;
    else exception_code = _no_excpt_;
    
     
always @(posedge CLK ) 
    if (RESET) begin
        Rq <= 0;
    end    
    else if (wren) begin
        if (DP_conv_overflow) 
            case(round_mode)
                NEAREST : Rq <= {_overflow_, FPin_sign, 11'b11111111111, 52'b0};
                
                POSINF  : if (FPin_sign) Rq <= {_overflow_, FPin_sign, 11'b11111111110, 52'b1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111};  // most neg finite number for neg overflows
                          else Rq <= {_overflow_, FPin_sign, 11'b11111111111, 52'b0};                       // pos infinity for positive overflows
                                                                                             
                NEGINF  : if (FPin_sign) Rq <= {_overflow_, FPin_sign, 11'b11111111111, 52'b0};             // neg infinity for negative overflows
                          else Rq <= {_overflow_, FPin_sign, 11'b11111111110, 52'b1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111};            // most pos finite number for positive overflows
                          
                ZERO    : Rq <= {_overflow_, FPin_sign, 11'b11111111110, 52'b1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111};
            endcase
// this is for the case of original input being quiet or signaling NaN or result of invalid conversion at the head
        else if (FPin_is_NaN) Rq <= {1'b0, (A_invalid || B_invalid) ? _invalid_ : _no_excpt_, FPin_sign, 11'b11111111111, 1'b1, NaN_in[50:0]};  // quiet and propogate all NaNs.  If original was signaling, or the input is otherwise invalid, raise invalid flag (code 2'b01 in the MSBs)
// if inputs to actual operator are invalid, then flag it here for the operation specified by "invalid_code" 
        else if (trunk_invalid) Rq <= {_invalid_, FPin_sign, 11'b11111111111, 1'b1, invalid_code, {1'b0, Away, round_mode}, {2'b00, _trunk_}, {2'b00, _1152_}, 40'b0};
        else if (FPin_is_zero) Rq <= {exception_code, FPin_sign, 63'b0};                      
        else if (FPin_is_infinite || operator_overflow || div_by_0) Rq <= {(div_by_0 ? _div_x_0_ : exception_code), FPin_sign, 11'b11111111111, 52'b0};        // if input is infinite then propogate it and its exception code
        else  Rq <= {exception_code, FPin_sign, DP_interm[62:0]};                                  // normal or subnormal
    end                
    else Rq <= 69'b0;
               

    
endmodule
