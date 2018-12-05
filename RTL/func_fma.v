// func_fma.v
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

module func_fma (
    RESET,
    CLK,
    round_mode,
    Away,
    A_inexact,
    B_inexact,
    A_invalid,
    B_invalid,
    A_underflow,
    B_underflow,
    A_overflow,
    B_overflow,
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
    rddataB
    );

input RESET, CLK, wren, rdenA, rdenB;
input restore;
input Away;
input A_inexact;
input B_inexact;
input A_invalid;
input B_invalid;
input A_underflow;
input B_underflow;
input A_overflow;
input B_overflow;
input [5:0] wraddrs, rdaddrsA, rdaddrsB;   
input [76:0] wrdataA;     
input [76:0] wrdataB;

input [1:0] round_mode;

output [81:0] rddataA, rddataB;

parameter sig_NaN      = 3'b000;  // singnaling NaN is an operand--if possible, an incoming sNaN should have the first 3 bits of payload equal to this code
parameter mult_oob     = 3'b001;  // multiply operands out of bounds, multiplication(0, INF) or multiplication(?INF, 0)
parameter fsd_mult_oob = 3'b010;  // fused multiply operands out of bounds
parameter add_oob      = 3'b011;  // add or subract or fusedmultadd operands out of bounds
parameter div_oob      = 3'b100;  // division operands out of bounds, division(0, 0) or division(?INF, INF) 
parameter rem_oob      = 3'b101;  // remainder operands out of bounds, remainder(x, y), when y is zero or x is infinite (and neither is NaN)
parameter sqrt_oob     = 3'b110;  // square-root or log operand out of bounds, operand is less than zero
parameter quantize     = 3'b111;  

// exception codes for five MSBs [68:64] of final result
parameter _no_excpt_   = 5'b00000;  
parameter _inexact_    = 5'b00001;
parameter _underflow_  = 5'b00010;                     
parameter _overflow_   = 5'b00100;  
parameter _invalid_    = 5'b01000;  
parameter _div_x_0_    = 5'b10000;  


//FloPoCo exception codes
parameter zero = 2'b00;
parameter infinity = 2'b10;
parameter NaN = 2'b11;
parameter normal = 2'b01;


reg [5:0] wraddrs_del_1,
          wraddrs_del_2,                                   
          wraddrs_del_3,
          wraddrs_del_4,
          wraddrs_del_5,
          wraddrs_del_6,
          wraddrs_del_7;
          
reg wren_del_1,  
    wren_del_2, 
    wren_del_3, 
    wren_del_4,
    wren_del_5,
    wren_del_6,
    wren_del_7;

reg A_inexact_del_1,  
    A_inexact_del_2, 
    A_inexact_del_3, 
    A_inexact_del_4,
    A_inexact_del_5,
    A_inexact_del_6;

reg A_underflow_del_1,  
    A_underflow_del_2, 
    A_underflow_del_3, 
    A_underflow_del_4,
    A_underflow_del_5,
    A_underflow_del_6;

reg A_overflow_del_1,  
    A_overflow_del_2, 
    A_overflow_del_3, 
    A_overflow_del_4,
    A_overflow_del_5,
    A_overflow_del_6;

reg B_inexact_del_1,  
    B_inexact_del_2, 
    B_inexact_del_3, 
    B_inexact_del_4,
    B_inexact_del_5,
    B_inexact_del_6;

reg B_underflow_del_1,  
    B_underflow_del_2, 
    B_underflow_del_3, 
    B_underflow_del_4,
    B_underflow_del_5,
    B_underflow_del_6;

reg B_overflow_del_1,  
    B_overflow_del_2, 
    B_overflow_del_3, 
    B_overflow_del_4,
    B_overflow_del_5,
    B_overflow_del_6;

reg A_invalid_del_1,  
    A_invalid_del_2, 
    A_invalid_del_3, 
    A_invalid_del_4,
    A_invalid_del_5,
    A_invalid_del_6;

