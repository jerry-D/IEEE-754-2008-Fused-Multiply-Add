//UnivFMA.v
// 
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

module UnivFMA (
    RESET,
    CLK,
    textA,    //1 = decCharSeq, 0 = binary16, binary32, or binary64 operandA
    textB,    //1 = decCharSeq, 0 = binary16, binary32, or binary64 operandB
    sizeA,
    sizeB,
    round_mode,
    Away,
    restore,
    wren,
    wraddrs,
    wrdataA,
    wrdataB,
    rdenA,
    rdaddrsA,
    rddataA,
    rdenB,
    rdaddrsB,
    rddataB,
    ready
    );

input RESET, CLK, textA, textB, wren, rdenA, rdenB;
input Away;
input restore;
input [2:0] sizeA, sizeB;
input [5:0] wraddrs, rdaddrsA, rdaddrsB;   
input [375:0] wrdataA;   //376 bits for standard 47-character input
//input [239:0] wrdataA;     //240 bits for 30-character input
input [375:0] wrdataB;   //376 bits for standard 47-character input
//input [111:0] wrdataB;    // (14 characters only) temporary reduction of inputs on this bus so design will place/route on second-smallest Kintex Ultra device as such device only has 520 i/o buffers

input [1:0] round_mode;

output [68:0] rddataA, rddataB;
output ready;

reg [63:0] semaphor;  // one for each memory location
reg readyA, readyB;

reg wren_del_0 ,  
    wren_del_1 , 
    wren_del_2 , 
    wren_del_3 , 
    wren_del_4 , 
    wren_del_5 , 
    wren_del_6 , 
    wren_del_7 , 
    wren_del_8 , 
    wren_del_9 , 
    wren_del_10, 
    wren_del_11, 
    wren_del_12, 
    wren_del_13, 
    wren_del_14, 
    wren_del_15, 
    wren_del_16, 
    wren_del_17, 
    wren_del_18, 
    wren_del_19,
    wren_del_20, 
    wren_del_21, 
    wren_del_22, 
    wren_del_23, 
    wren_del_24, 
    wren_del_25, 
    wren_del_26, 
    wren_del_27, 
    wren_del_28, 
    wren_del_29, 
    wren_del_30; 
    
reg [5:0] wraddrs_del_0,    
          wraddrs_del_1 , 
          wraddrs_del_2 , 
          wraddrs_del_3 , 
          wraddrs_del_4 , 
          wraddrs_del_5 , 
          wraddrs_del_6 , 
          wraddrs_del_7 , 
          wraddrs_del_8 , 
          wraddrs_del_9 , 
          wraddrs_del_10, 
          wraddrs_del_11, 
          wraddrs_del_12, 
          wraddrs_del_13, 
          wraddrs_del_14, 
          wraddrs_del_15, 
          wraddrs_del_16, 
          wraddrs_del_17, 
          wraddrs_del_18, 
          wraddrs_del_19,
          wraddrs_del_20, 
          wraddrs_del_21, 
          wraddrs_del_22, 
          wraddrs_del_23, 
          wraddrs_del_24, 
          wraddrs_del_25, 
          wraddrs_del_26, 
          wraddrs_del_27, 
          wraddrs_del_28, 
          wraddrs_del_29, 
          wraddrs_del_30; 

reg [1:0] round_mode_del_0,    
          round_mode_del_1 , 
          round_mode_del_2 , 
          round_mode_del_3 , 
          round_mode_del_4 , 
          round_mode_del_5 , 
          round_mode_del_6 , 
          round_mode_del_7 , 
          round_mode_del_8 , 
          round_mode_del_9 , 
          round_mode_del_10, 
          round_mode_del_11, 
          round_mode_del_12, 
          round_mode_del_13, 
          round_mode_del_14, 
          round_mode_del_15, 
          round_mode_del_16, 
          round_mode_del_17, 
          round_mode_del_18, 
          round_mode_del_19,
          round_mode_del_20, 
          round_mode_del_21, 
          round_mode_del_22,
          round_mode_del_23;
          
