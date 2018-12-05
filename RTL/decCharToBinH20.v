//  decCharToBinH20.v
 
// Author:  Jerry D. Harthcock
// Version:  1.02  November 4, 2018
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

module decCharToBinH20(
    RESET,
    CLK,
    round_mode,
    Away,
    wren,
    wrdata,
    binOut
    );

input CLK;
input RESET;
input [1:0] round_mode;
input Away;
input wren;
input [375:0] wrdata;
output [71:0] binOut;

parameter char_0 = 8'h30;
parameter char_Plus = 8'h2B;
parameter char_Minus = 8'h2D;
parameter char_e = 8'h65;
parameter char_E = 8'h45;
parameter inf_string = 24'h696E66;
parameter nan_string = 24'h6E616E;
parameter snan_string = 32'h736E616E;

//rounding mode encodings
parameter NEAREST = 2'b00;
parameter POSINF  = 2'b01;
parameter NEGINF  = 2'b10;
parameter ZERO    = 2'b11;

//                                                                                                                                                                                                                         <---- Integer Part --->|<---- Fraction Part --->
//                                                                                                                                                                                                                                                |
// digit                           40        39        38        37        36        35        34        33        32        31        30        29        28        27        26        25        24        23        22        21        20     |    19        18        17        16        15        14        13        12        11        10         9         8         7       6       5       4       3       2       1       0
//                                  |         |         |         |         |         |         |         |         |         |         |         |         |         |         |         |         |         |         |         |         |     |     |         |         |         |         |         |         |         |         |         |         |         |         |       |       |       |       |       |       |       |
// Char position          46       45        44        43        42        41        40        39        38        37        36        35        34        33        32        31        30        29        28        27        26        25     |    24        23        22        21        20        19        18        17        16        15        14        13        12      11      10       9       8       7       6       5       4       3       2      1      0
// ascii code  hex      + 2B       3x        3x        3x        3x        3x        3x        3x        3x        3x        3x        3x        3x        3x        3x        3x        3x        3x        3x        3x        3x        3x     |    3x        3x        3x        3x        3x        3x        3x        3x        3x        3x        3x        3x        3x      3x      3x      3x      3x      3x      3x      3x      e 65   + 2B     3x     3x     3x
//                      - 2D        |         |         |         |         |         |         |         |         |         |         |         |         |         |         |         |         |         |         |         |         |     |     |         |         |         |         |         |         |         |         |         |         |         |         |       |       |       |       |       |       |       |      E 45   - 2D      |      |      |
// entire byte        [375:368] [367:360] [359:352] [351:344] [343:336] [335:328] [327:320] [319:312] [311:304] [303:296] [295:288] [287:280] [279:272] [271:264] [263:256] [255:248] [247:240] [239:232] [231:224] [223:216] [215:208] [207:200] | [199:192] [191:184] [183:176] [175:168] [167:160] [159:152] [151:144] [143:136] [135:128] [127:120] [119:112] [111:104] [103:96] [95:88] [87:80] [79:72] [71:64] [63:56] [55:48] [47:40] [39:32] [31:24] [23:16] [15:8] [7:0]
// lower nyble only   [371:368] [363:360] [355:352] [347:344] [339:336] [331:328] [323:320] [315:312] [307:304] [299:296] [291:288] [283:280] [275:272] [267:264] [259:256] [251:248] [243:240] [235:232] [227:224] [219:216] [211:208] [203:200] | [195:192] [187:184] [179:176] [171:168] [163:160] [155:152] [147:144] [139:136] [131:128] [123:120] [115:112] [107:104]  [99:96] [91:88] [83:80] [75:72] [67:64] [59:56] [51:48] [43:40] [35:32] [27:24] [19:16] [11:8] [3:0]
//                        |         |         |         |         |         |         |         |         |         |         |         |         |         |         |         |         |         |         |         |         |         |     |     |         |         |         |         |         |         |         |         |         |         |         |         |       |       |       |       |       |       |       |       |       |       |      |      |
// nan                   20        20        20        20        20        20        20        20        20        20        20        20        20        20        20        20        20        20        20        20        20        20     |    20        20        20        20       2B/2D      6E        61        6E        20        3x        20        3x        3x      3x      3x      20      3x      3x      3x      3x      20      3x      3x     3x     3x
// snan                  20        20        20        20        20        20        20        20        20        20        20        20        20        20        20        20        20        20        20        20        20        20     |    20        20        20       2B/2D      73        6E        61        6E        20        3x        20        3x        3x      3x      3x      20      3x      3x      3x      3x      20      3x      3x     3x     3x
// infinity              20        20        20        20        20        20        20        20        20        20        20        20        20        20        20        20        20        20        20        20        20        20     |    20        20        20        20        20        20        20        20        20        20        20        20        20      20      20      20      20      20      20      20      20     2B/2D    69     6E     66
// zero                2B/2D       30        30        30        30        30        30        30        30        30        30        30        30        30        30        30        30        30        30        30        30        30     |    30        30        30        30        30        30        30        30        30        30        30        30        30      30      30      30      30      30      30      30      e 65   + 2B     30     30     30
//                                                                                                              

reg input_is_negative;

wire [3:0] expInDig0;
wire [3:0] expInDig1;
wire [3:0] expInDig2;
wire [8:0] decExp;

wire input_is_nan;
wire input_is_zero;
wire input_is_snan;
wire input_is_infinite;
wire input_is_invalid;
wire input_is_overflow;
wire input_is_underflow;
wire input_is_good_number;
wire good_payload;
wire good_number;

wire [50:0] payload;

