 // Univ_IEEE754_To_binary64.v
 `timescale 1ns/100ps
 
// Author:  Jerry D. Harthcock
// Version:  1.00  October 7, 2018
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
 

module Univ_IEEE754_To_binary64(
    wren,
    X,
    R,
    Src_Size        
    );
    
input wren;
input [63:0] X;
output [63:0] R;
input [1:0] Src_Size;

//precision (size) encodings
parameter DP = 2'b11;
parameter SP = 2'b10;
parameter HP = 2'b01;

reg [51:0] fraction_in;
reg [10:0] exponent_in;
reg sign_in;

wire [10:0] DP_input_exponent;
wire [51:0] DP_input_fraction;
wire DP_input_sign;

wire [7:0] SP_input_exponent;
wire [22:0] SP_input_fraction;
wire SP_input_sign;

wire [4:0] HP_input_exponent;
wire [9:0] HP_input_fraction;
wire HP_input_sign;

wire SP_subnormal;
wire HP_subnormal;

assign SP_subnormal = (Src_Size==SP) && ~|X[30:23] && |X[22:0];
assign HP_subnormal = (Src_Size==HP) && ~|X[14:10] && |X[9:0];

assign DP_input_exponent = X[62:52];
assign DP_input_fraction = X[51:0];
assign DP_input_sign = X[63];

assign SP_input_exponent = X[30:23];
assign SP_input_fraction = X[22:0];
assign SP_input_sign = X[31];

assign HP_input_exponent = X[14:10];
assign HP_input_fraction = X[9:0];
assign HP_input_sign = X[15];

wire [63:0] R;
assign R = {sign_in, exponent_in, fraction_in};

wire [10:0] normalized_exponent_SP;
wire [10:0] normalized_exponent_HP;

wire [51:0] normalized_fract_SP;
wire [51:0] normalized_fract_HP;


subn_normalizer_823 norm_823(
    .fract_in           (SP_input_fraction),
    .normalized_fract   (normalized_fract_SP),
    .normalized_exponent(normalized_exponent_SP)
    );

subn_normalizer_510 norm_510(
    .fract_in           (HP_input_fraction),
    .normalized_fract   (normalized_fract_HP),
    .normalized_exponent(normalized_exponent_HP)
    );


always @(*)
    if (wren)
        case(Src_Size)
            DP : sign_in = DP_input_sign;
            SP : sign_in = SP_input_sign;
            HP : sign_in = HP_input_sign;
            default : sign_in = 1'b0;
        endcase
    else sign_in = 1'b0;
      
always @(*)
    if (wren)
        case(Src_Size)
            DP : exponent_in = DP_input_exponent;    
            SP : exponent_in = SP_subnormal ? normalized_exponent_SP : (SP_input_exponent + 896); // - 127 + 1023;    
            HP : exponent_in = HP_subnormal ? normalized_exponent_HP : (HP_input_exponent + 1008);  // -15 + 1023
            default : exponent_in = 11'b0;
        endcase
    else exponent_in = 11'b0;  

always @(*)            
    if (wren) 
        case(Src_Size)
            DP : fraction_in = DP_input_fraction[51:0];
            SP : fraction_in = SP_subnormal ? normalized_fract_SP : {SP_input_fraction[22:0], 29'b0};
            HP : fraction_in = HP_subnormal ? normalized_fract_HP : {HP_input_fraction[9:0], 42'b0};
            default : fraction_in = 52'b0;
        endcase
    else fraction_in = 52'b0;
        

    
endmodule