reg Away_del_0,    
    Away_del_1 , 
    Away_del_2 , 
    Away_del_3 , 
    Away_del_4 , 
    Away_del_5 , 
    Away_del_6 , 
    Away_del_7 , 
    Away_del_8 , 
    Away_del_9 , 
    Away_del_10, 
    Away_del_11, 
    Away_del_12, 
    Away_del_13, 
    Away_del_14, 
    Away_del_15, 
    Away_del_16, 
    Away_del_17, 
    Away_del_18, 
    Away_del_19,
    Away_del_20, 
    Away_del_21, 
    Away_del_22, 
    Away_del_23; 
 
reg textA_del_0,    
    textA_del_1 , 
    textA_del_2 , 
    textA_del_3 , 
    textA_del_4 , 
    textA_del_5 , 
    textA_del_6 , 
    textA_del_7 , 
    textA_del_8 , 
    textA_del_9 , 
    textA_del_10, 
    textA_del_11, 
    textA_del_12, 
    textA_del_13, 
    textA_del_14, 
    textA_del_15, 
    textA_del_16, 
    textA_del_17, 
    textA_del_18, 
    textA_del_19,
    textA_del_20, 
    textA_del_21, 
    textA_del_22, 
    textA_del_23;
    
reg textB_del_0,    
    textB_del_1 , 
    textB_del_2 , 
    textB_del_3 , 
    textB_del_4 , 
    textB_del_5 , 
    textB_del_6 , 
    textB_del_7 , 
    textB_del_8 , 
    textB_del_9 , 
    textB_del_10, 
    textB_del_11, 
    textB_del_12, 
    textB_del_13, 
    textB_del_14, 
    textB_del_15, 
    textB_del_16, 
    textB_del_17, 
    textB_del_18, 
    textB_del_19,
    textB_del_20, 
    textB_del_21, 
    textB_del_22, 
    textB_del_23; 
           
reg [63:0] wrdataAconv_del_0,    
           wrdataAconv_del_1 , 
           wrdataAconv_del_2 , 
           wrdataAconv_del_3 , 
           wrdataAconv_del_4 , 
           wrdataAconv_del_5 , 
           wrdataAconv_del_6 , 
           wrdataAconv_del_7 , 
           wrdataAconv_del_8 , 
           wrdataAconv_del_9 , 
           wrdataAconv_del_10, 
           wrdataAconv_del_11, 
           wrdataAconv_del_12, 
           wrdataAconv_del_13, 
           wrdataAconv_del_14, 
           wrdataAconv_del_15, 
           wrdataAconv_del_16, 
           wrdataAconv_del_17, 
           wrdataAconv_del_18, 
           wrdataAconv_del_19,
           wrdataAconv_del_20, 
           wrdataAconv_del_21, 
           wrdataAconv_del_22, 
           wrdataAconv_del_23; 

reg [63:0] wrdataBconv_del_0,    
           wrdataBconv_del_1 , 
           wrdataBconv_del_2 , 
           wrdataBconv_del_3 , 
           wrdataBconv_del_4 , 
           wrdataBconv_del_5 , 
           wrdataBconv_del_6 , 
           wrdataBconv_del_7 , 
           wrdataBconv_del_8 , 
           wrdataBconv_del_9 , 
           wrdataBconv_del_10, 
           wrdataBconv_del_11, 
           wrdataBconv_del_12, 
           wrdataBconv_del_13, 
           wrdataBconv_del_14, 
           wrdataBconv_del_15, 
           wrdataBconv_del_16, 
           wrdataBconv_del_17, 
           wrdataBconv_del_18, 
           wrdataBconv_del_19,
           wrdataBconv_del_20, 
           wrdataBconv_del_21, 
           wrdataBconv_del_22, 
           wrdataBconv_del_23; 


wire ready;

wire [63:0] rddataA, rddataB; 

assign ready = readyA && readyB;


