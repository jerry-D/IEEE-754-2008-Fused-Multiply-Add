//  decCharToBinFractPart.v
 
// Author:  Jerry D. Harthcock
// Version:  1.00  October 16, 2018
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

module decCharToBinFractPart (
    CLK,
    RESET,
    wren_del_2,
    decExp_del_2,
    fractIsZero,
    fractIsSubnormal,
    fractPartBin,
    fractPartMant,
    biasedBinExpOut,
    fractGRS,
    fractInexact,
    subnShiftAmtOut
    );

input CLK;
input RESET;
input wren_del_2;
input [8:0] decExp_del_2;
input fractIsZero;
input fractIsSubnormal;
input [66:0] fractPartBin;
output [52:0] fractPartMant; 
output [10:0] biasedBinExpOut;
output [2:0] fractGRS;
output fractInexact;
output [5:0] subnShiftAmtOut;

wire [2:0] fractGRS;

wire [52:0] fractPartMant;
wire [10:0] biasedExp;
wire [10:0] biasedBinExpOut;
wire [66:0] FractWeight;
wire [5:0] subnShiftAmtOut;

reg [66:0] fractPartBin_q3;
always @(posedge CLK)
    if (RESET) fractPartBin_q3 <= 0;
    else fractPartBin_q3 <= fractPartBin;  

DecCharToBinROMweightsFract DctbRomFract(
    .CLK             (CLK             ),
    .RESET           (RESET           ),
    .rden            (wren_del_2      ),
    .decExpIn        (decExp_del_2    ),
    .fractIsZero     (fractIsZero     ),
    .fractIsSubnormal(fractIsSubnormal),
    .fractPartBin    (fractPartBin_q3 ),
    .FractWeightOut  (FractWeight     ),
    .binExpOut       (biasedExp       ),
    .subnShiftAmtOut (subnShiftAmtOut )
    );  
    
wire d52;   
wire [67:0] fractBin52Test;                                                
wire fractGTE52;
wire [66:0] fractBin51;
assign fractBin52Test = fractPartBin_q3 - FractWeight;
assign fractGTE52 = ~fractBin52Test[67] || ~|fractBin52Test; 
assign fractBin51 = fractGTE52 ? fractBin52Test[66:0] : fractPartBin_q3[66:0];
assign d52 = fractGTE52 && |fractPartBin_q3;   

wire d51;
wire [67:0] fractBin51Test;
wire fractGTE51;
wire [66:0] fractBin50;
assign fractBin51Test = fractBin51 - (FractWeight >> 1);
assign fractGTE51 = ~fractBin51Test[67] || ~|fractBin51Test; 
assign fractBin50 = fractGTE51 ? fractBin51Test[66:0] : fractBin51;
assign d51 = fractGTE51 && |fractBin51;

wire d50;
wire [67:0] fractBin50Test;
wire fractGTE50;
wire [66:0] fractBin49;
assign fractBin50Test = fractBin50 - (FractWeight >> 2);
assign fractGTE50 = ~fractBin50Test[67] || ~|fractBin50Test; 
assign fractBin49 = fractGTE50 ? fractBin50Test[66:0] : fractBin50;
assign d50 = fractGTE50 && |fractBin50;

reg d52_q4;
reg d51_q4;
reg d50_q4;
reg [66:0] fractBin49_q4;
reg [66:0] FractWeight_q4;
reg [10:0] biasedExp_q4;
always @(posedge CLK)
    if (RESET) begin
        d52_q4       <= 0;
        d51_q4       <= 0;
        d50_q4       <= 0;
        fractBin49_q4  <= 0;
        FractWeight_q4 <= 0;
        biasedExp_q4   <= 0;
    end
    else begin
        d52_q4       <= d52;
        d51_q4       <= d51;
        d50_q4       <= d50;
        fractBin49_q4  <= fractBin49;
        FractWeight_q4 <= FractWeight;    
        biasedExp_q4   <= biasedExp;
    end
    
wire d49;
wire [67:0] fractBin49Test;
wire fractGTE49;
wire [66:0] fractBin48;
assign fractBin49Test = fractBin49_q4 - (FractWeight_q4 >> 3);
assign fractGTE49 = ~fractBin49Test[67] || ~|fractBin49Test; 
assign fractBin48 = fractGTE49 ? fractBin49Test[66:0] : fractBin49_q4;
assign d49 = fractGTE49 && |fractBin49_q4;

wire d48;
wire [67:0] fractBin48Test;
wire fractGTE48;
wire [66:0] fractBin47;
assign fractBin48Test = fractBin48 - (FractWeight_q4 >> 4);
assign fractGTE48 = ~fractBin48Test[67] || ~|fractBin48Test; 
assign fractBin47 = fractGTE48 ? fractBin48Test[66:0] : fractBin48;
assign d48 = fractGTE48 && |fractBin48;

wire d47;
wire [67:0] fractBin47Test;
wire fractGTE47;
wire [66:0] fractBin46;
assign fractBin47Test = fractBin47 - (FractWeight_q4 >> 5);
assign fractGTE47 = ~fractBin47Test[67] || ~|fractBin47Test; 
assign fractBin46 = fractGTE47 ? fractBin47Test[66:0] : fractBin47;
assign d47 = fractGTE47 && |fractBin47;

reg d52_q5;
reg d51_q5;
reg d50_q5;
reg d49_q5;
reg d48_q5;
reg d47_q5;
reg [66:0] fractBin46_q5;
reg [66:0] FractWeight_q5;
reg [10:0] biasedExp_q5;
always @(posedge CLK)
    if (RESET) begin
        d52_q5       <= 0;
        d51_q5       <= 0;
        d50_q5       <= 0;
        d49_q5       <= 0;
        d48_q5       <= 0;
        d47_q5       <= 0;
        fractBin46_q5  <= 0;
        FractWeight_q5 <= 0;
        biasedExp_q5   <= 0;
    end
    else begin
        d52_q5       <= d52_q4;
        d51_q5       <= d51_q4;
        d50_q5       <= d50_q4;
        d49_q5       <= d49;
        d48_q5       <= d48;
        d47_q5       <= d47;
        fractBin46_q5  <= fractBin46;
        FractWeight_q5 <= FractWeight_q4;    
        biasedExp_q5   <= biasedExp_q4;
    end

wire d46;
wire [67:0] fractBin46Test;
wire fractGTE46;
wire [66:0] fractBin45;
assign fractBin46Test = fractBin46_q5 - (FractWeight_q5 >> 6);
assign fractGTE46 = ~fractBin46Test[67] || ~|fractBin46Test; 
assign fractBin45 = fractGTE46 ? fractBin46Test[66:0] : fractBin46_q5;
assign d46 = fractGTE46 && |fractBin46_q5;

wire d45;
wire [67:0] fractBin45Test;
wire fractGTE45;
wire [66:0] fractBin44;
assign fractBin45Test = fractBin45 - (FractWeight_q5 >> 7);
assign fractGTE45 = ~fractBin45Test[67] || ~|fractBin45Test; 
assign fractBin44 = fractGTE45 ? fractBin45Test[66:0] : fractBin45;
assign d45 = fractGTE45 && |fractBin45;

wire d44;
wire [67:0] fractBin44Test;
wire fractGTE44;
wire [66:0] fractBin43;
assign fractBin44Test = fractBin44 - (FractWeight_q5 >> 8);
assign fractGTE44 = ~fractBin44Test[67] || ~|fractBin44Test; 
assign fractBin43 = fractGTE44 ? fractBin44Test[66:0] : fractBin44;
assign d44 = fractGTE44 && |fractBin44;

reg d52_q6;
reg d51_q6;
reg d50_q6;
reg d49_q6;
reg d48_q6;
reg d47_q6;
reg d46_q6;
reg d45_q6;
reg d44_q6;
reg [66:0] fractBin43_q6;
reg [66:0] FractWeight_q6;
reg [10:0] biasedExp_q6;
always @(posedge CLK)
    if (RESET) begin
        d52_q6       <= 0;
        d51_q6       <= 0;
        d50_q6       <= 0;
        d49_q6       <= 0;
        d48_q6       <= 0;
        d47_q6       <= 0;
        d46_q6       <= 0;
        d45_q6       <= 0;
        d44_q6       <= 0;
        fractBin43_q6  <= 0;
        FractWeight_q6 <= 0;
        biasedExp_q6   <= 0;
    end
    else begin
        d52_q6       <= d52_q5;
        d51_q6       <= d51_q5;
        d50_q6       <= d50_q5;
        d49_q6       <= d49_q5;
        d48_q6       <= d48_q5;
        d47_q6       <= d47_q5;
        d46_q6       <= d46;
        d45_q6       <= d45;
        d44_q6       <= d44;
        fractBin43_q6  <= fractBin43;
        FractWeight_q6 <= FractWeight_q5;    
        biasedExp_q6   <= biasedExp_q5;
    end

wire d43;
wire [67:0] fractBin43Test;
wire fractGTE43;
wire [66:0] fractBin42;
assign fractBin43Test = fractBin43_q6 - (FractWeight_q6 >> 9);
assign fractGTE43 = ~fractBin43Test[67] || ~|fractBin43Test; 
assign fractBin42 = fractGTE43 ? fractBin43Test[66:0] : fractBin43_q6;
assign d43 = fractGTE43 && |fractBin43_q6;

wire d42;
wire [67:0] fractBin42Test;
wire fractGTE42;
wire [66:0] fractBin41;
assign fractBin42Test = fractBin42 - (FractWeight_q6 >> 10);
assign fractGTE42 = ~fractBin42Test[67] || ~|fractBin42Test; 
assign fractBin41 = fractGTE42 ? fractBin42Test[66:0] : fractBin42;
assign d42 = fractGTE42 && |fractBin42;

wire d41;
wire [67:0] fractBin41Test;
wire fractGTE41;
wire [66:0] fractBin40;
assign fractBin41Test = fractBin41 - (FractWeight_q6 >> 11);
assign fractGTE41 = ~fractBin41Test[67] || ~|fractBin41Test; 
assign fractBin40 = fractGTE41 ? fractBin41Test[66:0] : fractBin41;
assign d41 = fractGTE41 && |fractBin41;

