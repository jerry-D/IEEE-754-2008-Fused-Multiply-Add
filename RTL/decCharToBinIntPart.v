//  decCharToBinIntPart.v
 
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

module decCharToBinIntPart (
    CLK,
    RESET,
    wren_del_2,
    decExp_del_2,
    intIsZero,
    fractIsSubnormal,
    integerPartBin,
    intPartMant,
    biasedBinExpOut,
    intGRS,
    intInexact
    );

input CLK;
input RESET;
input wren_del_2;
input [8:0] decExp_del_2;
input intIsZero;
input fractIsSubnormal;
input [67:0] integerPartBin;
output [52:0] intPartMant; 
output [10:0] biasedBinExpOut;
output [2:0] intGRS;
output intInexact;


wire [2:0] intGRS;

wire [52:0] intPartMant;
wire [10:0] biasedExp;
wire [10:0] biasedBinExpOut;
wire [66:0] IntWeight;

reg [67:0] integerPartBin_q3;
always @(posedge CLK)
    if (RESET) integerPartBin_q3 <= 0;
    else integerPartBin_q3 <= integerPartBin;  

DecCharToBinROMweightsInt DctbRomInt(
    .CLK             (CLK             ),
    .RESET           (RESET           ),
    .rden            (wren_del_2      ),
    .decExpIn        (decExp_del_2    ),
    .intIsZero       (intIsZero       ),
    .fractIsSubnormal(fractIsSubnormal),
    .integerPartBin  (integerPartBin_q3),
    .IntWeightOut    (IntWeight       ),
    .binExpOut       (biasedExp       )
    );  
    
wire d52;   
wire [68:0] intBin52Test;
wire intGTE52;
wire [66:0] intBin51;
assign intBin52Test = integerPartBin_q3 - IntWeight;
assign intGTE52 = ~intBin52Test[68] || ~|intBin52Test; 
assign intBin51 = intGTE52 ? intBin52Test[66:0] : integerPartBin_q3[66:0];
assign d52 = intGTE52 && |integerPartBin_q3;   

wire d51;
wire [67:0] intBin51Test;
wire intGTE51;
wire [66:0] intBin50;
assign intBin51Test = intBin51 - (IntWeight >> 1);
assign intGTE51 = ~intBin51Test[67] || ~|intBin51Test; 
assign intBin50 = intGTE51 ? intBin51Test[66:0] : intBin51;
assign d51 = intGTE51 && |intBin51;

wire d50;
wire [67:0] intBin50Test;
wire intGTE50;
wire [66:0] intBin49;
assign intBin50Test = intBin50 - (IntWeight >> 2);
assign intGTE50 = ~intBin50Test[67] || ~|intBin50Test; 
assign intBin49 = intGTE50 ? intBin50Test[66:0] : intBin50;
assign d50 = intGTE50 && |intBin50;

reg d52_q4;
reg d51_q4;
reg d50_q4;
reg [66:0] intBin49_q4;
reg [66:0] IntWeight_q4;
reg [10:0] biasedExp_q4;
reg [57:0] chaf_q4;
always @(posedge CLK)
    if (RESET) begin
        d52_q4       <= 0;
        d51_q4       <= 0;
        d50_q4       <= 0;
        intBin49_q4  <= 0;
        IntWeight_q4 <= 0;
        biasedExp_q4 <= 0;
    end
    else begin
        d52_q4       <= d52;
        d51_q4       <= d51;
        d50_q4       <= d50;
        intBin49_q4  <= intBin49;
        IntWeight_q4 <= IntWeight;    
        biasedExp_q4 <= biasedExp;
    end
    
wire d49;
wire [67:0] intBin49Test;
wire intGTE49;
wire [66:0] intBin48;
assign intBin49Test = intBin49_q4 - (IntWeight_q4 >> 3);
assign intGTE49 = ~intBin49Test[67] || ~|intBin49Test; 
assign intBin48 = intGTE49 ? intBin49Test[66:0] : intBin49_q4;
assign d49 = intGTE49 && |intBin49_q4;