wire [63:0] wrdataAconv;      //used for both operandA and operandC binary writes
Univ_IEEE754_To_binary64 binConvA(
    .wren    (wren && ~sizeA[2] && ~textA),
    .X       (wrdataA[63:0]),
    .R       (wrdataAconv  ),    //pipe this for 24 clocks
    .Src_Size(sizeA[1:0]   )     
    );

wire [63:0] wrdataBconv;      //used for operandB binary writes
Univ_IEEE754_To_binary64 binConvB(
    .wren    (wren && ~sizeB[2] && ~textB),
    .X       (wrdataB[63:0]),
    .R       (wrdataBconv  ),     //pipe this for 24 clocks
    .Src_Size(sizeB[1:0]   )     
    );

wire [375:0] DCSoutA;
univDCSformatr DCSformatrA(
//    .RESET  (RESET  ),
//    .CLK    (CLK    ),
    .sizeIn (sizeA  ),     //110==default 47-char sequence, anything else is 30-char sequence with no exponent
    .DCSin  (wrdataA[375:0]),
//    .DCSin  ({136'b0, wrdataA[239:0]}),
    .DCSout (DCSoutA)
    );              

wire [375:0] DCSoutB;
univDCSformatr DCSformatrB(
//    .RESET  (RESET  ),
//    .CLK    (CLK    ),
    .sizeIn (sizeB  ),
    .DCSin  (wrdataB[375:0]),
//    .DCSin  ({264'b0, wrdataB[111:0]}),
    .DCSout (DCSoutB)
    );              

wire [71:0] binOutA;     //two-bit exception needs to be changed to decoded 5 bits for bit-test
decCharToBinH20 decCharToBin_A(  //used for both operandA and operandC text writes
    .RESET     (RESET     ),
    .CLK       (CLK       ),
    .round_mode(round_mode),
    .Away      (Away      ),
    .wren      (wren && textA),
    .wrdata    (DCSoutA   ),
    .binOut    (binOutA   )
    );              

wire [71:0] binOutB;
decCharToBinH20 decCharToBin_B(  //used for operandB text writes
    .RESET     (RESET     ),
    .CLK       (CLK       ),
    .round_mode(round_mode),
    .Away      (Away      ),
    .wren      (wren && textB),
    .wrdata    (DCSoutB   ),   
    .binOut    (binOutB   )   //might want to register this internally
    );

wire [76:0] wrdataFP1262A;    //1 clock deep
wire A_inexact;
wire A_underflow;
wire A_overflow;
wire A_invalid;
binary64toFP1262 bin64bin75_A( //binout input is unrounded and includes GRS bits concat to it
    .CLK  (CLK    ),
    .RESET(RESET  ),
    .X    (textA_del_22 ? binOutA : {5'b0, wrdataAconv_del_22, 3'b000}),
    .R    (wrdataFP1262A ),
    .invalid  (A_invalid  ),
    .underflow(A_underflow),
    .overflow (A_overflow ),
    .inexact  (A_inexact  )
    );       

wire [76:0] wrdataFP1262B;     //1 clock deep
wire B_inexact;
wire B_underflow;
wire B_overflow;
wire B_invalid;
binary64toFP1262 bin64bin75_B( //binout input is unrounded and includes GRS bits concat to it
    .CLK  (CLK    ),
    .RESET(RESET  ),
    .X    (textB_del_22 ? binOutB : {5'b0, wrdataBconv_del_22, 3'b000}),
    .R    (wrdataFP1262B  ),
    .invalid  (B_invalid  ),
    .underflow(B_underflow),
    .overflow (B_overflow ),
    .inexact  (B_inexact  )
    );       