reg d52_q7;
reg d51_q7;
reg d50_q7;
reg d49_q7;
reg d48_q7;
reg d47_q7;
reg d46_q7;
reg d45_q7;
reg d44_q7;
reg d43_q7;
reg d42_q7;
reg d41_q7;
reg [66:0] fractBin40_q7;
reg [66:0] FractWeight_q7;
reg [10:0] biasedExp_q7;
always @(posedge CLK)
    if (RESET) begin
        d52_q7       <= 0;
        d51_q7       <= 0;
        d50_q7       <= 0;
        d49_q7       <= 0;
        d48_q7       <= 0;
        d47_q7       <= 0;
        d46_q7       <= 0;
        d45_q7       <= 0;
        d44_q7       <= 0;
        d43_q7       <= 0;
        d42_q7       <= 0;
        d41_q7       <= 0;
        fractBin40_q7  <= 0;
        FractWeight_q7 <= 0;
        biasedExp_q7   <= 0;
    end
    else begin
        d52_q7       <= d52_q6;
        d51_q7       <= d51_q6;
        d50_q7       <= d50_q6;
        d49_q7       <= d49_q6;
        d48_q7       <= d48_q6;
        d47_q7       <= d47_q6;
        d46_q7       <= d46_q6;
        d45_q7       <= d45_q6;
        d44_q7       <= d44_q6;
        d43_q7       <= d43;        
        d42_q7       <= d42;        
        d41_q7       <= d41;        
        fractBin40_q7  <= fractBin40;
        FractWeight_q7 <= FractWeight_q6;    
        biasedExp_q7   <= biasedExp_q6;
    end

wire d40;
wire [67:0] fractBin40Test;
wire fractGTE40;
wire [66:0] fractBin39;
assign fractBin40Test = fractBin40_q7 - (FractWeight_q7 >> 12);
assign fractGTE40 = ~fractBin40Test[67] || ~|fractBin40Test; 
assign fractBin39 = fractGTE40 ? fractBin40Test[66:0] : fractBin40_q7;
assign d40 = fractGTE40 && |fractBin40_q7;

wire d39;
wire [67:0] fractBin39Test;
wire fractGTE39;
wire [66:0] fractBin38;
assign fractBin39Test = fractBin39 - (FractWeight_q7 >> 13);
assign fractGTE39 = ~fractBin39Test[67] || ~|fractBin39Test; 
assign fractBin38 = fractGTE39 ? fractBin39Test[66:0] : fractBin39;
assign d39 = fractGTE39 && |fractBin39;

wire d38;
wire [67:0] fractBin38Test;
wire fractGTE38;
wire [66:0] fractBin37;
assign fractBin38Test = fractBin38 - (FractWeight_q7 >> 14);
assign fractGTE38 = ~fractBin38Test[67] || ~|fractBin38Test; 
assign fractBin37 = fractGTE38 ? fractBin38Test[66:0] : fractBin38;
assign d38 = fractGTE38 && |fractBin38;

reg d52_q8;
reg d51_q8;
reg d50_q8;
reg d49_q8;
reg d48_q8;
reg d47_q8;
reg d46_q8;
reg d45_q8;
reg d44_q8;
reg d43_q8;
reg d42_q8;
reg d41_q8;
reg d40_q8;
reg d39_q8;
reg d38_q8;
reg [66:0] fractBin37_q8;
reg [66:0] FractWeight_q8;
reg [10:0] biasedExp_q8;
always @(posedge CLK)
    if (RESET) begin
        d52_q8       <= 0;
        d51_q8       <= 0;
        d50_q8       <= 0;
        d49_q8       <= 0;
        d48_q8       <= 0;
        d47_q8       <= 0;
        d46_q8       <= 0;
        d45_q8       <= 0;
        d44_q8       <= 0;
        d43_q8       <= 0;
        d42_q8       <= 0;
        d41_q8       <= 0;
        d40_q8       <= 0;
        d39_q8       <= 0;
        d38_q8       <= 0;
        fractBin37_q8  <= 0;
        FractWeight_q8 <= 0;
        biasedExp_q8   <= 0;
    end
    else begin
        d52_q8       <= d52_q7;
        d51_q8       <= d51_q7;
        d50_q8       <= d50_q7;
        d49_q8       <= d49_q7;
        d48_q8       <= d48_q7;
        d47_q8       <= d47_q7;
        d46_q8       <= d46_q7;
        d45_q8       <= d45_q7;
        d44_q8       <= d44_q7;
        d43_q8       <= d43_q7;        
        d42_q8       <= d42_q7;        
        d41_q8       <= d41_q7;        
        d40_q8       <= d40;
        d39_q8       <= d39;
        d38_q8       <= d38;
        fractBin37_q8  <= fractBin37;
        FractWeight_q8 <= FractWeight_q7;    
        biasedExp_q8   <= biasedExp_q7;
    end

wire d37;
wire [67:0] fractBin37Test;
wire fractGTE37;
wire [66:0] fractBin36;
assign fractBin37Test = fractBin37_q8 - (FractWeight_q8 >> 15);
assign fractGTE37 = ~fractBin37Test[67] || ~|fractBin37Test; 
assign fractBin36 = fractGTE37 ? fractBin37Test[66:0] : fractBin37_q8;
assign d37 = fractGTE37 && |fractBin37_q8;

wire d36;
wire [67:0] fractBin36Test;
wire fractGTE36;
wire [66:0] fractBin35;
assign fractBin36Test = fractBin36 - (FractWeight_q8 >> 16);
assign fractGTE36 = ~fractBin36Test[67] || ~|fractBin36Test; 
assign fractBin35 = fractGTE36 ? fractBin36Test[66:0] : fractBin36;
assign d36 = fractGTE36 && |fractBin36;

wire d35;
wire [67:0] fractBin35Test;
wire fractGTE35;
wire [66:0] fractBin34;
assign fractBin35Test = fractBin35 - (FractWeight_q8 >> 17);
assign fractGTE35 = ~fractBin35Test[67] || ~|fractBin35Test; 
assign fractBin34 = fractGTE35 ? fractBin35Test[66:0] : fractBin35;
assign d35 = fractGTE35 && |fractBin35;

reg d52_q9;
reg d51_q9;
reg d50_q9;
reg d49_q9;
reg d48_q9;
reg d47_q9;
reg d46_q9;
reg d45_q9;
reg d44_q9;
reg d43_q9;
reg d42_q9;
reg d41_q9;
reg d40_q9;
reg d39_q9;
reg d38_q9;
reg d37_q9;
reg d36_q9;
reg d35_q9;
reg [66:0] fractBin34_q9;
reg [66:0] FractWeight_q9;
reg [10:0] biasedExp_q9;
always @(posedge CLK)
    if (RESET) begin
        d52_q9       <= 0;
        d51_q9       <= 0;
        d50_q9       <= 0;
        d49_q9       <= 0;
        d48_q9       <= 0;
        d47_q9       <= 0;
        d46_q9       <= 0;
        d45_q9       <= 0;
        d44_q9       <= 0;
        d43_q9       <= 0;
        d42_q9       <= 0;
        d41_q9       <= 0;
        d40_q9       <= 0;
        d39_q9       <= 0;
        d38_q9       <= 0;
        d37_q9       <= 0;
        d36_q9       <= 0;
        d35_q9       <= 0;
        fractBin34_q9  <= 0;
        FractWeight_q9 <= 0;
        biasedExp_q9   <= 0;
    end
    else begin
        d52_q9       <= d52_q8;
        d51_q9       <= d51_q8;
        d50_q9       <= d50_q8;
        d49_q9       <= d49_q8;
        d48_q9       <= d48_q8;
        d47_q9       <= d47_q8;
        d46_q9       <= d46_q8;
        d45_q9       <= d45_q8;
        d44_q9       <= d44_q8;
        d43_q9       <= d43_q8;        
        d42_q9       <= d42_q8;        
        d41_q9       <= d41_q8;        
        d40_q9       <= d40_q8;
        d39_q9       <= d39_q8;
        d38_q9       <= d38_q8;
        d37_q9       <= d37;
        d36_q9       <= d36;
        d35_q9       <= d35;
        fractBin34_q9  <= fractBin34;
        FractWeight_q9 <= FractWeight_q8;    
        biasedExp_q9 <= biasedExp_q8;
    end

wire d34;
wire [67:0] fractBin34Test;
wire fractGTE34;
wire [66:0] fractBin33;
assign fractBin34Test = fractBin34_q9 - (FractWeight_q9 >> 18);
assign fractGTE34 = ~fractBin34Test[67] || ~|fractBin34Test; 
assign fractBin33 = fractGTE34 ? fractBin34Test[66:0] : fractBin34_q9;
assign d34 = fractGTE34 && |fractBin34_q9;

wire d33;
wire [67:0] fractBin33Test;
wire fractGTE33;
wire [66:0] fractBin32;
assign fractBin33Test = fractBin33 - (FractWeight_q9 >> 19);
assign fractGTE33 = ~fractBin33Test[67] || ~|fractBin33Test; 
assign fractBin32 = fractGTE33 ? fractBin33Test[66:0] : fractBin33;
assign d33 = fractGTE33 && |fractBin33;

wire d32;
wire [67:0] fractBin32Test;
wire fractGTE32;
wire [66:0] fractBin31;
assign fractBin32Test = fractBin32 - (FractWeight_q9 >> 20);
assign fractGTE32 = ~fractBin32Test[67] || ~|fractBin32Test; 
assign fractBin31 = fractGTE32 ? fractBin32Test[66:0] : fractBin32;
assign d32 = fractGTE32 && |fractBin32;

reg d52_q10;
reg d51_q10;
reg d50_q10;
reg d49_q10;
reg d48_q10;
reg d47_q10;
reg d46_q10;
reg d45_q10;
reg d44_q10;
reg d43_q10;
reg d42_q10;
reg d41_q10;
reg d40_q10;
reg d39_q10;
reg d38_q10;
reg d37_q10;
reg d36_q10;
reg d35_q10;
reg d34_q10;
reg d33_q10;
reg d32_q10;
reg [66:0] fractBin31_q10;
reg [66:0] FractWeight_q10;
reg [10:0] biasedExp_q10;
always @(posedge CLK)
    if (RESET) begin
        d52_q10       <= 0;
        d51_q10       <= 0;
        d50_q10       <= 0;
        d49_q10       <= 0;
        d48_q10       <= 0;
        d47_q10       <= 0;
        d46_q10       <= 0;
        d45_q10       <= 0;
        d44_q10       <= 0;
        d43_q10       <= 0;
        d42_q10       <= 0;
        d41_q10       <= 0;
        d40_q10       <= 0;
        d39_q10       <= 0;
        d38_q10       <= 0;
        d37_q10       <= 0;
        d36_q10       <= 0;
        d35_q10       <= 0;
        d34_q10       <= 0;
        d33_q10       <= 0;
        d32_q10       <= 0;
        fractBin31_q10  <= 0;
        FractWeight_q10 <= 0;
        biasedExp_q10   <= 0;
    end
    else begin
        d52_q10       <= d52_q9;
        d51_q10       <= d51_q9;
        d50_q10       <= d50_q9;
        d49_q10       <= d49_q9;
        d48_q10       <= d48_q9;
        d47_q10       <= d47_q9;
        d46_q10       <= d46_q9;
        d45_q10       <= d45_q9;
        d44_q10       <= d44_q9;
        d43_q10       <= d43_q9;        
        d42_q10       <= d42_q9;        
        d41_q10       <= d41_q9;        
        d40_q10       <= d40_q9;
        d39_q10       <= d39_q9;
        d38_q10       <= d38_q9;
        d37_q10       <= d37_q9;
        d36_q10       <= d36_q9;
        d35_q10       <= d35_q9;
        d34_q10       <= d34;
        d33_q10       <= d33;
        d32_q10       <= d32;
        fractBin31_q10  <= fractBin31;
        FractWeight_q10 <= FractWeight_q9;    
        biasedExp_q10  <= biasedExp_q9;
    end

