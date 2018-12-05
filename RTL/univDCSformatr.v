// univDCSformatr.v
// Author:  Jerry D. Harthcock
// Version:  1.01  November 24, 2018
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

module univDCSformatr (
//    RESET,
//    CLK,
    sizeIn,
    DCSin,
    DCSout
    );

//input RESET;
//input CLK;
input [2:0] sizeIn;
input [375:0] DCSin;
output [375:0] DCSout;

reg [4:0] dotPosition;

wire inputIsStandardNaN;
wire inputIsStandardInf;
wire inputIsStandardNumber; 
wire standardInput; 

assign standardInput = inputIsStandardNaN || inputIsStandardInf || inputIsStandardNumber;

wire [20:0] dotPosSel;

wire [7:0] DCSin_30, 
           DCSin_29,
           DCSin_28,
           DCSin_27,
           DCSin_26,
           DCSin_25,
           DCSin_24,
           DCSin_23,
           DCSin_22,
           DCSin_21,
           DCSin_20,
           DCSin_19,
           DCSin_18,
           DCSin_17,
           DCSin_16,
           DCSin_15,
           DCSin_14,
           DCSin_13,
           DCSin_12,
           DCSin_11,
           DCSin_10,
           DCSin_9,
           DCSin_8,
           DCSin_7,
           DCSin_6,
           DCSin_5,
           DCSin_4,
           DCSin_3,
           DCSin_2,
           DCSin_1;

wire [7:0] DCSinNoSign_30, 
           DCSinNoSign_29,
           DCSinNoSign_28,
           DCSinNoSign_27,
           DCSinNoSign_26,
           DCSinNoSign_25,
           DCSinNoSign_24,
           DCSinNoSign_23,
           DCSinNoSign_22,
           DCSinNoSign_21,
           DCSinNoSign_20,
           DCSinNoSign_19,
           DCSinNoSign_18,
           DCSinNoSign_17,
           DCSinNoSign_16,
           DCSinNoSign_15,
           DCSinNoSign_14,
           DCSinNoSign_13,
           DCSinNoSign_12,
           DCSinNoSign_11,
           DCSinNoSign_10,
           DCSinNoSign_9,
           DCSinNoSign_8,
           DCSinNoSign_7,
           DCSinNoSign_6,
           DCSinNoSign_5,
           DCSinNoSign_4,
           DCSinNoSign_3,
           DCSinNoSign_2,
           DCSinNoSign_1;


assign {DCSin_30,
        DCSin_29,
        DCSin_28,
        DCSin_27,
        DCSin_26,
        DCSin_25,
        DCSin_24,
        DCSin_23,
        DCSin_22,
        DCSin_21,
        DCSin_20,
        DCSin_19,
        DCSin_18,
        DCSin_17,
        DCSin_16,
        DCSin_15,
        DCSin_14,
        DCSin_13,
        DCSin_12,
        DCSin_11,
        DCSin_10,
        DCSin_9,
        DCSin_8,
        DCSin_7,
        DCSin_6,
        DCSin_5,
        DCSin_4,
        DCSin_3,
        DCSin_2,
        DCSin_1} = DCSin[239:0]; 