func_fma fmaDCS (
    .RESET      (RESET        ),
    .CLK        (CLK          ),
    .round_mode (round_mode_del_23),
    .Away       (Away_del_23  ),
    .A_inexact  (restore ? wrdataA[77] : A_inexact  ),
    .B_inexact  (B_inexact    ),
    .A_underflow(restore ? wrdataA[78] : A_underflow),
    .B_underflow(B_underflow  ),
    .A_overflow (restore ? wrdataA[79] : A_overflow ),
    .B_overflow (B_overflow   ),
    .A_invalid  (restore ? wrdataA[80] : A_invalid  ),
    .B_invalid  (B_invalid    ),
    .restore    (restore      ),
    .wren       (~restore && wren_del_23),
    .wraddrs    (restore ? wraddrs : wraddrs_del_23),
    .wrdataA    (restore ? wrdataA[76:0] : wrdataFP1262A),   
    .wrdataB    (restore ? wrdataB[76:0] : wrdataFP1262B),   
    .rdenA      (rdenA        ),
    .rdaddrsA   (rdaddrsA     ),
    .rddataA    (rddataA      ),   
    .rdenB      (rdenB        ),
    .rdaddrsB   (rdaddrsB     ),   
    .rddataB    (rddataB      )
    );                    

always @(posedge CLK) begin
    if (RESET) begin
        wren_del_0  <= 0;
        wren_del_1  <= 0;
        wren_del_2  <= 0;
        wren_del_3  <= 0;
        wren_del_4  <= 0;
        wren_del_5  <= 0;
        wren_del_6  <= 0;
        wren_del_7  <= 0;
        wren_del_8  <= 0;
        wren_del_9  <= 0;
        wren_del_10 <= 0;
        wren_del_11 <= 0;
        wren_del_12 <= 0;
        wren_del_13 <= 0;
        wren_del_14 <= 0;
        wren_del_15 <= 0;
        wren_del_16 <= 0;
        wren_del_17 <= 0;
        wren_del_18 <= 0;
        wren_del_19 <= 0;
        wren_del_20 <= 0;
        wren_del_21 <= 0;
        wren_del_22 <= 0;
        wren_del_23 <= 0;
        wren_del_24 <= 0;
        wren_del_25 <= 0;
        wren_del_26 <= 0;
        wren_del_27 <= 0;
        wren_del_28 <= 0;
        wren_del_29 <= 0;
        wren_del_30 <= 0;
    end          
    else begin
        wren_del_0  <= wren;
        wren_del_1  <= wren_del_0 ;
        wren_del_2  <= wren_del_1 ;
        wren_del_3  <= wren_del_2 ;
        wren_del_4  <= wren_del_3 ;
        wren_del_5  <= wren_del_4 ;
        wren_del_6  <= wren_del_5 ;
        wren_del_7  <= wren_del_6 ;
        wren_del_8  <= wren_del_7 ;
        wren_del_9  <= wren_del_8 ;
        wren_del_10 <= wren_del_9 ;
        wren_del_11 <= wren_del_10;
        wren_del_12 <= wren_del_11;
        wren_del_13 <= wren_del_12;
        wren_del_14 <= wren_del_13;
        wren_del_15 <= wren_del_14;
        wren_del_16 <= wren_del_15;
        wren_del_17 <= wren_del_16;
        wren_del_18 <= wren_del_17;
        wren_del_19 <= wren_del_18;
        wren_del_20 <= wren_del_19;
        wren_del_21 <= wren_del_20;
        wren_del_22 <= wren_del_21;
        wren_del_23 <= wren_del_22;
        wren_del_24 <= wren_del_23;
        wren_del_25 <= wren_del_24;
        wren_del_26 <= wren_del_25;
        wren_del_27 <= wren_del_26;
        wren_del_28 <= wren_del_27;
        wren_del_29 <= wren_del_28;
        wren_del_30 <= wren_del_29;
    end                    
end