wire d48;
wire [67:0] intBin48Test;
wire intGTE48;
wire [66:0] intBin47;
assign intBin48Test = intBin48 - (IntWeight_q4 >> 4);
assign intGTE48 = ~intBin48Test[67] || ~|intBin48Test; 
assign intBin47 = intGTE48 ? intBin48Test[66:0] : intBin48;
assign d48 = intGTE48 && |intBin48;

wire d47;
wire [67:0] intBin47Test;
wire intGTE47;
wire [66:0] intBin46;
assign intBin47Test = intBin47 - (IntWeight_q4 >> 5);
assign intGTE47 = ~intBin47Test[67] || ~|intBin47Test; 
assign intBin46 = intGTE47 ? intBin47Test[66:0] : intBin47;
assign d47 = intGTE47 && |intBin47;

reg d52_q5;
reg d51_q5;
reg d50_q5;
reg d49_q5;
reg d48_q5;
reg d47_q5;
reg [66:0] intBin46_q5;
reg [66:0] IntWeight_q5;
reg [10:0] biasedExp_q5;
always @(posedge CLK)
    if (RESET) begin
        d52_q5       <= 0;
        d51_q5       <= 0;
        d50_q5       <= 0;
        d49_q5       <= 0;
        d48_q5       <= 0;
        d47_q5       <= 0;
        intBin46_q5  <= 0;
        IntWeight_q5 <= 0;
        biasedExp_q5 <= 0;
    end
    else begin
        d52_q5       <= d52_q4;
        d51_q5       <= d51_q4;
        d50_q5       <= d50_q4;
        d49_q5       <= d49;
        d48_q5       <= d48;
        d47_q5       <= d47;
        intBin46_q5  <= intBin46;
        IntWeight_q5 <= IntWeight_q4;    
        biasedExp_q5 <= biasedExp_q4;
    end

wire d46;
wire [67:0] intBin46Test;
wire intGTE46;
wire [66:0] intBin45;
assign intBin46Test = intBin46_q5 - (IntWeight_q5 >> 6);
assign intGTE46 = ~intBin46Test[67] || ~|intBin46Test; 
assign intBin45 = intGTE46 ? intBin46Test[66:0] : intBin46_q5;
assign d46 = intGTE46 && |intBin46_q5;

wire d45;
wire [67:0] intBin45Test;
wire intGTE45;
wire [66:0] intBin44;
assign intBin45Test = intBin45 - (IntWeight_q5 >> 7);
assign intGTE45 = ~intBin45Test[67] || ~|intBin45Test; 
assign intBin44 = intGTE45 ? intBin45Test[66:0] : intBin45;
assign d45 = intGTE45 && |intBin45;

wire d44;
wire [67:0] intBin44Test;
wire intGTE44;
wire [66:0] intBin43;
assign intBin44Test = intBin44 - (IntWeight_q5 >> 8);
assign intGTE44 = ~intBin44Test[67] || ~|intBin44Test; 
assign intBin43 = intGTE44 ? intBin44Test[66:0] : intBin44;
assign d44 = intGTE44 && |intBin44;

reg d52_q6;
reg d51_q6;
reg d50_q6;
reg d49_q6;
reg d48_q6;
reg d47_q6;
reg d46_q6;
reg d45_q6;
reg d44_q6;
reg [66:0] intBin43_q6;
reg [66:0] IntWeight_q6;
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
        intBin43_q6  <= 0;
        IntWeight_q6 <= 0;
        biasedExp_q6 <= 0;
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
        intBin43_q6  <= intBin43;
        IntWeight_q6 <= IntWeight_q5;    
        biasedExp_q6 <= biasedExp_q5;
    end

wire d43;
wire [67:0] intBin43Test;
wire intGTE43;
wire [66:0] intBin42;
assign intBin43Test = intBin43_q6 - (IntWeight_q6 >> 9);
assign intGTE43 = ~intBin43Test[67] || ~|intBin43Test; 
assign intBin42 = intGTE43 ? intBin43Test[66:0] : intBin43_q6;
assign d43 = intGTE43 && |intBin43_q6;

wire d42;
wire [67:0] intBin42Test;
wire intGTE42;
wire [66:0] intBin41;
assign intBin42Test = intBin42 - (IntWeight_q6 >> 10);
assign intGTE42 = ~intBin42Test[67] || ~|intBin42Test; 
assign intBin41 = intGTE42 ? intBin42Test[66:0] : intBin42;
assign d42 = intGTE42 && |intBin42;