wire d31;
wire [67:0] fractBin31Test;
wire fractGTE31;
wire [66:0] fractBin30;
assign fractBin31Test = fractBin31_q10 - (FractWeight_q10 >> 21);
assign fractGTE31 = ~fractBin31Test[67] || ~|fractBin31Test; 
assign fractBin30 = fractGTE31 ? fractBin31Test[66:0] : fractBin31_q10;
assign d31 = fractGTE31 && |fractBin31_q10;

wire d30;
wire [67:0] fractBin30Test;
wire fractGTE30;
wire [66:0] fractBin29;
assign fractBin30Test = fractBin30 - (FractWeight_q10 >> 22);
assign fractGTE30 = ~fractBin30Test[67] || ~|fractBin30Test; 
assign fractBin29 = fractGTE30 ? fractBin30Test[66:0] : fractBin30;
assign d30 = fractGTE30 && |fractBin30;

wire d29;
wire [67:0] fractBin29Test;
wire fractGTE29;
wire [66:0] fractBin28;
assign fractBin29Test = fractBin29 - (FractWeight_q10 >> 23);
assign fractGTE29 = ~fractBin29Test[67] || ~|fractBin29Test; 
assign fractBin28 = fractGTE29 ? fractBin29Test[66:0] : fractBin29;
assign d29 = fractGTE29 && |fractBin29;

reg d52_q11;
reg d51_q11;
reg d50_q11;
reg d49_q11;
reg d48_q11;
reg d47_q11;
reg d46_q11;
reg d45_q11;
reg d44_q11;
reg d43_q11;
reg d42_q11;
reg d41_q11;
reg d40_q11;
reg d39_q11;
reg d38_q11;
reg d37_q11;
reg d36_q11;
reg d35_q11;
reg d34_q11;
reg d33_q11;
reg d32_q11;
reg d31_q11;
reg d30_q11;
reg d29_q11;
reg [66:0] fractBin28_q11;
reg [66:0] FractWeight_q11;
reg [10:0] biasedExp_q11;
always @(posedge CLK)
    if (RESET) begin
        d52_q11       <= 0;
        d51_q11       <= 0;
        d50_q11       <= 0;
        d49_q11       <= 0;
        d48_q11       <= 0;
        d47_q11       <= 0;
        d46_q11       <= 0;
        d45_q11       <= 0;
        d44_q11       <= 0;
        d43_q11       <= 0;
        d42_q11       <= 0;
        d41_q11       <= 0;
        d40_q11       <= 0;
        d39_q11       <= 0;
        d38_q11       <= 0;
        d37_q11       <= 0;
        d36_q11       <= 0;
        d35_q11       <= 0;
        d34_q11       <= 0;
        d33_q11       <= 0;
        d32_q11       <= 0;
        d31_q11       <= 0;
        d30_q11       <= 0;
        d29_q11       <= 0;
        fractBin28_q11  <= 0;
        FractWeight_q11 <= 0;
        biasedExp_q11   <= 0;
    end
    else begin
        d52_q11       <= d52_q10;
        d51_q11       <= d51_q10;
        d50_q11       <= d50_q10;
        d49_q11       <= d49_q10;
        d48_q11       <= d48_q10;
        d47_q11       <= d47_q10;
        d46_q11       <= d46_q10;
        d45_q11       <= d45_q10;
        d44_q11       <= d44_q10;
        d43_q11       <= d43_q10;        
        d42_q11       <= d42_q10;        
        d41_q11       <= d41_q10;        
        d40_q11       <= d40_q10;
        d39_q11       <= d39_q10;
        d38_q11       <= d38_q10;
        d37_q11       <= d37_q10;
        d36_q11       <= d36_q10;
        d35_q11       <= d35_q10;
        d34_q11       <= d34_q10;
        d33_q11       <= d33_q10;
        d32_q11       <= d32_q10;
        d31_q11       <= d31;
        d30_q11       <= d30;
        d29_q11       <= d29;
        fractBin28_q11  <= fractBin28;
        FractWeight_q11 <= FractWeight_q10;    
        biasedExp_q11   <= biasedExp_q10;
    end

wire d28;
wire [67:0] fractBin28Test;
wire fractGTE28;
wire [66:0] fractBin27;
assign fractBin28Test = fractBin28_q11 - (FractWeight_q11 >> 24);
assign fractGTE28 = ~fractBin28Test[66] || ~|fractBin28Test; 
assign fractBin27 = fractGTE28 ? fractBin28Test[66:0] : fractBin28_q11;
assign d28 = fractGTE28 && |fractBin28_q11;

wire d27;
wire [67:0] fractBin27Test;
wire fractGTE27;
wire [66:0] fractBin26;
assign fractBin27Test = fractBin27 - (FractWeight_q11 >> 25);
assign fractGTE27 = ~fractBin27Test[67] || ~|fractBin27Test; 
assign fractBin26 = fractGTE27 ? fractBin27Test[66:0] : fractBin27;
assign d27 = fractGTE27 && |fractBin27;

wire d26;
wire [67:0] fractBin26Test;
wire fractGTE26;
wire [66:0] fractBin25;
assign fractBin26Test = fractBin26 - (FractWeight_q11 >> 26);
assign fractGTE26 = ~fractBin26Test[67] || ~|fractBin26Test; 
assign fractBin25 = fractGTE26 ? fractBin26Test[66:0] : fractBin26;
assign d26 = fractGTE26 && |fractBin26;

reg d52_q12;
reg d51_q12;
reg d50_q12;
reg d49_q12;
reg d48_q12;
reg d47_q12;
reg d46_q12;
reg d45_q12;
reg d44_q12;
reg d43_q12;
reg d42_q12;
reg d41_q12;
reg d40_q12;
reg d39_q12;
reg d38_q12;
reg d37_q12;
reg d36_q12;
reg d35_q12;
reg d34_q12;
reg d33_q12;
reg d32_q12;
reg d31_q12;
reg d30_q12;
reg d29_q12;
reg d28_q12;
reg d27_q12;
reg d26_q12;
reg [66:0] fractBin25_q12;
reg [66:0] FractWeight_q12;
reg [10:0] biasedExp_q12;
always @(posedge CLK)
    if (RESET) begin
        d52_q12       <= 0;
        d51_q12       <= 0;
        d50_q12       <= 0;
        d49_q12       <= 0;
        d48_q12       <= 0;
        d47_q12       <= 0;
        d46_q12       <= 0;
        d45_q12       <= 0;
        d44_q12       <= 0;
        d43_q12       <= 0;
        d42_q12       <= 0;
        d41_q12       <= 0;
        d40_q12       <= 0;
        d39_q12       <= 0;
        d38_q12       <= 0;
        d37_q12       <= 0;
        d36_q12       <= 0;
        d35_q12       <= 0;
        d34_q12       <= 0;
        d33_q12       <= 0;
        d32_q12       <= 0;
        d31_q12       <= 0;
        d30_q12       <= 0;
        d29_q12       <= 0;
        d28_q12       <= 0;
        d27_q12       <= 0;
        d26_q12       <= 0;
        fractBin25_q12  <= 0;
        FractWeight_q12 <= 0;
        biasedExp_q12   <= 0;
    end
    else begin
        d52_q12       <= d52_q11;
        d51_q12       <= d51_q11;
        d50_q12       <= d50_q11;
        d49_q12       <= d49_q11;
        d48_q12       <= d48_q11;
        d47_q12       <= d47_q11;
        d46_q12       <= d46_q11;
        d45_q12       <= d45_q11;
        d44_q12       <= d44_q11;
        d43_q12       <= d43_q11;        
        d42_q12       <= d42_q11;        
        d41_q12       <= d41_q11;        
        d40_q12       <= d40_q11;
        d39_q12       <= d39_q11;
        d38_q12       <= d38_q11;
        d37_q12       <= d37_q11;
        d36_q12       <= d36_q11;
        d35_q12       <= d35_q11;
        d34_q12       <= d34_q11;
        d33_q12       <= d33_q11;
        d32_q12       <= d32_q11;
        d31_q12       <= d31_q11;
        d30_q12       <= d30_q11;
        d29_q12       <= d29_q11;
        d28_q12       <= d28;
        d27_q12       <= d27;
        d26_q12       <= d26;
        fractBin25_q12  <= fractBin25;
        FractWeight_q12 <= FractWeight_q11;    
        biasedExp_q12   <= biasedExp_q11;
    end

wire d25;
wire [67:0] fractBin25Test;
wire fractGTE25;
wire [66:0] fractBin24;
assign fractBin25Test = fractBin25_q12 - (FractWeight_q12 >> 27);
assign fractGTE25 = ~fractBin25Test[67] || ~|fractBin25Test; 
assign fractBin24 = fractGTE25 ? fractBin25Test[66:0] : fractBin25_q12;
assign d25 = fractGTE25 && |fractBin25_q12;

wire d24;
wire [67:0] fractBin24Test;
wire fractGTE24;
wire [66:0] fractBin23;
assign fractBin24Test = fractBin24 - (FractWeight_q12 >> 28);
assign fractGTE24 = ~fractBin24Test[67] || ~|fractBin24Test; 
assign fractBin23 = fractGTE24 ? fractBin24Test[66:0] : fractBin24;
assign d24 = fractGTE24 && |fractBin24;

