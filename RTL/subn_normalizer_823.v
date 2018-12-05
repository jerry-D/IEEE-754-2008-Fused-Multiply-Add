 // subn_normalizer_823.v
 `timescale 1ns/100ps
 
// Author:  Jerry D. Harthcock
// Version:  1.00  October 9, 2018
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
 
 
module subn_normalizer_823 (
    fract_in,
    normalized_fract,
    normalized_exponent
    );

input [22:0] fract_in;
output [51:0] normalized_fract;
output [10:0] normalized_exponent;


reg [22:0] normalized_fract_interm;

wire [51:0] normalized_fract;

reg [4:0] first_1_position;
wire [10:0] normalized_exponent;

assign normalized_exponent = 896 - first_1_position;  //(2046 - 1023) - 127 = 896
assign normalized_fract = {normalized_fract_interm, 29'b0};

always @(*)
    case(fract_in)
        23'b1xxxxxxxxxxxxxxxxxxxxxx : first_1_position = 5'd0;
        23'b01xxxxxxxxxxxxxxxxxxxxx : first_1_position = 5'd1;
        23'b001xxxxxxxxxxxxxxxxxxxx : first_1_position = 5'd2;
        23'b0001xxxxxxxxxxxxxxxxxxx : first_1_position = 5'd3;
        23'b00001xxxxxxxxxxxxxxxxxx : first_1_position = 5'd4;
        23'b000001xxxxxxxxxxxxxxxxx : first_1_position = 5'd5;
        23'b0000001xxxxxxxxxxxxxxxx : first_1_position = 5'd6;
        23'b00000001xxxxxxxxxxxxxxx : first_1_position = 5'd7;
        23'b000000001xxxxxxxxxxxxxx : first_1_position = 5'd8;
        23'b0000000001xxxxxxxxxxxxx : first_1_position = 5'd9;
        23'b00000000001xxxxxxxxxxxx : first_1_position = 5'd10;
        23'b000000000001xxxxxxxxxxx : first_1_position = 5'd11;
        23'b0000000000001xxxxxxxxxx : first_1_position = 5'd12;
        23'b00000000000001xxxxxxxxx : first_1_position = 5'd13;
        23'b000000000000001xxxxxxxx : first_1_position = 5'd14;
        23'b0000000000000001xxxxxxx : first_1_position = 5'd15;
        23'b00000000000000001xxxxxx : first_1_position = 5'd16;
        23'b000000000000000001xxxxx : first_1_position = 5'd17;
        23'b0000000000000000001xxxx : first_1_position = 5'd18;
        23'b00000000000000000001xxx : first_1_position = 5'd19;
        23'b000000000000000000001xx : first_1_position = 5'd20;
        23'b0000000000000000000001x : first_1_position = 5'd21;
        23'b00000000000000000000001 : first_1_position = 5'd22;
                            default : first_1_position = 5'd0;
    endcase

// shifter for normalizing the fraction part of subnormal number for binary64 format                                                                                                 
 always @(*)                                                                                      
    case(first_1_position)                                                                     
          0 : normalized_fract_interm = {fract_in[21:0],  1'b0};
          1 : normalized_fract_interm = {fract_in[20:0],  2'b0};
          2 : normalized_fract_interm = {fract_in[19:0],  3'b0};
          3 : normalized_fract_interm = {fract_in[18:0],  4'b0};
          4 : normalized_fract_interm = {fract_in[17:0],  5'b0};
          5 : normalized_fract_interm = {fract_in[16:0],  6'b0};
          6 : normalized_fract_interm = {fract_in[15:0],  7'b0};
          7 : normalized_fract_interm = {fract_in[14:0],  8'b0};
          8 : normalized_fract_interm = {fract_in[13:0],  9'b0};
          9 : normalized_fract_interm = {fract_in[12:0], 10'b0};
         10 : normalized_fract_interm = {fract_in[11:0], 11'b0};
         11 : normalized_fract_interm = {fract_in[10:0], 12'b0};
         12 : normalized_fract_interm = {fract_in[ 9:0], 13'b0};
         13 : normalized_fract_interm = {fract_in[ 8:0], 14'b0};
         14 : normalized_fract_interm = {fract_in[ 7:0], 15'b0};
         15 : normalized_fract_interm = {fract_in[ 6:0], 16'b0};
         16 : normalized_fract_interm = {fract_in[ 5:0], 17'b0};
         17 : normalized_fract_interm = {fract_in[ 4:0], 18'b0};
         18 : normalized_fract_interm = {fract_in[ 3:0], 19'b0};
         19 : normalized_fract_interm = {fract_in[ 2:0], 20'b0};
         20 : normalized_fract_interm = {fract_in[ 1:0], 21'b0};
         21 : normalized_fract_interm = {fract_in[   0], 22'b0};
    default : normalized_fract_interm = 23'b0;                                              
    endcase 
      
                                                                        
endmodule                                                                      
                                                                               
                                                                               
                                                                               
                                                                               
                                                                               
                                                                               
                                                                               
                                                                               
                                                                               
                                                                               
                                                                               
                                                                               
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    