wire d41;
wire [67:0] intBin41Test;
wire intGTE41;
wire [66:0] intBin40;
assign intBin41Test = intBin41 - (IntWeight_q6 >> 11);
assign intGTE41 = ~intBin41Test[67] || ~|intBin41Test; 
assign intBin40 = intGTE41 ? intBin41Test[66:0] : intBin41;
assign d41 = intGTE41 && |intBin41;

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
reg [66:0] intBin40_q7;
reg [66:0] IntWeight_q7;
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
        intBin40_q7  <= 0;
        IntWeight_q7 <= 0;
        biasedExp_q7 <= 0;
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
        intBin40_q7  <= intBin40;
        IntWeight_q7 <= IntWeight_q6;    
        biasedExp_q7 <= biasedExp_q6;
    end

wire d40;
wire [67:0] intBin40Test;
wire intGTE40;
wire [66:0] intBin39;
assign intBin40Test = intBin40_q7 - (IntWeight_q7 >> 12);
assign intGTE40 = ~intBin40Test[67] || ~|intBin40Test; 
assign intBin39 = intGTE40 ? intBin40Test[66:0] : intBin40_q7;
assign d40 = intGTE40 && |intBin40_q7;

wire d39;
wire [67:0] intBin39Test;
wire intGTE39;
wire [66:0] intBin38;
assign intBin39Test = intBin39 - (IntWeight_q7 >> 13);
assign intGTE39 = ~intBin39Test[67] || ~|intBin39Test; 
assign intBin38 = intGTE39 ? intBin39Test[66:0] : intBin39;
assign d39 = intGTE39 && |intBin39;

wire d38;
wire [67:0] intBin38Test;
wire intGTE38;
wire [66:0] intBin37;
assign intBin38Test = intBin38 - (IntWeight_q7 >> 14);
assign intGTE38 = ~intBin38Test[67] || ~|intBin38Test; 
assign intBin37 = intGTE38 ? intBin38Test[66:0] : intBin38;
assign d38 = intGTE38 && |intBin38;

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
reg [66:0] intBin37_q8;
reg [66:0] IntWeight_q8;
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
        intBin37_q8  <= 0;
        IntWeight_q8 <= 0;
        biasedExp_q8 <= 0;
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
        intBin37_q8  <= intBin37;
        IntWeight_q8 <= IntWeight_q7;    
        biasedExp_q8 <= biasedExp_q7;
    end

wire d37;
wire [67:0] intBin37Test;
wire intGTE37;
wire [66:0] intBin36;
assign intBin37Test = intBin37_q8 - (IntWeight_q8 >> 15);
assign intGTE37 = ~intBin37Test[67] || ~|intBin37Test; 
assign intBin36 = intGTE37 ? intBin37Test[66:0] : intBin37_q8;
assign d37 = intGTE37 && |intBin37_q8;

wire d36;
wire [67:0] intBin36Test;
wire intGTE36;
wire [66:0] intBin35;
assign intBin36Test = intBin36 - (IntWeight_q8 >> 16);
assign intGTE36 = ~intBin36Test[67] || ~|intBin36Test; 
assign intBin35 = intGTE36 ? intBin36Test[66:0] : intBin36;
assign d36 = intGTE36 && |intBin36;

wire d35;
wire [67:0] intBin35Test;
wire intGTE35;
wire [66:0] intBin34;
assign intBin35Test = intBin35 - (IntWeight_q8 >> 17);
assign intGTE35 = ~intBin35Test[67] || ~|intBin35Test; 
assign intBin34 = intGTE35 ? intBin35Test[66:0] : intBin35;
assign d35 = intGTE35 && |intBin35;

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
reg [66:0] intBin34_q9;
reg [66:0] IntWeight_q9;
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
        intBin34_q9  <= 0;
        IntWeight_q9 <= 0;
        biasedExp_q9 <= 0;
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
        intBin34_q9  <= intBin34;
        IntWeight_q9 <= IntWeight_q8;    
        biasedExp_q9 <= biasedExp_q8;
    end