wire d23;
wire [67:0] fractBin23Test;
wire fractGTE23;
wire [66:0] fractBin22;
assign fractBin23Test = fractBin23 - (FractWeight_q12 >> 29);
assign fractGTE23 = ~fractBin23Test[67] || ~|fractBin23Test; 
assign fractBin22 = fractGTE23 ? fractBin23Test[66:0] : fractBin23;
assign d23 = fractGTE23 && |fractBin23;

reg d52_q13;
reg d51_q13;
reg d50_q13;
reg d49_q13;
reg d48_q13;
reg d47_q13;
reg d46_q13;
reg d45_q13;
reg d44_q13;
reg d43_q13;
reg d42_q13;
reg d41_q13;
reg d40_q13;
reg d39_q13;
reg d38_q13;
reg d37_q13;
reg d36_q13;
reg d35_q13;
reg d34_q13;
reg d33_q13;
reg d32_q13;
reg d31_q13;
reg d30_q13;
reg d29_q13;
reg d28_q13;
reg d27_q13;
reg d26_q13;
reg d25_q13;
reg d24_q13;
reg d23_q13;
reg [66:0] fractBin22_q13;
reg [66:0] FractWeight_q13;
reg [10:0] biasedExp_q13;
always @(posedge CLK)
    if (RESET) begin
        d52_q13       <= 0;
        d51_q13       <= 0;
        d50_q13       <= 0;
        d49_q13       <= 0;
        d48_q13       <= 0;
        d47_q13       <= 0;
        d46_q13       <= 0;
        d45_q13       <= 0;
        d44_q13       <= 0;
        d43_q13       <= 0;
        d42_q13       <= 0;
        d41_q13       <= 0;
        d40_q13       <= 0;
        d39_q13       <= 0;
        d38_q13       <= 0;
        d37_q13       <= 0;
        d36_q13       <= 0;
        d35_q13       <= 0;
        d34_q13       <= 0;
        d33_q13       <= 0;
        d32_q13       <= 0;
        d31_q13       <= 0;
        d30_q13       <= 0;
        d29_q13       <= 0;
        d28_q13       <= 0;
        d27_q13       <= 0;
        d26_q13       <= 0;
        d25_q13       <= 0;
        d24_q13       <= 0;
        d23_q13       <= 0;
        fractBin22_q13  <= 0;
        FractWeight_q13 <= 0;
        biasedExp_q13   <= 0;
    end
    else begin
        d52_q13       <= d52_q12;
        d51_q13       <= d51_q12;
        d50_q13       <= d50_q12;
        d49_q13       <= d49_q12;
        d48_q13       <= d48_q12;
        d47_q13       <= d47_q12;
        d46_q13       <= d46_q12;
        d45_q13       <= d45_q12;
        d44_q13       <= d44_q12;
        d43_q13       <= d43_q12;        
        d42_q13       <= d42_q12;        
        d41_q13       <= d41_q12;        
        d40_q13       <= d40_q12;
        d39_q13       <= d39_q12;
        d38_q13       <= d38_q12;
        d37_q13       <= d37_q12;
        d36_q13       <= d36_q12;
        d35_q13       <= d35_q12;
        d34_q13       <= d34_q12;
        d33_q13       <= d33_q12;
        d32_q13       <= d32_q12;
        d31_q13       <= d31_q12;
        d30_q13       <= d30_q12;
        d29_q13       <= d29_q12;
        d28_q13       <= d28_q12;
        d27_q13       <= d27_q12;
        d26_q13       <= d26_q12;
        d25_q13       <= d25;
        d24_q13       <= d24;
        d23_q13       <= d23;
        fractBin22_q13  <= fractBin22;
        FractWeight_q13 <= FractWeight_q12;    
        biasedExp_q13 <= biasedExp_q12;
    end

wire d22;
wire [67:0] fractBin22Test;
wire fractGTE22;
wire [66:0] fractBin21;
assign fractBin22Test = fractBin22_q13 - (FractWeight_q13 >> 30);
assign fractGTE22 = ~fractBin22Test[67] || ~|fractBin22Test; 
assign fractBin21 = fractGTE22 ? fractBin22Test[66:0] : fractBin22_q13;
assign d22 = fractGTE22 && |fractBin22_q13;

wire d21;
wire [67:0] fractBin21Test;
wire fractGTE21;
wire [66:0] fractBin20;
assign fractBin21Test = fractBin21 - (FractWeight_q13 >> 31);
assign fractGTE21 = ~fractBin21Test[67] || ~|fractBin21Test; 
assign fractBin20 = fractGTE21 ? fractBin21Test[66:0] : fractBin21;
assign d21 = fractGTE21 && |fractBin21;

wire d20;
wire [67:0] fractBin20Test;
wire fractGTE20;
wire [66:0] fractBin19;
assign fractBin20Test = fractBin20 - (FractWeight_q13 >> 32);
assign fractGTE20 = ~fractBin20Test[67] || ~|fractBin20Test; 
assign fractBin19 = fractGTE20 ? fractBin20Test[66:0] : fractBin20;
assign d20 = fractGTE20 && |fractBin20;

reg d52_q14;
reg d51_q14;
reg d50_q14;
reg d49_q14;
reg d48_q14;
reg d47_q14;
reg d46_q14;
reg d45_q14;
reg d44_q14;
reg d43_q14;
reg d42_q14;
reg d41_q14;
reg d40_q14;
reg d39_q14;
reg d38_q14;
reg d37_q14;
reg d36_q14;
reg d35_q14;
reg d34_q14;
reg d33_q14;
reg d32_q14;
reg d31_q14;
reg d30_q14;
reg d29_q14;
reg d28_q14;
reg d27_q14;
reg d26_q14;
reg d25_q14;
reg d24_q14;
reg d23_q14;
reg d22_q14;
reg d21_q14;
reg d20_q14;
reg [66:0] fractBin19_q14;
reg [66:0] FractWeight_q14;
reg [10:0] biasedExp_q14;
always @(posedge CLK)
    if (RESET) begin
        d52_q14       <= 0;
        d51_q14       <= 0;
        d50_q14       <= 0;
        d49_q14       <= 0;
        d48_q14       <= 0;
        d47_q14       <= 0;
        d46_q14       <= 0;
        d45_q14       <= 0;
        d44_q14       <= 0;
        d43_q14       <= 0;
        d42_q14       <= 0;
        d41_q14       <= 0;
        d40_q14       <= 0;
        d39_q14       <= 0;
        d38_q14       <= 0;
        d37_q14       <= 0;
        d36_q14       <= 0;
        d35_q14       <= 0;
        d34_q14       <= 0;
        d33_q14       <= 0;
        d32_q14       <= 0;
        d31_q14       <= 0;
        d30_q14       <= 0;
        d29_q14       <= 0;
        d28_q14       <= 0;
        d27_q14       <= 0;
        d26_q14       <= 0;
        d25_q14       <= 0;
        d24_q14       <= 0;
        d23_q14       <= 0;
        d22_q14       <= 0;
        d21_q14       <= 0;
        d20_q14       <= 0;
        fractBin19_q14  <= 0;
        FractWeight_q14 <= 0;
        biasedExp_q14   <= 0;
    end
    else begin
        d52_q14       <= d52_q13;
        d51_q14       <= d51_q13;
        d50_q14       <= d50_q13;
        d49_q14       <= d49_q13;
        d48_q14       <= d48_q13;
        d47_q14       <= d47_q13;
        d46_q14       <= d46_q13;
        d45_q14       <= d45_q13;
        d44_q14       <= d44_q13;
        d43_q14       <= d43_q13;        
        d42_q14       <= d42_q13;        
        d41_q14       <= d41_q13;        
        d40_q14       <= d40_q13;
        d39_q14       <= d39_q13;
        d38_q14       <= d38_q13;
        d37_q14       <= d37_q13;
        d36_q14       <= d36_q13;
        d35_q14       <= d35_q13;
        d34_q14       <= d34_q13;
        d33_q14       <= d33_q13;
        d32_q14       <= d32_q13;
        d31_q14       <= d31_q13;
        d30_q14       <= d30_q13;
        d29_q14       <= d29_q13;
        d28_q14       <= d28_q13;
        d27_q14       <= d27_q13;
        d26_q14       <= d26_q13;
        d25_q14       <= d25_q13;
        d24_q14       <= d24_q13;
        d23_q14       <= d23_q13;
        d22_q14       <= d22;
        d21_q14       <= d21;
        d20_q14       <= d20;
        fractBin19_q14  <= fractBin19;
        FractWeight_q14 <= FractWeight_q13;    
        biasedExp_q14   <= biasedExp_q13;
    end

wire d19;
wire [67:0] fractBin19Test;
wire fractGTE19;
wire [66:0] fractBin18;
assign fractBin19Test = fractBin19_q14 - (FractWeight_q14 >> 33);
assign fractGTE19 = ~fractBin19Test[67] || ~|fractBin19Test; 
assign fractBin18 = fractGTE19 ? fractBin19Test[66:0] : fractBin19_q14;
assign d19 = fractGTE19 && |fractBin19_q14;

wire d18;
wire [67:0] fractBin18Test;
wire fractGTE18;
wire [66:0] fractBin17;
assign fractBin18Test = fractBin18 - (FractWeight_q14 >> 34);
assign fractGTE18 = ~fractBin18Test[67] || ~|fractBin18Test; 
assign fractBin17 = fractGTE18 ? fractBin18Test[66:0] : fractBin18;
assign d18 = fractGTE18 && |fractBin18;

wire d17;
wire [67:0] fractBin17Test;
wire fractGTE17;
wire [66:0] fractBin16;
assign fractBin17Test = fractBin17 - (FractWeight_q14 >> 35);
assign fractGTE17 = ~fractBin17Test[67] || ~|fractBin17Test; 
assign fractBin16 = fractGTE17 ? fractBin17Test[66:0] : fractBin17;
assign d17 = fractGTE17 && |fractBin17;