reg B_invalid_del_1,  
    B_invalid_del_2, 
    B_invalid_del_3, 
    B_invalid_del_4,
    B_invalid_del_5,
    B_invalid_del_6;

reg Away_del_1,  
    Away_del_2, 
    Away_del_3, 
    Away_del_4,
    Away_del_5,
    Away_del_6;
    
reg A_sign_del_1,  
    A_sign_del_2, 
    A_sign_del_3, 
    A_sign_del_4,
    A_sign_del_5,
    A_sign_del_6;

reg B_sign_del_1,  
    B_sign_del_2, 
    B_sign_del_3, 
    B_sign_del_4,
    B_sign_del_5,
    B_sign_del_6;

reg C_sign_del_1,
    C_sign_del_2, 
    C_sign_del_3, 
    C_sign_del_4,
    C_sign_del_5,
    C_sign_del_6;
    
reg [1:0] round_mode_del_1,  
          round_mode_del_2, 
          round_mode_del_3, 
          round_mode_del_4,
          round_mode_del_5,
          round_mode_del_6;

reg A_is_zero_del_1,  
    A_is_zero_del_2, 
    A_is_zero_del_3, 
    A_is_zero_del_4,
    A_is_zero_del_5,
    A_is_zero_del_6;

reg B_is_zero_del_1,  
    B_is_zero_del_2, 
    B_is_zero_del_3, 
    B_is_zero_del_4,
    B_is_zero_del_5,
    B_is_zero_del_6;

reg A_is_infinite_del_1,  
    A_is_infinite_del_2, 
    A_is_infinite_del_3, 
    A_is_infinite_del_4,
    A_is_infinite_del_5,
    A_is_infinite_del_6;
    
reg B_is_infinite_del_1,  
    B_is_infinite_del_2, 
    B_is_infinite_del_3, 
    B_is_infinite_del_4,
    B_is_infinite_del_5,
    B_is_infinite_del_6;
    
reg Rmult_infinity_del_2,
    Rmult_infinity_del_3,
    Rmult_infinity_del_4,
    Rmult_infinity_del_5,
    Rmult_infinity_del_6;

reg mul_inexact_del_2,
    mul_inexact_del_3,
    mul_inexact_del_4,
    mul_inexact_del_5,
    mul_inexact_del_6;

    
reg [76:0] Rmultq;      //{2-bit FloPoCo exception, sign, 12-bit exponent, 62-bit fraction}
reg [76:0] Radd_del_6;  //{2-bit FloPoCo exception, sign, 12-bit exponent, 62-bit fraction}
reg [76:0] Radd_del_7;  //{2-bit FloPoCo exception, sign, 12-bit exponent, 62-bit fraction}

reg [80:0] C_reg [31:0];  //32 accumulators  are 81 bits wide:  {invalid, overflow, underflow, inexact, 2-bit FloPoCo exception, sign, 12-bit exponent, 62-bit fraction}
reg [80:0] rddataCA;
reg [80:0] rddataCB;

reg [76:0] C;
reg [76:0] C_del_2;
         

wire [68:0] rddataAq, rddataBq;  //5-bit exception code included
wire [81:0] rddataA, rddataB;  //fat data bus to accomodate fat accumulator/C_reg including FloPoCo 2-bit exception and SYMPL 5-bit exception codes
assign rddataA = rdaddrsA[5] ? {1'b0, rddataCA} : {14'b0, rddataAq};    //the 1'b0 is for tying off divX0 of SYMPL exception code
assign rddataA = rdaddrsB[5] ? {1'b0, rddataCB} : {14'b0, rddataBq};

wire [76:0] Rmult;
wire [76:0] Radd;
wire [68:0] R69;
wire mul_invalid;
wire add_invalid;
wire mul_inexact;

wire A_sign;
wire B_sign;
wire C_sign;