always @(posedge CLK) begin
    if (RESET) begin
        wraddrs_del_0  <= 0;
        wraddrs_del_1  <= 0;
        wraddrs_del_2  <= 0;
        wraddrs_del_3  <= 0;
        wraddrs_del_4  <= 0;
        wraddrs_del_5  <= 0;
        wraddrs_del_6  <= 0;
        wraddrs_del_7  <= 0;
        wraddrs_del_8  <= 0;
        wraddrs_del_9  <= 0;
        wraddrs_del_10 <= 0;
        wraddrs_del_11 <= 0;
        wraddrs_del_12 <= 0;
        wraddrs_del_13 <= 0;
        wraddrs_del_14 <= 0;
        wraddrs_del_15 <= 0;
        wraddrs_del_16 <= 0;
        wraddrs_del_17 <= 0;
        wraddrs_del_18 <= 0;
        wraddrs_del_19 <= 0;
        wraddrs_del_20 <= 0;
        wraddrs_del_21 <= 0;
        wraddrs_del_22 <= 0;
        wraddrs_del_23 <= 0;
        wraddrs_del_24 <= 0;
        wraddrs_del_25 <= 0;
        wraddrs_del_26 <= 0;
        wraddrs_del_27 <= 0;
        wraddrs_del_28 <= 0;
        wraddrs_del_29 <= 0;
        wraddrs_del_30 <= 0;
    end    
    else begin
        wraddrs_del_0  <= wraddrs;
        wraddrs_del_1  <= wraddrs_del_0 ;
        wraddrs_del_2  <= wraddrs_del_1 ;
        wraddrs_del_3  <= wraddrs_del_2 ;
        wraddrs_del_4  <= wraddrs_del_3 ;
        wraddrs_del_5  <= wraddrs_del_4 ;
        wraddrs_del_6  <= wraddrs_del_5 ;
        wraddrs_del_7  <= wraddrs_del_6 ;
        wraddrs_del_8  <= wraddrs_del_7 ;
        wraddrs_del_9  <= wraddrs_del_8 ;              
        wraddrs_del_10 <= wraddrs_del_9 ;
        wraddrs_del_11 <= wraddrs_del_10;
        wraddrs_del_12 <= wraddrs_del_11;
        wraddrs_del_13 <= wraddrs_del_12;
        wraddrs_del_14 <= wraddrs_del_13;
        wraddrs_del_15 <= wraddrs_del_14;
        wraddrs_del_16 <= wraddrs_del_15;
        wraddrs_del_17 <= wraddrs_del_16;
        wraddrs_del_18 <= wraddrs_del_17;
        wraddrs_del_19 <= wraddrs_del_18;
        wraddrs_del_20 <= wraddrs_del_19;
        wraddrs_del_21 <= wraddrs_del_20;
        wraddrs_del_22 <= wraddrs_del_21;
        wraddrs_del_23 <= wraddrs_del_22;
        wraddrs_del_24 <= wraddrs_del_23;
        wraddrs_del_25 <= wraddrs_del_24;
        wraddrs_del_26 <= wraddrs_del_25;
        wraddrs_del_27 <= wraddrs_del_26;
        wraddrs_del_28 <= wraddrs_del_27;
        wraddrs_del_29 <= wraddrs_del_28;
        wraddrs_del_30 <= wraddrs_del_29;
    end                               
end