reg d52_q15;
reg d51_q15;
reg d50_q15;
reg d49_q15;
reg d48_q15;
reg d47_q15;
reg d46_q15;
reg d45_q15;
reg d44_q15;
reg d43_q15;
reg d42_q15;
reg d41_q15;
reg d40_q15;
reg d39_q15;
reg d38_q15;
reg d37_q15;
reg d36_q15;
reg d35_q15;
reg d34_q15;
reg d33_q15;
reg d32_q15;
reg d31_q15;
reg d30_q15;
reg d29_q15;
reg d28_q15;
reg d27_q15;
reg d26_q15;
reg d25_q15;
reg d24_q15;
reg d23_q15;
reg d22_q15;
reg d21_q15;
reg d20_q15;
reg d19_q15;
reg d18_q15;
reg d17_q15;
reg [66:0] fractBin16_q15;
reg [66:0] FractWeight_q15;
reg [10:0] biasedExp_q15;
always @(posedge CLK)
    if (RESET) begin
        d52_q15       <= 0;
        d51_q15       <= 0;
        d50_q15       <= 0;
        d49_q15       <= 0;
        d48_q15       <= 0;
        d47_q15       <= 0;
        d46_q15       <= 0;
        d45_q15       <= 0;
        d44_q15       <= 0;
        d43_q15       <= 0;
        d42_q15       <= 0;
        d41_q15       <= 0;
        d40_q15       <= 0;
        d39_q15       <= 0;
        d38_q15       <= 0;
        d37_q15       <= 0;
        d36_q15       <= 0;
        d35_q15       <= 0;
        d34_q15       <= 0;
        d33_q15       <= 0;
        d32_q15       <= 0;
        d31_q15       <= 0;
        d30_q15       <= 0;
        d29_q15       <= 0;
        d28_q15       <= 0;
        d27_q15       <= 0;
        d26_q15       <= 0;
        d25_q15       <= 0;
        d24_q15       <= 0;
        d23_q15       <= 0;
        d22_q15       <= 0;
        d21_q15       <= 0;
        d20_q15       <= 0;
        d19_q15       <= 0;
        d18_q15       <= 0;
        d17_q15       <= 0;
        fractBin16_q15  <= 0;
        FractWeight_q15 <= 0;
        biasedExp_q15   <= 0;
    end
    else begin
        d52_q15       <= d52_q14;
        d51_q15       <= d51_q14;
        d50_q15       <= d50_q14;
        d49_q15       <= d49_q14;
        d48_q15       <= d48_q14;
        d47_q15       <= d47_q14;
        d46_q15       <= d46_q14;
        d45_q15       <= d45_q14;
        d44_q15       <= d44_q14;
        d43_q15       <= d43_q14;        
        d42_q15       <= d42_q14;        
        d41_q15       <= d41_q14;        
        d40_q15       <= d40_q14;
        d39_q15       <= d39_q14;
        d38_q15       <= d38_q14;
        d37_q15       <= d37_q14;
        d36_q15       <= d36_q14;
        d35_q15       <= d35_q14;
        d34_q15       <= d34_q14;
        d33_q15       <= d33_q14;
        d32_q15       <= d32_q14;
        d31_q15       <= d31_q14;
        d30_q15       <= d30_q14;
        d29_q15       <= d29_q14;
        d28_q15       <= d28_q14;
        d27_q15       <= d27_q14;
        d26_q15       <= d26_q14;
        d25_q15       <= d25_q14;
        d24_q15       <= d24_q14;
        d23_q15       <= d23_q14;
        d22_q15       <= d22_q14;
        d21_q15       <= d21_q14;
        d20_q15       <= d20_q14;
        d19_q15       <= d19;
        d18_q15       <= d18;
        d17_q15       <= d17;
        fractBin16_q15  <= fractBin16;
        FractWeight_q15 <= FractWeight_q14;    
        biasedExp_q15   <= biasedExp_q14;
    end
    
wire d16;
wire [67:0] fractBin16Test;
wire fractGTE16;
wire [66:0] fractBin15;
assign fractBin16Test = fractBin16_q15 - (FractWeight_q15 >> 36);
assign fractGTE16 = ~fractBin16Test[67] || ~|fractBin16Test; 
assign fractBin15 = fractGTE16 ? fractBin16Test[66:0] : fractBin16_q15;
assign d16 = fractGTE16 && |fractBin16_q15;

wire d15;
wire [67:0] fractBin15Test;
wire fractGTE15;
wire [66:0] fractBin14;
assign fractBin15Test = fractBin15 - (FractWeight_q15 >> 37);
assign fractGTE15 = ~fractBin15Test[67] || ~|fractBin15Test; 
assign fractBin14 = fractGTE15 ? fractBin15Test[66:0] : fractBin15;
assign d15 = fractGTE15 && |fractBin15;

wire d14;
wire [67:0] fractBin14Test;
wire fractGTE14;
wire [66:0] fractBin13;
assign fractBin14Test = fractBin14 - (FractWeight_q15 >> 38);
assign fractGTE14 = ~fractBin14Test[67] || ~|fractBin14Test; 
assign fractBin13 = fractGTE14 ? fractBin14Test[66:0] : fractBin14;
assign d14 = fractGTE14 && |fractBin14;

reg d52_q16;
reg d51_q16;
reg d50_q16;
reg d49_q16;
reg d48_q16;
reg d47_q16;
reg d46_q16;
reg d45_q16;
reg d44_q16;
reg d43_q16;
reg d42_q16;
reg d41_q16;
reg d40_q16;
reg d39_q16;
reg d38_q16;
reg d37_q16;
reg d36_q16;
reg d35_q16;
reg d34_q16;
reg d33_q16;
reg d32_q16;
reg d31_q16;
reg d30_q16;
reg d29_q16;
reg d28_q16;
reg d27_q16;
reg d26_q16;
reg d25_q16;
reg d24_q16;
reg d23_q16;
reg d22_q16;
reg d21_q16;
reg d20_q16;
reg d19_q16;
reg d18_q16;
reg d17_q16;
reg d16_q16;
reg d15_q16;
reg d14_q16;
reg [66:0] fractBin13_q16;
reg [66:0] FractWeight_q16;
reg [10:0] biasedExp_q16;
always @(posedge CLK)
    if (RESET) begin
        d52_q16       <= 0;
        d51_q16       <= 0;
        d50_q16       <= 0;
        d49_q16       <= 0;
        d48_q16       <= 0;
        d47_q16       <= 0;
        d46_q16       <= 0;
        d45_q16       <= 0;
        d44_q16       <= 0;
        d43_q16       <= 0;
        d42_q16       <= 0;
        d41_q16       <= 0;
        d40_q16       <= 0;
        d39_q16       <= 0;
        d38_q16       <= 0;
        d37_q16       <= 0;
        d36_q16       <= 0;
        d35_q16       <= 0;
        d34_q16       <= 0;
        d33_q16       <= 0;
        d32_q16       <= 0;
        d31_q16       <= 0;
        d30_q16       <= 0;
        d29_q16       <= 0;
        d28_q16       <= 0;
        d27_q16       <= 0;
        d26_q16       <= 0;
        d25_q16       <= 0;
        d24_q16       <= 0;
        d23_q16       <= 0;
        d22_q16       <= 0;
        d21_q16       <= 0;
        d20_q16       <= 0;
        d19_q16       <= 0;
        d18_q16       <= 0;
        d17_q16       <= 0;
        d16_q16       <= 0;
        d15_q16       <= 0;
        d14_q16       <= 0;
        fractBin13_q16  <= 0;
        FractWeight_q16 <= 0;
        biasedExp_q16   <= 0;
    end
    else begin
        d52_q16       <= d52_q15;
        d51_q16       <= d51_q15;
        d50_q16       <= d50_q15;
        d49_q16       <= d49_q15;
        d48_q16       <= d48_q15;
        d47_q16       <= d47_q15;
        d46_q16       <= d46_q15;
        d45_q16       <= d45_q15;
        d44_q16       <= d44_q15;
        d43_q16       <= d43_q15;        
        d42_q16       <= d42_q15;        
        d41_q16       <= d41_q15;        
        d40_q16       <= d40_q15;
        d39_q16       <= d39_q15;
        d38_q16       <= d38_q15;
        d37_q16       <= d37_q15;
        d36_q16       <= d36_q15;
        d35_q16       <= d35_q15;
        d34_q16       <= d34_q15;
        d33_q16       <= d33_q15;
        d32_q16       <= d32_q15;
        d31_q16       <= d31_q15;
        d30_q16       <= d30_q15;
        d29_q16       <= d29_q15;
        d28_q16       <= d28_q15;
        d27_q16       <= d27_q15;
        d26_q16       <= d26_q15;
        d25_q16       <= d25_q15;
        d24_q16       <= d24_q15;
        d23_q16       <= d23_q15;
        d22_q16       <= d22_q15;
        d21_q16       <= d21_q15;
        d20_q16       <= d20_q15;
        d19_q16       <= d19_q15;
        d18_q16       <= d18_q15;
        d17_q16       <= d17_q15;
        d16_q16       <= d16;
        d15_q16       <= d15;
        d14_q16       <= d14;
        fractBin13_q16  <= fractBin13;
        FractWeight_q16 <= FractWeight_q15;    
        biasedExp_q16   <= biasedExp_q15;
    end
    
wire d13;
wire [67:0] fractBin13Test;
wire fractGTE13;
wire [66:0] fractBin12;
assign fractBin13Test = fractBin13_q16 - (FractWeight_q16 >> 39);
assign fractGTE13 = ~fractBin13Test[67] || ~|fractBin13Test; 
assign fractBin12 = fractGTE13 ? fractBin13Test[66:0] : fractBin13_q16;
assign d13 = fractGTE13 && |fractBin13_q16;

wire d12;
wire [67:0] fractBin12Test;
wire fractGTE12;
wire [66:0] fractBin11;
assign fractBin12Test = fractBin12 - (FractWeight_q16 >> 40);
assign fractGTE12 = ~fractBin12Test[67] || ~|fractBin12Test; 
assign fractBin11 = fractGTE12 ? fractBin12Test[66:0] : fractBin12;
assign d12 = fractGTE12 && |fractBin12;

wire d11;
wire [67:0] fractBin11Test;
wire fractGTE11;
wire [66:0] fractBin10;
assign fractBin11Test = fractBin11 - (FractWeight_q16 >> 41);
assign fractGTE11 = ~fractBin11Test[67] || ~|fractBin11Test; 
assign fractBin10 = fractGTE11 ? fractBin11Test[66:0] : fractBin11;
assign d11 = fractGTE11 && |fractBin11;