wire d34;
wire [67:0] intBin34Test;
wire intGTE34;
wire [66:0] intBin33;
assign intBin34Test = intBin34_q9 - (IntWeight_q9 >> 18);
assign intGTE34 = ~intBin34Test[67] || ~|intBin34Test; 
assign intBin33 = intGTE34 ? intBin34Test[66:0] : intBin34_q9;
assign d34 = intGTE34 && |intBin34_q9;

wire d33;
wire [67:0] intBin33Test;
wire intGTE33;
wire [66:0] intBin32;
assign intBin33Test = intBin33 - (IntWeight_q9 >> 19);
assign intGTE33 = ~intBin33Test[67] || ~|intBin33Test; 
assign intBin32 = intGTE33 ? intBin33Test[66:0] : intBin33;
assign d33 = intGTE33 && |intBin33;

wire d32;
wire [67:0] intBin32Test;
wire intGTE32;
wire [66:0] intBin31;
assign intBin32Test = intBin32 - (IntWeight_q9 >> 20);
assign intGTE32 = ~intBin32Test[67] || ~|intBin32Test; 
assign intBin31 = intGTE32 ? intBin32Test[66:0] : intBin32;
assign d32 = intGTE32 && |intBin32;

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
reg [66:0] intBin31_q10;
reg [66:0] IntWeight_q10;
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
        intBin31_q10  <= 0;
        IntWeight_q10 <= 0;
        biasedExp_q10 <= 0;
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
        intBin31_q10  <= intBin31;
        IntWeight_q10 <= IntWeight_q9;    
        biasedExp_q10 <= biasedExp_q9;
    end

wire d31;
wire [67:0] intBin31Test;
wire intGTE31;
wire [66:0] intBin30;
assign intBin31Test = intBin31_q10 - (IntWeight_q10 >> 21);
assign intGTE31 = ~intBin31Test[67] || ~|intBin31Test; 
assign intBin30 = intGTE31 ? intBin31Test[66:0] : intBin31_q10;
assign d31 = intGTE31 && |intBin31_q10;

wire d30;
wire [67:0] intBin30Test;
wire intGTE30;
wire [66:0] intBin29;
assign intBin30Test = intBin30 - (IntWeight_q10 >> 22);
assign intGTE30 = ~intBin30Test[67] || ~|intBin30Test; 
assign intBin29 = intGTE30 ? intBin30Test[66:0] : intBin30;
assign d30 = intGTE30 && |intBin30;

wire d29;
wire [67:0] intBin29Test;
wire intGTE29;
wire [66:0] intBin28;
assign intBin29Test = intBin29 - (IntWeight_q10 >> 23);
assign intGTE29 = ~intBin29Test[67] || ~|intBin29Test; 
assign intBin28 = intGTE29 ? intBin29Test[66:0] : intBin29;
assign d29 = intGTE29 && |intBin29;

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
reg [66:0] intBin28_q11;
reg [66:0] IntWeight_q11;
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
        intBin28_q11  <= 0;
        IntWeight_q11 <= 0;
        biasedExp_q11 <= 0;
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
        intBin28_q11  <= intBin28;
        IntWeight_q11 <= IntWeight_q10;    
        biasedExp_q11 <= biasedExp_q10;
    end

wire d28;
wire [67:0] intBin28Test;
wire intGTE28;
wire [66:0] intBin27;
assign intBin28Test = intBin28_q11 - (IntWeight_q11 >> 24);
assign intGTE28 = ~intBin28Test[67] || ~|intBin28Test; 
assign intBin27 = intGTE28 ? intBin28Test[66:0] : intBin28_q11;
assign d28 = intGTE28 && |intBin28_q11;

wire d27;
wire [67:0] intBin27Test;
wire intGTE27;
wire [66:0] intBin26;
assign intBin27Test = intBin27 - (IntWeight_q11 >> 25);
assign intGTE27 = ~intBin27Test[67] || ~|intBin27Test; 
assign intBin26 = intGTE27 ? intBin27Test[66:0] : intBin27;
assign d27 = intGTE27 && |intBin27;