always @(posedge CLK) begin
    if (RESET) begin
        round_mode_del_0  <= 0;
        round_mode_del_1  <= 0;
        round_mode_del_2  <= 0;
        round_mode_del_3  <= 0;
        round_mode_del_4  <= 0;
        round_mode_del_5  <= 0;
        round_mode_del_6  <= 0;
        round_mode_del_7  <= 0;
        round_mode_del_8  <= 0;
        round_mode_del_9  <= 0;
        round_mode_del_10 <= 0;
        round_mode_del_11 <= 0;
        round_mode_del_12 <= 0;
        round_mode_del_13 <= 0;
        round_mode_del_14 <= 0;
        round_mode_del_15 <= 0;
        round_mode_del_16 <= 0;
        round_mode_del_17 <= 0;
        round_mode_del_18 <= 0;
        round_mode_del_19 <= 0;
        round_mode_del_20 <= 0;
        round_mode_del_21 <= 0;
        round_mode_del_22 <= 0;
        round_mode_del_23 <= 0;
    end          
    else begin
        round_mode_del_0  <= round_mode;
        round_mode_del_1  <= round_mode_del_0 ;
        round_mode_del_2  <= round_mode_del_1 ;
        round_mode_del_3  <= round_mode_del_2 ;
        round_mode_del_4  <= round_mode_del_3 ;
        round_mode_del_5  <= round_mode_del_4 ;
        round_mode_del_6  <= round_mode_del_5 ;
        round_mode_del_7  <= round_mode_del_6 ;
        round_mode_del_8  <= round_mode_del_7 ;
        round_mode_del_9  <= round_mode_del_8 ;
        round_mode_del_10 <= round_mode_del_9 ;
        round_mode_del_11 <= round_mode_del_10;
        round_mode_del_12 <= round_mode_del_11;
        round_mode_del_13 <= round_mode_del_12;
        round_mode_del_14 <= round_mode_del_13;
        round_mode_del_15 <= round_mode_del_14;
        round_mode_del_16 <= round_mode_del_15;
        round_mode_del_17 <= round_mode_del_16;
        round_mode_del_18 <= round_mode_del_17;
        round_mode_del_19 <= round_mode_del_18;
        round_mode_del_20 <= round_mode_del_19;
        round_mode_del_21 <= round_mode_del_20;
        round_mode_del_22 <= round_mode_del_21;
        round_mode_del_23 <= round_mode_del_22;
    end                    
end

always @(posedge CLK) begin
    if (RESET) begin
        Away_del_0  <= 0;
        Away_del_1  <= 0;
        Away_del_2  <= 0;
        Away_del_3  <= 0;
        Away_del_4  <= 0;
        Away_del_5  <= 0;
        Away_del_6  <= 0;
        Away_del_7  <= 0;
        Away_del_8  <= 0;
        Away_del_9  <= 0;
        Away_del_10 <= 0;
        Away_del_11 <= 0;
        Away_del_12 <= 0;
        Away_del_13 <= 0;
        Away_del_14 <= 0;
        Away_del_15 <= 0;
        Away_del_16 <= 0;
        Away_del_17 <= 0;
        Away_del_18 <= 0;
        Away_del_19 <= 0;
        Away_del_20 <= 0;
        Away_del_21 <= 0;
        Away_del_22 <= 0;
        Away_del_23 <= 0;
    end          
    else begin
        Away_del_0  <= Away;
        Away_del_1  <= Away_del_0 ;
        Away_del_2  <= Away_del_1 ;
        Away_del_3  <= Away_del_2 ;
        Away_del_4  <= Away_del_3 ;
        Away_del_5  <= Away_del_4 ;
        Away_del_6  <= Away_del_5 ;
        Away_del_7  <= Away_del_6 ;
        Away_del_8  <= Away_del_7 ;
        Away_del_9  <= Away_del_8 ;
        Away_del_10 <= Away_del_9 ;
        Away_del_11 <= Away_del_10;
        Away_del_12 <= Away_del_11;
        Away_del_13 <= Away_del_12;
        Away_del_14 <= Away_del_13;
        Away_del_15 <= Away_del_14;
        Away_del_16 <= Away_del_15;
        Away_del_17 <= Away_del_16;
        Away_del_18 <= Away_del_17;
        Away_del_19 <= Away_del_18;
        Away_del_20 <= Away_del_19;
        Away_del_21 <= Away_del_20;
        Away_del_22 <= Away_del_21;
        Away_del_23 <= Away_del_22;
    end                    
end