reg d52_q17;
reg d51_q17;
reg d50_q17;
reg d49_q17;
reg d48_q17;
reg d47_q17;
reg d46_q17;
reg d45_q17;
reg d44_q17;
reg d43_q17;
reg d42_q17;
reg d41_q17;
reg d40_q17;
reg d39_q17;
reg d38_q17;
reg d37_q17;
reg d36_q17;
reg d35_q17;
reg d34_q17;
reg d33_q17;
reg d32_q17;
reg d31_q17;
reg d30_q17;
reg d29_q17;
reg d28_q17;
reg d27_q17;
reg d26_q17;
reg d25_q17;
reg d24_q17;
reg d23_q17;
reg d22_q17;
reg d21_q17;
reg d20_q17;
reg d19_q17;
reg d18_q17;
reg d17_q17;
reg d16_q17;
reg d15_q17;
reg d14_q17;
reg d13_q17;
reg d12_q17;
reg d11_q17;
reg [66:0] fractBin10_q17;
reg [66:0] FractWeight_q17;
reg [10:0] biasedExp_q17;
always @(posedge CLK)
    if (RESET) begin
        d52_q17       <= 0;
        d51_q17       <= 0;
        d50_q17       <= 0;
        d49_q17       <= 0;
        d48_q17       <= 0;
        d47_q17       <= 0;
        d46_q17       <= 0;
        d45_q17       <= 0;
        d44_q17       <= 0;
        d43_q17       <= 0;
        d42_q17       <= 0;
        d41_q17       <= 0;
        d40_q17       <= 0;
        d39_q17       <= 0;
        d38_q17       <= 0;
        d37_q17       <= 0;
        d36_q17       <= 0;
        d35_q17       <= 0;
        d34_q17       <= 0;
        d33_q17       <= 0;
        d32_q17       <= 0;
        d31_q17       <= 0;
        d30_q17       <= 0;
        d29_q17       <= 0;
        d28_q17       <= 0;
        d27_q17       <= 0;
        d26_q17       <= 0;
        d25_q17       <= 0;
        d24_q17       <= 0;
        d23_q17       <= 0;
        d22_q17       <= 0;
        d21_q17       <= 0;
        d20_q17       <= 0;
        d19_q17       <= 0;
        d18_q17       <= 0;
        d17_q17       <= 0;
        d16_q17       <= 0;
        d15_q17       <= 0;
        d14_q17       <= 0;
        d13_q17       <= 0;
        d12_q17       <= 0;
        d11_q17       <= 0;
        fractBin10_q17  <= 0;
        FractWeight_q17 <= 0;
        biasedExp_q17   <= 0;
    end
    else begin
        d52_q17       <= d52_q16;
        d51_q17       <= d51_q16;
        d50_q17       <= d50_q16;
        d49_q17       <= d49_q16;
        d48_q17       <= d48_q16;
        d47_q17       <= d47_q16;
        d46_q17       <= d46_q16;
        d45_q17       <= d45_q16;
        d44_q17       <= d44_q16;
        d43_q17       <= d43_q16;        
        d42_q17       <= d42_q16;        
        d41_q17       <= d41_q16;        
        d40_q17       <= d40_q16;
        d39_q17       <= d39_q16;
        d38_q17       <= d38_q16;
        d37_q17       <= d37_q16;
        d36_q17       <= d36_q16;
        d35_q17       <= d35_q16;
        d34_q17       <= d34_q16;
        d33_q17       <= d33_q16;
        d32_q17       <= d32_q16;
        d31_q17       <= d31_q16;
        d30_q17       <= d30_q16;
        d29_q17       <= d29_q16;
        d28_q17       <= d28_q16;
        d27_q17       <= d27_q16;
        d26_q17       <= d26_q16;
        d25_q17       <= d25_q16;
        d24_q17       <= d24_q16;
        d23_q17       <= d23_q16;
        d22_q17       <= d22_q16;
        d21_q17       <= d21_q16;
        d20_q17       <= d20_q16;
        d19_q17       <= d19_q16;
        d18_q17       <= d18_q16;
        d17_q17       <= d17_q16;
        d16_q17       <= d16_q16;
        d15_q17       <= d15_q16;
        d14_q17       <= d14_q16;
        d13_q17       <= d13;
        d12_q17       <= d12;
        d11_q17       <= d11;
        fractBin10_q17  <= fractBin10;
        FractWeight_q17 <= FractWeight_q16;    
        biasedExp_q17   <= biasedExp_q16;
    end

wire d10;
wire [67:0] fractBin10Test;
wire fractGTE10;
wire [66:0] fractBin9;
assign fractBin10Test = fractBin10_q17 - (FractWeight_q17 >> 42);
assign fractGTE10 = ~fractBin10Test[67] || ~|fractBin10Test; 
assign fractBin9 = fractGTE10 ? fractBin10Test[66:0] : fractBin10_q17;
assign d10 = fractGTE10 && |fractBin10_q17;

wire d9;
wire [67:0] fractBin9Test;
wire fractGTE9;
wire [66:0] fractBin8;
assign fractBin9Test = fractBin9 - (FractWeight_q17 >> 43);
assign fractGTE9 = ~fractBin9Test[67] || ~|fractBin9Test; 
assign fractBin8 = fractGTE9 ? fractBin9Test[66:0] : fractBin9;
assign d9 = fractGTE9 && |fractBin9;

wire d8;
wire [67:0] fractBin8Test;
wire fractGTE8;
wire [66:0] fractBin7;
assign fractBin8Test = fractBin8 - (FractWeight_q17 >> 44);
assign fractGTE8 = ~fractBin8Test[67] || ~|fractBin8Test; 
assign fractBin7 = fractGTE8 ? fractBin8Test[66:0] : fractBin8;
assign d8 = fractGTE8 && |fractBin8;

reg d52_q18;
reg d51_q18;
reg d50_q18;
reg d49_q18;
reg d48_q18;
reg d47_q18;
reg d46_q18;
reg d45_q18;
reg d44_q18;
reg d43_q18;
reg d42_q18;
reg d41_q18;
reg d40_q18;
reg d39_q18;
reg d38_q18;
reg d37_q18;
reg d36_q18;
reg d35_q18;
reg d34_q18;
reg d33_q18;
reg d32_q18;
reg d31_q18;
reg d30_q18;
reg d29_q18;
reg d28_q18;
reg d27_q18;
reg d26_q18;
reg d25_q18;
reg d24_q18;
reg d23_q18;
reg d22_q18;
reg d21_q18;
reg d20_q18;
reg d19_q18;
reg d18_q18;
reg d17_q18;
reg d16_q18;
reg d15_q18;
reg d14_q18;
reg d13_q18;
reg d12_q18;
reg d11_q18;
reg d10_q18;
reg d9_q18;
reg d8_q18;
reg [66:0] fractBin7_q18;
reg [66:0] FractWeight_q18;
reg [10:0] biasedExp_q18;
always @(posedge CLK)
    if (RESET) begin
        d52_q18       <= 0;
        d51_q18       <= 0;
        d50_q18       <= 0;
        d49_q18       <= 0;
        d48_q18       <= 0;
        d47_q18       <= 0;
        d46_q18       <= 0;
        d45_q18       <= 0;
        d44_q18       <= 0;
        d43_q18       <= 0;
        d42_q18       <= 0;
        d41_q18       <= 0;
        d40_q18       <= 0;
        d39_q18       <= 0;
        d38_q18       <= 0;
        d37_q18       <= 0;
        d36_q18       <= 0;
        d35_q18       <= 0;
        d34_q18       <= 0;
        d33_q18       <= 0;
        d32_q18       <= 0;
        d31_q18       <= 0;
        d30_q18       <= 0;
        d29_q18       <= 0;
        d28_q18       <= 0;
        d27_q18       <= 0;
        d26_q18       <= 0;
        d25_q18       <= 0;
        d24_q18       <= 0;
        d23_q18       <= 0;
        d22_q18       <= 0;
        d21_q18       <= 0;
        d20_q18       <= 0;
        d19_q18       <= 0;
        d18_q18       <= 0;
        d17_q18       <= 0;
        d16_q18       <= 0;
        d15_q18       <= 0;
        d14_q18       <= 0;
        d13_q18       <= 0;
        d12_q18       <= 0;
        d11_q18       <= 0;
        d10_q18       <= 0;
        d9_q18        <= 0;
        d8_q18        <= 0;
        fractBin7_q18   <= 0;
        FractWeight_q18 <= 0;
        biasedExp_q18   <= 0;
    end
    else begin
        d52_q18       <= d52_q17;
        d51_q18       <= d51_q17;
        d50_q18       <= d50_q17;
        d49_q18       <= d49_q17;
        d48_q18       <= d48_q17;
        d47_q18       <= d47_q17;
        d46_q18       <= d46_q17;
        d45_q18       <= d45_q17;
        d44_q18       <= d44_q17;
        d43_q18       <= d43_q17;        
        d42_q18       <= d42_q17;        
        d41_q18       <= d41_q17;        
        d40_q18       <= d40_q17;
        d39_q18       <= d39_q17;
        d38_q18       <= d38_q17;
        d37_q18       <= d37_q17;
        d36_q18       <= d36_q17;
        d35_q18       <= d35_q17;
        d34_q18       <= d34_q17;
        d33_q18       <= d33_q17;
        d32_q18       <= d32_q17;
        d31_q18       <= d31_q17;
        d30_q18       <= d30_q17;
        d29_q18       <= d29_q17;
        d28_q18       <= d28_q17;
        d27_q18       <= d27_q17;
        d26_q18       <= d26_q17;
        d25_q18       <= d25_q17;
        d24_q18       <= d24_q17;
        d23_q18       <= d23_q17;
        d22_q18       <= d22_q17;
        d21_q18       <= d21_q17;
        d20_q18       <= d20_q17;
        d19_q18       <= d19_q17;
        d18_q18       <= d18_q17;
        d17_q18       <= d17_q17;
        d16_q18       <= d16_q17;
        d15_q18       <= d15_q17;
        d14_q18       <= d14_q17;
        d13_q18       <= d13_q17;
        d12_q18       <= d12_q17;
        d11_q18       <= d11_q17;
        d10_q18       <= d10;
         d9_q18       <= d9;
         d8_q18       <= d8;
        fractBin7_q18   <= fractBin7;
        FractWeight_q18 <= FractWeight_q17;    
        biasedExp_q18   <= biasedExp_q17;
    end

wire d7;
wire [67:0] fractBin7Test;
wire fractGTE7;
wire [66:0] fractBin6;
assign fractBin7Test = fractBin7_q18 - (FractWeight_q18 >> 45);
assign fractGTE7 = ~fractBin7Test[67] || ~|fractBin7Test; 
assign fractBin6 = fractGTE7 ? fractBin7Test[66:0] : fractBin7_q18;
assign d7 = fractGTE7 && |fractBin7_q18;

wire d6;
wire [67:0] fractBin6Test;
wire fractGTE6;
wire [66:0] fractBin5;
assign fractBin6Test = fractBin6 - (FractWeight_q18 >> 46);
assign fractGTE6 = ~fractBin6Test[67] || ~|fractBin6Test; 
assign fractBin5 = fractGTE6 ? fractBin6Test[66:0] : fractBin6;
assign d6 = fractGTE6 && |fractBin6;