wire d26;
wire [67:0] intBin26Test;
wire intGTE26;
wire [66:0] intBin25;
assign intBin26Test = intBin26 - (IntWeight_q11 >> 26);
assign intGTE26 = ~intBin26Test[67] || ~|intBin26Test; 
assign intBin25 = intGTE26 ? intBin26Test[66:0] : intBin26;
assign d26 = intGTE26 && |intBin26;

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
reg [66:0] intBin25_q12;
reg [66:0] IntWeight_q12;
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
        intBin25_q12  <= 0;
        IntWeight_q12 <= 0;
        biasedExp_q12 <= 0;
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
        intBin25_q12  <= intBin25;
        IntWeight_q12 <= IntWeight_q11;    
        biasedExp_q12 <= biasedExp_q11;
    end

wire d25;
wire [67:0] intBin25Test;
wire intGTE25;
wire [66:0] intBin24;
assign intBin25Test = intBin25_q12 - (IntWeight_q12 >> 27);
assign intGTE25 = ~intBin25Test[67] || ~|intBin25Test; 
assign intBin24 = intGTE25 ? intBin25Test[66:0] : intBin25_q12;
assign d25 = intGTE25 && |intBin25_q12;

wire d24;
wire [67:0] intBin24Test;
wire intGTE24;
wire [66:0] intBin23;
assign intBin24Test = intBin24 - (IntWeight_q12 >> 28);
assign intGTE24 = ~intBin24Test[67] || ~|intBin24Test; 
assign intBin23 = intGTE24 ? intBin24Test[66:0] : intBin24;
assign d24 = intGTE24 && |intBin24;

wire d23;
wire [67:0] intBin23Test;
wire intGTE23;
wire [66:0] intBin22;
assign intBin23Test = intBin23 - (IntWeight_q12 >> 29);
assign intGTE23 = ~intBin23Test[67] || ~|intBin23Test; 
assign intBin22 = intGTE23 ? intBin23Test[66:0] : intBin23;
assign d23 = intGTE23 && |intBin23;

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
reg [66:0] intBin22_q13;
reg [66:0] IntWeight_q13;
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
        intBin22_q13  <= 0;
        IntWeight_q13 <= 0;
        biasedExp_q13 <= 0;
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
        intBin22_q13  <= intBin22;
        IntWeight_q13 <= IntWeight_q12;    
        biasedExp_q13 <= biasedExp_q12;
    end

wire d22;
wire [67:0] intBin22Test;
wire intGTE22;
wire [66:0] intBin21;
assign intBin22Test = intBin22_q13 - (IntWeight_q13 >> 30);
assign intGTE22 = ~intBin22Test[67] || ~|intBin22Test; 
assign intBin21 = intGTE22 ? intBin22Test[66:0] : intBin22_q13;
assign d22 = intGTE22 && |intBin22_q13;

wire d21;
wire [67:0] intBin21Test;
wire intGTE21;
wire [66:0] intBin20;
assign intBin21Test = intBin21 - (IntWeight_q13 >> 31);
assign intGTE21 = ~intBin21Test[67] || ~|intBin21Test; 
assign intBin20 = intGTE21 ? intBin21Test[66:0] : intBin21;
assign d21 = intGTE21 && |intBin21;

wire d20;
wire [67:0] intBin20Test;
wire intGTE20;
wire [66:0] intBin19;
assign intBin20Test = intBin20 - (IntWeight_q13 >> 32);
assign intGTE20 = ~intBin20Test[67] || ~|intBin20Test; 
assign intBin19 = intGTE20 ? intBin20Test[66:0] : intBin20;
assign d20 = intGTE20 && |intBin20;

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
reg [66:0] intBin19_q14;
reg [66:0] IntWeight_q14;
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
        intBin19_q14  <= 0;
        IntWeight_q14 <= 0;
        biasedExp_q14 <= 0;
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
        intBin19_q14  <= intBin19;
        IntWeight_q14 <= IntWeight_q13;    
        biasedExp_q14 <= biasedExp_q13;
    end

wire d19;
wire [67:0] intBin19Test;
wire intGTE19;
wire [66:0] intBin18;
assign intBin19Test = intBin19_q14 - (IntWeight_q14 >> 33);
assign intGTE19 = ~intBin19Test[67] || ~|intBin19Test; 
assign intBin18 = intGTE19 ? intBin19Test[66:0] : intBin19_q14;
assign d19 = intGTE19 && |intBin19_q14;

