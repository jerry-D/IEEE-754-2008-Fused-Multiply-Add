//test_univFMA_tb.v
 `timescale 1ns/100ps
// Author:  Jerry D. Harthcock
// Version:  1.01  November 30, 2018
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

module test_univFMA_tb();


reg clk;
reg reset;
reg Away;
reg restore;
reg [1:0] round_mode;

reg wren;    
reg [5:0] wraddrs;    
reg textA;
reg [2:0] sizeA;      //in bytes
reg [375:0] wrdataA; 
reg textB; 
reg [2:0] sizeB;      //in bytes
reg [375:0] wrdataB;  

reg rdenA;    
reg [5:0] rdaddrsA;
reg rdenB;   
reg [5:0]rdaddrsB; 

wire [68:0] rddataA; 
wire [68:0] rddataB; 

wire ready;


// exception codes for five MSBs [68:64] of final result
parameter _no_excpt_   = 5'b00000;  
parameter _inexact_    = 5'b00001;
parameter _underflow_  = 5'b00010;                     
parameter _overflow_   = 5'b00100;  
parameter _invalid_    = 5'b01000;  
parameter _div_x_0_    = 5'b10000;  

                                                             
UnivFMA t(
    .RESET     (reset     ),
    .CLK       (clk       ),
    .textA     (textA     ),              //1 = decCharSeq(text), 0 = binary16, binary32, or binary64 operandA
    .textB     (textB     ),              //1 = decCharSeq(text), 0 = binary16, binary32, or binary64 operandB
    .sizeA     (sizeA     ),
    .sizeB     (sizeB     ),
    .round_mode(round_mode),
    .Away      (Away      ),
    .restore   (restore   ),
    .wren      (wren      ),
    .wraddrs   (wraddrs   ),
    .wrdataA   (wrdataA   ),
    .wrdataB   (wrdataB   ),
    .rdenA     (rdenA     ),
    .rdaddrsA  (rdaddrsA  ),
    .rddataA   (rddataA   ),
    .rdenB     (rdenB     ),
    .rdaddrsB  (rdaddrsB  ),
    .rddataB   (rddataB   ),
    .ready     (ready     )
    );

   initial begin
      clk = 0;
   end
   always #5 clk = !clk;

   initial begin
      reset      = 1'b1;
      clk        = 0;
      textA      = 0;
      textB      = 0;
      sizeA      = 0;
      sizeB      = 0;
      round_mode = 0;
      Away       = 0;
      restore    = 0;
      wren       = 0;
      wraddrs    = 0;
      wrdataA    = 0;
      wrdataB    = 0;
      rdenA      = 0;
      rdaddrsA   = 0;
      rdenB      = 0;
      rdaddrsB   = 0;
      
      @(posedge clk);
#1    reset = 1'b0;
      @(posedge clk);
// initialize all C register/accumulators      
#1    wren = 1'b1;
      wraddrs = 6'h20;   //first C register/accumulator location
      textA = 1'b0;
      sizeA = 3'b100;
      textB = 1'b0;
      sizeB = 3'b100;
      
      @(posedge clk);
#1    wraddrs = 6'h21;
      @(posedge clk);
#1    wraddrs = 6'h22;
      @(posedge clk);
#1    wraddrs = 6'h23;
      @(posedge clk);
#1    wraddrs = 6'h24;
      @(posedge clk);
#1    wraddrs = 6'h25;
      @(posedge clk);
#1    wraddrs = 6'h26;
      @(posedge clk);
#1    wraddrs = 6'h27;
      @(posedge clk);
#1    wraddrs = 6'h28;
      @(posedge clk);
#1    wraddrs = 6'h29;
      @(posedge clk);
#1    wraddrs = 6'h2A;
      @(posedge clk);
#1    wraddrs = 6'h2B;
      @(posedge clk);
#1    wraddrs = 6'h2C;
      @(posedge clk);
#1    wraddrs = 6'h2D;
      @(posedge clk);
#1    wraddrs = 6'h2E;
      @(posedge clk);
#1    wraddrs = 6'h2F;
      @(posedge clk);
#1    wraddrs = 6'h30;
      @(posedge clk);
#1    wraddrs = 6'h31;
      @(posedge clk);
#1    wraddrs = 6'h32;
      @(posedge clk);
#1    wraddrs = 6'h33;
      @(posedge clk);
#1    wraddrs = 6'h34;
      @(posedge clk);
#1    wraddrs = 6'h35;
      @(posedge clk);
#1    wraddrs = 6'h36;
      @(posedge clk);
#1    wraddrs = 6'h37;
      @(posedge clk);
#1    wraddrs = 6'h38;
      @(posedge clk);
#1    wraddrs = 6'h39;
      @(posedge clk);
#1    wraddrs = 6'h3A;
      @(posedge clk);
#1    wraddrs = 6'h3B;
      @(posedge clk);
#1    wraddrs = 6'h3C;
      @(posedge clk);
#1    wraddrs = 6'h3D;
      @(posedge clk);
#1    wraddrs = 6'h3E;
      @(posedge clk);
#1    wraddrs = 6'h3F;
      @(posedge clk);
// the above initialize all C register/accumulators sequence now complete      
      
#1    wraddrs = 6'h00;
      textA = 1'b1;
      sizeA = 3'b101;
      textB = 1'b1;
      sizeB = 3'b101;
      
#1    wraddrs = 6'h00;
      wrdataA = ".1";    
      wrdataB = "1";    
          
      @(posedge clk);
#1    wraddrs = 6'h01;
      wrdataA =  "5";    
      wrdataB =  ".1";    

      @(posedge clk);
#1    wraddrs = 6'h02;
      wrdataA =  "333";    
      wrdataB =  ".1";
          
      @(posedge clk);
#1    wraddrs = 6'h03;
      wrdataA =  "10000";    
      wrdataB =  ".25";
      
      @(posedge clk);
#1    wraddrs = 6'h04;
      wrdataA =  ".1";    
      wrdataB =  "1.";    
          
      @(posedge clk);
#1    wraddrs = 6'h05;
      wrdataA =  "5";    
      wrdataB =  ".1";    

      @(posedge clk);
#1    wraddrs = 6'h06;
      wrdataA =  "333";    
      wrdataB =  ".1";
          
      @(posedge clk);
#1    wraddrs = 6'h07;
      wrdataA =  "10000";    
      wrdataB =  ".25";
      
      @(posedge clk);
#1    wraddrs = 6'h08;
      wrdataA =  ".1";    
      wrdataB =  "1.";    
          
      @(posedge clk);
#1    wraddrs = 6'h09;
      wrdataA =  "5";    
      wrdataB =  ".1";    

      @(posedge clk);
#1    wraddrs = 6'h0A;
      wrdataA =  "333";    
      wrdataB =  ".1";
          
      @(posedge clk);
#1    wraddrs = 6'h0B;
      wrdataA =  "10000";    
      wrdataB =  ".25";
      
      @(posedge clk);
#1    wraddrs = 6'h0C;
      wrdataA =  ".1";    
      wrdataB =  "1.";    
          
      @(posedge clk);
#1    wraddrs = 6'h0D;
      wrdataA =  "5";    
      wrdataB =  ".1";    

      @(posedge clk);
#1    wraddrs = 6'h0E;
      wrdataA =  "333";    
      wrdataB =  ".1";
          
      @(posedge clk);
#1    wraddrs = 6'h0F;
      wrdataA =  "10000";    
      wrdataB =  ".25";
      
      @(posedge clk);
#1    wraddrs = 6'h10;
      wrdataA =  ".1";    
      wrdataB =  "1.";    
          
      @(posedge clk);
#1    wraddrs = 6'h11;
      wrdataA =  "5";    
      wrdataB =  ".1";    

      @(posedge clk);
#1    wraddrs = 6'h12;
      wrdataA =  "333";    
      wrdataB =  ".1";
          
      @(posedge clk);
#1    wraddrs = 6'h13;
      wrdataA =  "10000";    
      wrdataB =  ".25";
      
      @(posedge clk);
#1    wraddrs = 6'h14;
      wrdataA =  ".1";    
      wrdataB =  "1.";    
          
      @(posedge clk);
#1    wraddrs = 6'h15;
      wrdataA =  "5";    
      wrdataB =  ".1";    

      @(posedge clk);
#1    wraddrs = 6'h16;
      wrdataA =  "333";    
      wrdataB =  ".1";
          
      @(posedge clk);
#1    wraddrs = 6'h17;
      wrdataA =  "10000";    
      wrdataB =  ".25";
      
      @(posedge clk);
#1    wraddrs = 6'h18;
      wrdataA =  ".1";    
      wrdataB =  "1.";    
          
      @(posedge clk);
#1    wraddrs = 6'h19;
      wrdataA =  "5";    
      wrdataB =  ".1";    

      @(posedge clk);
#1    wraddrs = 6'h1A;
      wrdataA =  "333";    
      wrdataB =  ".1";
          
      @(posedge clk);
#1    wraddrs = 6'h1B;
      wrdataA =  "10000";    
      wrdataB =  ".25";
      
      @(posedge clk);
#1    wraddrs = 6'h1C;
      wrdataA =  ".1";    
      wrdataB =  "1.";    
          
      @(posedge clk);
#1    wraddrs = 6'h1D;
      wrdataA =  "5";    
      wrdataB =  ".1";    

      @(posedge clk);
#1    wraddrs = 6'h1E;
      wrdataA =  "333";    
      wrdataB =  ".1";
          
      @(posedge clk);
#1    wraddrs = 6'h1F;
      wrdataA =  "10000";    
      wrdataB =  ".25";

      @(posedge clk);
      
#1    wren = 0;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      
// second pass 
     
#1    wraddrs = 6'h00; 
      wren = 1;     
      wrdataA =  ".1";    
      wrdataB =  "1.";    
          
      @(posedge clk);
#1    wraddrs = 6'h01;
      wrdataA =  "5";    
      wrdataB =  ".1";    

      @(posedge clk);
#1    wraddrs = 6'h02;
      wrdataA =  "333";    
      wrdataB =  ".1";
          
      @(posedge clk);
#1    wraddrs = 6'h03;
      wrdataA =  "10000";    
      wrdataB =  ".25";
      
      @(posedge clk);
#1    wraddrs = 6'h04;
      wrdataA =  ".1";    
      wrdataB =  "1.";    
          
      @(posedge clk);
#1    wraddrs = 6'h05;
      wrdataA =  "5";    
      wrdataB =  ".1";    

      @(posedge clk);
#1    wraddrs = 6'h06;
      wrdataA =  "333";    
      wrdataB =  ".1";
          
      @(posedge clk);
#1    wraddrs = 6'h07;
      wrdataA =  "10000";    
      wrdataB =  ".25";
      
      @(posedge clk);
#1    wraddrs = 6'h08;
      wrdataA =  ".1";    
      wrdataB =  "1.";    
          
      @(posedge clk);
#1    wraddrs = 6'h09;
      wrdataA =  "5";    
      wrdataB =  ".1";    

      @(posedge clk);
#1    wraddrs = 6'h0A;
      wrdataA =  "333";    
      wrdataB =  ".1";
          
      @(posedge clk);
#1    wraddrs = 6'h0B;
      wrdataA =  "10000";    
      wrdataB =  ".25";
      
      @(posedge clk);
#1    wraddrs = 6'h0C;
      wrdataA =  ".1";    
      wrdataB =  "1.";    
          
      @(posedge clk);
#1    wraddrs = 6'h0D;
      wrdataA =  "5";    
      wrdataB =  ".1";    

      @(posedge clk);
#1    wraddrs = 6'h0E;
      wrdataA =  "333";    
      wrdataB =  ".1";
          
      @(posedge clk);
#1    wraddrs = 6'h0F;
      wrdataA =  "10000";    
      wrdataB =  ".25";
      
      @(posedge clk);
#1    wraddrs = 6'h10;
      wrdataA =  ".1";    
      wrdataB =  "1.";    
          
      @(posedge clk);
#1    wraddrs = 6'h11;
      wrdataA =  "5";    
      wrdataB =  ".1";    

      @(posedge clk);
#1    wraddrs = 6'h12;
      wrdataA =  "333";    
      wrdataB =  ".1";
          
      @(posedge clk);
#1    wraddrs = 6'h13;
      wrdataA =  "10000";    
      wrdataB =  ".25";
      
      @(posedge clk);
#1    wraddrs = 6'h14;
      wrdataA =  ".1";    
      wrdataB =  "1.";    
          
      @(posedge clk);
#1    wraddrs = 6'h15;
      wrdataA =  "5";    
      wrdataB =  ".1";    

      @(posedge clk);
#1    wraddrs = 6'h16;
      wrdataA =  "333";    
      wrdataB =  ".1";
          
      @(posedge clk);
#1    wraddrs = 6'h17;
      wrdataA =  "10000";    
      wrdataB =  ".25";
      
      @(posedge clk);
#1    wraddrs = 6'h18;
      wrdataA =  ".1";    
      wrdataB =  "1.";    
          
      @(posedge clk);
#1    wraddrs = 6'h19;
      wrdataA =  "5";    
      wrdataB =  ".1";    

      @(posedge clk);
#1    wraddrs = 6'h1A;
      wrdataA =  "333";    
      wrdataB =  ".1";
          
      @(posedge clk);
#1    wraddrs = 6'h1B;
      wrdataA =  "10000";    
      wrdataB =  ".25";
      
      @(posedge clk);
#1    wraddrs = 6'h1C;
      wrdataA =  ".1";    
      wrdataB =  "1.";    
          
      @(posedge clk);
#1    wraddrs = 6'h1D;
      wrdataA =  "5";    
      wrdataB =  ".1";    

      @(posedge clk);
#1    wraddrs = 6'h1E;
      wrdataA =  "333";    
      wrdataB =  ".1";
          
      @(posedge clk);
#1    wraddrs = 6'h1F;
      wrdataA =  "10000";    
      wrdataB =  ".25";

      @(posedge clk);

      
#1    wren = 0;
      
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
                   
      #1 reset = 1'b1;
       $finish;
   end




endmodule

        