//once a sign (if any) is detected, replace it with zero
assign DCSinNoSign_30 = ((DCSin_30==8'h2D) || (DCSin_30==8'h2B)) ? 8'h30 : DCSin_30;
assign DCSinNoSign_29 = ((DCSin_29==8'h2D) || (DCSin_29==8'h2B)) ? 8'h30 : DCSin_29;
assign DCSinNoSign_28 = ((DCSin_28==8'h2D) || (DCSin_28==8'h2B)) ? 8'h30 : DCSin_28;
assign DCSinNoSign_27 = ((DCSin_27==8'h2D) || (DCSin_27==8'h2B)) ? 8'h30 : DCSin_27;
assign DCSinNoSign_26 = ((DCSin_26==8'h2D) || (DCSin_26==8'h2B)) ? 8'h30 : DCSin_26;
assign DCSinNoSign_25 = ((DCSin_25==8'h2D) || (DCSin_25==8'h2B)) ? 8'h30 : DCSin_25;
assign DCSinNoSign_24 = ((DCSin_24==8'h2D) || (DCSin_24==8'h2B)) ? 8'h30 : DCSin_24;
assign DCSinNoSign_23 = ((DCSin_23==8'h2D) || (DCSin_23==8'h2B)) ? 8'h30 : DCSin_23;
assign DCSinNoSign_22 = ((DCSin_22==8'h2D) || (DCSin_22==8'h2B)) ? 8'h30 : DCSin_22;
assign DCSinNoSign_21 = ((DCSin_21==8'h2D) || (DCSin_21==8'h2B)) ? 8'h30 : DCSin_21;
assign DCSinNoSign_20 = ((DCSin_20==8'h2D) || (DCSin_20==8'h2B)) ? 8'h30 : DCSin_20;
assign DCSinNoSign_19 = ((DCSin_19==8'h2D) || (DCSin_19==8'h2B)) ? 8'h30 : DCSin_19;
assign DCSinNoSign_18 = ((DCSin_18==8'h2D) || (DCSin_18==8'h2B)) ? 8'h30 : DCSin_18;
assign DCSinNoSign_17 = ((DCSin_17==8'h2D) || (DCSin_17==8'h2B)) ? 8'h30 : DCSin_17;
assign DCSinNoSign_16 = ((DCSin_16==8'h2D) || (DCSin_16==8'h2B)) ? 8'h30 : DCSin_16;
assign DCSinNoSign_15 = ((DCSin_15==8'h2D) || (DCSin_15==8'h2B)) ? 8'h30 : DCSin_15;
assign DCSinNoSign_14 = ((DCSin_14==8'h2D) || (DCSin_14==8'h2B)) ? 8'h30 : DCSin_14;
assign DCSinNoSign_13 = ((DCSin_13==8'h2D) || (DCSin_13==8'h2B)) ? 8'h30 : DCSin_13;
assign DCSinNoSign_12 = ((DCSin_12==8'h2D) || (DCSin_12==8'h2B)) ? 8'h30 : DCSin_12;
assign DCSinNoSign_11 = ((DCSin_11==8'h2D) || (DCSin_11==8'h2B)) ? 8'h30 : DCSin_11;
assign DCSinNoSign_10 = ((DCSin_10==8'h2D) || (DCSin_10==8'h2B)) ? 8'h30 : DCSin_10;
assign DCSinNoSign_9  = ((DCSin_9 ==8'h2D) || (DCSin_9 ==8'h2B)) ? 8'h30 : DCSin_9 ;
assign DCSinNoSign_8  = ((DCSin_8 ==8'h2D) || (DCSin_8 ==8'h2B)) ? 8'h30 : DCSin_8 ;
assign DCSinNoSign_7  = ((DCSin_7 ==8'h2D) || (DCSin_7 ==8'h2B)) ? 8'h30 : DCSin_7 ;
assign DCSinNoSign_6  = ((DCSin_6 ==8'h2D) || (DCSin_6 ==8'h2B)) ? 8'h30 : DCSin_6 ;
assign DCSinNoSign_5  = ((DCSin_5 ==8'h2D) || (DCSin_5 ==8'h2B)) ? 8'h30 : DCSin_5 ;
assign DCSinNoSign_4  = ((DCSin_4 ==8'h2D) || (DCSin_4 ==8'h2B)) ? 8'h30 : DCSin_4 ;
assign DCSinNoSign_3  = ((DCSin_3 ==8'h2D) || (DCSin_3 ==8'h2B)) ? 8'h30 : DCSin_3 ;
assign DCSinNoSign_2  = ((DCSin_2 ==8'h2D) || (DCSin_2 ==8'h2B)) ? 8'h30 : DCSin_2 ;
assign DCSinNoSign_1  = ((DCSin_1 ==8'h2D) || (DCSin_1 ==8'h2B)) ? 8'h30 : DCSin_1 ;

wire [239:0] DCSinNoSign;
assign DCSinNoSign = {DCSinNoSign_30,
                      DCSinNoSign_29,
                      DCSinNoSign_28,
                      DCSinNoSign_27,
                      DCSinNoSign_26,
                      DCSinNoSign_25,
                      DCSinNoSign_24,
                      DCSinNoSign_23,
                      DCSinNoSign_22,
                      DCSinNoSign_21,
                      DCSinNoSign_20,
                      DCSinNoSign_19,
                      DCSinNoSign_18,
                      DCSinNoSign_17,
                      DCSinNoSign_16,
                      DCSinNoSign_15,
                      DCSinNoSign_14,
                      DCSinNoSign_13,
                      DCSinNoSign_12,
                      DCSinNoSign_11,
                      DCSinNoSign_10,
                      DCSinNoSign_9 ,
                      DCSinNoSign_8 ,
                      DCSinNoSign_7 ,
                      DCSinNoSign_6 ,
                      DCSinNoSign_5 ,
                      DCSinNoSign_4 ,
                      DCSinNoSign_3 ,
                      DCSinNoSign_2 ,
                      DCSinNoSign_1 
                      };
        