always @(*)
    if (input_is_nan) input_is_negative = (wrdata[167:160]==8'h2D);
    else if (input_is_snan) input_is_negative = (wrdata[175:168]==8'h2D);
    else if (input_is_infinite) input_is_negative = (wrdata[31:24]==8'h2D); 
    else input_is_negative = (wrdata[375:368]==8'h2D);

assign expInDig0 = wrdata[3:0];
assign expInDig1 = wrdata[11:8];
assign expInDig2 = wrdata[19:16];
assign decExp = (expInDig2 * 100) + (expInDig1 * 10) + expInDig0;

assign input_is_zero =    ((wrdata[375:368]==8'h2B) || (wrdata[375:368]==8'h2D)) && 
                           (wrdata[367:40]=={41{8'h30}}) && ((wrdata[39:32]==8'h65) || (wrdata[39:32]==8'h45)) &&
                           (wrdata[31:0]==32'h2B303030);
                           
assign input_is_infinite = (wrdata[375:32]=={43{8'h20}}) && ((wrdata[31:24]==8'h2B) || (wrdata[31:24]==8'h2D)) && (wrdata[23:0]==24'h696e66); 

wire [7:0] plChar15;
wire [7:0] plChar14;
wire [7:0] plChar13;
wire [7:0] plChar12;
wire [7:0] plChar11;
wire [7:0] plChar10;
wire [7:0] plChar9;
wire [7:0] plChar8;
wire [7:0] plChar7;
wire [7:0] plChar6;
wire [7:0] plChar5;
wire [7:0] plChar4;
wire [7:0] plChar3;
wire [7:0] plChar2;
wire [7:0] plChar1;
wire [7:0] plChar0;

assign plChar15 = wrdata[127:120];
assign plChar14 = wrdata[119:112];
assign plChar13 = wrdata[111:104];
assign plChar12 = wrdata[103: 96];
assign plChar11 = wrdata[ 95: 88];
assign plChar10 = wrdata[ 87: 80];
assign plChar9  = wrdata[ 79: 72];
assign plChar8  = wrdata[ 71: 64];
assign plChar7  = wrdata[ 63: 56];
assign plChar6  = wrdata[ 55: 48];
assign plChar5  = wrdata[ 47: 40];
assign plChar4  = wrdata[ 39: 32];
assign plChar3  = wrdata[ 31: 24];
assign plChar2  = wrdata[ 23: 16];
assign plChar1  = wrdata[ 15:  8];
assign plChar0  = wrdata[  7:  0];

wire [3:0] plDig12;
wire [3:0] plDig11;
wire [3:0] plDig10;
wire [3:0] plDig9 ;
wire [3:0] plDig8 ;
wire [3:0] plDig7 ;
wire [3:0] plDig6 ;
wire [3:0] plDig5 ;
wire [3:0] plDig4 ;
wire [3:0] plDig3 ;
wire [3:0] plDig2 ;
wire [3:0] plDig1 ;
wire [3:0] plDig0 ;

cnvFHC dig12(
    .charIn  (plChar15),
    .nybleOut(plDig12)
    );
    
cnvFHC dig11(
    .charIn  (plChar13),
    .nybleOut(plDig11)
    );
cnvFHC dig10(
    .charIn  (plChar12),
    .nybleOut(plDig10)
    );
cnvFHC dig9(
    .charIn  (plChar11),
    .nybleOut(plDig9)
    );
cnvFHC dig8(
    .charIn  (plChar10),
    .nybleOut(plDig8)
    );

cnvFHC dig7(
    .charIn  (plChar8),
    .nybleOut(plDig7)
    );
cnvFHC dig6(
    .charIn  (plChar7),
    .nybleOut(plDig6)
    );
cnvFHC dig5(
    .charIn  (plChar6),
    .nybleOut(plDig5)
    );
cnvFHC dig4(
    .charIn  (plChar5),
    .nybleOut(plDig4)
    );
    
cnvFHC dig3(
    .charIn  (plChar3),
    .nybleOut(plDig3)
    );
cnvFHC dig2(
    .charIn  (plChar2),
    .nybleOut(plDig2)
    );
cnvFHC dig1(
    .charIn  (plChar1),
    .nybleOut(plDig1)
    );
cnvFHC dig0(
    .charIn  (plChar0),
    .nybleOut(plDig0)
    );
   
assign payload = {plDig12,
                  plDig11,
                  plDig10,
                  plDig9 ,
                  plDig8 ,
                  plDig7 ,
                  plDig6 ,
                  plDig5 ,
                  plDig4 ,
                  plDig3 ,
                  plDig2 ,
                  plDig1 ,
                  plDig0 
                  };  

wire GoodplChar15;
wire GoodplChar14;
wire GoodplChar13;
wire GoodplChar12;
wire GoodplChar11;
wire GoodplChar10;
wire GoodplChar9 ;
wire GoodplChar8 ;
wire GoodplChar7 ;
wire GoodplChar6 ;
wire GoodplChar5 ;
wire GoodplChar4 ;
wire GoodplChar3 ;
wire GoodplChar2 ;
wire GoodplChar1 ;
wire GoodplChar0 ;


assign GoodplChar15  = (((wrdata[127:124]==4'h3) && (wrdata[123:120] <= 4'h9)) || ((wrdata[127:124]==4'b0100) && (wrdata[123:120] <= 4'h6)));
assign GoodplChar14  =   (wrdata[119:112]==8'h20);
assign GoodplChar13  = (((wrdata[111:108]==4'h3) && (wrdata[107:104] <= 4'h9)) || ((wrdata[111:108]==4'b0100) && (wrdata[107:104] <= 4'h6)));
assign GoodplChar12  = (((wrdata[103:100]==4'h3) && (wrdata[ 99: 96] <= 4'h9)) || ((wrdata[103:100]==4'b0100) && (wrdata[ 99: 96] <= 4'h6)));
assign GoodplChar11  = (((wrdata[ 95: 92]==4'h3) && (wrdata[ 91: 88] <= 4'h9)) || ((wrdata[ 95: 92]==4'b0100) && (wrdata[ 91: 88] <= 4'h6)));
assign GoodplChar10  = (((wrdata[ 87: 84]==4'h3) && (wrdata[ 83: 80] <= 4'h9)) || ((wrdata[ 87: 84]==4'b0100) && (wrdata[ 83: 80] <= 4'h6)));
assign GoodplChar9   =   (wrdata[ 79: 72]==8'h20);
assign GoodplChar8   = (((wrdata[ 71: 68]==4'h3) && (wrdata[ 67: 64] <= 4'h9)) || ((wrdata[ 71: 68]==4'b0100) && (wrdata[ 67: 64] <= 4'h6)));
assign GoodplChar7   = (((wrdata[ 63: 60]==4'h3) && (wrdata[ 59: 56] <= 4'h9)) || ((wrdata[ 63: 60]==4'b0100) && (wrdata[ 59: 56] <= 4'h6)));
assign GoodplChar6   = (((wrdata[ 55: 52]==4'h3) && (wrdata[ 51: 48] <= 4'h9)) || ((wrdata[ 55: 52]==4'b0100) && (wrdata[ 51: 48] <= 4'h6)));
assign GoodplChar5   = (((wrdata[ 47: 44]==4'h3) && (wrdata[ 43: 40] <= 4'h9)) || ((wrdata[ 47: 44]==4'b0100) && (wrdata[ 43: 40] <= 4'h6)));
assign GoodplChar4   =   (wrdata[ 39: 32]==8'h20);
assign GoodplChar3   = (((wrdata[ 31: 28]==4'h3) && (wrdata[ 27: 24] <= 4'h9)) || ((wrdata[ 31: 28]==4'b0100) && (wrdata[ 27: 24] <= 4'h6)));
assign GoodplChar2   = (((wrdata[ 23: 20]==4'h3) && (wrdata[ 19: 16] <= 4'h9)) || ((wrdata[ 23: 20]==4'b0100) && (wrdata[ 19: 16] <= 4'h6)));
assign GoodplChar1   = (((wrdata[ 15: 12]==4'h3) && (wrdata[ 11:  8] <= 4'h9)) || ((wrdata[ 15: 12]==4'b0100) && (wrdata[ 11:  8] <= 4'h6)));
assign GoodplChar0   = (((wrdata[  7:  4]==4'h3) && (wrdata[  3:  0] <= 4'h9)) || ((wrdata[  7:  4]==4'b0100) && (wrdata[  3:  0] <= 4'h6)));

           
assign good_payload = &{GoodplChar15,
                        GoodplChar14,
                        GoodplChar13,
                        GoodplChar12,
                        GoodplChar11,
                        GoodplChar10,
                        GoodplChar9 ,
                        GoodplChar8 ,
                        GoodplChar7 ,
                        GoodplChar6 ,
                        GoodplChar5 ,
                        GoodplChar4 ,
                        GoodplChar3 ,
                        GoodplChar2 ,
                        GoodplChar1 ,
                        GoodplChar0 
                        };
                      
assign input_is_nan = (wrdata[375:168]=={26{8'h20}}) && ((wrdata[167:160]==8'h2B) || (wrdata[167:160]==8'h2D) || (wrdata[167:160]==8'h20)) && 
                      (wrdata[159:128]==32'h6E616E20) && good_payload;
                      
                      
assign input_is_snan = (wrdata[375:176]=={25{8'h20}}) && ((wrdata[175:168]==8'h2B) || (wrdata[175:168]==8'h2D) || (wrdata[175:168]==8'h20)) && 
                       (wrdata[167:128]==40'h736E616E20) && good_payload; 

assign good_number = (wrdata[367:364]==4'h3) &&
                     (wrdata[359:356]==4'h3) &&
                     (wrdata[351:348]==4'h3) &&
                     (wrdata[343:340]==4'h3) &&
                     (wrdata[335:332]==4'h3) &&
                     (wrdata[327:324]==4'h3) &&
                     (wrdata[319:316]==4'h3) &&
                     (wrdata[311:308]==4'h3) &&
                     (wrdata[303:300]==4'h3) &&
                     (wrdata[295:292]==4'h3) &&
                     (wrdata[287:284]==4'h3) &&
                     (wrdata[279:276]==4'h3) &&
                     (wrdata[271:268]==4'h3) &&
                     (wrdata[263:260]==4'h3) &&
                     (wrdata[255:252]==4'h3) &&
                     (wrdata[247:244]==4'h3) &&
                     (wrdata[239:236]==4'h3) &&
                     (wrdata[231:228]==4'h3) &&
                     (wrdata[223:220]==4'h3) &&
                     (wrdata[215:212]==4'h3) &&
                     (wrdata[207:204]==4'h3) &&
                     (wrdata[199:196]==4'h3) &&
                     (wrdata[191:188]==4'h3) &&
                     (wrdata[183:180]==4'h3) &&
                     (wrdata[175:172]==4'h3) &&
                     (wrdata[167:164]==4'h3) &&
                     (wrdata[159:156]==4'h3) &&
                     (wrdata[151:148]==4'h3) &&
                     (wrdata[143:140]==4'h3) &&
                     (wrdata[135:132]==4'h3) &&
                     (wrdata[127:124]==4'h3) &&
                     (wrdata[119:116]==4'h3) &&
                     (wrdata[111:108]==4'h3) &&
                     (wrdata[103:100]==4'h3) &&
                     (wrdata[ 95: 92]==4'h3) &&
                     (wrdata[ 87: 84]==4'h3) &&
                     (wrdata[ 79: 76]==4'h3) &&
                     (wrdata[ 71: 68]==4'h3) &&
                     (wrdata[ 63: 60]==4'h3) &&
                     (wrdata[ 55: 52]==4'h3) &&
                     (wrdata[ 47: 44]==4'h3) ;
                     
                     
                       
assign input_is_good_number = ((wrdata[375:368]==8'h2B) || (wrdata[375:368]==8'h2D)) &&
                              good_number &&
                              ((wrdata[39:32]==8'h65) || (wrdata[39:32]==8'h45)) &&
                              ((wrdata[31:24]==8'h2B) || (wrdata[31:24]==8'h2d)) &&
                               (wrdata[23:20]==4'h3)  && (wrdata[19:15] <= 4'h9) &&
                               (wrdata[15:12]==4'h3)  && (wrdata[11: 8] <= 4'h9) &&
                               (wrdata[ 7: 4]==4'h3)  && (wrdata[ 3: 0] <= 4'h9)  ;
                              
assign input_is_invalid = ~input_is_zero     &&
                          ~input_is_nan      &&
                          ~input_is_snan     &&
                          ~input_is_infinite &&
                          ~input_is_good_number;
                          

wire [3:0] digIn40;
wire [3:0] digIn39;
wire [3:0] digIn38;
wire [3:0] digIn37;
wire [3:0] digIn36;
wire [3:0] digIn35;
wire [3:0] digIn34;
wire [3:0] digIn33;
wire [3:0] digIn32;
wire [3:0] digIn31;
wire [3:0] digIn30;
wire [3:0] digIn29;
wire [3:0] digIn28;
wire [3:0] digIn27;
wire [3:0] digIn26;
wire [3:0] digIn25;
wire [3:0] digIn24;
wire [3:0] digIn23;    //      /\
wire [3:0] digIn22;    //      ||
wire [3:0] digIn21;    //      ||
wire [3:0] digIn20;    // integer part (20.2 digits)

wire [3:0] digIn19;    // fraction part (20 digits)
wire [3:0] digIn18;    //      ||
wire [3:0] digIn17;    //      ||
wire [3:0] digIn16;    //      \/
wire [3:0] digIn15;
wire [3:0] digIn14;
wire [3:0] digIn13;
wire [3:0] digIn12;
wire [3:0] digIn11;
wire [3:0] digIn10;
wire [3:0] digIn9;
wire [3:0] digIn8;
wire [3:0] digIn7;
wire [3:0] digIn6;
wire [3:0] digIn5;
wire [3:0] digIn4;
wire [3:0] digIn3;
wire [3:0] digIn2;
wire [3:0] digIn1;
wire [3:0] digIn0;
               
assign digIn40 = wrdata[363:360];
assign digIn39 = wrdata[355:352];
assign digIn38 = wrdata[347:344];
assign digIn37 = wrdata[339:336];
assign digIn36 = wrdata[331:328];
assign digIn35 = wrdata[323:320];
assign digIn34 = wrdata[315:312];
assign digIn33 = wrdata[307:304];
assign digIn32 = wrdata[299:296];
assign digIn31 = wrdata[291:288];
assign digIn30 = wrdata[283:280];
assign digIn29 = wrdata[275:272];
assign digIn28 = wrdata[267:264];
assign digIn27 = wrdata[259:256];
assign digIn26 = wrdata[251:248];
assign digIn25 = wrdata[243:240];
assign digIn24 = wrdata[235:232];
assign digIn23 = wrdata[227:224];
assign digIn22 = wrdata[219:216];
assign digIn21 = wrdata[211:208];
assign digIn20 = wrdata[203:200];
assign digIn19 = wrdata[195:192];
assign digIn18 = wrdata[187:184];
assign digIn17 = wrdata[179:176];
assign digIn16 = wrdata[171:168];
assign digIn15 = wrdata[163:160];
assign digIn14 = wrdata[155:152];
assign digIn13 = wrdata[147:144];
assign digIn12 = wrdata[139:136];
assign digIn11 = wrdata[131:128];
assign digIn10 = wrdata[123:120];
assign digIn9  = wrdata[115:112];
assign digIn8  = wrdata[107:104];
assign digIn7  = wrdata[ 99: 96];
assign digIn6  = wrdata[ 91: 88];
assign digIn5  = wrdata[ 83: 80];
assign digIn4  = wrdata[ 75: 72];
assign digIn3  = wrdata[ 67: 64];
assign digIn2  = wrdata[ 59: 56];
assign digIn1  = wrdata[ 51: 48];
assign digIn0  = wrdata[ 43: 40];

wire [163:0] decIn;
assign decIn = {digIn40,
                digIn39,
                digIn38,
                digIn37,
                digIn36,
                digIn35,
                digIn34,
                digIn33,
                digIn32,
                digIn31,
                digIn30,
                digIn29,
                digIn28,
                digIn27, 
                digIn26, 
                digIn25, 
                digIn24, 
                digIn23, 
                digIn22, 
                digIn21, 
                digIn20, 
                digIn19, 
                digIn18, 
                digIn17, 
                digIn16, 
                digIn15, 
                digIn14, 
                digIn13, 
                digIn12, 
                digIn11, 
                digIn10, 
                digIn9, 
                digIn8, 
                digIn7, 
                digIn6, 
                digIn5, 
                digIn4, 
                digIn3, 
                digIn2, 
                digIn1, 
                digIn0};

wire [7:0] expSignChar;
assign expSignChar = wrdata[31:24];

wire [83:0] integerPartDec;
assign integerPartDec = {digIn40,
                         digIn39,
                         digIn38,
                         digIn37,
                         digIn36,
                         digIn35,
                         digIn34,
                         digIn33,
                         digIn32,
                         digIn31,
                         digIn30,
                         digIn29,
                         digIn28,
                         digIn27,
                         digIn26,
                         digIn25,
                         digIn24,
                         digIn23,
                         digIn22,
                         digIn21,
                         digIn20
                         };

wire expIsMinus;
assign expIsMinus = (expSignChar==char_Minus);


wire [79:0] fractPartDec;
assign fractPartDec = {digIn19,
                       digIn18,
                       digIn17,
                       digIn16,
                       digIn15,
                       digIn14,
                       digIn13,
                       digIn12,
                       digIn11,
                       digIn10,
                       digIn9, 
                       digIn8, 
                       digIn7, 
                       digIn6, 
                       digIn5, 
                       digIn4, 
                       digIn3, 
                       digIn2, 
                       digIn1, 
                       digIn0
                       };

wire [3:0] integerPartDec20;
wire [3:0] integerPartDec19;
wire [3:0] integerPartDec18;
wire [3:0] integerPartDec17;
wire [3:0] integerPartDec16;
wire [3:0] integerPartDec15;
wire [3:0] integerPartDec14;
wire [3:0] integerPartDec13;
wire [3:0] integerPartDec12;
wire [3:0] integerPartDec11;
wire [3:0] integerPartDec10;
wire [3:0] integerPartDec9;
wire [3:0] integerPartDec8;
wire [3:0] integerPartDec7;
wire [3:0] integerPartDec6;
wire [3:0] integerPartDec5;
wire [3:0] integerPartDec4;
wire [3:0] integerPartDec3;
wire [3:0] integerPartDec2;
wire [3:0] integerPartDec1;
wire [3:0] integerPartDec0;

assign integerPartDec20 = integerPartDec[83:80];
assign integerPartDec19 = integerPartDec[79:76];
assign integerPartDec18 = integerPartDec[75:72];
assign integerPartDec17 = integerPartDec[71:68];
assign integerPartDec16 = integerPartDec[67:64];
assign integerPartDec15 = integerPartDec[63:60];
assign integerPartDec14 = integerPartDec[59:56];
assign integerPartDec13 = integerPartDec[55:52];
assign integerPartDec12 = integerPartDec[51:48];
assign integerPartDec11 = integerPartDec[47:44];
assign integerPartDec10 = integerPartDec[43:40];
assign integerPartDec9  = integerPartDec[39:36];
assign integerPartDec8  = integerPartDec[35:32];
assign integerPartDec7  = integerPartDec[31:28];
assign integerPartDec6  = integerPartDec[27:24];
assign integerPartDec5  = integerPartDec[23:20];  
assign integerPartDec4  = integerPartDec[19:16];  
assign integerPartDec3  = integerPartDec[15:12];  
assign integerPartDec2  = integerPartDec[11: 8];  
assign integerPartDec1  = integerPartDec[ 7: 4];  
assign integerPartDec0  = integerPartDec[ 3: 0];  

wire intDigit20isNotZero;
wire intDigit19isNotZero;
wire intDigit18isNotZero;
wire intDigit17isNotZero;
wire intDigit16isNotZero;
wire intDigit15isNotZero;
wire intDigit14isNotZero;
wire intDigit13isNotZero;
wire intDigit12isNotZero;
wire intDigit11isNotZero;
wire intDigit10isNotZero;
wire intDigit9isNotZero;
wire intDigit8isNotZero;
wire intDigit7isNotZero;
wire intDigit6isNotZero;
wire intDigit5isNotZero;
wire intDigit4isNotZero;
wire intDigit3isNotZero;
wire intDigit2isNotZero;
wire intDigit1isNotZero;
wire intDigit0isNotZero;
                
assign intDigit20isNotZero = |integerPartDec20;
assign intDigit19isNotZero = |integerPartDec19;
assign intDigit18isNotZero = |integerPartDec18;
assign intDigit17isNotZero = |integerPartDec17;
assign intDigit16isNotZero = |integerPartDec16;
assign intDigit15isNotZero = |integerPartDec15;
assign intDigit14isNotZero = |integerPartDec14;
assign intDigit13isNotZero = |integerPartDec13;
assign intDigit12isNotZero = |integerPartDec12;
assign intDigit11isNotZero = |integerPartDec11;
assign intDigit10isNotZero = |integerPartDec10;
assign intDigit9isNotZero  = |integerPartDec9 ;
assign intDigit8isNotZero  = |integerPartDec8 ;
assign intDigit7isNotZero  = |integerPartDec7 ;
assign intDigit6isNotZero  = |integerPartDec6 ;
assign intDigit5isNotZero  = |integerPartDec5 ;
assign intDigit4isNotZero  = |integerPartDec4 ;
assign intDigit3isNotZero  = |integerPartDec3 ;
assign intDigit2isNotZero  = |integerPartDec2 ;
assign intDigit1isNotZero  = |integerPartDec1 ;
assign intDigit0isNotZero  = |integerPartDec0 ;
                                          
wire [20:0] intLeadZeroSel;
assign intLeadZeroSel = {intDigit20isNotZero,
                         intDigit19isNotZero,
                         intDigit18isNotZero,
                         intDigit17isNotZero,
                         intDigit16isNotZero,
                         intDigit15isNotZero,
                         intDigit14isNotZero,
                         intDigit13isNotZero,
                         intDigit12isNotZero,
                         intDigit11isNotZero,
                         intDigit10isNotZero,
                         intDigit9isNotZero ,
                         intDigit8isNotZero ,
                         intDigit7isNotZero ,
                         intDigit6isNotZero ,
                         intDigit5isNotZero ,
                         intDigit4isNotZero ,
                         intDigit3isNotZero ,
                         intDigit2isNotZero ,
                         intDigit1isNotZero ,
                         intDigit0isNotZero 
                         };
                         
reg [4:0] intLeadZeroDigits;
always @(*)
    casex(intLeadZeroSel)
        21'b1xxxxxxxxxxxxxxxxxxxx : intLeadZeroDigits = 0;
        21'b01xxxxxxxxxxxxxxxxxxx : intLeadZeroDigits = 1;
        21'b001xxxxxxxxxxxxxxxxxx : intLeadZeroDigits = 2;
        21'b0001xxxxxxxxxxxxxxxxx : intLeadZeroDigits = 3;
        21'b00001xxxxxxxxxxxxxxxx : intLeadZeroDigits = 4;
        21'b000001xxxxxxxxxxxxxxx : intLeadZeroDigits = 5;
        21'b0000001xxxxxxxxxxxxxx : intLeadZeroDigits = 6;
        21'b00000001xxxxxxxxxxxxx : intLeadZeroDigits = 7;
        21'b000000001xxxxxxxxxxxx : intLeadZeroDigits = 8;
        21'b0000000001xxxxxxxxxxx : intLeadZeroDigits = 9;
        21'b00000000001xxxxxxxxxx : intLeadZeroDigits = 10;
        21'b000000000001xxxxxxxxx : intLeadZeroDigits = 11;
        21'b0000000000001xxxxxxxx : intLeadZeroDigits = 12;
        21'b00000000000001xxxxxxx : intLeadZeroDigits = 13;
        21'b000000000000001xxxxxx : intLeadZeroDigits = 14;
        21'b0000000000000001xxxxx : intLeadZeroDigits = 15;
        21'b00000000000000001xxxx : intLeadZeroDigits = 16;
        21'b000000000000000001xxx : intLeadZeroDigits = 17;
        21'b0000000000000000001xx : intLeadZeroDigits = 18;
        21'b00000000000000000001x : intLeadZeroDigits = 19;
        21'b000000000000000000001 : intLeadZeroDigits = 20;
                          default : intLeadZeroDigits = 21;
    endcase    
        
 
reg [8:0] decExp_del_0,
          decExp_del_1,                                 
          decExp_del_2; 
          
always @(posedge CLK)
    if (RESET) begin
        decExp_del_0 <= 0;
        decExp_del_1 <= 0;
        decExp_del_2 <= 0;
    end
    else begin
        decExp_del_0 <= decExp;
        decExp_del_1 <= decExp_del_0;
        decExp_del_2 <= decExp_del_1;
    end  
    
reg [4:0] intLeadZeroDigits_q0,
          intLeadZeroDigits_q1,
          intLeadZeroDigits_q2;

always @(posedge CLK)
    if (RESET) begin
        intLeadZeroDigits_q0 <= 0;
        intLeadZeroDigits_q1 <= 0;
        intLeadZeroDigits_q2 <= 0;
    end
    else begin
        intLeadZeroDigits_q0 <= intLeadZeroDigits;
        intLeadZeroDigits_q1 <= intLeadZeroDigits_q0;
        intLeadZeroDigits_q2 <= intLeadZeroDigits_q1;
    end              
          
wire  [66:0] fractPartBin;
wire fractIsZero;
assign fractIsZero = ~|fractPartBin;  

wire  [67:0] integerPartBin;
wire intIsZero;
assign intIsZero = ~|integerPartBin;


reg expIsMinus_q0 ,        
    expIsMinus_q1 ,        
    expIsMinus_q2 ,                                                                                      
    expIsMinus_q3 ,        
    expIsMinus_q4 ,
    expIsMinus_q5 ,
    expIsMinus_q6 ,
    expIsMinus_q7 ,
    expIsMinus_q8 ,
    expIsMinus_q9 ,
    expIsMinus_q10,
    expIsMinus_q11,
    expIsMinus_q12,
    expIsMinus_q13,
    expIsMinus_q14,
    expIsMinus_q15,
    expIsMinus_q16,
    expIsMinus_q17,
    expIsMinus_q18,
    expIsMinus_q19,
    expIsMinus_q20,
    expIsMinus_q21,
    expIsMinus_q22;

reg [8:0] decExpForLookUp;

always @(*)
    if (intIsZero) decExpForLookUp = 0;
    else if (|intLeadZeroDigits_q2 && expIsMinus_q2) decExpForLookUp = (decExp_del_2 - 20) + (20 - intLeadZeroDigits_q2);
    else if (~|intLeadZeroDigits_q2) decExpForLookUp = decExp_del_2 + 39;
    else decExpForLookUp = (decExp_del_2 + 20) + (20 - intLeadZeroDigits_q2) ;
    
reg wren_del_0,
    wren_del_1,
    wren_del_2;
    
always @(posedge CLK)
    if (RESET) begin
        wren_del_0 <= 0;        
        wren_del_1 <= 0;        
        wren_del_2 <= 0;        
    end
    else begin
        wren_del_0 <= wren;        
        wren_del_1 <= wren_del_0;        
        wren_del_2 <= wren_del_1;        
    end    
    
reg [67:0] integerPartBin20;
reg [66:0] integerPartBin19;
reg [66:0] integerPartBin18;
reg [66:0] integerPartBin17;
reg [66:0] integerPartBin16;
reg [66:0] integerPartBin15;
reg [66:0] integerPartBin14;
reg [66:0] integerPartBin13;
reg [66:0] integerPartBin12;
reg [66:0] integerPartBin11;
reg [66:0] integerPartBin10;
reg [66:0] integerPartBin9 ;
reg [66:0] integerPartBin8 ;
reg [66:0] integerPartBin7 ;
reg [66:0] integerPartBin6 ;
reg [66:0] integerPartBin5 ;
reg [66:0] integerPartBin4 ;
reg [66:0] integerPartBin3 ;
reg [66:0] integerPartBin2 ;
reg [66:0] integerPartBin1 ;
reg [66:0] integerPartBin0 ;

always @(posedge CLK) begin   //q0
    if (RESET) begin
        integerPartBin20 <= 0;
        integerPartBin19 <= 0;
        integerPartBin18 <= 0;
        integerPartBin17 <= 0;
        integerPartBin16 <= 0;
        integerPartBin15 <= 0;
        integerPartBin14 <= 0;
        integerPartBin13 <= 0;
        integerPartBin12 <= 0;
        integerPartBin11 <= 0;
        integerPartBin10 <= 0;
        integerPartBin9  <= 0;
        integerPartBin8  <= 0;
        integerPartBin7  <= 0;
        integerPartBin6  <= 0;
        integerPartBin5  <= 0;
        integerPartBin4  <= 0; 
        integerPartBin3  <= 0; 
        integerPartBin2  <= 0; 
        integerPartBin1  <= 0; 
        integerPartBin0  <= 0; 
    end
    else begin
        integerPartBin20 <= integerPartDec20[0] ? 68'D100000000000000000000 : 0;
        integerPartBin19 <= integerPartDec19 * 67'D10000000000000000000;
        integerPartBin18 <= integerPartDec18 * 67'D01000000000000000000;
        integerPartBin17 <= integerPartDec17 * 67'D00100000000000000000;
        integerPartBin16 <= integerPartDec16 * 67'D00010000000000000000;
        integerPartBin15 <= integerPartDec15 * 67'D00001000000000000000;
        integerPartBin14 <= integerPartDec14 * 67'D00000100000000000000;
        integerPartBin13 <= integerPartDec13 * 67'D00000010000000000000;
        integerPartBin12 <= integerPartDec12 * 67'D00000001000000000000;
        integerPartBin11 <= integerPartDec11 * 67'D00000000100000000000;
        integerPartBin10 <= integerPartDec10 * 67'D00000000010000000000;
        integerPartBin9  <= integerPartDec9  * 67'D00000000001000000000;
        integerPartBin8  <= integerPartDec8  * 67'D00000000000100000000;
        integerPartBin7  <= integerPartDec7  * 67'D00000000000010000000;
        integerPartBin6  <= integerPartDec6  * 67'D00000000000001000000;
        integerPartBin5  <= integerPartDec5  * 67'D00000000000000100000;
        integerPartBin4  <= integerPartDec4  * 67'D00000000000000010000;
        integerPartBin3  <= integerPartDec3  * 67'D00000000000000001000;
        integerPartBin2  <= integerPartDec2  * 67'D00000000000000000100;
        integerPartBin1  <= integerPartDec1  * 67'D00000000000000000010;
        integerPartBin0  <= integerPartDec0  * 67'D00000000000000000001;
    end
end    
    

wire [67:0] iPB20iPB19;
wire [67:0] iPB18iPB17;
wire [67:0] iPB16iPB15;
wire [67:0] iPB14iPB13;
wire [67:0] iPB12iPB11;
wire [67:0] iPB10iPB9;
wire [67:0] iPB8iPB7;
wire [67:0] iPB6iPB5;
wire [67:0] iPB4iPB3;
wire [67:0] iPB2iPB1;

assign iPB20iPB19 = integerPartBin20 + integerPartBin19;
assign iPB18iPB17 = integerPartBin18 + integerPartBin17;
assign iPB16iPB15 = integerPartBin16 + integerPartBin15;
assign iPB14iPB13 = integerPartBin14 + integerPartBin13;
assign iPB12iPB11 = integerPartBin12 + integerPartBin11;
assign iPB10iPB9  = integerPartBin10 + integerPartBin9;
assign iPB8iPB7   = integerPartBin8  + integerPartBin7;
assign iPB6iPB5   = integerPartBin6  + integerPartBin5;
assign iPB4iPB3   = integerPartBin4  + integerPartBin3;
assign iPB2iPB1   = integerPartBin2  + integerPartBin1;

reg [67:0] iPB20iPB19_iPB18iPB17;
reg [67:0] iPB16iPB15_iPB14iPB13;
reg [67:0] iPB12iPB11_iPB10iPB9;
reg [67:0] iPB8iPB7_iPB6iPB5;
reg [67:0] iPB4iPB3_iPB2iPB1;
reg [67:0] integerPartBin0_q1;

always @(posedge CLK) begin           //q1
    if (RESET) begin
        iPB20iPB19_iPB18iPB17 <= 0;    
        iPB16iPB15_iPB14iPB13 <= 0;
        iPB12iPB11_iPB10iPB9  <= 0;
        iPB8iPB7_iPB6iPB5     <= 0;
        iPB4iPB3_iPB2iPB1     <= 0;
        integerPartBin0_q1    <= 0;
        
    end
    else begin
        iPB20iPB19_iPB18iPB17 <= iPB20iPB19 + iPB18iPB17;
        iPB16iPB15_iPB14iPB13 <= iPB16iPB15 + iPB14iPB13;
        iPB12iPB11_iPB10iPB9  <= iPB12iPB11 + iPB10iPB9;
        iPB8iPB7_iPB6iPB5     <= iPB8iPB7   + iPB6iPB5;
        iPB4iPB3_iPB2iPB1     <= iPB4iPB3   + iPB2iPB1;
        integerPartBin0_q1    <= integerPartBin0;
    end
end

wire [67:0] iPB20iPB19_iPB18iPB17__iPB16iPB15_iPB14iPB13;
wire [67:0] iPB12iPB11_iPB10iPB9__iPB8iPB7_iPB6iPB5;
wire [67:0] iPB4iPB3_iPB2iPB1__integerPartBin0_q1;

assign iPB20iPB19_iPB18iPB17__iPB16iPB15_iPB14iPB13 = iPB20iPB19_iPB18iPB17 + iPB16iPB15_iPB14iPB13;
assign iPB12iPB11_iPB10iPB9__iPB8iPB7_iPB6iPB5 = iPB12iPB11_iPB10iPB9 + iPB8iPB7_iPB6iPB5;
assign iPB4iPB3_iPB2iPB1__integerPartBin0_q1 = iPB4iPB3_iPB2iPB1 + integerPartBin0_q1;

reg [67:0] iPB20iPB19_iPB18iPB17__iPB16iPB15_iPB14iPB13___iPB12iPB11_iPB10iPB9__iPB8iPB7_iPB6iPB5___iPB4iPB3_iPB2iPB1__integerPartBin0_q2;

always @(posedge CLK)            //q2
    if (RESET) iPB20iPB19_iPB18iPB17__iPB16iPB15_iPB14iPB13___iPB12iPB11_iPB10iPB9__iPB8iPB7_iPB6iPB5___iPB4iPB3_iPB2iPB1__integerPartBin0_q2 <= 0;
    else iPB20iPB19_iPB18iPB17__iPB16iPB15_iPB14iPB13___iPB12iPB11_iPB10iPB9__iPB8iPB7_iPB6iPB5___iPB4iPB3_iPB2iPB1__integerPartBin0_q2 <= 
         iPB20iPB19_iPB18iPB17__iPB16iPB15_iPB14iPB13 + iPB12iPB11_iPB10iPB9__iPB8iPB7_iPB6iPB5 + iPB4iPB3_iPB2iPB1__integerPartBin0_q1; 


assign integerPartBin = iPB20iPB19_iPB18iPB17__iPB16iPB15_iPB14iPB13___iPB12iPB11_iPB10iPB9__iPB8iPB7_iPB6iPB5___iPB4iPB3_iPB2iPB1__integerPartBin0_q2;

always @(posedge CLK)
    if (RESET) begin
        expIsMinus_q0  <= 0;        
        expIsMinus_q1  <= 0;        
        expIsMinus_q2  <= 0;        
        expIsMinus_q3  <= 0;        
        expIsMinus_q4  <= 0;
        expIsMinus_q5  <= 0;
        expIsMinus_q6  <= 0;
        expIsMinus_q7  <= 0;
        expIsMinus_q8  <= 0;
        expIsMinus_q9  <= 0;
        expIsMinus_q10 <= 0;
        expIsMinus_q11 <= 0;
        expIsMinus_q12 <= 0;
        expIsMinus_q13 <= 0;
        expIsMinus_q14 <= 0;
        expIsMinus_q15 <= 0;
        expIsMinus_q16 <= 0;
        expIsMinus_q17 <= 0;
        expIsMinus_q18 <= 0;
        expIsMinus_q19 <= 0;
        expIsMinus_q20 <= 0;
        expIsMinus_q21 <= 0;
        expIsMinus_q22 <= 0;
    end
    else begin
        if (wren) expIsMinus_q0 <= expIsMinus;
            expIsMinus_q1 <= expIsMinus_q0;
            expIsMinus_q2 <= expIsMinus_q1;
            expIsMinus_q3 <= expIsMinus_q2;
            expIsMinus_q4 <= expIsMinus_q3;
            expIsMinus_q5  <= expIsMinus_q4;
            expIsMinus_q6  <= expIsMinus_q5 ;
            expIsMinus_q7  <= expIsMinus_q6 ;
            expIsMinus_q8  <= expIsMinus_q7 ;
            expIsMinus_q9  <= expIsMinus_q8 ;
            expIsMinus_q10 <= expIsMinus_q9 ;
            expIsMinus_q11 <= expIsMinus_q10;
            expIsMinus_q12 <= expIsMinus_q11;
            expIsMinus_q13 <= expIsMinus_q12;
            expIsMinus_q14 <= expIsMinus_q13;
            expIsMinus_q15 <= expIsMinus_q14;
            expIsMinus_q16 <= expIsMinus_q15;
            expIsMinus_q17 <= expIsMinus_q16;
            expIsMinus_q18 <= expIsMinus_q17;
            expIsMinus_q19 <= expIsMinus_q18;
            expIsMinus_q20 <= expIsMinus_q19;
            expIsMinus_q21 <= expIsMinus_q20;
            expIsMinus_q22 <= expIsMinus_q21;
    end

assign input_is_overflow = (((integerPartBin > 68'D179769313486231570815) && (decExp_del_2 == 268)) || (decExp_del_2 > 268)) && ~expIsMinus_q2;

wire maxSubNorm;
assign maxSubNorm = (fractPartBin <=  67'D22250738585072008890);
wire fractIsSubnormal;
assign fractIsSubnormal = (   ( (fractPartBin <=  67'D22250738585072008890) && (decExp_del_2 == 327) ) || (decExp_del_2 > 327)   ) && intIsZero && expIsMinus_q2;
assign input_is_underflow = fractIsSubnormal; 

wire [10:0] intBinExpOut;
wire [52:0] intPartMant;
wire [2:0] intGRS;
wire intInexact;
 
decCharToBinIntPart intPart(
    .CLK             (CLK             ), 
    .RESET           (RESET           ), 
    .wren_del_2      (wren_del_2      ), 
    .decExp_del_2    (decExpForLookUp ),
    .intIsZero       (intIsZero       ), 
    .fractIsSubnormal(fractIsSubnormal),
    .integerPartBin  (integerPartBin  ), 
    .intPartMant     (intPartMant     ), 
    .biasedBinExpOut (intBinExpOut    ),
    .intGRS          (intGRS          ),
    .intInexact      (intInexact      )
    );

reg [10:0] intBinExpOut_q22;
always @(posedge CLK)
    if (RESET) intBinExpOut_q22 <= 0;
    else intBinExpOut_q22 <= intBinExpOut;   
    
reg [52:0] intPartMant_q22;
always @(posedge CLK)
    if (RESET) intPartMant_q22 <= 0;
    else intPartMant_q22 <= intPartMant;

    
reg [1:0] round_mode_q0 ,    
          round_mode_q1 ,    
          round_mode_q2 ,    
          round_mode_q3 ,    
          round_mode_q4 ,    
          round_mode_q5 ,    
          round_mode_q6 ,    
          round_mode_q7 ,    
          round_mode_q8 ,    
          round_mode_q9 ,    
          round_mode_q10,    
          round_mode_q11,    
          round_mode_q12,    
          round_mode_q13,    
          round_mode_q14,    
          round_mode_q15,    
          round_mode_q16,    
          round_mode_q17,    
          round_mode_q18,    
          round_mode_q19,    
          round_mode_q20,    
          round_mode_q21,    
          round_mode_q22;    
always @(posedge CLK)
    if (RESET) begin
        round_mode_q0  <= 2'b0;
        round_mode_q1  <= 2'b0;
        round_mode_q2  <= 2'b0;
        round_mode_q3  <= 2'b0;
        round_mode_q4  <= 2'b0;
        round_mode_q5  <= 2'b0;
        round_mode_q6  <= 2'b0;
        round_mode_q7  <= 2'b0;
        round_mode_q8  <= 2'b0;
        round_mode_q9  <= 2'b0;
        round_mode_q10 <= 2'b0;
        round_mode_q11 <= 2'b0;
        round_mode_q12 <= 2'b0;
        round_mode_q13 <= 2'b0;
        round_mode_q14 <= 2'b0;
        round_mode_q15 <= 2'b0;
        round_mode_q16 <= 2'b0;
        round_mode_q17 <= 2'b0;
        round_mode_q18 <= 2'b0;
        round_mode_q19 <= 2'b0;
        round_mode_q20 <= 2'b0;
        round_mode_q21 <= 2'b0;
        round_mode_q22 <= 2'b0;
    end
    else begin
        if (wren) round_mode_q0 <= round_mode;
        round_mode_q1  <= round_mode_q0; 
        round_mode_q2  <= round_mode_q1 ; 
        round_mode_q3  <= round_mode_q2 ; 
        round_mode_q4  <= round_mode_q3 ; 
        round_mode_q5  <= round_mode_q4 ; 
        round_mode_q6  <= round_mode_q5 ; 
        round_mode_q7  <= round_mode_q6 ; 
        round_mode_q8  <= round_mode_q7 ; 
        round_mode_q9  <= round_mode_q8 ; 
        round_mode_q10 <= round_mode_q9 ; 
        round_mode_q11 <= round_mode_q10; 
        round_mode_q12 <= round_mode_q11; 
        round_mode_q13 <= round_mode_q12; 
        round_mode_q14 <= round_mode_q13; 
        round_mode_q15 <= round_mode_q14; 
        round_mode_q16 <= round_mode_q15; 
        round_mode_q17 <= round_mode_q16; 
        round_mode_q18 <= round_mode_q17; 
        round_mode_q19 <= round_mode_q18; 
        round_mode_q20 <= round_mode_q19; 
        round_mode_q21 <= round_mode_q20; 
        round_mode_q22 <= round_mode_q21; 
    end
    
reg Away_q0 ,    
    Away_q1 ,    
    Away_q2 ,    
    Away_q3 ,    
    Away_q4 ,    
    Away_q5 ,    
    Away_q6 ,    
    Away_q7 ,    
    Away_q8 ,    
    Away_q9 ,    
    Away_q10,    
    Away_q11,    
    Away_q12,    
    Away_q13,    
    Away_q14,    
    Away_q15,    
    Away_q16,    
    Away_q17,    
    Away_q18,    
    Away_q19,    
    Away_q20,    
    Away_q21,    
    Away_q22;    
always @(posedge CLK )
    if (RESET) begin
        Away_q0  <= 1'b0;
        Away_q1  <= 1'b0;
        Away_q2  <= 1'b0;
        Away_q3  <= 1'b0;
        Away_q4  <= 1'b0;
        Away_q5  <= 1'b0;
        Away_q6  <= 1'b0;
        Away_q7  <= 1'b0;
        Away_q8  <= 1'b0;
        Away_q9  <= 1'b0;
        Away_q10 <= 1'b0;
        Away_q11 <= 1'b0;
        Away_q12 <= 1'b0;
        Away_q13 <= 1'b0;
        Away_q14 <= 1'b0;
        Away_q15 <= 1'b0;
        Away_q16 <= 1'b0;
        Away_q17 <= 1'b0;
        Away_q18 <= 1'b0;
        Away_q19 <= 1'b0;
        Away_q20 <= 1'b0;
        Away_q21 <= 1'b0;
        Away_q22 <= 1'b0;
    end
    else begin
        if (wren) Away_q0 <= Away;
        Away_q1  <= Away_q0 ; 
        Away_q2  <= Away_q1 ; 
        Away_q3  <= Away_q2 ; 
        Away_q4  <= Away_q3 ; 
        Away_q5  <= Away_q4 ; 
        Away_q6  <= Away_q5 ; 
        Away_q7  <= Away_q6 ; 
        Away_q8  <= Away_q7 ; 
        Away_q9  <= Away_q8 ; 
        Away_q10 <= Away_q9 ; 
        Away_q11 <= Away_q10; 
        Away_q12 <= Away_q11; 
        Away_q13 <= Away_q12; 
        Away_q14 <= Away_q13; 
        Away_q15 <= Away_q14; 
        Away_q16 <= Away_q15; 
        Away_q17 <= Away_q16; 
        Away_q18 <= Away_q17; 
        Away_q19 <= Away_q18; 
        Away_q20 <= Away_q19; 
        Away_q21 <= Away_q20; 
        Away_q22 <= Away_q21; 
    end                            

    
reg sign_q0 ,    
    sign_q1 ,    
    sign_q2 ,    
    sign_q3 ,    
    sign_q4 ,    
    sign_q5 ,    
    sign_q6 ,    
    sign_q7 ,    
    sign_q8 ,    
    sign_q9 ,    
    sign_q10,    
    sign_q11,    
    sign_q12,    
    sign_q13,    
    sign_q14,    
    sign_q15,    
    sign_q16,    
    sign_q17,    
    sign_q18,    
    sign_q19,    
    sign_q20,    
    sign_q21,    
    sign_q22;    
always @(posedge CLK)
    if (RESET) begin
        sign_q0  <= 1'b0;
        sign_q1  <= 1'b0; 
        sign_q2  <= 1'b0; 
        sign_q3  <= 1'b0; 
        sign_q4  <= 1'b0;
        sign_q5  <= 1'b0;
        sign_q6  <= 1'b0;
        sign_q7  <= 1'b0;
        sign_q8  <= 1'b0;
        sign_q9  <= 1'b0;
        sign_q10 <= 1'b0;
        sign_q11 <= 1'b0;
        sign_q12 <= 1'b0;
        sign_q13 <= 1'b0;
        sign_q14 <= 1'b0;
        sign_q15 <= 1'b0;
        sign_q16 <= 1'b0;
        sign_q17 <= 1'b0;
        sign_q18 <= 1'b0;
        sign_q19 <= 1'b0;
        sign_q20 <= 1'b0;
        sign_q21 <= 1'b0;
        sign_q22 <= 1'b0;
    end
    else begin
        sign_q0  <= input_is_negative;
        sign_q1  <= sign_q0 ; 
        sign_q2  <= sign_q1 ; 
        sign_q3  <= sign_q2 ; 
        sign_q4  <= sign_q3 ; 
        sign_q5  <= sign_q4 ; 
        sign_q6  <= sign_q5 ; 
        sign_q7  <= sign_q6 ; 
        sign_q8  <= sign_q7 ; 
        sign_q9  <= sign_q8 ; 
        sign_q10 <= sign_q9 ; 
        sign_q11 <= sign_q10; 
        sign_q12 <= sign_q11; 
        sign_q13 <= sign_q12; 
        sign_q14 <= sign_q13; 
        sign_q15 <= sign_q14; 
        sign_q16 <= sign_q15; 
        sign_q17 <= sign_q16; 
        sign_q18 <= sign_q17; 
        sign_q19 <= sign_q18; 
        sign_q20 <= sign_q19; 
        sign_q21 <= sign_q20; 
        sign_q22 <= sign_q21; 
    end

reg is_invalid_q0 ,    
    is_invalid_q1 ,    
    is_invalid_q2 ,    
    is_invalid_q3 ,    
    is_invalid_q4 ,    
    is_invalid_q5 ,    
    is_invalid_q6 ,    
    is_invalid_q7 ,    
    is_invalid_q8 ,    
    is_invalid_q9 ,    
    is_invalid_q10,    
    is_invalid_q11,    
    is_invalid_q12,    
    is_invalid_q13,    
    is_invalid_q14,    
    is_invalid_q15,    
    is_invalid_q16,    
    is_invalid_q17,    
    is_invalid_q18,    
    is_invalid_q19,    
    is_invalid_q20,    
    is_invalid_q21,    
    is_invalid_q22;    
always @(posedge CLK)
    if (RESET) begin
        is_invalid_q0  <= 1'b0;
        is_invalid_q1  <= 1'b0;    
        is_invalid_q2  <= 1'b0;    
        is_invalid_q3  <= 1'b0;    
        is_invalid_q4  <= 1'b0;    
        is_invalid_q5  <= 1'b0;    
        is_invalid_q6  <= 1'b0;    
        is_invalid_q7  <= 1'b0;    
        is_invalid_q8  <= 1'b0;    
        is_invalid_q9  <= 1'b0;    
        is_invalid_q10 <= 1'b0;    
        is_invalid_q11 <= 1'b0;    
        is_invalid_q12 <= 1'b0;    
        is_invalid_q13 <= 1'b0;    
        is_invalid_q14 <= 1'b0;    
        is_invalid_q15 <= 1'b0;    
        is_invalid_q16 <= 1'b0;    
        is_invalid_q17 <= 1'b0;    
        is_invalid_q18 <= 1'b0;    
        is_invalid_q19 <= 1'b0;    
        is_invalid_q20 <= 1'b0;    
        is_invalid_q21 <= 1'b0;    
        is_invalid_q22 <= 1'b0;    
    end
    else begin
        if (wren) is_invalid_q0 <= input_is_invalid;
        is_invalid_q1  <= is_invalid_q0 ; 
        is_invalid_q2  <= is_invalid_q1 ; 
        is_invalid_q3  <= is_invalid_q2 ; 
        is_invalid_q4  <= is_invalid_q3 ; 
        is_invalid_q5  <= is_invalid_q4 ; 
        is_invalid_q6  <= is_invalid_q5 ; 
        is_invalid_q7  <= is_invalid_q6 ; 
        is_invalid_q8  <= is_invalid_q7 ; 
        is_invalid_q9  <= is_invalid_q8 ; 
        is_invalid_q10 <= is_invalid_q9 ; 
        is_invalid_q11 <= is_invalid_q10; 
        is_invalid_q12 <= is_invalid_q11; 
        is_invalid_q13 <= is_invalid_q12; 
        is_invalid_q14 <= is_invalid_q13; 
        is_invalid_q15 <= is_invalid_q14; 
        is_invalid_q16 <= is_invalid_q15; 
        is_invalid_q17 <= is_invalid_q16; 
        is_invalid_q18 <= is_invalid_q17; 
        is_invalid_q19 <= is_invalid_q18; 
        is_invalid_q20 <= is_invalid_q19; 
        is_invalid_q21 <= is_invalid_q20; 
        is_invalid_q22 <= is_invalid_q21; 
    end 
    
reg fractIsSubnormal_q3 ,
    fractIsSubnormal_q4 ,                               
    fractIsSubnormal_q5 ,                               
    fractIsSubnormal_q6 ,                               
    fractIsSubnormal_q7 ,                               
    fractIsSubnormal_q8 ,                               
    fractIsSubnormal_q9 ,                               
    fractIsSubnormal_q10,                               
    fractIsSubnormal_q11,                               
    fractIsSubnormal_q12,                               
    fractIsSubnormal_q13,                               
    fractIsSubnormal_q14,                               
    fractIsSubnormal_q15,                               
    fractIsSubnormal_q16,                               
    fractIsSubnormal_q17,                               
    fractIsSubnormal_q18,                               
    fractIsSubnormal_q19,                               
    fractIsSubnormal_q20,
    fractIsSubnormal_q21;
always @(posedge CLK)
    if (RESET) begin
        fractIsSubnormal_q3  <= 0;  
        fractIsSubnormal_q4  <= 0;
        fractIsSubnormal_q5  <= 0; 
        fractIsSubnormal_q6  <= 0; 
        fractIsSubnormal_q7  <= 0; 
        fractIsSubnormal_q8  <= 0; 
        fractIsSubnormal_q9  <= 0; 
        fractIsSubnormal_q10 <= 0; 
        fractIsSubnormal_q11 <= 0; 
        fractIsSubnormal_q12 <= 0; 
        fractIsSubnormal_q13 <= 0; 
        fractIsSubnormal_q14 <= 0; 
        fractIsSubnormal_q15 <= 0; 
        fractIsSubnormal_q16 <= 0; 
        fractIsSubnormal_q17 <= 0; 
        fractIsSubnormal_q18 <= 0; 
        fractIsSubnormal_q19 <= 0; 
        fractIsSubnormal_q20 <= 0;   
        fractIsSubnormal_q21 <= 0;   
    end
    else begin                       
        fractIsSubnormal_q3  <= fractIsSubnormal;  
        fractIsSubnormal_q4  <= fractIsSubnormal_q3 ;
        fractIsSubnormal_q5  <= fractIsSubnormal_q4 ; 
        fractIsSubnormal_q6  <= fractIsSubnormal_q5 ; 
        fractIsSubnormal_q7  <= fractIsSubnormal_q6 ; 
        fractIsSubnormal_q8  <= fractIsSubnormal_q7 ; 
        fractIsSubnormal_q9  <= fractIsSubnormal_q8 ; 
        fractIsSubnormal_q10 <= fractIsSubnormal_q9 ; 
        fractIsSubnormal_q11 <= fractIsSubnormal_q10; 
        fractIsSubnormal_q12 <= fractIsSubnormal_q11; 
        fractIsSubnormal_q13 <= fractIsSubnormal_q12; 
        fractIsSubnormal_q14 <= fractIsSubnormal_q13; 
        fractIsSubnormal_q15 <= fractIsSubnormal_q14; 
        fractIsSubnormal_q16 <= fractIsSubnormal_q15; 
        fractIsSubnormal_q17 <= fractIsSubnormal_q16; 
        fractIsSubnormal_q18 <= fractIsSubnormal_q17; 
        fractIsSubnormal_q19 <= fractIsSubnormal_q18; 
        fractIsSubnormal_q20 <= fractIsSubnormal_q19;   
        fractIsSubnormal_q21 <= fractIsSubnormal_q20;   
    end                       
    
                                   
        
reg is_nan_q0 ,        
    is_nan_q1 ,        
    is_nan_q2 ,        
    is_nan_q3 ,        
    is_nan_q4 ,        
    is_nan_q5 ,        
    is_nan_q6 ,        
    is_nan_q7 ,        
    is_nan_q8 ,        
    is_nan_q9 ,        
    is_nan_q10,        
    is_nan_q11,        
    is_nan_q12,        
    is_nan_q13,        
    is_nan_q14,        
    is_nan_q15,        
    is_nan_q16,        
    is_nan_q17,        
    is_nan_q18,        
    is_nan_q19,        
    is_nan_q20,        
    is_nan_q21,        
    is_nan_q22;        
always @(posedge CLK)
    if (RESET) begin
        is_nan_q0  <= 1'b0;
        is_nan_q1  <= 1'b0;
        is_nan_q2  <= 1'b0;
        is_nan_q3  <= 1'b0;
        is_nan_q4  <= 1'b0;
        is_nan_q5  <= 1'b0;
        is_nan_q6  <= 1'b0;
        is_nan_q7  <= 1'b0;
        is_nan_q8  <= 1'b0;
        is_nan_q9  <= 1'b0;
        is_nan_q10 <= 1'b0;
        is_nan_q11 <= 1'b0;
        is_nan_q12 <= 1'b0;
        is_nan_q13 <= 1'b0;
        is_nan_q14 <= 1'b0;
        is_nan_q15 <= 1'b0;
        is_nan_q16 <= 1'b0;
        is_nan_q17 <= 1'b0;
        is_nan_q18 <= 1'b0;
        is_nan_q19 <= 1'b0;
        is_nan_q20 <= 1'b0;
        is_nan_q21 <= 1'b0;
        is_nan_q22 <= 1'b0;
    end
    else begin
        if (wren) is_nan_q0 <= input_is_nan;
        is_nan_q1  <= is_nan_q0;
        is_nan_q2  <= is_nan_q1 ;
        is_nan_q3  <= is_nan_q2 ;
        is_nan_q4  <= is_nan_q3 ;
        is_nan_q5  <= is_nan_q4 ;
        is_nan_q6  <= is_nan_q5 ;
        is_nan_q7  <= is_nan_q6 ;
        is_nan_q8  <= is_nan_q7 ;
        is_nan_q9  <= is_nan_q8 ;
        is_nan_q10 <= is_nan_q9 ;
        is_nan_q11 <= is_nan_q10;
        is_nan_q12 <= is_nan_q11;
        is_nan_q13 <= is_nan_q12;
        is_nan_q14 <= is_nan_q13;
        is_nan_q15 <= is_nan_q14;
        is_nan_q16 <= is_nan_q15;
        is_nan_q17 <= is_nan_q16;
        is_nan_q18 <= is_nan_q17;
        is_nan_q19 <= is_nan_q18;
        is_nan_q20 <= is_nan_q19;
        is_nan_q21 <= is_nan_q20;
        is_nan_q22 <= is_nan_q21;
  end
                              
reg is_snan_q0 ,        
    is_snan_q1 ,        
    is_snan_q2 ,        
    is_snan_q3 ,        
    is_snan_q4 ,        
    is_snan_q5 ,        
    is_snan_q6 ,        
    is_snan_q7 ,        
    is_snan_q8 ,        
    is_snan_q9 ,        
    is_snan_q10,        
    is_snan_q11,        
    is_snan_q12,        
    is_snan_q13,        
    is_snan_q14,        
    is_snan_q15,        
    is_snan_q16,        
    is_snan_q17,        
    is_snan_q18,        
    is_snan_q19,        
    is_snan_q20,        
    is_snan_q21,        
    is_snan_q22;        
always @(posedge CLK)
    if (RESET) begin
        is_snan_q0  <= 1'b0;
        is_snan_q1  <= 1'b0;
        is_snan_q2  <= 1'b0;
        is_snan_q3  <= 1'b0;
        is_snan_q4  <= 1'b0;
        is_snan_q5  <= 1'b0;
        is_snan_q6  <= 1'b0;
        is_snan_q7  <= 1'b0;
        is_snan_q8  <= 1'b0;
        is_snan_q9  <= 1'b0;
        is_snan_q10 <= 1'b0;
        is_snan_q11 <= 1'b0;
        is_snan_q12 <= 1'b0;
        is_snan_q13 <= 1'b0;
        is_snan_q14 <= 1'b0;
        is_snan_q15 <= 1'b0;
        is_snan_q16 <= 1'b0;
        is_snan_q17 <= 1'b0;
        is_snan_q18 <= 1'b0;
        is_snan_q19 <= 1'b0;
        is_snan_q20 <= 1'b0;
        is_snan_q21 <= 1'b0;
        is_snan_q22 <= 1'b0;
    end
    else begin
        if (wren) is_snan_q0 <= input_is_snan;
        is_snan_q1  <=  is_snan_q0;
        is_snan_q2  <=  is_snan_q1 ;
        is_snan_q3  <=  is_snan_q2 ;
        is_snan_q4  <=  is_snan_q3 ;
        is_snan_q5  <=  is_snan_q4 ;
        is_snan_q6  <=  is_snan_q5 ;
        is_snan_q7  <=  is_snan_q6 ;
        is_snan_q8  <=  is_snan_q7 ;
        is_snan_q9  <=  is_snan_q8 ;
        is_snan_q10 <=  is_snan_q9 ;
        is_snan_q11 <=  is_snan_q10;
        is_snan_q12 <=  is_snan_q11;
        is_snan_q13 <=  is_snan_q12;
        is_snan_q14 <=  is_snan_q13;
        is_snan_q15 <=  is_snan_q14;
        is_snan_q16 <=  is_snan_q15;
        is_snan_q17 <=  is_snan_q16;
        is_snan_q18 <=  is_snan_q17;
        is_snan_q19 <=  is_snan_q18;
        is_snan_q20 <=  is_snan_q19;
        is_snan_q21 <=  is_snan_q20;
        is_snan_q22 <=  is_snan_q21;
    end

reg is_zero_q0 ,        
    is_zero_q1 ,        
    is_zero_q2 ,        
    is_zero_q3 ,        
    is_zero_q4 ,        
    is_zero_q5 ,        
    is_zero_q6 ,        
    is_zero_q7 ,        
    is_zero_q8 ,        
    is_zero_q9 ,        
    is_zero_q10,        
    is_zero_q11,        
    is_zero_q12,        
    is_zero_q13,        
    is_zero_q14,        
    is_zero_q15,        
    is_zero_q16,        
    is_zero_q17,        
    is_zero_q18,        
    is_zero_q19,        
    is_zero_q20,        
    is_zero_q21,        
    is_zero_q22;        
always @(posedge CLK)
    if (RESET) begin
        is_zero_q0  <= 1'b0;
        is_zero_q1  <= 1'b0;
        is_zero_q2  <= 1'b0;
        is_zero_q3  <= 1'b0;
        is_zero_q4  <= 1'b0;
        is_zero_q5  <= 1'b0;
        is_zero_q6  <= 1'b0;
        is_zero_q7  <= 1'b0;
        is_zero_q8  <= 1'b0;
        is_zero_q9  <= 1'b0;
        is_zero_q10 <= 1'b0;
        is_zero_q11 <= 1'b0;
        is_zero_q12 <= 1'b0;
        is_zero_q13 <= 1'b0;
        is_zero_q14 <= 1'b0;
        is_zero_q15 <= 1'b0;
        is_zero_q16 <= 1'b0;
        is_zero_q17 <= 1'b0;
        is_zero_q18 <= 1'b0;
        is_zero_q19 <= 1'b0;
        is_zero_q20 <= 1'b0;
        is_zero_q21 <= 1'b0;
        is_zero_q22 <= 1'b0;
    end
    else begin
        if (wren) is_zero_q0 <= input_is_zero;
        is_zero_q1  <= is_zero_q0;
        is_zero_q2  <= is_zero_q1 ;
        is_zero_q3  <= is_zero_q2 ;
        is_zero_q4  <= is_zero_q3 ;
        is_zero_q5  <= is_zero_q4 ;
        is_zero_q6  <= is_zero_q5 ;
        is_zero_q7  <= is_zero_q6 ;
        is_zero_q8  <= is_zero_q7 ;
        is_zero_q9  <= is_zero_q8 ;
        is_zero_q10 <= is_zero_q9 ;
        is_zero_q11 <= is_zero_q10;
        is_zero_q12 <= is_zero_q11;
        is_zero_q13 <= is_zero_q12;
        is_zero_q14 <= is_zero_q13;
        is_zero_q15 <= is_zero_q14;
        is_zero_q16 <= is_zero_q15;
        is_zero_q17 <= is_zero_q16;
        is_zero_q18 <= is_zero_q17;
        is_zero_q19 <= is_zero_q18;
        is_zero_q20 <= is_zero_q19;
        is_zero_q21 <= is_zero_q20;
        is_zero_q22 <= is_zero_q21;
    end

reg is_infinite_q0 ,        
    is_infinite_q1 ,        
    is_infinite_q2 ,        
    is_infinite_q3 ,        
    is_infinite_q4 ,
    is_infinite_q5 ,
    is_infinite_q6 ,
    is_infinite_q7 ,
    is_infinite_q8 ,
    is_infinite_q9 ,
    is_infinite_q10,
    is_infinite_q11,
    is_infinite_q12,
    is_infinite_q13,
    is_infinite_q14,
    is_infinite_q15,
    is_infinite_q16,
    is_infinite_q17,
    is_infinite_q18,
    is_infinite_q19,
    is_infinite_q20,
    is_infinite_q21,
    is_infinite_q22;
always @(posedge CLK)
    if (RESET) begin
        is_infinite_q0  <= 0;        
        is_infinite_q1  <= 0;        
        is_infinite_q2  <= 0;        
        is_infinite_q3  <= 0;        
        is_infinite_q4  <= 0;
        is_infinite_q5  <= 0;
        is_infinite_q6  <= 0;
        is_infinite_q7  <= 0;
        is_infinite_q8  <= 0;
        is_infinite_q9  <= 0;
        is_infinite_q10 <= 0;
        is_infinite_q11 <= 0;
        is_infinite_q12 <= 0;
        is_infinite_q13 <= 0;
        is_infinite_q14 <= 0;
        is_infinite_q15 <= 0;
        is_infinite_q16 <= 0;
        is_infinite_q17 <= 0;
        is_infinite_q18 <= 0;
        is_infinite_q19 <= 0;
        is_infinite_q20 <= 0;
        is_infinite_q21 <= 0;
        is_infinite_q22 <= 0;
    end
    else begin
        if (wren) is_infinite_q0 <= input_is_infinite;
            is_infinite_q1 <= is_infinite_q0;
            is_infinite_q2 <= is_infinite_q1;
            is_infinite_q3 <= is_infinite_q2;
            is_infinite_q4 <= is_infinite_q3;
            is_infinite_q5  <= is_infinite_q4;
            is_infinite_q6  <= is_infinite_q5 ;
            is_infinite_q7  <= is_infinite_q6 ;
            is_infinite_q8  <= is_infinite_q7 ;
            is_infinite_q9  <= is_infinite_q8 ;
            is_infinite_q10 <= is_infinite_q9 ;
            is_infinite_q11 <= is_infinite_q10;
            is_infinite_q12 <= is_infinite_q11;
            is_infinite_q13 <= is_infinite_q12;
            is_infinite_q14 <= is_infinite_q13;
            is_infinite_q15 <= is_infinite_q14;
            is_infinite_q16 <= is_infinite_q15;
            is_infinite_q17 <= is_infinite_q16;
            is_infinite_q18 <= is_infinite_q17;
            is_infinite_q19 <= is_infinite_q18;
            is_infinite_q20 <= is_infinite_q19;
            is_infinite_q21 <= is_infinite_q20;
            is_infinite_q22 <= is_infinite_q21;
    end

reg is_overflow_q3 ,        
    is_overflow_q4 ,        
    is_overflow_q5 ,        
    is_overflow_q6 ,        
    is_overflow_q7 ,        
    is_overflow_q8 ,        
    is_overflow_q9 ,        
    is_overflow_q10,        
    is_overflow_q11,        
    is_overflow_q12,        
    is_overflow_q13,        
    is_overflow_q14,        
    is_overflow_q15,        
    is_overflow_q16,        
    is_overflow_q17,        
    is_overflow_q18,        
    is_overflow_q19,        
    is_overflow_q20,        
    is_overflow_q21,        
    is_overflow_q22;        
always @(posedge CLK)
    if (RESET) begin
        is_overflow_q3  <= 0;      
        is_overflow_q4  <= 0;      
        is_overflow_q5  <= 0;      
        is_overflow_q6  <= 0;      
        is_overflow_q7  <= 0;      
        is_overflow_q8  <= 0;      
        is_overflow_q9  <= 0;      
        is_overflow_q10 <= 0;      
        is_overflow_q11 <= 0;      
        is_overflow_q12 <= 0;      
        is_overflow_q13 <= 0;      
        is_overflow_q14 <= 0;      
        is_overflow_q15 <= 0;      
        is_overflow_q16 <= 0;      
        is_overflow_q17 <= 0;      
        is_overflow_q18 <= 0;      
        is_overflow_q19 <= 0;      
        is_overflow_q20 <= 0;      
        is_overflow_q21 <= 0;      
        is_overflow_q22 <= 0;      
    end
    else begin
        if (wren) is_overflow_q3  <= input_is_overflow;      
        is_overflow_q4  <= is_overflow_q3 ;      
        is_overflow_q5  <= is_overflow_q4 ;      
        is_overflow_q6  <= is_overflow_q5 ;      
        is_overflow_q7  <= is_overflow_q6 ;      
        is_overflow_q8  <= is_overflow_q7 ;      
        is_overflow_q9  <= is_overflow_q8 ;      
        is_overflow_q10 <= is_overflow_q9 ;      
        is_overflow_q11 <= is_overflow_q10;      
        is_overflow_q12 <= is_overflow_q11;      
        is_overflow_q13 <= is_overflow_q12;      
        is_overflow_q14 <= is_overflow_q13;      
        is_overflow_q15 <= is_overflow_q14;     
        is_overflow_q16 <= is_overflow_q15;     
        is_overflow_q17 <= is_overflow_q16;     
        is_overflow_q18 <= is_overflow_q17;     
        is_overflow_q19 <= is_overflow_q18;     
        is_overflow_q20 <= is_overflow_q19;    
        is_overflow_q21 <= is_overflow_q20;    
        is_overflow_q22 <= is_overflow_q21;    
    end

reg is_underflow_q3 ,
    is_underflow_q4 ,
    is_underflow_q5 ,
    is_underflow_q6 ,
    is_underflow_q7 ,
    is_underflow_q8 ,
    is_underflow_q9 ,
    is_underflow_q10,
    is_underflow_q11,
    is_underflow_q12,
    is_underflow_q13,
    is_underflow_q14,
    is_underflow_q15,
    is_underflow_q16,
    is_underflow_q17,
    is_underflow_q18,
    is_underflow_q19,
    is_underflow_q20,
    is_underflow_q21,
    is_underflow_q22;
        
always @(posedge CLK)
    if (RESET) begin
        is_underflow_q3  <= 1'b0;
        is_underflow_q4  <= 1'b0;
        is_underflow_q5  <= 1'b0;
        is_underflow_q6  <= 1'b0;
        is_underflow_q7  <= 1'b0;
        is_underflow_q8  <= 1'b0;
        is_underflow_q9  <= 1'b0;
        is_underflow_q10 <= 1'b0;
        is_underflow_q11 <= 1'b0;
        is_underflow_q12 <= 1'b0;
        is_underflow_q13 <= 1'b0;
        is_underflow_q14 <= 1'b0;
        is_underflow_q15 <= 1'b0;
        is_underflow_q16 <= 1'b0;
        is_underflow_q17 <= 1'b0;
        is_underflow_q18 <= 1'b0;
        is_underflow_q19 <= 1'b0;
        is_underflow_q20 <= 1'b0;
        is_underflow_q21 <= 1'b0;
        is_underflow_q22 <= 1'b0;
    end                 
    else begin
        if (wren) is_underflow_q3  <= input_is_underflow;
        is_underflow_q4  <= is_underflow_q3 ;
        is_underflow_q5  <= is_underflow_q4 ;
        is_underflow_q6  <= is_underflow_q5 ;
        is_underflow_q7  <= is_underflow_q6 ;
        is_underflow_q8  <= is_underflow_q7 ;
        is_underflow_q9  <= is_underflow_q8 ;
        is_underflow_q10 <= is_underflow_q9 ;
        is_underflow_q11 <= is_underflow_q10;
        is_underflow_q12 <= is_underflow_q11;
        is_underflow_q13 <= is_underflow_q12;
        is_underflow_q14 <= is_underflow_q13;
        is_underflow_q15 <= is_underflow_q14;
        is_underflow_q16 <= is_underflow_q15;
        is_underflow_q17 <= is_underflow_q16;
        is_underflow_q18 <= is_underflow_q17;
        is_underflow_q19 <= is_underflow_q18;
        is_underflow_q20 <= is_underflow_q19;
        is_underflow_q21 <= is_underflow_q20;
        is_underflow_q22 <= is_underflow_q21;
    end

reg [50:0] payload_q0 ,
           payload_q1 ,
           payload_q2 ,
           payload_q3 ,
           payload_q4 ,
           payload_q5 ,
           payload_q6 ,
           payload_q7 ,
           payload_q8 ,
           payload_q9 ,
           payload_q10,
           payload_q11,
           payload_q12,
           payload_q13,
           payload_q14,
           payload_q15,
           payload_q16,
           payload_q17,
           payload_q18,
           payload_q19,
           payload_q20,
           payload_q21,
           payload_q22;
always @(posedge CLK)
    if (RESET) begin
        payload_q0  <= 0;
        payload_q1  <= 0;
        payload_q2  <= 0;
        payload_q3  <= 0;
        payload_q4  <= 0;
        payload_q5  <= 0;
        payload_q6  <= 0;
        payload_q7  <= 0;
        payload_q8  <= 0;
        payload_q9  <= 0;
        payload_q10 <= 0;
        payload_q11 <= 0;
        payload_q12 <= 0;
        payload_q13 <= 0;
        payload_q14 <= 0;
        payload_q15 <= 0;
        payload_q16 <= 0;
        payload_q17 <= 0;
        payload_q18 <= 0;
        payload_q19 <= 0;
        payload_q20 <= 0;
        payload_q21 <= 0;
        payload_q22 <= 0;
    end
    else begin
        if (wren && (input_is_snan || input_is_nan)) payload_q0 <= payload;
        payload_q1  <= payload_q0;
        payload_q2  <= payload_q1 ;
        payload_q3  <= payload_q2 ;
        payload_q4  <= payload_q3 ;
        payload_q5  <= payload_q4 ;
        payload_q6  <= payload_q5 ;
        payload_q7  <= payload_q6 ;
        payload_q8  <= payload_q7 ;
        payload_q9  <= payload_q8 ;
        payload_q10 <= payload_q9 ;
        payload_q11 <= payload_q10;
        payload_q12 <= payload_q11;
        payload_q13 <= payload_q12;
        payload_q14 <= payload_q13;
        payload_q15 <= payload_q14;
        payload_q16 <= payload_q15;
        payload_q17 <= payload_q16;
        payload_q18 <= payload_q17;
        payload_q19 <= payload_q18;
        payload_q20 <= payload_q19;
        payload_q21 <= payload_q20;
        payload_q22 <= payload_q21;
    end                             

wire [3:0] fractPartDec19;
wire [3:0] fractPartDec18;
wire [3:0] fractPartDec17;
wire [3:0] fractPartDec16;
wire [3:0] fractPartDec15;
wire [3:0] fractPartDec14;
wire [3:0] fractPartDec13;
wire [3:0] fractPartDec12;
wire [3:0] fractPartDec11;
wire [3:0] fractPartDec10;
wire [3:0] fractPartDec9;
wire [3:0] fractPartDec8;
wire [3:0] fractPartDec7;
wire [3:0] fractPartDec6;
wire [3:0] fractPartDec5;
wire [3:0] fractPartDec4;
wire [3:0] fractPartDec3;
wire [3:0] fractPartDec2;
wire [3:0] fractPartDec1;
wire [3:0] fractPartDec0;

assign fractPartDec19 = fractPartDec[79:76];
assign fractPartDec18 = fractPartDec[75:72];
assign fractPartDec17 = fractPartDec[71:68];
assign fractPartDec16 = fractPartDec[67:64];
assign fractPartDec15 = fractPartDec[63:60];
assign fractPartDec14 = fractPartDec[59:56];
assign fractPartDec13 = fractPartDec[55:52];
assign fractPartDec12 = fractPartDec[51:48];
assign fractPartDec11 = fractPartDec[47:44];
assign fractPartDec10 = fractPartDec[43:40];
assign fractPartDec9  = fractPartDec[39:36];
assign fractPartDec8  = fractPartDec[35:32];
assign fractPartDec7  = fractPartDec[31:28];
assign fractPartDec6  = fractPartDec[27:24];
assign fractPartDec5  = fractPartDec[23:20];  
assign fractPartDec4  = fractPartDec[19:16];  
assign fractPartDec3  = fractPartDec[15:12];  
assign fractPartDec2  = fractPartDec[11: 8];  
assign fractPartDec1  = fractPartDec[ 7: 4];  
assign fractPartDec0  = fractPartDec[ 3: 0];  

reg [66:0] fractPartBin19;
reg [66:0] fractPartBin18;
reg [66:0] fractPartBin17;
reg [66:0] fractPartBin16;
reg [66:0] fractPartBin15;
reg [66:0] fractPartBin14;
reg [66:0] fractPartBin13;
reg [66:0] fractPartBin12;
reg [66:0] fractPartBin11;
reg [66:0] fractPartBin10;
reg [66:0] fractPartBin9 ;
reg [66:0] fractPartBin8 ;
reg [66:0] fractPartBin7 ;
reg [66:0] fractPartBin6 ;
reg [66:0] fractPartBin5 ;
reg [66:0] fractPartBin4 ;
reg [66:0] fractPartBin3 ;
reg [66:0] fractPartBin2 ;
reg [66:0] fractPartBin1 ;
reg [66:0] fractPartBin0 ;

always @(posedge CLK) begin
    if (RESET) begin
        fractPartBin19 <= 0;
        fractPartBin18 <= 0;
        fractPartBin17 <= 0;
        fractPartBin16 <= 0;
        fractPartBin15 <= 0;
        fractPartBin14 <= 0;
        fractPartBin13 <= 0;
        fractPartBin12 <= 0;
        fractPartBin11 <= 0;
        fractPartBin10 <= 0;
        fractPartBin9  <= 0;
        fractPartBin8  <= 0;
        fractPartBin7  <= 0;
        fractPartBin6  <= 0;
        fractPartBin5  <= 0;
        fractPartBin4  <= 0; 
        fractPartBin3  <= 0; 
        fractPartBin2  <= 0; 
        fractPartBin1  <= 0; 
        fractPartBin0  <= 0; 
    end
    else begin
        fractPartBin19 <= fractPartDec19 * 67'D10000000000000000000;
        fractPartBin18 <= fractPartDec18 * 67'D01000000000000000000;
        fractPartBin17 <= fractPartDec17 * 67'D00100000000000000000;
        fractPartBin16 <= fractPartDec16 * 67'D00010000000000000000;
        fractPartBin15 <= fractPartDec15 * 67'D00001000000000000000;
        fractPartBin14 <= fractPartDec14 * 67'D00000100000000000000;
        fractPartBin13 <= fractPartDec13 * 67'D00000010000000000000;
        fractPartBin12 <= fractPartDec12 * 67'D00000001000000000000;
        fractPartBin11 <= fractPartDec11 * 67'D00000000100000000000;
        fractPartBin10 <= fractPartDec10 * 67'D00000000010000000000;
        fractPartBin9  <= fractPartDec9  * 67'D00000000001000000000;
        fractPartBin8  <= fractPartDec8  * 67'D00000000000100000000;
        fractPartBin7  <= fractPartDec7  * 67'D00000000000010000000;
        fractPartBin6  <= fractPartDec6  * 67'D00000000000001000000;
        fractPartBin5  <= fractPartDec5  * 67'D00000000000000100000;
        fractPartBin4  <= fractPartDec4  * 67'D00000000000000010000;
        fractPartBin3  <= fractPartDec3  * 67'D00000000000000001000;
        fractPartBin2  <= fractPartDec2  * 67'D00000000000000000100;
        fractPartBin1  <= fractPartDec1  * 67'D00000000000000000010;
        fractPartBin0  <= fractPartDec0  * 67'D00000000000000000001;
    end
end    

wire [66:0] fPB19fPB18;
wire [66:0] fPB17fPB16;
wire [66:0] fPB15fPB14;
wire [66:0] fPB13fPB12;
wire [66:0] fPB11fPB10;
wire [66:0] fPB9fPB8  ;
wire [66:0] fPB7fPB6  ;
wire [66:0] fPB5fPB4  ;
wire [66:0] fPB3fPB2  ;
wire [66:0] fPB1fPB0  ;

assign fPB19fPB18 = fractPartBin19 + fractPartBin18;
assign fPB17fPB16 = fractPartBin17 + fractPartBin16;
assign fPB15fPB14 = fractPartBin15 + fractPartBin14;
assign fPB13fPB12 = fractPartBin13 + fractPartBin12;
assign fPB11fPB10 = fractPartBin11 + fractPartBin10;
assign fPB9fPB8   = fractPartBin9  + fractPartBin8;
assign fPB7fPB6   = fractPartBin7  + fractPartBin6;
assign fPB5fPB4   = fractPartBin5  + fractPartBin4;
assign fPB3fPB2   = fractPartBin3  + fractPartBin2;
assign fPB1fPB0   = fractPartBin1  + fractPartBin0;

reg [66:0] fPB19fPB18_fPB17fPB16;
reg [66:0] fPB15fPB14_fPB13fPB12;
reg [66:0] fPB11fPB10_fPB9fPB8  ;
reg [66:0] fPB7fPB6_fPB5fPB4    ;
reg [66:0] fPB3fPB2_fPB1fPB0    ;

always @(posedge CLK) begin
    if (RESET) begin
        fPB19fPB18_fPB17fPB16 <= 0;    
        fPB15fPB14_fPB13fPB12 <= 0;
        fPB11fPB10_fPB9fPB8   <= 0;
        fPB7fPB6_fPB5fPB4     <= 0;
        fPB3fPB2_fPB1fPB0     <= 0;
    end
    else begin
        fPB19fPB18_fPB17fPB16 <= fPB19fPB18 + fPB17fPB16;
        fPB15fPB14_fPB13fPB12 <= fPB15fPB14 + fPB13fPB12;
        fPB11fPB10_fPB9fPB8   <= fPB11fPB10 + fPB9fPB8;
        fPB7fPB6_fPB5fPB4     <= fPB7fPB6   + fPB5fPB4;
        fPB3fPB2_fPB1fPB0     <= fPB3fPB2   + fPB1fPB0;
    end
end

wire [66:0] fPB19fPB18_fPB17fPB16__fPB15fPB14_fPB13fPB12;
wire [66:0] fPB11fPB10_fPB9fPB8__fPB7fPB6_fPB5fPB4;

assign fPB19fPB18_fPB17fPB16__fPB15fPB14_fPB13fPB12 = fPB19fPB18_fPB17fPB16 + fPB15fPB14_fPB13fPB12;
assign fPB11fPB10_fPB9fPB8__fPB7fPB6_fPB5fPB4 = fPB11fPB10_fPB9fPB8 + fPB7fPB6_fPB5fPB4;


reg [66:0] fPB19fPB18_fPB17fPB16__fPB15fPB14_fPB13fPB12___fPB11fPB10_fPB9fPB8__fPB7fPB6_fPB5fPB4___fPB3fPB2_fPB1fPB0;

always @(posedge CLK)
    if (RESET) fPB19fPB18_fPB17fPB16__fPB15fPB14_fPB13fPB12___fPB11fPB10_fPB9fPB8__fPB7fPB6_fPB5fPB4___fPB3fPB2_fPB1fPB0 <= 0;
    else fPB19fPB18_fPB17fPB16__fPB15fPB14_fPB13fPB12___fPB11fPB10_fPB9fPB8__fPB7fPB6_fPB5fPB4___fPB3fPB2_fPB1fPB0 <= 
         fPB19fPB18_fPB17fPB16__fPB15fPB14_fPB13fPB12 + fPB11fPB10_fPB9fPB8__fPB7fPB6_fPB5fPB4 + fPB3fPB2_fPB1fPB0;  

assign fractPartBin = fPB19fPB18_fPB17fPB16__fPB15fPB14_fPB13fPB12___fPB11fPB10_fPB9fPB8__fPB7fPB6_fPB5fPB4___fPB3fPB2_fPB1fPB0;


wire [10:0] fractBinExpOut;
wire [52:0] fractPartMant;
wire [2:0] fractGRS; 
wire fractInexact;
wire [5:0]  subnShiftAmtOut;

wire [8:0] fractExp_q2;
assign fractExp_q2 = (intLeadZeroDigits_q2 != 21) ? 9'b0 : (decExp_del_2 - 19);  //if any integer part digits are not zero, then substitue 0 for fraction exp

decCharToBinFractPart fracPart(
    .CLK             (CLK             ),
    .RESET           (RESET           ),
    .wren_del_2      (wren_del_2      ),
    .decExp_del_2    (fractExp_q2     ), 
    .fractIsZero     (fractIsZero     ),
    .fractIsSubnormal(fractIsSubnormal),
    .fractPartBin    (fractPartBin    ),
    .fractPartMant   (fractPartMant   ),
    .biasedBinExpOut (fractBinExpOut  ),
    .fractGRS        (fractGRS        ),
    .fractInexact    (fractInexact    ),
    .subnShiftAmtOut (subnShiftAmtOut )
    );
   
reg [5:0] subnShiftAmtOut_q4 ,
          subnShiftAmtOut_q5 ,
          subnShiftAmtOut_q6 ,
          subnShiftAmtOut_q7 ,
          subnShiftAmtOut_q8 ,
          subnShiftAmtOut_q9 ,
          subnShiftAmtOut_q10,
          subnShiftAmtOut_q11,
          subnShiftAmtOut_q12,
          subnShiftAmtOut_q13,
          subnShiftAmtOut_q14,
          subnShiftAmtOut_q15,
          subnShiftAmtOut_q16,
          subnShiftAmtOut_q17,
          subnShiftAmtOut_q18,
          subnShiftAmtOut_q19,
          subnShiftAmtOut_q20,
          subnShiftAmtOut_q21;
always @(posedge CLK)
    if (RESET) begin
        subnShiftAmtOut_q4  <= 0;    
        subnShiftAmtOut_q5  <= 0;
        subnShiftAmtOut_q6  <= 0;
        subnShiftAmtOut_q7  <= 0;
        subnShiftAmtOut_q8  <= 0;
        subnShiftAmtOut_q9  <= 0;
        subnShiftAmtOut_q10 <= 0;
        subnShiftAmtOut_q11 <= 0;
        subnShiftAmtOut_q12 <= 0;
        subnShiftAmtOut_q13 <= 0;
        subnShiftAmtOut_q14 <= 0;
        subnShiftAmtOut_q15 <= 0;
        subnShiftAmtOut_q16 <= 0;
        subnShiftAmtOut_q17 <= 0;
        subnShiftAmtOut_q18 <= 0;
        subnShiftAmtOut_q19 <= 0;
        subnShiftAmtOut_q20 <= 0;
        subnShiftAmtOut_q21 <= 0;
    end    
    else begin
        subnShiftAmtOut_q4  <= subnShiftAmtOut;    
        subnShiftAmtOut_q5  <= subnShiftAmtOut_q4 ;
        subnShiftAmtOut_q6  <= subnShiftAmtOut_q5 ;
        subnShiftAmtOut_q7  <= subnShiftAmtOut_q6 ;
        subnShiftAmtOut_q8  <= subnShiftAmtOut_q7 ;
        subnShiftAmtOut_q9  <= subnShiftAmtOut_q8 ;
        subnShiftAmtOut_q10 <= subnShiftAmtOut_q9 ;
        subnShiftAmtOut_q11 <= subnShiftAmtOut_q10;
        subnShiftAmtOut_q12 <= subnShiftAmtOut_q11;
        subnShiftAmtOut_q13 <= subnShiftAmtOut_q12;
        subnShiftAmtOut_q14 <= subnShiftAmtOut_q13;
        subnShiftAmtOut_q15 <= subnShiftAmtOut_q14;
        subnShiftAmtOut_q16 <= subnShiftAmtOut_q15;
        subnShiftAmtOut_q17 <= subnShiftAmtOut_q16;
        subnShiftAmtOut_q18 <= subnShiftAmtOut_q17;
        subnShiftAmtOut_q19 <= subnShiftAmtOut_q18;
        subnShiftAmtOut_q20 <= subnShiftAmtOut_q19;
        subnShiftAmtOut_q21 <= subnShiftAmtOut_q20;
    end
    
reg [10:0] fractBinExpOut_q22;
always @(posedge CLK)
    if (RESET) fractBinExpOut_q22 <= 0;
    else fractBinExpOut_q22 <= fractBinExpOut;   

reg [52:0] fractPartMant_q22;
always @(posedge CLK)
    if (RESET) fractPartMant_q22 <= 0;
    else fractPartMant_q22 <= fractPartMant;


wire [10:0] unbiasedExp_q21;
assign unbiasedExp_q21 = intBinExpOut - 1023;


wire [5:0] intFractSel;
assign intFractSel = (unbiasedExp_q21 < 52) ? unbiasedExp_q21 : 52;

reg [5:0] intFractSel_q22;
always @(posedge CLK)
    if (RESET) intFractSel_q22 <= 0;
    else intFractSel_q22 <= intFractSel;
    
reg [52:0] intMantissa;
always @(posedge CLK)
    case(intFractSel)
        6'd51 : intMantissa <= {intPartMant[52: 1], fractPartMant[52]};
        6'd50 : intMantissa <= {intPartMant[52: 2], fractPartMant[52:51]};
        6'd49 : intMantissa <= {intPartMant[52: 3], fractPartMant[52:50]};
        6'd48 : intMantissa <= {intPartMant[52: 4], fractPartMant[52:49]};
        6'd47 : intMantissa <= {intPartMant[52: 5], fractPartMant[52:48]};
        6'd46 : intMantissa <= {intPartMant[52: 6], fractPartMant[52:47]};
        6'd45 : intMantissa <= {intPartMant[52: 7], fractPartMant[52:46]};
        6'd44 : intMantissa <= {intPartMant[52: 8], fractPartMant[52:45]};
        6'd43 : intMantissa <= {intPartMant[52: 9], fractPartMant[52:44]};
        6'd42 : intMantissa <= {intPartMant[52:10], fractPartMant[52:43]};
        6'd41 : intMantissa <= {intPartMant[52:11], fractPartMant[52:42]};
        6'd40 : intMantissa <= {intPartMant[52:12], fractPartMant[52:41]};
        6'd39 : intMantissa <= {intPartMant[52:13], fractPartMant[52:40]};
        6'd38 : intMantissa <= {intPartMant[52:14], fractPartMant[52:39]};
        6'd37 : intMantissa <= {intPartMant[52:15], fractPartMant[52:38]};
        6'd36 : intMantissa <= {intPartMant[52:16], fractPartMant[52:37]};
        6'd35 : intMantissa <= {intPartMant[52:17], fractPartMant[52:36]};
        6'd34 : intMantissa <= {intPartMant[52:18], fractPartMant[52:35]};
        6'd33 : intMantissa <= {intPartMant[52:19], fractPartMant[52:34]};
        6'd32 : intMantissa <= {intPartMant[52:20], fractPartMant[52:33]};
        6'd31 : intMantissa <= {intPartMant[52:21], fractPartMant[52:32]};
        6'd30 : intMantissa <= {intPartMant[52:22], fractPartMant[52:31]};
        6'd29 : intMantissa <= {intPartMant[52:23], fractPartMant[52:30]};
        6'd28 : intMantissa <= {intPartMant[52:24], fractPartMant[52:29]};
        6'd27 : intMantissa <= {intPartMant[52:25], fractPartMant[52:28]};
        6'd26 : intMantissa <= {intPartMant[52:26], fractPartMant[52:27]};
        6'd25 : intMantissa <= {intPartMant[52:27], fractPartMant[52:26]};
        6'd24 : intMantissa <= {intPartMant[52:28], fractPartMant[52:25]};
        6'd23 : intMantissa <= {intPartMant[52:29], fractPartMant[52:24]};
        6'd22 : intMantissa <= {intPartMant[52:30], fractPartMant[52:23]};
        6'd21 : intMantissa <= {intPartMant[52:31], fractPartMant[52:22]};
        6'd20 : intMantissa <= {intPartMant[52:32], fractPartMant[52:21]};
        6'd19 : intMantissa <= {intPartMant[52:33], fractPartMant[52:20]};
        6'd18 : intMantissa <= {intPartMant[52:34], fractPartMant[52:19]};
        6'd17 : intMantissa <= {intPartMant[52:35], fractPartMant[52:18]};
        6'd16 : intMantissa <= {intPartMant[52:36], fractPartMant[52:17]};
        6'd15 : intMantissa <= {intPartMant[52:37], fractPartMant[52:16]};
        6'd14 : intMantissa <= {intPartMant[52:38], fractPartMant[52:15]};
        6'd13 : intMantissa <= {intPartMant[52:39], fractPartMant[52:14]};
        6'd12 : intMantissa <= {intPartMant[52:40], fractPartMant[52:13]};
        6'd11 : intMantissa <= {intPartMant[52:41], fractPartMant[52:12]};
        6'd10 : intMantissa <= {intPartMant[52:42], fractPartMant[52:11]};
        6'd9  : intMantissa <= {intPartMant[52:43], fractPartMant[52:10]};
        6'd8  : intMantissa <= {intPartMant[52:44], fractPartMant[52: 9]};
        6'd7  : intMantissa <= {intPartMant[52:45], fractPartMant[52: 8]};
        6'd6  : intMantissa <= {intPartMant[52:46], fractPartMant[52: 7]};
        6'd5  : intMantissa <= {intPartMant[52:47], fractPartMant[52: 6]};
        6'd4  : intMantissa <= {intPartMant[52:48], fractPartMant[52: 5]};
        6'd3  : intMantissa <= {intPartMant[52:49], fractPartMant[52: 4]};
        6'd2  : intMantissa <= {intPartMant[52:50], fractPartMant[52: 3]};
        6'd1  : intMantissa <= {intPartMant[52:51], fractPartMant[52: 2]};
        6'd0  : intMantissa <= {intPartMant[52   ], fractPartMant[52: 1]};
      default : intMantissa <=  intPartMant[52: 0];
    endcase    

reg [52:0] fractMantissa;
always @(posedge CLK)  
    if (fractIsSubnormal_q21) fractMantissa <=  fractPartMant >> subnShiftAmtOut_q21;
    else fractMantissa <=  fractPartMant;


reg intMantIsZero;
reg [51:0] mantissaFinal;

reg [2:0] intGRS_q22;
reg [2:0] fractGRS_q22;
reg [2:0] GRS_q22;


always @(posedge CLK)
    if (RESET) intGRS_q22 <= 0;
    else intGRS_q22 <= intGRS;
  
always @(posedge CLK)
    if (RESET) fractGRS_q22 <= 0;
    else fractGRS_q22 <= fractGRS;    

reg intInexact_q22;
always @(posedge CLK)
    if (RESET) intInexact_q22 <= 0;
    else intInexact_q22 <= intInexact;

reg fractInexact_q22;
always @(posedge CLK)
    if (RESET) fractInexact_q22 <= 0;
    else fractInexact_q22 <= fractInexact;

always @(posedge CLK)
    if (RESET) intMantIsZero <= 0;
    else intMantIsZero <= ~|intBinExpOut;

always @(*)
    if (intMantIsZero) begin
        mantissaFinal = fractMantissa[51:0]; 
        GRS_q22 = fractGRS_q22;
    end       
    else begin
        mantissaFinal = intMantissa[51:0];
        GRS_q22 = (intFractSel_q22 > 51) ? intGRS_q22 : fractGRS_q22;
    end    

wire [10:0] expFinal;
assign expFinal = intMantIsZero ? fractBinExpOut_q22 : intBinExpOut_q22;

wire inexact;
assign inexact = intInexact_q22 || fractInexact_q22; 
reg roundit;  

always @(*)
        case(round_mode_q22)
            NEAREST : if (  (mantissaFinal[0] && (GRS_q22 == 3'b100)) || (GRS_q22[2] && |GRS_q22[1:0]) || (Away_q22 && |GRS_q22[2:0])) roundit = 1'b1;    
                      else roundit = 1'b0;
            POSINF  : if (~sign_q22 && |GRS_q22) roundit = 1'b1;
                      else roundit = 1'b0;
            NEGINF  : if (sign_q22 && |GRS_q22) roundit = 1'b1;
                      else roundit = 1'b0;
            ZERO    : roundit = 1'b0;
        endcase       

// exception codes for five MSBs [68:64] of final result
parameter _no_excpt_   = 5'b00000;  
parameter _inexact_    = 5'b00001;
parameter _underflow_  = 5'b00010;                     
parameter _overflow_   = 5'b00100;  
parameter _invalid_    = 5'b01000;  
parameter _div_x_0_    = 5'b10000;  

reg [71:0] binOut;
always @(*)
    if (is_invalid_q22) binOut = {_invalid_, 1'b0, 11'b11111111111, 1'b1, 51'h0000000000007, 3'b000}; 
    else if (is_snan_q22 || is_nan_q22) binOut = {_no_excpt_, sign_q22, 11'b11111111111, 1'b1, payload_q22, 3'b000}; //signaling snans as char input are quieted 
    else if (is_overflow_q22 ) binOut = {_overflow_, sign_q22, 11'b11111111111, 52'b0, 3'b000}; 
    else if (is_zero_q22) binOut = {_no_excpt_, sign_q22, 63'b0, 3'b000};
//    else if (is_underflow_q22) binOut = {_underflow_, sign_q22, expFinal, mantissaFinal + roundit, GRS_q22};  //no rounding but with trailing GRS
    else if (is_underflow_q22) binOut = {_underflow_, sign_q22, expFinal, mantissaFinal + roundit, 3'b000};  //rounded
//    else if (is_underflow_q22) binOut = {_underflow_, sign_q22, expFinal, mantissaFinal, 3'b000};  //truncated
//    else binOut = {(inexact ? _inexact_ : _no_excpt_ ), sign_q22, expFinal, mantissaFinal, GRS_q22};    //no rounding but with trailing GRS
    else binOut = {(inexact ? _inexact_ : _no_excpt_ ), sign_q22, expFinal, mantissaFinal + roundit, 3'b000};  //rounded
//    else binOut = {(inexact ? _inexact_ : _no_excpt_ ), sign_q22, expFinal, mantissaFinal, 3'b000};  //truncated
        
endmodule