assign A_sign = wrdataA[74];
assign B_sign = wrdataB[74];
assign C_sign = C[74];


wire A_is_zero;
wire B_is_zero;

assign A_is_zero = wrdataA[76:75]==zero;
assign B_is_zero = wrdataB[76:75]==zero;

wire A_is_infinite;
wire B_is_infinite;

assign A_is_infinite = wrdataA[76:75]==infinity;
assign B_is_infinite = wrdataB[76:75]==infinity;              
                                                              
reg C_inexact_del_1,
    C_inexact_del_2,
    C_inexact_del_3,
    C_inexact_del_4,
    C_inexact_del_5,
    C_inexact_del_6;

reg C_underflow_del_1,
    C_underflow_del_2,
    C_underflow_del_3,
    C_underflow_del_4,
    C_underflow_del_5,
    C_underflow_del_6;

reg C_overflow_del_1,
    C_overflow_del_2,
    C_overflow_del_3,
    C_overflow_del_4,
    C_overflow_del_5,
    C_overflow_del_6;

reg C_invalid_del_1,
    C_invalid_del_2,
    C_invalid_del_3,
    C_invalid_del_4,
    C_invalid_del_5,
    C_invalid_del_6;

reg [51:0] NaN_del_1,
           NaN_del_2,
           NaN_del_3,
           NaN_del_4,
           NaN_del_5,
           NaN_del_6;
    

always @(posedge CLK) begin
    C_inexact_del_2 <= C_inexact_del_1;
    C_inexact_del_3 <= C_inexact_del_2;
    C_inexact_del_4 <= C_inexact_del_3;
    C_inexact_del_5 <= C_inexact_del_4;
    C_inexact_del_6 <= C_inexact_del_5;
end                                     
        
always @(posedge CLK) begin
    C_underflow_del_2 <= C_underflow_del_1;
    C_underflow_del_3 <= C_underflow_del_2;
    C_underflow_del_4 <= C_underflow_del_3;
    C_underflow_del_5 <= C_underflow_del_4;
    C_underflow_del_6 <= C_underflow_del_5;
end                                     

always @(posedge CLK) begin
    C_overflow_del_2 <= C_overflow_del_1;
    C_overflow_del_3 <= C_overflow_del_2;
    C_overflow_del_4 <= C_overflow_del_3;
    C_overflow_del_5 <= C_overflow_del_4;
    C_overflow_del_6 <= C_overflow_del_5;
end                                     

always @(posedge CLK) begin
    C_invalid_del_2 <= C_invalid_del_1;
    C_invalid_del_3 <= C_invalid_del_2;
    C_invalid_del_4 <= C_invalid_del_3;
    C_invalid_del_5 <= C_invalid_del_4;
    C_invalid_del_6 <= C_invalid_del_5;
end                                     

always @(posedge CLK) begin
    C_sign_del_2 <= C_sign;
    C_sign_del_3 <= C_sign_del_2;
    C_sign_del_4 <= C_sign_del_3;
    C_sign_del_5 <= C_sign_del_4;
    C_sign_del_6 <= C_sign_del_5;
end                                     
                                                                   
wire A_is_NaN;
wire B_is_NaN;
wire C_is_NaN;

assign A_is_NaN = wren && ~wraddrs[5] && &wrdataA[73:62] && |wrdataA[50:0];
assign B_is_NaN = wren && ~wraddrs[5] && &wrdataB[73:62] && |wrdataB[50:0];
assign C_is_NaN = wren && ~wraddrs[5] && &C_reg[wraddrs[4:0]][73:62] && |C_reg[wraddrs[4:0]][60:10];

