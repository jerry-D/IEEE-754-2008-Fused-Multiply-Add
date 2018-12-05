 // binary64toFP1262.v   --note input is unrounded and includes GRS bits of previous stage
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
 

module binary64toFP1262(
    CLK,
    RESET,
    X,
    R,
    invalid,
    underflow,
    overflow,
    inexact
    );
    
input CLK;
input RESET;
input [71:0] X;
output [76:0] R;
output invalid;
output underflow;
output overflow;
output inexact;

reg [76:0] R;
reg invalid;
reg inexact;
reg overflow;
reg underflow;

wire sign_in;
wire [10:0] exponent_in;
wire [54:0] fraction_in;

wire subnormal;

assign sign_in = X[66];
assign exponent_in = X[65:55];
assign fraction_in = X[54:0];

assign subnormal =  ~|exponent_in && |fraction_in;

    
wire isZero;
wire isInf;
wire isNorm;
wire isNaN;

wire isInexact;
wire isInvalid;
wire isOverflow;
wire isUnderflow;

assign isInexact = X[67];
assign isUnderflow = X[68];
assign isOverflow = X[69];
assign isInvalid = X[70] || (isNaN && X[61]);

assign isZero = ~|X[65:0];
assign isInf = &exponent_in && ~|fraction_in; 
assign isNorm = ~subnormal && ~isNaN;
assign isNaN = &exponent_in && ~|fraction_in[53:0];
wire [3:0] exceptSel;   

assign exceptSel = {isZero, isInf, isNorm, isNaN};

wire [11:0] normalized_exponent;

wire [61:0] normalized_fract;

normalizer_1155to1262 norm1155to1262(
    .fract_in            (fraction_in        ),
    .normalized_fract    (normalized_fract   ),
    .normalized_exponent (normalized_exponent)
    ); 


// exception codes for five MSBs [68:64] of final result
parameter _no_excpt_   = 5'b00000;  
parameter _inexact_    = 5'b00001;
parameter _underflow_  = 5'b00010;                     
parameter _overflow_   = 5'b00100;  
parameter _invalid_    = 5'b01000;  
parameter _div_x_0_    = 5'b10000;                       

wire [11:0] convExponent;
assign convExponent = subnormal ? normalized_exponent : (exponent_in + 1024);
wire [61:0] convFraction;
assign convFraction = subnormal ? normalized_fract : {fraction_in, 7'b0};

wire [63:0] test_R;
assign test_R = {sign_in, exponent_in, convFraction[61:10]};

always @(posedge CLK)
    if(RESET) begin
        R <= 0;
        invalid   <= 0;
        underflow <= 0;
        overflow  <= 0;
        inexact   <= 0;
    end    
    else begin
        casex(exceptSel)
            4'b1xxx : R <= {2'b00, sign_in, 74'b0};
            4'b01xx : R <= {2'b10, sign_in, 12'b111111111111, 62'b0};
            4'b001x : R <= {2'b01, sign_in, convExponent, convFraction};
            4'b0001 : R <= {2'b11, sign_in, 12'b111111111111, 1'b1, 61'b0};
            default : R <= {2'b00, sign_in, 74'b0};  
        endcase                      
        invalid   <= isInvalid;
        inexact   <= isInexact;
        underflow <= isUnderflow;
        overflow  <= isOverflow;
    end
    
endmodule