always @(posedge CLK) begin
    if (RESET) begin
        textA_del_0  <= 0;
        textA_del_1  <= 0;
        textA_del_2  <= 0;
        textA_del_3  <= 0;
        textA_del_4  <= 0;
        textA_del_5  <= 0;
        textA_del_6  <= 0;
        textA_del_7  <= 0;
        textA_del_8  <= 0;
        textA_del_9  <= 0;
        textA_del_10 <= 0;
        textA_del_11 <= 0;
        textA_del_12 <= 0;
        textA_del_13 <= 0;
        textA_del_14 <= 0;
        textA_del_15 <= 0;
        textA_del_16 <= 0;
        textA_del_17 <= 0;
        textA_del_18 <= 0;
        textA_del_19 <= 0;
        textA_del_20 <= 0;
        textA_del_21 <= 0;
        textA_del_22 <= 0;
        textA_del_23 <= 0;
    end          
    else begin
        textA_del_0  <= textA;
        textA_del_1  <= textA_del_0 ;
        textA_del_2  <= textA_del_1 ;
        textA_del_3  <= textA_del_2 ;
        textA_del_4  <= textA_del_3 ;
        textA_del_5  <= textA_del_4 ;
        textA_del_6  <= textA_del_5 ;
        textA_del_7  <= textA_del_6 ;
        textA_del_8  <= textA_del_7 ;
        textA_del_9  <= textA_del_8 ;
        textA_del_10 <= textA_del_9 ;
        textA_del_11 <= textA_del_10;
        textA_del_12 <= textA_del_11;
        textA_del_13 <= textA_del_12;
        textA_del_14 <= textA_del_13;
        textA_del_15 <= textA_del_14;
        textA_del_16 <= textA_del_15;
        textA_del_17 <= textA_del_16;
        textA_del_18 <= textA_del_17;
        textA_del_19 <= textA_del_18;
        textA_del_20 <= textA_del_19;
        textA_del_21 <= textA_del_20;
        textA_del_22 <= textA_del_21;
        textA_del_23 <= textA_del_22;
    end                    
end

always @(posedge CLK) begin
    if (RESET) begin
        textB_del_0  <= 0;
        textB_del_1  <= 0;
        textB_del_2  <= 0;
        textB_del_3  <= 0;
        textB_del_4  <= 0;
        textB_del_5  <= 0;
        textB_del_6  <= 0;
        textB_del_7  <= 0;
        textB_del_8  <= 0;
        textB_del_9  <= 0;
        textB_del_10 <= 0;
        textB_del_11 <= 0;
        textB_del_12 <= 0;
        textB_del_13 <= 0;
        textB_del_14 <= 0;
        textB_del_15 <= 0;
        textB_del_16 <= 0;
        textB_del_17 <= 0;
        textB_del_18 <= 0;
        textB_del_19 <= 0;
        textB_del_20 <= 0;
        textB_del_21 <= 0;
        textB_del_22 <= 0;
        textB_del_23 <= 0;
    end          
    else begin
        textB_del_0  <= textB;
        textB_del_1  <= textB_del_0 ;
        textB_del_2  <= textB_del_1 ;
        textB_del_3  <= textB_del_2 ;
        textB_del_4  <= textB_del_3 ;
        textB_del_5  <= textB_del_4 ;
        textB_del_6  <= textB_del_5 ;
        textB_del_7  <= textB_del_6 ;
        textB_del_8  <= textB_del_7 ;
        textB_del_9  <= textB_del_8 ;
        textB_del_10 <= textB_del_9 ;
        textB_del_11 <= textB_del_10;
        textB_del_12 <= textB_del_11;
        textB_del_13 <= textB_del_12;
        textB_del_14 <= textB_del_13;
        textB_del_15 <= textB_del_14;
        textB_del_16 <= textB_del_15;
        textB_del_17 <= textB_del_16;
        textB_del_18 <= textB_del_17;
        textB_del_19 <= textB_del_18;
        textB_del_20 <= textB_del_19;
        textB_del_21 <= textB_del_20;
        textB_del_22 <= textB_del_21;
        textB_del_23 <= textB_del_22;
    end                    
end