wire d18;
wire [67:0] intBin18Test;
wire intGTE18;
wire [66:0] intBin17;
assign intBin18Test = intBin18 - (IntWeight_q14 >> 34);
assign intGTE18 = ~intBin18Test[67] || ~|intBin18Test; 
assign intBin17 = intGTE18 ? intBin18Test[66:0] : intBin18;
assign d18 = intGTE18 && |intBin18;

wire d17;
wire [67:0] intBin17Test;
wire intGTE17;
wire [66:0] intBin16;
assign intBin17Test = intBin17 - (IntWeight_q14 >> 35);
assign intGTE17 = ~intBin17Test[67] || ~|intBin17Test; 
assign intBin16 = intGTE17 ? intBin17Test[66:0] : intBin17;
assign d17 = intGTE17 && |intBin17;

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
reg [66:0] intBin16_q15;
reg [66:0] IntWeight_q15;
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
        intBin16_q15  <= 0;
        IntWeight_q15 <= 0;
        biasedExp_q15 <= 0;
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
        intBin16_q15  <= intBin16;
        IntWeight_q15 <= IntWeight_q14;    
        biasedExp_q15 <= biasedExp_q14;
    end
    
wire d16;
wire [67:0] intBin16Test;
wire intGTE16;
wire [66:0] intBin15;
assign intBin16Test = intBin16_q15 - (IntWeight_q15 >> 36);
assign intGTE16 = ~intBin16Test[67] || ~|intBin16Test; 
assign intBin15 = intGTE16 ? intBin16Test[66:0] : intBin16_q15;
assign d16 = intGTE16 && |intBin16_q15;

wire d15;
wire [67:0] intBin15Test;
wire intGTE15;
wire [66:0] intBin14;
assign intBin15Test = intBin15 - (IntWeight_q15 >> 37);
assign intGTE15 = ~intBin15Test[67] || ~|intBin15Test; 
assign intBin14 = intGTE15 ? intBin15Test[66:0] : intBin15;
assign d15 = intGTE15 && |intBin15;

wire d14;
wire [67:0] intBin14Test;
wire intGTE14;
wire [66:0] intBin13;
assign intBin14Test = intBin14 - (IntWeight_q15 >> 38);
assign intGTE14 = ~intBin14Test[67] || ~|intBin14Test; 
assign intBin13 = intGTE14 ? intBin14Test[66:0] : intBin14;
assign d14 = intGTE14 && |intBin14;

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
reg [66:0] intBin13_q16;
reg [66:0] IntWeight_q16;
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
        intBin13_q16  <= 0;
        IntWeight_q16 <= 0;
        biasedExp_q16 <= 0;
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
        intBin13_q16  <= intBin13;
        IntWeight_q16 <= IntWeight_q15;    
        biasedExp_q16 <= biasedExp_q15;
    end
    
wire d13;
wire [67:0] intBin13Test;
wire intGTE13;
wire [66:0] intBin12;
assign intBin13Test = intBin13_q16 - (IntWeight_q16 >> 39);
assign intGTE13 = ~intBin13Test[67] || ~|intBin13Test; 
assign intBin12 = intGTE13 ? intBin13Test[66:0] : intBin13_q16;
assign d13 = intGTE13 && |intBin13_q16;

wire d12;
wire [67:0] intBin12Test;
wire intGTE12;
wire [66:0] intBin11;
assign intBin12Test = intBin12 - (IntWeight_q16 >> 40);
assign intGTE12 = ~intBin12Test[67] || ~|intBin12Test; 
assign intBin11 = intGTE12 ? intBin12Test[66:0] : intBin12;
assign d12 = intGTE12 && |intBin12;

wire d11;
wire [67:0] intBin11Test;
wire intGTE11;
wire [66:0] intBin10;
assign intBin11Test = intBin11 - (IntWeight_q16 >> 41);
assign intGTE11 = ~intBin11Test[67] || ~|intBin11Test; 
assign intBin10 = intGTE11 ? intBin11Test[66:0] : intBin11;
assign d11 = intGTE11 && |intBin11;

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
reg [66:0] intBin10_q17;
reg [66:0] IntWeight_q17;
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
        intBin10_q17  <= 0;
        IntWeight_q17 <= 0;
        biasedExp_q17 <= 0;
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
        intBin10_q17  <= intBin10;
        IntWeight_q17 <= IntWeight_q16;    
        biasedExp_q17 <= biasedExp_q16;
    end

