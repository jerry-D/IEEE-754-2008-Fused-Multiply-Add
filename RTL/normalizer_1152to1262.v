 // normalizer_1152to1262.v
 `timescale 1ns/100ps
 
// Author:  Jerry D. Harthcock
// Version:  1.00  November 28, 2018
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
 
 
module normalizer_1152to1262 (
    fract_in,
    normalized_fract,
    normalized_exponent
    );

//input [51:0] fract_in;
input [54:0] fract_in;
output [61:0] normalized_fract;
output [11:0] normalized_exponent;


reg [5:0] first_1_position;
wire [11:0] normalized_exponent;
wire [61:0] normalized_fract;
/*
always @(*)
    case(fract_in)
        52'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd0;
        52'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd1;
        52'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd2;
        52'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd3;
        52'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd4;
        52'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd5;
        52'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd6;
        52'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd7;
        52'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd8;
        52'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd9;
        52'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd10;
        52'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd11;
        52'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd12;
        52'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd13;
        52'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd14;
        52'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd15;
        52'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd16;
        52'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd17;
        52'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd18;
        52'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd19;
        52'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd20;
        52'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd21;
        52'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd22;
        52'b000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd23;
        52'b0000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd24;
        52'b00000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd25;
        52'b000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd26;
        52'b0000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd27;
        52'b00000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd28;
        52'b000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd29;
        52'b0000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd30;
        52'b00000000000000000000000000000001xxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd31;
        52'b000000000000000000000000000000001xxxxxxxxxxxxxxxxxxx : first_1_position = 6'd32;
        52'b0000000000000000000000000000000001xxxxxxxxxxxxxxxxxx : first_1_position = 6'd33;
        52'b00000000000000000000000000000000001xxxxxxxxxxxxxxxxx : first_1_position = 6'd34;
        52'b000000000000000000000000000000000001xxxxxxxxxxxxxxxx : first_1_position = 6'd35;
        52'b0000000000000000000000000000000000001xxxxxxxxxxxxxxx : first_1_position = 6'd36;
        52'b00000000000000000000000000000000000001xxxxxxxxxxxxxx : first_1_position = 6'd37;
        52'b000000000000000000000000000000000000001xxxxxxxxxxxxx : first_1_position = 6'd38;
        52'b0000000000000000000000000000000000000001xxxxxxxxxxxx : first_1_position = 6'd39;
        52'b00000000000000000000000000000000000000001xxxxxxxxxxx : first_1_position = 6'd40;
        52'b000000000000000000000000000000000000000001xxxxxxxxxx : first_1_position = 6'd41;
        52'b0000000000000000000000000000000000000000001xxxxxxxxx : first_1_position = 6'd42;
        52'b00000000000000000000000000000000000000000001xxxxxxxx : first_1_position = 6'd43;
        52'b000000000000000000000000000000000000000000001xxxxxxx : first_1_position = 6'd44;
        52'b0000000000000000000000000000000000000000000001xxxxxx : first_1_position = 6'd45;
        52'b00000000000000000000000000000000000000000000001xxxxx : first_1_position = 6'd46;
        52'b000000000000000000000000000000000000000000000001xxxx : first_1_position = 6'd47;
        52'b0000000000000000000000000000000000000000000000001xxx : first_1_position = 6'd48;
        52'b00000000000000000000000000000000000000000000000001xx : first_1_position = 6'd49;
        52'b000000000000000000000000000000000000000000000000001x : first_1_position = 6'd50;
        52'b0000000000000000000000000000000000000000000000000001 : first_1_position = 6'd51;
                                                         default : first_1_position = 6'd0;
    endcase
*/

always @(*)
    case(fract_in)
        55'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd0;
        55'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd1;
        55'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd2;
        55'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd3;
        55'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd4;
        55'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd5;
        55'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd6;
        55'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd7;
        55'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd8;
        55'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd9;
        55'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd10;
        55'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd11;
        55'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd12;
        55'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd13;
        55'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd14;
        55'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd15;
        55'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd16;
        55'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd17;
        55'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd18;
        55'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd19;
        55'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd20;
        55'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd21;
        55'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd22;
        55'b000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd23;
        55'b0000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd24;
        55'b00000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd25;
        55'b000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd26;
        55'b0000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd27;
        55'b00000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd28;
        55'b000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd29;
        55'b0000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd30;
        55'b00000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd31;
        55'b000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd32;
        55'b0000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd33;
        55'b00000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxx : first_1_position = 6'd34;
        55'b000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxx : first_1_position = 6'd35;
        55'b0000000000000000000000000000000000001xxxxxxxxxxxxxxxxxx : first_1_position = 6'd36;
        55'b00000000000000000000000000000000000001xxxxxxxxxxxxxxxxx : first_1_position = 6'd37;
        55'b000000000000000000000000000000000000001xxxxxxxxxxxxxxxx : first_1_position = 6'd38;
        55'b0000000000000000000000000000000000000001xxxxxxxxxxxxxxx : first_1_position = 6'd39;
        55'b00000000000000000000000000000000000000001xxxxxxxxxxxxxx : first_1_position = 6'd40;
        55'b000000000000000000000000000000000000000001xxxxxxxxxxxxx : first_1_position = 6'd41;
        55'b0000000000000000000000000000000000000000001xxxxxxxxxxxx : first_1_position = 6'd42;
        55'b00000000000000000000000000000000000000000001xxxxxxxxxxx : first_1_position = 6'd43;
        55'b000000000000000000000000000000000000000000001xxxxxxxxxx : first_1_position = 6'd44;
        55'b0000000000000000000000000000000000000000000001xxxxxxxxx : first_1_position = 6'd45;
        55'b00000000000000000000000000000000000000000000001xxxxxxxx : first_1_position = 6'd46;
        55'b000000000000000000000000000000000000000000000001xxxxxxx : first_1_position = 6'd47;
        55'b0000000000000000000000000000000000000000000000001xxxxxx : first_1_position = 6'd48;
        55'b00000000000000000000000000000000000000000000000001xxxxx : first_1_position = 6'd49;
        55'b000000000000000000000000000000000000000000000000001xxxx : first_1_position = 6'd50;
        55'b0000000000000000000000000000000000000000000000000001xxx : first_1_position = 6'd51;
        55'b00000000000000000000000000000000000000000000000000001xx : first_1_position = 6'd52;
        55'b000000000000000000000000000000000000000000000000000001x : first_1_position = 6'd53;
        55'b0000000000000000000000000000000000000000000000000000001 : first_1_position = 6'd54;
                                                            default : first_1_position = 6'd0;
    endcase

assign normalized_exponent = 1024 - first_1_position;  //(4094 - 2047) - 1023 = 1024

// shifter for normalizing the fraction part of subnormal number for binary64 format                                                                                                 

//assign normalized_fract = {fract_in[50:0],  11'b0} << first_1_position;
assign normalized_fract = fract_in[53:0] << first_1_position;
                                                                            
endmodule                                                                      
                                                                               
                                                                               
                                                                               
                                                                               
                                                                               
                                                                               
                                                                               
                                                                               
                                                                               
                                                                               
                                                                               
                                                                               
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    