wire d5;
wire [67:0] fractBin5Test;
wire fractGTE5;
wire [66:0] fractBin4;
assign fractBin5Test = fractBin5 - (FractWeight_q18 >> 47);
assign fractGTE5 = ~fractBin5Test[67] || ~|fractBin5Test; 
assign fractBin4 = fractGTE5 ? fractBin5Test[66:0] : fractBin5;
assign d5 = fractGTE5 && |fractBin5;

reg d52_q19;
reg d51_q19;
reg d50_q19;
reg d49_q19;
reg d48_q19;
reg d47_q19;
reg d46_q19;
reg d45_q19;
reg d44_q19;
reg d43_q19;
reg d42_q19;
reg d41_q19;
reg d40_q19;
reg d39_q19;
reg d38_q19;
reg d37_q19;
reg d36_q19;
reg d35_q19;
reg d34_q19;
reg d33_q19;
reg d32_q19;
reg d31_q19;
reg d30_q19;
reg d29_q19;
reg d28_q19;
reg d27_q19;
reg d26_q19;
reg d25_q19;
reg d24_q19;
reg d23_q19;
reg d22_q19;
reg d21_q19;
reg d20_q19;
reg d19_q19;
reg d18_q19;
reg d17_q19;
reg d16_q19;
reg d15_q19;
reg d14_q19;
reg d13_q19;
reg d12_q19;
reg d11_q19;
reg d10_q19;
reg d9_q19;
reg d8_q19;
reg d7_q19;
reg d6_q19;
reg d5_q19;
reg [66:0] fractBin4_q19;
reg [66:0] FractWeight_q19;
reg [10:0] biasedExp_q19;
always @(posedge CLK)
    if (RESET) begin
        d52_q19       <= 0;
        d51_q19       <= 0;
        d50_q19       <= 0;
        d49_q19       <= 0;
        d48_q19       <= 0;
        d47_q19       <= 0;
        d46_q19       <= 0;
        d45_q19       <= 0;
        d44_q19       <= 0;
        d43_q19       <= 0;
        d42_q19       <= 0;
        d41_q19       <= 0;
        d40_q19       <= 0;
        d39_q19       <= 0;
        d38_q19       <= 0;
        d37_q19       <= 0;
        d36_q19       <= 0;
        d35_q19       <= 0;
        d34_q19       <= 0;
        d33_q19       <= 0;
        d32_q19       <= 0;
        d31_q19       <= 0;
        d30_q19       <= 0;
        d29_q19       <= 0;
        d28_q19       <= 0;
        d27_q19       <= 0;
        d26_q19       <= 0;
        d25_q19       <= 0;
        d24_q19       <= 0;
        d23_q19       <= 0;
        d22_q19       <= 0;
        d21_q19       <= 0;
        d20_q19       <= 0;
        d19_q19       <= 0;
        d18_q19       <= 0;
        d17_q19       <= 0;
        d16_q19       <= 0;
        d15_q19       <= 0;
        d14_q19       <= 0;
        d13_q19       <= 0;
        d12_q19       <= 0;
        d11_q19       <= 0;
        d10_q19       <= 0;
        d9_q19        <= 0;
        d8_q19        <= 0;
        d7_q19        <= 0;
        d6_q19        <= 0;
        d5_q19        <= 0;
        fractBin4_q19   <= 0;
        FractWeight_q19 <= 0;
        biasedExp_q19   <= 0;
    end
    else begin
        d52_q19       <= d52_q18;
        d51_q19       <= d51_q18;
        d50_q19       <= d50_q18;
        d49_q19       <= d49_q18;
        d48_q19       <= d48_q18;
        d47_q19       <= d47_q18;
        d46_q19       <= d46_q18;
        d45_q19       <= d45_q18;
        d44_q19       <= d44_q18;
        d43_q19       <= d43_q18;        
        d42_q19       <= d42_q18;        
        d41_q19       <= d41_q18;        
        d40_q19       <= d40_q18;
        d39_q19       <= d39_q18;
        d38_q19       <= d38_q18;
        d37_q19       <= d37_q18;
        d36_q19       <= d36_q18;
        d35_q19       <= d35_q18;
        d34_q19       <= d34_q18;
        d33_q19       <= d33_q18;
        d32_q19       <= d32_q18;
        d31_q19       <= d31_q18;
        d30_q19       <= d30_q18;
        d29_q19       <= d29_q18;
        d28_q19       <= d28_q18;
        d27_q19       <= d27_q18;
        d26_q19       <= d26_q18;
        d25_q19       <= d25_q18;
        d24_q19       <= d24_q18;
        d23_q19       <= d23_q18;
        d22_q19       <= d22_q18;
        d21_q19       <= d21_q18;
        d20_q19       <= d20_q18;
        d19_q19       <= d19_q18;
        d18_q19       <= d18_q18;
        d17_q19       <= d17_q18;
        d16_q19       <= d16_q18;
        d15_q19       <= d15_q18;
        d14_q19       <= d14_q18;
        d13_q19       <= d13_q18;
        d12_q19       <= d12_q18;
        d11_q19       <= d11_q18;
        d10_q19       <= d10_q18;
         d9_q19       <=  d9_q18;
         d8_q19       <=  d8_q18;
         d7_q19       <=  d7;
         d6_q19       <=  d6;
         d5_q19       <=  d5;
        fractBin4_q19   <= fractBin4;
        FractWeight_q19 <= FractWeight_q18;    
        biasedExp_q19 <= biasedExp_q18;
    end

wire d4;
wire [67:0] fractBin4Test;
wire fractGTE4;
wire [66:0] fractBin3;
assign fractBin4Test = fractBin4_q19 - (FractWeight_q19 >> 48);
assign fractGTE4 = ~fractBin4Test[67] || ~|fractBin4Test; 
assign fractBin3 = fractGTE4 ? fractBin4Test[66:0] : fractBin4_q19;
assign d4 = fractGTE4 && |fractBin4_q19;

wire d3;
wire [67:0] fractBin3Test;
wire fractGTE3;
wire [66:0] fractBin2;
assign fractBin3Test = fractBin3 - (FractWeight_q19 >> 49);
assign fractGTE3 = ~fractBin3Test[67] || ~|fractBin3Test; 
assign fractBin2 = fractGTE3 ? fractBin3Test[66:0] : fractBin3;
assign d3 = fractGTE3 && |fractBin3;

wire d2;
wire [67:0] fractBin2Test;
wire fractGTE2;
wire [66:0] fractBin1;
assign fractBin2Test = fractBin2 - (FractWeight_q19 >> 50);
assign fractGTE2 = ~fractBin2Test[67] || ~|fractBin2Test; 
assign fractBin1 = fractGTE2 ? fractBin2Test[66:0] : fractBin2;
assign d2 = fractGTE2 && |fractBin2;

reg d52_q20;
reg d51_q20;
reg d50_q20;
reg d49_q20;
reg d48_q20;
reg d47_q20;
reg d46_q20;
reg d45_q20;
reg d44_q20;
reg d43_q20;
reg d42_q20;
reg d41_q20;
reg d40_q20;
reg d39_q20;
reg d38_q20;
reg d37_q20;
reg d36_q20;
reg d35_q20;
reg d34_q20;
reg d33_q20;
reg d32_q20;
reg d31_q20;
reg d30_q20;
reg d29_q20;
reg d28_q20;
reg d27_q20;
reg d26_q20;
reg d25_q20;
reg d24_q20;
reg d23_q20;
reg d22_q20;
reg d21_q20;
reg d20_q20;
reg d19_q20;
reg d18_q20;
reg d17_q20;
reg d16_q20;
reg d15_q20;
reg d14_q20;
reg d13_q20;
reg d12_q20;
reg d11_q20;
reg d10_q20;
reg d9_q20;
reg d8_q20;
reg d7_q20;
reg d6_q20;
reg d5_q20;
reg d4_q20;
reg d3_q20;
reg d2_q20;
reg [66:0] fractBin1_q20;
reg [66:0] FractWeight_q20;
reg [10:0] biasedExp_q20;
always @(posedge CLK)
    if (RESET) begin
        d52_q20       <= 0;
        d51_q20       <= 0;
        d50_q20       <= 0;
        d49_q20       <= 0;
        d48_q20       <= 0;
        d47_q20       <= 0;
        d46_q20       <= 0;
        d45_q20       <= 0;
        d44_q20       <= 0;
        d43_q20       <= 0;
        d42_q20       <= 0;
        d41_q20       <= 0;
        d40_q20       <= 0;
        d39_q20       <= 0;
        d38_q20       <= 0;
        d37_q20       <= 0;
        d36_q20       <= 0;
        d35_q20       <= 0;
        d34_q20       <= 0;
        d33_q20       <= 0;
        d32_q20       <= 0;
        d31_q20       <= 0;
        d30_q20       <= 0;
        d29_q20       <= 0;
        d28_q20       <= 0;
        d27_q20       <= 0;
        d26_q20       <= 0;
        d25_q20       <= 0;
        d24_q20       <= 0;
        d23_q20       <= 0;
        d22_q20       <= 0;
        d21_q20       <= 0;
        d20_q20       <= 0;
        d19_q20       <= 0;
        d18_q20       <= 0;
        d17_q20       <= 0;
        d16_q20       <= 0;
        d15_q20       <= 0;
        d14_q20       <= 0;
        d13_q20       <= 0;
        d12_q20       <= 0;
        d11_q20       <= 0;
        d10_q20       <= 0;
        d9_q20        <= 0;
        d8_q20        <= 0;
        d7_q20        <= 0;
        d6_q20        <= 0;
        d5_q20        <= 0;
        d4_q20        <= 0;
        d3_q20        <= 0;
        d2_q20        <= 0;
        fractBin1_q20   <= 0;
        FractWeight_q20 <= 0;
        biasedExp_q20   <= 0;
    end
    else begin
        d52_q20       <= d52_q19;
        d51_q20       <= d51_q19;
        d50_q20       <= d50_q19;
        d49_q20       <= d49_q19;
        d48_q20       <= d48_q19;
        d47_q20       <= d47_q19;
        d46_q20       <= d46_q19;
        d45_q20       <= d45_q19;
        d44_q20       <= d44_q19;
        d43_q20       <= d43_q19;        
        d42_q20       <= d42_q19;        
        d41_q20       <= d41_q19;        
        d40_q20       <= d40_q19;
        d39_q20       <= d39_q19;
        d38_q20       <= d38_q19;
        d37_q20       <= d37_q19;
        d36_q20       <= d36_q19;
        d35_q20       <= d35_q19;
        d34_q20       <= d34_q19;
        d33_q20       <= d33_q19;
        d32_q20       <= d32_q19;
        d31_q20       <= d31_q19;
        d30_q20       <= d30_q19;
        d29_q20       <= d29_q19;
        d28_q20       <= d28_q19;
        d27_q20       <= d27_q19;
        d26_q20       <= d26_q19;
        d25_q20       <= d25_q19;
        d24_q20       <= d24_q19;
        d23_q20       <= d23_q19;
        d22_q20       <= d22_q19;
        d21_q20       <= d21_q19;
        d20_q20       <= d20_q19;
        d19_q20       <= d19_q19;
        d18_q20       <= d18_q19;
        d17_q20       <= d17_q19;
        d16_q20       <= d16_q19;
        d15_q20       <= d15_q19;
        d14_q20       <= d14_q19;
        d13_q20       <= d13_q19;
        d12_q20       <= d12_q19;
        d11_q20       <= d11_q19;
        d10_q20       <= d10_q19;
         d9_q20       <=  d9_q19;
         d8_q20       <=  d8_q19;
         d7_q20       <=  d7_q19;
         d6_q20       <=  d6_q19;
         d5_q20       <=  d5_q19;
         d4_q20       <=  d4;
         d3_q20       <=  d3;
         d2_q20       <=  d2;
        fractBin1_q20   <= fractBin1;
        FractWeight_q20 <= FractWeight_q19;    
        biasedExp_q20   <= biasedExp_q19;
    end