wire d10;
wire [67:0] intBin10Test;
wire intGTE10;
wire [66:0] intBin9;
assign intBin10Test = intBin10_q17 - (IntWeight_q17 >> 42);
assign intGTE10 = ~intBin10Test[67] || ~|intBin10Test; 
assign intBin9 = intGTE10 ? intBin10Test[66:0] : intBin10_q17;
assign d10 = intGTE10 && |intBin10_q17;

wire d9;
wire [67:0] intBin9Test;
wire intGTE9;
wire [66:0] intBin8;
assign intBin9Test = intBin9 - (IntWeight_q17 >> 43);
assign intGTE9 = ~intBin9Test[67] || ~|intBin9Test; 
assign intBin8 = intGTE9 ? intBin9Test[66:0] : intBin9;
assign d9 = intGTE9 && |intBin9;

wire d8;
wire [67:0] intBin8Test;
wire intGTE8;
wire [66:0] intBin7;
assign intBin8Test = intBin8 - (IntWeight_q17 >> 44);
assign intGTE8 = ~intBin8Test[67] || ~|intBin8Test; 
assign intBin7 = intGTE8 ? intBin8Test[66:0] : intBin8;
assign d8 = intGTE8 && |intBin8;

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
reg [66:0] intBin7_q18;
reg [66:0] IntWeight_q18;
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
        intBin7_q18   <= 0;
        IntWeight_q18 <= 0;
        biasedExp_q18 <= 0;
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
        intBin7_q18   <= intBin7;
        IntWeight_q18 <= IntWeight_q17;    
        biasedExp_q18 <= biasedExp_q17;
    end

wire d7;
wire [67:0] intBin7Test;
wire intGTE7;
wire [66:0] intBin6;
assign intBin7Test = intBin7_q18 - (IntWeight_q18 >> 45);
assign intGTE7 = ~intBin7Test[67] || ~|intBin7Test; 
assign intBin6 = intGTE7 ? intBin7Test[66:0] : intBin7_q18;
assign d7 = intGTE7 && |intBin7_q18;

wire d6;
wire [67:0] intBin6Test;
wire intGTE6;
wire [66:0] intBin5;
assign intBin6Test = intBin6 - (IntWeight_q18 >> 46);
assign intGTE6 = ~intBin6Test[67] || ~|intBin6Test; 
assign intBin5 = intGTE6 ? intBin6Test[66:0] : intBin6;
assign d6 = intGTE6 && |intBin6;

wire d5;
wire [67:0] intBin5Test;
wire intGTE5;
wire [66:0] intBin4;
assign intBin5Test = intBin5 - (IntWeight_q18 >> 47);
assign intGTE5 = ~intBin5Test[67] || ~|intBin5Test; 
assign intBin4 = intGTE5 ? intBin5Test[66:0] : intBin5;
assign d5 = intGTE5 && |intBin5;

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
reg [66:0] intBin4_q19;
reg [66:0] IntWeight_q19;
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
        intBin4_q19   <= 0;
        IntWeight_q19 <= 0;
        biasedExp_q19 <= 0;
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
        intBin4_q19   <= intBin4;
        IntWeight_q19 <= IntWeight_q18;    
        biasedExp_q19 <= biasedExp_q18;
    end

wire d4;
wire [67:0] intBin4Test;
wire intGTE4;
wire [66:0] intBin3;
assign intBin4Test = intBin4_q19 - (IntWeight_q19 >> 48);
assign intGTE4 = ~intBin4Test[67] || ~|intBin4Test; 
assign intBin3 = intGTE4 ? intBin4Test[66:0] : intBin4_q19;
assign d4 = intGTE4 && |intBin4_q19;

wire d3;
wire [67:0] intBin3Test;
wire intGTE3;
wire [66:0] intBin2;
assign intBin3Test = intBin3 - (IntWeight_q19 >> 49);
assign intGTE3 = ~intBin3Test[67] || ~|intBin3Test; 
assign intBin2 = intGTE3 ? intBin3Test[66:0] : intBin3;
assign d3 = intGTE3 && |intBin3;