wire signIsNeg;
assign signIsNeg = ((DCSin_30==8'h2D)  ||
                    (DCSin_29==8'h2D)  ||
                    (DCSin_28==8'h2D)  ||
                    (DCSin_27==8'h2D)  ||
                    (DCSin_26==8'h2D)  ||
                    (DCSin_25==8'h2D)  ||
                    (DCSin_24==8'h2D)  ||
                    (DCSin_23==8'h2D)  ||
                    (DCSin_22==8'h2D)  ||
                    (DCSin_21==8'h2D)  ||
                    (DCSin_20==8'h2D)  ||
                    (DCSin_19==8'h2D)  ||
                    (DCSin_18==8'h2D)  ||
                    (DCSin_17==8'h2D)  ||
                    (DCSin_16==8'h2D)  ||
                    (DCSin_15==8'h2D)  ||
                    (DCSin_14==8'h2D)  ||
                    (DCSin_13==8'h2D)  ||
                    (DCSin_12==8'h2D)  ||
                    (DCSin_11==8'h2D)  ||
                    (DCSin_10==8'h2D)  ||
                    (DCSin_9 ==8'h2D)  ||
                    (DCSin_8 ==8'h2D)  ||
                    (DCSin_7 ==8'h2D)  ||
                    (DCSin_6 ==8'h2D)  ||
                    (DCSin_5 ==8'h2D)  ||
                    (DCSin_4 ==8'h2D)  ||
                    (DCSin_3 ==8'h2D)  ||
                    (DCSin_2 ==8'h2D)  ||
                    (DCSin_1 ==8'h2D)) && ~standardInput;

assign inputIsStandardInf = (DCSin[ 23: 16]==8'h69) && (DCSin[ 15:  8]==8'h6E) && (DCSin[  7:  0]==8'h66) && (sizeIn==3'b110);
assign inputIsStandardNaN = (DCSin[159:152]==8'h6E) && (DCSin[151:144]==8'h61) && (DCSin[143:136]==8'h6E) && (sizeIn==3'b110);

assign dotPosSel = {(DCSin_21==8'h2E),
                    (DCSin_20==8'h2E),
                    (DCSin_19==8'h2E),
                    (DCSin_18==8'h2E),
                    (DCSin_17==8'h2E),
                    (DCSin_16==8'h2E),
                    (DCSin_15==8'h2E),
                    (DCSin_14==8'h2E),
                    (DCSin_13==8'h2E),
                    (DCSin_12==8'h2E),
                    (DCSin_11==8'h2E),
                    (DCSin_10==8'h2E),
                    (DCSin_9 ==8'h2E),
                    (DCSin_8 ==8'h2E),
                    (DCSin_7 ==8'h2E),
                    (DCSin_6 ==8'h2E),
                    (DCSin_5 ==8'h2E),
                    (DCSin_4 ==8'h2E),
                    (DCSin_3 ==8'h2E),
                    (DCSin_2 ==8'h2E),
                    (DCSin_1 ==8'h2E)
                    };      

assign inputIsStandardNumber = ((DCSin[375:368]==8'h2B) || (DCSin[375:368]==8'h2D)) &&
                               ((DCSin[ 39: 32]==8'h65) || (DCSin[ 39: 32]==8'h45)) && 
                               ((DCSin[ 31: 24]==8'h2B) || (DCSin[ 31: 24]==8'h2D)) &&
                                (sizeIn==3'b110);
always @(*)
    casex(dotPosSel)    //dot has to appear in one of the 21 right-most character positions to be considered
        21'b1xxxxxxxxxxxxxxxxxxxx : dotPosition = 21;   
        21'b01xxxxxxxxxxxxxxxxxxx : dotPosition = 20;   
        21'b001xxxxxxxxxxxxxxxxxx : dotPosition = 19;   
        21'b0001xxxxxxxxxxxxxxxxx : dotPosition = 18;   
        21'b00001xxxxxxxxxxxxxxxx : dotPosition = 17;   
        21'b000001xxxxxxxxxxxxxxx : dotPosition = 16;   
        21'b0000001xxxxxxxxxxxxxx : dotPosition = 15;   
        21'b00000001xxxxxxxxxxxxx : dotPosition = 14;   
        21'b000000001xxxxxxxxxxxx : dotPosition = 13;   
        21'b0000000001xxxxxxxxxxx : dotPosition = 12;   
        21'b00000000001xxxxxxxxxx : dotPosition = 11;   
        21'b000000000001xxxxxxxxx : dotPosition = 10;   
        21'b0000000000001xxxxxxxx : dotPosition = 9;    
        21'b00000000000001xxxxxxx : dotPosition = 8;    
        21'b000000000000001xxxxxx : dotPosition = 7;    
        21'b0000000000000001xxxxx : dotPosition = 6;    
        21'b00000000000000001xxxx : dotPosition = 5;    
        21'b000000000000000001xxx : dotPosition = 4;    
        21'b0000000000000000001xx : dotPosition = 3;    
        21'b00000000000000000001x : dotPosition = 2;    
        21'b000000000000000000001 : dotPosition = 1;    //far right position
                       default    : dotPosition = 0;    //if no dot present, then it's all integer and the fract part needs to be filled with 0s
    endcase

wire [167:0] integerPart;
wire [159:0] fractPart;
wire [7:0] dotBucket;  
assign {integerPart, dotBucket, fractPart} = DCSinNoSign << ((21 - dotPosition) * 8);

reg [375:0] DCSout;
always @(*)
    if (standardInput) DCSout = DCSin;
    else DCSout = { (signIsNeg ? 8'h2D : 8'h2B), (integerPart | {21{8'h30}}), (fractPart | {20{8'h30}}), 8'h65, 8'h2D, 8'h30, 8'h32, 8'h30 };
endmodule