always @(posedge CLK) begin
        wrdataAconv_del_0  <= wrdataAconv;
        wrdataAconv_del_1  <= wrdataAconv_del_0 ;
        wrdataAconv_del_2  <= wrdataAconv_del_1 ;
        wrdataAconv_del_3  <= wrdataAconv_del_2 ;
        wrdataAconv_del_4  <= wrdataAconv_del_3 ;
        wrdataAconv_del_5  <= wrdataAconv_del_4 ;
        wrdataAconv_del_6  <= wrdataAconv_del_5 ;
        wrdataAconv_del_7  <= wrdataAconv_del_6 ;
        wrdataAconv_del_8  <= wrdataAconv_del_7 ;
        wrdataAconv_del_9  <= wrdataAconv_del_8 ;              
        wrdataAconv_del_10 <= wrdataAconv_del_9 ;
        wrdataAconv_del_11 <= wrdataAconv_del_10;
        wrdataAconv_del_12 <= wrdataAconv_del_11;
        wrdataAconv_del_13 <= wrdataAconv_del_12;
        wrdataAconv_del_14 <= wrdataAconv_del_13;
        wrdataAconv_del_15 <= wrdataAconv_del_14;
        wrdataAconv_del_16 <= wrdataAconv_del_15;
        wrdataAconv_del_17 <= wrdataAconv_del_16;
        wrdataAconv_del_18 <= wrdataAconv_del_17;
        wrdataAconv_del_19 <= wrdataAconv_del_18;
        wrdataAconv_del_20 <= wrdataAconv_del_19;
        wrdataAconv_del_21 <= wrdataAconv_del_20;
        wrdataAconv_del_22 <= wrdataAconv_del_21;
        wrdataAconv_del_23 <= wrdataAconv_del_22;
end                    
           
always @(posedge CLK) begin
        wrdataBconv_del_0  <= wrdataBconv;
        wrdataBconv_del_1  <= wrdataBconv_del_0 ;
        wrdataBconv_del_2  <= wrdataBconv_del_1 ;
        wrdataBconv_del_3  <= wrdataBconv_del_2 ;
        wrdataBconv_del_4  <= wrdataBconv_del_3 ;
        wrdataBconv_del_5  <= wrdataBconv_del_4 ;
        wrdataBconv_del_6  <= wrdataBconv_del_5 ;
        wrdataBconv_del_7  <= wrdataBconv_del_6 ;
        wrdataBconv_del_8  <= wrdataBconv_del_7 ;
        wrdataBconv_del_9  <= wrdataBconv_del_8 ;              
        wrdataBconv_del_10 <= wrdataBconv_del_9 ;
        wrdataBconv_del_11 <= wrdataBconv_del_10;
        wrdataBconv_del_12 <= wrdataBconv_del_11;
        wrdataBconv_del_13 <= wrdataBconv_del_12;
        wrdataBconv_del_14 <= wrdataBconv_del_13;
        wrdataBconv_del_15 <= wrdataBconv_del_14;
        wrdataBconv_del_16 <= wrdataBconv_del_15;
        wrdataBconv_del_17 <= wrdataBconv_del_16;
        wrdataBconv_del_18 <= wrdataBconv_del_17;
        wrdataBconv_del_19 <= wrdataBconv_del_18;
        wrdataBconv_del_20 <= wrdataBconv_del_19;
        wrdataBconv_del_21 <= wrdataBconv_del_20;
        wrdataBconv_del_22 <= wrdataBconv_del_21;
        wrdataBconv_del_23 <= wrdataBconv_del_22;
end                    

always @(posedge CLK or posedge RESET) begin
    if (RESET) semaphor <= 64'hFFFFFFFFFFFFFFFF;
    else begin
        if (wren) semaphor[wraddrs] <= 1'b0;
        if (wren_del_30) semaphor[wraddrs_del_30] <= 1'b1;
    end
end     

always @(posedge CLK or posedge RESET) begin
    if (RESET) begin
        readyA <= 1'b1;
        readyB <= 1'b1;
    end  
    else begin
         readyA <= rdenA ? semaphor[rdaddrsA] : 1'b1;
         readyB <= rdenB ? semaphor[rdaddrsB] : 1'b1;
    end   
end

endmodule
