// cnvFHC.v
 `timescale 1ns/100ps
 
// Author:  Jerry D. Harthcock
// Version:  1.03  June 17, 2018
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
 
 

module cnvFHC(
    charIn,
    nybleOut
    );
    
input [7:0]charIn;
output [3:0] nybleOut;

parameter _0_ = 7'h30;
parameter _1_ = 7'h31;
parameter _2_ = 7'h32;
parameter _3_ = 7'h33;
parameter _4_ = 7'h34;
parameter _5_ = 7'h35;
parameter _6_ = 7'h36;
parameter _7_ = 7'h37;
parameter _8_ = 7'h38;
parameter _9_ = 7'h39;
parameter _A_ = 7'b1x0_0001;
parameter _B_ = 7'b1x0_0010;
parameter _C_ = 7'b1x0_0011;
parameter _D_ = 7'b1x0_0100;
parameter _E_ = 7'b1x0_0101;
parameter _F_ = 7'b1x0_0110;

reg [3:0] nybleOut;
wire [6:0] charIn7;
assign charIn7[6:0] = charIn[6:0]; 

always @(*)
    casex(charIn7)
        _0_ : nybleOut = 4'h0;    
        _1_ : nybleOut = 4'h1;    
        _2_ : nybleOut = 4'h2;    
        _3_ : nybleOut = 4'h3;    
        _4_ : nybleOut = 4'h4;    
        _5_ : nybleOut = 4'h5;    
        _6_ : nybleOut = 4'h6;    
        _7_ : nybleOut = 4'h7;    
        _8_ : nybleOut = 4'h8;    
        _9_ : nybleOut = 4'h9;    
        _A_ : nybleOut = 4'hA;    
        _B_ : nybleOut = 4'hB;    
        _C_ : nybleOut = 4'hC;    
        _D_ : nybleOut = 4'hD;    
        _E_ : nybleOut = 4'hE;
        _F_ : nybleOut = 4'hF;
    default : nybleOut = 4'h0;    
    endcase    

endmodule