wire d2;
wire [67:0] intBin2Test;
wire intGTE2;
wire [66:0] intBin1;
assign intBin2Test = intBin2 - (IntWeight_q19 >> 50);
assign intGTE2 = ~intBin2Test[67] || ~|intBin2Test; 
assign intBin1 = intGTE2 ? intBin2Test[66:0] : intBin2;
assign d2 = intGTE2 && |intBin2;

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
reg [66:0] intBin1_q20;
reg [66:0] IntWeight_q20;
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
        intBin1_q20   <= 0;
        IntWeight_q20 <= 0;
        biasedExp_q20 <= 0;
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
        intBin1_q20   <= intBin1;
        IntWeight_q20 <= IntWeight_q19;    
        biasedExp_q20 <= biasedExp_q19;
    end

wire d1;
wire [67:0] intBin1Test;
wire intGTE1;
wire [66:0] intBin0;
assign intBin1Test = intBin1_q20 - (IntWeight_q20 >> 51);
assign intGTE1 = ~intBin1Test[67] || ~|intBin1Test; 
assign intBin0 = intGTE1 ? intBin1Test[66:0] : intBin1_q20;
assign d1 = intGTE1 && |intBin1_q20;


wire d0;
wire [67:0] intBin0Test;
wire intGTE0;
wire [66:0] intBinG;
assign intBin0Test = intBin0 - (IntWeight_q20 >> 52);
assign intGTE0 = ~intBin0Test[67] || ~|intBin0Test; 
assign intBinG = intGTE0 ? intBin0Test[66:0] : intBin0;
assign d0 = intGTE0 && |intBin0;

wire G;
wire [67:0] intBinGTest;
wire intGTEG;
wire [66:0] intBinR;
assign intBinGTest = intBinG - (IntWeight_q20 >> 53);
assign intGTEG = ~intBinGTest[67] || ~|intBinGTest; 
assign intBinR = intGTEG ? intBinGTest[66:0] : intBinG;
assign G = intGTEG && |intBinG;

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
reg [66:0] intBinR_q21;
reg [66:0] IntWeight_q21;
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
        intBinR_q21   <= 0;
        IntWeight_q21 <= 0;
        biasedExp_q21 <= 0;
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
        intBinR_q21   <= intBinR;
        IntWeight_q21 <= IntWeight_q20;    
        biasedExp_q21 <= biasedExp_q20;
    end

wire R;
wire [67:0] intBinRTest;
wire intGTER;
wire [66:0] intBinS;
assign intBinRTest = intBinR_q21 - (IntWeight_q21 >> 54);
assign intGTER = ~intBinRTest[67] || ~|intBinRTest; 
assign intBinS = intGTER ? intBinRTest[66:0] : intBinR;
assign R = intGTER && |intBinR_q21;

wire S;
wire [67:0] intBinSTest;
wire intGTES;
assign intBinSTest = intBinS - (IntWeight_q21 >> 55);
assign intGTES = ~intBinSTest[67] || ~|intBinSTest; 
assign S = intGTES && |intBinS;

assign intGRS = {G_q21, R, S};

wire intInexact;
assign intInexact = |intGRS;

assign intPartMant = {d52_q21, d51_q21, d50_q21, 
                      d49_q21, d48_q21, d47_q21, d46_q21, d45_q21, d44_q21, d43_q21, d42_q21, d41_q21, d40_q21, 
                      d39_q21, d38_q21, d37_q21, d36_q21, d35_q21, d34_q21, d33_q21, d32_q21, d31_q21, d30_q21, 
                      d29_q21, d28_q21, d27_q21, d26_q21, d25_q21, d24_q21, d23_q21, d22_q21, d21_q21, d20_q21, 
                      d19_q21, d18_q21, d17_q21, d16_q21, d15_q21, d14_q21, d13_q21, d12_q21, d11_q21, d10_q21, 
                       d9_q21,  d8_q21,  d7_q21,  d6_q21,  d5_q21,  d4_q21,  d3_q21,  d2_q21,  d1_q21,  d0_q21};
                      
assign biasedBinExpOut = biasedExp_q21;                      

endmodule