wire d1;
wire [67:0] fractBin1Test;
wire fractGTE1;
wire [66:0] fractBin0;
assign fractBin1Test = fractBin1_q20 - (FractWeight_q20 >> 51);
assign fractGTE1 = ~fractBin1Test[67] || ~|fractBin1Test; 
assign fractBin0 = fractGTE1 ? fractBin1Test[66:0] : fractBin1_q20;
assign d1 = fractGTE1 && |fractBin1_q20;

wire d0;
wire [67:0] fractBin0Test;
wire fractGTE0;
wire [66:0] fractBinG;
assign fractBin0Test = fractBin0 - (FractWeight_q20 >> 52);
assign fractGTE0 = ~fractBin0Test[67] || ~|fractBin0Test; 
assign fractBinG = fractGTE0 ? fractBin0Test[66:0] : fractBin0;
assign d0 = fractGTE0 && |fractBin0;

wire G;
wire [67:0] fractBinGTest;
wire fractGTEG;
wire [66:0] fractBinR;
assign fractBinGTest = fractBin0 - (FractWeight_q20 >> 53);
assign fractGTEG = ~fractBinGTest[67] || ~|fractBinGTest; 
assign fractBinR = fractGTEG ? fractBinGTest[66:0] : fractBinG;
assign G = fractGTEG && |fractBin0;

reg d52_q21;
reg d51_q21;
reg d50_q21;
reg d49_q21;
reg d48_q21;
reg d47_q21;
reg d46_q21;
reg d45_q21;
reg d44_q21;
reg d43_q21;
reg d42_q21;
reg d41_q21;
reg d40_q21;
reg d39_q21;
reg d38_q21;
reg d37_q21;
reg d36_q21;
reg d35_q21;
reg d34_q21;
reg d33_q21;
reg d32_q21;
reg d31_q21;
reg d30_q21;
reg d29_q21;
reg d28_q21;
reg d27_q21;
reg d26_q21;
reg d25_q21;
reg d24_q21;
reg d23_q21;
reg d22_q21;
reg d21_q21;
reg d20_q21;
reg d19_q21;
reg d18_q21;
reg d17_q21;
reg d16_q21;
reg d15_q21;
reg d14_q21;
reg d13_q21;
reg d12_q21;
reg d11_q21;
reg d10_q21;
reg d9_q21;
reg d8_q21;
reg d7_q21;
reg d6_q21;
reg d5_q21;
reg d4_q21;
reg d3_q21;
reg d2_q21;
reg d1_q21;
reg d0_q21;
reg G_q21;
reg [66:0] fractBinR_q21;
reg [66:0] FractWeight_q21;
reg [10:0] biasedExp_q21;
always @(posedge CLK)
    if (RESET) begin
        d52_q21       <= 0;
        d51_q21       <= 0;
        d50_q21       <= 0;
        d49_q21       <= 0;
        d48_q21       <= 0;
        d47_q21       <= 0;
        d46_q21       <= 0;
        d45_q21       <= 0;
        d44_q21       <= 0;
        d43_q21       <= 0;
        d42_q21       <= 0;
        d41_q21       <= 0;
        d40_q21       <= 0;
        d39_q21       <= 0;
        d38_q21       <= 0;
        d37_q21       <= 0;
        d36_q21       <= 0;
        d35_q21       <= 0;
        d34_q21       <= 0;
        d33_q21       <= 0;
        d32_q21       <= 0;
        d31_q21       <= 0;
        d30_q21       <= 0;
        d29_q21       <= 0;
        d28_q21       <= 0;
        d27_q21       <= 0;
        d26_q21       <= 0;
        d25_q21       <= 0;
        d24_q21       <= 0;
        d23_q21       <= 0;
        d22_q21       <= 0;
        d21_q21       <= 0;
        d20_q21       <= 0;
        d19_q21       <= 0;
        d18_q21       <= 0;
        d17_q21       <= 0;
        d16_q21       <= 0;
        d15_q21       <= 0;
        d14_q21       <= 0;
        d13_q21       <= 0;
        d12_q21       <= 0;
        d11_q21       <= 0;
        d10_q21       <= 0;
        d9_q21        <= 0;
        d8_q21        <= 0;
        d7_q21        <= 0;
        d6_q21        <= 0;
        d5_q21        <= 0;
        d4_q21        <= 0;
        d3_q21        <= 0;
        d2_q21        <= 0;
        d1_q21        <= 0;
        d0_q21        <= 0;
        G_q21         <= 0;
        fractBinR_q21   <= 0;
        FractWeight_q21 <= 0;
        biasedExp_q21   <= 0;
    end
    else begin
        d52_q21       <= d52_q20;
        d51_q21       <= d51_q20;
        d50_q21       <= d50_q20;
        d49_q21       <= d49_q20;
        d48_q21       <= d48_q20;
        d47_q21       <= d47_q20;
        d46_q21       <= d46_q20;
        d45_q21       <= d45_q20;
        d44_q21       <= d44_q20;
        d43_q21       <= d43_q20;        
        d42_q21       <= d42_q20;        
        d41_q21       <= d41_q20;        
        d40_q21       <= d40_q20;
        d39_q21       <= d39_q20;
        d38_q21       <= d38_q20;
        d37_q21       <= d37_q20;
        d36_q21       <= d36_q20;
        d35_q21       <= d35_q20;
        d34_q21       <= d34_q20;
        d33_q21       <= d33_q20;
        d32_q21       <= d32_q20;
        d31_q21       <= d31_q20;
        d30_q21       <= d30_q20;
        d29_q21       <= d29_q20;
        d28_q21       <= d28_q20;
        d27_q21       <= d27_q20;
        d26_q21       <= d26_q20;
        d25_q21       <= d25_q20;
        d24_q21       <= d24_q20;
        d23_q21       <= d23_q20;
        d22_q21       <= d22_q20;
        d21_q21       <= d21_q20;
        d20_q21       <= d20_q20;
        d19_q21       <= d19_q20;
        d18_q21       <= d18_q20;
        d17_q21       <= d17_q20;
        d16_q21       <= d16_q20;
        d15_q21       <= d15_q20;
        d14_q21       <= d14_q20;
        d13_q21       <= d13_q20;
        d12_q21       <= d12_q20;
        d11_q21       <= d11_q20;
        d10_q21       <= d10_q20;
         d9_q21       <=  d9_q20;
         d8_q21       <=  d8_q20;
         d7_q21       <=  d7_q20;
         d6_q21       <=  d6_q20;
         d5_q21       <=  d5_q20;
         d4_q21       <=  d4_q20;
         d3_q21       <=  d3_q20;
         d2_q21       <=  d2_q20;
         d1_q21       <=  d1;
         d0_q21       <=  d0;
         G_q21        <=  G;
        fractBinR_q21   <= fractBinR;
        FractWeight_q21 <= FractWeight_q20;    
        biasedExp_q21   <= biasedExp_q20;
    end

wire R;
wire [67:0] fractBinRTest;
wire fractGTER;
wire [66:0] fractBinS;
assign fractBinRTest = fractBinR_q21 - (FractWeight_q21 >> 54);
assign fractGTER = ~fractBinRTest[67] || ~|fractBinRTest; 
assign fractBinS = fractGTER ? fractBinRTest[66:0] : fractBinR;
assign R = fractGTER && |fractBinR_q21;

wire S;
wire [67:0] fractBinSTest;
wire fractGTES;
wire [66:0] fractBinX;
assign fractBinSTest = fractBinS - (FractWeight_q21 >> 55);
assign fractGTES = ~fractBinSTest[67] || ~|fractBinSTest; 
assign fractBinX = fractGTES ? fractBinSTest[66:0] : fractBinS;  //remaining bits, if any
assign S = fractGTES && |fractBinS;

assign fractGRS = {G_q21, R, (S || |fractBinX)};

wire fractInexact;
assign fractInexact = |fractGRS;

assign fractPartMant =  {d52_q21, d51_q21, d50_q21, 
                         d49_q21, d48_q21, d47_q21, d46_q21, d45_q21, d44_q21, d43_q21, d42_q21, d41_q21, d40_q21, 
                         d39_q21, d38_q21, d37_q21, d36_q21, d35_q21, d34_q21, d33_q21, d32_q21, d31_q21, d30_q21, 
                         d29_q21, d28_q21, d27_q21, d26_q21, d25_q21, d24_q21, d23_q21, d22_q21, d21_q21, d20_q21, 
                         d19_q21, d18_q21, d17_q21, d16_q21, d15_q21, d14_q21, d13_q21, d12_q21, d11_q21, d10_q21, 
                          d9_q21,  d8_q21,  d7_q21,  d6_q21,  d5_q21,  d4_q21,  d3_q21,  d2_q21,  d1_q21,  d0_q21};
                      
assign biasedBinExpOut = biasedExp_q21;                      

endmodule