always @(posedge CLK) begin
    NaN_del_1 <= A_is_NaN ? wrdataA[60:10] : (B_is_NaN ? wrdataB[60:10] : (C_is_NaN ? C_reg[wraddrs[4:0]][60:10] : 51'b0));
    NaN_del_2 <= NaN_del_1;
    NaN_del_3 <= NaN_del_2;
    NaN_del_4 <= NaN_del_3;
    NaN_del_5 <= NaN_del_4;
    NaN_del_6 <= NaN_del_5;
end                                     

assign mul_inexact = |Rmult[9:0];

assign mul_invalid = (A_is_zero_del_6 && B_is_infinite_del_6) || 
                     (B_is_zero_del_6 && A_is_infinite_del_6);

assign add_invalid = Rmult_infinity_del_6 && B_is_infinite_del_6 && ((A_sign_del_6 ^ B_sign_del_6) ^ C_sign_del_6) && wren_del_6 && ~wraddrs_del_6[5];    

always @(posedge CLK) 
   if (wraddrs[5] && (wren || restore)) C_reg[wraddrs[4:0]] <= {A_invalid, A_overflow, A_underflow, A_inexact, wrdataA};  //initialization write to C_reg
   else if (wren_del_7 && ~wraddrs_del_7[5]) C_reg[wraddrs_del_7][76:0] <= Radd_del_7;   //once invalid, overflow, underflow, inexact are set, they stay that way until C_reg is re-initialized

always @(posedge CLK) begin
    if (RESET) begin 
        C <= 0;
        C_invalid_del_1   <= 0;
        C_inexact_del_1   <= 0;
        C_underflow_del_1 <= 0;
        C_overflow_del_1  <= 0;
    end    
    else if (~wraddrs[5] && wren) {C_invalid_del_1, C_overflow_del_1, C_underflow_del_1, C_inexact_del_1, C} <= C_reg[wraddrs[4:0]];
end  

always @(posedge CLK) 
    if (RESET) rddataCA <= 0; 
    else if (rdaddrsA[5] && rdenA) rddataCA <= C_reg[rdaddrsA[4:0]];

always @(posedge CLK) 
    if (RESET) rddataCB <= 0; 
    else if (rdaddrsB[5] && rdenB) rddataCB <= C_reg[rdaddrsB[4:0]];


// this operator pipe is 1 clocks deep FP Mul 12 62         wren 1 to write result of this operator
FPMul1262 fatMUL(
    .clk (CLK ), 
    .rst (RESET ),
    .X   (wrdataA[76:0]),
    .Y   (wrdataB[76:0]),  
    .R   (Rmult ),      
    .roundit (1'b0)    
    );

always @(posedge CLK) begin                                // wren 2 to write result of this register
    if (RESET) begin
        Rmultq  <= 0;
        C_del_2 <= 0;
    end    
    else begin
        Rmultq  <= Rmult;
        C_del_2 <= C;
    end                                         
end
        
// this operator pipe is 3 clocks deep FP Add 12 62        //wren 5 to write result of this operator 
FPAdd1262 fatADD(
    .clk (CLK    ), 
    .rst (RESET  ),
    .X   (Rmultq ),
    .Y   (C_del_2),  
    .R   (Radd   ),    
    .addToRoundBit (1'b0)    
    );

always @(posedge CLK) begin                                // wren 6 to write result of this register 
    if (RESET) begin
        Radd_del_6 <= 0;
        Radd_del_7 <= 0;
    end    
    else begin
        Radd_del_6 <= Radd;
        Radd_del_7 <= Radd_del_6;
    end                                         
end        

FP1262_To_IEEE754_1152_filtered FP1262toIEEE1152(            //wren 7 to write result of this operator
    .CLK               (CLK              ),
    .RESET             (RESET            ),
    .wren              (wren_del_6 && ~wraddrs_del_6[5]),      
    .round_mode        (round_mode_del_6 ),     
    .Away              (Away_del_6       ),
    .trunk_invalid     (mul_invalid || add_invalid),
    .NaN_in            (NaN_del_6        ),        
    .invalid_code      (mul_invalid ? fsd_mult_oob : add_oob),        
    .operator_overflow (A_overflow_del_6 || B_overflow_del_6 || C_overflow_del_6),  
    .operator_underflow(A_underflow_del_6 || B_underflow_del_6 || C_underflow_del_6),    
    .div_by_0          (1'b0             ),      
    .A_invalid         (A_invalid_del_6 || C_invalid_del_6),      
    .B_invalid         (B_invalid_del_6  ),      
    .A_inexact         (A_inexact_del_6 || mul_inexact_del_6 || C_inexact_del_6),      
    .B_inexact         (B_inexact_del_6  ),      
    .X                 (Radd_del_6[76:10]),      
    .Rq                (R69              ),      
    .G_in              (Radd_del_6[9]    ),      
    .R_in              (Radd_del_6[8]    ),      
    .S_in              (|Radd_del_6[7:0] )         
    );                       
 
RAM_func #(.ADDRS_WIDTH(5), .DATA_WIDTH(69))
    ram64_mulclk(
    .CLK        (CLK     ),
    .wren       ((wren_del_7 || restore) && ~wraddrs_del_7[5]),
    .wraddrs    (wraddrs_del_7[4:0] ),   
    .wrdata     (restore ? wrdataA : R69), 
    .rdenA      (rdenA && ~rdaddrsA[5]),   
    .rdaddrsA   (rdaddrsA[4:0]),
    .rddataA    (rddataAq),
    .rdenB      (rdenB && ~rdaddrsB[5]),
    .rdaddrsB   (rdaddrsB[4:0]),
    .rddataB    (rddataBq));


always @(posedge CLK) begin
    if (RESET) begin
        wren_del_1 <= 0;
        wren_del_2 <= 0;
        wren_del_3 <= 0;
        wren_del_4 <= 0;
        wren_del_5 <= 0;
        wren_del_6 <= 0;
        wren_del_7 <= 0;
    end
    else begin
        wren_del_1 <= wren;
        wren_del_2 <= wren_del_1;                                                 
        wren_del_3 <= wren_del_2;                                                 
        wren_del_4 <= wren_del_3;                                                 
        wren_del_5 <= wren_del_4;                                                 
        wren_del_6 <= wren_del_5;                                                 
        wren_del_7 <= wren_del_6;                                                 
    end
end   

always @(posedge CLK) begin
    if (RESET) begin
        A_inexact_del_1 <= 0;
        A_inexact_del_2 <= 0;
        A_inexact_del_3 <= 0;
        A_inexact_del_4 <= 0;
        A_inexact_del_5 <= 0;
        A_inexact_del_6 <= 0;
    end
    else begin
        A_inexact_del_1 <= A_inexact && wren && ~wraddrs[5];
        A_inexact_del_2 <= A_inexact_del_1;                                                 
        A_inexact_del_3 <= A_inexact_del_2;                                                 
        A_inexact_del_4 <= A_inexact_del_3;                                                 
        A_inexact_del_5 <= A_inexact_del_4;                                                 
        A_inexact_del_6 <= A_inexact_del_5;                                                 
    end
end 

always @(posedge CLK) begin
    if (RESET) begin
        A_underflow_del_1 <= 0;
        A_underflow_del_2 <= 0;
        A_underflow_del_3 <= 0;
        A_underflow_del_4 <= 0;
        A_underflow_del_5 <= 0;
        A_underflow_del_6 <= 0;
    end
    else begin
        A_underflow_del_1 <= A_underflow && wren && ~wraddrs[5];
        A_underflow_del_2 <= A_underflow_del_1;                                                 
        A_underflow_del_3 <= A_underflow_del_2;                                                 
        A_underflow_del_4 <= A_underflow_del_3;                                                 
        A_underflow_del_5 <= A_underflow_del_4;                                                 
        A_underflow_del_6 <= A_underflow_del_5;                                                 
    end
end   

always @(posedge CLK) begin
    if (RESET) begin
        A_overflow_del_1 <= 0;
        A_overflow_del_2 <= 0;
        A_overflow_del_3 <= 0;
        A_overflow_del_4 <= 0;
        A_overflow_del_5 <= 0;
        A_overflow_del_6 <= 0;
    end
    else begin
        A_overflow_del_1 <= A_overflow && wren && ~wraddrs[5];
        A_overflow_del_2 <= A_overflow_del_1;                                                 
        A_overflow_del_3 <= A_overflow_del_2;                                                 
        A_overflow_del_4 <= A_overflow_del_3;                                                 
        A_overflow_del_5 <= A_overflow_del_4;                                                 
        A_overflow_del_6 <= A_overflow_del_5;                                                 
    end
end   
  

always @(posedge CLK) begin
    if (RESET) begin
        A_invalid_del_1 <= 0;
        A_invalid_del_2 <= 0;
        A_invalid_del_3 <= 0;
        A_invalid_del_4 <= 0;
        A_invalid_del_5 <= 0;
        A_invalid_del_6 <= 0;
    end
    else begin
        A_invalid_del_1 <= A_invalid && wren && ~wraddrs[5];
        A_invalid_del_2 <= A_invalid_del_1;                                                 
        A_invalid_del_3 <= A_invalid_del_2;                                                 
        A_invalid_del_4 <= A_invalid_del_3;                                                 
        A_invalid_del_5 <= A_invalid_del_4;                                                 
        A_invalid_del_6 <= A_invalid_del_5;                                                 
    end
end   

always @(posedge CLK) begin
    if (RESET) begin
        B_inexact_del_1 <= 0;
        B_inexact_del_2 <= 0;
        B_inexact_del_3 <= 0;
        B_inexact_del_4 <= 0;
        B_inexact_del_5 <= 0;
        B_inexact_del_6 <= 0;
    end
    else begin
        B_inexact_del_1 <= B_inexact && wren && ~wraddrs[5];
        B_inexact_del_2 <= B_inexact_del_1;                                                 
        B_inexact_del_3 <= B_inexact_del_2;                                                 
        B_inexact_del_4 <= B_inexact_del_3;                                                 
        B_inexact_del_5 <= B_inexact_del_4;                                                 
        B_inexact_del_6 <= B_inexact_del_5;                                                 
    end
end   

always @(posedge CLK) begin
    if (RESET) begin
        B_invalid_del_1 <= 0;
        B_invalid_del_2 <= 0;
        B_invalid_del_3 <= 0;
        B_invalid_del_4 <= 0;
        B_invalid_del_5 <= 0;
        B_invalid_del_6 <= 0;
    end
    else begin
        B_invalid_del_1 <= B_invalid && wren && ~wraddrs[5];
        B_invalid_del_2 <= B_invalid_del_1;                                                 
        B_invalid_del_3 <= B_invalid_del_2;                                                 
        B_invalid_del_4 <= B_invalid_del_3;                                                 
        B_invalid_del_5 <= B_invalid_del_4;                                                 
        B_invalid_del_6 <= B_invalid_del_5;                                                 
    end
end   

always @(posedge CLK) begin
    if (RESET) begin
        B_sign_del_1 <= 0;
        B_sign_del_2 <= 0;
        B_sign_del_3 <= 0;
        B_sign_del_4 <= 0;
        B_sign_del_5 <= 0;
        B_sign_del_6 <= 0;
    end
    else begin
        B_sign_del_1 <= B_sign;
        B_sign_del_2 <= B_sign_del_1;                                                 
        B_sign_del_3 <= B_sign_del_2;                                                 
        B_sign_del_4 <= B_sign_del_3;                                                 
        B_sign_del_5 <= B_sign_del_4;                                                 
        B_sign_del_6 <= B_sign_del_5;                                                 
    end
end   

always @(posedge CLK) begin
    if (RESET) begin
        B_sign_del_1 <= 0;
        B_sign_del_2 <= 0;
        B_sign_del_3 <= 0;
        B_sign_del_4 <= 0;
        B_sign_del_5 <= 0;
        B_sign_del_6 <= 0;
    end
    else begin
        B_sign_del_1 <= B_sign;
        B_sign_del_2 <= B_sign_del_1;                                                 
        B_sign_del_3 <= B_sign_del_2;                                                 
        B_sign_del_4 <= B_sign_del_3;                                                 
        B_sign_del_5 <= B_sign_del_4;                                                 
        B_sign_del_6 <= B_sign_del_5;                                                 
    end
end   

always @(posedge CLK) begin
    if (RESET) begin
        C_sign_del_1 <= 0;
        C_sign_del_2 <= 0;
        C_sign_del_3 <= 0;
        C_sign_del_4 <= 0;
        C_sign_del_5 <= 0;
        C_sign_del_6 <= 0;
    end
    else begin
        C_sign_del_1 <= C_sign;
        C_sign_del_2 <= C_sign_del_1;                                                 
        C_sign_del_3 <= C_sign_del_2;                                                 
        C_sign_del_4 <= C_sign_del_3;                                                 
        C_sign_del_5 <= C_sign_del_4;                                                 
        C_sign_del_6 <= C_sign_del_5;                                                 
    end
end   

always @(posedge CLK) begin
    if (RESET) begin
        A_is_zero_del_1 <= 0;
        A_is_zero_del_2 <= 0;
        A_is_zero_del_3 <= 0;
        A_is_zero_del_4 <= 0;
        A_is_zero_del_5 <= 0;
        A_is_zero_del_6 <= 0;
    end
    else begin
        A_is_zero_del_1 <= A_is_zero;
        A_is_zero_del_2 <= A_is_zero_del_1;                                                 
        A_is_zero_del_3 <= A_is_zero_del_2;                                                 
        A_is_zero_del_4 <= A_is_zero_del_3;                                                 
        A_is_zero_del_5 <= A_is_zero_del_4;                                                 
        A_is_zero_del_6 <= A_is_zero_del_5;                                                 
    end
end   

always @(posedge CLK) begin
    if (RESET) begin
        B_is_zero_del_1 <= 0;
        B_is_zero_del_2 <= 0;
        B_is_zero_del_3 <= 0;
        B_is_zero_del_4 <= 0;
        B_is_zero_del_5 <= 0;
        B_is_zero_del_6 <= 0;
    end
    else begin
        B_is_zero_del_1 <= B_is_zero;
        B_is_zero_del_2 <= B_is_zero_del_1;                                                 
        B_is_zero_del_3 <= B_is_zero_del_2;                                                 
        B_is_zero_del_4 <= B_is_zero_del_3;                                                 
        B_is_zero_del_5 <= B_is_zero_del_4;                                                 
        B_is_zero_del_6 <= B_is_zero_del_5;                                                 
    end
end   

always @(posedge CLK) begin
    if (RESET) begin
        A_is_infinite_del_1 <= 0;
        A_is_infinite_del_2 <= 0;
        A_is_infinite_del_3 <= 0;
        A_is_infinite_del_4 <= 0;
        A_is_infinite_del_5 <= 0;
        A_is_infinite_del_6 <= 0;
    end
    else begin
        A_is_infinite_del_1 <= A_is_infinite;
        A_is_infinite_del_2 <= A_is_infinite_del_1;                                                 
        A_is_infinite_del_3 <= A_is_infinite_del_2;                                                 
        A_is_infinite_del_4 <= A_is_infinite_del_3;                                                 
        A_is_infinite_del_5 <= A_is_infinite_del_4;                                                 
        A_is_infinite_del_6 <= A_is_infinite_del_5;                                                 
    end
end   

always @(posedge CLK) begin
    if (RESET) begin
        B_is_infinite_del_1 <= 0;
        B_is_infinite_del_2 <= 0;
        B_is_infinite_del_3 <= 0;
        B_is_infinite_del_4 <= 0;
        B_is_infinite_del_5 <= 0;
        B_is_infinite_del_6 <= 0;
    end
    else begin
        B_is_infinite_del_1 <= B_is_infinite;
        B_is_infinite_del_2 <= B_is_infinite_del_1;                                                 
        B_is_infinite_del_3 <= B_is_infinite_del_2;                                                 
        B_is_infinite_del_4 <= B_is_infinite_del_3;                                                 
        B_is_infinite_del_5 <= B_is_infinite_del_4;                                                 
        B_is_infinite_del_6 <= B_is_infinite_del_5;                                                 
    end
end   

always @(posedge CLK) begin
    if (RESET) begin
        round_mode_del_1 <= 0;
        round_mode_del_2 <= 0;
        round_mode_del_3 <= 0;
        round_mode_del_4 <= 0;
        round_mode_del_5 <= 0;
        round_mode_del_6 <= 0;
    end
    else begin
        round_mode_del_1 <= round_mode;
        round_mode_del_2 <= round_mode_del_1;                                                 
        round_mode_del_3 <= round_mode_del_2;                                                 
        round_mode_del_4 <= round_mode_del_3;                                                 
        round_mode_del_5 <= round_mode_del_4;                                                 
        round_mode_del_6 <= round_mode_del_5;                                                 
    end
end 

always @(posedge CLK) begin
    if (RESET) begin
        Away_del_1 <= 0;
        Away_del_2 <= 0;
        Away_del_3 <= 0;
        Away_del_4 <= 0;
        Away_del_5 <= 0;
        Away_del_6 <= 0;
    end
    else begin
        Away_del_1 <= Away;
        Away_del_2 <= Away_del_1;                                                 
        Away_del_3 <= Away_del_2;                                                 
        Away_del_4 <= Away_del_3;                                                 
        Away_del_5 <= Away_del_4;                                                 
        Away_del_6 <= Away_del_5;                                                 
    end
end   
  

always @(posedge CLK) begin
    if (RESET) begin
        Rmult_infinity_del_2 <= 1'b0;
        Rmult_infinity_del_3 <= 1'b0;
        Rmult_infinity_del_4 <= 1'b0;
        Rmult_infinity_del_5 <= 1'b0;
        Rmult_infinity_del_6 <= 1'b0;
    end    
    else begin
        Rmult_infinity_del_2 <= (Rmult[76:75]==infinity);
        Rmult_infinity_del_3 <= Rmult_infinity_del_2;
        Rmult_infinity_del_4 <= Rmult_infinity_del_3;
        Rmult_infinity_del_5 <= Rmult_infinity_del_4;
        Rmult_infinity_del_6 <= Rmult_infinity_del_5;
    end                                         
end        

always @(posedge CLK) begin
    if (RESET) begin
        mul_inexact_del_2 <= 0;
        mul_inexact_del_3 <= 0;
        mul_inexact_del_4 <= 0;
        mul_inexact_del_5 <= 0;
        mul_inexact_del_6 <= 0;
    end    
    else begin
        mul_inexact_del_2 <= mul_inexact;
        mul_inexact_del_3 <= mul_inexact_del_2;
        mul_inexact_del_4 <= mul_inexact_del_3;
        mul_inexact_del_5 <= mul_inexact_del_4;
        mul_inexact_del_6 <= mul_inexact_del_5;
    end                                        
end

always @(posedge CLK) begin
    wraddrs_del_1 <= wraddrs;
    wraddrs_del_2 <= wraddrs_del_1;
    wraddrs_del_3 <= wraddrs_del_2;
    wraddrs_del_4 <= wraddrs_del_3;
    wraddrs_del_5 <= wraddrs_del_4;
    wraddrs_del_6 <= wraddrs_del_5;
    wraddrs_del_7 <= wraddrs_del_6;
end     
  

endmodule
