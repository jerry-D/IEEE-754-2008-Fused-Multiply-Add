--FPMul1262.vhdl
-- 
-- vagrant@vagrant-ubuntu-trusty-32:~/flopoco-3.0.beta5$ ./flopoco -name=FPMul1262 -frequency=120 -useHardMult=no FPMult 12 62 62
-- Updating entity name to: FPMul1262
-- 
-- Final report:
-- Entity SmallMultTableP3x3r6XuYu
--    Not pipelined
-- Entity Compressor_6_3
--    Not pipelined
-- Entity Compressor_14_3
--    Not pipelined
-- Entity Compressor_5_3
--    Not pipelined
-- Entity Compressor_4_3
--    Not pipelined
-- Entity Compressor_23_3
--    Not pipelined
-- Entity Compressor_13_3
--    Not pipelined
-- Entity Compressor_3_2
--    Not pipelined
-- |   |---Entity IntAdder_123_f120_uid662
-- |   |      Not pipelined
-- |---Entity IntMultiplier_UsingDSP_63_63_126_unsigned_uid4
-- |      Pipeline depth = 1
-- |---Entity IntAdder_76_f120_uid670
-- |      Not pipelined
-- Entity FPMul1262
--    Pipeline depth = 1
-- Output file: flopoco.vhdl
-- vagrant@vagrant-ubuntu-trusty-32:~/flopoco-3.0.beta5$ cat flopoco.vhdl
---------------------------------------------------------------------------------
--                          SmallMultTableP3x3r6XuYu
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved
-- Authors: Florent de Dinechin (2007-2012)
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
entity SmallMultTableP3x3r6XuYu is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(5 downto 0);
          Y : out  std_logic_vector(5 downto 0)   );
end entity;

architecture arch of SmallMultTableP3x3r6XuYu is
begin
  with X select  Y <=
   "000000" when "000000",
   "000000" when "000001",
   "000000" when "000010",
   "000000" when "000011",
   "000000" when "000100",
   "000000" when "000101",
   "000000" when "000110",
   "000000" when "000111",
   "000000" when "001000",
   "000001" when "001001",
   "000010" when "001010",
   "000011" when "001011",
   "000100" when "001100",
   "000101" when "001101",
   "000110" when "001110",
   "000111" when "001111",
   "000000" when "010000",
   "000010" when "010001",
   "000100" when "010010",
   "000110" when "010011",
   "001000" when "010100",
   "001010" when "010101",
   "001100" when "010110",
   "001110" when "010111",
   "000000" when "011000",
   "000011" when "011001",
   "000110" when "011010",
   "001001" when "011011",
   "001100" when "011100",
   "001111" when "011101",
   "010010" when "011110",
   "010101" when "011111",
   "000000" when "100000",
   "000100" when "100001",
   "001000" when "100010",
   "001100" when "100011",
   "010000" when "100100",
   "010100" when "100101",
   "011000" when "100110",
   "011100" when "100111",
   "000000" when "101000",
   "000101" when "101001",
   "001010" when "101010",
   "001111" when "101011",
   "010100" when "101100",
   "011001" when "101101",
   "011110" when "101110",
   "100011" when "101111",
   "000000" when "110000",
   "000110" when "110001",
   "001100" when "110010",
   "010010" when "110011",
   "011000" when "110100",
   "011110" when "110101",
   "100100" when "110110",
   "101010" when "110111",
   "000000" when "111000",
   "000111" when "111001",
   "001110" when "111010",
   "010101" when "111011",
   "011100" when "111100",
   "100011" when "111101",
   "101010" when "111110",
   "110001" when "111111",
   "------" when others;
end architecture;

--------------------------------------------------------------------------------
--                               Compressor_6_3
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved
-- Authors: Bogdan Popa, Illyes Kinga, 2012
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_6_3 is
   port ( X0 : in  std_logic_vector(5 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_6_3 is
signal X :  std_logic_vector(5 downto 0);
begin
   X <=X0 ;
   with X select R <=
      "000" when "000000",
      "001" when "000001",
      "001" when "000010",
      "010" when "000011",
      "001" when "000100",
      "010" when "000101",
      "010" when "000110",
      "011" when "000111",
      "001" when "001000",
      "010" when "001001",
      "010" when "001010",
      "011" when "001011",
      "010" when "001100",
      "011" when "001101",
      "011" when "001110",
      "100" when "001111",
      "001" when "010000",
      "010" when "010001",
      "010" when "010010",
      "011" when "010011",
      "010" when "010100",
      "011" when "010101",
      "011" when "010110",
      "100" when "010111",
      "010" when "011000",
      "011" when "011001",
      "011" when "011010",
      "100" when "011011",
      "011" when "011100",
      "100" when "011101",
      "100" when "011110",
      "101" when "011111",
      "001" when "100000",
      "010" when "100001",
      "010" when "100010",
      "011" when "100011",
      "010" when "100100",
      "011" when "100101",
      "011" when "100110",
      "100" when "100111",
      "010" when "101000",
      "011" when "101001",
      "011" when "101010",
      "100" when "101011",
      "011" when "101100",
      "100" when "101101",
      "100" when "101110",
      "101" when "101111",
      "010" when "110000",
      "011" when "110001",
      "011" when "110010",
      "100" when "110011",
      "011" when "110100",
      "100" when "110101",
      "100" when "110110",
      "101" when "110111",
      "011" when "111000",
      "100" when "111001",
      "100" when "111010",
      "101" when "111011",
      "100" when "111100",
      "101" when "111101",
      "101" when "111110",
      "110" when "111111",
      "---" when others;

end architecture;

--------------------------------------------------------------------------------
--                              Compressor_14_3
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved
-- Authors: Bogdan Popa, Illyes Kinga, 2012
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_14_3 is
   port ( X0 : in  std_logic_vector(3 downto 0);
          X1 : in  std_logic_vector(0 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_14_3 is
signal X :  std_logic_vector(4 downto 0);
begin
   X <=X1 & X0 ;
   with X select R <=
      "000" when "00000",
      "001" when "00001",
      "001" when "00010",
      "010" when "00011",
      "001" when "00100",
      "010" when "00101",
      "010" when "00110",
      "011" when "00111",
      "001" when "01000",
      "010" when "01001",
      "010" when "01010",
      "011" when "01011",
      "010" when "01100",
      "011" when "01101",
      "011" when "01110",
      "100" when "01111",
      "010" when "10000",
      "011" when "10001",
      "011" when "10010",
      "100" when "10011",
      "011" when "10100",
      "100" when "10101",
      "100" when "10110",
      "101" when "10111",
      "011" when "11000",
      "100" when "11001",
      "100" when "11010",
      "101" when "11011",
      "100" when "11100",
      "101" when "11101",
      "101" when "11110",
      "110" when "11111",
      "---" when others;

end architecture;

--------------------------------------------------------------------------------
--                               Compressor_5_3
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved
-- Authors: Bogdan Popa, Illyes Kinga, 2012
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_5_3 is
   port ( X0 : in  std_logic_vector(4 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_5_3 is
signal X :  std_logic_vector(4 downto 0);
begin
   X <=X0 ;
   with X select R <=
      "000" when "00000",
      "001" when "00001",
      "001" when "00010",
      "010" when "00011",
      "001" when "00100",
      "010" when "00101",
      "010" when "00110",
      "011" when "00111",
      "001" when "01000",
      "010" when "01001",
      "010" when "01010",
      "011" when "01011",
      "010" when "01100",
      "011" when "01101",
      "011" when "01110",
      "100" when "01111",
      "001" when "10000",
      "010" when "10001",
      "010" when "10010",
      "011" when "10011",
      "010" when "10100",
      "011" when "10101",
      "011" when "10110",
      "100" when "10111",
      "010" when "11000",
      "011" when "11001",
      "011" when "11010",
      "100" when "11011",
      "011" when "11100",
      "100" when "11101",
      "100" when "11110",
      "101" when "11111",
      "---" when others;

end architecture;

--------------------------------------------------------------------------------
--                               Compressor_4_3
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved
-- Authors: Bogdan Popa, Illyes Kinga, 2012
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_4_3 is
   port ( X0 : in  std_logic_vector(3 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_4_3 is
signal X :  std_logic_vector(3 downto 0);
begin
   X <=X0 ;
   with X select R <=
      "000" when "0000",
      "001" when "0001",
      "001" when "0010",
      "010" when "0011",
      "001" when "0100",
      "010" when "0101",
      "010" when "0110",
      "011" when "0111",
      "001" when "1000",
      "010" when "1001",
      "010" when "1010",
      "011" when "1011",
      "010" when "1100",
      "011" when "1101",
      "011" when "1110",
      "100" when "1111",
      "---" when others;

end architecture;

--------------------------------------------------------------------------------
--                              Compressor_23_3
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved
-- Authors: Bogdan Popa, Illyes Kinga, 2012
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_23_3 is
   port ( X0 : in  std_logic_vector(2 downto 0);
          X1 : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_23_3 is
signal X :  std_logic_vector(4 downto 0);
begin
   X <=X1 & X0 ;
   with X select R <=
      "000" when "00000",
      "001" when "00001",
      "001" when "00010",
      "010" when "00011",
      "001" when "00100",
      "010" when "00101",
      "010" when "00110",
      "011" when "00111",
      "010" when "01000",
      "011" when "01001",
      "011" when "01010",
      "100" when "01011",
      "011" when "01100",
      "100" when "01101",
      "100" when "01110",
      "101" when "01111",
      "010" when "10000",
      "011" when "10001",
      "011" when "10010",
      "100" when "10011",
      "011" when "10100",
      "100" when "10101",
      "100" when "10110",
      "101" when "10111",
      "100" when "11000",
      "101" when "11001",
      "101" when "11010",
      "110" when "11011",
      "101" when "11100",
      "110" when "11101",
      "110" when "11110",
      "111" when "11111",
      "---" when others;

end architecture;

--------------------------------------------------------------------------------
--                              Compressor_13_3
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved
-- Authors: Bogdan Popa, Illyes Kinga, 2012
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_13_3 is
   port ( X0 : in  std_logic_vector(2 downto 0);
          X1 : in  std_logic_vector(0 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_13_3 is
signal X :  std_logic_vector(3 downto 0);
begin
   X <=X1 & X0 ;
   with X select R <=
      "000" when "0000",
      "001" when "0001",
      "001" when "0010",
      "010" when "0011",
      "001" when "0100",
      "010" when "0101",
      "010" when "0110",
      "011" when "0111",
      "010" when "1000",
      "011" when "1001",
      "011" when "1010",
      "100" when "1011",
      "011" when "1100",
      "100" when "1101",
      "100" when "1110",
      "101" when "1111",
      "---" when others;

end architecture;

--------------------------------------------------------------------------------
--                               Compressor_3_2
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved
-- Authors: Bogdan Popa, Illyes Kinga, 2012
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_3_2 is
   port ( X0 : in  std_logic_vector(2 downto 0);
          R : out  std_logic_vector(1 downto 0)   );
end entity;

architecture arch of Compressor_3_2 is
signal X :  std_logic_vector(2 downto 0);
begin
   X <=X0 ;
   with X select R <=
      "00" when "000",
      "01" when "001",
      "01" when "010",
      "10" when "011",
      "01" when "100",
      "10" when "101",
      "10" when "110",
      "11" when "111",
      "--" when others;

end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_123_f120_uid662
--                   (IntAdderAlternative_123_f120_uid666)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_123_f120_uid662 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(122 downto 0);
          Y : in  std_logic_vector(122 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(122 downto 0)   );
end entity;

architecture arch of IntAdder_123_f120_uid662 is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Alternative
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--               IntMultiplier_UsingDSP_63_63_126_unsigned_uid4
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved
-- Authors: Florent de Dinechin, Kinga Illyes, Bogdan Popa, Bogdan Pasca, 2012
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity IntMultiplier_UsingDSP_63_63_126_unsigned_uid4 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(62 downto 0);
          Y : in  std_logic_vector(62 downto 0);
          R : out  std_logic_vector(125 downto 0)   );
end entity;

architecture arch of IntMultiplier_UsingDSP_63_63_126_unsigned_uid4 is
   component Compressor_13_3 is
      port ( X0 : in  std_logic_vector(2 downto 0);
             X1 : in  std_logic_vector(0 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_14_3 is
      port ( X0 : in  std_logic_vector(3 downto 0);
             X1 : in  std_logic_vector(0 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_23_3 is
      port ( X0 : in  std_logic_vector(2 downto 0);
             X1 : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_3_2 is
      port ( X0 : in  std_logic_vector(2 downto 0);
             R : out  std_logic_vector(1 downto 0)   );
   end component;

   component Compressor_4_3 is
      port ( X0 : in  std_logic_vector(3 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_5_3 is
      port ( X0 : in  std_logic_vector(4 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_6_3 is
      port ( X0 : in  std_logic_vector(5 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component IntAdder_123_f120_uid662 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(122 downto 0);
             Y : in  std_logic_vector(122 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(122 downto 0)   );
   end component;

   component SmallMultTableP3x3r6XuYu is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(5 downto 0);
             Y : out  std_logic_vector(5 downto 0)   );
   end component;

signal XX_m5 :  std_logic_vector(62 downto 0);
signal YY_m5 :  std_logic_vector(62 downto 0);
signal Xp_m5b7 :  std_logic_vector(14 downto 0);
signal Yp_m5b7 :  std_logic_vector(17 downto 0);
signal x_m5b7_0 :  std_logic_vector(2 downto 0);
signal x_m5b7_1 :  std_logic_vector(2 downto 0);
signal x_m5b7_2 :  std_logic_vector(2 downto 0);
signal x_m5b7_3 :  std_logic_vector(2 downto 0);
signal x_m5b7_4 :  std_logic_vector(2 downto 0);
signal y_m5b7_0 :  std_logic_vector(2 downto 0);
signal y_m5b7_1 :  std_logic_vector(2 downto 0);
signal y_m5b7_2 :  std_logic_vector(2 downto 0);
signal y_m5b7_3 :  std_logic_vector(2 downto 0);
signal y_m5b7_4 :  std_logic_vector(2 downto 0);
signal y_m5b7_5 :  std_logic_vector(2 downto 0);
signal Y0X0_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X0Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w46_0 :  std_logic;
signal heap_bh6_w47_0 :  std_logic;
signal heap_bh6_w48_0 :  std_logic;
signal heap_bh6_w49_0 :  std_logic;
signal heap_bh6_w50_0 :  std_logic;
signal Y0X1_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X1Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w49_1 :  std_logic;
signal heap_bh6_w50_1 :  std_logic;
signal heap_bh6_w51_0 :  std_logic;
signal heap_bh6_w52_0 :  std_logic;
signal heap_bh6_w53_0 :  std_logic;
signal Y0X2_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X2Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w52_1 :  std_logic;
signal heap_bh6_w53_1 :  std_logic;
signal heap_bh6_w54_0 :  std_logic;
signal heap_bh6_w55_0 :  std_logic;
signal heap_bh6_w56_0 :  std_logic;
signal Y0X3_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X3Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w55_1 :  std_logic;
signal heap_bh6_w56_1 :  std_logic;
signal heap_bh6_w57_0 :  std_logic;
signal heap_bh6_w58_0 :  std_logic;
signal heap_bh6_w59_0 :  std_logic;
signal Y0X4_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X4Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w58_1 :  std_logic;
signal heap_bh6_w59_1 :  std_logic;
signal heap_bh6_w60_0 :  std_logic;
signal heap_bh6_w61_0 :  std_logic;
signal heap_bh6_w62_0 :  std_logic;
signal Y1X0_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X0Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w48_1 :  std_logic;
signal heap_bh6_w49_2 :  std_logic;
signal heap_bh6_w50_2 :  std_logic;
signal heap_bh6_w51_1 :  std_logic;
signal heap_bh6_w52_2 :  std_logic;
signal heap_bh6_w53_2 :  std_logic;
signal Y1X1_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X1Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w51_2 :  std_logic;
signal heap_bh6_w52_3 :  std_logic;
signal heap_bh6_w53_3 :  std_logic;
signal heap_bh6_w54_1 :  std_logic;
signal heap_bh6_w55_2 :  std_logic;
signal heap_bh6_w56_2 :  std_logic;
signal Y1X2_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X2Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w54_2 :  std_logic;
signal heap_bh6_w55_3 :  std_logic;
signal heap_bh6_w56_3 :  std_logic;
signal heap_bh6_w57_1 :  std_logic;
signal heap_bh6_w58_2 :  std_logic;
signal heap_bh6_w59_2 :  std_logic;
signal Y1X3_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X3Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w57_2 :  std_logic;
signal heap_bh6_w58_3 :  std_logic;
signal heap_bh6_w59_3 :  std_logic;
signal heap_bh6_w60_1 :  std_logic;
signal heap_bh6_w61_1 :  std_logic;
signal heap_bh6_w62_1 :  std_logic;
signal Y1X4_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X4Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w60_2 :  std_logic;
signal heap_bh6_w61_2 :  std_logic;
signal heap_bh6_w62_2 :  std_logic;
signal heap_bh6_w63_0 :  std_logic;
signal heap_bh6_w64_0 :  std_logic;
signal heap_bh6_w65_0 :  std_logic;
signal Y2X0_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X0Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w51_3 :  std_logic;
signal heap_bh6_w52_4 :  std_logic;
signal heap_bh6_w53_4 :  std_logic;
signal heap_bh6_w54_3 :  std_logic;
signal heap_bh6_w55_4 :  std_logic;
signal heap_bh6_w56_4 :  std_logic;
signal Y2X1_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X1Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w54_4 :  std_logic;
signal heap_bh6_w55_5 :  std_logic;
signal heap_bh6_w56_5 :  std_logic;
signal heap_bh6_w57_3 :  std_logic;
signal heap_bh6_w58_4 :  std_logic;
signal heap_bh6_w59_4 :  std_logic;
signal Y2X2_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X2Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w57_4 :  std_logic;
signal heap_bh6_w58_5 :  std_logic;
signal heap_bh6_w59_5 :  std_logic;
signal heap_bh6_w60_3 :  std_logic;
signal heap_bh6_w61_3 :  std_logic;
signal heap_bh6_w62_3 :  std_logic;
signal Y2X3_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X3Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w60_4 :  std_logic;
signal heap_bh6_w61_4 :  std_logic;
signal heap_bh6_w62_4 :  std_logic;
signal heap_bh6_w63_1 :  std_logic;
signal heap_bh6_w64_1 :  std_logic;
signal heap_bh6_w65_1 :  std_logic;
signal Y2X4_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X4Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w63_2 :  std_logic;
signal heap_bh6_w64_2 :  std_logic;
signal heap_bh6_w65_2 :  std_logic;
signal heap_bh6_w66_0 :  std_logic;
signal heap_bh6_w67_0 :  std_logic;
signal heap_bh6_w68_0 :  std_logic;
signal Y3X0_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X0Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w54_5 :  std_logic;
signal heap_bh6_w55_6 :  std_logic;
signal heap_bh6_w56_6 :  std_logic;
signal heap_bh6_w57_5 :  std_logic;
signal heap_bh6_w58_6 :  std_logic;
signal heap_bh6_w59_6 :  std_logic;
signal Y3X1_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X1Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w57_6 :  std_logic;
signal heap_bh6_w58_7 :  std_logic;
signal heap_bh6_w59_7 :  std_logic;
signal heap_bh6_w60_5 :  std_logic;
signal heap_bh6_w61_5 :  std_logic;
signal heap_bh6_w62_5 :  std_logic;
signal Y3X2_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X2Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w60_6 :  std_logic;
signal heap_bh6_w61_6 :  std_logic;
signal heap_bh6_w62_6 :  std_logic;
signal heap_bh6_w63_3 :  std_logic;
signal heap_bh6_w64_3 :  std_logic;
signal heap_bh6_w65_3 :  std_logic;
signal Y3X3_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X3Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w63_4 :  std_logic;
signal heap_bh6_w64_4 :  std_logic;
signal heap_bh6_w65_4 :  std_logic;
signal heap_bh6_w66_1 :  std_logic;
signal heap_bh6_w67_1 :  std_logic;
signal heap_bh6_w68_1 :  std_logic;
signal Y3X4_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X4Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w66_2 :  std_logic;
signal heap_bh6_w67_2 :  std_logic;
signal heap_bh6_w68_2 :  std_logic;
signal heap_bh6_w69_0 :  std_logic;
signal heap_bh6_w70_0 :  std_logic;
signal heap_bh6_w71_0 :  std_logic;
signal Y4X0_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X0Y4_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w57_7 :  std_logic;
signal heap_bh6_w58_8 :  std_logic;
signal heap_bh6_w59_8 :  std_logic;
signal heap_bh6_w60_7 :  std_logic;
signal heap_bh6_w61_7 :  std_logic;
signal heap_bh6_w62_7 :  std_logic;
signal Y4X1_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X1Y4_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w60_8 :  std_logic;
signal heap_bh6_w61_8 :  std_logic;
signal heap_bh6_w62_8 :  std_logic;
signal heap_bh6_w63_5 :  std_logic;
signal heap_bh6_w64_5 :  std_logic;
signal heap_bh6_w65_5 :  std_logic;
signal Y4X2_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X2Y4_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w63_6 :  std_logic;
signal heap_bh6_w64_6 :  std_logic;
signal heap_bh6_w65_6 :  std_logic;
signal heap_bh6_w66_3 :  std_logic;
signal heap_bh6_w67_3 :  std_logic;
signal heap_bh6_w68_3 :  std_logic;
signal Y4X3_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X3Y4_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w66_4 :  std_logic;
signal heap_bh6_w67_4 :  std_logic;
signal heap_bh6_w68_4 :  std_logic;
signal heap_bh6_w69_1 :  std_logic;
signal heap_bh6_w70_1 :  std_logic;
signal heap_bh6_w71_1 :  std_logic;
signal Y4X4_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X4Y4_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w69_2 :  std_logic;
signal heap_bh6_w70_2 :  std_logic;
signal heap_bh6_w71_2 :  std_logic;
signal heap_bh6_w72_0 :  std_logic;
signal heap_bh6_w73_0 :  std_logic;
signal heap_bh6_w74_0 :  std_logic;
signal Y5X0_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X0Y5_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w60_9 :  std_logic;
signal heap_bh6_w61_9 :  std_logic;
signal heap_bh6_w62_9 :  std_logic;
signal heap_bh6_w63_7 :  std_logic;
signal heap_bh6_w64_7 :  std_logic;
signal heap_bh6_w65_7 :  std_logic;
signal Y5X1_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X1Y5_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w63_8 :  std_logic;
signal heap_bh6_w64_8 :  std_logic;
signal heap_bh6_w65_8 :  std_logic;
signal heap_bh6_w66_5 :  std_logic;
signal heap_bh6_w67_5 :  std_logic;
signal heap_bh6_w68_5 :  std_logic;
signal Y5X2_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X2Y5_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w66_6 :  std_logic;
signal heap_bh6_w67_6 :  std_logic;
signal heap_bh6_w68_6 :  std_logic;
signal heap_bh6_w69_3 :  std_logic;
signal heap_bh6_w70_3 :  std_logic;
signal heap_bh6_w71_3 :  std_logic;
signal Y5X3_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X3Y5_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w69_4 :  std_logic;
signal heap_bh6_w70_4 :  std_logic;
signal heap_bh6_w71_4 :  std_logic;
signal heap_bh6_w72_1 :  std_logic;
signal heap_bh6_w73_1 :  std_logic;
signal heap_bh6_w74_1 :  std_logic;
signal Y5X4_7_m5 :  std_logic_vector(5 downto 0);
signal PP7X4Y5_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w72_2 :  std_logic;
signal heap_bh6_w73_2 :  std_logic;
signal heap_bh6_w74_2 :  std_logic;
signal heap_bh6_w75_0 :  std_logic;
signal heap_bh6_w76_0 :  std_logic;
signal heap_bh6_w77_0 :  std_logic;
signal Xp_m5b39 :  std_logic_vector(14 downto 0);
signal Yp_m5b39 :  std_logic_vector(17 downto 0);
signal x_m5b39_0 :  std_logic_vector(2 downto 0);
signal x_m5b39_1 :  std_logic_vector(2 downto 0);
signal x_m5b39_2 :  std_logic_vector(2 downto 0);
signal x_m5b39_3 :  std_logic_vector(2 downto 0);
signal x_m5b39_4 :  std_logic_vector(2 downto 0);
signal y_m5b39_0 :  std_logic_vector(2 downto 0);
signal y_m5b39_1 :  std_logic_vector(2 downto 0);
signal y_m5b39_2 :  std_logic_vector(2 downto 0);
signal y_m5b39_3 :  std_logic_vector(2 downto 0);
signal y_m5b39_4 :  std_logic_vector(2 downto 0);
signal y_m5b39_5 :  std_logic_vector(2 downto 0);
signal Y0X0_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X0Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w29_0 :  std_logic;
signal heap_bh6_w30_0 :  std_logic;
signal heap_bh6_w31_0 :  std_logic;
signal heap_bh6_w32_0 :  std_logic;
signal heap_bh6_w33_0 :  std_logic;
signal Y0X1_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X1Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w32_1 :  std_logic;
signal heap_bh6_w33_1 :  std_logic;
signal heap_bh6_w34_0 :  std_logic;
signal heap_bh6_w35_0 :  std_logic;
signal heap_bh6_w36_0 :  std_logic;
signal Y0X2_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X2Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w35_1 :  std_logic;
signal heap_bh6_w36_1 :  std_logic;
signal heap_bh6_w37_0 :  std_logic;
signal heap_bh6_w38_0 :  std_logic;
signal heap_bh6_w39_0 :  std_logic;
signal Y0X3_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X3Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w38_1 :  std_logic;
signal heap_bh6_w39_1 :  std_logic;
signal heap_bh6_w40_0 :  std_logic;
signal heap_bh6_w41_0 :  std_logic;
signal heap_bh6_w42_0 :  std_logic;
signal Y0X4_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X4Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w41_1 :  std_logic;
signal heap_bh6_w42_1 :  std_logic;
signal heap_bh6_w43_0 :  std_logic;
signal heap_bh6_w44_0 :  std_logic;
signal heap_bh6_w45_0 :  std_logic;
signal Y1X0_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X0Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w31_1 :  std_logic;
signal heap_bh6_w32_2 :  std_logic;
signal heap_bh6_w33_2 :  std_logic;
signal heap_bh6_w34_1 :  std_logic;
signal heap_bh6_w35_2 :  std_logic;
signal heap_bh6_w36_2 :  std_logic;
signal Y1X1_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X1Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w34_2 :  std_logic;
signal heap_bh6_w35_3 :  std_logic;
signal heap_bh6_w36_3 :  std_logic;
signal heap_bh6_w37_1 :  std_logic;
signal heap_bh6_w38_2 :  std_logic;
signal heap_bh6_w39_2 :  std_logic;
signal Y1X2_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X2Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w37_2 :  std_logic;
signal heap_bh6_w38_3 :  std_logic;
signal heap_bh6_w39_3 :  std_logic;
signal heap_bh6_w40_1 :  std_logic;
signal heap_bh6_w41_2 :  std_logic;
signal heap_bh6_w42_2 :  std_logic;
signal Y1X3_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X3Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w40_2 :  std_logic;
signal heap_bh6_w41_3 :  std_logic;
signal heap_bh6_w42_3 :  std_logic;
signal heap_bh6_w43_1 :  std_logic;
signal heap_bh6_w44_1 :  std_logic;
signal heap_bh6_w45_1 :  std_logic;
signal Y1X4_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X4Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w43_2 :  std_logic;
signal heap_bh6_w44_2 :  std_logic;
signal heap_bh6_w45_2 :  std_logic;
signal heap_bh6_w46_1 :  std_logic;
signal heap_bh6_w47_1 :  std_logic;
signal heap_bh6_w48_2 :  std_logic;
signal Y2X0_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X0Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w34_3 :  std_logic;
signal heap_bh6_w35_4 :  std_logic;
signal heap_bh6_w36_4 :  std_logic;
signal heap_bh6_w37_3 :  std_logic;
signal heap_bh6_w38_4 :  std_logic;
signal heap_bh6_w39_4 :  std_logic;
signal Y2X1_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X1Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w37_4 :  std_logic;
signal heap_bh6_w38_5 :  std_logic;
signal heap_bh6_w39_5 :  std_logic;
signal heap_bh6_w40_3 :  std_logic;
signal heap_bh6_w41_4 :  std_logic;
signal heap_bh6_w42_4 :  std_logic;
signal Y2X2_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X2Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w40_4 :  std_logic;
signal heap_bh6_w41_5 :  std_logic;
signal heap_bh6_w42_5 :  std_logic;
signal heap_bh6_w43_3 :  std_logic;
signal heap_bh6_w44_3 :  std_logic;
signal heap_bh6_w45_3 :  std_logic;
signal Y2X3_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X3Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w43_4 :  std_logic;
signal heap_bh6_w44_4 :  std_logic;
signal heap_bh6_w45_4 :  std_logic;
signal heap_bh6_w46_2 :  std_logic;
signal heap_bh6_w47_2 :  std_logic;
signal heap_bh6_w48_3 :  std_logic;
signal Y2X4_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X4Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w46_3 :  std_logic;
signal heap_bh6_w47_3 :  std_logic;
signal heap_bh6_w48_4 :  std_logic;
signal heap_bh6_w49_3 :  std_logic;
signal heap_bh6_w50_3 :  std_logic;
signal heap_bh6_w51_4 :  std_logic;
signal Y3X0_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X0Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w37_5 :  std_logic;
signal heap_bh6_w38_6 :  std_logic;
signal heap_bh6_w39_6 :  std_logic;
signal heap_bh6_w40_5 :  std_logic;
signal heap_bh6_w41_6 :  std_logic;
signal heap_bh6_w42_6 :  std_logic;
signal Y3X1_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X1Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w40_6 :  std_logic;
signal heap_bh6_w41_7 :  std_logic;
signal heap_bh6_w42_7 :  std_logic;
signal heap_bh6_w43_5 :  std_logic;
signal heap_bh6_w44_5 :  std_logic;
signal heap_bh6_w45_5 :  std_logic;
signal Y3X2_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X2Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w43_6 :  std_logic;
signal heap_bh6_w44_6 :  std_logic;
signal heap_bh6_w45_6 :  std_logic;
signal heap_bh6_w46_4 :  std_logic;
signal heap_bh6_w47_4 :  std_logic;
signal heap_bh6_w48_5 :  std_logic;
signal Y3X3_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X3Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w46_5 :  std_logic;
signal heap_bh6_w47_5 :  std_logic;
signal heap_bh6_w48_6 :  std_logic;
signal heap_bh6_w49_4 :  std_logic;
signal heap_bh6_w50_4 :  std_logic;
signal heap_bh6_w51_5 :  std_logic;
signal Y3X4_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X4Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w49_5 :  std_logic;
signal heap_bh6_w50_5 :  std_logic;
signal heap_bh6_w51_6 :  std_logic;
signal heap_bh6_w52_5 :  std_logic;
signal heap_bh6_w53_5 :  std_logic;
signal heap_bh6_w54_6 :  std_logic;
signal Y4X0_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X0Y4_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w40_7 :  std_logic;
signal heap_bh6_w41_8 :  std_logic;
signal heap_bh6_w42_8 :  std_logic;
signal heap_bh6_w43_7 :  std_logic;
signal heap_bh6_w44_7 :  std_logic;
signal heap_bh6_w45_7 :  std_logic;
signal Y4X1_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X1Y4_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w43_8 :  std_logic;
signal heap_bh6_w44_8 :  std_logic;
signal heap_bh6_w45_8 :  std_logic;
signal heap_bh6_w46_6 :  std_logic;
signal heap_bh6_w47_6 :  std_logic;
signal heap_bh6_w48_7 :  std_logic;
signal Y4X2_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X2Y4_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w46_7 :  std_logic;
signal heap_bh6_w47_7 :  std_logic;
signal heap_bh6_w48_8 :  std_logic;
signal heap_bh6_w49_6 :  std_logic;
signal heap_bh6_w50_6 :  std_logic;
signal heap_bh6_w51_7 :  std_logic;
signal Y4X3_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X3Y4_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w49_7 :  std_logic;
signal heap_bh6_w50_7 :  std_logic;
signal heap_bh6_w51_8 :  std_logic;
signal heap_bh6_w52_6 :  std_logic;
signal heap_bh6_w53_6 :  std_logic;
signal heap_bh6_w54_7 :  std_logic;
signal Y4X4_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X4Y4_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w52_7 :  std_logic;
signal heap_bh6_w53_7 :  std_logic;
signal heap_bh6_w54_8 :  std_logic;
signal heap_bh6_w55_7 :  std_logic;
signal heap_bh6_w56_7 :  std_logic;
signal heap_bh6_w57_8 :  std_logic;
signal Y5X0_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X0Y5_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w43_9 :  std_logic;
signal heap_bh6_w44_9 :  std_logic;
signal heap_bh6_w45_9 :  std_logic;
signal heap_bh6_w46_8 :  std_logic;
signal heap_bh6_w47_8 :  std_logic;
signal heap_bh6_w48_9 :  std_logic;
signal Y5X1_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X1Y5_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w46_9 :  std_logic;
signal heap_bh6_w47_9 :  std_logic;
signal heap_bh6_w48_10 :  std_logic;
signal heap_bh6_w49_8 :  std_logic;
signal heap_bh6_w50_8 :  std_logic;
signal heap_bh6_w51_9 :  std_logic;
signal Y5X2_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X2Y5_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w49_9 :  std_logic;
signal heap_bh6_w50_9 :  std_logic;
signal heap_bh6_w51_10 :  std_logic;
signal heap_bh6_w52_8 :  std_logic;
signal heap_bh6_w53_8 :  std_logic;
signal heap_bh6_w54_9 :  std_logic;
signal Y5X3_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X3Y5_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w52_9 :  std_logic;
signal heap_bh6_w53_9 :  std_logic;
signal heap_bh6_w54_10 :  std_logic;
signal heap_bh6_w55_8 :  std_logic;
signal heap_bh6_w56_8 :  std_logic;
signal heap_bh6_w57_9 :  std_logic;
signal Y5X4_39_m5 :  std_logic_vector(5 downto 0);
signal PP39X4Y5_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w55_9 :  std_logic;
signal heap_bh6_w56_9 :  std_logic;
signal heap_bh6_w57_10 :  std_logic;
signal heap_bh6_w58_9 :  std_logic;
signal heap_bh6_w59_9 :  std_logic;
signal heap_bh6_w60_10 :  std_logic;
signal Xp_m5b71 :  std_logic_vector(14 downto 0);
signal Yp_m5b71 :  std_logic_vector(17 downto 0);
signal x_m5b71_0 :  std_logic_vector(2 downto 0);
signal x_m5b71_1 :  std_logic_vector(2 downto 0);
signal x_m5b71_2 :  std_logic_vector(2 downto 0);
signal x_m5b71_3 :  std_logic_vector(2 downto 0);
signal x_m5b71_4 :  std_logic_vector(2 downto 0);
signal y_m5b71_0 :  std_logic_vector(2 downto 0);
signal y_m5b71_1 :  std_logic_vector(2 downto 0);
signal y_m5b71_2 :  std_logic_vector(2 downto 0);
signal y_m5b71_3 :  std_logic_vector(2 downto 0);
signal y_m5b71_4 :  std_logic_vector(2 downto 0);
signal y_m5b71_5 :  std_logic_vector(2 downto 0);
signal Y0X0_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X0Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w12_0 :  std_logic;
signal heap_bh6_w13_0 :  std_logic;
signal heap_bh6_w14_0 :  std_logic;
signal heap_bh6_w15_0 :  std_logic;
signal heap_bh6_w16_0 :  std_logic;
signal Y0X1_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X1Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w15_1 :  std_logic;
signal heap_bh6_w16_1 :  std_logic;
signal heap_bh6_w17_0 :  std_logic;
signal heap_bh6_w18_0 :  std_logic;
signal heap_bh6_w19_0 :  std_logic;
signal Y0X2_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X2Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w18_1 :  std_logic;
signal heap_bh6_w19_1 :  std_logic;
signal heap_bh6_w20_0 :  std_logic;
signal heap_bh6_w21_0 :  std_logic;
signal heap_bh6_w22_0 :  std_logic;
signal Y0X3_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X3Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w21_1 :  std_logic;
signal heap_bh6_w22_1 :  std_logic;
signal heap_bh6_w23_0 :  std_logic;
signal heap_bh6_w24_0 :  std_logic;
signal heap_bh6_w25_0 :  std_logic;
signal Y0X4_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X4Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w24_1 :  std_logic;
signal heap_bh6_w25_1 :  std_logic;
signal heap_bh6_w26_0 :  std_logic;
signal heap_bh6_w27_0 :  std_logic;
signal heap_bh6_w28_0 :  std_logic;
signal Y1X0_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X0Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w14_1 :  std_logic;
signal heap_bh6_w15_2 :  std_logic;
signal heap_bh6_w16_2 :  std_logic;
signal heap_bh6_w17_1 :  std_logic;
signal heap_bh6_w18_2 :  std_logic;
signal heap_bh6_w19_2 :  std_logic;
signal Y1X1_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X1Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w17_2 :  std_logic;
signal heap_bh6_w18_3 :  std_logic;
signal heap_bh6_w19_3 :  std_logic;
signal heap_bh6_w20_1 :  std_logic;
signal heap_bh6_w21_2 :  std_logic;
signal heap_bh6_w22_2 :  std_logic;
signal Y1X2_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X2Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w20_2 :  std_logic;
signal heap_bh6_w21_3 :  std_logic;
signal heap_bh6_w22_3 :  std_logic;
signal heap_bh6_w23_1 :  std_logic;
signal heap_bh6_w24_2 :  std_logic;
signal heap_bh6_w25_2 :  std_logic;
signal Y1X3_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X3Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w23_2 :  std_logic;
signal heap_bh6_w24_3 :  std_logic;
signal heap_bh6_w25_3 :  std_logic;
signal heap_bh6_w26_1 :  std_logic;
signal heap_bh6_w27_1 :  std_logic;
signal heap_bh6_w28_1 :  std_logic;
signal Y1X4_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X4Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w26_2 :  std_logic;
signal heap_bh6_w27_2 :  std_logic;
signal heap_bh6_w28_2 :  std_logic;
signal heap_bh6_w29_1 :  std_logic;
signal heap_bh6_w30_1 :  std_logic;
signal heap_bh6_w31_2 :  std_logic;
signal Y2X0_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X0Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w17_3 :  std_logic;
signal heap_bh6_w18_4 :  std_logic;
signal heap_bh6_w19_4 :  std_logic;
signal heap_bh6_w20_3 :  std_logic;
signal heap_bh6_w21_4 :  std_logic;
signal heap_bh6_w22_4 :  std_logic;
signal Y2X1_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X1Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w20_4 :  std_logic;
signal heap_bh6_w21_5 :  std_logic;
signal heap_bh6_w22_5 :  std_logic;
signal heap_bh6_w23_3 :  std_logic;
signal heap_bh6_w24_4 :  std_logic;
signal heap_bh6_w25_4 :  std_logic;
signal Y2X2_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X2Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w23_4 :  std_logic;
signal heap_bh6_w24_5 :  std_logic;
signal heap_bh6_w25_5 :  std_logic;
signal heap_bh6_w26_3 :  std_logic;
signal heap_bh6_w27_3 :  std_logic;
signal heap_bh6_w28_3 :  std_logic;
signal Y2X3_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X3Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w26_4 :  std_logic;
signal heap_bh6_w27_4 :  std_logic;
signal heap_bh6_w28_4 :  std_logic;
signal heap_bh6_w29_2 :  std_logic;
signal heap_bh6_w30_2 :  std_logic;
signal heap_bh6_w31_3 :  std_logic;
signal Y2X4_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X4Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w29_3 :  std_logic;
signal heap_bh6_w30_3 :  std_logic;
signal heap_bh6_w31_4 :  std_logic;
signal heap_bh6_w32_3 :  std_logic;
signal heap_bh6_w33_3 :  std_logic;
signal heap_bh6_w34_4 :  std_logic;
signal Y3X0_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X0Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w20_5 :  std_logic;
signal heap_bh6_w21_6 :  std_logic;
signal heap_bh6_w22_6 :  std_logic;
signal heap_bh6_w23_5 :  std_logic;
signal heap_bh6_w24_6 :  std_logic;
signal heap_bh6_w25_6 :  std_logic;
signal Y3X1_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X1Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w23_6 :  std_logic;
signal heap_bh6_w24_7 :  std_logic;
signal heap_bh6_w25_7 :  std_logic;
signal heap_bh6_w26_5 :  std_logic;
signal heap_bh6_w27_5 :  std_logic;
signal heap_bh6_w28_5 :  std_logic;
signal Y3X2_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X2Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w26_6 :  std_logic;
signal heap_bh6_w27_6 :  std_logic;
signal heap_bh6_w28_6 :  std_logic;
signal heap_bh6_w29_4 :  std_logic;
signal heap_bh6_w30_4 :  std_logic;
signal heap_bh6_w31_5 :  std_logic;
signal Y3X3_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X3Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w29_5 :  std_logic;
signal heap_bh6_w30_5 :  std_logic;
signal heap_bh6_w31_6 :  std_logic;
signal heap_bh6_w32_4 :  std_logic;
signal heap_bh6_w33_4 :  std_logic;
signal heap_bh6_w34_5 :  std_logic;
signal Y3X4_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X4Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w32_5 :  std_logic;
signal heap_bh6_w33_5 :  std_logic;
signal heap_bh6_w34_6 :  std_logic;
signal heap_bh6_w35_5 :  std_logic;
signal heap_bh6_w36_5 :  std_logic;
signal heap_bh6_w37_6 :  std_logic;
signal Y4X0_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X0Y4_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w23_7 :  std_logic;
signal heap_bh6_w24_8 :  std_logic;
signal heap_bh6_w25_8 :  std_logic;
signal heap_bh6_w26_7 :  std_logic;
signal heap_bh6_w27_7 :  std_logic;
signal heap_bh6_w28_7 :  std_logic;
signal Y4X1_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X1Y4_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w26_8 :  std_logic;
signal heap_bh6_w27_8 :  std_logic;
signal heap_bh6_w28_8 :  std_logic;
signal heap_bh6_w29_6 :  std_logic;
signal heap_bh6_w30_6 :  std_logic;
signal heap_bh6_w31_7 :  std_logic;
signal Y4X2_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X2Y4_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w29_7 :  std_logic;
signal heap_bh6_w30_7 :  std_logic;
signal heap_bh6_w31_8 :  std_logic;
signal heap_bh6_w32_6 :  std_logic;
signal heap_bh6_w33_6 :  std_logic;
signal heap_bh6_w34_7 :  std_logic;
signal Y4X3_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X3Y4_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w32_7 :  std_logic;
signal heap_bh6_w33_7 :  std_logic;
signal heap_bh6_w34_8 :  std_logic;
signal heap_bh6_w35_6 :  std_logic;
signal heap_bh6_w36_6 :  std_logic;
signal heap_bh6_w37_7 :  std_logic;
signal Y4X4_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X4Y4_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w35_7 :  std_logic;
signal heap_bh6_w36_7 :  std_logic;
signal heap_bh6_w37_8 :  std_logic;
signal heap_bh6_w38_7 :  std_logic;
signal heap_bh6_w39_7 :  std_logic;
signal heap_bh6_w40_8 :  std_logic;
signal Y5X0_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X0Y5_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w26_9 :  std_logic;
signal heap_bh6_w27_9 :  std_logic;
signal heap_bh6_w28_9 :  std_logic;
signal heap_bh6_w29_8 :  std_logic;
signal heap_bh6_w30_8 :  std_logic;
signal heap_bh6_w31_9 :  std_logic;
signal Y5X1_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X1Y5_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w29_9 :  std_logic;
signal heap_bh6_w30_9 :  std_logic;
signal heap_bh6_w31_10 :  std_logic;
signal heap_bh6_w32_8 :  std_logic;
signal heap_bh6_w33_8 :  std_logic;
signal heap_bh6_w34_9 :  std_logic;
signal Y5X2_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X2Y5_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w32_9 :  std_logic;
signal heap_bh6_w33_9 :  std_logic;
signal heap_bh6_w34_10 :  std_logic;
signal heap_bh6_w35_8 :  std_logic;
signal heap_bh6_w36_8 :  std_logic;
signal heap_bh6_w37_9 :  std_logic;
signal Y5X3_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X3Y5_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w35_9 :  std_logic;
signal heap_bh6_w36_9 :  std_logic;
signal heap_bh6_w37_10 :  std_logic;
signal heap_bh6_w38_8 :  std_logic;
signal heap_bh6_w39_8 :  std_logic;
signal heap_bh6_w40_9 :  std_logic;
signal Y5X4_71_m5 :  std_logic_vector(5 downto 0);
signal PP71X4Y5_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w38_9 :  std_logic;
signal heap_bh6_w39_9 :  std_logic;
signal heap_bh6_w40_10 :  std_logic;
signal heap_bh6_w41_9 :  std_logic;
signal heap_bh6_w42_9 :  std_logic;
signal heap_bh6_w43_10 :  std_logic;
signal Xp_m5b103 :  std_logic_vector(23 downto 0);
signal Yp_m5b103 :  std_logic_vector(11 downto 0);
signal x_m5b103_0 :  std_logic_vector(2 downto 0);
signal x_m5b103_1 :  std_logic_vector(2 downto 0);
signal x_m5b103_2 :  std_logic_vector(2 downto 0);
signal x_m5b103_3 :  std_logic_vector(2 downto 0);
signal x_m5b103_4 :  std_logic_vector(2 downto 0);
signal x_m5b103_5 :  std_logic_vector(2 downto 0);
signal x_m5b103_6 :  std_logic_vector(2 downto 0);
signal x_m5b103_7 :  std_logic_vector(2 downto 0);
signal y_m5b103_0 :  std_logic_vector(2 downto 0);
signal y_m5b103_1 :  std_logic_vector(2 downto 0);
signal y_m5b103_2 :  std_logic_vector(2 downto 0);
signal y_m5b103_3 :  std_logic_vector(2 downto 0);
signal Y0X0_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X0Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w39_10 :  std_logic;
signal heap_bh6_w40_11 :  std_logic;
signal heap_bh6_w41_10 :  std_logic;
signal heap_bh6_w42_10 :  std_logic;
signal heap_bh6_w43_11 :  std_logic;
signal heap_bh6_w44_10 :  std_logic;
signal Y0X1_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X1Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w42_11 :  std_logic;
signal heap_bh6_w43_12 :  std_logic;
signal heap_bh6_w44_11 :  std_logic;
signal heap_bh6_w45_10 :  std_logic;
signal heap_bh6_w46_10 :  std_logic;
signal heap_bh6_w47_10 :  std_logic;
signal Y0X2_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X2Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w45_11 :  std_logic;
signal heap_bh6_w46_11 :  std_logic;
signal heap_bh6_w47_11 :  std_logic;
signal heap_bh6_w48_11 :  std_logic;
signal heap_bh6_w49_10 :  std_logic;
signal heap_bh6_w50_10 :  std_logic;
signal Y0X3_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X3Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w48_12 :  std_logic;
signal heap_bh6_w49_11 :  std_logic;
signal heap_bh6_w50_11 :  std_logic;
signal heap_bh6_w51_11 :  std_logic;
signal heap_bh6_w52_10 :  std_logic;
signal heap_bh6_w53_10 :  std_logic;
signal Y0X4_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X4Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w51_12 :  std_logic;
signal heap_bh6_w52_11 :  std_logic;
signal heap_bh6_w53_11 :  std_logic;
signal heap_bh6_w54_11 :  std_logic;
signal heap_bh6_w55_10 :  std_logic;
signal heap_bh6_w56_10 :  std_logic;
signal Y0X5_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X5Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w54_12 :  std_logic;
signal heap_bh6_w55_11 :  std_logic;
signal heap_bh6_w56_11 :  std_logic;
signal heap_bh6_w57_11 :  std_logic;
signal heap_bh6_w58_10 :  std_logic;
signal heap_bh6_w59_10 :  std_logic;
signal Y0X6_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X6Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w57_12 :  std_logic;
signal heap_bh6_w58_11 :  std_logic;
signal heap_bh6_w59_11 :  std_logic;
signal heap_bh6_w60_11 :  std_logic;
signal heap_bh6_w61_10 :  std_logic;
signal heap_bh6_w62_10 :  std_logic;
signal Y0X7_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X7Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w60_12 :  std_logic;
signal heap_bh6_w61_11 :  std_logic;
signal heap_bh6_w62_11 :  std_logic;
signal heap_bh6_w63_9 :  std_logic;
signal heap_bh6_w64_9 :  std_logic;
signal heap_bh6_w65_9 :  std_logic;
signal Y1X0_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X0Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w42_12 :  std_logic;
signal heap_bh6_w43_13 :  std_logic;
signal heap_bh6_w44_12 :  std_logic;
signal heap_bh6_w45_12 :  std_logic;
signal heap_bh6_w46_12 :  std_logic;
signal heap_bh6_w47_12 :  std_logic;
signal Y1X1_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X1Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w45_13 :  std_logic;
signal heap_bh6_w46_13 :  std_logic;
signal heap_bh6_w47_13 :  std_logic;
signal heap_bh6_w48_13 :  std_logic;
signal heap_bh6_w49_12 :  std_logic;
signal heap_bh6_w50_12 :  std_logic;
signal Y1X2_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X2Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w48_14 :  std_logic;
signal heap_bh6_w49_13 :  std_logic;
signal heap_bh6_w50_13 :  std_logic;
signal heap_bh6_w51_13 :  std_logic;
signal heap_bh6_w52_12 :  std_logic;
signal heap_bh6_w53_12 :  std_logic;
signal Y1X3_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X3Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w51_14 :  std_logic;
signal heap_bh6_w52_13 :  std_logic;
signal heap_bh6_w53_13 :  std_logic;
signal heap_bh6_w54_13 :  std_logic;
signal heap_bh6_w55_12 :  std_logic;
signal heap_bh6_w56_12 :  std_logic;
signal Y1X4_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X4Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w54_14 :  std_logic;
signal heap_bh6_w55_13 :  std_logic;
signal heap_bh6_w56_13 :  std_logic;
signal heap_bh6_w57_13 :  std_logic;
signal heap_bh6_w58_12 :  std_logic;
signal heap_bh6_w59_12 :  std_logic;
signal Y1X5_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X5Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w57_14 :  std_logic;
signal heap_bh6_w58_13 :  std_logic;
signal heap_bh6_w59_13 :  std_logic;
signal heap_bh6_w60_13 :  std_logic;
signal heap_bh6_w61_12 :  std_logic;
signal heap_bh6_w62_12 :  std_logic;
signal Y1X6_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X6Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w60_14 :  std_logic;
signal heap_bh6_w61_13 :  std_logic;
signal heap_bh6_w62_13 :  std_logic;
signal heap_bh6_w63_10 :  std_logic;
signal heap_bh6_w64_10 :  std_logic;
signal heap_bh6_w65_10 :  std_logic;
signal Y1X7_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X7Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w63_11 :  std_logic;
signal heap_bh6_w64_11 :  std_logic;
signal heap_bh6_w65_11 :  std_logic;
signal heap_bh6_w66_7 :  std_logic;
signal heap_bh6_w67_7 :  std_logic;
signal heap_bh6_w68_7 :  std_logic;
signal Y2X0_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X0Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w45_14 :  std_logic;
signal heap_bh6_w46_14 :  std_logic;
signal heap_bh6_w47_14 :  std_logic;
signal heap_bh6_w48_15 :  std_logic;
signal heap_bh6_w49_14 :  std_logic;
signal heap_bh6_w50_14 :  std_logic;
signal Y2X1_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X1Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w48_16 :  std_logic;
signal heap_bh6_w49_15 :  std_logic;
signal heap_bh6_w50_15 :  std_logic;
signal heap_bh6_w51_15 :  std_logic;
signal heap_bh6_w52_14 :  std_logic;
signal heap_bh6_w53_14 :  std_logic;
signal Y2X2_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X2Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w51_16 :  std_logic;
signal heap_bh6_w52_15 :  std_logic;
signal heap_bh6_w53_15 :  std_logic;
signal heap_bh6_w54_15 :  std_logic;
signal heap_bh6_w55_14 :  std_logic;
signal heap_bh6_w56_14 :  std_logic;
signal Y2X3_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X3Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w54_16 :  std_logic;
signal heap_bh6_w55_15 :  std_logic;
signal heap_bh6_w56_15 :  std_logic;
signal heap_bh6_w57_15 :  std_logic;
signal heap_bh6_w58_14 :  std_logic;
signal heap_bh6_w59_14 :  std_logic;
signal Y2X4_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X4Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w57_16 :  std_logic;
signal heap_bh6_w58_15 :  std_logic;
signal heap_bh6_w59_15 :  std_logic;
signal heap_bh6_w60_15 :  std_logic;
signal heap_bh6_w61_14 :  std_logic;
signal heap_bh6_w62_14 :  std_logic;
signal Y2X5_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X5Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w60_16 :  std_logic;
signal heap_bh6_w61_15 :  std_logic;
signal heap_bh6_w62_15 :  std_logic;
signal heap_bh6_w63_12 :  std_logic;
signal heap_bh6_w64_12 :  std_logic;
signal heap_bh6_w65_12 :  std_logic;
signal Y2X6_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X6Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w63_13 :  std_logic;
signal heap_bh6_w64_13 :  std_logic;
signal heap_bh6_w65_13 :  std_logic;
signal heap_bh6_w66_8 :  std_logic;
signal heap_bh6_w67_8 :  std_logic;
signal heap_bh6_w68_8 :  std_logic;
signal Y2X7_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X7Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w66_9 :  std_logic;
signal heap_bh6_w67_9 :  std_logic;
signal heap_bh6_w68_9 :  std_logic;
signal heap_bh6_w69_5 :  std_logic;
signal heap_bh6_w70_5 :  std_logic;
signal heap_bh6_w71_5 :  std_logic;
signal Y3X0_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X0Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w48_17 :  std_logic;
signal heap_bh6_w49_16 :  std_logic;
signal heap_bh6_w50_16 :  std_logic;
signal heap_bh6_w51_17 :  std_logic;
signal heap_bh6_w52_16 :  std_logic;
signal heap_bh6_w53_16 :  std_logic;
signal Y3X1_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X1Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w51_18 :  std_logic;
signal heap_bh6_w52_17 :  std_logic;
signal heap_bh6_w53_17 :  std_logic;
signal heap_bh6_w54_17 :  std_logic;
signal heap_bh6_w55_16 :  std_logic;
signal heap_bh6_w56_16 :  std_logic;
signal Y3X2_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X2Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w54_18 :  std_logic;
signal heap_bh6_w55_17 :  std_logic;
signal heap_bh6_w56_17 :  std_logic;
signal heap_bh6_w57_17 :  std_logic;
signal heap_bh6_w58_16 :  std_logic;
signal heap_bh6_w59_16 :  std_logic;
signal Y3X3_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X3Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w57_18 :  std_logic;
signal heap_bh6_w58_17 :  std_logic;
signal heap_bh6_w59_17 :  std_logic;
signal heap_bh6_w60_17 :  std_logic;
signal heap_bh6_w61_16 :  std_logic;
signal heap_bh6_w62_16 :  std_logic;
signal Y3X4_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X4Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w60_18 :  std_logic;
signal heap_bh6_w61_17 :  std_logic;
signal heap_bh6_w62_17 :  std_logic;
signal heap_bh6_w63_14 :  std_logic;
signal heap_bh6_w64_14 :  std_logic;
signal heap_bh6_w65_14 :  std_logic;
signal Y3X5_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X5Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w63_15 :  std_logic;
signal heap_bh6_w64_15 :  std_logic;
signal heap_bh6_w65_15 :  std_logic;
signal heap_bh6_w66_10 :  std_logic;
signal heap_bh6_w67_10 :  std_logic;
signal heap_bh6_w68_10 :  std_logic;
signal Y3X6_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X6Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w66_11 :  std_logic;
signal heap_bh6_w67_11 :  std_logic;
signal heap_bh6_w68_11 :  std_logic;
signal heap_bh6_w69_6 :  std_logic;
signal heap_bh6_w70_6 :  std_logic;
signal heap_bh6_w71_6 :  std_logic;
signal Y3X7_103_m5 :  std_logic_vector(5 downto 0);
signal PP103X7Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w69_7 :  std_logic;
signal heap_bh6_w70_7 :  std_logic;
signal heap_bh6_w71_7 :  std_logic;
signal heap_bh6_w72_3 :  std_logic;
signal heap_bh6_w73_3 :  std_logic;
signal heap_bh6_w74_3 :  std_logic;
signal Xp_m5b137 :  std_logic_vector(23 downto 0);
signal Yp_m5b137 :  std_logic_vector(11 downto 0);
signal x_m5b137_0 :  std_logic_vector(2 downto 0);
signal x_m5b137_1 :  std_logic_vector(2 downto 0);
signal x_m5b137_2 :  std_logic_vector(2 downto 0);
signal x_m5b137_3 :  std_logic_vector(2 downto 0);
signal x_m5b137_4 :  std_logic_vector(2 downto 0);
signal x_m5b137_5 :  std_logic_vector(2 downto 0);
signal x_m5b137_6 :  std_logic_vector(2 downto 0);
signal x_m5b137_7 :  std_logic_vector(2 downto 0);
signal y_m5b137_0 :  std_logic_vector(2 downto 0);
signal y_m5b137_1 :  std_logic_vector(2 downto 0);
signal y_m5b137_2 :  std_logic_vector(2 downto 0);
signal y_m5b137_3 :  std_logic_vector(2 downto 0);
signal Y0X0_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X0Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w15_3 :  std_logic;
signal heap_bh6_w16_3 :  std_logic;
signal heap_bh6_w17_4 :  std_logic;
signal heap_bh6_w18_5 :  std_logic;
signal heap_bh6_w19_5 :  std_logic;
signal heap_bh6_w20_6 :  std_logic;
signal Y0X1_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X1Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w18_6 :  std_logic;
signal heap_bh6_w19_6 :  std_logic;
signal heap_bh6_w20_7 :  std_logic;
signal heap_bh6_w21_7 :  std_logic;
signal heap_bh6_w22_7 :  std_logic;
signal heap_bh6_w23_8 :  std_logic;
signal Y0X2_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X2Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w21_8 :  std_logic;
signal heap_bh6_w22_8 :  std_logic;
signal heap_bh6_w23_9 :  std_logic;
signal heap_bh6_w24_9 :  std_logic;
signal heap_bh6_w25_9 :  std_logic;
signal heap_bh6_w26_10 :  std_logic;
signal Y0X3_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X3Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w24_10 :  std_logic;
signal heap_bh6_w25_10 :  std_logic;
signal heap_bh6_w26_11 :  std_logic;
signal heap_bh6_w27_10 :  std_logic;
signal heap_bh6_w28_10 :  std_logic;
signal heap_bh6_w29_10 :  std_logic;
signal Y0X4_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X4Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w27_11 :  std_logic;
signal heap_bh6_w28_11 :  std_logic;
signal heap_bh6_w29_11 :  std_logic;
signal heap_bh6_w30_10 :  std_logic;
signal heap_bh6_w31_11 :  std_logic;
signal heap_bh6_w32_10 :  std_logic;
signal Y0X5_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X5Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w30_11 :  std_logic;
signal heap_bh6_w31_12 :  std_logic;
signal heap_bh6_w32_11 :  std_logic;
signal heap_bh6_w33_10 :  std_logic;
signal heap_bh6_w34_11 :  std_logic;
signal heap_bh6_w35_10 :  std_logic;
signal Y0X6_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X6Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w33_11 :  std_logic;
signal heap_bh6_w34_12 :  std_logic;
signal heap_bh6_w35_11 :  std_logic;
signal heap_bh6_w36_10 :  std_logic;
signal heap_bh6_w37_11 :  std_logic;
signal heap_bh6_w38_10 :  std_logic;
signal Y0X7_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X7Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w36_11 :  std_logic;
signal heap_bh6_w37_12 :  std_logic;
signal heap_bh6_w38_11 :  std_logic;
signal heap_bh6_w39_11 :  std_logic;
signal heap_bh6_w40_12 :  std_logic;
signal heap_bh6_w41_11 :  std_logic;
signal Y1X0_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X0Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w18_7 :  std_logic;
signal heap_bh6_w19_7 :  std_logic;
signal heap_bh6_w20_8 :  std_logic;
signal heap_bh6_w21_9 :  std_logic;
signal heap_bh6_w22_9 :  std_logic;
signal heap_bh6_w23_10 :  std_logic;
signal Y1X1_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X1Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w21_10 :  std_logic;
signal heap_bh6_w22_10 :  std_logic;
signal heap_bh6_w23_11 :  std_logic;
signal heap_bh6_w24_11 :  std_logic;
signal heap_bh6_w25_11 :  std_logic;
signal heap_bh6_w26_12 :  std_logic;
signal Y1X2_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X2Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w24_12 :  std_logic;
signal heap_bh6_w25_12 :  std_logic;
signal heap_bh6_w26_13 :  std_logic;
signal heap_bh6_w27_12 :  std_logic;
signal heap_bh6_w28_12 :  std_logic;
signal heap_bh6_w29_12 :  std_logic;
signal Y1X3_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X3Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w27_13 :  std_logic;
signal heap_bh6_w28_13 :  std_logic;
signal heap_bh6_w29_13 :  std_logic;
signal heap_bh6_w30_12 :  std_logic;
signal heap_bh6_w31_13 :  std_logic;
signal heap_bh6_w32_12 :  std_logic;
signal Y1X4_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X4Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w30_13 :  std_logic;
signal heap_bh6_w31_14 :  std_logic;
signal heap_bh6_w32_13 :  std_logic;
signal heap_bh6_w33_12 :  std_logic;
signal heap_bh6_w34_13 :  std_logic;
signal heap_bh6_w35_12 :  std_logic;
signal Y1X5_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X5Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w33_13 :  std_logic;
signal heap_bh6_w34_14 :  std_logic;
signal heap_bh6_w35_13 :  std_logic;
signal heap_bh6_w36_12 :  std_logic;
signal heap_bh6_w37_13 :  std_logic;
signal heap_bh6_w38_12 :  std_logic;
signal Y1X6_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X6Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w36_13 :  std_logic;
signal heap_bh6_w37_14 :  std_logic;
signal heap_bh6_w38_13 :  std_logic;
signal heap_bh6_w39_12 :  std_logic;
signal heap_bh6_w40_13 :  std_logic;
signal heap_bh6_w41_12 :  std_logic;
signal Y1X7_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X7Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w39_13 :  std_logic;
signal heap_bh6_w40_14 :  std_logic;
signal heap_bh6_w41_13 :  std_logic;
signal heap_bh6_w42_13 :  std_logic;
signal heap_bh6_w43_14 :  std_logic;
signal heap_bh6_w44_13 :  std_logic;
signal Y2X0_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X0Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w21_11 :  std_logic;
signal heap_bh6_w22_11 :  std_logic;
signal heap_bh6_w23_12 :  std_logic;
signal heap_bh6_w24_13 :  std_logic;
signal heap_bh6_w25_13 :  std_logic;
signal heap_bh6_w26_14 :  std_logic;
signal Y2X1_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X1Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w24_14 :  std_logic;
signal heap_bh6_w25_14 :  std_logic;
signal heap_bh6_w26_15 :  std_logic;
signal heap_bh6_w27_14 :  std_logic;
signal heap_bh6_w28_14 :  std_logic;
signal heap_bh6_w29_14 :  std_logic;
signal Y2X2_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X2Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w27_15 :  std_logic;
signal heap_bh6_w28_15 :  std_logic;
signal heap_bh6_w29_15 :  std_logic;
signal heap_bh6_w30_14 :  std_logic;
signal heap_bh6_w31_15 :  std_logic;
signal heap_bh6_w32_14 :  std_logic;
signal Y2X3_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X3Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w30_15 :  std_logic;
signal heap_bh6_w31_16 :  std_logic;
signal heap_bh6_w32_15 :  std_logic;
signal heap_bh6_w33_14 :  std_logic;
signal heap_bh6_w34_15 :  std_logic;
signal heap_bh6_w35_14 :  std_logic;
signal Y2X4_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X4Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w33_15 :  std_logic;
signal heap_bh6_w34_16 :  std_logic;
signal heap_bh6_w35_15 :  std_logic;
signal heap_bh6_w36_14 :  std_logic;
signal heap_bh6_w37_15 :  std_logic;
signal heap_bh6_w38_14 :  std_logic;
signal Y2X5_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X5Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w36_15 :  std_logic;
signal heap_bh6_w37_16 :  std_logic;
signal heap_bh6_w38_15 :  std_logic;
signal heap_bh6_w39_14 :  std_logic;
signal heap_bh6_w40_15 :  std_logic;
signal heap_bh6_w41_14 :  std_logic;
signal Y2X6_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X6Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w39_15 :  std_logic;
signal heap_bh6_w40_16 :  std_logic;
signal heap_bh6_w41_15 :  std_logic;
signal heap_bh6_w42_14 :  std_logic;
signal heap_bh6_w43_15 :  std_logic;
signal heap_bh6_w44_14 :  std_logic;
signal Y2X7_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X7Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w42_15 :  std_logic;
signal heap_bh6_w43_16 :  std_logic;
signal heap_bh6_w44_15 :  std_logic;
signal heap_bh6_w45_15 :  std_logic;
signal heap_bh6_w46_15 :  std_logic;
signal heap_bh6_w47_15 :  std_logic;
signal Y3X0_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X0Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w24_15 :  std_logic;
signal heap_bh6_w25_15 :  std_logic;
signal heap_bh6_w26_16 :  std_logic;
signal heap_bh6_w27_16 :  std_logic;
signal heap_bh6_w28_16 :  std_logic;
signal heap_bh6_w29_16 :  std_logic;
signal Y3X1_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X1Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w27_17 :  std_logic;
signal heap_bh6_w28_17 :  std_logic;
signal heap_bh6_w29_17 :  std_logic;
signal heap_bh6_w30_16 :  std_logic;
signal heap_bh6_w31_17 :  std_logic;
signal heap_bh6_w32_16 :  std_logic;
signal Y3X2_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X2Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w30_17 :  std_logic;
signal heap_bh6_w31_18 :  std_logic;
signal heap_bh6_w32_17 :  std_logic;
signal heap_bh6_w33_16 :  std_logic;
signal heap_bh6_w34_17 :  std_logic;
signal heap_bh6_w35_16 :  std_logic;
signal Y3X3_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X3Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w33_17 :  std_logic;
signal heap_bh6_w34_18 :  std_logic;
signal heap_bh6_w35_17 :  std_logic;
signal heap_bh6_w36_16 :  std_logic;
signal heap_bh6_w37_17 :  std_logic;
signal heap_bh6_w38_16 :  std_logic;
signal Y3X4_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X4Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w36_17 :  std_logic;
signal heap_bh6_w37_18 :  std_logic;
signal heap_bh6_w38_17 :  std_logic;
signal heap_bh6_w39_16 :  std_logic;
signal heap_bh6_w40_17 :  std_logic;
signal heap_bh6_w41_16 :  std_logic;
signal Y3X5_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X5Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w39_17 :  std_logic;
signal heap_bh6_w40_18 :  std_logic;
signal heap_bh6_w41_17 :  std_logic;
signal heap_bh6_w42_16 :  std_logic;
signal heap_bh6_w43_17 :  std_logic;
signal heap_bh6_w44_16 :  std_logic;
signal Y3X6_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X6Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w42_17 :  std_logic;
signal heap_bh6_w43_18 :  std_logic;
signal heap_bh6_w44_17 :  std_logic;
signal heap_bh6_w45_16 :  std_logic;
signal heap_bh6_w46_16 :  std_logic;
signal heap_bh6_w47_16 :  std_logic;
signal Y3X7_137_m5 :  std_logic_vector(5 downto 0);
signal PP137X7Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w45_17 :  std_logic;
signal heap_bh6_w46_17 :  std_logic;
signal heap_bh6_w47_17 :  std_logic;
signal heap_bh6_w48_18 :  std_logic;
signal heap_bh6_w49_17 :  std_logic;
signal heap_bh6_w50_17 :  std_logic;
signal Xp_m5b171 :  std_logic_vector(14 downto 0);
signal Yp_m5b171 :  std_logic_vector(11 downto 0);
signal x_m5b171_0 :  std_logic_vector(2 downto 0);
signal x_m5b171_1 :  std_logic_vector(2 downto 0);
signal x_m5b171_2 :  std_logic_vector(2 downto 0);
signal x_m5b171_3 :  std_logic_vector(2 downto 0);
signal x_m5b171_4 :  std_logic_vector(2 downto 0);
signal y_m5b171_0 :  std_logic_vector(2 downto 0);
signal y_m5b171_1 :  std_logic_vector(2 downto 0);
signal y_m5b171_2 :  std_logic_vector(2 downto 0);
signal y_m5b171_3 :  std_logic_vector(2 downto 0);
signal Y0X0_171_m5 :  std_logic_vector(5 downto 0);
signal PP171X0Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w0_0 :  std_logic;
signal heap_bh6_w1_0 :  std_logic;
signal heap_bh6_w2_0 :  std_logic;
signal heap_bh6_w3_0 :  std_logic;
signal heap_bh6_w4_0, heap_bh6_w4_0_d1 :  std_logic;
signal heap_bh6_w5_0 :  std_logic;
signal Y0X1_171_m5 :  std_logic_vector(5 downto 0);
signal PP171X1Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w3_1 :  std_logic;
signal heap_bh6_w4_1 :  std_logic;
signal heap_bh6_w5_1 :  std_logic;
signal heap_bh6_w6_0 :  std_logic;
signal heap_bh6_w7_0 :  std_logic;
signal heap_bh6_w8_0 :  std_logic;
signal Y0X2_171_m5 :  std_logic_vector(5 downto 0);
signal PP171X2Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w6_1 :  std_logic;
signal heap_bh6_w7_1 :  std_logic;
signal heap_bh6_w8_1 :  std_logic;
signal heap_bh6_w9_0 :  std_logic;
signal heap_bh6_w10_0 :  std_logic;
signal heap_bh6_w11_0 :  std_logic;
signal Y0X3_171_m5 :  std_logic_vector(5 downto 0);
signal PP171X3Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w9_1 :  std_logic;
signal heap_bh6_w10_1 :  std_logic;
signal heap_bh6_w11_1 :  std_logic;
signal heap_bh6_w12_1 :  std_logic;
signal heap_bh6_w13_1 :  std_logic;
signal heap_bh6_w14_2 :  std_logic;
signal Y0X4_171_m5 :  std_logic_vector(5 downto 0);
signal PP171X4Y0_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w12_2 :  std_logic;
signal heap_bh6_w13_2 :  std_logic;
signal heap_bh6_w14_3 :  std_logic;
signal heap_bh6_w15_4 :  std_logic;
signal heap_bh6_w16_4 :  std_logic;
signal heap_bh6_w17_5 :  std_logic;
signal Y1X0_171_m5 :  std_logic_vector(5 downto 0);
signal PP171X0Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w3_2 :  std_logic;
signal heap_bh6_w4_2 :  std_logic;
signal heap_bh6_w5_2 :  std_logic;
signal heap_bh6_w6_2 :  std_logic;
signal heap_bh6_w7_2 :  std_logic;
signal heap_bh6_w8_2 :  std_logic;
signal Y1X1_171_m5 :  std_logic_vector(5 downto 0);
signal PP171X1Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w6_3 :  std_logic;
signal heap_bh6_w7_3 :  std_logic;
signal heap_bh6_w8_3 :  std_logic;
signal heap_bh6_w9_2 :  std_logic;
signal heap_bh6_w10_2 :  std_logic;
signal heap_bh6_w11_2 :  std_logic;
signal Y1X2_171_m5 :  std_logic_vector(5 downto 0);
signal PP171X2Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w9_3 :  std_logic;
signal heap_bh6_w10_3 :  std_logic;
signal heap_bh6_w11_3 :  std_logic;
signal heap_bh6_w12_3 :  std_logic;
signal heap_bh6_w13_3 :  std_logic;
signal heap_bh6_w14_4 :  std_logic;
signal Y1X3_171_m5 :  std_logic_vector(5 downto 0);
signal PP171X3Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w12_4 :  std_logic;
signal heap_bh6_w13_4 :  std_logic;
signal heap_bh6_w14_5 :  std_logic;
signal heap_bh6_w15_5 :  std_logic;
signal heap_bh6_w16_5 :  std_logic;
signal heap_bh6_w17_6 :  std_logic;
signal Y1X4_171_m5 :  std_logic_vector(5 downto 0);
signal PP171X4Y1_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w15_6 :  std_logic;
signal heap_bh6_w16_6 :  std_logic;
signal heap_bh6_w17_7 :  std_logic;
signal heap_bh6_w18_8 :  std_logic;
signal heap_bh6_w19_8 :  std_logic;
signal heap_bh6_w20_9 :  std_logic;
signal Y2X0_171_m5 :  std_logic_vector(5 downto 0);
signal PP171X0Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w6_4 :  std_logic;
signal heap_bh6_w7_4 :  std_logic;
signal heap_bh6_w8_4 :  std_logic;
signal heap_bh6_w9_4 :  std_logic;
signal heap_bh6_w10_4 :  std_logic;
signal heap_bh6_w11_4 :  std_logic;
signal Y2X1_171_m5 :  std_logic_vector(5 downto 0);
signal PP171X1Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w9_5 :  std_logic;
signal heap_bh6_w10_5 :  std_logic;
signal heap_bh6_w11_5 :  std_logic;
signal heap_bh6_w12_5 :  std_logic;
signal heap_bh6_w13_5 :  std_logic;
signal heap_bh6_w14_6 :  std_logic;
signal Y2X2_171_m5 :  std_logic_vector(5 downto 0);
signal PP171X2Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w12_6 :  std_logic;
signal heap_bh6_w13_6 :  std_logic;
signal heap_bh6_w14_7 :  std_logic;
signal heap_bh6_w15_7 :  std_logic;
signal heap_bh6_w16_7 :  std_logic;
signal heap_bh6_w17_8 :  std_logic;
signal Y2X3_171_m5 :  std_logic_vector(5 downto 0);
signal PP171X3Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w15_8 :  std_logic;
signal heap_bh6_w16_8 :  std_logic;
signal heap_bh6_w17_9 :  std_logic;
signal heap_bh6_w18_9 :  std_logic;
signal heap_bh6_w19_9 :  std_logic;
signal heap_bh6_w20_10 :  std_logic;
signal Y2X4_171_m5 :  std_logic_vector(5 downto 0);
signal PP171X4Y2_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w18_10 :  std_logic;
signal heap_bh6_w19_10 :  std_logic;
signal heap_bh6_w20_11 :  std_logic;
signal heap_bh6_w21_12 :  std_logic;
signal heap_bh6_w22_12 :  std_logic;
signal heap_bh6_w23_13 :  std_logic;
signal Y3X0_171_m5 :  std_logic_vector(5 downto 0);
signal PP171X0Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w9_6 :  std_logic;
signal heap_bh6_w10_6 :  std_logic;
signal heap_bh6_w11_6 :  std_logic;
signal heap_bh6_w12_7 :  std_logic;
signal heap_bh6_w13_7 :  std_logic;
signal heap_bh6_w14_8 :  std_logic;
signal Y3X1_171_m5 :  std_logic_vector(5 downto 0);
signal PP171X1Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w12_8 :  std_logic;
signal heap_bh6_w13_8 :  std_logic;
signal heap_bh6_w14_9 :  std_logic;
signal heap_bh6_w15_9 :  std_logic;
signal heap_bh6_w16_9 :  std_logic;
signal heap_bh6_w17_10 :  std_logic;
signal Y3X2_171_m5 :  std_logic_vector(5 downto 0);
signal PP171X2Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w15_10 :  std_logic;
signal heap_bh6_w16_10 :  std_logic;
signal heap_bh6_w17_11 :  std_logic;
signal heap_bh6_w18_11 :  std_logic;
signal heap_bh6_w19_11 :  std_logic;
signal heap_bh6_w20_12 :  std_logic;
signal Y3X3_171_m5 :  std_logic_vector(5 downto 0);
signal PP171X3Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w18_12 :  std_logic;
signal heap_bh6_w19_12 :  std_logic;
signal heap_bh6_w20_13 :  std_logic;
signal heap_bh6_w21_13 :  std_logic;
signal heap_bh6_w22_13 :  std_logic;
signal heap_bh6_w23_14 :  std_logic;
signal Y3X4_171_m5 :  std_logic_vector(5 downto 0);
signal PP171X4Y3_m5 :  std_logic_vector(5 downto 0);
signal heap_bh6_w21_14 :  std_logic;
signal heap_bh6_w22_14 :  std_logic;
signal heap_bh6_w23_15 :  std_logic;
signal heap_bh6_w24_16 :  std_logic;
signal heap_bh6_w25_16 :  std_logic;
signal heap_bh6_w26_17 :  std_logic;
signal DSP_bh6_ch0_0 :  std_logic_vector(40 downto 0);
signal heap_bh6_w125_0, heap_bh6_w125_0_d1 :  std_logic;
signal heap_bh6_w124_0, heap_bh6_w124_0_d1 :  std_logic;
signal heap_bh6_w123_0, heap_bh6_w123_0_d1 :  std_logic;
signal heap_bh6_w122_0, heap_bh6_w122_0_d1 :  std_logic;
signal heap_bh6_w121_0, heap_bh6_w121_0_d1 :  std_logic;
signal heap_bh6_w120_0, heap_bh6_w120_0_d1 :  std_logic;
signal heap_bh6_w119_0, heap_bh6_w119_0_d1 :  std_logic;
signal heap_bh6_w118_0, heap_bh6_w118_0_d1 :  std_logic;
signal heap_bh6_w117_0, heap_bh6_w117_0_d1 :  std_logic;
signal heap_bh6_w116_0, heap_bh6_w116_0_d1 :  std_logic;
signal heap_bh6_w115_0, heap_bh6_w115_0_d1 :  std_logic;
signal heap_bh6_w114_0, heap_bh6_w114_0_d1 :  std_logic;
signal heap_bh6_w113_0, heap_bh6_w113_0_d1 :  std_logic;
signal heap_bh6_w112_0, heap_bh6_w112_0_d1 :  std_logic;
signal heap_bh6_w111_0, heap_bh6_w111_0_d1 :  std_logic;
signal heap_bh6_w110_0, heap_bh6_w110_0_d1 :  std_logic;
signal heap_bh6_w109_0, heap_bh6_w109_0_d1 :  std_logic;
signal heap_bh6_w108_0 :  std_logic;
signal heap_bh6_w107_0 :  std_logic;
signal heap_bh6_w106_0 :  std_logic;
signal heap_bh6_w105_0 :  std_logic;
signal heap_bh6_w104_0 :  std_logic;
signal heap_bh6_w103_0 :  std_logic;
signal heap_bh6_w102_0 :  std_logic;
signal heap_bh6_w101_0 :  std_logic;
signal heap_bh6_w100_0 :  std_logic;
signal heap_bh6_w99_0 :  std_logic;
signal heap_bh6_w98_0 :  std_logic;
signal heap_bh6_w97_0 :  std_logic;
signal heap_bh6_w96_0 :  std_logic;
signal heap_bh6_w95_0 :  std_logic;
signal heap_bh6_w94_0 :  std_logic;
signal heap_bh6_w93_0 :  std_logic;
signal heap_bh6_w92_0 :  std_logic;
signal heap_bh6_w91_0 :  std_logic;
signal heap_bh6_w90_0 :  std_logic;
signal heap_bh6_w89_0 :  std_logic;
signal heap_bh6_w88_0 :  std_logic;
signal heap_bh6_w87_0 :  std_logic;
signal heap_bh6_w86_0 :  std_logic;
signal heap_bh6_w85_0 :  std_logic;
signal DSP_bh6_ch1_0 :  std_logic_vector(40 downto 0);
signal heap_bh6_w101_1 :  std_logic;
signal heap_bh6_w100_1 :  std_logic;
signal heap_bh6_w99_1 :  std_logic;
signal heap_bh6_w98_1 :  std_logic;
signal heap_bh6_w97_1 :  std_logic;
signal heap_bh6_w96_1 :  std_logic;
signal heap_bh6_w95_1 :  std_logic;
signal heap_bh6_w94_1 :  std_logic;
signal heap_bh6_w93_1 :  std_logic;
signal heap_bh6_w92_1 :  std_logic;
signal heap_bh6_w91_1 :  std_logic;
signal heap_bh6_w90_1 :  std_logic;
signal heap_bh6_w89_1 :  std_logic;
signal heap_bh6_w88_1 :  std_logic;
signal heap_bh6_w87_1 :  std_logic;
signal heap_bh6_w86_1 :  std_logic;
signal heap_bh6_w85_1 :  std_logic;
signal heap_bh6_w84_0 :  std_logic;
signal heap_bh6_w83_0 :  std_logic;
signal heap_bh6_w82_0 :  std_logic;
signal heap_bh6_w81_0 :  std_logic;
signal heap_bh6_w80_0 :  std_logic;
signal heap_bh6_w79_0 :  std_logic;
signal heap_bh6_w78_0 :  std_logic;
signal heap_bh6_w77_1 :  std_logic;
signal heap_bh6_w76_1 :  std_logic;
signal heap_bh6_w75_1 :  std_logic;
signal heap_bh6_w74_4 :  std_logic;
signal heap_bh6_w73_4 :  std_logic;
signal heap_bh6_w72_4 :  std_logic;
signal heap_bh6_w71_8 :  std_logic;
signal heap_bh6_w70_8 :  std_logic;
signal heap_bh6_w69_8 :  std_logic;
signal heap_bh6_w68_12 :  std_logic;
signal heap_bh6_w67_12 :  std_logic;
signal heap_bh6_w66_12 :  std_logic;
signal heap_bh6_w65_16 :  std_logic;
signal heap_bh6_w64_16 :  std_logic;
signal heap_bh6_w63_16 :  std_logic;
signal heap_bh6_w62_18 :  std_logic;
signal heap_bh6_w61_18 :  std_logic;
signal DSP_bh6_ch2_0 :  std_logic_vector(40 downto 0);
signal heap_bh6_w108_1 :  std_logic;
signal heap_bh6_w107_1 :  std_logic;
signal heap_bh6_w106_1 :  std_logic;
signal heap_bh6_w105_1 :  std_logic;
signal heap_bh6_w104_1 :  std_logic;
signal heap_bh6_w103_1 :  std_logic;
signal heap_bh6_w102_1 :  std_logic;
signal heap_bh6_w101_2 :  std_logic;
signal heap_bh6_w100_2 :  std_logic;
signal heap_bh6_w99_2 :  std_logic;
signal heap_bh6_w98_2 :  std_logic;
signal heap_bh6_w97_2 :  std_logic;
signal heap_bh6_w96_2 :  std_logic;
signal heap_bh6_w95_2 :  std_logic;
signal heap_bh6_w94_2 :  std_logic;
signal heap_bh6_w93_2 :  std_logic;
signal heap_bh6_w92_2 :  std_logic;
signal heap_bh6_w91_2 :  std_logic;
signal heap_bh6_w90_2 :  std_logic;
signal heap_bh6_w89_2 :  std_logic;
signal heap_bh6_w88_2 :  std_logic;
signal heap_bh6_w87_2 :  std_logic;
signal heap_bh6_w86_2 :  std_logic;
signal heap_bh6_w85_2 :  std_logic;
signal heap_bh6_w84_1 :  std_logic;
signal heap_bh6_w83_1 :  std_logic;
signal heap_bh6_w82_1 :  std_logic;
signal heap_bh6_w81_1 :  std_logic;
signal heap_bh6_w80_1 :  std_logic;
signal heap_bh6_w79_1 :  std_logic;
signal heap_bh6_w78_1 :  std_logic;
signal heap_bh6_w77_2 :  std_logic;
signal heap_bh6_w76_2 :  std_logic;
signal heap_bh6_w75_2 :  std_logic;
signal heap_bh6_w74_5 :  std_logic;
signal heap_bh6_w73_5 :  std_logic;
signal heap_bh6_w72_5 :  std_logic;
signal heap_bh6_w71_9 :  std_logic;
signal heap_bh6_w70_9 :  std_logic;
signal heap_bh6_w69_9 :  std_logic;
signal heap_bh6_w68_13 :  std_logic;
signal DSP_bh6_ch3_0 :  std_logic_vector(40 downto 0);
signal heap_bh6_w84_2 :  std_logic;
signal heap_bh6_w83_2 :  std_logic;
signal heap_bh6_w82_2 :  std_logic;
signal heap_bh6_w81_2 :  std_logic;
signal heap_bh6_w80_2 :  std_logic;
signal heap_bh6_w79_2 :  std_logic;
signal heap_bh6_w78_2 :  std_logic;
signal heap_bh6_w77_3 :  std_logic;
signal heap_bh6_w76_3 :  std_logic;
signal heap_bh6_w75_3 :  std_logic;
signal heap_bh6_w74_6 :  std_logic;
signal heap_bh6_w73_6 :  std_logic;
signal heap_bh6_w72_6 :  std_logic;
signal heap_bh6_w71_10 :  std_logic;
signal heap_bh6_w70_10 :  std_logic;
signal heap_bh6_w69_10 :  std_logic;
signal heap_bh6_w68_14 :  std_logic;
signal heap_bh6_w67_13 :  std_logic;
signal heap_bh6_w66_13 :  std_logic;
signal heap_bh6_w65_17 :  std_logic;
signal heap_bh6_w64_17 :  std_logic;
signal heap_bh6_w63_17 :  std_logic;
signal heap_bh6_w62_19 :  std_logic;
signal heap_bh6_w61_19 :  std_logic;
signal heap_bh6_w60_19 :  std_logic;
signal heap_bh6_w59_18 :  std_logic;
signal heap_bh6_w58_18 :  std_logic;
signal heap_bh6_w57_19 :  std_logic;
signal heap_bh6_w56_18 :  std_logic;
signal heap_bh6_w55_18 :  std_logic;
signal heap_bh6_w54_19 :  std_logic;
signal heap_bh6_w53_18 :  std_logic;
signal heap_bh6_w52_18 :  std_logic;
signal heap_bh6_w51_19 :  std_logic;
signal heap_bh6_w50_18 :  std_logic;
signal heap_bh6_w49_18 :  std_logic;
signal heap_bh6_w48_19 :  std_logic;
signal heap_bh6_w47_18 :  std_logic;
signal heap_bh6_w46_18 :  std_logic;
signal heap_bh6_w45_18 :  std_logic;
signal heap_bh6_w44_18 :  std_logic;
signal DSP_bh6_ch4_0 :  std_logic_vector(40 downto 0);
signal heap_bh6_w91_3 :  std_logic;
signal heap_bh6_w90_3 :  std_logic;
signal heap_bh6_w89_3 :  std_logic;
signal heap_bh6_w88_3 :  std_logic;
signal heap_bh6_w87_3 :  std_logic;
signal heap_bh6_w86_3 :  std_logic;
signal heap_bh6_w85_3 :  std_logic;
signal heap_bh6_w84_3 :  std_logic;
signal heap_bh6_w83_3 :  std_logic;
signal heap_bh6_w82_3 :  std_logic;
signal heap_bh6_w81_3 :  std_logic;
signal heap_bh6_w80_3 :  std_logic;
signal heap_bh6_w79_3 :  std_logic;
signal heap_bh6_w78_3 :  std_logic;
signal heap_bh6_w77_4 :  std_logic;
signal heap_bh6_w76_4 :  std_logic;
signal heap_bh6_w75_4 :  std_logic;
signal heap_bh6_w74_7 :  std_logic;
signal heap_bh6_w73_7 :  std_logic;
signal heap_bh6_w72_7 :  std_logic;
signal heap_bh6_w71_11 :  std_logic;
signal heap_bh6_w70_11 :  std_logic;
signal heap_bh6_w69_11 :  std_logic;
signal heap_bh6_w68_15 :  std_logic;
signal heap_bh6_w67_14 :  std_logic;
signal heap_bh6_w66_14 :  std_logic;
signal heap_bh6_w65_18 :  std_logic;
signal heap_bh6_w64_18 :  std_logic;
signal heap_bh6_w63_18 :  std_logic;
signal heap_bh6_w62_20 :  std_logic;
signal heap_bh6_w61_20 :  std_logic;
signal heap_bh6_w60_20 :  std_logic;
signal heap_bh6_w59_19 :  std_logic;
signal heap_bh6_w58_19 :  std_logic;
signal heap_bh6_w57_20 :  std_logic;
signal heap_bh6_w56_19 :  std_logic;
signal heap_bh6_w55_19 :  std_logic;
signal heap_bh6_w54_20 :  std_logic;
signal heap_bh6_w53_19 :  std_logic;
signal heap_bh6_w52_19 :  std_logic;
signal heap_bh6_w51_20 :  std_logic;
signal DSP_bh6_ch5_0 :  std_logic_vector(40 downto 0);
signal heap_bh6_w67_15 :  std_logic;
signal heap_bh6_w66_15 :  std_logic;
signal heap_bh6_w65_19 :  std_logic;
signal heap_bh6_w64_19 :  std_logic;
signal heap_bh6_w63_19 :  std_logic;
signal heap_bh6_w62_21 :  std_logic;
signal heap_bh6_w61_21 :  std_logic;
signal heap_bh6_w60_21 :  std_logic;
signal heap_bh6_w59_20 :  std_logic;
signal heap_bh6_w58_20 :  std_logic;
signal heap_bh6_w57_21 :  std_logic;
signal heap_bh6_w56_20 :  std_logic;
signal heap_bh6_w55_20 :  std_logic;
signal heap_bh6_w54_21 :  std_logic;
signal heap_bh6_w53_20 :  std_logic;
signal heap_bh6_w52_20 :  std_logic;
signal heap_bh6_w51_21 :  std_logic;
signal heap_bh6_w50_19 :  std_logic;
signal heap_bh6_w49_19 :  std_logic;
signal heap_bh6_w48_20 :  std_logic;
signal heap_bh6_w47_19 :  std_logic;
signal heap_bh6_w46_19 :  std_logic;
signal heap_bh6_w45_19 :  std_logic;
signal heap_bh6_w44_19 :  std_logic;
signal heap_bh6_w43_19 :  std_logic;
signal heap_bh6_w42_18 :  std_logic;
signal heap_bh6_w41_18 :  std_logic;
signal heap_bh6_w40_19 :  std_logic;
signal heap_bh6_w39_18 :  std_logic;
signal heap_bh6_w38_18 :  std_logic;
signal heap_bh6_w37_19 :  std_logic;
signal heap_bh6_w36_18 :  std_logic;
signal heap_bh6_w35_18 :  std_logic;
signal heap_bh6_w34_19 :  std_logic;
signal heap_bh6_w33_18 :  std_logic;
signal heap_bh6_w32_18 :  std_logic;
signal heap_bh6_w31_19 :  std_logic;
signal heap_bh6_w30_18 :  std_logic;
signal heap_bh6_w29_18 :  std_logic;
signal heap_bh6_w28_18 :  std_logic;
signal heap_bh6_w27_18 :  std_logic;
signal tempR_bh6_0, tempR_bh6_0_d1 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_0_0 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_0_0 :  std_logic_vector(2 downto 0);
signal heap_bh6_w9_7 :  std_logic;
signal heap_bh6_w10_7 :  std_logic;
signal heap_bh6_w11_7 :  std_logic;
signal CompressorIn_bh6_1_1 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_1_1 :  std_logic_vector(2 downto 0);
signal heap_bh6_w10_8 :  std_logic;
signal heap_bh6_w11_8 :  std_logic;
signal heap_bh6_w12_9 :  std_logic;
signal CompressorIn_bh6_2_2 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_2_2 :  std_logic_vector(2 downto 0);
signal heap_bh6_w11_9 :  std_logic;
signal heap_bh6_w12_10 :  std_logic;
signal heap_bh6_w13_9 :  std_logic;
signal CompressorIn_bh6_3_3 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_3_3 :  std_logic_vector(2 downto 0);
signal heap_bh6_w12_11 :  std_logic;
signal heap_bh6_w13_10 :  std_logic;
signal heap_bh6_w14_10 :  std_logic;
signal CompressorIn_bh6_4_4 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_4_4 :  std_logic_vector(2 downto 0);
signal heap_bh6_w13_11 :  std_logic;
signal heap_bh6_w14_11 :  std_logic;
signal heap_bh6_w15_11 :  std_logic;
signal CompressorIn_bh6_5_5 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_5_5 :  std_logic_vector(2 downto 0);
signal heap_bh6_w14_12 :  std_logic;
signal heap_bh6_w15_12 :  std_logic;
signal heap_bh6_w16_11 :  std_logic;
signal CompressorIn_bh6_6_6 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_6_6 :  std_logic_vector(2 downto 0);
signal heap_bh6_w15_13 :  std_logic;
signal heap_bh6_w16_12 :  std_logic;
signal heap_bh6_w17_12 :  std_logic;
signal CompressorIn_bh6_7_7 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_7_7 :  std_logic_vector(2 downto 0);
signal heap_bh6_w16_13 :  std_logic;
signal heap_bh6_w17_13 :  std_logic;
signal heap_bh6_w18_13 :  std_logic;
signal CompressorIn_bh6_8_8 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_8_8 :  std_logic_vector(2 downto 0);
signal heap_bh6_w17_14 :  std_logic;
signal heap_bh6_w18_14 :  std_logic;
signal heap_bh6_w19_13 :  std_logic;
signal CompressorIn_bh6_9_9 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_9_9 :  std_logic_vector(2 downto 0);
signal heap_bh6_w17_15 :  std_logic;
signal heap_bh6_w18_15 :  std_logic;
signal heap_bh6_w19_14 :  std_logic;
signal CompressorIn_bh6_10_10 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_10_10 :  std_logic_vector(2 downto 0);
signal heap_bh6_w18_16 :  std_logic;
signal heap_bh6_w19_15 :  std_logic;
signal heap_bh6_w20_14 :  std_logic;
signal CompressorIn_bh6_11_11 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_11_11 :  std_logic_vector(2 downto 0);
signal heap_bh6_w18_17 :  std_logic;
signal heap_bh6_w19_16 :  std_logic;
signal heap_bh6_w20_15 :  std_logic;
signal CompressorIn_bh6_12_12 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_12_12 :  std_logic_vector(2 downto 0);
signal heap_bh6_w19_17 :  std_logic;
signal heap_bh6_w20_16 :  std_logic;
signal heap_bh6_w21_15 :  std_logic;
signal CompressorIn_bh6_13_13 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_13_13 :  std_logic_vector(2 downto 0);
signal heap_bh6_w19_18 :  std_logic;
signal heap_bh6_w20_17 :  std_logic;
signal heap_bh6_w21_16 :  std_logic;
signal CompressorIn_bh6_14_14 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_14_14 :  std_logic_vector(2 downto 0);
signal heap_bh6_w20_18 :  std_logic;
signal heap_bh6_w21_17 :  std_logic;
signal heap_bh6_w22_15 :  std_logic;
signal CompressorIn_bh6_15_15 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_15_15 :  std_logic_vector(2 downto 0);
signal heap_bh6_w20_19 :  std_logic;
signal heap_bh6_w21_18 :  std_logic;
signal heap_bh6_w22_16 :  std_logic;
signal CompressorIn_bh6_16_16 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_16_16 :  std_logic_vector(2 downto 0);
signal heap_bh6_w21_19 :  std_logic;
signal heap_bh6_w22_17 :  std_logic;
signal heap_bh6_w23_16 :  std_logic;
signal CompressorIn_bh6_17_17 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_17_17 :  std_logic_vector(2 downto 0);
signal heap_bh6_w21_20 :  std_logic;
signal heap_bh6_w22_18 :  std_logic;
signal heap_bh6_w23_17 :  std_logic;
signal CompressorIn_bh6_18_18 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_18_18 :  std_logic_vector(2 downto 0);
signal heap_bh6_w22_19 :  std_logic;
signal heap_bh6_w23_18 :  std_logic;
signal heap_bh6_w24_17 :  std_logic;
signal CompressorIn_bh6_19_19 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_19_19 :  std_logic_vector(2 downto 0);
signal heap_bh6_w22_20 :  std_logic;
signal heap_bh6_w23_19 :  std_logic;
signal heap_bh6_w24_18 :  std_logic;
signal CompressorIn_bh6_20_20 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_20_20 :  std_logic_vector(2 downto 0);
signal heap_bh6_w23_20 :  std_logic;
signal heap_bh6_w24_19 :  std_logic;
signal heap_bh6_w25_17 :  std_logic;
signal CompressorIn_bh6_21_21 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_21_21 :  std_logic_vector(2 downto 0);
signal heap_bh6_w23_21 :  std_logic;
signal heap_bh6_w24_20 :  std_logic;
signal heap_bh6_w25_18 :  std_logic;
signal CompressorIn_bh6_22_22 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_22_22 :  std_logic_vector(2 downto 0);
signal heap_bh6_w24_21 :  std_logic;
signal heap_bh6_w25_19 :  std_logic;
signal heap_bh6_w26_18 :  std_logic;
signal CompressorIn_bh6_23_23 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_23_23 :  std_logic_vector(2 downto 0);
signal heap_bh6_w24_22 :  std_logic;
signal heap_bh6_w25_20 :  std_logic;
signal heap_bh6_w26_19 :  std_logic;
signal CompressorIn_bh6_24_24 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_24_24 :  std_logic_vector(2 downto 0);
signal heap_bh6_w25_21 :  std_logic;
signal heap_bh6_w26_20 :  std_logic;
signal heap_bh6_w27_19 :  std_logic;
signal CompressorIn_bh6_25_25 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_25_25 :  std_logic_vector(2 downto 0);
signal heap_bh6_w25_22 :  std_logic;
signal heap_bh6_w26_21 :  std_logic;
signal heap_bh6_w27_20 :  std_logic;
signal CompressorIn_bh6_26_26 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_26_26 :  std_logic_vector(2 downto 0);
signal heap_bh6_w26_22 :  std_logic;
signal heap_bh6_w27_21 :  std_logic;
signal heap_bh6_w28_19 :  std_logic;
signal CompressorIn_bh6_27_27 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_27_27 :  std_logic_vector(2 downto 0);
signal heap_bh6_w26_23 :  std_logic;
signal heap_bh6_w27_22 :  std_logic;
signal heap_bh6_w28_20 :  std_logic;
signal CompressorIn_bh6_28_28 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_28_28 :  std_logic_vector(2 downto 0);
signal heap_bh6_w26_24 :  std_logic;
signal heap_bh6_w27_23 :  std_logic;
signal heap_bh6_w28_21 :  std_logic;
signal CompressorIn_bh6_29_29 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_29_29 :  std_logic_vector(2 downto 0);
signal heap_bh6_w27_24 :  std_logic;
signal heap_bh6_w28_22 :  std_logic;
signal heap_bh6_w29_19 :  std_logic;
signal CompressorIn_bh6_30_30 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_30_30 :  std_logic_vector(2 downto 0);
signal heap_bh6_w27_25 :  std_logic;
signal heap_bh6_w28_23 :  std_logic;
signal heap_bh6_w29_20 :  std_logic;
signal CompressorIn_bh6_31_31 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_31_31 :  std_logic_vector(2 downto 0);
signal heap_bh6_w27_26 :  std_logic;
signal heap_bh6_w28_24 :  std_logic;
signal heap_bh6_w29_21 :  std_logic;
signal CompressorIn_bh6_32_32 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_32_32 :  std_logic_vector(2 downto 0);
signal heap_bh6_w28_25 :  std_logic;
signal heap_bh6_w29_22 :  std_logic;
signal heap_bh6_w30_19 :  std_logic;
signal CompressorIn_bh6_33_33 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_33_33 :  std_logic_vector(2 downto 0);
signal heap_bh6_w28_26 :  std_logic;
signal heap_bh6_w29_23 :  std_logic;
signal heap_bh6_w30_20 :  std_logic;
signal CompressorIn_bh6_34_34 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_34_34 :  std_logic_vector(2 downto 0);
signal heap_bh6_w28_27 :  std_logic;
signal heap_bh6_w29_24 :  std_logic;
signal heap_bh6_w30_21 :  std_logic;
signal CompressorIn_bh6_35_35 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_35_35 :  std_logic_vector(2 downto 0);
signal heap_bh6_w29_25 :  std_logic;
signal heap_bh6_w30_22 :  std_logic;
signal heap_bh6_w31_20 :  std_logic;
signal CompressorIn_bh6_36_36 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_36_36 :  std_logic_vector(2 downto 0);
signal heap_bh6_w29_26 :  std_logic;
signal heap_bh6_w30_23 :  std_logic;
signal heap_bh6_w31_21 :  std_logic;
signal CompressorIn_bh6_37_37 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_37_37 :  std_logic_vector(2 downto 0);
signal heap_bh6_w29_27 :  std_logic;
signal heap_bh6_w30_24 :  std_logic;
signal heap_bh6_w31_22 :  std_logic;
signal CompressorIn_bh6_38_38 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_38_38 :  std_logic_vector(2 downto 0);
signal heap_bh6_w30_25 :  std_logic;
signal heap_bh6_w31_23 :  std_logic;
signal heap_bh6_w32_19 :  std_logic;
signal CompressorIn_bh6_39_39 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_39_39 :  std_logic_vector(2 downto 0);
signal heap_bh6_w30_26 :  std_logic;
signal heap_bh6_w31_24 :  std_logic;
signal heap_bh6_w32_20 :  std_logic;
signal CompressorIn_bh6_40_40 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_40_40 :  std_logic_vector(2 downto 0);
signal heap_bh6_w30_27 :  std_logic;
signal heap_bh6_w31_25 :  std_logic;
signal heap_bh6_w32_21 :  std_logic;
signal CompressorIn_bh6_41_41 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_41_41 :  std_logic_vector(2 downto 0);
signal heap_bh6_w31_26 :  std_logic;
signal heap_bh6_w32_22 :  std_logic;
signal heap_bh6_w33_19 :  std_logic;
signal CompressorIn_bh6_42_42 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_42_42 :  std_logic_vector(2 downto 0);
signal heap_bh6_w31_27 :  std_logic;
signal heap_bh6_w32_23 :  std_logic;
signal heap_bh6_w33_20 :  std_logic;
signal CompressorIn_bh6_43_43 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_43_43 :  std_logic_vector(2 downto 0);
signal heap_bh6_w31_28 :  std_logic;
signal heap_bh6_w32_24 :  std_logic;
signal heap_bh6_w33_21 :  std_logic;
signal CompressorIn_bh6_44_44 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_44_44 :  std_logic_vector(2 downto 0);
signal heap_bh6_w32_25 :  std_logic;
signal heap_bh6_w33_22 :  std_logic;
signal heap_bh6_w34_20 :  std_logic;
signal CompressorIn_bh6_45_45 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_45_45 :  std_logic_vector(2 downto 0);
signal heap_bh6_w32_26 :  std_logic;
signal heap_bh6_w33_23 :  std_logic;
signal heap_bh6_w34_21 :  std_logic;
signal CompressorIn_bh6_46_46 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_46_46 :  std_logic_vector(2 downto 0);
signal heap_bh6_w32_27 :  std_logic;
signal heap_bh6_w33_24 :  std_logic;
signal heap_bh6_w34_22 :  std_logic;
signal CompressorIn_bh6_47_47 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_47_47 :  std_logic_vector(2 downto 0);
signal heap_bh6_w33_25 :  std_logic;
signal heap_bh6_w34_23 :  std_logic;
signal heap_bh6_w35_19 :  std_logic;
signal CompressorIn_bh6_48_48 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_48_48 :  std_logic_vector(2 downto 0);
signal heap_bh6_w33_26 :  std_logic;
signal heap_bh6_w34_24 :  std_logic;
signal heap_bh6_w35_20 :  std_logic;
signal CompressorIn_bh6_49_49 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_49_49 :  std_logic_vector(2 downto 0);
signal heap_bh6_w33_27 :  std_logic;
signal heap_bh6_w34_25 :  std_logic;
signal heap_bh6_w35_21 :  std_logic;
signal CompressorIn_bh6_50_50 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_50_50 :  std_logic_vector(2 downto 0);
signal heap_bh6_w34_26 :  std_logic;
signal heap_bh6_w35_22 :  std_logic;
signal heap_bh6_w36_19 :  std_logic;
signal CompressorIn_bh6_51_51 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_51_51 :  std_logic_vector(2 downto 0);
signal heap_bh6_w34_27 :  std_logic;
signal heap_bh6_w35_23 :  std_logic;
signal heap_bh6_w36_20 :  std_logic;
signal CompressorIn_bh6_52_52 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_52_52 :  std_logic_vector(2 downto 0);
signal heap_bh6_w34_28 :  std_logic;
signal heap_bh6_w35_24 :  std_logic;
signal heap_bh6_w36_21 :  std_logic;
signal CompressorIn_bh6_53_53 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_53_53 :  std_logic_vector(2 downto 0);
signal heap_bh6_w35_25 :  std_logic;
signal heap_bh6_w36_22 :  std_logic;
signal heap_bh6_w37_20 :  std_logic;
signal CompressorIn_bh6_54_54 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_54_54 :  std_logic_vector(2 downto 0);
signal heap_bh6_w35_26 :  std_logic;
signal heap_bh6_w36_23 :  std_logic;
signal heap_bh6_w37_21 :  std_logic;
signal CompressorIn_bh6_55_55 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_55_55 :  std_logic_vector(2 downto 0);
signal heap_bh6_w35_27 :  std_logic;
signal heap_bh6_w36_24 :  std_logic;
signal heap_bh6_w37_22 :  std_logic;
signal CompressorIn_bh6_56_56 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_56_56 :  std_logic_vector(2 downto 0);
signal heap_bh6_w36_25 :  std_logic;
signal heap_bh6_w37_23 :  std_logic;
signal heap_bh6_w38_19 :  std_logic;
signal CompressorIn_bh6_57_57 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_57_57 :  std_logic_vector(2 downto 0);
signal heap_bh6_w36_26 :  std_logic;
signal heap_bh6_w37_24 :  std_logic;
signal heap_bh6_w38_20 :  std_logic;
signal CompressorIn_bh6_58_58 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_58_58 :  std_logic_vector(2 downto 0);
signal heap_bh6_w36_27 :  std_logic;
signal heap_bh6_w37_25 :  std_logic;
signal heap_bh6_w38_21 :  std_logic;
signal CompressorIn_bh6_59_59 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_59_59 :  std_logic_vector(2 downto 0);
signal heap_bh6_w37_26 :  std_logic;
signal heap_bh6_w38_22 :  std_logic;
signal heap_bh6_w39_19 :  std_logic;
signal CompressorIn_bh6_60_60 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_60_60 :  std_logic_vector(2 downto 0);
signal heap_bh6_w37_27 :  std_logic;
signal heap_bh6_w38_23 :  std_logic;
signal heap_bh6_w39_20 :  std_logic;
signal CompressorIn_bh6_61_61 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_61_61 :  std_logic_vector(2 downto 0);
signal heap_bh6_w37_28 :  std_logic;
signal heap_bh6_w38_24 :  std_logic;
signal heap_bh6_w39_21 :  std_logic;
signal CompressorIn_bh6_62_62 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_62_62 :  std_logic_vector(2 downto 0);
signal heap_bh6_w38_25 :  std_logic;
signal heap_bh6_w39_22 :  std_logic;
signal heap_bh6_w40_20 :  std_logic;
signal CompressorIn_bh6_63_63 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_63_63 :  std_logic_vector(2 downto 0);
signal heap_bh6_w38_26 :  std_logic;
signal heap_bh6_w39_23 :  std_logic;
signal heap_bh6_w40_21 :  std_logic;
signal CompressorIn_bh6_64_64 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_64_64 :  std_logic_vector(2 downto 0);
signal heap_bh6_w38_27 :  std_logic;
signal heap_bh6_w39_24 :  std_logic;
signal heap_bh6_w40_22 :  std_logic;
signal CompressorIn_bh6_65_65 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_65_65 :  std_logic_vector(2 downto 0);
signal heap_bh6_w39_25 :  std_logic;
signal heap_bh6_w40_23 :  std_logic;
signal heap_bh6_w41_19 :  std_logic;
signal CompressorIn_bh6_66_66 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_66_66 :  std_logic_vector(2 downto 0);
signal heap_bh6_w39_26 :  std_logic;
signal heap_bh6_w40_24 :  std_logic;
signal heap_bh6_w41_20 :  std_logic;
signal CompressorIn_bh6_67_67 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_67_67 :  std_logic_vector(2 downto 0);
signal heap_bh6_w39_27 :  std_logic;
signal heap_bh6_w40_25 :  std_logic;
signal heap_bh6_w41_21 :  std_logic;
signal CompressorIn_bh6_68_68 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_68_68 :  std_logic_vector(2 downto 0);
signal heap_bh6_w40_26 :  std_logic;
signal heap_bh6_w41_22 :  std_logic;
signal heap_bh6_w42_19 :  std_logic;
signal CompressorIn_bh6_69_69 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_69_69 :  std_logic_vector(2 downto 0);
signal heap_bh6_w40_27 :  std_logic;
signal heap_bh6_w41_23 :  std_logic;
signal heap_bh6_w42_20 :  std_logic;
signal CompressorIn_bh6_70_70 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_70_70 :  std_logic_vector(2 downto 0);
signal heap_bh6_w40_28 :  std_logic;
signal heap_bh6_w41_24 :  std_logic;
signal heap_bh6_w42_21 :  std_logic;
signal CompressorIn_bh6_71_71 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_71_71 :  std_logic_vector(2 downto 0);
signal heap_bh6_w41_25 :  std_logic;
signal heap_bh6_w42_22 :  std_logic;
signal heap_bh6_w43_20 :  std_logic;
signal CompressorIn_bh6_72_72 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_72_72 :  std_logic_vector(2 downto 0);
signal heap_bh6_w41_26 :  std_logic;
signal heap_bh6_w42_23 :  std_logic;
signal heap_bh6_w43_21 :  std_logic;
signal CompressorIn_bh6_73_73 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_73_73 :  std_logic_vector(2 downto 0);
signal heap_bh6_w41_27 :  std_logic;
signal heap_bh6_w42_24 :  std_logic;
signal heap_bh6_w43_22 :  std_logic;
signal CompressorIn_bh6_74_74 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_74_74 :  std_logic_vector(2 downto 0);
signal heap_bh6_w42_25 :  std_logic;
signal heap_bh6_w43_23 :  std_logic;
signal heap_bh6_w44_20 :  std_logic;
signal CompressorIn_bh6_75_75 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_75_75 :  std_logic_vector(2 downto 0);
signal heap_bh6_w42_26 :  std_logic;
signal heap_bh6_w43_24 :  std_logic;
signal heap_bh6_w44_21 :  std_logic;
signal CompressorIn_bh6_76_76 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_76_76 :  std_logic_vector(2 downto 0);
signal heap_bh6_w42_27 :  std_logic;
signal heap_bh6_w43_25 :  std_logic;
signal heap_bh6_w44_22 :  std_logic;
signal CompressorIn_bh6_77_77 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_77_77 :  std_logic_vector(2 downto 0);
signal heap_bh6_w43_26 :  std_logic;
signal heap_bh6_w44_23 :  std_logic;
signal heap_bh6_w45_20 :  std_logic;
signal CompressorIn_bh6_78_78 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_78_78 :  std_logic_vector(2 downto 0);
signal heap_bh6_w43_27 :  std_logic;
signal heap_bh6_w44_24 :  std_logic;
signal heap_bh6_w45_21 :  std_logic;
signal CompressorIn_bh6_79_79 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_79_79 :  std_logic_vector(2 downto 0);
signal heap_bh6_w43_28 :  std_logic;
signal heap_bh6_w44_25 :  std_logic;
signal heap_bh6_w45_22 :  std_logic;
signal CompressorIn_bh6_80_80 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_80_80 :  std_logic_vector(2 downto 0);
signal heap_bh6_w44_26 :  std_logic;
signal heap_bh6_w45_23 :  std_logic;
signal heap_bh6_w46_20 :  std_logic;
signal CompressorIn_bh6_81_81 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_81_81 :  std_logic_vector(2 downto 0);
signal heap_bh6_w44_27 :  std_logic;
signal heap_bh6_w45_24 :  std_logic;
signal heap_bh6_w46_21 :  std_logic;
signal CompressorIn_bh6_82_82 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_82_82 :  std_logic_vector(2 downto 0);
signal heap_bh6_w44_28 :  std_logic;
signal heap_bh6_w45_25 :  std_logic;
signal heap_bh6_w46_22 :  std_logic;
signal CompressorIn_bh6_83_83 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_83_83 :  std_logic_vector(2 downto 0);
signal heap_bh6_w45_26 :  std_logic;
signal heap_bh6_w46_23 :  std_logic;
signal heap_bh6_w47_20 :  std_logic;
signal CompressorIn_bh6_84_84 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_84_84 :  std_logic_vector(2 downto 0);
signal heap_bh6_w45_27 :  std_logic;
signal heap_bh6_w46_24 :  std_logic;
signal heap_bh6_w47_21 :  std_logic;
signal CompressorIn_bh6_85_85 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_85_85 :  std_logic_vector(2 downto 0);
signal heap_bh6_w45_28 :  std_logic;
signal heap_bh6_w46_25 :  std_logic;
signal heap_bh6_w47_22 :  std_logic;
signal CompressorIn_bh6_86_86 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_86_86 :  std_logic_vector(2 downto 0);
signal heap_bh6_w46_26 :  std_logic;
signal heap_bh6_w47_23 :  std_logic;
signal heap_bh6_w48_21 :  std_logic;
signal CompressorIn_bh6_87_87 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_87_87 :  std_logic_vector(2 downto 0);
signal heap_bh6_w46_27 :  std_logic;
signal heap_bh6_w47_24 :  std_logic;
signal heap_bh6_w48_22 :  std_logic;
signal CompressorIn_bh6_88_88 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_88_88 :  std_logic_vector(2 downto 0);
signal heap_bh6_w46_28 :  std_logic;
signal heap_bh6_w47_25 :  std_logic;
signal heap_bh6_w48_23 :  std_logic;
signal CompressorIn_bh6_89_89 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_89_89 :  std_logic_vector(2 downto 0);
signal heap_bh6_w47_26 :  std_logic;
signal heap_bh6_w48_24 :  std_logic;
signal heap_bh6_w49_20 :  std_logic;
signal CompressorIn_bh6_90_90 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_90_90 :  std_logic_vector(2 downto 0);
signal heap_bh6_w47_27 :  std_logic;
signal heap_bh6_w48_25 :  std_logic;
signal heap_bh6_w49_21 :  std_logic;
signal CompressorIn_bh6_91_91 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_91_91 :  std_logic_vector(2 downto 0);
signal heap_bh6_w47_28 :  std_logic;
signal heap_bh6_w48_26 :  std_logic;
signal heap_bh6_w49_22 :  std_logic;
signal CompressorIn_bh6_92_92 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_92_92 :  std_logic_vector(2 downto 0);
signal heap_bh6_w48_27 :  std_logic;
signal heap_bh6_w49_23 :  std_logic;
signal heap_bh6_w50_20 :  std_logic;
signal CompressorIn_bh6_93_93 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_93_93 :  std_logic_vector(2 downto 0);
signal heap_bh6_w48_28 :  std_logic;
signal heap_bh6_w49_24 :  std_logic;
signal heap_bh6_w50_21 :  std_logic;
signal CompressorIn_bh6_94_94 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_94_94 :  std_logic_vector(2 downto 0);
signal heap_bh6_w48_29 :  std_logic;
signal heap_bh6_w49_25 :  std_logic;
signal heap_bh6_w50_22 :  std_logic;
signal CompressorIn_bh6_95_95 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_95_95 :  std_logic_vector(2 downto 0);
signal heap_bh6_w49_26 :  std_logic;
signal heap_bh6_w50_23 :  std_logic;
signal heap_bh6_w51_22 :  std_logic;
signal CompressorIn_bh6_96_96 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_96_96 :  std_logic_vector(2 downto 0);
signal heap_bh6_w49_27 :  std_logic;
signal heap_bh6_w50_24 :  std_logic;
signal heap_bh6_w51_23 :  std_logic;
signal CompressorIn_bh6_97_97 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_97_97 :  std_logic_vector(2 downto 0);
signal heap_bh6_w49_28 :  std_logic;
signal heap_bh6_w50_25 :  std_logic;
signal heap_bh6_w51_24 :  std_logic;
signal CompressorIn_bh6_98_98 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_98_98 :  std_logic_vector(2 downto 0);
signal heap_bh6_w50_26 :  std_logic;
signal heap_bh6_w51_25 :  std_logic;
signal heap_bh6_w52_21 :  std_logic;
signal CompressorIn_bh6_99_99 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_99_99 :  std_logic_vector(2 downto 0);
signal heap_bh6_w50_27 :  std_logic;
signal heap_bh6_w51_26 :  std_logic;
signal heap_bh6_w52_22 :  std_logic;
signal CompressorIn_bh6_100_100 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_100_100 :  std_logic_vector(2 downto 0);
signal heap_bh6_w50_28 :  std_logic;
signal heap_bh6_w51_27 :  std_logic;
signal heap_bh6_w52_23 :  std_logic;
signal CompressorIn_bh6_101_101 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_101_101 :  std_logic_vector(2 downto 0);
signal heap_bh6_w51_28 :  std_logic;
signal heap_bh6_w52_24 :  std_logic;
signal heap_bh6_w53_21 :  std_logic;
signal CompressorIn_bh6_102_102 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_102_102 :  std_logic_vector(2 downto 0);
signal heap_bh6_w51_29 :  std_logic;
signal heap_bh6_w52_25 :  std_logic;
signal heap_bh6_w53_22 :  std_logic;
signal CompressorIn_bh6_103_103 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_103_103 :  std_logic_vector(2 downto 0);
signal heap_bh6_w51_30 :  std_logic;
signal heap_bh6_w52_26 :  std_logic;
signal heap_bh6_w53_23 :  std_logic;
signal CompressorIn_bh6_104_104 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_104_104 :  std_logic_vector(2 downto 0);
signal heap_bh6_w52_27 :  std_logic;
signal heap_bh6_w53_24 :  std_logic;
signal heap_bh6_w54_22 :  std_logic;
signal CompressorIn_bh6_105_105 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_105_105 :  std_logic_vector(2 downto 0);
signal heap_bh6_w52_28 :  std_logic;
signal heap_bh6_w53_25 :  std_logic;
signal heap_bh6_w54_23 :  std_logic;
signal CompressorIn_bh6_106_106 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_106_106 :  std_logic_vector(2 downto 0);
signal heap_bh6_w52_29 :  std_logic;
signal heap_bh6_w53_26 :  std_logic;
signal heap_bh6_w54_24 :  std_logic;
signal CompressorIn_bh6_107_107 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_107_107 :  std_logic_vector(2 downto 0);
signal heap_bh6_w53_27 :  std_logic;
signal heap_bh6_w54_25 :  std_logic;
signal heap_bh6_w55_21 :  std_logic;
signal CompressorIn_bh6_108_108 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_108_108 :  std_logic_vector(2 downto 0);
signal heap_bh6_w53_28 :  std_logic;
signal heap_bh6_w54_26 :  std_logic;
signal heap_bh6_w55_22 :  std_logic;
signal CompressorIn_bh6_109_109 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_109_109 :  std_logic_vector(2 downto 0);
signal heap_bh6_w53_29 :  std_logic;
signal heap_bh6_w54_27 :  std_logic;
signal heap_bh6_w55_23 :  std_logic;
signal CompressorIn_bh6_110_110 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_110_110 :  std_logic_vector(2 downto 0);
signal heap_bh6_w54_28 :  std_logic;
signal heap_bh6_w55_24 :  std_logic;
signal heap_bh6_w56_21 :  std_logic;
signal CompressorIn_bh6_111_111 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_111_111 :  std_logic_vector(2 downto 0);
signal heap_bh6_w54_29 :  std_logic;
signal heap_bh6_w55_25 :  std_logic;
signal heap_bh6_w56_22 :  std_logic;
signal CompressorIn_bh6_112_112 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_112_112 :  std_logic_vector(2 downto 0);
signal heap_bh6_w54_30 :  std_logic;
signal heap_bh6_w55_26 :  std_logic;
signal heap_bh6_w56_23 :  std_logic;
signal CompressorIn_bh6_113_113 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_113_113 :  std_logic_vector(2 downto 0);
signal heap_bh6_w55_27 :  std_logic;
signal heap_bh6_w56_24 :  std_logic;
signal heap_bh6_w57_22 :  std_logic;
signal CompressorIn_bh6_114_114 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_114_114 :  std_logic_vector(2 downto 0);
signal heap_bh6_w55_28 :  std_logic;
signal heap_bh6_w56_25 :  std_logic;
signal heap_bh6_w57_23 :  std_logic;
signal CompressorIn_bh6_115_115 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_115_115 :  std_logic_vector(2 downto 0);
signal heap_bh6_w55_29 :  std_logic;
signal heap_bh6_w56_26 :  std_logic;
signal heap_bh6_w57_24 :  std_logic;
signal CompressorIn_bh6_116_116 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_116_116 :  std_logic_vector(2 downto 0);
signal heap_bh6_w56_27 :  std_logic;
signal heap_bh6_w57_25 :  std_logic;
signal heap_bh6_w58_21 :  std_logic;
signal CompressorIn_bh6_117_117 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_117_117 :  std_logic_vector(2 downto 0);
signal heap_bh6_w56_28 :  std_logic;
signal heap_bh6_w57_26 :  std_logic;
signal heap_bh6_w58_22 :  std_logic;
signal CompressorIn_bh6_118_118 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_118_118 :  std_logic_vector(2 downto 0);
signal heap_bh6_w56_29 :  std_logic;
signal heap_bh6_w57_27 :  std_logic;
signal heap_bh6_w58_23 :  std_logic;
signal CompressorIn_bh6_119_119 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_119_119 :  std_logic_vector(2 downto 0);
signal heap_bh6_w57_28 :  std_logic;
signal heap_bh6_w58_24 :  std_logic;
signal heap_bh6_w59_21 :  std_logic;
signal CompressorIn_bh6_120_120 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_120_120 :  std_logic_vector(2 downto 0);
signal heap_bh6_w57_29 :  std_logic;
signal heap_bh6_w58_25 :  std_logic;
signal heap_bh6_w59_22 :  std_logic;
signal CompressorIn_bh6_121_121 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_121_121 :  std_logic_vector(2 downto 0);
signal heap_bh6_w57_30 :  std_logic;
signal heap_bh6_w58_26 :  std_logic;
signal heap_bh6_w59_23 :  std_logic;
signal CompressorIn_bh6_122_122 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_122_122 :  std_logic_vector(2 downto 0);
signal heap_bh6_w58_27 :  std_logic;
signal heap_bh6_w59_24 :  std_logic;
signal heap_bh6_w60_22 :  std_logic;
signal CompressorIn_bh6_123_123 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_123_123 :  std_logic_vector(2 downto 0);
signal heap_bh6_w58_28 :  std_logic;
signal heap_bh6_w59_25 :  std_logic;
signal heap_bh6_w60_23 :  std_logic;
signal CompressorIn_bh6_124_124 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_124_124 :  std_logic_vector(2 downto 0);
signal heap_bh6_w58_29 :  std_logic;
signal heap_bh6_w59_26 :  std_logic;
signal heap_bh6_w60_24 :  std_logic;
signal CompressorIn_bh6_125_125 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_125_125 :  std_logic_vector(2 downto 0);
signal heap_bh6_w59_27 :  std_logic;
signal heap_bh6_w60_25 :  std_logic;
signal heap_bh6_w61_22 :  std_logic;
signal CompressorIn_bh6_126_126 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_126_126 :  std_logic_vector(2 downto 0);
signal heap_bh6_w59_28 :  std_logic;
signal heap_bh6_w60_26 :  std_logic;
signal heap_bh6_w61_23 :  std_logic;
signal CompressorIn_bh6_127_127 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_127_127 :  std_logic_vector(2 downto 0);
signal heap_bh6_w59_29 :  std_logic;
signal heap_bh6_w60_27 :  std_logic;
signal heap_bh6_w61_24 :  std_logic;
signal CompressorIn_bh6_128_128 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_128_128 :  std_logic_vector(2 downto 0);
signal heap_bh6_w60_28 :  std_logic;
signal heap_bh6_w61_25 :  std_logic;
signal heap_bh6_w62_22 :  std_logic;
signal CompressorIn_bh6_129_129 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_129_129 :  std_logic_vector(2 downto 0);
signal heap_bh6_w60_29 :  std_logic;
signal heap_bh6_w61_26 :  std_logic;
signal heap_bh6_w62_23 :  std_logic;
signal CompressorIn_bh6_130_130 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_130_130 :  std_logic_vector(2 downto 0);
signal heap_bh6_w60_30 :  std_logic;
signal heap_bh6_w61_27 :  std_logic;
signal heap_bh6_w62_24 :  std_logic;
signal CompressorIn_bh6_131_131 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_131_131 :  std_logic_vector(2 downto 0);
signal heap_bh6_w61_28 :  std_logic;
signal heap_bh6_w62_25 :  std_logic;
signal heap_bh6_w63_20 :  std_logic;
signal CompressorIn_bh6_132_132 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_132_132 :  std_logic_vector(2 downto 0);
signal heap_bh6_w61_29 :  std_logic;
signal heap_bh6_w62_26 :  std_logic;
signal heap_bh6_w63_21 :  std_logic;
signal CompressorIn_bh6_133_133 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_133_133 :  std_logic_vector(2 downto 0);
signal heap_bh6_w61_30 :  std_logic;
signal heap_bh6_w62_27 :  std_logic;
signal heap_bh6_w63_22 :  std_logic;
signal CompressorIn_bh6_134_134 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_134_134 :  std_logic_vector(2 downto 0);
signal heap_bh6_w62_28 :  std_logic;
signal heap_bh6_w63_23 :  std_logic;
signal heap_bh6_w64_20 :  std_logic;
signal CompressorIn_bh6_135_135 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_135_135 :  std_logic_vector(2 downto 0);
signal heap_bh6_w62_29 :  std_logic;
signal heap_bh6_w63_24 :  std_logic;
signal heap_bh6_w64_21 :  std_logic;
signal CompressorIn_bh6_136_136 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_136_136 :  std_logic_vector(2 downto 0);
signal heap_bh6_w62_30 :  std_logic;
signal heap_bh6_w63_25 :  std_logic;
signal heap_bh6_w64_22 :  std_logic;
signal CompressorIn_bh6_137_137 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_137_137 :  std_logic_vector(2 downto 0);
signal heap_bh6_w63_26 :  std_logic;
signal heap_bh6_w64_23 :  std_logic;
signal heap_bh6_w65_20 :  std_logic;
signal CompressorIn_bh6_138_138 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_138_138 :  std_logic_vector(2 downto 0);
signal heap_bh6_w63_27 :  std_logic;
signal heap_bh6_w64_24 :  std_logic;
signal heap_bh6_w65_21 :  std_logic;
signal CompressorIn_bh6_139_139 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_139_139 :  std_logic_vector(2 downto 0);
signal heap_bh6_w64_25 :  std_logic;
signal heap_bh6_w65_22 :  std_logic;
signal heap_bh6_w66_16 :  std_logic;
signal CompressorIn_bh6_140_140 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_140_140 :  std_logic_vector(2 downto 0);
signal heap_bh6_w64_26 :  std_logic;
signal heap_bh6_w65_23 :  std_logic;
signal heap_bh6_w66_17 :  std_logic;
signal CompressorIn_bh6_141_141 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_141_141 :  std_logic_vector(2 downto 0);
signal heap_bh6_w65_24 :  std_logic;
signal heap_bh6_w66_18 :  std_logic;
signal heap_bh6_w67_16 :  std_logic;
signal CompressorIn_bh6_142_142 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_142_142 :  std_logic_vector(2 downto 0);
signal heap_bh6_w65_25 :  std_logic;
signal heap_bh6_w66_19 :  std_logic;
signal heap_bh6_w67_17 :  std_logic;
signal CompressorIn_bh6_143_143 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_143_143 :  std_logic_vector(2 downto 0);
signal heap_bh6_w66_20 :  std_logic;
signal heap_bh6_w67_18 :  std_logic;
signal heap_bh6_w68_16 :  std_logic;
signal CompressorIn_bh6_144_144 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_144_144 :  std_logic_vector(2 downto 0);
signal heap_bh6_w66_21 :  std_logic;
signal heap_bh6_w67_19 :  std_logic;
signal heap_bh6_w68_17 :  std_logic;
signal CompressorIn_bh6_145_145 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_145_145 :  std_logic_vector(2 downto 0);
signal heap_bh6_w67_20 :  std_logic;
signal heap_bh6_w68_18 :  std_logic;
signal heap_bh6_w69_12 :  std_logic;
signal CompressorIn_bh6_146_146 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_146_146 :  std_logic_vector(2 downto 0);
signal heap_bh6_w67_21 :  std_logic;
signal heap_bh6_w68_19 :  std_logic;
signal heap_bh6_w69_13 :  std_logic;
signal CompressorIn_bh6_147_147 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_147_147 :  std_logic_vector(2 downto 0);
signal heap_bh6_w68_20 :  std_logic;
signal heap_bh6_w69_14 :  std_logic;
signal heap_bh6_w70_12 :  std_logic;
signal CompressorIn_bh6_148_148 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_148_148 :  std_logic_vector(2 downto 0);
signal heap_bh6_w68_21 :  std_logic;
signal heap_bh6_w69_15 :  std_logic;
signal heap_bh6_w70_13 :  std_logic;
signal CompressorIn_bh6_149_149 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_149_149 :  std_logic_vector(2 downto 0);
signal heap_bh6_w69_16 :  std_logic;
signal heap_bh6_w70_14 :  std_logic;
signal heap_bh6_w71_12 :  std_logic;
signal CompressorIn_bh6_150_150 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_150_150 :  std_logic_vector(2 downto 0);
signal heap_bh6_w70_15 :  std_logic;
signal heap_bh6_w71_13 :  std_logic;
signal heap_bh6_w72_8 :  std_logic;
signal CompressorIn_bh6_151_151 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_151_151 :  std_logic_vector(2 downto 0);
signal heap_bh6_w71_14 :  std_logic;
signal heap_bh6_w72_9 :  std_logic;
signal heap_bh6_w73_8 :  std_logic;
signal CompressorIn_bh6_152_152 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_152_153 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_152_152 :  std_logic_vector(2 downto 0);
signal heap_bh6_w6_5, heap_bh6_w6_5_d1 :  std_logic;
signal heap_bh6_w7_5 :  std_logic;
signal heap_bh6_w8_5, heap_bh6_w8_5_d1 :  std_logic;
signal CompressorIn_bh6_153_154 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_153_155 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_153_153 :  std_logic_vector(2 downto 0);
signal heap_bh6_w7_6 :  std_logic;
signal heap_bh6_w8_6 :  std_logic;
signal heap_bh6_w9_8 :  std_logic;
signal CompressorIn_bh6_154_156 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_154_157 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_154_154 :  std_logic_vector(2 downto 0);
signal heap_bh6_w8_7 :  std_logic;
signal heap_bh6_w9_9 :  std_logic;
signal heap_bh6_w10_9 :  std_logic;
signal CompressorIn_bh6_155_158 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_155_159 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_155_155 :  std_logic_vector(2 downto 0);
signal heap_bh6_w14_13 :  std_logic;
signal heap_bh6_w15_14 :  std_logic;
signal heap_bh6_w16_14 :  std_logic;
signal CompressorIn_bh6_156_160 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_156_161 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_156_156 :  std_logic_vector(2 downto 0);
signal heap_bh6_w15_15 :  std_logic;
signal heap_bh6_w16_15 :  std_logic;
signal heap_bh6_w17_16 :  std_logic;
signal CompressorIn_bh6_157_162 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_157_163 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_157_157 :  std_logic_vector(2 downto 0);
signal heap_bh6_w23_22 :  std_logic;
signal heap_bh6_w24_23 :  std_logic;
signal heap_bh6_w25_23 :  std_logic;
signal CompressorIn_bh6_158_164 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_158_165 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_158_158 :  std_logic_vector(2 downto 0);
signal heap_bh6_w24_24 :  std_logic;
signal heap_bh6_w25_24 :  std_logic;
signal heap_bh6_w26_25 :  std_logic;
signal CompressorIn_bh6_159_166 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_159_167 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_159_159 :  std_logic_vector(2 downto 0);
signal heap_bh6_w63_28 :  std_logic;
signal heap_bh6_w64_27 :  std_logic;
signal heap_bh6_w65_26 :  std_logic;
signal CompressorIn_bh6_160_168 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_160_169 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_160_160 :  std_logic_vector(2 downto 0);
signal heap_bh6_w72_10 :  std_logic;
signal heap_bh6_w73_9 :  std_logic;
signal heap_bh6_w74_8 :  std_logic;
signal CompressorIn_bh6_161_170 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_161_171 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_161_161 :  std_logic_vector(2 downto 0);
signal heap_bh6_w74_9 :  std_logic;
signal heap_bh6_w75_5 :  std_logic;
signal heap_bh6_w76_5 :  std_logic;
signal CompressorIn_bh6_162_172 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_162_162 :  std_logic_vector(2 downto 0);
signal heap_bh6_w16_16 :  std_logic;
signal heap_bh6_w17_17 :  std_logic;
signal heap_bh6_w18_18 :  std_logic;
signal CompressorIn_bh6_163_173 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_163_163 :  std_logic_vector(2 downto 0);
signal heap_bh6_w25_25 :  std_logic;
signal heap_bh6_w26_26 :  std_logic;
signal heap_bh6_w27_27 :  std_logic;
signal CompressorIn_bh6_164_174 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_164_164 :  std_logic_vector(2 downto 0);
signal heap_bh6_w65_27 :  std_logic;
signal heap_bh6_w66_22 :  std_logic;
signal heap_bh6_w67_22 :  std_logic;
signal CompressorIn_bh6_165_175 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_165_176 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_165_165 :  std_logic_vector(2 downto 0);
signal heap_bh6_w3_3 :  std_logic;
signal heap_bh6_w4_3, heap_bh6_w4_3_d1 :  std_logic;
signal heap_bh6_w5_3, heap_bh6_w5_3_d1 :  std_logic;
signal CompressorIn_bh6_166_177 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_166_178 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_166_166 :  std_logic_vector(2 downto 0);
signal heap_bh6_w12_12 :  std_logic;
signal heap_bh6_w13_12 :  std_logic;
signal heap_bh6_w14_14 :  std_logic;
signal CompressorIn_bh6_167_179 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_167_180 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_167_167 :  std_logic_vector(2 downto 0);
signal heap_bh6_w21_21 :  std_logic;
signal heap_bh6_w22_21 :  std_logic;
signal heap_bh6_w23_23 :  std_logic;
signal CompressorIn_bh6_168_181 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_168_182 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_168_168 :  std_logic_vector(2 downto 0);
signal heap_bh6_w5_4, heap_bh6_w5_4_d1 :  std_logic;
signal heap_bh6_w6_6, heap_bh6_w6_6_d1 :  std_logic;
signal heap_bh6_w7_7 :  std_logic;
signal CompressorIn_bh6_169_183 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_169_169 :  std_logic_vector(1 downto 0);
signal heap_bh6_w64_28 :  std_logic;
signal heap_bh6_w65_28 :  std_logic;
signal CompressorIn_bh6_170_184 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_170_170 :  std_logic_vector(1 downto 0);
signal heap_bh6_w73_10 :  std_logic;
signal heap_bh6_w74_10 :  std_logic;
signal tempR_bh6_1, tempR_bh6_1_d1 :  std_logic;
signal CompressorIn_bh6_171_185 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_171_171 :  std_logic_vector(2 downto 0);
signal heap_bh6_w16_17 :  std_logic;
signal heap_bh6_w17_18, heap_bh6_w17_18_d1 :  std_logic;
signal heap_bh6_w18_19 :  std_logic;
signal CompressorIn_bh6_172_186 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_172_172 :  std_logic_vector(2 downto 0);
signal heap_bh6_w17_19 :  std_logic;
signal heap_bh6_w18_20 :  std_logic;
signal heap_bh6_w19_19 :  std_logic;
signal CompressorIn_bh6_173_187 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_173_173 :  std_logic_vector(2 downto 0);
signal heap_bh6_w18_21 :  std_logic;
signal heap_bh6_w19_20 :  std_logic;
signal heap_bh6_w20_20 :  std_logic;
signal CompressorIn_bh6_174_188 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_174_174 :  std_logic_vector(2 downto 0);
signal heap_bh6_w19_21 :  std_logic;
signal heap_bh6_w20_21 :  std_logic;
signal heap_bh6_w21_22 :  std_logic;
signal CompressorIn_bh6_175_189 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_175_175 :  std_logic_vector(2 downto 0);
signal heap_bh6_w20_22 :  std_logic;
signal heap_bh6_w21_23 :  std_logic;
signal heap_bh6_w22_22 :  std_logic;
signal CompressorIn_bh6_176_190 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_176_176 :  std_logic_vector(2 downto 0);
signal heap_bh6_w21_24 :  std_logic;
signal heap_bh6_w22_23 :  std_logic;
signal heap_bh6_w23_24 :  std_logic;
signal CompressorIn_bh6_177_191 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_177_177 :  std_logic_vector(2 downto 0);
signal heap_bh6_w22_24 :  std_logic;
signal heap_bh6_w23_25 :  std_logic;
signal heap_bh6_w24_25 :  std_logic;
signal CompressorIn_bh6_178_192 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_178_178 :  std_logic_vector(2 downto 0);
signal heap_bh6_w23_26 :  std_logic;
signal heap_bh6_w24_26 :  std_logic;
signal heap_bh6_w25_26 :  std_logic;
signal CompressorIn_bh6_179_193 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_179_179 :  std_logic_vector(2 downto 0);
signal heap_bh6_w24_27 :  std_logic;
signal heap_bh6_w25_27 :  std_logic;
signal heap_bh6_w26_27 :  std_logic;
signal CompressorIn_bh6_180_194 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_180_180 :  std_logic_vector(2 downto 0);
signal heap_bh6_w25_28 :  std_logic;
signal heap_bh6_w26_28 :  std_logic;
signal heap_bh6_w27_28 :  std_logic;
signal CompressorIn_bh6_181_195 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_181_181 :  std_logic_vector(2 downto 0);
signal heap_bh6_w26_29 :  std_logic;
signal heap_bh6_w27_29 :  std_logic;
signal heap_bh6_w28_28 :  std_logic;
signal CompressorIn_bh6_182_196 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_182_182 :  std_logic_vector(2 downto 0);
signal heap_bh6_w27_30 :  std_logic;
signal heap_bh6_w28_29 :  std_logic;
signal heap_bh6_w29_28 :  std_logic;
signal CompressorIn_bh6_183_197 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_183_183 :  std_logic_vector(2 downto 0);
signal heap_bh6_w28_30 :  std_logic;
signal heap_bh6_w29_29 :  std_logic;
signal heap_bh6_w30_28 :  std_logic;
signal CompressorIn_bh6_184_198 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_184_184 :  std_logic_vector(2 downto 0);
signal heap_bh6_w29_30 :  std_logic;
signal heap_bh6_w30_29 :  std_logic;
signal heap_bh6_w31_29 :  std_logic;
signal CompressorIn_bh6_185_199 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_185_185 :  std_logic_vector(2 downto 0);
signal heap_bh6_w30_30 :  std_logic;
signal heap_bh6_w31_30 :  std_logic;
signal heap_bh6_w32_28 :  std_logic;
signal CompressorIn_bh6_186_200 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_186_186 :  std_logic_vector(2 downto 0);
signal heap_bh6_w31_31 :  std_logic;
signal heap_bh6_w32_29 :  std_logic;
signal heap_bh6_w33_28 :  std_logic;
signal CompressorIn_bh6_187_201 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_187_187 :  std_logic_vector(2 downto 0);
signal heap_bh6_w32_30 :  std_logic;
signal heap_bh6_w33_29 :  std_logic;
signal heap_bh6_w34_29 :  std_logic;
signal CompressorIn_bh6_188_202 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_188_188 :  std_logic_vector(2 downto 0);
signal heap_bh6_w33_30 :  std_logic;
signal heap_bh6_w34_30 :  std_logic;
signal heap_bh6_w35_28 :  std_logic;
signal CompressorIn_bh6_189_203 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_189_189 :  std_logic_vector(2 downto 0);
signal heap_bh6_w34_31 :  std_logic;
signal heap_bh6_w35_29 :  std_logic;
signal heap_bh6_w36_28 :  std_logic;
signal CompressorIn_bh6_190_204 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_190_190 :  std_logic_vector(2 downto 0);
signal heap_bh6_w35_30 :  std_logic;
signal heap_bh6_w36_29 :  std_logic;
signal heap_bh6_w37_29 :  std_logic;
signal CompressorIn_bh6_191_205 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_191_191 :  std_logic_vector(2 downto 0);
signal heap_bh6_w36_30 :  std_logic;
signal heap_bh6_w37_30 :  std_logic;
signal heap_bh6_w38_28 :  std_logic;
signal CompressorIn_bh6_192_206 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_192_192 :  std_logic_vector(2 downto 0);
signal heap_bh6_w37_31 :  std_logic;
signal heap_bh6_w38_29 :  std_logic;
signal heap_bh6_w39_28 :  std_logic;
signal CompressorIn_bh6_193_207 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_193_193 :  std_logic_vector(2 downto 0);
signal heap_bh6_w38_30 :  std_logic;
signal heap_bh6_w39_29 :  std_logic;
signal heap_bh6_w40_29 :  std_logic;
signal CompressorIn_bh6_194_208 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_194_194 :  std_logic_vector(2 downto 0);
signal heap_bh6_w39_30 :  std_logic;
signal heap_bh6_w40_30 :  std_logic;
signal heap_bh6_w41_28 :  std_logic;
signal CompressorIn_bh6_195_209 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_195_195 :  std_logic_vector(2 downto 0);
signal heap_bh6_w40_31 :  std_logic;
signal heap_bh6_w41_29 :  std_logic;
signal heap_bh6_w42_28 :  std_logic;
signal CompressorIn_bh6_196_210 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_196_196 :  std_logic_vector(2 downto 0);
signal heap_bh6_w41_30 :  std_logic;
signal heap_bh6_w42_29 :  std_logic;
signal heap_bh6_w43_29 :  std_logic;
signal CompressorIn_bh6_197_211 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_197_197 :  std_logic_vector(2 downto 0);
signal heap_bh6_w42_30 :  std_logic;
signal heap_bh6_w43_30 :  std_logic;
signal heap_bh6_w44_29 :  std_logic;
signal CompressorIn_bh6_198_212 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_198_198 :  std_logic_vector(2 downto 0);
signal heap_bh6_w43_31 :  std_logic;
signal heap_bh6_w44_30 :  std_logic;
signal heap_bh6_w45_29 :  std_logic;
signal CompressorIn_bh6_199_213 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_199_199 :  std_logic_vector(2 downto 0);
signal heap_bh6_w44_31 :  std_logic;
signal heap_bh6_w45_30 :  std_logic;
signal heap_bh6_w46_29 :  std_logic;
signal CompressorIn_bh6_200_214 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_200_200 :  std_logic_vector(2 downto 0);
signal heap_bh6_w45_31 :  std_logic;
signal heap_bh6_w46_30 :  std_logic;
signal heap_bh6_w47_29 :  std_logic;
signal CompressorIn_bh6_201_215 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_201_201 :  std_logic_vector(2 downto 0);
signal heap_bh6_w46_31 :  std_logic;
signal heap_bh6_w47_30 :  std_logic;
signal heap_bh6_w48_30 :  std_logic;
signal CompressorIn_bh6_202_216 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_202_202 :  std_logic_vector(2 downto 0);
signal heap_bh6_w47_31 :  std_logic;
signal heap_bh6_w48_31 :  std_logic;
signal heap_bh6_w49_29 :  std_logic;
signal CompressorIn_bh6_203_217 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_203_203 :  std_logic_vector(2 downto 0);
signal heap_bh6_w48_32 :  std_logic;
signal heap_bh6_w49_30 :  std_logic;
signal heap_bh6_w50_29 :  std_logic;
signal CompressorIn_bh6_204_218 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_204_204 :  std_logic_vector(2 downto 0);
signal heap_bh6_w49_31 :  std_logic;
signal heap_bh6_w50_30 :  std_logic;
signal heap_bh6_w51_31 :  std_logic;
signal CompressorIn_bh6_205_219 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_205_205 :  std_logic_vector(2 downto 0);
signal heap_bh6_w50_31 :  std_logic;
signal heap_bh6_w51_32 :  std_logic;
signal heap_bh6_w52_30 :  std_logic;
signal CompressorIn_bh6_206_220 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_206_206 :  std_logic_vector(2 downto 0);
signal heap_bh6_w51_33 :  std_logic;
signal heap_bh6_w52_31 :  std_logic;
signal heap_bh6_w53_30 :  std_logic;
signal CompressorIn_bh6_207_221 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_207_207 :  std_logic_vector(2 downto 0);
signal heap_bh6_w52_32 :  std_logic;
signal heap_bh6_w53_31 :  std_logic;
signal heap_bh6_w54_31 :  std_logic;
signal CompressorIn_bh6_208_222 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_208_208 :  std_logic_vector(2 downto 0);
signal heap_bh6_w53_32 :  std_logic;
signal heap_bh6_w54_32 :  std_logic;
signal heap_bh6_w55_30 :  std_logic;
signal CompressorIn_bh6_209_223 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_209_209 :  std_logic_vector(2 downto 0);
signal heap_bh6_w54_33 :  std_logic;
signal heap_bh6_w55_31 :  std_logic;
signal heap_bh6_w56_30 :  std_logic;
signal CompressorIn_bh6_210_224 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_210_210 :  std_logic_vector(2 downto 0);
signal heap_bh6_w55_32 :  std_logic;
signal heap_bh6_w56_31 :  std_logic;
signal heap_bh6_w57_31 :  std_logic;
signal CompressorIn_bh6_211_225 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_211_211 :  std_logic_vector(2 downto 0);
signal heap_bh6_w56_32 :  std_logic;
signal heap_bh6_w57_32 :  std_logic;
signal heap_bh6_w58_30 :  std_logic;
signal CompressorIn_bh6_212_226 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_212_212 :  std_logic_vector(2 downto 0);
signal heap_bh6_w57_33 :  std_logic;
signal heap_bh6_w58_31 :  std_logic;
signal heap_bh6_w59_30 :  std_logic;
signal CompressorIn_bh6_213_227 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_213_213 :  std_logic_vector(2 downto 0);
signal heap_bh6_w58_32 :  std_logic;
signal heap_bh6_w59_31 :  std_logic;
signal heap_bh6_w60_31 :  std_logic;
signal CompressorIn_bh6_214_228 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_214_214 :  std_logic_vector(2 downto 0);
signal heap_bh6_w59_32 :  std_logic;
signal heap_bh6_w60_32 :  std_logic;
signal heap_bh6_w61_31 :  std_logic;
signal CompressorIn_bh6_215_229 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_215_215 :  std_logic_vector(2 downto 0);
signal heap_bh6_w60_33 :  std_logic;
signal heap_bh6_w61_32 :  std_logic;
signal heap_bh6_w62_31 :  std_logic;
signal CompressorIn_bh6_216_230 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_216_216 :  std_logic_vector(2 downto 0);
signal heap_bh6_w61_33 :  std_logic;
signal heap_bh6_w62_32 :  std_logic;
signal heap_bh6_w63_29 :  std_logic;
signal CompressorIn_bh6_217_231 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_217_217 :  std_logic_vector(2 downto 0);
signal heap_bh6_w62_33 :  std_logic;
signal heap_bh6_w63_30 :  std_logic;
signal heap_bh6_w64_29 :  std_logic;
signal CompressorIn_bh6_218_232 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_218_218 :  std_logic_vector(2 downto 0);
signal heap_bh6_w63_31 :  std_logic;
signal heap_bh6_w64_30 :  std_logic;
signal heap_bh6_w65_29 :  std_logic;
signal CompressorIn_bh6_219_233 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_219_219 :  std_logic_vector(2 downto 0);
signal heap_bh6_w64_31 :  std_logic;
signal heap_bh6_w65_30 :  std_logic;
signal heap_bh6_w66_23 :  std_logic;
signal CompressorIn_bh6_220_234 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_220_220 :  std_logic_vector(2 downto 0);
signal heap_bh6_w65_31 :  std_logic;
signal heap_bh6_w66_24 :  std_logic;
signal heap_bh6_w67_23 :  std_logic;
signal CompressorIn_bh6_221_235 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_221_221 :  std_logic_vector(2 downto 0);
signal heap_bh6_w66_25 :  std_logic;
signal heap_bh6_w67_24 :  std_logic;
signal heap_bh6_w68_22 :  std_logic;
signal CompressorIn_bh6_222_236 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_222_222 :  std_logic_vector(2 downto 0);
signal heap_bh6_w67_25 :  std_logic;
signal heap_bh6_w68_23 :  std_logic;
signal heap_bh6_w69_17 :  std_logic;
signal CompressorIn_bh6_223_237 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_223_223 :  std_logic_vector(2 downto 0);
signal heap_bh6_w68_24 :  std_logic;
signal heap_bh6_w69_18 :  std_logic;
signal heap_bh6_w70_16 :  std_logic;
signal CompressorIn_bh6_224_238 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_224_224 :  std_logic_vector(2 downto 0);
signal heap_bh6_w69_19 :  std_logic;
signal heap_bh6_w70_17 :  std_logic;
signal heap_bh6_w71_15 :  std_logic;
signal CompressorIn_bh6_225_239 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_225_225 :  std_logic_vector(2 downto 0);
signal heap_bh6_w70_18 :  std_logic;
signal heap_bh6_w71_16 :  std_logic;
signal heap_bh6_w72_11 :  std_logic;
signal CompressorIn_bh6_226_240 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_226_241 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_226_226 :  std_logic_vector(2 downto 0);
signal heap_bh6_w10_10, heap_bh6_w10_10_d1 :  std_logic;
signal heap_bh6_w11_10, heap_bh6_w11_10_d1 :  std_logic;
signal heap_bh6_w12_13 :  std_logic;
signal CompressorIn_bh6_227_242 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_227_243 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_227_227 :  std_logic_vector(2 downto 0);
signal heap_bh6_w12_14 :  std_logic;
signal heap_bh6_w13_13 :  std_logic;
signal heap_bh6_w14_15 :  std_logic;
signal CompressorIn_bh6_228_244 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_228_245 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_228_228 :  std_logic_vector(2 downto 0);
signal heap_bh6_w13_14 :  std_logic;
signal heap_bh6_w14_16 :  std_logic;
signal heap_bh6_w15_16 :  std_logic;
signal CompressorIn_bh6_229_246 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_229_247 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_229_229 :  std_logic_vector(2 downto 0);
signal heap_bh6_w14_17 :  std_logic;
signal heap_bh6_w15_17 :  std_logic;
signal heap_bh6_w16_18 :  std_logic;
signal CompressorIn_bh6_230_248 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_230_249 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_230_230 :  std_logic_vector(2 downto 0);
signal heap_bh6_w31_32 :  std_logic;
signal heap_bh6_w32_31 :  std_logic;
signal heap_bh6_w33_31 :  std_logic;
signal CompressorIn_bh6_231_250 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_231_251 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_231_231 :  std_logic_vector(2 downto 0);
signal heap_bh6_w34_32 :  std_logic;
signal heap_bh6_w35_31 :  std_logic;
signal heap_bh6_w36_31 :  std_logic;
signal CompressorIn_bh6_232_252 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_232_253 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_232_232 :  std_logic_vector(2 downto 0);
signal heap_bh6_w37_32 :  std_logic;
signal heap_bh6_w38_31 :  std_logic;
signal heap_bh6_w39_31 :  std_logic;
signal CompressorIn_bh6_233_254 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_233_255 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_233_233 :  std_logic_vector(2 downto 0);
signal heap_bh6_w40_32 :  std_logic;
signal heap_bh6_w41_31 :  std_logic;
signal heap_bh6_w42_31 :  std_logic;
signal CompressorIn_bh6_234_256 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_234_257 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_234_234 :  std_logic_vector(2 downto 0);
signal heap_bh6_w43_32 :  std_logic;
signal heap_bh6_w44_32 :  std_logic;
signal heap_bh6_w45_32 :  std_logic;
signal CompressorIn_bh6_235_258 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_235_259 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_235_235 :  std_logic_vector(2 downto 0);
signal heap_bh6_w48_33 :  std_logic;
signal heap_bh6_w49_32 :  std_logic;
signal heap_bh6_w50_32 :  std_logic;
signal CompressorIn_bh6_236_260 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_236_261 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_236_236 :  std_logic_vector(2 downto 0);
signal heap_bh6_w51_34 :  std_logic;
signal heap_bh6_w52_33 :  std_logic;
signal heap_bh6_w53_33 :  std_logic;
signal CompressorIn_bh6_237_262 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_237_263 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_237_237 :  std_logic_vector(2 downto 0);
signal heap_bh6_w54_34 :  std_logic;
signal heap_bh6_w55_33 :  std_logic;
signal heap_bh6_w56_33 :  std_logic;
signal CompressorIn_bh6_238_264 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_238_265 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_238_238 :  std_logic_vector(2 downto 0);
signal heap_bh6_w57_34 :  std_logic;
signal heap_bh6_w58_33 :  std_logic;
signal heap_bh6_w59_33 :  std_logic;
signal CompressorIn_bh6_239_266 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_239_267 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_239_239 :  std_logic_vector(2 downto 0);
signal heap_bh6_w60_34 :  std_logic;
signal heap_bh6_w61_34 :  std_logic;
signal heap_bh6_w62_34 :  std_logic;
signal CompressorIn_bh6_240_268 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_240_269 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_240_240 :  std_logic_vector(2 downto 0);
signal heap_bh6_w71_17 :  std_logic;
signal heap_bh6_w72_12 :  std_logic;
signal heap_bh6_w73_11 :  std_logic;
signal CompressorIn_bh6_241_270 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_241_241 :  std_logic_vector(2 downto 0);
signal heap_bh6_w15_18, heap_bh6_w15_18_d1 :  std_logic;
signal heap_bh6_w16_19 :  std_logic;
signal heap_bh6_w17_20 :  std_logic;
signal CompressorIn_bh6_242_271 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_242_272 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_242_242 :  std_logic_vector(2 downto 0);
signal heap_bh6_w7_8, heap_bh6_w7_8_d1 :  std_logic;
signal heap_bh6_w8_8, heap_bh6_w8_8_d1 :  std_logic;
signal heap_bh6_w9_10, heap_bh6_w9_10_d1 :  std_logic;
signal CompressorIn_bh6_243_273 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_243_274 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_243_243 :  std_logic_vector(2 downto 0);
signal heap_bh6_w25_29 :  std_logic;
signal heap_bh6_w26_30 :  std_logic;
signal heap_bh6_w27_31 :  std_logic;
signal CompressorIn_bh6_244_275 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_244_276 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_244_244 :  std_logic_vector(2 downto 0);
signal heap_bh6_w27_32 :  std_logic;
signal heap_bh6_w28_31 :  std_logic;
signal heap_bh6_w29_31 :  std_logic;
signal CompressorIn_bh6_245_277 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_245_278 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_245_245 :  std_logic_vector(2 downto 0);
signal heap_bh6_w29_32 :  std_logic;
signal heap_bh6_w30_31 :  std_logic;
signal heap_bh6_w31_33 :  std_logic;
signal CompressorIn_bh6_246_279 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_246_280 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_246_246 :  std_logic_vector(2 downto 0);
signal heap_bh6_w45_33 :  std_logic;
signal heap_bh6_w46_32 :  std_logic;
signal heap_bh6_w47_32 :  std_logic;
signal CompressorIn_bh6_247_281 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_247_282 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_247_247 :  std_logic_vector(2 downto 0);
signal heap_bh6_w62_35 :  std_logic;
signal heap_bh6_w63_32 :  std_logic;
signal heap_bh6_w64_32 :  std_logic;
signal CompressorIn_bh6_248_283 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_248_284 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_248_248 :  std_logic_vector(2 downto 0);
signal heap_bh6_w64_33 :  std_logic;
signal heap_bh6_w65_32 :  std_logic;
signal heap_bh6_w66_26 :  std_logic;
signal CompressorIn_bh6_249_285 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_249_286 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_249_249 :  std_logic_vector(2 downto 0);
signal heap_bh6_w73_12 :  std_logic;
signal heap_bh6_w74_11 :  std_logic;
signal heap_bh6_w75_6 :  std_logic;
signal CompressorIn_bh6_250_287 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_250_250 :  std_logic_vector(1 downto 0);
signal heap_bh6_w9_11, heap_bh6_w9_11_d1 :  std_logic;
signal heap_bh6_w10_11, heap_bh6_w10_11_d1 :  std_logic;
signal CompressorIn_bh6_251_288 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_251_251 :  std_logic_vector(1 downto 0);
signal heap_bh6_w11_11, heap_bh6_w11_11_d1 :  std_logic;
signal heap_bh6_w12_15 :  std_logic;
signal CompressorIn_bh6_252_289 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_252_252 :  std_logic_vector(1 downto 0);
signal heap_bh6_w33_32 :  std_logic;
signal heap_bh6_w34_33 :  std_logic;
signal CompressorIn_bh6_253_290 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_253_253 :  std_logic_vector(1 downto 0);
signal heap_bh6_w36_32 :  std_logic;
signal heap_bh6_w37_33 :  std_logic;
signal CompressorIn_bh6_254_291 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_254_254 :  std_logic_vector(1 downto 0);
signal heap_bh6_w39_32 :  std_logic;
signal heap_bh6_w40_33 :  std_logic;
signal CompressorIn_bh6_255_292 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_255_255 :  std_logic_vector(1 downto 0);
signal heap_bh6_w42_32 :  std_logic;
signal heap_bh6_w43_33 :  std_logic;
signal CompressorIn_bh6_256_293 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_256_256 :  std_logic_vector(1 downto 0);
signal heap_bh6_w47_33 :  std_logic;
signal heap_bh6_w48_34 :  std_logic;
signal CompressorIn_bh6_257_294 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_257_257 :  std_logic_vector(1 downto 0);
signal heap_bh6_w50_33 :  std_logic;
signal heap_bh6_w51_35 :  std_logic;
signal CompressorIn_bh6_258_295 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_258_258 :  std_logic_vector(1 downto 0);
signal heap_bh6_w53_34 :  std_logic;
signal heap_bh6_w54_35 :  std_logic;
signal CompressorIn_bh6_259_296 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_259_259 :  std_logic_vector(1 downto 0);
signal heap_bh6_w56_34 :  std_logic;
signal heap_bh6_w57_35 :  std_logic;
signal CompressorIn_bh6_260_297 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_260_260 :  std_logic_vector(1 downto 0);
signal heap_bh6_w59_34 :  std_logic;
signal heap_bh6_w60_35 :  std_logic;
signal CompressorIn_bh6_261_298 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_261_261 :  std_logic_vector(2 downto 0);
signal heap_bh6_w32_32 :  std_logic;
signal heap_bh6_w33_33 :  std_logic;
signal heap_bh6_w34_34 :  std_logic;
signal CompressorIn_bh6_262_299 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_262_262 :  std_logic_vector(2 downto 0);
signal heap_bh6_w35_32 :  std_logic;
signal heap_bh6_w36_33 :  std_logic;
signal heap_bh6_w37_34 :  std_logic;
signal CompressorIn_bh6_263_300 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_263_263 :  std_logic_vector(2 downto 0);
signal heap_bh6_w38_32 :  std_logic;
signal heap_bh6_w39_33 :  std_logic;
signal heap_bh6_w40_34 :  std_logic;
signal CompressorIn_bh6_264_301 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_264_264 :  std_logic_vector(2 downto 0);
signal heap_bh6_w41_32 :  std_logic;
signal heap_bh6_w42_33 :  std_logic;
signal heap_bh6_w43_34 :  std_logic;
signal CompressorIn_bh6_265_302 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_265_265 :  std_logic_vector(2 downto 0);
signal heap_bh6_w44_33 :  std_logic;
signal heap_bh6_w45_34 :  std_logic;
signal heap_bh6_w46_33 :  std_logic;
signal CompressorIn_bh6_266_303 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_266_266 :  std_logic_vector(2 downto 0);
signal heap_bh6_w49_33 :  std_logic;
signal heap_bh6_w50_34 :  std_logic;
signal heap_bh6_w51_36 :  std_logic;
signal CompressorIn_bh6_267_304 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_267_267 :  std_logic_vector(2 downto 0);
signal heap_bh6_w52_34 :  std_logic;
signal heap_bh6_w53_35 :  std_logic;
signal heap_bh6_w54_36 :  std_logic;
signal CompressorIn_bh6_268_305 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_268_268 :  std_logic_vector(2 downto 0);
signal heap_bh6_w55_34 :  std_logic;
signal heap_bh6_w56_35 :  std_logic;
signal heap_bh6_w57_36 :  std_logic;
signal CompressorIn_bh6_269_306 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_269_269 :  std_logic_vector(2 downto 0);
signal heap_bh6_w58_34 :  std_logic;
signal heap_bh6_w59_35 :  std_logic;
signal heap_bh6_w60_36 :  std_logic;
signal CompressorIn_bh6_270_307 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_270_270 :  std_logic_vector(2 downto 0);
signal heap_bh6_w61_35 :  std_logic;
signal heap_bh6_w62_36 :  std_logic;
signal heap_bh6_w63_33 :  std_logic;
signal CompressorIn_bh6_271_308 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_271_309 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_271_271 :  std_logic_vector(2 downto 0);
signal heap_bh6_w18_22, heap_bh6_w18_22_d1 :  std_logic;
signal heap_bh6_w19_22, heap_bh6_w19_22_d1 :  std_logic;
signal heap_bh6_w20_23 :  std_logic;
signal CompressorIn_bh6_272_310 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_272_311 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_272_272 :  std_logic_vector(2 downto 0);
signal heap_bh6_w20_24 :  std_logic;
signal heap_bh6_w21_25, heap_bh6_w21_25_d1 :  std_logic;
signal heap_bh6_w22_25 :  std_logic;
signal CompressorIn_bh6_273_312 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_273_313 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_273_273 :  std_logic_vector(2 downto 0);
signal heap_bh6_w22_26 :  std_logic;
signal heap_bh6_w23_27, heap_bh6_w23_27_d1 :  std_logic;
signal heap_bh6_w24_28 :  std_logic;
signal CompressorIn_bh6_274_314 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_274_315 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_274_274 :  std_logic_vector(2 downto 0);
signal heap_bh6_w23_28 :  std_logic;
signal heap_bh6_w24_29 :  std_logic;
signal heap_bh6_w25_30, heap_bh6_w25_30_d1 :  std_logic;
signal CompressorIn_bh6_275_316 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_275_317 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_275_275 :  std_logic_vector(2 downto 0);
signal heap_bh6_w24_30 :  std_logic;
signal heap_bh6_w25_31 :  std_logic;
signal heap_bh6_w26_31 :  std_logic;
signal CompressorIn_bh6_276_318 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_276_319 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_276_276 :  std_logic_vector(2 downto 0);
signal heap_bh6_w26_32 :  std_logic;
signal heap_bh6_w27_33 :  std_logic;
signal heap_bh6_w28_32 :  std_logic;
signal CompressorIn_bh6_277_320 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_277_321 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_277_277 :  std_logic_vector(2 downto 0);
signal heap_bh6_w27_34 :  std_logic;
signal heap_bh6_w28_33 :  std_logic;
signal heap_bh6_w29_33 :  std_logic;
signal CompressorIn_bh6_278_322 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_278_323 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_278_278 :  std_logic_vector(2 downto 0);
signal heap_bh6_w28_34 :  std_logic;
signal heap_bh6_w29_34 :  std_logic;
signal heap_bh6_w30_32 :  std_logic;
signal CompressorIn_bh6_279_324 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_279_325 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_279_279 :  std_logic_vector(2 downto 0);
signal heap_bh6_w29_35 :  std_logic;
signal heap_bh6_w30_33 :  std_logic;
signal heap_bh6_w31_34 :  std_logic;
signal CompressorIn_bh6_280_326 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_280_327 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_280_280 :  std_logic_vector(2 downto 0);
signal heap_bh6_w30_34 :  std_logic;
signal heap_bh6_w31_35 :  std_logic;
signal heap_bh6_w32_33 :  std_logic;
signal CompressorIn_bh6_281_328 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_281_329 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_281_281 :  std_logic_vector(2 downto 0);
signal heap_bh6_w33_34 :  std_logic;
signal heap_bh6_w34_35 :  std_logic;
signal heap_bh6_w35_33 :  std_logic;
signal CompressorIn_bh6_282_330 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_282_331 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_282_282 :  std_logic_vector(2 downto 0);
signal heap_bh6_w36_34 :  std_logic;
signal heap_bh6_w37_35 :  std_logic;
signal heap_bh6_w38_33 :  std_logic;
signal CompressorIn_bh6_283_332 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_283_333 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_283_283 :  std_logic_vector(2 downto 0);
signal heap_bh6_w39_34 :  std_logic;
signal heap_bh6_w40_35 :  std_logic;
signal heap_bh6_w41_33 :  std_logic;
signal CompressorIn_bh6_284_334 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_284_335 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_284_284 :  std_logic_vector(2 downto 0);
signal heap_bh6_w42_34 :  std_logic;
signal heap_bh6_w43_35 :  std_logic;
signal heap_bh6_w44_34 :  std_logic;
signal CompressorIn_bh6_285_336 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_285_337 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_285_285 :  std_logic_vector(2 downto 0);
signal heap_bh6_w45_35 :  std_logic;
signal heap_bh6_w46_34 :  std_logic;
signal heap_bh6_w47_34 :  std_logic;
signal CompressorIn_bh6_286_338 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_286_339 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_286_286 :  std_logic_vector(2 downto 0);
signal heap_bh6_w46_35 :  std_logic;
signal heap_bh6_w47_35 :  std_logic;
signal heap_bh6_w48_35 :  std_logic;
signal CompressorIn_bh6_287_340 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_287_341 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_287_287 :  std_logic_vector(2 downto 0);
signal heap_bh6_w47_36 :  std_logic;
signal heap_bh6_w48_36 :  std_logic;
signal heap_bh6_w49_34 :  std_logic;
signal CompressorIn_bh6_288_342 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_288_343 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_288_288 :  std_logic_vector(2 downto 0);
signal heap_bh6_w50_35 :  std_logic;
signal heap_bh6_w51_37 :  std_logic;
signal heap_bh6_w52_35 :  std_logic;
signal CompressorIn_bh6_289_344 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_289_345 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_289_289 :  std_logic_vector(2 downto 0);
signal heap_bh6_w53_36 :  std_logic;
signal heap_bh6_w54_37 :  std_logic;
signal heap_bh6_w55_35 :  std_logic;
signal CompressorIn_bh6_290_346 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_290_347 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_290_290 :  std_logic_vector(2 downto 0);
signal heap_bh6_w56_36 :  std_logic;
signal heap_bh6_w57_37 :  std_logic;
signal heap_bh6_w58_35 :  std_logic;
signal CompressorIn_bh6_291_348 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_291_349 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_291_291 :  std_logic_vector(2 downto 0);
signal heap_bh6_w59_36 :  std_logic;
signal heap_bh6_w60_37 :  std_logic;
signal heap_bh6_w61_36 :  std_logic;
signal CompressorIn_bh6_292_350 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_292_351 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_292_292 :  std_logic_vector(2 downto 0);
signal heap_bh6_w62_37 :  std_logic;
signal heap_bh6_w63_34 :  std_logic;
signal heap_bh6_w64_34 :  std_logic;
signal CompressorIn_bh6_293_352 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_293_353 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_293_293 :  std_logic_vector(2 downto 0);
signal heap_bh6_w63_35 :  std_logic;
signal heap_bh6_w64_35 :  std_logic;
signal heap_bh6_w65_33 :  std_logic;
signal CompressorIn_bh6_294_354 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_294_355 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_294_294 :  std_logic_vector(2 downto 0);
signal heap_bh6_w64_36 :  std_logic;
signal heap_bh6_w65_34 :  std_logic;
signal heap_bh6_w66_27 :  std_logic;
signal CompressorIn_bh6_295_356 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_295_357 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_295_295 :  std_logic_vector(2 downto 0);
signal heap_bh6_w65_35 :  std_logic;
signal heap_bh6_w66_28 :  std_logic;
signal heap_bh6_w67_26 :  std_logic;
signal CompressorIn_bh6_296_358 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_296_359 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_296_296 :  std_logic_vector(2 downto 0);
signal heap_bh6_w66_29 :  std_logic;
signal heap_bh6_w67_27 :  std_logic;
signal heap_bh6_w68_25 :  std_logic;
signal CompressorIn_bh6_297_360 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_297_361 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_297_297 :  std_logic_vector(2 downto 0);
signal heap_bh6_w69_20 :  std_logic;
signal heap_bh6_w70_19 :  std_logic;
signal heap_bh6_w71_18 :  std_logic;
signal CompressorIn_bh6_298_362 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_298_363 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_298_298 :  std_logic_vector(2 downto 0);
signal heap_bh6_w71_19 :  std_logic;
signal heap_bh6_w72_13 :  std_logic;
signal heap_bh6_w73_13 :  std_logic;
signal CompressorIn_bh6_299_364 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_299_299 :  std_logic_vector(2 downto 0);
signal heap_bh6_w31_36 :  std_logic;
signal heap_bh6_w32_34 :  std_logic;
signal heap_bh6_w33_35 :  std_logic;
signal CompressorIn_bh6_300_365 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_300_300 :  std_logic_vector(2 downto 0);
signal heap_bh6_w34_36 :  std_logic;
signal heap_bh6_w35_34 :  std_logic;
signal heap_bh6_w36_35 :  std_logic;
signal CompressorIn_bh6_301_366 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_301_301 :  std_logic_vector(2 downto 0);
signal heap_bh6_w37_36 :  std_logic;
signal heap_bh6_w38_34 :  std_logic;
signal heap_bh6_w39_35 :  std_logic;
signal CompressorIn_bh6_302_367 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_302_302 :  std_logic_vector(2 downto 0);
signal heap_bh6_w40_36 :  std_logic;
signal heap_bh6_w41_34 :  std_logic;
signal heap_bh6_w42_35 :  std_logic;
signal CompressorIn_bh6_303_368 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_303_303 :  std_logic_vector(2 downto 0);
signal heap_bh6_w43_36 :  std_logic;
signal heap_bh6_w44_35 :  std_logic;
signal heap_bh6_w45_36 :  std_logic;
signal CompressorIn_bh6_304_369 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_304_304 :  std_logic_vector(2 downto 0);
signal heap_bh6_w48_37 :  std_logic;
signal heap_bh6_w49_35 :  std_logic;
signal heap_bh6_w50_36 :  std_logic;
signal CompressorIn_bh6_305_370 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_305_305 :  std_logic_vector(2 downto 0);
signal heap_bh6_w51_38 :  std_logic;
signal heap_bh6_w52_36 :  std_logic;
signal heap_bh6_w53_37 :  std_logic;
signal CompressorIn_bh6_306_371 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_306_306 :  std_logic_vector(2 downto 0);
signal heap_bh6_w54_38 :  std_logic;
signal heap_bh6_w55_36 :  std_logic;
signal heap_bh6_w56_37 :  std_logic;
signal CompressorIn_bh6_307_372 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_307_307 :  std_logic_vector(2 downto 0);
signal heap_bh6_w57_38 :  std_logic;
signal heap_bh6_w58_36 :  std_logic;
signal heap_bh6_w59_37 :  std_logic;
signal CompressorIn_bh6_308_373 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_308_308 :  std_logic_vector(2 downto 0);
signal heap_bh6_w60_38 :  std_logic;
signal heap_bh6_w61_37 :  std_logic;
signal heap_bh6_w62_38 :  std_logic;
signal CompressorIn_bh6_309_374 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_309_375 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_309_309 :  std_logic_vector(2 downto 0);
signal heap_bh6_w12_16, heap_bh6_w12_16_d1 :  std_logic;
signal heap_bh6_w13_15, heap_bh6_w13_15_d1 :  std_logic;
signal heap_bh6_w14_18, heap_bh6_w14_18_d1 :  std_logic;
signal CompressorIn_bh6_310_376 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_310_377 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_310_310 :  std_logic_vector(2 downto 0);
signal heap_bh6_w14_19, heap_bh6_w14_19_d1 :  std_logic;
signal heap_bh6_w15_19, heap_bh6_w15_19_d1 :  std_logic;
signal heap_bh6_w16_20, heap_bh6_w16_20_d1 :  std_logic;
signal CompressorIn_bh6_311_378 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_311_379 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_311_311 :  std_logic_vector(2 downto 0);
signal heap_bh6_w16_21, heap_bh6_w16_21_d1 :  std_logic;
signal heap_bh6_w17_21, heap_bh6_w17_21_d1 :  std_logic;
signal heap_bh6_w18_23, heap_bh6_w18_23_d1 :  std_logic;
signal CompressorIn_bh6_312_380 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_312_381 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_312_312 :  std_logic_vector(2 downto 0);
signal heap_bh6_w67_28 :  std_logic;
signal heap_bh6_w68_26 :  std_logic;
signal heap_bh6_w69_21 :  std_logic;
signal CompressorIn_bh6_313_382 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_313_383 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_313_313 :  std_logic_vector(2 downto 0);
signal heap_bh6_w72_14 :  std_logic;
signal heap_bh6_w73_14 :  std_logic;
signal heap_bh6_w74_12 :  std_logic;
signal CompressorIn_bh6_314_384 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_314_385 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_314_314 :  std_logic_vector(2 downto 0);
signal heap_bh6_w19_23, heap_bh6_w19_23_d1 :  std_logic;
signal heap_bh6_w20_25 :  std_logic;
signal heap_bh6_w21_26 :  std_logic;
signal CompressorIn_bh6_315_386 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_315_387 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_315_315 :  std_logic_vector(2 downto 0);
signal heap_bh6_w21_27 :  std_logic;
signal heap_bh6_w22_27 :  std_logic;
signal heap_bh6_w23_29 :  std_logic;
signal CompressorIn_bh6_316_388 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_316_389 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_316_316 :  std_logic_vector(2 downto 0);
signal heap_bh6_w25_32 :  std_logic;
signal heap_bh6_w26_33 :  std_logic;
signal heap_bh6_w27_35 :  std_logic;
signal CompressorIn_bh6_317_390 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_317_317 :  std_logic_vector(2 downto 0);
signal heap_bh6_w45_37 :  std_logic;
signal heap_bh6_w46_36 :  std_logic;
signal heap_bh6_w47_37 :  std_logic;
signal CompressorIn_bh6_318_391 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_318_318 :  std_logic_vector(2 downto 0);
signal heap_bh6_w50_37 :  std_logic;
signal heap_bh6_w51_39 :  std_logic;
signal heap_bh6_w52_37 :  std_logic;
signal CompressorIn_bh6_319_392 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_319_319 :  std_logic_vector(2 downto 0);
signal heap_bh6_w51_40 :  std_logic;
signal heap_bh6_w52_38 :  std_logic;
signal heap_bh6_w53_38 :  std_logic;
signal CompressorIn_bh6_320_393 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_320_320 :  std_logic_vector(2 downto 0);
signal heap_bh6_w52_39 :  std_logic;
signal heap_bh6_w53_39 :  std_logic;
signal heap_bh6_w54_39 :  std_logic;
signal CompressorIn_bh6_321_394 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_321_321 :  std_logic_vector(2 downto 0);
signal heap_bh6_w53_40 :  std_logic;
signal heap_bh6_w54_40 :  std_logic;
signal heap_bh6_w55_37 :  std_logic;
signal CompressorIn_bh6_322_395 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_322_322 :  std_logic_vector(2 downto 0);
signal heap_bh6_w54_41 :  std_logic;
signal heap_bh6_w55_38 :  std_logic;
signal heap_bh6_w56_38 :  std_logic;
signal CompressorIn_bh6_323_396 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_323_323 :  std_logic_vector(2 downto 0);
signal heap_bh6_w55_39 :  std_logic;
signal heap_bh6_w56_39 :  std_logic;
signal heap_bh6_w57_39 :  std_logic;
signal CompressorIn_bh6_324_397 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_324_324 :  std_logic_vector(2 downto 0);
signal heap_bh6_w56_40 :  std_logic;
signal heap_bh6_w57_40 :  std_logic;
signal heap_bh6_w58_37 :  std_logic;
signal CompressorIn_bh6_325_398 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_325_325 :  std_logic_vector(2 downto 0);
signal heap_bh6_w57_41 :  std_logic;
signal heap_bh6_w58_38 :  std_logic;
signal heap_bh6_w59_38 :  std_logic;
signal CompressorIn_bh6_326_399 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_326_326 :  std_logic_vector(2 downto 0);
signal heap_bh6_w58_39 :  std_logic;
signal heap_bh6_w59_39 :  std_logic;
signal heap_bh6_w60_39 :  std_logic;
signal CompressorIn_bh6_327_400 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_327_327 :  std_logic_vector(2 downto 0);
signal heap_bh6_w59_40 :  std_logic;
signal heap_bh6_w60_40 :  std_logic;
signal heap_bh6_w61_38 :  std_logic;
signal CompressorIn_bh6_328_401 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_328_328 :  std_logic_vector(2 downto 0);
signal heap_bh6_w60_41 :  std_logic;
signal heap_bh6_w61_39 :  std_logic;
signal heap_bh6_w62_39 :  std_logic;
signal CompressorIn_bh6_329_402 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_329_329 :  std_logic_vector(2 downto 0);
signal heap_bh6_w61_40 :  std_logic;
signal heap_bh6_w62_40 :  std_logic;
signal heap_bh6_w63_36 :  std_logic;
signal CompressorIn_bh6_330_403 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_330_330 :  std_logic_vector(2 downto 0);
signal heap_bh6_w62_41 :  std_logic;
signal heap_bh6_w63_37 :  std_logic;
signal heap_bh6_w64_37 :  std_logic;
signal CompressorIn_bh6_331_404 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_331_331 :  std_logic_vector(2 downto 0);
signal heap_bh6_w63_38 :  std_logic;
signal heap_bh6_w64_38 :  std_logic;
signal heap_bh6_w65_36 :  std_logic;
signal CompressorIn_bh6_332_405 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_332_332 :  std_logic_vector(2 downto 0);
signal heap_bh6_w64_39 :  std_logic;
signal heap_bh6_w65_37 :  std_logic;
signal heap_bh6_w66_30 :  std_logic;
signal CompressorIn_bh6_333_406 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_333_333 :  std_logic_vector(2 downto 0);
signal heap_bh6_w65_38 :  std_logic;
signal heap_bh6_w66_31 :  std_logic;
signal heap_bh6_w67_29 :  std_logic;
signal CompressorIn_bh6_334_407 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_334_334 :  std_logic_vector(2 downto 0);
signal heap_bh6_w66_32 :  std_logic;
signal heap_bh6_w67_30 :  std_logic;
signal heap_bh6_w68_27 :  std_logic;
signal CompressorIn_bh6_335_408 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_335_335 :  std_logic_vector(2 downto 0);
signal heap_bh6_w67_31 :  std_logic;
signal heap_bh6_w68_28 :  std_logic;
signal heap_bh6_w69_22 :  std_logic;
signal CompressorIn_bh6_336_409 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_336_336 :  std_logic_vector(2 downto 0);
signal heap_bh6_w68_29 :  std_logic;
signal heap_bh6_w69_23 :  std_logic;
signal heap_bh6_w70_20 :  std_logic;
signal CompressorIn_bh6_337_410 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_337_337 :  std_logic_vector(2 downto 0);
signal heap_bh6_w69_24 :  std_logic;
signal heap_bh6_w70_21 :  std_logic;
signal heap_bh6_w71_20 :  std_logic;
signal CompressorIn_bh6_338_411 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_338_338 :  std_logic_vector(2 downto 0);
signal heap_bh6_w70_22 :  std_logic;
signal heap_bh6_w71_21 :  std_logic;
signal heap_bh6_w72_15 :  std_logic;
signal CompressorIn_bh6_339_412 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_339_339 :  std_logic_vector(2 downto 0);
signal heap_bh6_w71_22 :  std_logic;
signal heap_bh6_w72_16 :  std_logic;
signal heap_bh6_w73_15 :  std_logic;
signal CompressorIn_bh6_340_413 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_340_340 :  std_logic_vector(2 downto 0);
signal heap_bh6_w72_17 :  std_logic;
signal heap_bh6_w73_16 :  std_logic;
signal heap_bh6_w74_13 :  std_logic;
signal CompressorIn_bh6_341_414 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_341_341 :  std_logic_vector(2 downto 0);
signal heap_bh6_w73_17 :  std_logic;
signal heap_bh6_w74_14 :  std_logic;
signal heap_bh6_w75_7 :  std_logic;
signal CompressorIn_bh6_342_415 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_342_342 :  std_logic_vector(2 downto 0);
signal heap_bh6_w74_15 :  std_logic;
signal heap_bh6_w75_8 :  std_logic;
signal heap_bh6_w76_6 :  std_logic;
signal CompressorIn_bh6_343_416 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_343_343 :  std_logic_vector(2 downto 0);
signal heap_bh6_w75_9 :  std_logic;
signal heap_bh6_w76_7 :  std_logic;
signal heap_bh6_w77_5 :  std_logic;
signal CompressorIn_bh6_344_417 :  std_logic_vector(5 downto 0);
signal CompressorOut_bh6_344_344 :  std_logic_vector(2 downto 0);
signal heap_bh6_w76_8 :  std_logic;
signal heap_bh6_w77_6 :  std_logic;
signal heap_bh6_w78_4 :  std_logic;
signal CompressorIn_bh6_345_418 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_345_419 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_345_345 :  std_logic_vector(2 downto 0);
signal heap_bh6_w27_36, heap_bh6_w27_36_d1 :  std_logic;
signal heap_bh6_w28_35, heap_bh6_w28_35_d1 :  std_logic;
signal heap_bh6_w29_36 :  std_logic;
signal CompressorIn_bh6_346_420 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_346_421 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_346_346 :  std_logic_vector(2 downto 0);
signal heap_bh6_w29_37 :  std_logic;
signal heap_bh6_w30_35 :  std_logic;
signal heap_bh6_w31_37 :  std_logic;
signal CompressorIn_bh6_347_422 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_347_423 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_347_347 :  std_logic_vector(2 downto 0);
signal heap_bh6_w31_38 :  std_logic;
signal heap_bh6_w32_35 :  std_logic;
signal heap_bh6_w33_36 :  std_logic;
signal CompressorIn_bh6_348_424 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_348_425 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_348_348 :  std_logic_vector(2 downto 0);
signal heap_bh6_w33_37 :  std_logic;
signal heap_bh6_w34_37 :  std_logic;
signal heap_bh6_w35_35 :  std_logic;
signal CompressorIn_bh6_349_426 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_349_427 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_349_349 :  std_logic_vector(2 downto 0);
signal heap_bh6_w35_36 :  std_logic;
signal heap_bh6_w36_36 :  std_logic;
signal heap_bh6_w37_37 :  std_logic;
signal CompressorIn_bh6_350_428 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_350_429 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_350_350 :  std_logic_vector(2 downto 0);
signal heap_bh6_w36_37 :  std_logic;
signal heap_bh6_w37_38 :  std_logic;
signal heap_bh6_w38_35, heap_bh6_w38_35_d1 :  std_logic;
signal CompressorIn_bh6_351_430 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_351_431 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_351_351 :  std_logic_vector(2 downto 0);
signal heap_bh6_w38_36 :  std_logic;
signal heap_bh6_w39_36 :  std_logic;
signal heap_bh6_w40_37 :  std_logic;
signal CompressorIn_bh6_352_432 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_352_433 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_352_352 :  std_logic_vector(2 downto 0);
signal heap_bh6_w39_37 :  std_logic;
signal heap_bh6_w40_38 :  std_logic;
signal heap_bh6_w41_35 :  std_logic;
signal CompressorIn_bh6_353_434 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_353_435 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_353_353 :  std_logic_vector(2 downto 0);
signal heap_bh6_w41_36 :  std_logic;
signal heap_bh6_w42_36 :  std_logic;
signal heap_bh6_w43_37 :  std_logic;
signal CompressorIn_bh6_354_436 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_354_437 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_354_354 :  std_logic_vector(2 downto 0);
signal heap_bh6_w42_37 :  std_logic;
signal heap_bh6_w43_38 :  std_logic;
signal heap_bh6_w44_36 :  std_logic;
signal CompressorIn_bh6_355_438 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_355_439 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_355_355 :  std_logic_vector(2 downto 0);
signal heap_bh6_w46_37 :  std_logic;
signal heap_bh6_w47_38 :  std_logic;
signal heap_bh6_w48_38 :  std_logic;
signal CompressorIn_bh6_356_440 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_356_441 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_356_356 :  std_logic_vector(2 downto 0);
signal heap_bh6_w47_39 :  std_logic;
signal heap_bh6_w48_39 :  std_logic;
signal heap_bh6_w49_36 :  std_logic;
signal CompressorIn_bh6_357_442 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_357_443 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_357_357 :  std_logic_vector(2 downto 0);
signal heap_bh6_w48_40 :  std_logic;
signal heap_bh6_w49_37 :  std_logic;
signal heap_bh6_w50_38 :  std_logic;
signal CompressorIn_bh6_358_444 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_358_445 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_358_358 :  std_logic_vector(2 downto 0);
signal heap_bh6_w77_7 :  std_logic;
signal heap_bh6_w78_5 :  std_logic;
signal heap_bh6_w79_4 :  std_logic;
signal CompressorIn_bh6_359_446 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_359_447 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_359_359 :  std_logic_vector(2 downto 0);
signal heap_bh6_w79_5 :  std_logic;
signal heap_bh6_w80_4 :  std_logic;
signal heap_bh6_w81_4 :  std_logic;
signal CompressorIn_bh6_360_448 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_360_449 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_360_360 :  std_logic_vector(2 downto 0);
signal heap_bh6_w81_5 :  std_logic;
signal heap_bh6_w82_4 :  std_logic;
signal heap_bh6_w83_4 :  std_logic;
signal CompressorIn_bh6_361_450 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_361_451 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_361_361 :  std_logic_vector(2 downto 0);
signal heap_bh6_w83_5 :  std_logic;
signal heap_bh6_w84_4 :  std_logic;
signal heap_bh6_w85_4 :  std_logic;
signal CompressorIn_bh6_362_452 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_362_453 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_362_362 :  std_logic_vector(2 downto 0);
signal heap_bh6_w85_5 :  std_logic;
signal heap_bh6_w86_4 :  std_logic;
signal heap_bh6_w87_4 :  std_logic;
signal CompressorIn_bh6_363_454 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_363_455 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_363_363 :  std_logic_vector(2 downto 0);
signal heap_bh6_w87_5 :  std_logic;
signal heap_bh6_w88_4 :  std_logic;
signal heap_bh6_w89_4 :  std_logic;
signal CompressorIn_bh6_364_456 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_364_457 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_364_364 :  std_logic_vector(2 downto 0);
signal heap_bh6_w89_5 :  std_logic;
signal heap_bh6_w90_4 :  std_logic;
signal heap_bh6_w91_4 :  std_logic;
signal CompressorIn_bh6_365_458 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_365_459 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_365_365 :  std_logic_vector(2 downto 0);
signal heap_bh6_w91_5 :  std_logic;
signal heap_bh6_w92_3, heap_bh6_w92_3_d1 :  std_logic;
signal heap_bh6_w93_3 :  std_logic;
signal CompressorIn_bh6_366_460 :  std_logic_vector(4 downto 0);
signal CompressorOut_bh6_366_366 :  std_logic_vector(2 downto 0);
signal heap_bh6_w44_37 :  std_logic;
signal heap_bh6_w45_38 :  std_logic;
signal heap_bh6_w46_38 :  std_logic;
signal CompressorIn_bh6_367_461 :  std_logic_vector(3 downto 0);
signal CompressorOut_bh6_367_367 :  std_logic_vector(2 downto 0);
signal heap_bh6_w49_38 :  std_logic;
signal heap_bh6_w50_39 :  std_logic;
signal heap_bh6_w51_41 :  std_logic;
signal CompressorIn_bh6_368_462 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_368_463 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_368_368 :  std_logic_vector(2 downto 0);
signal heap_bh6_w20_26, heap_bh6_w20_26_d1 :  std_logic;
signal heap_bh6_w21_28, heap_bh6_w21_28_d1 :  std_logic;
signal heap_bh6_w22_28, heap_bh6_w22_28_d1 :  std_logic;
signal CompressorIn_bh6_369_464 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_369_465 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_369_369 :  std_logic_vector(2 downto 0);
signal heap_bh6_w22_29, heap_bh6_w22_29_d1 :  std_logic;
signal heap_bh6_w23_30, heap_bh6_w23_30_d1 :  std_logic;
signal heap_bh6_w24_31, heap_bh6_w24_31_d1 :  std_logic;
signal CompressorIn_bh6_370_466 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_370_467 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_370_370 :  std_logic_vector(2 downto 0);
signal heap_bh6_w24_32, heap_bh6_w24_32_d1 :  std_logic;
signal heap_bh6_w25_33, heap_bh6_w25_33_d1 :  std_logic;
signal heap_bh6_w26_34, heap_bh6_w26_34_d1 :  std_logic;
signal CompressorIn_bh6_371_468 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_371_469 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_371_371 :  std_logic_vector(2 downto 0);
signal heap_bh6_w93_4 :  std_logic;
signal heap_bh6_w94_3 :  std_logic;
signal heap_bh6_w95_3 :  std_logic;
signal CompressorIn_bh6_372_470 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_372_471 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_372_372 :  std_logic_vector(2 downto 0);
signal heap_bh6_w95_4 :  std_logic;
signal heap_bh6_w96_3 :  std_logic;
signal heap_bh6_w97_3 :  std_logic;
signal CompressorIn_bh6_373_472 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_373_473 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_373_373 :  std_logic_vector(2 downto 0);
signal heap_bh6_w97_4 :  std_logic;
signal heap_bh6_w98_3 :  std_logic;
signal heap_bh6_w99_3 :  std_logic;
signal CompressorIn_bh6_374_474 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_374_475 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_374_374 :  std_logic_vector(2 downto 0);
signal heap_bh6_w99_4 :  std_logic;
signal heap_bh6_w100_3 :  std_logic;
signal heap_bh6_w101_3 :  std_logic;
signal CompressorIn_bh6_375_476 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_375_477 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_375_375 :  std_logic_vector(2 downto 0);
signal heap_bh6_w101_4 :  std_logic;
signal heap_bh6_w102_2 :  std_logic;
signal heap_bh6_w103_2 :  std_logic;
signal CompressorIn_bh6_376_478 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_376_479 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_376_376 :  std_logic_vector(2 downto 0);
signal heap_bh6_w32_36 :  std_logic;
signal heap_bh6_w33_38 :  std_logic;
signal heap_bh6_w34_38, heap_bh6_w34_38_d1 :  std_logic;
signal CompressorIn_bh6_377_480 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_377_377 :  std_logic_vector(1 downto 0);
signal heap_bh6_w26_35, heap_bh6_w26_35_d1 :  std_logic;
signal heap_bh6_w27_37, heap_bh6_w27_37_d1 :  std_logic;
signal CompressorIn_bh6_378_481 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_378_378 :  std_logic_vector(1 downto 0);
signal heap_bh6_w28_36, heap_bh6_w28_36_d1 :  std_logic;
signal heap_bh6_w29_38 :  std_logic;
signal CompressorIn_bh6_379_482 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_379_379 :  std_logic_vector(1 downto 0);
signal heap_bh6_w30_36 :  std_logic;
signal heap_bh6_w31_39 :  std_logic;
signal CompressorIn_bh6_380_483 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_380_380 :  std_logic_vector(1 downto 0);
signal heap_bh6_w34_39 :  std_logic;
signal heap_bh6_w35_37 :  std_logic;
signal CompressorIn_bh6_381_484 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_381_381 :  std_logic_vector(1 downto 0);
signal heap_bh6_w37_39 :  std_logic;
signal heap_bh6_w38_37 :  std_logic;
signal CompressorIn_bh6_382_485 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_382_382 :  std_logic_vector(1 downto 0);
signal heap_bh6_w40_39 :  std_logic;
signal heap_bh6_w41_37 :  std_logic;
signal CompressorIn_bh6_383_486 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_383_383 :  std_logic_vector(1 downto 0);
signal heap_bh6_w43_39 :  std_logic;
signal heap_bh6_w44_38 :  std_logic;
signal CompressorIn_bh6_384_487 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_384_384 :  std_logic_vector(1 downto 0);
signal heap_bh6_w78_6 :  std_logic;
signal heap_bh6_w79_6 :  std_logic;
signal CompressorIn_bh6_385_488 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_385_385 :  std_logic_vector(1 downto 0);
signal heap_bh6_w80_5 :  std_logic;
signal heap_bh6_w81_6 :  std_logic;
signal CompressorIn_bh6_386_489 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_386_386 :  std_logic_vector(1 downto 0);
signal heap_bh6_w82_5 :  std_logic;
signal heap_bh6_w83_6 :  std_logic;
signal CompressorIn_bh6_387_490 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_387_387 :  std_logic_vector(1 downto 0);
signal heap_bh6_w84_5 :  std_logic;
signal heap_bh6_w85_6 :  std_logic;
signal CompressorIn_bh6_388_491 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_388_388 :  std_logic_vector(1 downto 0);
signal heap_bh6_w86_5 :  std_logic;
signal heap_bh6_w87_6 :  std_logic;
signal CompressorIn_bh6_389_492 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_389_389 :  std_logic_vector(1 downto 0);
signal heap_bh6_w88_5 :  std_logic;
signal heap_bh6_w89_6 :  std_logic;
signal CompressorIn_bh6_390_493 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_390_390 :  std_logic_vector(1 downto 0);
signal heap_bh6_w90_5 :  std_logic;
signal heap_bh6_w91_6 :  std_logic;
signal CompressorIn_bh6_391_494 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_391_495 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_391_391 :  std_logic_vector(2 downto 0);
signal heap_bh6_w46_39 :  std_logic;
signal heap_bh6_w47_40 :  std_logic;
signal heap_bh6_w48_41 :  std_logic;
signal CompressorIn_bh6_392_496 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_392_497 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_392_392 :  std_logic_vector(2 downto 0);
signal heap_bh6_w53_41 :  std_logic;
signal heap_bh6_w54_42 :  std_logic;
signal heap_bh6_w55_40 :  std_logic;
signal CompressorIn_bh6_393_498 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_393_499 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_393_393 :  std_logic_vector(2 downto 0);
signal heap_bh6_w56_41 :  std_logic;
signal heap_bh6_w57_42 :  std_logic;
signal heap_bh6_w58_40 :  std_logic;
signal CompressorIn_bh6_394_500 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_394_501 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_394_394 :  std_logic_vector(2 downto 0);
signal heap_bh6_w59_41 :  std_logic;
signal heap_bh6_w60_42 :  std_logic;
signal heap_bh6_w61_41 :  std_logic;
signal CompressorIn_bh6_395_502 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_395_503 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_395_395 :  std_logic_vector(2 downto 0);
signal heap_bh6_w61_42 :  std_logic;
signal heap_bh6_w62_42 :  std_logic;
signal heap_bh6_w63_39 :  std_logic;
signal CompressorIn_bh6_396_504 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_396_505 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_396_396 :  std_logic_vector(2 downto 0);
signal heap_bh6_w62_43 :  std_logic;
signal heap_bh6_w63_40 :  std_logic;
signal heap_bh6_w64_40 :  std_logic;
signal CompressorIn_bh6_397_506 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_397_507 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_397_397 :  std_logic_vector(2 downto 0);
signal heap_bh6_w64_41 :  std_logic;
signal heap_bh6_w65_39 :  std_logic;
signal heap_bh6_w66_33 :  std_logic;
signal CompressorIn_bh6_398_508 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_398_509 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_398_398 :  std_logic_vector(2 downto 0);
signal heap_bh6_w66_34 :  std_logic;
signal heap_bh6_w67_32 :  std_logic;
signal heap_bh6_w68_30 :  std_logic;
signal CompressorIn_bh6_399_510 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_399_511 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_399_399 :  std_logic_vector(2 downto 0);
signal heap_bh6_w68_31 :  std_logic;
signal heap_bh6_w69_25, heap_bh6_w69_25_d1 :  std_logic;
signal heap_bh6_w70_23 :  std_logic;
signal CompressorIn_bh6_400_512 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_400_513 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_400_400 :  std_logic_vector(2 downto 0);
signal heap_bh6_w70_24 :  std_logic;
signal heap_bh6_w71_23 :  std_logic;
signal heap_bh6_w72_18 :  std_logic;
signal CompressorIn_bh6_401_514 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_401_515 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_401_401 :  std_logic_vector(2 downto 0);
signal heap_bh6_w74_16 :  std_logic;
signal heap_bh6_w75_10 :  std_logic;
signal heap_bh6_w76_9 :  std_logic;
signal CompressorIn_bh6_402_516 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh6_402_517 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_402_402 :  std_logic_vector(2 downto 0);
signal heap_bh6_w77_8 :  std_logic;
signal heap_bh6_w78_7 :  std_logic;
signal heap_bh6_w79_7 :  std_logic;
signal CompressorIn_bh6_403_518 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_403_519 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_403_403 :  std_logic_vector(2 downto 0);
signal heap_bh6_w29_39, heap_bh6_w29_39_d1 :  std_logic;
signal heap_bh6_w30_37, heap_bh6_w30_37_d1 :  std_logic;
signal heap_bh6_w31_40, heap_bh6_w31_40_d1 :  std_logic;
signal CompressorIn_bh6_404_520 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_404_521 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_404_404 :  std_logic_vector(2 downto 0);
signal heap_bh6_w31_41, heap_bh6_w31_41_d1 :  std_logic;
signal heap_bh6_w32_37, heap_bh6_w32_37_d1 :  std_logic;
signal heap_bh6_w33_39, heap_bh6_w33_39_d1 :  std_logic;
signal CompressorIn_bh6_405_522 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_405_523 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_405_405 :  std_logic_vector(2 downto 0);
signal heap_bh6_w33_40, heap_bh6_w33_40_d1 :  std_logic;
signal heap_bh6_w34_40, heap_bh6_w34_40_d1 :  std_logic;
signal heap_bh6_w35_38, heap_bh6_w35_38_d1 :  std_logic;
signal CompressorIn_bh6_406_524 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_406_525 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_406_406 :  std_logic_vector(2 downto 0);
signal heap_bh6_w35_39, heap_bh6_w35_39_d1 :  std_logic;
signal heap_bh6_w36_38, heap_bh6_w36_38_d1 :  std_logic;
signal heap_bh6_w37_40, heap_bh6_w37_40_d1 :  std_logic;
signal CompressorIn_bh6_407_526 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_407_527 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_407_407 :  std_logic_vector(2 downto 0);
signal heap_bh6_w37_41, heap_bh6_w37_41_d1 :  std_logic;
signal heap_bh6_w38_38, heap_bh6_w38_38_d1 :  std_logic;
signal heap_bh6_w39_38 :  std_logic;
signal CompressorIn_bh6_408_528 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_408_529 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_408_408 :  std_logic_vector(2 downto 0);
signal heap_bh6_w40_40 :  std_logic;
signal heap_bh6_w41_38 :  std_logic;
signal heap_bh6_w42_38 :  std_logic;
signal CompressorIn_bh6_409_530 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_409_531 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_409_409 :  std_logic_vector(2 downto 0);
signal heap_bh6_w43_40 :  std_logic;
signal heap_bh6_w44_39 :  std_logic;
signal heap_bh6_w45_39 :  std_logic;
signal CompressorIn_bh6_410_532 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_410_533 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_410_410 :  std_logic_vector(2 downto 0);
signal heap_bh6_w48_42 :  std_logic;
signal heap_bh6_w49_39 :  std_logic;
signal heap_bh6_w50_40 :  std_logic;
signal CompressorIn_bh6_411_534 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_411_535 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_411_411 :  std_logic_vector(2 downto 0);
signal heap_bh6_w50_41 :  std_logic;
signal heap_bh6_w51_42 :  std_logic;
signal heap_bh6_w52_40 :  std_logic;
signal CompressorIn_bh6_412_536 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_412_537 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_412_412 :  std_logic_vector(2 downto 0);
signal heap_bh6_w72_19 :  std_logic;
signal heap_bh6_w73_18 :  std_logic;
signal heap_bh6_w74_17 :  std_logic;
signal CompressorIn_bh6_413_538 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_413_539 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_413_413 :  std_logic_vector(2 downto 0);
signal heap_bh6_w79_8 :  std_logic;
signal heap_bh6_w80_6, heap_bh6_w80_6_d1 :  std_logic;
signal heap_bh6_w81_7, heap_bh6_w81_7_d1 :  std_logic;
signal CompressorIn_bh6_414_540 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_414_541 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_414_414 :  std_logic_vector(2 downto 0);
signal heap_bh6_w81_8, heap_bh6_w81_8_d1 :  std_logic;
signal heap_bh6_w82_6, heap_bh6_w82_6_d1 :  std_logic;
signal heap_bh6_w83_7, heap_bh6_w83_7_d1 :  std_logic;
signal CompressorIn_bh6_415_542 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_415_543 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_415_415 :  std_logic_vector(2 downto 0);
signal heap_bh6_w83_8, heap_bh6_w83_8_d1 :  std_logic;
signal heap_bh6_w84_6, heap_bh6_w84_6_d1 :  std_logic;
signal heap_bh6_w85_7, heap_bh6_w85_7_d1 :  std_logic;
signal CompressorIn_bh6_416_544 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_416_545 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_416_416 :  std_logic_vector(2 downto 0);
signal heap_bh6_w85_8, heap_bh6_w85_8_d1 :  std_logic;
signal heap_bh6_w86_6, heap_bh6_w86_6_d1 :  std_logic;
signal heap_bh6_w87_7, heap_bh6_w87_7_d1 :  std_logic;
signal CompressorIn_bh6_417_546 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_417_547 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_417_417 :  std_logic_vector(2 downto 0);
signal heap_bh6_w87_8, heap_bh6_w87_8_d1 :  std_logic;
signal heap_bh6_w88_6, heap_bh6_w88_6_d1 :  std_logic;
signal heap_bh6_w89_7, heap_bh6_w89_7_d1 :  std_logic;
signal CompressorIn_bh6_418_548 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_418_549 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_418_418 :  std_logic_vector(2 downto 0);
signal heap_bh6_w89_8, heap_bh6_w89_8_d1 :  std_logic;
signal heap_bh6_w90_6, heap_bh6_w90_6_d1 :  std_logic;
signal heap_bh6_w91_7, heap_bh6_w91_7_d1 :  std_logic;
signal CompressorIn_bh6_419_550 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_419_551 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_419_419 :  std_logic_vector(2 downto 0);
signal heap_bh6_w91_8, heap_bh6_w91_8_d1 :  std_logic;
signal heap_bh6_w92_4, heap_bh6_w92_4_d1 :  std_logic;
signal heap_bh6_w93_5 :  std_logic;
signal CompressorIn_bh6_420_552 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_420_553 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_420_420 :  std_logic_vector(2 downto 0);
signal heap_bh6_w103_3, heap_bh6_w103_3_d1 :  std_logic;
signal heap_bh6_w104_2, heap_bh6_w104_2_d1 :  std_logic;
signal heap_bh6_w105_2 :  std_logic;
signal CompressorIn_bh6_421_554 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_421_421 :  std_logic_vector(1 downto 0);
signal heap_bh6_w52_41 :  std_logic;
signal heap_bh6_w53_42 :  std_logic;
signal CompressorIn_bh6_422_555 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_422_422 :  std_logic_vector(1 downto 0);
signal heap_bh6_w55_41 :  std_logic;
signal heap_bh6_w56_42 :  std_logic;
signal CompressorIn_bh6_423_556 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_423_423 :  std_logic_vector(1 downto 0);
signal heap_bh6_w58_41 :  std_logic;
signal heap_bh6_w59_42 :  std_logic;
signal CompressorIn_bh6_424_557 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_424_424 :  std_logic_vector(1 downto 0);
signal heap_bh6_w63_41 :  std_logic;
signal heap_bh6_w64_42 :  std_logic;
signal CompressorIn_bh6_425_558 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_425_425 :  std_logic_vector(1 downto 0);
signal heap_bh6_w65_40 :  std_logic;
signal heap_bh6_w66_35 :  std_logic;
signal CompressorIn_bh6_426_559 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_426_426 :  std_logic_vector(1 downto 0);
signal heap_bh6_w67_33 :  std_logic;
signal heap_bh6_w68_32 :  std_logic;
signal CompressorIn_bh6_427_560 :  std_logic_vector(2 downto 0);
signal CompressorOut_bh6_427_427 :  std_logic_vector(1 downto 0);
signal heap_bh6_w76_10 :  std_logic;
signal heap_bh6_w77_9 :  std_logic;
signal CompressorIn_bh6_428_561 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_428_562 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_428_428 :  std_logic_vector(2 downto 0);
signal heap_bh6_w47_41, heap_bh6_w47_41_d1 :  std_logic;
signal heap_bh6_w48_43, heap_bh6_w48_43_d1 :  std_logic;
signal heap_bh6_w49_40 :  std_logic;
signal CompressorIn_bh6_429_563 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_429_564 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_429_429 :  std_logic_vector(2 downto 0);
signal heap_bh6_w54_43 :  std_logic;
signal heap_bh6_w55_42, heap_bh6_w55_42_d1 :  std_logic;
signal heap_bh6_w56_43 :  std_logic;
signal CompressorIn_bh6_430_565 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_430_566 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_430_430 :  std_logic_vector(2 downto 0);
signal heap_bh6_w57_43 :  std_logic;
signal heap_bh6_w58_42, heap_bh6_w58_42_d1 :  std_logic;
signal heap_bh6_w59_43 :  std_logic;
signal CompressorIn_bh6_431_567 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_431_568 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_431_431 :  std_logic_vector(2 downto 0);
signal heap_bh6_w60_43 :  std_logic;
signal heap_bh6_w61_43, heap_bh6_w61_43_d1 :  std_logic;
signal heap_bh6_w62_44 :  std_logic;
signal CompressorIn_bh6_432_569 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_432_570 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_432_432 :  std_logic_vector(2 downto 0);
signal heap_bh6_w63_42 :  std_logic;
signal heap_bh6_w64_43 :  std_logic;
signal heap_bh6_w65_41 :  std_logic;
signal CompressorIn_bh6_433_571 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_433_572 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_433_433 :  std_logic_vector(2 downto 0);
signal heap_bh6_w66_36 :  std_logic;
signal heap_bh6_w67_34, heap_bh6_w67_34_d1 :  std_logic;
signal heap_bh6_w68_33, heap_bh6_w68_33_d1 :  std_logic;
signal CompressorIn_bh6_434_573 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_434_574 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_434_434 :  std_logic_vector(2 downto 0);
signal heap_bh6_w68_34, heap_bh6_w68_34_d1 :  std_logic;
signal heap_bh6_w69_26, heap_bh6_w69_26_d1 :  std_logic;
signal heap_bh6_w70_25 :  std_logic;
signal CompressorIn_bh6_435_575 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_435_576 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_435_435 :  std_logic_vector(2 downto 0);
signal heap_bh6_w71_24 :  std_logic;
signal heap_bh6_w72_20, heap_bh6_w72_20_d1 :  std_logic;
signal heap_bh6_w73_19 :  std_logic;
signal CompressorIn_bh6_436_577 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_436_578 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_436_436 :  std_logic_vector(2 downto 0);
signal heap_bh6_w75_11, heap_bh6_w75_11_d1 :  std_logic;
signal heap_bh6_w76_11, heap_bh6_w76_11_d1 :  std_logic;
signal heap_bh6_w77_10 :  std_logic;
signal CompressorIn_bh6_437_579 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_437_580 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_437_437 :  std_logic_vector(2 downto 0);
signal heap_bh6_w78_8 :  std_logic;
signal heap_bh6_w79_9, heap_bh6_w79_9_d1 :  std_logic;
signal heap_bh6_w80_7, heap_bh6_w80_7_d1 :  std_logic;
signal CompressorIn_bh6_438_581 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_438_582 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_438_438 :  std_logic_vector(2 downto 0);
signal heap_bh6_w93_6, heap_bh6_w93_6_d1 :  std_logic;
signal heap_bh6_w94_4, heap_bh6_w94_4_d1 :  std_logic;
signal heap_bh6_w95_5 :  std_logic;
signal CompressorIn_bh6_439_583 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_439_584 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_439_439 :  std_logic_vector(2 downto 0);
signal heap_bh6_w105_3, heap_bh6_w105_3_d1 :  std_logic;
signal heap_bh6_w106_2, heap_bh6_w106_2_d1 :  std_logic;
signal heap_bh6_w107_2 :  std_logic;
signal CompressorIn_bh6_440_585 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_440_586 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_440_440 :  std_logic_vector(2 downto 0);
signal heap_bh6_w39_39, heap_bh6_w39_39_d1 :  std_logic;
signal heap_bh6_w40_41, heap_bh6_w40_41_d1 :  std_logic;
signal heap_bh6_w41_39 :  std_logic;
signal CompressorIn_bh6_441_587 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_441_588 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_441_441 :  std_logic_vector(2 downto 0);
signal heap_bh6_w42_39 :  std_logic;
signal heap_bh6_w43_41, heap_bh6_w43_41_d1 :  std_logic;
signal heap_bh6_w44_40 :  std_logic;
signal CompressorIn_bh6_442_589 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_442_590 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_442_442 :  std_logic_vector(2 downto 0);
signal heap_bh6_w45_40 :  std_logic;
signal heap_bh6_w46_40, heap_bh6_w46_40_d1 :  std_logic;
signal heap_bh6_w47_42, heap_bh6_w47_42_d1 :  std_logic;
signal CompressorIn_bh6_443_591 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_443_592 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_443_443 :  std_logic_vector(2 downto 0);
signal heap_bh6_w49_41, heap_bh6_w49_41_d1 :  std_logic;
signal heap_bh6_w50_42, heap_bh6_w50_42_d1 :  std_logic;
signal heap_bh6_w51_43 :  std_logic;
signal CompressorIn_bh6_444_593 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_444_594 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_444_444 :  std_logic_vector(2 downto 0);
signal heap_bh6_w73_20, heap_bh6_w73_20_d1 :  std_logic;
signal heap_bh6_w74_18, heap_bh6_w74_18_d1 :  std_logic;
signal heap_bh6_w75_12, heap_bh6_w75_12_d1 :  std_logic;
signal CompressorIn_bh6_445_595 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_445_596 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_445_445 :  std_logic_vector(2 downto 0);
signal heap_bh6_w95_6, heap_bh6_w95_6_d1 :  std_logic;
signal heap_bh6_w96_4, heap_bh6_w96_4_d1 :  std_logic;
signal heap_bh6_w97_5 :  std_logic;
signal CompressorIn_bh6_446_597 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_446_598 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_446_446 :  std_logic_vector(2 downto 0);
signal heap_bh6_w107_3, heap_bh6_w107_3_d1 :  std_logic;
signal heap_bh6_w108_2, heap_bh6_w108_2_d1 :  std_logic;
signal heap_bh6_w109_1, heap_bh6_w109_1_d1 :  std_logic;
signal CompressorIn_bh6_447_599 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_447_600 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_447_447 :  std_logic_vector(2 downto 0);
signal heap_bh6_w41_40, heap_bh6_w41_40_d1 :  std_logic;
signal heap_bh6_w42_40, heap_bh6_w42_40_d1 :  std_logic;
signal heap_bh6_w43_42, heap_bh6_w43_42_d1 :  std_logic;
signal CompressorIn_bh6_448_601 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_448_602 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_448_448 :  std_logic_vector(2 downto 0);
signal heap_bh6_w44_41, heap_bh6_w44_41_d1 :  std_logic;
signal heap_bh6_w45_41, heap_bh6_w45_41_d1 :  std_logic;
signal heap_bh6_w46_41, heap_bh6_w46_41_d1 :  std_logic;
signal CompressorIn_bh6_449_603 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_449_604 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_449_449 :  std_logic_vector(2 downto 0);
signal heap_bh6_w56_44, heap_bh6_w56_44_d1 :  std_logic;
signal heap_bh6_w57_44, heap_bh6_w57_44_d1 :  std_logic;
signal heap_bh6_w58_43, heap_bh6_w58_43_d1 :  std_logic;
signal CompressorIn_bh6_450_605 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_450_606 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_450_450 :  std_logic_vector(2 downto 0);
signal heap_bh6_w59_44, heap_bh6_w59_44_d1 :  std_logic;
signal heap_bh6_w60_44, heap_bh6_w60_44_d1 :  std_logic;
signal heap_bh6_w61_44, heap_bh6_w61_44_d1 :  std_logic;
signal CompressorIn_bh6_451_607 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_451_608 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_451_451 :  std_logic_vector(2 downto 0);
signal heap_bh6_w62_45, heap_bh6_w62_45_d1 :  std_logic;
signal heap_bh6_w63_43, heap_bh6_w63_43_d1 :  std_logic;
signal heap_bh6_w64_44 :  std_logic;
signal CompressorIn_bh6_452_609 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_452_610 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_452_452 :  std_logic_vector(2 downto 0);
signal heap_bh6_w65_42 :  std_logic;
signal heap_bh6_w66_37, heap_bh6_w66_37_d1 :  std_logic;
signal heap_bh6_w67_35, heap_bh6_w67_35_d1 :  std_logic;
signal CompressorIn_bh6_453_611 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_453_612 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_453_453 :  std_logic_vector(2 downto 0);
signal heap_bh6_w70_26, heap_bh6_w70_26_d1 :  std_logic;
signal heap_bh6_w71_25, heap_bh6_w71_25_d1 :  std_logic;
signal heap_bh6_w72_21, heap_bh6_w72_21_d1 :  std_logic;
signal CompressorIn_bh6_454_613 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_454_614 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_454_454 :  std_logic_vector(2 downto 0);
signal heap_bh6_w77_11, heap_bh6_w77_11_d1 :  std_logic;
signal heap_bh6_w78_9, heap_bh6_w78_9_d1 :  std_logic;
signal heap_bh6_w79_10, heap_bh6_w79_10_d1 :  std_logic;
signal CompressorIn_bh6_455_615 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_455_616 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_455_455 :  std_logic_vector(2 downto 0);
signal heap_bh6_w51_44, heap_bh6_w51_44_d1 :  std_logic;
signal heap_bh6_w52_42, heap_bh6_w52_42_d1 :  std_logic;
signal heap_bh6_w53_43 :  std_logic;
signal CompressorIn_bh6_456_617 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_456_618 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_456_456 :  std_logic_vector(2 downto 0);
signal heap_bh6_w97_6, heap_bh6_w97_6_d1 :  std_logic;
signal heap_bh6_w98_4, heap_bh6_w98_4_d1 :  std_logic;
signal heap_bh6_w99_5 :  std_logic;
signal CompressorIn_bh6_457_619 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_457_620 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_457_457 :  std_logic_vector(2 downto 0);
signal heap_bh6_w64_45, heap_bh6_w64_45_d1 :  std_logic;
signal heap_bh6_w65_43, heap_bh6_w65_43_d1 :  std_logic;
signal heap_bh6_w66_38, heap_bh6_w66_38_d1 :  std_logic;
signal CompressorIn_bh6_458_621 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_458_622 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh6_458_458 :  std_logic_vector(2 downto 0);
signal heap_bh6_w99_6, heap_bh6_w99_6_d1 :  std_logic;
signal heap_bh6_w100_4, heap_bh6_w100_4_d1 :  std_logic;
signal heap_bh6_w101_5 :  std_logic;
signal CompressorIn_bh6_459_623 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_459_624 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_459_459 :  std_logic_vector(2 downto 0);
signal heap_bh6_w53_44, heap_bh6_w53_44_d1 :  std_logic;
signal heap_bh6_w54_44, heap_bh6_w54_44_d1 :  std_logic;
signal heap_bh6_w55_43, heap_bh6_w55_43_d1 :  std_logic;
signal CompressorIn_bh6_460_625 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh6_460_626 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh6_460_460 :  std_logic_vector(2 downto 0);
signal heap_bh6_w101_6, heap_bh6_w101_6_d1 :  std_logic;
signal heap_bh6_w102_3, heap_bh6_w102_3_d1 :  std_logic;
signal heap_bh6_w103_4, heap_bh6_w103_4_d1 :  std_logic;
signal finalAdderIn0_bh6 :  std_logic_vector(122 downto 0);
signal finalAdderIn1_bh6 :  std_logic_vector(122 downto 0);
signal finalAdderCin_bh6 :  std_logic;
signal finalAdderOut_bh6 :  std_logic_vector(122 downto 0);
signal CompressionResult6 :  std_logic_vector(126 downto 0);
attribute rom_extract: string;
attribute rom_style: string;
attribute rom_extract of SmallMultTableP3x3r6XuYu: component is "yes";
attribute rom_style of SmallMultTableP3x3r6XuYu: component is "distributed";
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            heap_bh6_w4_0_d1 <=  heap_bh6_w4_0;
            heap_bh6_w125_0_d1 <=  heap_bh6_w125_0;
            heap_bh6_w124_0_d1 <=  heap_bh6_w124_0;
            heap_bh6_w123_0_d1 <=  heap_bh6_w123_0;
            heap_bh6_w122_0_d1 <=  heap_bh6_w122_0;
            heap_bh6_w121_0_d1 <=  heap_bh6_w121_0;
            heap_bh6_w120_0_d1 <=  heap_bh6_w120_0;
            heap_bh6_w119_0_d1 <=  heap_bh6_w119_0;
            heap_bh6_w118_0_d1 <=  heap_bh6_w118_0;
            heap_bh6_w117_0_d1 <=  heap_bh6_w117_0;
            heap_bh6_w116_0_d1 <=  heap_bh6_w116_0;
            heap_bh6_w115_0_d1 <=  heap_bh6_w115_0;
            heap_bh6_w114_0_d1 <=  heap_bh6_w114_0;
            heap_bh6_w113_0_d1 <=  heap_bh6_w113_0;
            heap_bh6_w112_0_d1 <=  heap_bh6_w112_0;
            heap_bh6_w111_0_d1 <=  heap_bh6_w111_0;
            heap_bh6_w110_0_d1 <=  heap_bh6_w110_0;
            heap_bh6_w109_0_d1 <=  heap_bh6_w109_0;
            tempR_bh6_0_d1 <=  tempR_bh6_0;
            heap_bh6_w6_5_d1 <=  heap_bh6_w6_5;
            heap_bh6_w8_5_d1 <=  heap_bh6_w8_5;
            heap_bh6_w4_3_d1 <=  heap_bh6_w4_3;
            heap_bh6_w5_3_d1 <=  heap_bh6_w5_3;
            heap_bh6_w5_4_d1 <=  heap_bh6_w5_4;
            heap_bh6_w6_6_d1 <=  heap_bh6_w6_6;
            tempR_bh6_1_d1 <=  tempR_bh6_1;
            heap_bh6_w17_18_d1 <=  heap_bh6_w17_18;
            heap_bh6_w10_10_d1 <=  heap_bh6_w10_10;
            heap_bh6_w11_10_d1 <=  heap_bh6_w11_10;
            heap_bh6_w15_18_d1 <=  heap_bh6_w15_18;
            heap_bh6_w7_8_d1 <=  heap_bh6_w7_8;
            heap_bh6_w8_8_d1 <=  heap_bh6_w8_8;
            heap_bh6_w9_10_d1 <=  heap_bh6_w9_10;
            heap_bh6_w9_11_d1 <=  heap_bh6_w9_11;
            heap_bh6_w10_11_d1 <=  heap_bh6_w10_11;
            heap_bh6_w11_11_d1 <=  heap_bh6_w11_11;
            heap_bh6_w18_22_d1 <=  heap_bh6_w18_22;
            heap_bh6_w19_22_d1 <=  heap_bh6_w19_22;
            heap_bh6_w21_25_d1 <=  heap_bh6_w21_25;
            heap_bh6_w23_27_d1 <=  heap_bh6_w23_27;
            heap_bh6_w25_30_d1 <=  heap_bh6_w25_30;
            heap_bh6_w12_16_d1 <=  heap_bh6_w12_16;
            heap_bh6_w13_15_d1 <=  heap_bh6_w13_15;
            heap_bh6_w14_18_d1 <=  heap_bh6_w14_18;
            heap_bh6_w14_19_d1 <=  heap_bh6_w14_19;
            heap_bh6_w15_19_d1 <=  heap_bh6_w15_19;
            heap_bh6_w16_20_d1 <=  heap_bh6_w16_20;
            heap_bh6_w16_21_d1 <=  heap_bh6_w16_21;
            heap_bh6_w17_21_d1 <=  heap_bh6_w17_21;
            heap_bh6_w18_23_d1 <=  heap_bh6_w18_23;
            heap_bh6_w19_23_d1 <=  heap_bh6_w19_23;
            heap_bh6_w27_36_d1 <=  heap_bh6_w27_36;
            heap_bh6_w28_35_d1 <=  heap_bh6_w28_35;
            heap_bh6_w38_35_d1 <=  heap_bh6_w38_35;
            heap_bh6_w92_3_d1 <=  heap_bh6_w92_3;
            heap_bh6_w20_26_d1 <=  heap_bh6_w20_26;
            heap_bh6_w21_28_d1 <=  heap_bh6_w21_28;
            heap_bh6_w22_28_d1 <=  heap_bh6_w22_28;
            heap_bh6_w22_29_d1 <=  heap_bh6_w22_29;
            heap_bh6_w23_30_d1 <=  heap_bh6_w23_30;
            heap_bh6_w24_31_d1 <=  heap_bh6_w24_31;
            heap_bh6_w24_32_d1 <=  heap_bh6_w24_32;
            heap_bh6_w25_33_d1 <=  heap_bh6_w25_33;
            heap_bh6_w26_34_d1 <=  heap_bh6_w26_34;
            heap_bh6_w34_38_d1 <=  heap_bh6_w34_38;
            heap_bh6_w26_35_d1 <=  heap_bh6_w26_35;
            heap_bh6_w27_37_d1 <=  heap_bh6_w27_37;
            heap_bh6_w28_36_d1 <=  heap_bh6_w28_36;
            heap_bh6_w69_25_d1 <=  heap_bh6_w69_25;
            heap_bh6_w29_39_d1 <=  heap_bh6_w29_39;
            heap_bh6_w30_37_d1 <=  heap_bh6_w30_37;
            heap_bh6_w31_40_d1 <=  heap_bh6_w31_40;
            heap_bh6_w31_41_d1 <=  heap_bh6_w31_41;
            heap_bh6_w32_37_d1 <=  heap_bh6_w32_37;
            heap_bh6_w33_39_d1 <=  heap_bh6_w33_39;
            heap_bh6_w33_40_d1 <=  heap_bh6_w33_40;
            heap_bh6_w34_40_d1 <=  heap_bh6_w34_40;
            heap_bh6_w35_38_d1 <=  heap_bh6_w35_38;
            heap_bh6_w35_39_d1 <=  heap_bh6_w35_39;
            heap_bh6_w36_38_d1 <=  heap_bh6_w36_38;
            heap_bh6_w37_40_d1 <=  heap_bh6_w37_40;
            heap_bh6_w37_41_d1 <=  heap_bh6_w37_41;
            heap_bh6_w38_38_d1 <=  heap_bh6_w38_38;
            heap_bh6_w80_6_d1 <=  heap_bh6_w80_6;
            heap_bh6_w81_7_d1 <=  heap_bh6_w81_7;
            heap_bh6_w81_8_d1 <=  heap_bh6_w81_8;
            heap_bh6_w82_6_d1 <=  heap_bh6_w82_6;
            heap_bh6_w83_7_d1 <=  heap_bh6_w83_7;
            heap_bh6_w83_8_d1 <=  heap_bh6_w83_8;
            heap_bh6_w84_6_d1 <=  heap_bh6_w84_6;
            heap_bh6_w85_7_d1 <=  heap_bh6_w85_7;
            heap_bh6_w85_8_d1 <=  heap_bh6_w85_8;
            heap_bh6_w86_6_d1 <=  heap_bh6_w86_6;
            heap_bh6_w87_7_d1 <=  heap_bh6_w87_7;
            heap_bh6_w87_8_d1 <=  heap_bh6_w87_8;
            heap_bh6_w88_6_d1 <=  heap_bh6_w88_6;
            heap_bh6_w89_7_d1 <=  heap_bh6_w89_7;
            heap_bh6_w89_8_d1 <=  heap_bh6_w89_8;
            heap_bh6_w90_6_d1 <=  heap_bh6_w90_6;
            heap_bh6_w91_7_d1 <=  heap_bh6_w91_7;
            heap_bh6_w91_8_d1 <=  heap_bh6_w91_8;
            heap_bh6_w92_4_d1 <=  heap_bh6_w92_4;
            heap_bh6_w103_3_d1 <=  heap_bh6_w103_3;
            heap_bh6_w104_2_d1 <=  heap_bh6_w104_2;
            heap_bh6_w47_41_d1 <=  heap_bh6_w47_41;
            heap_bh6_w48_43_d1 <=  heap_bh6_w48_43;
            heap_bh6_w55_42_d1 <=  heap_bh6_w55_42;
            heap_bh6_w58_42_d1 <=  heap_bh6_w58_42;
            heap_bh6_w61_43_d1 <=  heap_bh6_w61_43;
            heap_bh6_w67_34_d1 <=  heap_bh6_w67_34;
            heap_bh6_w68_33_d1 <=  heap_bh6_w68_33;
            heap_bh6_w68_34_d1 <=  heap_bh6_w68_34;
            heap_bh6_w69_26_d1 <=  heap_bh6_w69_26;
            heap_bh6_w72_20_d1 <=  heap_bh6_w72_20;
            heap_bh6_w75_11_d1 <=  heap_bh6_w75_11;
            heap_bh6_w76_11_d1 <=  heap_bh6_w76_11;
            heap_bh6_w79_9_d1 <=  heap_bh6_w79_9;
            heap_bh6_w80_7_d1 <=  heap_bh6_w80_7;
            heap_bh6_w93_6_d1 <=  heap_bh6_w93_6;
            heap_bh6_w94_4_d1 <=  heap_bh6_w94_4;
            heap_bh6_w105_3_d1 <=  heap_bh6_w105_3;
            heap_bh6_w106_2_d1 <=  heap_bh6_w106_2;
            heap_bh6_w39_39_d1 <=  heap_bh6_w39_39;
            heap_bh6_w40_41_d1 <=  heap_bh6_w40_41;
            heap_bh6_w43_41_d1 <=  heap_bh6_w43_41;
            heap_bh6_w46_40_d1 <=  heap_bh6_w46_40;
            heap_bh6_w47_42_d1 <=  heap_bh6_w47_42;
            heap_bh6_w49_41_d1 <=  heap_bh6_w49_41;
            heap_bh6_w50_42_d1 <=  heap_bh6_w50_42;
            heap_bh6_w73_20_d1 <=  heap_bh6_w73_20;
            heap_bh6_w74_18_d1 <=  heap_bh6_w74_18;
            heap_bh6_w75_12_d1 <=  heap_bh6_w75_12;
            heap_bh6_w95_6_d1 <=  heap_bh6_w95_6;
            heap_bh6_w96_4_d1 <=  heap_bh6_w96_4;
            heap_bh6_w107_3_d1 <=  heap_bh6_w107_3;
            heap_bh6_w108_2_d1 <=  heap_bh6_w108_2;
            heap_bh6_w109_1_d1 <=  heap_bh6_w109_1;
            heap_bh6_w41_40_d1 <=  heap_bh6_w41_40;
            heap_bh6_w42_40_d1 <=  heap_bh6_w42_40;
            heap_bh6_w43_42_d1 <=  heap_bh6_w43_42;
            heap_bh6_w44_41_d1 <=  heap_bh6_w44_41;
            heap_bh6_w45_41_d1 <=  heap_bh6_w45_41;
            heap_bh6_w46_41_d1 <=  heap_bh6_w46_41;
            heap_bh6_w56_44_d1 <=  heap_bh6_w56_44;
            heap_bh6_w57_44_d1 <=  heap_bh6_w57_44;
            heap_bh6_w58_43_d1 <=  heap_bh6_w58_43;
            heap_bh6_w59_44_d1 <=  heap_bh6_w59_44;
            heap_bh6_w60_44_d1 <=  heap_bh6_w60_44;
            heap_bh6_w61_44_d1 <=  heap_bh6_w61_44;
            heap_bh6_w62_45_d1 <=  heap_bh6_w62_45;
            heap_bh6_w63_43_d1 <=  heap_bh6_w63_43;
            heap_bh6_w66_37_d1 <=  heap_bh6_w66_37;
            heap_bh6_w67_35_d1 <=  heap_bh6_w67_35;
            heap_bh6_w70_26_d1 <=  heap_bh6_w70_26;
            heap_bh6_w71_25_d1 <=  heap_bh6_w71_25;
            heap_bh6_w72_21_d1 <=  heap_bh6_w72_21;
            heap_bh6_w77_11_d1 <=  heap_bh6_w77_11;
            heap_bh6_w78_9_d1 <=  heap_bh6_w78_9;
            heap_bh6_w79_10_d1 <=  heap_bh6_w79_10;
            heap_bh6_w51_44_d1 <=  heap_bh6_w51_44;
            heap_bh6_w52_42_d1 <=  heap_bh6_w52_42;
            heap_bh6_w97_6_d1 <=  heap_bh6_w97_6;
            heap_bh6_w98_4_d1 <=  heap_bh6_w98_4;
            heap_bh6_w64_45_d1 <=  heap_bh6_w64_45;
            heap_bh6_w65_43_d1 <=  heap_bh6_w65_43;
            heap_bh6_w66_38_d1 <=  heap_bh6_w66_38;
            heap_bh6_w99_6_d1 <=  heap_bh6_w99_6;
            heap_bh6_w100_4_d1 <=  heap_bh6_w100_4;
            heap_bh6_w53_44_d1 <=  heap_bh6_w53_44;
            heap_bh6_w54_44_d1 <=  heap_bh6_w54_44;
            heap_bh6_w55_43_d1 <=  heap_bh6_w55_43;
            heap_bh6_w101_6_d1 <=  heap_bh6_w101_6;
            heap_bh6_w102_3_d1 <=  heap_bh6_w102_3;
            heap_bh6_w103_4_d1 <=  heap_bh6_w103_4;
         end if;
      end process;
   XX_m5 <= X ;
   YY_m5 <= Y ;
   -- code generated by IntMultiplier::buildHeapLogicOnly()
   -- buildheaplogiconly called for lsbX=0 lsbY=46 msbX=15 msbY=63
   Xp_m5b7 <= XX_m5(14 downto 0) & "";
   Yp_m5b7 <= YY_m5(62 downto 46) & "0";
   x_m5b7_0 <= Xp_m5b7(2 downto 0);
   x_m5b7_1 <= Xp_m5b7(5 downto 3);
   x_m5b7_2 <= Xp_m5b7(8 downto 6);
   x_m5b7_3 <= Xp_m5b7(11 downto 9);
   x_m5b7_4 <= Xp_m5b7(14 downto 12);
   y_m5b7_0 <= Yp_m5b7(2 downto 0);
   y_m5b7_1 <= Yp_m5b7(5 downto 3);
   y_m5b7_2 <= Yp_m5b7(8 downto 6);
   y_m5b7_3 <= Yp_m5b7(11 downto 9);
   y_m5b7_4 <= Yp_m5b7(14 downto 12);
   y_m5b7_5 <= Yp_m5b7(17 downto 15);
   ----------------Synchro barrier, entering cycle 0----------------
   -- Partial product row number 0
   Y0X0_7_m5 <= y_m5b7_0 & x_m5b7_0;
   PP_m5_7X0Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X0_7_m5,
                 Y => PP7X0Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w46_0 <= PP7X0Y0_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w47_0 <= PP7X0Y0_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w48_0 <= PP7X0Y0_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w49_0 <= PP7X0Y0_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w50_0 <= PP7X0Y0_m5(5); -- cycle= 0 cp= 5.656e-10

   Y0X1_7_m5 <= y_m5b7_0 & x_m5b7_1;
   PP_m5_7X1Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X1_7_m5,
                 Y => PP7X1Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w49_1 <= PP7X1Y0_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w50_1 <= PP7X1Y0_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w51_0 <= PP7X1Y0_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w52_0 <= PP7X1Y0_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w53_0 <= PP7X1Y0_m5(5); -- cycle= 0 cp= 5.656e-10

   Y0X2_7_m5 <= y_m5b7_0 & x_m5b7_2;
   PP_m5_7X2Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X2_7_m5,
                 Y => PP7X2Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w52_1 <= PP7X2Y0_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w53_1 <= PP7X2Y0_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w54_0 <= PP7X2Y0_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w55_0 <= PP7X2Y0_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w56_0 <= PP7X2Y0_m5(5); -- cycle= 0 cp= 5.656e-10

   Y0X3_7_m5 <= y_m5b7_0 & x_m5b7_3;
   PP_m5_7X3Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X3_7_m5,
                 Y => PP7X3Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w55_1 <= PP7X3Y0_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w56_1 <= PP7X3Y0_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w57_0 <= PP7X3Y0_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w58_0 <= PP7X3Y0_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w59_0 <= PP7X3Y0_m5(5); -- cycle= 0 cp= 5.656e-10

   Y0X4_7_m5 <= y_m5b7_0 & x_m5b7_4;
   PP_m5_7X4Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X4_7_m5,
                 Y => PP7X4Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w58_1 <= PP7X4Y0_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w59_1 <= PP7X4Y0_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w60_0 <= PP7X4Y0_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w61_0 <= PP7X4Y0_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w62_0 <= PP7X4Y0_m5(5); -- cycle= 0 cp= 5.656e-10

   -- Partial product row number 1
   Y1X0_7_m5 <= y_m5b7_1 & x_m5b7_0;
   PP_m5_7X0Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X0_7_m5,
                 Y => PP7X0Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w48_1 <= PP7X0Y1_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w49_2 <= PP7X0Y1_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w50_2 <= PP7X0Y1_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w51_1 <= PP7X0Y1_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w52_2 <= PP7X0Y1_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w53_2 <= PP7X0Y1_m5(5); -- cycle= 0 cp= 5.656e-10

   Y1X1_7_m5 <= y_m5b7_1 & x_m5b7_1;
   PP_m5_7X1Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X1_7_m5,
                 Y => PP7X1Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w51_2 <= PP7X1Y1_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w52_3 <= PP7X1Y1_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w53_3 <= PP7X1Y1_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w54_1 <= PP7X1Y1_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w55_2 <= PP7X1Y1_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w56_2 <= PP7X1Y1_m5(5); -- cycle= 0 cp= 5.656e-10

   Y1X2_7_m5 <= y_m5b7_1 & x_m5b7_2;
   PP_m5_7X2Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X2_7_m5,
                 Y => PP7X2Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w54_2 <= PP7X2Y1_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w55_3 <= PP7X2Y1_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w56_3 <= PP7X2Y1_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w57_1 <= PP7X2Y1_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w58_2 <= PP7X2Y1_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w59_2 <= PP7X2Y1_m5(5); -- cycle= 0 cp= 5.656e-10

   Y1X3_7_m5 <= y_m5b7_1 & x_m5b7_3;
   PP_m5_7X3Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X3_7_m5,
                 Y => PP7X3Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w57_2 <= PP7X3Y1_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w58_3 <= PP7X3Y1_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w59_3 <= PP7X3Y1_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w60_1 <= PP7X3Y1_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w61_1 <= PP7X3Y1_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w62_1 <= PP7X3Y1_m5(5); -- cycle= 0 cp= 5.656e-10

   Y1X4_7_m5 <= y_m5b7_1 & x_m5b7_4;
   PP_m5_7X4Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X4_7_m5,
                 Y => PP7X4Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w60_2 <= PP7X4Y1_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w61_2 <= PP7X4Y1_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w62_2 <= PP7X4Y1_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w63_0 <= PP7X4Y1_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w64_0 <= PP7X4Y1_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w65_0 <= PP7X4Y1_m5(5); -- cycle= 0 cp= 5.656e-10

   -- Partial product row number 2
   Y2X0_7_m5 <= y_m5b7_2 & x_m5b7_0;
   PP_m5_7X0Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X0_7_m5,
                 Y => PP7X0Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w51_3 <= PP7X0Y2_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w52_4 <= PP7X0Y2_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w53_4 <= PP7X0Y2_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w54_3 <= PP7X0Y2_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w55_4 <= PP7X0Y2_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w56_4 <= PP7X0Y2_m5(5); -- cycle= 0 cp= 5.656e-10

   Y2X1_7_m5 <= y_m5b7_2 & x_m5b7_1;
   PP_m5_7X1Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X1_7_m5,
                 Y => PP7X1Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w54_4 <= PP7X1Y2_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w55_5 <= PP7X1Y2_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w56_5 <= PP7X1Y2_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w57_3 <= PP7X1Y2_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w58_4 <= PP7X1Y2_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w59_4 <= PP7X1Y2_m5(5); -- cycle= 0 cp= 5.656e-10

   Y2X2_7_m5 <= y_m5b7_2 & x_m5b7_2;
   PP_m5_7X2Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X2_7_m5,
                 Y => PP7X2Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w57_4 <= PP7X2Y2_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w58_5 <= PP7X2Y2_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w59_5 <= PP7X2Y2_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w60_3 <= PP7X2Y2_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w61_3 <= PP7X2Y2_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w62_3 <= PP7X2Y2_m5(5); -- cycle= 0 cp= 5.656e-10

   Y2X3_7_m5 <= y_m5b7_2 & x_m5b7_3;
   PP_m5_7X3Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X3_7_m5,
                 Y => PP7X3Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w60_4 <= PP7X3Y2_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w61_4 <= PP7X3Y2_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w62_4 <= PP7X3Y2_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w63_1 <= PP7X3Y2_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w64_1 <= PP7X3Y2_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w65_1 <= PP7X3Y2_m5(5); -- cycle= 0 cp= 5.656e-10

   Y2X4_7_m5 <= y_m5b7_2 & x_m5b7_4;
   PP_m5_7X4Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X4_7_m5,
                 Y => PP7X4Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w63_2 <= PP7X4Y2_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w64_2 <= PP7X4Y2_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w65_2 <= PP7X4Y2_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w66_0 <= PP7X4Y2_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w67_0 <= PP7X4Y2_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w68_0 <= PP7X4Y2_m5(5); -- cycle= 0 cp= 5.656e-10

   -- Partial product row number 3
   Y3X0_7_m5 <= y_m5b7_3 & x_m5b7_0;
   PP_m5_7X0Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X0_7_m5,
                 Y => PP7X0Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w54_5 <= PP7X0Y3_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w55_6 <= PP7X0Y3_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w56_6 <= PP7X0Y3_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w57_5 <= PP7X0Y3_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w58_6 <= PP7X0Y3_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w59_6 <= PP7X0Y3_m5(5); -- cycle= 0 cp= 5.656e-10

   Y3X1_7_m5 <= y_m5b7_3 & x_m5b7_1;
   PP_m5_7X1Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X1_7_m5,
                 Y => PP7X1Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w57_6 <= PP7X1Y3_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w58_7 <= PP7X1Y3_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w59_7 <= PP7X1Y3_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w60_5 <= PP7X1Y3_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w61_5 <= PP7X1Y3_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w62_5 <= PP7X1Y3_m5(5); -- cycle= 0 cp= 5.656e-10

   Y3X2_7_m5 <= y_m5b7_3 & x_m5b7_2;
   PP_m5_7X2Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X2_7_m5,
                 Y => PP7X2Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w60_6 <= PP7X2Y3_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w61_6 <= PP7X2Y3_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w62_6 <= PP7X2Y3_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w63_3 <= PP7X2Y3_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w64_3 <= PP7X2Y3_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w65_3 <= PP7X2Y3_m5(5); -- cycle= 0 cp= 5.656e-10

   Y3X3_7_m5 <= y_m5b7_3 & x_m5b7_3;
   PP_m5_7X3Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X3_7_m5,
                 Y => PP7X3Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w63_4 <= PP7X3Y3_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w64_4 <= PP7X3Y3_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w65_4 <= PP7X3Y3_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w66_1 <= PP7X3Y3_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w67_1 <= PP7X3Y3_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w68_1 <= PP7X3Y3_m5(5); -- cycle= 0 cp= 5.656e-10

   Y3X4_7_m5 <= y_m5b7_3 & x_m5b7_4;
   PP_m5_7X4Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X4_7_m5,
                 Y => PP7X4Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w66_2 <= PP7X4Y3_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w67_2 <= PP7X4Y3_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w68_2 <= PP7X4Y3_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w69_0 <= PP7X4Y3_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w70_0 <= PP7X4Y3_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w71_0 <= PP7X4Y3_m5(5); -- cycle= 0 cp= 5.656e-10

   -- Partial product row number 4
   Y4X0_7_m5 <= y_m5b7_4 & x_m5b7_0;
   PP_m5_7X0Y4_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y4X0_7_m5,
                 Y => PP7X0Y4_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w57_7 <= PP7X0Y4_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w58_8 <= PP7X0Y4_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w59_8 <= PP7X0Y4_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w60_7 <= PP7X0Y4_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w61_7 <= PP7X0Y4_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w62_7 <= PP7X0Y4_m5(5); -- cycle= 0 cp= 5.656e-10

   Y4X1_7_m5 <= y_m5b7_4 & x_m5b7_1;
   PP_m5_7X1Y4_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y4X1_7_m5,
                 Y => PP7X1Y4_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w60_8 <= PP7X1Y4_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w61_8 <= PP7X1Y4_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w62_8 <= PP7X1Y4_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w63_5 <= PP7X1Y4_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w64_5 <= PP7X1Y4_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w65_5 <= PP7X1Y4_m5(5); -- cycle= 0 cp= 5.656e-10

   Y4X2_7_m5 <= y_m5b7_4 & x_m5b7_2;
   PP_m5_7X2Y4_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y4X2_7_m5,
                 Y => PP7X2Y4_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w63_6 <= PP7X2Y4_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w64_6 <= PP7X2Y4_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w65_6 <= PP7X2Y4_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w66_3 <= PP7X2Y4_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w67_3 <= PP7X2Y4_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w68_3 <= PP7X2Y4_m5(5); -- cycle= 0 cp= 5.656e-10

   Y4X3_7_m5 <= y_m5b7_4 & x_m5b7_3;
   PP_m5_7X3Y4_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y4X3_7_m5,
                 Y => PP7X3Y4_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w66_4 <= PP7X3Y4_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w67_4 <= PP7X3Y4_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w68_4 <= PP7X3Y4_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w69_1 <= PP7X3Y4_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w70_1 <= PP7X3Y4_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w71_1 <= PP7X3Y4_m5(5); -- cycle= 0 cp= 5.656e-10

   Y4X4_7_m5 <= y_m5b7_4 & x_m5b7_4;
   PP_m5_7X4Y4_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y4X4_7_m5,
                 Y => PP7X4Y4_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w69_2 <= PP7X4Y4_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w70_2 <= PP7X4Y4_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w71_2 <= PP7X4Y4_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w72_0 <= PP7X4Y4_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w73_0 <= PP7X4Y4_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w74_0 <= PP7X4Y4_m5(5); -- cycle= 0 cp= 5.656e-10

   -- Partial product row number 5
   Y5X0_7_m5 <= y_m5b7_5 & x_m5b7_0;
   PP_m5_7X0Y5_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y5X0_7_m5,
                 Y => PP7X0Y5_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w60_9 <= PP7X0Y5_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w61_9 <= PP7X0Y5_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w62_9 <= PP7X0Y5_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w63_7 <= PP7X0Y5_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w64_7 <= PP7X0Y5_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w65_7 <= PP7X0Y5_m5(5); -- cycle= 0 cp= 5.656e-10

   Y5X1_7_m5 <= y_m5b7_5 & x_m5b7_1;
   PP_m5_7X1Y5_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y5X1_7_m5,
                 Y => PP7X1Y5_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w63_8 <= PP7X1Y5_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w64_8 <= PP7X1Y5_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w65_8 <= PP7X1Y5_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w66_5 <= PP7X1Y5_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w67_5 <= PP7X1Y5_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w68_5 <= PP7X1Y5_m5(5); -- cycle= 0 cp= 5.656e-10

   Y5X2_7_m5 <= y_m5b7_5 & x_m5b7_2;
   PP_m5_7X2Y5_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y5X2_7_m5,
                 Y => PP7X2Y5_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w66_6 <= PP7X2Y5_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w67_6 <= PP7X2Y5_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w68_6 <= PP7X2Y5_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w69_3 <= PP7X2Y5_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w70_3 <= PP7X2Y5_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w71_3 <= PP7X2Y5_m5(5); -- cycle= 0 cp= 5.656e-10

   Y5X3_7_m5 <= y_m5b7_5 & x_m5b7_3;
   PP_m5_7X3Y5_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y5X3_7_m5,
                 Y => PP7X3Y5_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w69_4 <= PP7X3Y5_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w70_4 <= PP7X3Y5_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w71_4 <= PP7X3Y5_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w72_1 <= PP7X3Y5_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w73_1 <= PP7X3Y5_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w74_1 <= PP7X3Y5_m5(5); -- cycle= 0 cp= 5.656e-10

   Y5X4_7_m5 <= y_m5b7_5 & x_m5b7_4;
   PP_m5_7X4Y5_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y5X4_7_m5,
                 Y => PP7X4Y5_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w72_2 <= PP7X4Y5_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w73_2 <= PP7X4Y5_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w74_2 <= PP7X4Y5_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w75_0 <= PP7X4Y5_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w76_0 <= PP7X4Y5_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w77_0 <= PP7X4Y5_m5(5); -- cycle= 0 cp= 5.656e-10

   -- code generated by IntMultiplier::buildHeapLogicOnly()
   -- buildheaplogiconly called for lsbX=0 lsbY=29 msbX=15 msbY=46
   Xp_m5b39 <= XX_m5(14 downto 0) & "";
   Yp_m5b39 <= YY_m5(45 downto 29) & "0";
   x_m5b39_0 <= Xp_m5b39(2 downto 0);
   x_m5b39_1 <= Xp_m5b39(5 downto 3);
   x_m5b39_2 <= Xp_m5b39(8 downto 6);
   x_m5b39_3 <= Xp_m5b39(11 downto 9);
   x_m5b39_4 <= Xp_m5b39(14 downto 12);
   y_m5b39_0 <= Yp_m5b39(2 downto 0);
   y_m5b39_1 <= Yp_m5b39(5 downto 3);
   y_m5b39_2 <= Yp_m5b39(8 downto 6);
   y_m5b39_3 <= Yp_m5b39(11 downto 9);
   y_m5b39_4 <= Yp_m5b39(14 downto 12);
   y_m5b39_5 <= Yp_m5b39(17 downto 15);
   ----------------Synchro barrier, entering cycle 0----------------
   -- Partial product row number 0
   Y0X0_39_m5 <= y_m5b39_0 & x_m5b39_0;
   PP_m5_39X0Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X0_39_m5,
                 Y => PP39X0Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w29_0 <= PP39X0Y0_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w30_0 <= PP39X0Y0_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w31_0 <= PP39X0Y0_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w32_0 <= PP39X0Y0_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w33_0 <= PP39X0Y0_m5(5); -- cycle= 0 cp= 5.656e-10

   Y0X1_39_m5 <= y_m5b39_0 & x_m5b39_1;
   PP_m5_39X1Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X1_39_m5,
                 Y => PP39X1Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w32_1 <= PP39X1Y0_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w33_1 <= PP39X1Y0_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w34_0 <= PP39X1Y0_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w35_0 <= PP39X1Y0_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w36_0 <= PP39X1Y0_m5(5); -- cycle= 0 cp= 5.656e-10

   Y0X2_39_m5 <= y_m5b39_0 & x_m5b39_2;
   PP_m5_39X2Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X2_39_m5,
                 Y => PP39X2Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w35_1 <= PP39X2Y0_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w36_1 <= PP39X2Y0_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w37_0 <= PP39X2Y0_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w38_0 <= PP39X2Y0_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w39_0 <= PP39X2Y0_m5(5); -- cycle= 0 cp= 5.656e-10

   Y0X3_39_m5 <= y_m5b39_0 & x_m5b39_3;
   PP_m5_39X3Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X3_39_m5,
                 Y => PP39X3Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w38_1 <= PP39X3Y0_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w39_1 <= PP39X3Y0_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w40_0 <= PP39X3Y0_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w41_0 <= PP39X3Y0_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w42_0 <= PP39X3Y0_m5(5); -- cycle= 0 cp= 5.656e-10

   Y0X4_39_m5 <= y_m5b39_0 & x_m5b39_4;
   PP_m5_39X4Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X4_39_m5,
                 Y => PP39X4Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w41_1 <= PP39X4Y0_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w42_1 <= PP39X4Y0_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w43_0 <= PP39X4Y0_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w44_0 <= PP39X4Y0_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w45_0 <= PP39X4Y0_m5(5); -- cycle= 0 cp= 5.656e-10

   -- Partial product row number 1
   Y1X0_39_m5 <= y_m5b39_1 & x_m5b39_0;
   PP_m5_39X0Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X0_39_m5,
                 Y => PP39X0Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w31_1 <= PP39X0Y1_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w32_2 <= PP39X0Y1_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w33_2 <= PP39X0Y1_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w34_1 <= PP39X0Y1_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w35_2 <= PP39X0Y1_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w36_2 <= PP39X0Y1_m5(5); -- cycle= 0 cp= 5.656e-10

   Y1X1_39_m5 <= y_m5b39_1 & x_m5b39_1;
   PP_m5_39X1Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X1_39_m5,
                 Y => PP39X1Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w34_2 <= PP39X1Y1_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w35_3 <= PP39X1Y1_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w36_3 <= PP39X1Y1_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w37_1 <= PP39X1Y1_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w38_2 <= PP39X1Y1_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w39_2 <= PP39X1Y1_m5(5); -- cycle= 0 cp= 5.656e-10

   Y1X2_39_m5 <= y_m5b39_1 & x_m5b39_2;
   PP_m5_39X2Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X2_39_m5,
                 Y => PP39X2Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w37_2 <= PP39X2Y1_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w38_3 <= PP39X2Y1_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w39_3 <= PP39X2Y1_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w40_1 <= PP39X2Y1_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w41_2 <= PP39X2Y1_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w42_2 <= PP39X2Y1_m5(5); -- cycle= 0 cp= 5.656e-10

   Y1X3_39_m5 <= y_m5b39_1 & x_m5b39_3;
   PP_m5_39X3Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X3_39_m5,
                 Y => PP39X3Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w40_2 <= PP39X3Y1_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w41_3 <= PP39X3Y1_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w42_3 <= PP39X3Y1_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w43_1 <= PP39X3Y1_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w44_1 <= PP39X3Y1_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w45_1 <= PP39X3Y1_m5(5); -- cycle= 0 cp= 5.656e-10

   Y1X4_39_m5 <= y_m5b39_1 & x_m5b39_4;
   PP_m5_39X4Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X4_39_m5,
                 Y => PP39X4Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w43_2 <= PP39X4Y1_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w44_2 <= PP39X4Y1_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w45_2 <= PP39X4Y1_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w46_1 <= PP39X4Y1_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w47_1 <= PP39X4Y1_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w48_2 <= PP39X4Y1_m5(5); -- cycle= 0 cp= 5.656e-10

   -- Partial product row number 2
   Y2X0_39_m5 <= y_m5b39_2 & x_m5b39_0;
   PP_m5_39X0Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X0_39_m5,
                 Y => PP39X0Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w34_3 <= PP39X0Y2_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w35_4 <= PP39X0Y2_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w36_4 <= PP39X0Y2_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w37_3 <= PP39X0Y2_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w38_4 <= PP39X0Y2_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w39_4 <= PP39X0Y2_m5(5); -- cycle= 0 cp= 5.656e-10

   Y2X1_39_m5 <= y_m5b39_2 & x_m5b39_1;
   PP_m5_39X1Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X1_39_m5,
                 Y => PP39X1Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w37_4 <= PP39X1Y2_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w38_5 <= PP39X1Y2_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w39_5 <= PP39X1Y2_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w40_3 <= PP39X1Y2_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w41_4 <= PP39X1Y2_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w42_4 <= PP39X1Y2_m5(5); -- cycle= 0 cp= 5.656e-10

   Y2X2_39_m5 <= y_m5b39_2 & x_m5b39_2;
   PP_m5_39X2Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X2_39_m5,
                 Y => PP39X2Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w40_4 <= PP39X2Y2_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w41_5 <= PP39X2Y2_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w42_5 <= PP39X2Y2_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w43_3 <= PP39X2Y2_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w44_3 <= PP39X2Y2_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w45_3 <= PP39X2Y2_m5(5); -- cycle= 0 cp= 5.656e-10

   Y2X3_39_m5 <= y_m5b39_2 & x_m5b39_3;
   PP_m5_39X3Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X3_39_m5,
                 Y => PP39X3Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w43_4 <= PP39X3Y2_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w44_4 <= PP39X3Y2_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w45_4 <= PP39X3Y2_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w46_2 <= PP39X3Y2_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w47_2 <= PP39X3Y2_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w48_3 <= PP39X3Y2_m5(5); -- cycle= 0 cp= 5.656e-10

   Y2X4_39_m5 <= y_m5b39_2 & x_m5b39_4;
   PP_m5_39X4Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X4_39_m5,
                 Y => PP39X4Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w46_3 <= PP39X4Y2_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w47_3 <= PP39X4Y2_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w48_4 <= PP39X4Y2_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w49_3 <= PP39X4Y2_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w50_3 <= PP39X4Y2_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w51_4 <= PP39X4Y2_m5(5); -- cycle= 0 cp= 5.656e-10

   -- Partial product row number 3
   Y3X0_39_m5 <= y_m5b39_3 & x_m5b39_0;
   PP_m5_39X0Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X0_39_m5,
                 Y => PP39X0Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w37_5 <= PP39X0Y3_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w38_6 <= PP39X0Y3_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w39_6 <= PP39X0Y3_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w40_5 <= PP39X0Y3_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w41_6 <= PP39X0Y3_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w42_6 <= PP39X0Y3_m5(5); -- cycle= 0 cp= 5.656e-10

   Y3X1_39_m5 <= y_m5b39_3 & x_m5b39_1;
   PP_m5_39X1Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X1_39_m5,
                 Y => PP39X1Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w40_6 <= PP39X1Y3_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w41_7 <= PP39X1Y3_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w42_7 <= PP39X1Y3_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w43_5 <= PP39X1Y3_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w44_5 <= PP39X1Y3_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w45_5 <= PP39X1Y3_m5(5); -- cycle= 0 cp= 5.656e-10

   Y3X2_39_m5 <= y_m5b39_3 & x_m5b39_2;
   PP_m5_39X2Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X2_39_m5,
                 Y => PP39X2Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w43_6 <= PP39X2Y3_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w44_6 <= PP39X2Y3_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w45_6 <= PP39X2Y3_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w46_4 <= PP39X2Y3_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w47_4 <= PP39X2Y3_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w48_5 <= PP39X2Y3_m5(5); -- cycle= 0 cp= 5.656e-10

   Y3X3_39_m5 <= y_m5b39_3 & x_m5b39_3;
   PP_m5_39X3Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X3_39_m5,
                 Y => PP39X3Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w46_5 <= PP39X3Y3_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w47_5 <= PP39X3Y3_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w48_6 <= PP39X3Y3_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w49_4 <= PP39X3Y3_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w50_4 <= PP39X3Y3_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w51_5 <= PP39X3Y3_m5(5); -- cycle= 0 cp= 5.656e-10

   Y3X4_39_m5 <= y_m5b39_3 & x_m5b39_4;
   PP_m5_39X4Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X4_39_m5,
                 Y => PP39X4Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w49_5 <= PP39X4Y3_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w50_5 <= PP39X4Y3_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w51_6 <= PP39X4Y3_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w52_5 <= PP39X4Y3_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w53_5 <= PP39X4Y3_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w54_6 <= PP39X4Y3_m5(5); -- cycle= 0 cp= 5.656e-10

   -- Partial product row number 4
   Y4X0_39_m5 <= y_m5b39_4 & x_m5b39_0;
   PP_m5_39X0Y4_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y4X0_39_m5,
                 Y => PP39X0Y4_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w40_7 <= PP39X0Y4_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w41_8 <= PP39X0Y4_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w42_8 <= PP39X0Y4_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w43_7 <= PP39X0Y4_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w44_7 <= PP39X0Y4_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w45_7 <= PP39X0Y4_m5(5); -- cycle= 0 cp= 5.656e-10

   Y4X1_39_m5 <= y_m5b39_4 & x_m5b39_1;
   PP_m5_39X1Y4_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y4X1_39_m5,
                 Y => PP39X1Y4_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w43_8 <= PP39X1Y4_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w44_8 <= PP39X1Y4_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w45_8 <= PP39X1Y4_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w46_6 <= PP39X1Y4_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w47_6 <= PP39X1Y4_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w48_7 <= PP39X1Y4_m5(5); -- cycle= 0 cp= 5.656e-10

   Y4X2_39_m5 <= y_m5b39_4 & x_m5b39_2;
   PP_m5_39X2Y4_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y4X2_39_m5,
                 Y => PP39X2Y4_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w46_7 <= PP39X2Y4_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w47_7 <= PP39X2Y4_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w48_8 <= PP39X2Y4_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w49_6 <= PP39X2Y4_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w50_6 <= PP39X2Y4_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w51_7 <= PP39X2Y4_m5(5); -- cycle= 0 cp= 5.656e-10

   Y4X3_39_m5 <= y_m5b39_4 & x_m5b39_3;
   PP_m5_39X3Y4_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y4X3_39_m5,
                 Y => PP39X3Y4_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w49_7 <= PP39X3Y4_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w50_7 <= PP39X3Y4_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w51_8 <= PP39X3Y4_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w52_6 <= PP39X3Y4_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w53_6 <= PP39X3Y4_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w54_7 <= PP39X3Y4_m5(5); -- cycle= 0 cp= 5.656e-10

   Y4X4_39_m5 <= y_m5b39_4 & x_m5b39_4;
   PP_m5_39X4Y4_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y4X4_39_m5,
                 Y => PP39X4Y4_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w52_7 <= PP39X4Y4_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w53_7 <= PP39X4Y4_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w54_8 <= PP39X4Y4_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w55_7 <= PP39X4Y4_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w56_7 <= PP39X4Y4_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w57_8 <= PP39X4Y4_m5(5); -- cycle= 0 cp= 5.656e-10

   -- Partial product row number 5
   Y5X0_39_m5 <= y_m5b39_5 & x_m5b39_0;
   PP_m5_39X0Y5_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y5X0_39_m5,
                 Y => PP39X0Y5_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w43_9 <= PP39X0Y5_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w44_9 <= PP39X0Y5_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w45_9 <= PP39X0Y5_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w46_8 <= PP39X0Y5_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w47_8 <= PP39X0Y5_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w48_9 <= PP39X0Y5_m5(5); -- cycle= 0 cp= 5.656e-10

   Y5X1_39_m5 <= y_m5b39_5 & x_m5b39_1;
   PP_m5_39X1Y5_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y5X1_39_m5,
                 Y => PP39X1Y5_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w46_9 <= PP39X1Y5_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w47_9 <= PP39X1Y5_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w48_10 <= PP39X1Y5_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w49_8 <= PP39X1Y5_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w50_8 <= PP39X1Y5_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w51_9 <= PP39X1Y5_m5(5); -- cycle= 0 cp= 5.656e-10

   Y5X2_39_m5 <= y_m5b39_5 & x_m5b39_2;
   PP_m5_39X2Y5_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y5X2_39_m5,
                 Y => PP39X2Y5_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w49_9 <= PP39X2Y5_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w50_9 <= PP39X2Y5_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w51_10 <= PP39X2Y5_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w52_8 <= PP39X2Y5_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w53_8 <= PP39X2Y5_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w54_9 <= PP39X2Y5_m5(5); -- cycle= 0 cp= 5.656e-10

   Y5X3_39_m5 <= y_m5b39_5 & x_m5b39_3;
   PP_m5_39X3Y5_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y5X3_39_m5,
                 Y => PP39X3Y5_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w52_9 <= PP39X3Y5_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w53_9 <= PP39X3Y5_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w54_10 <= PP39X3Y5_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w55_8 <= PP39X3Y5_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w56_8 <= PP39X3Y5_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w57_9 <= PP39X3Y5_m5(5); -- cycle= 0 cp= 5.656e-10

   Y5X4_39_m5 <= y_m5b39_5 & x_m5b39_4;
   PP_m5_39X4Y5_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y5X4_39_m5,
                 Y => PP39X4Y5_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w55_9 <= PP39X4Y5_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w56_9 <= PP39X4Y5_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w57_10 <= PP39X4Y5_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w58_9 <= PP39X4Y5_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w59_9 <= PP39X4Y5_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w60_10 <= PP39X4Y5_m5(5); -- cycle= 0 cp= 5.656e-10

   -- code generated by IntMultiplier::buildHeapLogicOnly()
   -- buildheaplogiconly called for lsbX=0 lsbY=12 msbX=15 msbY=29
   Xp_m5b71 <= XX_m5(14 downto 0) & "";
   Yp_m5b71 <= YY_m5(28 downto 12) & "0";
   x_m5b71_0 <= Xp_m5b71(2 downto 0);
   x_m5b71_1 <= Xp_m5b71(5 downto 3);
   x_m5b71_2 <= Xp_m5b71(8 downto 6);
   x_m5b71_3 <= Xp_m5b71(11 downto 9);
   x_m5b71_4 <= Xp_m5b71(14 downto 12);
   y_m5b71_0 <= Yp_m5b71(2 downto 0);
   y_m5b71_1 <= Yp_m5b71(5 downto 3);
   y_m5b71_2 <= Yp_m5b71(8 downto 6);
   y_m5b71_3 <= Yp_m5b71(11 downto 9);
   y_m5b71_4 <= Yp_m5b71(14 downto 12);
   y_m5b71_5 <= Yp_m5b71(17 downto 15);
   ----------------Synchro barrier, entering cycle 0----------------
   -- Partial product row number 0
   Y0X0_71_m5 <= y_m5b71_0 & x_m5b71_0;
   PP_m5_71X0Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X0_71_m5,
                 Y => PP71X0Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w12_0 <= PP71X0Y0_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w13_0 <= PP71X0Y0_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w14_0 <= PP71X0Y0_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w15_0 <= PP71X0Y0_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w16_0 <= PP71X0Y0_m5(5); -- cycle= 0 cp= 5.656e-10

   Y0X1_71_m5 <= y_m5b71_0 & x_m5b71_1;
   PP_m5_71X1Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X1_71_m5,
                 Y => PP71X1Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w15_1 <= PP71X1Y0_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w16_1 <= PP71X1Y0_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w17_0 <= PP71X1Y0_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w18_0 <= PP71X1Y0_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w19_0 <= PP71X1Y0_m5(5); -- cycle= 0 cp= 5.656e-10

   Y0X2_71_m5 <= y_m5b71_0 & x_m5b71_2;
   PP_m5_71X2Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X2_71_m5,
                 Y => PP71X2Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w18_1 <= PP71X2Y0_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w19_1 <= PP71X2Y0_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w20_0 <= PP71X2Y0_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w21_0 <= PP71X2Y0_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w22_0 <= PP71X2Y0_m5(5); -- cycle= 0 cp= 5.656e-10

   Y0X3_71_m5 <= y_m5b71_0 & x_m5b71_3;
   PP_m5_71X3Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X3_71_m5,
                 Y => PP71X3Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w21_1 <= PP71X3Y0_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w22_1 <= PP71X3Y0_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w23_0 <= PP71X3Y0_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w24_0 <= PP71X3Y0_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w25_0 <= PP71X3Y0_m5(5); -- cycle= 0 cp= 5.656e-10

   Y0X4_71_m5 <= y_m5b71_0 & x_m5b71_4;
   PP_m5_71X4Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X4_71_m5,
                 Y => PP71X4Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w24_1 <= PP71X4Y0_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w25_1 <= PP71X4Y0_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w26_0 <= PP71X4Y0_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w27_0 <= PP71X4Y0_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w28_0 <= PP71X4Y0_m5(5); -- cycle= 0 cp= 5.656e-10

   -- Partial product row number 1
   Y1X0_71_m5 <= y_m5b71_1 & x_m5b71_0;
   PP_m5_71X0Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X0_71_m5,
                 Y => PP71X0Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w14_1 <= PP71X0Y1_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w15_2 <= PP71X0Y1_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w16_2 <= PP71X0Y1_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w17_1 <= PP71X0Y1_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w18_2 <= PP71X0Y1_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w19_2 <= PP71X0Y1_m5(5); -- cycle= 0 cp= 5.656e-10

   Y1X1_71_m5 <= y_m5b71_1 & x_m5b71_1;
   PP_m5_71X1Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X1_71_m5,
                 Y => PP71X1Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w17_2 <= PP71X1Y1_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w18_3 <= PP71X1Y1_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w19_3 <= PP71X1Y1_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w20_1 <= PP71X1Y1_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w21_2 <= PP71X1Y1_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w22_2 <= PP71X1Y1_m5(5); -- cycle= 0 cp= 5.656e-10

   Y1X2_71_m5 <= y_m5b71_1 & x_m5b71_2;
   PP_m5_71X2Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X2_71_m5,
                 Y => PP71X2Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w20_2 <= PP71X2Y1_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w21_3 <= PP71X2Y1_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w22_3 <= PP71X2Y1_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w23_1 <= PP71X2Y1_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w24_2 <= PP71X2Y1_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w25_2 <= PP71X2Y1_m5(5); -- cycle= 0 cp= 5.656e-10

   Y1X3_71_m5 <= y_m5b71_1 & x_m5b71_3;
   PP_m5_71X3Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X3_71_m5,
                 Y => PP71X3Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w23_2 <= PP71X3Y1_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w24_3 <= PP71X3Y1_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w25_3 <= PP71X3Y1_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w26_1 <= PP71X3Y1_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w27_1 <= PP71X3Y1_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w28_1 <= PP71X3Y1_m5(5); -- cycle= 0 cp= 5.656e-10

   Y1X4_71_m5 <= y_m5b71_1 & x_m5b71_4;
   PP_m5_71X4Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X4_71_m5,
                 Y => PP71X4Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w26_2 <= PP71X4Y1_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w27_2 <= PP71X4Y1_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w28_2 <= PP71X4Y1_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w29_1 <= PP71X4Y1_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w30_1 <= PP71X4Y1_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w31_2 <= PP71X4Y1_m5(5); -- cycle= 0 cp= 5.656e-10

   -- Partial product row number 2
   Y2X0_71_m5 <= y_m5b71_2 & x_m5b71_0;
   PP_m5_71X0Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X0_71_m5,
                 Y => PP71X0Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w17_3 <= PP71X0Y2_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w18_4 <= PP71X0Y2_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w19_4 <= PP71X0Y2_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w20_3 <= PP71X0Y2_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w21_4 <= PP71X0Y2_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w22_4 <= PP71X0Y2_m5(5); -- cycle= 0 cp= 5.656e-10

   Y2X1_71_m5 <= y_m5b71_2 & x_m5b71_1;
   PP_m5_71X1Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X1_71_m5,
                 Y => PP71X1Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w20_4 <= PP71X1Y2_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w21_5 <= PP71X1Y2_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w22_5 <= PP71X1Y2_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w23_3 <= PP71X1Y2_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w24_4 <= PP71X1Y2_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w25_4 <= PP71X1Y2_m5(5); -- cycle= 0 cp= 5.656e-10

   Y2X2_71_m5 <= y_m5b71_2 & x_m5b71_2;
   PP_m5_71X2Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X2_71_m5,
                 Y => PP71X2Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w23_4 <= PP71X2Y2_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w24_5 <= PP71X2Y2_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w25_5 <= PP71X2Y2_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w26_3 <= PP71X2Y2_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w27_3 <= PP71X2Y2_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w28_3 <= PP71X2Y2_m5(5); -- cycle= 0 cp= 5.656e-10

   Y2X3_71_m5 <= y_m5b71_2 & x_m5b71_3;
   PP_m5_71X3Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X3_71_m5,
                 Y => PP71X3Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w26_4 <= PP71X3Y2_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w27_4 <= PP71X3Y2_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w28_4 <= PP71X3Y2_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w29_2 <= PP71X3Y2_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w30_2 <= PP71X3Y2_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w31_3 <= PP71X3Y2_m5(5); -- cycle= 0 cp= 5.656e-10

   Y2X4_71_m5 <= y_m5b71_2 & x_m5b71_4;
   PP_m5_71X4Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X4_71_m5,
                 Y => PP71X4Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w29_3 <= PP71X4Y2_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w30_3 <= PP71X4Y2_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w31_4 <= PP71X4Y2_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w32_3 <= PP71X4Y2_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w33_3 <= PP71X4Y2_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w34_4 <= PP71X4Y2_m5(5); -- cycle= 0 cp= 5.656e-10

   -- Partial product row number 3
   Y3X0_71_m5 <= y_m5b71_3 & x_m5b71_0;
   PP_m5_71X0Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X0_71_m5,
                 Y => PP71X0Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w20_5 <= PP71X0Y3_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w21_6 <= PP71X0Y3_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w22_6 <= PP71X0Y3_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w23_5 <= PP71X0Y3_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w24_6 <= PP71X0Y3_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w25_6 <= PP71X0Y3_m5(5); -- cycle= 0 cp= 5.656e-10

   Y3X1_71_m5 <= y_m5b71_3 & x_m5b71_1;
   PP_m5_71X1Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X1_71_m5,
                 Y => PP71X1Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w23_6 <= PP71X1Y3_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w24_7 <= PP71X1Y3_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w25_7 <= PP71X1Y3_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w26_5 <= PP71X1Y3_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w27_5 <= PP71X1Y3_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w28_5 <= PP71X1Y3_m5(5); -- cycle= 0 cp= 5.656e-10

   Y3X2_71_m5 <= y_m5b71_3 & x_m5b71_2;
   PP_m5_71X2Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X2_71_m5,
                 Y => PP71X2Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w26_6 <= PP71X2Y3_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w27_6 <= PP71X2Y3_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w28_6 <= PP71X2Y3_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w29_4 <= PP71X2Y3_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w30_4 <= PP71X2Y3_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w31_5 <= PP71X2Y3_m5(5); -- cycle= 0 cp= 5.656e-10

   Y3X3_71_m5 <= y_m5b71_3 & x_m5b71_3;
   PP_m5_71X3Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X3_71_m5,
                 Y => PP71X3Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w29_5 <= PP71X3Y3_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w30_5 <= PP71X3Y3_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w31_6 <= PP71X3Y3_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w32_4 <= PP71X3Y3_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w33_4 <= PP71X3Y3_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w34_5 <= PP71X3Y3_m5(5); -- cycle= 0 cp= 5.656e-10

   Y3X4_71_m5 <= y_m5b71_3 & x_m5b71_4;
   PP_m5_71X4Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X4_71_m5,
                 Y => PP71X4Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w32_5 <= PP71X4Y3_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w33_5 <= PP71X4Y3_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w34_6 <= PP71X4Y3_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w35_5 <= PP71X4Y3_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w36_5 <= PP71X4Y3_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w37_6 <= PP71X4Y3_m5(5); -- cycle= 0 cp= 5.656e-10

   -- Partial product row number 4
   Y4X0_71_m5 <= y_m5b71_4 & x_m5b71_0;
   PP_m5_71X0Y4_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y4X0_71_m5,
                 Y => PP71X0Y4_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w23_7 <= PP71X0Y4_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w24_8 <= PP71X0Y4_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w25_8 <= PP71X0Y4_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w26_7 <= PP71X0Y4_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w27_7 <= PP71X0Y4_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w28_7 <= PP71X0Y4_m5(5); -- cycle= 0 cp= 5.656e-10

   Y4X1_71_m5 <= y_m5b71_4 & x_m5b71_1;
   PP_m5_71X1Y4_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y4X1_71_m5,
                 Y => PP71X1Y4_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w26_8 <= PP71X1Y4_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w27_8 <= PP71X1Y4_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w28_8 <= PP71X1Y4_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w29_6 <= PP71X1Y4_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w30_6 <= PP71X1Y4_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w31_7 <= PP71X1Y4_m5(5); -- cycle= 0 cp= 5.656e-10

   Y4X2_71_m5 <= y_m5b71_4 & x_m5b71_2;
   PP_m5_71X2Y4_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y4X2_71_m5,
                 Y => PP71X2Y4_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w29_7 <= PP71X2Y4_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w30_7 <= PP71X2Y4_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w31_8 <= PP71X2Y4_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w32_6 <= PP71X2Y4_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w33_6 <= PP71X2Y4_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w34_7 <= PP71X2Y4_m5(5); -- cycle= 0 cp= 5.656e-10

   Y4X3_71_m5 <= y_m5b71_4 & x_m5b71_3;
   PP_m5_71X3Y4_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y4X3_71_m5,
                 Y => PP71X3Y4_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w32_7 <= PP71X3Y4_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w33_7 <= PP71X3Y4_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w34_8 <= PP71X3Y4_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w35_6 <= PP71X3Y4_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w36_6 <= PP71X3Y4_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w37_7 <= PP71X3Y4_m5(5); -- cycle= 0 cp= 5.656e-10

   Y4X4_71_m5 <= y_m5b71_4 & x_m5b71_4;
   PP_m5_71X4Y4_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y4X4_71_m5,
                 Y => PP71X4Y4_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w35_7 <= PP71X4Y4_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w36_7 <= PP71X4Y4_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w37_8 <= PP71X4Y4_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w38_7 <= PP71X4Y4_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w39_7 <= PP71X4Y4_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w40_8 <= PP71X4Y4_m5(5); -- cycle= 0 cp= 5.656e-10

   -- Partial product row number 5
   Y5X0_71_m5 <= y_m5b71_5 & x_m5b71_0;
   PP_m5_71X0Y5_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y5X0_71_m5,
                 Y => PP71X0Y5_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w26_9 <= PP71X0Y5_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w27_9 <= PP71X0Y5_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w28_9 <= PP71X0Y5_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w29_8 <= PP71X0Y5_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w30_8 <= PP71X0Y5_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w31_9 <= PP71X0Y5_m5(5); -- cycle= 0 cp= 5.656e-10

   Y5X1_71_m5 <= y_m5b71_5 & x_m5b71_1;
   PP_m5_71X1Y5_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y5X1_71_m5,
                 Y => PP71X1Y5_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w29_9 <= PP71X1Y5_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w30_9 <= PP71X1Y5_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w31_10 <= PP71X1Y5_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w32_8 <= PP71X1Y5_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w33_8 <= PP71X1Y5_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w34_9 <= PP71X1Y5_m5(5); -- cycle= 0 cp= 5.656e-10

   Y5X2_71_m5 <= y_m5b71_5 & x_m5b71_2;
   PP_m5_71X2Y5_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y5X2_71_m5,
                 Y => PP71X2Y5_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w32_9 <= PP71X2Y5_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w33_9 <= PP71X2Y5_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w34_10 <= PP71X2Y5_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w35_8 <= PP71X2Y5_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w36_8 <= PP71X2Y5_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w37_9 <= PP71X2Y5_m5(5); -- cycle= 0 cp= 5.656e-10

   Y5X3_71_m5 <= y_m5b71_5 & x_m5b71_3;
   PP_m5_71X3Y5_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y5X3_71_m5,
                 Y => PP71X3Y5_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w35_9 <= PP71X3Y5_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w36_9 <= PP71X3Y5_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w37_10 <= PP71X3Y5_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w38_8 <= PP71X3Y5_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w39_8 <= PP71X3Y5_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w40_9 <= PP71X3Y5_m5(5); -- cycle= 0 cp= 5.656e-10

   Y5X4_71_m5 <= y_m5b71_5 & x_m5b71_4;
   PP_m5_71X4Y5_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y5X4_71_m5,
                 Y => PP71X4Y5_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w38_9 <= PP71X4Y5_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w39_9 <= PP71X4Y5_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w40_10 <= PP71X4Y5_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w41_9 <= PP71X4Y5_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w42_9 <= PP71X4Y5_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w43_10 <= PP71X4Y5_m5(5); -- cycle= 0 cp= 5.656e-10

   -- code generated by IntMultiplier::buildHeapLogicOnly()
   -- buildheaplogiconly called for lsbX=39 lsbY=0 msbX=63 msbY=12
   Xp_m5b103 <= XX_m5(62 downto 39) & "";
   Yp_m5b103 <= YY_m5(11 downto 0) & "";
   x_m5b103_0 <= Xp_m5b103(2 downto 0);
   x_m5b103_1 <= Xp_m5b103(5 downto 3);
   x_m5b103_2 <= Xp_m5b103(8 downto 6);
   x_m5b103_3 <= Xp_m5b103(11 downto 9);
   x_m5b103_4 <= Xp_m5b103(14 downto 12);
   x_m5b103_5 <= Xp_m5b103(17 downto 15);
   x_m5b103_6 <= Xp_m5b103(20 downto 18);
   x_m5b103_7 <= Xp_m5b103(23 downto 21);
   y_m5b103_0 <= Yp_m5b103(2 downto 0);
   y_m5b103_1 <= Yp_m5b103(5 downto 3);
   y_m5b103_2 <= Yp_m5b103(8 downto 6);
   y_m5b103_3 <= Yp_m5b103(11 downto 9);
   ----------------Synchro barrier, entering cycle 0----------------
   -- Partial product row number 0
   Y0X0_103_m5 <= y_m5b103_0 & x_m5b103_0;
   PP_m5_103X0Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X0_103_m5,
                 Y => PP103X0Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w39_10 <= PP103X0Y0_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w40_11 <= PP103X0Y0_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w41_10 <= PP103X0Y0_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w42_10 <= PP103X0Y0_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w43_11 <= PP103X0Y0_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w44_10 <= PP103X0Y0_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y0X1_103_m5 <= y_m5b103_0 & x_m5b103_1;
   PP_m5_103X1Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X1_103_m5,
                 Y => PP103X1Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w42_11 <= PP103X1Y0_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w43_12 <= PP103X1Y0_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w44_11 <= PP103X1Y0_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w45_10 <= PP103X1Y0_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w46_10 <= PP103X1Y0_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w47_10 <= PP103X1Y0_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y0X2_103_m5 <= y_m5b103_0 & x_m5b103_2;
   PP_m5_103X2Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X2_103_m5,
                 Y => PP103X2Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w45_11 <= PP103X2Y0_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w46_11 <= PP103X2Y0_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w47_11 <= PP103X2Y0_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w48_11 <= PP103X2Y0_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w49_10 <= PP103X2Y0_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w50_10 <= PP103X2Y0_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y0X3_103_m5 <= y_m5b103_0 & x_m5b103_3;
   PP_m5_103X3Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X3_103_m5,
                 Y => PP103X3Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w48_12 <= PP103X3Y0_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w49_11 <= PP103X3Y0_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w50_11 <= PP103X3Y0_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w51_11 <= PP103X3Y0_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w52_10 <= PP103X3Y0_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w53_10 <= PP103X3Y0_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y0X4_103_m5 <= y_m5b103_0 & x_m5b103_4;
   PP_m5_103X4Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X4_103_m5,
                 Y => PP103X4Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w51_12 <= PP103X4Y0_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w52_11 <= PP103X4Y0_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w53_11 <= PP103X4Y0_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w54_11 <= PP103X4Y0_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w55_10 <= PP103X4Y0_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w56_10 <= PP103X4Y0_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y0X5_103_m5 <= y_m5b103_0 & x_m5b103_5;
   PP_m5_103X5Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X5_103_m5,
                 Y => PP103X5Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w54_12 <= PP103X5Y0_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w55_11 <= PP103X5Y0_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w56_11 <= PP103X5Y0_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w57_11 <= PP103X5Y0_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w58_10 <= PP103X5Y0_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w59_10 <= PP103X5Y0_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y0X6_103_m5 <= y_m5b103_0 & x_m5b103_6;
   PP_m5_103X6Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X6_103_m5,
                 Y => PP103X6Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w57_12 <= PP103X6Y0_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w58_11 <= PP103X6Y0_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w59_11 <= PP103X6Y0_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w60_11 <= PP103X6Y0_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w61_10 <= PP103X6Y0_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w62_10 <= PP103X6Y0_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y0X7_103_m5 <= y_m5b103_0 & x_m5b103_7;
   PP_m5_103X7Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X7_103_m5,
                 Y => PP103X7Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w60_12 <= PP103X7Y0_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w61_11 <= PP103X7Y0_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w62_11 <= PP103X7Y0_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w63_9 <= PP103X7Y0_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w64_9 <= PP103X7Y0_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w65_9 <= PP103X7Y0_m5(5); -- cycle= 0 cp= 5.9176e-10

   -- Partial product row number 1
   Y1X0_103_m5 <= y_m5b103_1 & x_m5b103_0;
   PP_m5_103X0Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X0_103_m5,
                 Y => PP103X0Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w42_12 <= PP103X0Y1_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w43_13 <= PP103X0Y1_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w44_12 <= PP103X0Y1_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w45_12 <= PP103X0Y1_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w46_12 <= PP103X0Y1_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w47_12 <= PP103X0Y1_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y1X1_103_m5 <= y_m5b103_1 & x_m5b103_1;
   PP_m5_103X1Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X1_103_m5,
                 Y => PP103X1Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w45_13 <= PP103X1Y1_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w46_13 <= PP103X1Y1_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w47_13 <= PP103X1Y1_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w48_13 <= PP103X1Y1_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w49_12 <= PP103X1Y1_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w50_12 <= PP103X1Y1_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y1X2_103_m5 <= y_m5b103_1 & x_m5b103_2;
   PP_m5_103X2Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X2_103_m5,
                 Y => PP103X2Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w48_14 <= PP103X2Y1_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w49_13 <= PP103X2Y1_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w50_13 <= PP103X2Y1_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w51_13 <= PP103X2Y1_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w52_12 <= PP103X2Y1_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w53_12 <= PP103X2Y1_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y1X3_103_m5 <= y_m5b103_1 & x_m5b103_3;
   PP_m5_103X3Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X3_103_m5,
                 Y => PP103X3Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w51_14 <= PP103X3Y1_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w52_13 <= PP103X3Y1_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w53_13 <= PP103X3Y1_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w54_13 <= PP103X3Y1_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w55_12 <= PP103X3Y1_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w56_12 <= PP103X3Y1_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y1X4_103_m5 <= y_m5b103_1 & x_m5b103_4;
   PP_m5_103X4Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X4_103_m5,
                 Y => PP103X4Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w54_14 <= PP103X4Y1_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w55_13 <= PP103X4Y1_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w56_13 <= PP103X4Y1_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w57_13 <= PP103X4Y1_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w58_12 <= PP103X4Y1_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w59_12 <= PP103X4Y1_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y1X5_103_m5 <= y_m5b103_1 & x_m5b103_5;
   PP_m5_103X5Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X5_103_m5,
                 Y => PP103X5Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w57_14 <= PP103X5Y1_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w58_13 <= PP103X5Y1_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w59_13 <= PP103X5Y1_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w60_13 <= PP103X5Y1_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w61_12 <= PP103X5Y1_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w62_12 <= PP103X5Y1_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y1X6_103_m5 <= y_m5b103_1 & x_m5b103_6;
   PP_m5_103X6Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X6_103_m5,
                 Y => PP103X6Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w60_14 <= PP103X6Y1_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w61_13 <= PP103X6Y1_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w62_13 <= PP103X6Y1_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w63_10 <= PP103X6Y1_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w64_10 <= PP103X6Y1_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w65_10 <= PP103X6Y1_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y1X7_103_m5 <= y_m5b103_1 & x_m5b103_7;
   PP_m5_103X7Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X7_103_m5,
                 Y => PP103X7Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w63_11 <= PP103X7Y1_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w64_11 <= PP103X7Y1_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w65_11 <= PP103X7Y1_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w66_7 <= PP103X7Y1_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w67_7 <= PP103X7Y1_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w68_7 <= PP103X7Y1_m5(5); -- cycle= 0 cp= 5.9176e-10

   -- Partial product row number 2
   Y2X0_103_m5 <= y_m5b103_2 & x_m5b103_0;
   PP_m5_103X0Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X0_103_m5,
                 Y => PP103X0Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w45_14 <= PP103X0Y2_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w46_14 <= PP103X0Y2_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w47_14 <= PP103X0Y2_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w48_15 <= PP103X0Y2_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w49_14 <= PP103X0Y2_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w50_14 <= PP103X0Y2_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y2X1_103_m5 <= y_m5b103_2 & x_m5b103_1;
   PP_m5_103X1Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X1_103_m5,
                 Y => PP103X1Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w48_16 <= PP103X1Y2_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w49_15 <= PP103X1Y2_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w50_15 <= PP103X1Y2_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w51_15 <= PP103X1Y2_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w52_14 <= PP103X1Y2_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w53_14 <= PP103X1Y2_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y2X2_103_m5 <= y_m5b103_2 & x_m5b103_2;
   PP_m5_103X2Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X2_103_m5,
                 Y => PP103X2Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w51_16 <= PP103X2Y2_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w52_15 <= PP103X2Y2_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w53_15 <= PP103X2Y2_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w54_15 <= PP103X2Y2_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w55_14 <= PP103X2Y2_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w56_14 <= PP103X2Y2_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y2X3_103_m5 <= y_m5b103_2 & x_m5b103_3;
   PP_m5_103X3Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X3_103_m5,
                 Y => PP103X3Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w54_16 <= PP103X3Y2_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w55_15 <= PP103X3Y2_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w56_15 <= PP103X3Y2_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w57_15 <= PP103X3Y2_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w58_14 <= PP103X3Y2_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w59_14 <= PP103X3Y2_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y2X4_103_m5 <= y_m5b103_2 & x_m5b103_4;
   PP_m5_103X4Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X4_103_m5,
                 Y => PP103X4Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w57_16 <= PP103X4Y2_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w58_15 <= PP103X4Y2_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w59_15 <= PP103X4Y2_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w60_15 <= PP103X4Y2_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w61_14 <= PP103X4Y2_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w62_14 <= PP103X4Y2_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y2X5_103_m5 <= y_m5b103_2 & x_m5b103_5;
   PP_m5_103X5Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X5_103_m5,
                 Y => PP103X5Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w60_16 <= PP103X5Y2_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w61_15 <= PP103X5Y2_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w62_15 <= PP103X5Y2_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w63_12 <= PP103X5Y2_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w64_12 <= PP103X5Y2_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w65_12 <= PP103X5Y2_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y2X6_103_m5 <= y_m5b103_2 & x_m5b103_6;
   PP_m5_103X6Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X6_103_m5,
                 Y => PP103X6Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w63_13 <= PP103X6Y2_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w64_13 <= PP103X6Y2_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w65_13 <= PP103X6Y2_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w66_8 <= PP103X6Y2_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w67_8 <= PP103X6Y2_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w68_8 <= PP103X6Y2_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y2X7_103_m5 <= y_m5b103_2 & x_m5b103_7;
   PP_m5_103X7Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X7_103_m5,
                 Y => PP103X7Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w66_9 <= PP103X7Y2_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w67_9 <= PP103X7Y2_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w68_9 <= PP103X7Y2_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w69_5 <= PP103X7Y2_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w70_5 <= PP103X7Y2_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w71_5 <= PP103X7Y2_m5(5); -- cycle= 0 cp= 5.9176e-10

   -- Partial product row number 3
   Y3X0_103_m5 <= y_m5b103_3 & x_m5b103_0;
   PP_m5_103X0Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X0_103_m5,
                 Y => PP103X0Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w48_17 <= PP103X0Y3_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w49_16 <= PP103X0Y3_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w50_16 <= PP103X0Y3_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w51_17 <= PP103X0Y3_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w52_16 <= PP103X0Y3_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w53_16 <= PP103X0Y3_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y3X1_103_m5 <= y_m5b103_3 & x_m5b103_1;
   PP_m5_103X1Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X1_103_m5,
                 Y => PP103X1Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w51_18 <= PP103X1Y3_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w52_17 <= PP103X1Y3_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w53_17 <= PP103X1Y3_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w54_17 <= PP103X1Y3_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w55_16 <= PP103X1Y3_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w56_16 <= PP103X1Y3_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y3X2_103_m5 <= y_m5b103_3 & x_m5b103_2;
   PP_m5_103X2Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X2_103_m5,
                 Y => PP103X2Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w54_18 <= PP103X2Y3_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w55_17 <= PP103X2Y3_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w56_17 <= PP103X2Y3_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w57_17 <= PP103X2Y3_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w58_16 <= PP103X2Y3_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w59_16 <= PP103X2Y3_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y3X3_103_m5 <= y_m5b103_3 & x_m5b103_3;
   PP_m5_103X3Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X3_103_m5,
                 Y => PP103X3Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w57_18 <= PP103X3Y3_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w58_17 <= PP103X3Y3_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w59_17 <= PP103X3Y3_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w60_17 <= PP103X3Y3_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w61_16 <= PP103X3Y3_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w62_16 <= PP103X3Y3_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y3X4_103_m5 <= y_m5b103_3 & x_m5b103_4;
   PP_m5_103X4Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X4_103_m5,
                 Y => PP103X4Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w60_18 <= PP103X4Y3_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w61_17 <= PP103X4Y3_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w62_17 <= PP103X4Y3_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w63_14 <= PP103X4Y3_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w64_14 <= PP103X4Y3_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w65_14 <= PP103X4Y3_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y3X5_103_m5 <= y_m5b103_3 & x_m5b103_5;
   PP_m5_103X5Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X5_103_m5,
                 Y => PP103X5Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w63_15 <= PP103X5Y3_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w64_15 <= PP103X5Y3_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w65_15 <= PP103X5Y3_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w66_10 <= PP103X5Y3_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w67_10 <= PP103X5Y3_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w68_10 <= PP103X5Y3_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y3X6_103_m5 <= y_m5b103_3 & x_m5b103_6;
   PP_m5_103X6Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X6_103_m5,
                 Y => PP103X6Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w66_11 <= PP103X6Y3_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w67_11 <= PP103X6Y3_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w68_11 <= PP103X6Y3_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w69_6 <= PP103X6Y3_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w70_6 <= PP103X6Y3_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w71_6 <= PP103X6Y3_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y3X7_103_m5 <= y_m5b103_3 & x_m5b103_7;
   PP_m5_103X7Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X7_103_m5,
                 Y => PP103X7Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w69_7 <= PP103X7Y3_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w70_7 <= PP103X7Y3_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w71_7 <= PP103X7Y3_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w72_3 <= PP103X7Y3_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w73_3 <= PP103X7Y3_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w74_3 <= PP103X7Y3_m5(5); -- cycle= 0 cp= 5.9176e-10

   -- code generated by IntMultiplier::buildHeapLogicOnly()
   -- buildheaplogiconly called for lsbX=15 lsbY=0 msbX=39 msbY=12
   Xp_m5b137 <= XX_m5(38 downto 15) & "";
   Yp_m5b137 <= YY_m5(11 downto 0) & "";
   x_m5b137_0 <= Xp_m5b137(2 downto 0);
   x_m5b137_1 <= Xp_m5b137(5 downto 3);
   x_m5b137_2 <= Xp_m5b137(8 downto 6);
   x_m5b137_3 <= Xp_m5b137(11 downto 9);
   x_m5b137_4 <= Xp_m5b137(14 downto 12);
   x_m5b137_5 <= Xp_m5b137(17 downto 15);
   x_m5b137_6 <= Xp_m5b137(20 downto 18);
   x_m5b137_7 <= Xp_m5b137(23 downto 21);
   y_m5b137_0 <= Yp_m5b137(2 downto 0);
   y_m5b137_1 <= Yp_m5b137(5 downto 3);
   y_m5b137_2 <= Yp_m5b137(8 downto 6);
   y_m5b137_3 <= Yp_m5b137(11 downto 9);
   ----------------Synchro barrier, entering cycle 0----------------
   -- Partial product row number 0
   Y0X0_137_m5 <= y_m5b137_0 & x_m5b137_0;
   PP_m5_137X0Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X0_137_m5,
                 Y => PP137X0Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w15_3 <= PP137X0Y0_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w16_3 <= PP137X0Y0_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w17_4 <= PP137X0Y0_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w18_5 <= PP137X0Y0_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w19_5 <= PP137X0Y0_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w20_6 <= PP137X0Y0_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y0X1_137_m5 <= y_m5b137_0 & x_m5b137_1;
   PP_m5_137X1Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X1_137_m5,
                 Y => PP137X1Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w18_6 <= PP137X1Y0_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w19_6 <= PP137X1Y0_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w20_7 <= PP137X1Y0_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w21_7 <= PP137X1Y0_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w22_7 <= PP137X1Y0_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w23_8 <= PP137X1Y0_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y0X2_137_m5 <= y_m5b137_0 & x_m5b137_2;
   PP_m5_137X2Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X2_137_m5,
                 Y => PP137X2Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w21_8 <= PP137X2Y0_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w22_8 <= PP137X2Y0_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w23_9 <= PP137X2Y0_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w24_9 <= PP137X2Y0_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w25_9 <= PP137X2Y0_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w26_10 <= PP137X2Y0_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y0X3_137_m5 <= y_m5b137_0 & x_m5b137_3;
   PP_m5_137X3Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X3_137_m5,
                 Y => PP137X3Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w24_10 <= PP137X3Y0_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w25_10 <= PP137X3Y0_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w26_11 <= PP137X3Y0_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w27_10 <= PP137X3Y0_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w28_10 <= PP137X3Y0_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w29_10 <= PP137X3Y0_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y0X4_137_m5 <= y_m5b137_0 & x_m5b137_4;
   PP_m5_137X4Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X4_137_m5,
                 Y => PP137X4Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w27_11 <= PP137X4Y0_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w28_11 <= PP137X4Y0_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w29_11 <= PP137X4Y0_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w30_10 <= PP137X4Y0_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w31_11 <= PP137X4Y0_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w32_10 <= PP137X4Y0_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y0X5_137_m5 <= y_m5b137_0 & x_m5b137_5;
   PP_m5_137X5Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X5_137_m5,
                 Y => PP137X5Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w30_11 <= PP137X5Y0_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w31_12 <= PP137X5Y0_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w32_11 <= PP137X5Y0_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w33_10 <= PP137X5Y0_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w34_11 <= PP137X5Y0_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w35_10 <= PP137X5Y0_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y0X6_137_m5 <= y_m5b137_0 & x_m5b137_6;
   PP_m5_137X6Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X6_137_m5,
                 Y => PP137X6Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w33_11 <= PP137X6Y0_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w34_12 <= PP137X6Y0_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w35_11 <= PP137X6Y0_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w36_10 <= PP137X6Y0_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w37_11 <= PP137X6Y0_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w38_10 <= PP137X6Y0_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y0X7_137_m5 <= y_m5b137_0 & x_m5b137_7;
   PP_m5_137X7Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X7_137_m5,
                 Y => PP137X7Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w36_11 <= PP137X7Y0_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w37_12 <= PP137X7Y0_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w38_11 <= PP137X7Y0_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w39_11 <= PP137X7Y0_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w40_12 <= PP137X7Y0_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w41_11 <= PP137X7Y0_m5(5); -- cycle= 0 cp= 5.9176e-10

   -- Partial product row number 1
   Y1X0_137_m5 <= y_m5b137_1 & x_m5b137_0;
   PP_m5_137X0Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X0_137_m5,
                 Y => PP137X0Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w18_7 <= PP137X0Y1_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w19_7 <= PP137X0Y1_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w20_8 <= PP137X0Y1_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w21_9 <= PP137X0Y1_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w22_9 <= PP137X0Y1_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w23_10 <= PP137X0Y1_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y1X1_137_m5 <= y_m5b137_1 & x_m5b137_1;
   PP_m5_137X1Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X1_137_m5,
                 Y => PP137X1Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w21_10 <= PP137X1Y1_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w22_10 <= PP137X1Y1_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w23_11 <= PP137X1Y1_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w24_11 <= PP137X1Y1_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w25_11 <= PP137X1Y1_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w26_12 <= PP137X1Y1_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y1X2_137_m5 <= y_m5b137_1 & x_m5b137_2;
   PP_m5_137X2Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X2_137_m5,
                 Y => PP137X2Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w24_12 <= PP137X2Y1_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w25_12 <= PP137X2Y1_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w26_13 <= PP137X2Y1_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w27_12 <= PP137X2Y1_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w28_12 <= PP137X2Y1_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w29_12 <= PP137X2Y1_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y1X3_137_m5 <= y_m5b137_1 & x_m5b137_3;
   PP_m5_137X3Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X3_137_m5,
                 Y => PP137X3Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w27_13 <= PP137X3Y1_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w28_13 <= PP137X3Y1_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w29_13 <= PP137X3Y1_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w30_12 <= PP137X3Y1_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w31_13 <= PP137X3Y1_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w32_12 <= PP137X3Y1_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y1X4_137_m5 <= y_m5b137_1 & x_m5b137_4;
   PP_m5_137X4Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X4_137_m5,
                 Y => PP137X4Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w30_13 <= PP137X4Y1_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w31_14 <= PP137X4Y1_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w32_13 <= PP137X4Y1_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w33_12 <= PP137X4Y1_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w34_13 <= PP137X4Y1_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w35_12 <= PP137X4Y1_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y1X5_137_m5 <= y_m5b137_1 & x_m5b137_5;
   PP_m5_137X5Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X5_137_m5,
                 Y => PP137X5Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w33_13 <= PP137X5Y1_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w34_14 <= PP137X5Y1_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w35_13 <= PP137X5Y1_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w36_12 <= PP137X5Y1_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w37_13 <= PP137X5Y1_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w38_12 <= PP137X5Y1_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y1X6_137_m5 <= y_m5b137_1 & x_m5b137_6;
   PP_m5_137X6Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X6_137_m5,
                 Y => PP137X6Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w36_13 <= PP137X6Y1_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w37_14 <= PP137X6Y1_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w38_13 <= PP137X6Y1_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w39_12 <= PP137X6Y1_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w40_13 <= PP137X6Y1_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w41_12 <= PP137X6Y1_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y1X7_137_m5 <= y_m5b137_1 & x_m5b137_7;
   PP_m5_137X7Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X7_137_m5,
                 Y => PP137X7Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w39_13 <= PP137X7Y1_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w40_14 <= PP137X7Y1_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w41_13 <= PP137X7Y1_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w42_13 <= PP137X7Y1_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w43_14 <= PP137X7Y1_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w44_13 <= PP137X7Y1_m5(5); -- cycle= 0 cp= 5.9176e-10

   -- Partial product row number 2
   Y2X0_137_m5 <= y_m5b137_2 & x_m5b137_0;
   PP_m5_137X0Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X0_137_m5,
                 Y => PP137X0Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w21_11 <= PP137X0Y2_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w22_11 <= PP137X0Y2_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w23_12 <= PP137X0Y2_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w24_13 <= PP137X0Y2_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w25_13 <= PP137X0Y2_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w26_14 <= PP137X0Y2_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y2X1_137_m5 <= y_m5b137_2 & x_m5b137_1;
   PP_m5_137X1Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X1_137_m5,
                 Y => PP137X1Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w24_14 <= PP137X1Y2_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w25_14 <= PP137X1Y2_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w26_15 <= PP137X1Y2_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w27_14 <= PP137X1Y2_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w28_14 <= PP137X1Y2_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w29_14 <= PP137X1Y2_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y2X2_137_m5 <= y_m5b137_2 & x_m5b137_2;
   PP_m5_137X2Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X2_137_m5,
                 Y => PP137X2Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w27_15 <= PP137X2Y2_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w28_15 <= PP137X2Y2_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w29_15 <= PP137X2Y2_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w30_14 <= PP137X2Y2_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w31_15 <= PP137X2Y2_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w32_14 <= PP137X2Y2_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y2X3_137_m5 <= y_m5b137_2 & x_m5b137_3;
   PP_m5_137X3Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X3_137_m5,
                 Y => PP137X3Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w30_15 <= PP137X3Y2_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w31_16 <= PP137X3Y2_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w32_15 <= PP137X3Y2_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w33_14 <= PP137X3Y2_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w34_15 <= PP137X3Y2_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w35_14 <= PP137X3Y2_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y2X4_137_m5 <= y_m5b137_2 & x_m5b137_4;
   PP_m5_137X4Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X4_137_m5,
                 Y => PP137X4Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w33_15 <= PP137X4Y2_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w34_16 <= PP137X4Y2_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w35_15 <= PP137X4Y2_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w36_14 <= PP137X4Y2_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w37_15 <= PP137X4Y2_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w38_14 <= PP137X4Y2_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y2X5_137_m5 <= y_m5b137_2 & x_m5b137_5;
   PP_m5_137X5Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X5_137_m5,
                 Y => PP137X5Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w36_15 <= PP137X5Y2_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w37_16 <= PP137X5Y2_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w38_15 <= PP137X5Y2_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w39_14 <= PP137X5Y2_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w40_15 <= PP137X5Y2_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w41_14 <= PP137X5Y2_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y2X6_137_m5 <= y_m5b137_2 & x_m5b137_6;
   PP_m5_137X6Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X6_137_m5,
                 Y => PP137X6Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w39_15 <= PP137X6Y2_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w40_16 <= PP137X6Y2_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w41_15 <= PP137X6Y2_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w42_14 <= PP137X6Y2_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w43_15 <= PP137X6Y2_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w44_14 <= PP137X6Y2_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y2X7_137_m5 <= y_m5b137_2 & x_m5b137_7;
   PP_m5_137X7Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X7_137_m5,
                 Y => PP137X7Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w42_15 <= PP137X7Y2_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w43_16 <= PP137X7Y2_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w44_15 <= PP137X7Y2_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w45_15 <= PP137X7Y2_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w46_15 <= PP137X7Y2_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w47_15 <= PP137X7Y2_m5(5); -- cycle= 0 cp= 5.9176e-10

   -- Partial product row number 3
   Y3X0_137_m5 <= y_m5b137_3 & x_m5b137_0;
   PP_m5_137X0Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X0_137_m5,
                 Y => PP137X0Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w24_15 <= PP137X0Y3_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w25_15 <= PP137X0Y3_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w26_16 <= PP137X0Y3_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w27_16 <= PP137X0Y3_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w28_16 <= PP137X0Y3_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w29_16 <= PP137X0Y3_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y3X1_137_m5 <= y_m5b137_3 & x_m5b137_1;
   PP_m5_137X1Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X1_137_m5,
                 Y => PP137X1Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w27_17 <= PP137X1Y3_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w28_17 <= PP137X1Y3_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w29_17 <= PP137X1Y3_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w30_16 <= PP137X1Y3_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w31_17 <= PP137X1Y3_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w32_16 <= PP137X1Y3_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y3X2_137_m5 <= y_m5b137_3 & x_m5b137_2;
   PP_m5_137X2Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X2_137_m5,
                 Y => PP137X2Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w30_17 <= PP137X2Y3_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w31_18 <= PP137X2Y3_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w32_17 <= PP137X2Y3_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w33_16 <= PP137X2Y3_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w34_17 <= PP137X2Y3_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w35_16 <= PP137X2Y3_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y3X3_137_m5 <= y_m5b137_3 & x_m5b137_3;
   PP_m5_137X3Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X3_137_m5,
                 Y => PP137X3Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w33_17 <= PP137X3Y3_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w34_18 <= PP137X3Y3_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w35_17 <= PP137X3Y3_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w36_16 <= PP137X3Y3_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w37_17 <= PP137X3Y3_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w38_16 <= PP137X3Y3_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y3X4_137_m5 <= y_m5b137_3 & x_m5b137_4;
   PP_m5_137X4Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X4_137_m5,
                 Y => PP137X4Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w36_17 <= PP137X4Y3_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w37_18 <= PP137X4Y3_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w38_17 <= PP137X4Y3_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w39_16 <= PP137X4Y3_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w40_17 <= PP137X4Y3_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w41_16 <= PP137X4Y3_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y3X5_137_m5 <= y_m5b137_3 & x_m5b137_5;
   PP_m5_137X5Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X5_137_m5,
                 Y => PP137X5Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w39_17 <= PP137X5Y3_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w40_18 <= PP137X5Y3_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w41_17 <= PP137X5Y3_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w42_16 <= PP137X5Y3_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w43_17 <= PP137X5Y3_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w44_16 <= PP137X5Y3_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y3X6_137_m5 <= y_m5b137_3 & x_m5b137_6;
   PP_m5_137X6Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X6_137_m5,
                 Y => PP137X6Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w42_17 <= PP137X6Y3_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w43_18 <= PP137X6Y3_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w44_17 <= PP137X6Y3_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w45_16 <= PP137X6Y3_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w46_16 <= PP137X6Y3_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w47_16 <= PP137X6Y3_m5(5); -- cycle= 0 cp= 5.9176e-10

   Y3X7_137_m5 <= y_m5b137_3 & x_m5b137_7;
   PP_m5_137X7Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X7_137_m5,
                 Y => PP137X7Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w45_17 <= PP137X7Y3_m5(0); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w46_17 <= PP137X7Y3_m5(1); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w47_17 <= PP137X7Y3_m5(2); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w48_18 <= PP137X7Y3_m5(3); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w49_17 <= PP137X7Y3_m5(4); -- cycle= 0 cp= 5.9176e-10
   heap_bh6_w50_17 <= PP137X7Y3_m5(5); -- cycle= 0 cp= 5.9176e-10

   -- code generated by IntMultiplier::buildHeapLogicOnly()
   -- buildheaplogiconly called for lsbX=0 lsbY=0 msbX=15 msbY=12
   Xp_m5b171 <= XX_m5(14 downto 0) & "";
   Yp_m5b171 <= YY_m5(11 downto 0) & "";
   x_m5b171_0 <= Xp_m5b171(2 downto 0);
   x_m5b171_1 <= Xp_m5b171(5 downto 3);
   x_m5b171_2 <= Xp_m5b171(8 downto 6);
   x_m5b171_3 <= Xp_m5b171(11 downto 9);
   x_m5b171_4 <= Xp_m5b171(14 downto 12);
   y_m5b171_0 <= Yp_m5b171(2 downto 0);
   y_m5b171_1 <= Yp_m5b171(5 downto 3);
   y_m5b171_2 <= Yp_m5b171(8 downto 6);
   y_m5b171_3 <= Yp_m5b171(11 downto 9);
   ----------------Synchro barrier, entering cycle 0----------------
   -- Partial product row number 0
   Y0X0_171_m5 <= y_m5b171_0 & x_m5b171_0;
   PP_m5_171X0Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X0_171_m5,
                 Y => PP171X0Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w0_0 <= PP171X0Y0_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w1_0 <= PP171X0Y0_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w2_0 <= PP171X0Y0_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w3_0 <= PP171X0Y0_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w4_0 <= PP171X0Y0_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w5_0 <= PP171X0Y0_m5(5); -- cycle= 0 cp= 5.656e-10

   Y0X1_171_m5 <= y_m5b171_0 & x_m5b171_1;
   PP_m5_171X1Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X1_171_m5,
                 Y => PP171X1Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w3_1 <= PP171X1Y0_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w4_1 <= PP171X1Y0_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w5_1 <= PP171X1Y0_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w6_0 <= PP171X1Y0_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w7_0 <= PP171X1Y0_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w8_0 <= PP171X1Y0_m5(5); -- cycle= 0 cp= 5.656e-10

   Y0X2_171_m5 <= y_m5b171_0 & x_m5b171_2;
   PP_m5_171X2Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X2_171_m5,
                 Y => PP171X2Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w6_1 <= PP171X2Y0_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w7_1 <= PP171X2Y0_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w8_1 <= PP171X2Y0_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w9_0 <= PP171X2Y0_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w10_0 <= PP171X2Y0_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w11_0 <= PP171X2Y0_m5(5); -- cycle= 0 cp= 5.656e-10

   Y0X3_171_m5 <= y_m5b171_0 & x_m5b171_3;
   PP_m5_171X3Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X3_171_m5,
                 Y => PP171X3Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w9_1 <= PP171X3Y0_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w10_1 <= PP171X3Y0_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w11_1 <= PP171X3Y0_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w12_1 <= PP171X3Y0_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w13_1 <= PP171X3Y0_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w14_2 <= PP171X3Y0_m5(5); -- cycle= 0 cp= 5.656e-10

   Y0X4_171_m5 <= y_m5b171_0 & x_m5b171_4;
   PP_m5_171X4Y0_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X4_171_m5,
                 Y => PP171X4Y0_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w12_2 <= PP171X4Y0_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w13_2 <= PP171X4Y0_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w14_3 <= PP171X4Y0_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w15_4 <= PP171X4Y0_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w16_4 <= PP171X4Y0_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w17_5 <= PP171X4Y0_m5(5); -- cycle= 0 cp= 5.656e-10

   -- Partial product row number 1
   Y1X0_171_m5 <= y_m5b171_1 & x_m5b171_0;
   PP_m5_171X0Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X0_171_m5,
                 Y => PP171X0Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w3_2 <= PP171X0Y1_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w4_2 <= PP171X0Y1_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w5_2 <= PP171X0Y1_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w6_2 <= PP171X0Y1_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w7_2 <= PP171X0Y1_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w8_2 <= PP171X0Y1_m5(5); -- cycle= 0 cp= 5.656e-10

   Y1X1_171_m5 <= y_m5b171_1 & x_m5b171_1;
   PP_m5_171X1Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X1_171_m5,
                 Y => PP171X1Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w6_3 <= PP171X1Y1_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w7_3 <= PP171X1Y1_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w8_3 <= PP171X1Y1_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w9_2 <= PP171X1Y1_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w10_2 <= PP171X1Y1_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w11_2 <= PP171X1Y1_m5(5); -- cycle= 0 cp= 5.656e-10

   Y1X2_171_m5 <= y_m5b171_1 & x_m5b171_2;
   PP_m5_171X2Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X2_171_m5,
                 Y => PP171X2Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w9_3 <= PP171X2Y1_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w10_3 <= PP171X2Y1_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w11_3 <= PP171X2Y1_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w12_3 <= PP171X2Y1_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w13_3 <= PP171X2Y1_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w14_4 <= PP171X2Y1_m5(5); -- cycle= 0 cp= 5.656e-10

   Y1X3_171_m5 <= y_m5b171_1 & x_m5b171_3;
   PP_m5_171X3Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X3_171_m5,
                 Y => PP171X3Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w12_4 <= PP171X3Y1_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w13_4 <= PP171X3Y1_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w14_5 <= PP171X3Y1_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w15_5 <= PP171X3Y1_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w16_5 <= PP171X3Y1_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w17_6 <= PP171X3Y1_m5(5); -- cycle= 0 cp= 5.656e-10

   Y1X4_171_m5 <= y_m5b171_1 & x_m5b171_4;
   PP_m5_171X4Y1_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X4_171_m5,
                 Y => PP171X4Y1_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w15_6 <= PP171X4Y1_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w16_6 <= PP171X4Y1_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w17_7 <= PP171X4Y1_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w18_8 <= PP171X4Y1_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w19_8 <= PP171X4Y1_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w20_9 <= PP171X4Y1_m5(5); -- cycle= 0 cp= 5.656e-10

   -- Partial product row number 2
   Y2X0_171_m5 <= y_m5b171_2 & x_m5b171_0;
   PP_m5_171X0Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X0_171_m5,
                 Y => PP171X0Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w6_4 <= PP171X0Y2_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w7_4 <= PP171X0Y2_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w8_4 <= PP171X0Y2_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w9_4 <= PP171X0Y2_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w10_4 <= PP171X0Y2_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w11_4 <= PP171X0Y2_m5(5); -- cycle= 0 cp= 5.656e-10

   Y2X1_171_m5 <= y_m5b171_2 & x_m5b171_1;
   PP_m5_171X1Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X1_171_m5,
                 Y => PP171X1Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w9_5 <= PP171X1Y2_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w10_5 <= PP171X1Y2_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w11_5 <= PP171X1Y2_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w12_5 <= PP171X1Y2_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w13_5 <= PP171X1Y2_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w14_6 <= PP171X1Y2_m5(5); -- cycle= 0 cp= 5.656e-10

   Y2X2_171_m5 <= y_m5b171_2 & x_m5b171_2;
   PP_m5_171X2Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X2_171_m5,
                 Y => PP171X2Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w12_6 <= PP171X2Y2_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w13_6 <= PP171X2Y2_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w14_7 <= PP171X2Y2_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w15_7 <= PP171X2Y2_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w16_7 <= PP171X2Y2_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w17_8 <= PP171X2Y2_m5(5); -- cycle= 0 cp= 5.656e-10

   Y2X3_171_m5 <= y_m5b171_2 & x_m5b171_3;
   PP_m5_171X3Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X3_171_m5,
                 Y => PP171X3Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w15_8 <= PP171X3Y2_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w16_8 <= PP171X3Y2_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w17_9 <= PP171X3Y2_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w18_9 <= PP171X3Y2_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w19_9 <= PP171X3Y2_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w20_10 <= PP171X3Y2_m5(5); -- cycle= 0 cp= 5.656e-10

   Y2X4_171_m5 <= y_m5b171_2 & x_m5b171_4;
   PP_m5_171X4Y2_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X4_171_m5,
                 Y => PP171X4Y2_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w18_10 <= PP171X4Y2_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w19_10 <= PP171X4Y2_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w20_11 <= PP171X4Y2_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w21_12 <= PP171X4Y2_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w22_12 <= PP171X4Y2_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w23_13 <= PP171X4Y2_m5(5); -- cycle= 0 cp= 5.656e-10

   -- Partial product row number 3
   Y3X0_171_m5 <= y_m5b171_3 & x_m5b171_0;
   PP_m5_171X0Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X0_171_m5,
                 Y => PP171X0Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w9_6 <= PP171X0Y3_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w10_6 <= PP171X0Y3_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w11_6 <= PP171X0Y3_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w12_7 <= PP171X0Y3_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w13_7 <= PP171X0Y3_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w14_8 <= PP171X0Y3_m5(5); -- cycle= 0 cp= 5.656e-10

   Y3X1_171_m5 <= y_m5b171_3 & x_m5b171_1;
   PP_m5_171X1Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X1_171_m5,
                 Y => PP171X1Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w12_8 <= PP171X1Y3_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w13_8 <= PP171X1Y3_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w14_9 <= PP171X1Y3_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w15_9 <= PP171X1Y3_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w16_9 <= PP171X1Y3_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w17_10 <= PP171X1Y3_m5(5); -- cycle= 0 cp= 5.656e-10

   Y3X2_171_m5 <= y_m5b171_3 & x_m5b171_2;
   PP_m5_171X2Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X2_171_m5,
                 Y => PP171X2Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w15_10 <= PP171X2Y3_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w16_10 <= PP171X2Y3_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w17_11 <= PP171X2Y3_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w18_11 <= PP171X2Y3_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w19_11 <= PP171X2Y3_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w20_12 <= PP171X2Y3_m5(5); -- cycle= 0 cp= 5.656e-10

   Y3X3_171_m5 <= y_m5b171_3 & x_m5b171_3;
   PP_m5_171X3Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X3_171_m5,
                 Y => PP171X3Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w18_12 <= PP171X3Y3_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w19_12 <= PP171X3Y3_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w20_13 <= PP171X3Y3_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w21_13 <= PP171X3Y3_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w22_13 <= PP171X3Y3_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w23_14 <= PP171X3Y3_m5(5); -- cycle= 0 cp= 5.656e-10

   Y3X4_171_m5 <= y_m5b171_3 & x_m5b171_4;
   PP_m5_171X4Y3_Tbl: SmallMultTableP3x3r6XuYu  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y3X4_171_m5,
                 Y => PP171X4Y3_m5);
   -- Adding the relevant bits to the heap of bits
   heap_bh6_w21_14 <= PP171X4Y3_m5(0); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w22_14 <= PP171X4Y3_m5(1); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w23_15 <= PP171X4Y3_m5(2); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w24_16 <= PP171X4Y3_m5(3); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w25_16 <= PP171X4Y3_m5(4); -- cycle= 0 cp= 5.656e-10
   heap_bh6_w26_17 <= PP171X4Y3_m5(5); -- cycle= 0 cp= 5.656e-10


   -- Beginning of code generated by BitHeap::generateCompressorVHDL
   -- code generated by BitHeap::generateSupertileVHDL()
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh6_ch0_0 <= std_logic_vector(unsigned("" & XX_m5(62 downto 39) & "") * unsigned("" & YY_m5(62 downto 46) & ""));
   heap_bh6_w125_0 <= DSP_bh6_ch0_0(40); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w124_0 <= DSP_bh6_ch0_0(39); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w123_0 <= DSP_bh6_ch0_0(38); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w122_0 <= DSP_bh6_ch0_0(37); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w121_0 <= DSP_bh6_ch0_0(36); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w120_0 <= DSP_bh6_ch0_0(35); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w119_0 <= DSP_bh6_ch0_0(34); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w118_0 <= DSP_bh6_ch0_0(33); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w117_0 <= DSP_bh6_ch0_0(32); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w116_0 <= DSP_bh6_ch0_0(31); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w115_0 <= DSP_bh6_ch0_0(30); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w114_0 <= DSP_bh6_ch0_0(29); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w113_0 <= DSP_bh6_ch0_0(28); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w112_0 <= DSP_bh6_ch0_0(27); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w111_0 <= DSP_bh6_ch0_0(26); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w110_0 <= DSP_bh6_ch0_0(25); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w109_0 <= DSP_bh6_ch0_0(24); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w108_0 <= DSP_bh6_ch0_0(23); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w107_0 <= DSP_bh6_ch0_0(22); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w106_0 <= DSP_bh6_ch0_0(21); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w105_0 <= DSP_bh6_ch0_0(20); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w104_0 <= DSP_bh6_ch0_0(19); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w103_0 <= DSP_bh6_ch0_0(18); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w102_0 <= DSP_bh6_ch0_0(17); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w101_0 <= DSP_bh6_ch0_0(16); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w100_0 <= DSP_bh6_ch0_0(15); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w99_0 <= DSP_bh6_ch0_0(14); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w98_0 <= DSP_bh6_ch0_0(13); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w97_0 <= DSP_bh6_ch0_0(12); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w96_0 <= DSP_bh6_ch0_0(11); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w95_0 <= DSP_bh6_ch0_0(10); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w94_0 <= DSP_bh6_ch0_0(9); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w93_0 <= DSP_bh6_ch0_0(8); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w92_0 <= DSP_bh6_ch0_0(7); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w91_0 <= DSP_bh6_ch0_0(6); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w90_0 <= DSP_bh6_ch0_0(5); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w89_0 <= DSP_bh6_ch0_0(4); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w88_0 <= DSP_bh6_ch0_0(3); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w87_0 <= DSP_bh6_ch0_0(2); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w86_0 <= DSP_bh6_ch0_0(1); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w85_0 <= DSP_bh6_ch0_0(0); -- cycle= 0 cp= 2.387e-09
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh6_ch1_0 <= std_logic_vector(unsigned("" & XX_m5(38 downto 15) & "") * unsigned("" & YY_m5(62 downto 46) & ""));
   heap_bh6_w101_1 <= DSP_bh6_ch1_0(40); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w100_1 <= DSP_bh6_ch1_0(39); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w99_1 <= DSP_bh6_ch1_0(38); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w98_1 <= DSP_bh6_ch1_0(37); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w97_1 <= DSP_bh6_ch1_0(36); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w96_1 <= DSP_bh6_ch1_0(35); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w95_1 <= DSP_bh6_ch1_0(34); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w94_1 <= DSP_bh6_ch1_0(33); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w93_1 <= DSP_bh6_ch1_0(32); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w92_1 <= DSP_bh6_ch1_0(31); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w91_1 <= DSP_bh6_ch1_0(30); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w90_1 <= DSP_bh6_ch1_0(29); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w89_1 <= DSP_bh6_ch1_0(28); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w88_1 <= DSP_bh6_ch1_0(27); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w87_1 <= DSP_bh6_ch1_0(26); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w86_1 <= DSP_bh6_ch1_0(25); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w85_1 <= DSP_bh6_ch1_0(24); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w84_0 <= DSP_bh6_ch1_0(23); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w83_0 <= DSP_bh6_ch1_0(22); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w82_0 <= DSP_bh6_ch1_0(21); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w81_0 <= DSP_bh6_ch1_0(20); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w80_0 <= DSP_bh6_ch1_0(19); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w79_0 <= DSP_bh6_ch1_0(18); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w78_0 <= DSP_bh6_ch1_0(17); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w77_1 <= DSP_bh6_ch1_0(16); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w76_1 <= DSP_bh6_ch1_0(15); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w75_1 <= DSP_bh6_ch1_0(14); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w74_4 <= DSP_bh6_ch1_0(13); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w73_4 <= DSP_bh6_ch1_0(12); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w72_4 <= DSP_bh6_ch1_0(11); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w71_8 <= DSP_bh6_ch1_0(10); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w70_8 <= DSP_bh6_ch1_0(9); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w69_8 <= DSP_bh6_ch1_0(8); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w68_12 <= DSP_bh6_ch1_0(7); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w67_12 <= DSP_bh6_ch1_0(6); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w66_12 <= DSP_bh6_ch1_0(5); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w65_16 <= DSP_bh6_ch1_0(4); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w64_16 <= DSP_bh6_ch1_0(3); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w63_16 <= DSP_bh6_ch1_0(2); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w62_18 <= DSP_bh6_ch1_0(1); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w61_18 <= DSP_bh6_ch1_0(0); -- cycle= 0 cp= 2.387e-09
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh6_ch2_0 <= std_logic_vector(unsigned("" & XX_m5(62 downto 39) & "") * unsigned("" & YY_m5(45 downto 29) & ""));
   heap_bh6_w108_1 <= DSP_bh6_ch2_0(40); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w107_1 <= DSP_bh6_ch2_0(39); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w106_1 <= DSP_bh6_ch2_0(38); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w105_1 <= DSP_bh6_ch2_0(37); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w104_1 <= DSP_bh6_ch2_0(36); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w103_1 <= DSP_bh6_ch2_0(35); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w102_1 <= DSP_bh6_ch2_0(34); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w101_2 <= DSP_bh6_ch2_0(33); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w100_2 <= DSP_bh6_ch2_0(32); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w99_2 <= DSP_bh6_ch2_0(31); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w98_2 <= DSP_bh6_ch2_0(30); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w97_2 <= DSP_bh6_ch2_0(29); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w96_2 <= DSP_bh6_ch2_0(28); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w95_2 <= DSP_bh6_ch2_0(27); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w94_2 <= DSP_bh6_ch2_0(26); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w93_2 <= DSP_bh6_ch2_0(25); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w92_2 <= DSP_bh6_ch2_0(24); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w91_2 <= DSP_bh6_ch2_0(23); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w90_2 <= DSP_bh6_ch2_0(22); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w89_2 <= DSP_bh6_ch2_0(21); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w88_2 <= DSP_bh6_ch2_0(20); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w87_2 <= DSP_bh6_ch2_0(19); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w86_2 <= DSP_bh6_ch2_0(18); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w85_2 <= DSP_bh6_ch2_0(17); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w84_1 <= DSP_bh6_ch2_0(16); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w83_1 <= DSP_bh6_ch2_0(15); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w82_1 <= DSP_bh6_ch2_0(14); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w81_1 <= DSP_bh6_ch2_0(13); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w80_1 <= DSP_bh6_ch2_0(12); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w79_1 <= DSP_bh6_ch2_0(11); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w78_1 <= DSP_bh6_ch2_0(10); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w77_2 <= DSP_bh6_ch2_0(9); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w76_2 <= DSP_bh6_ch2_0(8); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w75_2 <= DSP_bh6_ch2_0(7); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w74_5 <= DSP_bh6_ch2_0(6); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w73_5 <= DSP_bh6_ch2_0(5); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w72_5 <= DSP_bh6_ch2_0(4); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w71_9 <= DSP_bh6_ch2_0(3); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w70_9 <= DSP_bh6_ch2_0(2); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w69_9 <= DSP_bh6_ch2_0(1); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w68_13 <= DSP_bh6_ch2_0(0); -- cycle= 0 cp= 2.387e-09
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh6_ch3_0 <= std_logic_vector(unsigned("" & XX_m5(38 downto 15) & "") * unsigned("" & YY_m5(45 downto 29) & ""));
   heap_bh6_w84_2 <= DSP_bh6_ch3_0(40); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w83_2 <= DSP_bh6_ch3_0(39); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w82_2 <= DSP_bh6_ch3_0(38); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w81_2 <= DSP_bh6_ch3_0(37); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w80_2 <= DSP_bh6_ch3_0(36); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w79_2 <= DSP_bh6_ch3_0(35); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w78_2 <= DSP_bh6_ch3_0(34); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w77_3 <= DSP_bh6_ch3_0(33); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w76_3 <= DSP_bh6_ch3_0(32); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w75_3 <= DSP_bh6_ch3_0(31); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w74_6 <= DSP_bh6_ch3_0(30); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w73_6 <= DSP_bh6_ch3_0(29); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w72_6 <= DSP_bh6_ch3_0(28); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w71_10 <= DSP_bh6_ch3_0(27); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w70_10 <= DSP_bh6_ch3_0(26); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w69_10 <= DSP_bh6_ch3_0(25); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w68_14 <= DSP_bh6_ch3_0(24); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w67_13 <= DSP_bh6_ch3_0(23); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w66_13 <= DSP_bh6_ch3_0(22); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w65_17 <= DSP_bh6_ch3_0(21); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w64_17 <= DSP_bh6_ch3_0(20); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w63_17 <= DSP_bh6_ch3_0(19); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w62_19 <= DSP_bh6_ch3_0(18); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w61_19 <= DSP_bh6_ch3_0(17); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w60_19 <= DSP_bh6_ch3_0(16); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w59_18 <= DSP_bh6_ch3_0(15); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w58_18 <= DSP_bh6_ch3_0(14); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w57_19 <= DSP_bh6_ch3_0(13); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w56_18 <= DSP_bh6_ch3_0(12); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w55_18 <= DSP_bh6_ch3_0(11); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w54_19 <= DSP_bh6_ch3_0(10); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w53_18 <= DSP_bh6_ch3_0(9); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w52_18 <= DSP_bh6_ch3_0(8); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w51_19 <= DSP_bh6_ch3_0(7); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w50_18 <= DSP_bh6_ch3_0(6); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w49_18 <= DSP_bh6_ch3_0(5); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w48_19 <= DSP_bh6_ch3_0(4); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w47_18 <= DSP_bh6_ch3_0(3); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w46_18 <= DSP_bh6_ch3_0(2); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w45_18 <= DSP_bh6_ch3_0(1); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w44_18 <= DSP_bh6_ch3_0(0); -- cycle= 0 cp= 2.387e-09
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh6_ch4_0 <= std_logic_vector(unsigned("" & XX_m5(62 downto 39) & "") * unsigned("" & YY_m5(28 downto 12) & ""));
   heap_bh6_w91_3 <= DSP_bh6_ch4_0(40); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w90_3 <= DSP_bh6_ch4_0(39); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w89_3 <= DSP_bh6_ch4_0(38); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w88_3 <= DSP_bh6_ch4_0(37); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w87_3 <= DSP_bh6_ch4_0(36); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w86_3 <= DSP_bh6_ch4_0(35); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w85_3 <= DSP_bh6_ch4_0(34); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w84_3 <= DSP_bh6_ch4_0(33); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w83_3 <= DSP_bh6_ch4_0(32); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w82_3 <= DSP_bh6_ch4_0(31); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w81_3 <= DSP_bh6_ch4_0(30); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w80_3 <= DSP_bh6_ch4_0(29); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w79_3 <= DSP_bh6_ch4_0(28); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w78_3 <= DSP_bh6_ch4_0(27); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w77_4 <= DSP_bh6_ch4_0(26); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w76_4 <= DSP_bh6_ch4_0(25); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w75_4 <= DSP_bh6_ch4_0(24); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w74_7 <= DSP_bh6_ch4_0(23); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w73_7 <= DSP_bh6_ch4_0(22); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w72_7 <= DSP_bh6_ch4_0(21); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w71_11 <= DSP_bh6_ch4_0(20); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w70_11 <= DSP_bh6_ch4_0(19); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w69_11 <= DSP_bh6_ch4_0(18); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w68_15 <= DSP_bh6_ch4_0(17); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w67_14 <= DSP_bh6_ch4_0(16); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w66_14 <= DSP_bh6_ch4_0(15); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w65_18 <= DSP_bh6_ch4_0(14); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w64_18 <= DSP_bh6_ch4_0(13); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w63_18 <= DSP_bh6_ch4_0(12); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w62_20 <= DSP_bh6_ch4_0(11); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w61_20 <= DSP_bh6_ch4_0(10); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w60_20 <= DSP_bh6_ch4_0(9); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w59_19 <= DSP_bh6_ch4_0(8); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w58_19 <= DSP_bh6_ch4_0(7); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w57_20 <= DSP_bh6_ch4_0(6); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w56_19 <= DSP_bh6_ch4_0(5); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w55_19 <= DSP_bh6_ch4_0(4); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w54_20 <= DSP_bh6_ch4_0(3); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w53_19 <= DSP_bh6_ch4_0(2); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w52_19 <= DSP_bh6_ch4_0(1); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w51_20 <= DSP_bh6_ch4_0(0); -- cycle= 0 cp= 2.387e-09
   ----------------Synchro barrier, entering cycle 0----------------
   DSP_bh6_ch5_0 <= std_logic_vector(unsigned("" & XX_m5(38 downto 15) & "") * unsigned("" & YY_m5(28 downto 12) & ""));
   heap_bh6_w67_15 <= DSP_bh6_ch5_0(40); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w66_15 <= DSP_bh6_ch5_0(39); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w65_19 <= DSP_bh6_ch5_0(38); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w64_19 <= DSP_bh6_ch5_0(37); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w63_19 <= DSP_bh6_ch5_0(36); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w62_21 <= DSP_bh6_ch5_0(35); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w61_21 <= DSP_bh6_ch5_0(34); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w60_21 <= DSP_bh6_ch5_0(33); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w59_20 <= DSP_bh6_ch5_0(32); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w58_20 <= DSP_bh6_ch5_0(31); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w57_21 <= DSP_bh6_ch5_0(30); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w56_20 <= DSP_bh6_ch5_0(29); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w55_20 <= DSP_bh6_ch5_0(28); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w54_21 <= DSP_bh6_ch5_0(27); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w53_20 <= DSP_bh6_ch5_0(26); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w52_20 <= DSP_bh6_ch5_0(25); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w51_21 <= DSP_bh6_ch5_0(24); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w50_19 <= DSP_bh6_ch5_0(23); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w49_19 <= DSP_bh6_ch5_0(22); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w48_20 <= DSP_bh6_ch5_0(21); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w47_19 <= DSP_bh6_ch5_0(20); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w46_19 <= DSP_bh6_ch5_0(19); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w45_19 <= DSP_bh6_ch5_0(18); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w44_19 <= DSP_bh6_ch5_0(17); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w43_19 <= DSP_bh6_ch5_0(16); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w42_18 <= DSP_bh6_ch5_0(15); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w41_18 <= DSP_bh6_ch5_0(14); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w40_19 <= DSP_bh6_ch5_0(13); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w39_18 <= DSP_bh6_ch5_0(12); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w38_18 <= DSP_bh6_ch5_0(11); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w37_19 <= DSP_bh6_ch5_0(10); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w36_18 <= DSP_bh6_ch5_0(9); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w35_18 <= DSP_bh6_ch5_0(8); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w34_19 <= DSP_bh6_ch5_0(7); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w33_18 <= DSP_bh6_ch5_0(6); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w32_18 <= DSP_bh6_ch5_0(5); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w31_19 <= DSP_bh6_ch5_0(4); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w30_18 <= DSP_bh6_ch5_0(3); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w29_18 <= DSP_bh6_ch5_0(2); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w28_18 <= DSP_bh6_ch5_0(1); -- cycle= 0 cp= 2.387e-09
   heap_bh6_w27_18 <= DSP_bh6_ch5_0(0); -- cycle= 0 cp= 2.387e-09
   ----------------Synchro barrier, entering cycle 0----------------

   -- Adding the constant bits
      -- All the constant bits are zero, nothing to add

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 0----------------
   tempR_bh6_0 <= heap_bh6_w2_0 & heap_bh6_w1_0 & heap_bh6_w0_0; -- already compressed

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_0_0 <= heap_bh6_w9_6 & heap_bh6_w9_5 & heap_bh6_w9_4 & heap_bh6_w9_3 & heap_bh6_w9_2 & heap_bh6_w9_1;
   Compressor_bh6_0: Compressor_6_3
      port map ( R => CompressorOut_bh6_0_0   ,
                 X0 => CompressorIn_bh6_0_0);
   heap_bh6_w9_7 <= CompressorOut_bh6_0_0(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w10_7 <= CompressorOut_bh6_0_0(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w11_7 <= CompressorOut_bh6_0_0(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_1_1 <= heap_bh6_w10_6 & heap_bh6_w10_5 & heap_bh6_w10_4 & heap_bh6_w10_3 & heap_bh6_w10_2 & heap_bh6_w10_1;
   Compressor_bh6_1: Compressor_6_3
      port map ( R => CompressorOut_bh6_1_1   ,
                 X0 => CompressorIn_bh6_1_1);
   heap_bh6_w10_8 <= CompressorOut_bh6_1_1(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w11_8 <= CompressorOut_bh6_1_1(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w12_9 <= CompressorOut_bh6_1_1(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_2_2 <= heap_bh6_w11_6 & heap_bh6_w11_5 & heap_bh6_w11_4 & heap_bh6_w11_3 & heap_bh6_w11_2 & heap_bh6_w11_1;
   Compressor_bh6_2: Compressor_6_3
      port map ( R => CompressorOut_bh6_2_2   ,
                 X0 => CompressorIn_bh6_2_2);
   heap_bh6_w11_9 <= CompressorOut_bh6_2_2(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w12_10 <= CompressorOut_bh6_2_2(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w13_9 <= CompressorOut_bh6_2_2(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_3_3 <= heap_bh6_w12_8 & heap_bh6_w12_7 & heap_bh6_w12_6 & heap_bh6_w12_5 & heap_bh6_w12_4 & heap_bh6_w12_3;
   Compressor_bh6_3: Compressor_6_3
      port map ( R => CompressorOut_bh6_3_3   ,
                 X0 => CompressorIn_bh6_3_3);
   heap_bh6_w12_11 <= CompressorOut_bh6_3_3(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w13_10 <= CompressorOut_bh6_3_3(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w14_10 <= CompressorOut_bh6_3_3(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_4_4 <= heap_bh6_w13_8 & heap_bh6_w13_7 & heap_bh6_w13_6 & heap_bh6_w13_5 & heap_bh6_w13_4 & heap_bh6_w13_3;
   Compressor_bh6_4: Compressor_6_3
      port map ( R => CompressorOut_bh6_4_4   ,
                 X0 => CompressorIn_bh6_4_4);
   heap_bh6_w13_11 <= CompressorOut_bh6_4_4(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w14_11 <= CompressorOut_bh6_4_4(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w15_11 <= CompressorOut_bh6_4_4(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_5_5 <= heap_bh6_w14_9 & heap_bh6_w14_8 & heap_bh6_w14_7 & heap_bh6_w14_6 & heap_bh6_w14_5 & heap_bh6_w14_4;
   Compressor_bh6_5: Compressor_6_3
      port map ( R => CompressorOut_bh6_5_5   ,
                 X0 => CompressorIn_bh6_5_5);
   heap_bh6_w14_12 <= CompressorOut_bh6_5_5(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w15_12 <= CompressorOut_bh6_5_5(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w16_11 <= CompressorOut_bh6_5_5(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_6_6 <= heap_bh6_w15_10 & heap_bh6_w15_9 & heap_bh6_w15_8 & heap_bh6_w15_7 & heap_bh6_w15_6 & heap_bh6_w15_5;
   Compressor_bh6_6: Compressor_6_3
      port map ( R => CompressorOut_bh6_6_6   ,
                 X0 => CompressorIn_bh6_6_6);
   heap_bh6_w15_13 <= CompressorOut_bh6_6_6(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w16_12 <= CompressorOut_bh6_6_6(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w17_12 <= CompressorOut_bh6_6_6(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_7_7 <= heap_bh6_w16_10 & heap_bh6_w16_9 & heap_bh6_w16_8 & heap_bh6_w16_7 & heap_bh6_w16_6 & heap_bh6_w16_5;
   Compressor_bh6_7: Compressor_6_3
      port map ( R => CompressorOut_bh6_7_7   ,
                 X0 => CompressorIn_bh6_7_7);
   heap_bh6_w16_13 <= CompressorOut_bh6_7_7(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w17_13 <= CompressorOut_bh6_7_7(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w18_13 <= CompressorOut_bh6_7_7(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_8_8 <= heap_bh6_w17_11 & heap_bh6_w17_10 & heap_bh6_w17_9 & heap_bh6_w17_8 & heap_bh6_w17_7 & heap_bh6_w17_6;
   Compressor_bh6_8: Compressor_6_3
      port map ( R => CompressorOut_bh6_8_8   ,
                 X0 => CompressorIn_bh6_8_8);
   heap_bh6_w17_14 <= CompressorOut_bh6_8_8(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w18_14 <= CompressorOut_bh6_8_8(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w19_13 <= CompressorOut_bh6_8_8(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_9_9 <= heap_bh6_w17_5 & heap_bh6_w17_3 & heap_bh6_w17_2 & heap_bh6_w17_1 & heap_bh6_w17_0 & heap_bh6_w17_4;
   Compressor_bh6_9: Compressor_6_3
      port map ( R => CompressorOut_bh6_9_9   ,
                 X0 => CompressorIn_bh6_9_9);
   heap_bh6_w17_15 <= CompressorOut_bh6_9_9(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w18_15 <= CompressorOut_bh6_9_9(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w19_14 <= CompressorOut_bh6_9_9(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_10_10 <= heap_bh6_w18_12 & heap_bh6_w18_11 & heap_bh6_w18_10 & heap_bh6_w18_9 & heap_bh6_w18_8 & heap_bh6_w18_4;
   Compressor_bh6_10: Compressor_6_3
      port map ( R => CompressorOut_bh6_10_10   ,
                 X0 => CompressorIn_bh6_10_10);
   heap_bh6_w18_16 <= CompressorOut_bh6_10_10(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w19_15 <= CompressorOut_bh6_10_10(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w20_14 <= CompressorOut_bh6_10_10(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_11_11 <= heap_bh6_w18_3 & heap_bh6_w18_2 & heap_bh6_w18_1 & heap_bh6_w18_0 & heap_bh6_w18_7 & heap_bh6_w18_6;
   Compressor_bh6_11: Compressor_6_3
      port map ( R => CompressorOut_bh6_11_11   ,
                 X0 => CompressorIn_bh6_11_11);
   heap_bh6_w18_17 <= CompressorOut_bh6_11_11(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w19_16 <= CompressorOut_bh6_11_11(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w20_15 <= CompressorOut_bh6_11_11(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_12_12 <= heap_bh6_w19_12 & heap_bh6_w19_11 & heap_bh6_w19_10 & heap_bh6_w19_9 & heap_bh6_w19_8 & heap_bh6_w19_4;
   Compressor_bh6_12: Compressor_6_3
      port map ( R => CompressorOut_bh6_12_12   ,
                 X0 => CompressorIn_bh6_12_12);
   heap_bh6_w19_17 <= CompressorOut_bh6_12_12(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w20_16 <= CompressorOut_bh6_12_12(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w21_15 <= CompressorOut_bh6_12_12(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_13_13 <= heap_bh6_w19_3 & heap_bh6_w19_2 & heap_bh6_w19_1 & heap_bh6_w19_0 & heap_bh6_w19_7 & heap_bh6_w19_6;
   Compressor_bh6_13: Compressor_6_3
      port map ( R => CompressorOut_bh6_13_13   ,
                 X0 => CompressorIn_bh6_13_13);
   heap_bh6_w19_18 <= CompressorOut_bh6_13_13(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w20_17 <= CompressorOut_bh6_13_13(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w21_16 <= CompressorOut_bh6_13_13(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_14_14 <= heap_bh6_w20_13 & heap_bh6_w20_12 & heap_bh6_w20_11 & heap_bh6_w20_10 & heap_bh6_w20_9 & heap_bh6_w20_5;
   Compressor_bh6_14: Compressor_6_3
      port map ( R => CompressorOut_bh6_14_14   ,
                 X0 => CompressorIn_bh6_14_14);
   heap_bh6_w20_18 <= CompressorOut_bh6_14_14(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w21_17 <= CompressorOut_bh6_14_14(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w22_15 <= CompressorOut_bh6_14_14(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_15_15 <= heap_bh6_w20_4 & heap_bh6_w20_3 & heap_bh6_w20_2 & heap_bh6_w20_1 & heap_bh6_w20_0 & heap_bh6_w20_8;
   Compressor_bh6_15: Compressor_6_3
      port map ( R => CompressorOut_bh6_15_15   ,
                 X0 => CompressorIn_bh6_15_15);
   heap_bh6_w20_19 <= CompressorOut_bh6_15_15(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w21_18 <= CompressorOut_bh6_15_15(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w22_16 <= CompressorOut_bh6_15_15(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_16_16 <= heap_bh6_w21_14 & heap_bh6_w21_13 & heap_bh6_w21_12 & heap_bh6_w21_6 & heap_bh6_w21_5 & heap_bh6_w21_4;
   Compressor_bh6_16: Compressor_6_3
      port map ( R => CompressorOut_bh6_16_16   ,
                 X0 => CompressorIn_bh6_16_16);
   heap_bh6_w21_19 <= CompressorOut_bh6_16_16(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w22_17 <= CompressorOut_bh6_16_16(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w23_16 <= CompressorOut_bh6_16_16(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_17_17 <= heap_bh6_w21_3 & heap_bh6_w21_2 & heap_bh6_w21_1 & heap_bh6_w21_0 & heap_bh6_w21_11 & heap_bh6_w21_10;
   Compressor_bh6_17: Compressor_6_3
      port map ( R => CompressorOut_bh6_17_17   ,
                 X0 => CompressorIn_bh6_17_17);
   heap_bh6_w21_20 <= CompressorOut_bh6_17_17(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w22_18 <= CompressorOut_bh6_17_17(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w23_17 <= CompressorOut_bh6_17_17(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_18_18 <= heap_bh6_w22_14 & heap_bh6_w22_13 & heap_bh6_w22_12 & heap_bh6_w22_6 & heap_bh6_w22_5 & heap_bh6_w22_4;
   Compressor_bh6_18: Compressor_6_3
      port map ( R => CompressorOut_bh6_18_18   ,
                 X0 => CompressorIn_bh6_18_18);
   heap_bh6_w22_19 <= CompressorOut_bh6_18_18(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w23_18 <= CompressorOut_bh6_18_18(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w24_17 <= CompressorOut_bh6_18_18(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_19_19 <= heap_bh6_w22_3 & heap_bh6_w22_2 & heap_bh6_w22_1 & heap_bh6_w22_0 & heap_bh6_w22_11 & heap_bh6_w22_10;
   Compressor_bh6_19: Compressor_6_3
      port map ( R => CompressorOut_bh6_19_19   ,
                 X0 => CompressorIn_bh6_19_19);
   heap_bh6_w22_20 <= CompressorOut_bh6_19_19(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w23_19 <= CompressorOut_bh6_19_19(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w24_18 <= CompressorOut_bh6_19_19(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_20_20 <= heap_bh6_w23_15 & heap_bh6_w23_14 & heap_bh6_w23_13 & heap_bh6_w23_7 & heap_bh6_w23_6 & heap_bh6_w23_5;
   Compressor_bh6_20: Compressor_6_3
      port map ( R => CompressorOut_bh6_20_20   ,
                 X0 => CompressorIn_bh6_20_20);
   heap_bh6_w23_20 <= CompressorOut_bh6_20_20(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w24_19 <= CompressorOut_bh6_20_20(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w25_17 <= CompressorOut_bh6_20_20(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_21_21 <= heap_bh6_w23_4 & heap_bh6_w23_3 & heap_bh6_w23_2 & heap_bh6_w23_1 & heap_bh6_w23_0 & heap_bh6_w23_12;
   Compressor_bh6_21: Compressor_6_3
      port map ( R => CompressorOut_bh6_21_21   ,
                 X0 => CompressorIn_bh6_21_21);
   heap_bh6_w23_21 <= CompressorOut_bh6_21_21(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w24_20 <= CompressorOut_bh6_21_21(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w25_18 <= CompressorOut_bh6_21_21(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_22_22 <= heap_bh6_w24_16 & heap_bh6_w24_8 & heap_bh6_w24_7 & heap_bh6_w24_6 & heap_bh6_w24_5 & heap_bh6_w24_4;
   Compressor_bh6_22: Compressor_6_3
      port map ( R => CompressorOut_bh6_22_22   ,
                 X0 => CompressorIn_bh6_22_22);
   heap_bh6_w24_21 <= CompressorOut_bh6_22_22(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w25_19 <= CompressorOut_bh6_22_22(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w26_18 <= CompressorOut_bh6_22_22(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_23_23 <= heap_bh6_w24_3 & heap_bh6_w24_2 & heap_bh6_w24_1 & heap_bh6_w24_0 & heap_bh6_w24_15 & heap_bh6_w24_14;
   Compressor_bh6_23: Compressor_6_3
      port map ( R => CompressorOut_bh6_23_23   ,
                 X0 => CompressorIn_bh6_23_23);
   heap_bh6_w24_22 <= CompressorOut_bh6_23_23(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w25_20 <= CompressorOut_bh6_23_23(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w26_19 <= CompressorOut_bh6_23_23(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_24_24 <= heap_bh6_w25_16 & heap_bh6_w25_8 & heap_bh6_w25_7 & heap_bh6_w25_6 & heap_bh6_w25_5 & heap_bh6_w25_4;
   Compressor_bh6_24: Compressor_6_3
      port map ( R => CompressorOut_bh6_24_24   ,
                 X0 => CompressorIn_bh6_24_24);
   heap_bh6_w25_21 <= CompressorOut_bh6_24_24(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w26_20 <= CompressorOut_bh6_24_24(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w27_19 <= CompressorOut_bh6_24_24(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_25_25 <= heap_bh6_w25_3 & heap_bh6_w25_2 & heap_bh6_w25_1 & heap_bh6_w25_0 & heap_bh6_w25_15 & heap_bh6_w25_14;
   Compressor_bh6_25: Compressor_6_3
      port map ( R => CompressorOut_bh6_25_25   ,
                 X0 => CompressorIn_bh6_25_25);
   heap_bh6_w25_22 <= CompressorOut_bh6_25_25(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w26_21 <= CompressorOut_bh6_25_25(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w27_20 <= CompressorOut_bh6_25_25(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_26_26 <= heap_bh6_w26_17 & heap_bh6_w26_9 & heap_bh6_w26_8 & heap_bh6_w26_7 & heap_bh6_w26_6 & heap_bh6_w26_5;
   Compressor_bh6_26: Compressor_6_3
      port map ( R => CompressorOut_bh6_26_26   ,
                 X0 => CompressorIn_bh6_26_26);
   heap_bh6_w26_22 <= CompressorOut_bh6_26_26(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w27_21 <= CompressorOut_bh6_26_26(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w28_19 <= CompressorOut_bh6_26_26(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_27_27 <= heap_bh6_w26_4 & heap_bh6_w26_3 & heap_bh6_w26_2 & heap_bh6_w26_1 & heap_bh6_w26_0 & heap_bh6_w26_16;
   Compressor_bh6_27: Compressor_6_3
      port map ( R => CompressorOut_bh6_27_27   ,
                 X0 => CompressorIn_bh6_27_27);
   heap_bh6_w26_23 <= CompressorOut_bh6_27_27(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w27_22 <= CompressorOut_bh6_27_27(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w28_20 <= CompressorOut_bh6_27_27(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_28_28 <= heap_bh6_w26_15 & heap_bh6_w26_14 & heap_bh6_w26_13 & heap_bh6_w26_12 & heap_bh6_w26_11 & heap_bh6_w26_10;
   Compressor_bh6_28: Compressor_6_3
      port map ( R => CompressorOut_bh6_28_28   ,
                 X0 => CompressorIn_bh6_28_28);
   heap_bh6_w26_24 <= CompressorOut_bh6_28_28(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w27_23 <= CompressorOut_bh6_28_28(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w28_21 <= CompressorOut_bh6_28_28(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_29_29 <= heap_bh6_w27_9 & heap_bh6_w27_8 & heap_bh6_w27_7 & heap_bh6_w27_6 & heap_bh6_w27_5 & heap_bh6_w27_4;
   Compressor_bh6_29: Compressor_6_3
      port map ( R => CompressorOut_bh6_29_29   ,
                 X0 => CompressorIn_bh6_29_29);
   heap_bh6_w27_24 <= CompressorOut_bh6_29_29(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w28_22 <= CompressorOut_bh6_29_29(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w29_19 <= CompressorOut_bh6_29_29(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_30_30 <= heap_bh6_w27_3 & heap_bh6_w27_2 & heap_bh6_w27_1 & heap_bh6_w27_0 & heap_bh6_w27_17 & heap_bh6_w27_16;
   Compressor_bh6_30: Compressor_6_3
      port map ( R => CompressorOut_bh6_30_30   ,
                 X0 => CompressorIn_bh6_30_30);
   heap_bh6_w27_25 <= CompressorOut_bh6_30_30(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w28_23 <= CompressorOut_bh6_30_30(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w29_20 <= CompressorOut_bh6_30_30(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_31_31 <= heap_bh6_w27_15 & heap_bh6_w27_14 & heap_bh6_w27_13 & heap_bh6_w27_12 & heap_bh6_w27_11 & heap_bh6_w27_10;
   Compressor_bh6_31: Compressor_6_3
      port map ( R => CompressorOut_bh6_31_31   ,
                 X0 => CompressorIn_bh6_31_31);
   heap_bh6_w27_26 <= CompressorOut_bh6_31_31(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w28_24 <= CompressorOut_bh6_31_31(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w29_21 <= CompressorOut_bh6_31_31(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_32_32 <= heap_bh6_w28_9 & heap_bh6_w28_8 & heap_bh6_w28_7 & heap_bh6_w28_6 & heap_bh6_w28_5 & heap_bh6_w28_4;
   Compressor_bh6_32: Compressor_6_3
      port map ( R => CompressorOut_bh6_32_32   ,
                 X0 => CompressorIn_bh6_32_32);
   heap_bh6_w28_25 <= CompressorOut_bh6_32_32(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w29_22 <= CompressorOut_bh6_32_32(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w30_19 <= CompressorOut_bh6_32_32(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_33_33 <= heap_bh6_w28_3 & heap_bh6_w28_2 & heap_bh6_w28_1 & heap_bh6_w28_0 & heap_bh6_w28_17 & heap_bh6_w28_16;
   Compressor_bh6_33: Compressor_6_3
      port map ( R => CompressorOut_bh6_33_33   ,
                 X0 => CompressorIn_bh6_33_33);
   heap_bh6_w28_26 <= CompressorOut_bh6_33_33(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w29_23 <= CompressorOut_bh6_33_33(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w30_20 <= CompressorOut_bh6_33_33(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_34_34 <= heap_bh6_w28_15 & heap_bh6_w28_14 & heap_bh6_w28_13 & heap_bh6_w28_12 & heap_bh6_w28_11 & heap_bh6_w28_10;
   Compressor_bh6_34: Compressor_6_3
      port map ( R => CompressorOut_bh6_34_34   ,
                 X0 => CompressorIn_bh6_34_34);
   heap_bh6_w28_27 <= CompressorOut_bh6_34_34(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w29_24 <= CompressorOut_bh6_34_34(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w30_21 <= CompressorOut_bh6_34_34(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_35_35 <= heap_bh6_w29_9 & heap_bh6_w29_8 & heap_bh6_w29_7 & heap_bh6_w29_6 & heap_bh6_w29_5 & heap_bh6_w29_4;
   Compressor_bh6_35: Compressor_6_3
      port map ( R => CompressorOut_bh6_35_35   ,
                 X0 => CompressorIn_bh6_35_35);
   heap_bh6_w29_25 <= CompressorOut_bh6_35_35(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w30_22 <= CompressorOut_bh6_35_35(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w31_20 <= CompressorOut_bh6_35_35(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_36_36 <= heap_bh6_w29_3 & heap_bh6_w29_2 & heap_bh6_w29_1 & heap_bh6_w29_0 & heap_bh6_w29_17 & heap_bh6_w29_16;
   Compressor_bh6_36: Compressor_6_3
      port map ( R => CompressorOut_bh6_36_36   ,
                 X0 => CompressorIn_bh6_36_36);
   heap_bh6_w29_26 <= CompressorOut_bh6_36_36(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w30_23 <= CompressorOut_bh6_36_36(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w31_21 <= CompressorOut_bh6_36_36(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_37_37 <= heap_bh6_w29_15 & heap_bh6_w29_14 & heap_bh6_w29_13 & heap_bh6_w29_12 & heap_bh6_w29_11 & heap_bh6_w29_10;
   Compressor_bh6_37: Compressor_6_3
      port map ( R => CompressorOut_bh6_37_37   ,
                 X0 => CompressorIn_bh6_37_37);
   heap_bh6_w29_27 <= CompressorOut_bh6_37_37(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w30_24 <= CompressorOut_bh6_37_37(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w31_22 <= CompressorOut_bh6_37_37(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_38_38 <= heap_bh6_w30_9 & heap_bh6_w30_8 & heap_bh6_w30_7 & heap_bh6_w30_6 & heap_bh6_w30_5 & heap_bh6_w30_4;
   Compressor_bh6_38: Compressor_6_3
      port map ( R => CompressorOut_bh6_38_38   ,
                 X0 => CompressorIn_bh6_38_38);
   heap_bh6_w30_25 <= CompressorOut_bh6_38_38(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w31_23 <= CompressorOut_bh6_38_38(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w32_19 <= CompressorOut_bh6_38_38(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_39_39 <= heap_bh6_w30_3 & heap_bh6_w30_2 & heap_bh6_w30_1 & heap_bh6_w30_0 & heap_bh6_w30_17 & heap_bh6_w30_16;
   Compressor_bh6_39: Compressor_6_3
      port map ( R => CompressorOut_bh6_39_39   ,
                 X0 => CompressorIn_bh6_39_39);
   heap_bh6_w30_26 <= CompressorOut_bh6_39_39(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w31_24 <= CompressorOut_bh6_39_39(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w32_20 <= CompressorOut_bh6_39_39(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_40_40 <= heap_bh6_w30_15 & heap_bh6_w30_14 & heap_bh6_w30_13 & heap_bh6_w30_12 & heap_bh6_w30_11 & heap_bh6_w30_10;
   Compressor_bh6_40: Compressor_6_3
      port map ( R => CompressorOut_bh6_40_40   ,
                 X0 => CompressorIn_bh6_40_40);
   heap_bh6_w30_27 <= CompressorOut_bh6_40_40(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w31_25 <= CompressorOut_bh6_40_40(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w32_21 <= CompressorOut_bh6_40_40(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_41_41 <= heap_bh6_w31_10 & heap_bh6_w31_9 & heap_bh6_w31_8 & heap_bh6_w31_7 & heap_bh6_w31_6 & heap_bh6_w31_5;
   Compressor_bh6_41: Compressor_6_3
      port map ( R => CompressorOut_bh6_41_41   ,
                 X0 => CompressorIn_bh6_41_41);
   heap_bh6_w31_26 <= CompressorOut_bh6_41_41(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w32_22 <= CompressorOut_bh6_41_41(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w33_19 <= CompressorOut_bh6_41_41(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_42_42 <= heap_bh6_w31_4 & heap_bh6_w31_3 & heap_bh6_w31_2 & heap_bh6_w31_1 & heap_bh6_w31_0 & heap_bh6_w31_18;
   Compressor_bh6_42: Compressor_6_3
      port map ( R => CompressorOut_bh6_42_42   ,
                 X0 => CompressorIn_bh6_42_42);
   heap_bh6_w31_27 <= CompressorOut_bh6_42_42(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w32_23 <= CompressorOut_bh6_42_42(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w33_20 <= CompressorOut_bh6_42_42(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_43_43 <= heap_bh6_w31_17 & heap_bh6_w31_16 & heap_bh6_w31_15 & heap_bh6_w31_14 & heap_bh6_w31_13 & heap_bh6_w31_12;
   Compressor_bh6_43: Compressor_6_3
      port map ( R => CompressorOut_bh6_43_43   ,
                 X0 => CompressorIn_bh6_43_43);
   heap_bh6_w31_28 <= CompressorOut_bh6_43_43(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w32_24 <= CompressorOut_bh6_43_43(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w33_21 <= CompressorOut_bh6_43_43(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_44_44 <= heap_bh6_w32_9 & heap_bh6_w32_8 & heap_bh6_w32_7 & heap_bh6_w32_6 & heap_bh6_w32_5 & heap_bh6_w32_4;
   Compressor_bh6_44: Compressor_6_3
      port map ( R => CompressorOut_bh6_44_44   ,
                 X0 => CompressorIn_bh6_44_44);
   heap_bh6_w32_25 <= CompressorOut_bh6_44_44(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w33_22 <= CompressorOut_bh6_44_44(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w34_20 <= CompressorOut_bh6_44_44(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_45_45 <= heap_bh6_w32_3 & heap_bh6_w32_2 & heap_bh6_w32_1 & heap_bh6_w32_0 & heap_bh6_w32_17 & heap_bh6_w32_16;
   Compressor_bh6_45: Compressor_6_3
      port map ( R => CompressorOut_bh6_45_45   ,
                 X0 => CompressorIn_bh6_45_45);
   heap_bh6_w32_26 <= CompressorOut_bh6_45_45(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w33_23 <= CompressorOut_bh6_45_45(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w34_21 <= CompressorOut_bh6_45_45(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_46_46 <= heap_bh6_w32_15 & heap_bh6_w32_14 & heap_bh6_w32_13 & heap_bh6_w32_12 & heap_bh6_w32_11 & heap_bh6_w32_10;
   Compressor_bh6_46: Compressor_6_3
      port map ( R => CompressorOut_bh6_46_46   ,
                 X0 => CompressorIn_bh6_46_46);
   heap_bh6_w32_27 <= CompressorOut_bh6_46_46(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w33_24 <= CompressorOut_bh6_46_46(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w34_22 <= CompressorOut_bh6_46_46(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_47_47 <= heap_bh6_w33_9 & heap_bh6_w33_8 & heap_bh6_w33_7 & heap_bh6_w33_6 & heap_bh6_w33_5 & heap_bh6_w33_4;
   Compressor_bh6_47: Compressor_6_3
      port map ( R => CompressorOut_bh6_47_47   ,
                 X0 => CompressorIn_bh6_47_47);
   heap_bh6_w33_25 <= CompressorOut_bh6_47_47(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w34_23 <= CompressorOut_bh6_47_47(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w35_19 <= CompressorOut_bh6_47_47(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_48_48 <= heap_bh6_w33_3 & heap_bh6_w33_2 & heap_bh6_w33_1 & heap_bh6_w33_0 & heap_bh6_w33_17 & heap_bh6_w33_16;
   Compressor_bh6_48: Compressor_6_3
      port map ( R => CompressorOut_bh6_48_48   ,
                 X0 => CompressorIn_bh6_48_48);
   heap_bh6_w33_26 <= CompressorOut_bh6_48_48(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w34_24 <= CompressorOut_bh6_48_48(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w35_20 <= CompressorOut_bh6_48_48(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_49_49 <= heap_bh6_w33_15 & heap_bh6_w33_14 & heap_bh6_w33_13 & heap_bh6_w33_12 & heap_bh6_w33_11 & heap_bh6_w33_10;
   Compressor_bh6_49: Compressor_6_3
      port map ( R => CompressorOut_bh6_49_49   ,
                 X0 => CompressorIn_bh6_49_49);
   heap_bh6_w33_27 <= CompressorOut_bh6_49_49(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w34_25 <= CompressorOut_bh6_49_49(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w35_21 <= CompressorOut_bh6_49_49(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_50_50 <= heap_bh6_w34_10 & heap_bh6_w34_9 & heap_bh6_w34_8 & heap_bh6_w34_7 & heap_bh6_w34_6 & heap_bh6_w34_5;
   Compressor_bh6_50: Compressor_6_3
      port map ( R => CompressorOut_bh6_50_50   ,
                 X0 => CompressorIn_bh6_50_50);
   heap_bh6_w34_26 <= CompressorOut_bh6_50_50(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w35_22 <= CompressorOut_bh6_50_50(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w36_19 <= CompressorOut_bh6_50_50(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_51_51 <= heap_bh6_w34_4 & heap_bh6_w34_3 & heap_bh6_w34_2 & heap_bh6_w34_1 & heap_bh6_w34_0 & heap_bh6_w34_18;
   Compressor_bh6_51: Compressor_6_3
      port map ( R => CompressorOut_bh6_51_51   ,
                 X0 => CompressorIn_bh6_51_51);
   heap_bh6_w34_27 <= CompressorOut_bh6_51_51(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w35_23 <= CompressorOut_bh6_51_51(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w36_20 <= CompressorOut_bh6_51_51(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_52_52 <= heap_bh6_w34_17 & heap_bh6_w34_16 & heap_bh6_w34_15 & heap_bh6_w34_14 & heap_bh6_w34_13 & heap_bh6_w34_12;
   Compressor_bh6_52: Compressor_6_3
      port map ( R => CompressorOut_bh6_52_52   ,
                 X0 => CompressorIn_bh6_52_52);
   heap_bh6_w34_28 <= CompressorOut_bh6_52_52(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w35_24 <= CompressorOut_bh6_52_52(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w36_21 <= CompressorOut_bh6_52_52(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_53_53 <= heap_bh6_w35_9 & heap_bh6_w35_8 & heap_bh6_w35_7 & heap_bh6_w35_6 & heap_bh6_w35_5 & heap_bh6_w35_4;
   Compressor_bh6_53: Compressor_6_3
      port map ( R => CompressorOut_bh6_53_53   ,
                 X0 => CompressorIn_bh6_53_53);
   heap_bh6_w35_25 <= CompressorOut_bh6_53_53(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w36_22 <= CompressorOut_bh6_53_53(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w37_20 <= CompressorOut_bh6_53_53(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_54_54 <= heap_bh6_w35_3 & heap_bh6_w35_2 & heap_bh6_w35_1 & heap_bh6_w35_0 & heap_bh6_w35_17 & heap_bh6_w35_16;
   Compressor_bh6_54: Compressor_6_3
      port map ( R => CompressorOut_bh6_54_54   ,
                 X0 => CompressorIn_bh6_54_54);
   heap_bh6_w35_26 <= CompressorOut_bh6_54_54(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w36_23 <= CompressorOut_bh6_54_54(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w37_21 <= CompressorOut_bh6_54_54(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_55_55 <= heap_bh6_w35_15 & heap_bh6_w35_14 & heap_bh6_w35_13 & heap_bh6_w35_12 & heap_bh6_w35_11 & heap_bh6_w35_10;
   Compressor_bh6_55: Compressor_6_3
      port map ( R => CompressorOut_bh6_55_55   ,
                 X0 => CompressorIn_bh6_55_55);
   heap_bh6_w35_27 <= CompressorOut_bh6_55_55(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w36_24 <= CompressorOut_bh6_55_55(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w37_22 <= CompressorOut_bh6_55_55(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_56_56 <= heap_bh6_w36_9 & heap_bh6_w36_8 & heap_bh6_w36_7 & heap_bh6_w36_6 & heap_bh6_w36_5 & heap_bh6_w36_4;
   Compressor_bh6_56: Compressor_6_3
      port map ( R => CompressorOut_bh6_56_56   ,
                 X0 => CompressorIn_bh6_56_56);
   heap_bh6_w36_25 <= CompressorOut_bh6_56_56(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w37_23 <= CompressorOut_bh6_56_56(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w38_19 <= CompressorOut_bh6_56_56(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_57_57 <= heap_bh6_w36_3 & heap_bh6_w36_2 & heap_bh6_w36_1 & heap_bh6_w36_0 & heap_bh6_w36_17 & heap_bh6_w36_16;
   Compressor_bh6_57: Compressor_6_3
      port map ( R => CompressorOut_bh6_57_57   ,
                 X0 => CompressorIn_bh6_57_57);
   heap_bh6_w36_26 <= CompressorOut_bh6_57_57(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w37_24 <= CompressorOut_bh6_57_57(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w38_20 <= CompressorOut_bh6_57_57(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_58_58 <= heap_bh6_w36_15 & heap_bh6_w36_14 & heap_bh6_w36_13 & heap_bh6_w36_12 & heap_bh6_w36_11 & heap_bh6_w36_10;
   Compressor_bh6_58: Compressor_6_3
      port map ( R => CompressorOut_bh6_58_58   ,
                 X0 => CompressorIn_bh6_58_58);
   heap_bh6_w36_27 <= CompressorOut_bh6_58_58(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w37_25 <= CompressorOut_bh6_58_58(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w38_21 <= CompressorOut_bh6_58_58(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_59_59 <= heap_bh6_w37_10 & heap_bh6_w37_9 & heap_bh6_w37_8 & heap_bh6_w37_7 & heap_bh6_w37_6 & heap_bh6_w37_5;
   Compressor_bh6_59: Compressor_6_3
      port map ( R => CompressorOut_bh6_59_59   ,
                 X0 => CompressorIn_bh6_59_59);
   heap_bh6_w37_26 <= CompressorOut_bh6_59_59(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w38_22 <= CompressorOut_bh6_59_59(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w39_19 <= CompressorOut_bh6_59_59(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_60_60 <= heap_bh6_w37_4 & heap_bh6_w37_3 & heap_bh6_w37_2 & heap_bh6_w37_1 & heap_bh6_w37_0 & heap_bh6_w37_18;
   Compressor_bh6_60: Compressor_6_3
      port map ( R => CompressorOut_bh6_60_60   ,
                 X0 => CompressorIn_bh6_60_60);
   heap_bh6_w37_27 <= CompressorOut_bh6_60_60(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w38_23 <= CompressorOut_bh6_60_60(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w39_20 <= CompressorOut_bh6_60_60(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_61_61 <= heap_bh6_w37_17 & heap_bh6_w37_16 & heap_bh6_w37_15 & heap_bh6_w37_14 & heap_bh6_w37_13 & heap_bh6_w37_12;
   Compressor_bh6_61: Compressor_6_3
      port map ( R => CompressorOut_bh6_61_61   ,
                 X0 => CompressorIn_bh6_61_61);
   heap_bh6_w37_28 <= CompressorOut_bh6_61_61(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w38_24 <= CompressorOut_bh6_61_61(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w39_21 <= CompressorOut_bh6_61_61(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_62_62 <= heap_bh6_w38_9 & heap_bh6_w38_8 & heap_bh6_w38_7 & heap_bh6_w38_6 & heap_bh6_w38_5 & heap_bh6_w38_4;
   Compressor_bh6_62: Compressor_6_3
      port map ( R => CompressorOut_bh6_62_62   ,
                 X0 => CompressorIn_bh6_62_62);
   heap_bh6_w38_25 <= CompressorOut_bh6_62_62(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w39_22 <= CompressorOut_bh6_62_62(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w40_20 <= CompressorOut_bh6_62_62(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_63_63 <= heap_bh6_w38_3 & heap_bh6_w38_2 & heap_bh6_w38_1 & heap_bh6_w38_0 & heap_bh6_w38_17 & heap_bh6_w38_16;
   Compressor_bh6_63: Compressor_6_3
      port map ( R => CompressorOut_bh6_63_63   ,
                 X0 => CompressorIn_bh6_63_63);
   heap_bh6_w38_26 <= CompressorOut_bh6_63_63(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w39_23 <= CompressorOut_bh6_63_63(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w40_21 <= CompressorOut_bh6_63_63(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_64_64 <= heap_bh6_w38_15 & heap_bh6_w38_14 & heap_bh6_w38_13 & heap_bh6_w38_12 & heap_bh6_w38_11 & heap_bh6_w38_10;
   Compressor_bh6_64: Compressor_6_3
      port map ( R => CompressorOut_bh6_64_64   ,
                 X0 => CompressorIn_bh6_64_64);
   heap_bh6_w38_27 <= CompressorOut_bh6_64_64(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w39_24 <= CompressorOut_bh6_64_64(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w40_22 <= CompressorOut_bh6_64_64(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_65_65 <= heap_bh6_w39_9 & heap_bh6_w39_8 & heap_bh6_w39_7 & heap_bh6_w39_6 & heap_bh6_w39_5 & heap_bh6_w39_4;
   Compressor_bh6_65: Compressor_6_3
      port map ( R => CompressorOut_bh6_65_65   ,
                 X0 => CompressorIn_bh6_65_65);
   heap_bh6_w39_25 <= CompressorOut_bh6_65_65(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w40_23 <= CompressorOut_bh6_65_65(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w41_19 <= CompressorOut_bh6_65_65(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_66_66 <= heap_bh6_w39_3 & heap_bh6_w39_2 & heap_bh6_w39_1 & heap_bh6_w39_0 & heap_bh6_w39_17 & heap_bh6_w39_16;
   Compressor_bh6_66: Compressor_6_3
      port map ( R => CompressorOut_bh6_66_66   ,
                 X0 => CompressorIn_bh6_66_66);
   heap_bh6_w39_26 <= CompressorOut_bh6_66_66(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w40_24 <= CompressorOut_bh6_66_66(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w41_20 <= CompressorOut_bh6_66_66(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_67_67 <= heap_bh6_w39_15 & heap_bh6_w39_14 & heap_bh6_w39_13 & heap_bh6_w39_12 & heap_bh6_w39_11 & heap_bh6_w39_10;
   Compressor_bh6_67: Compressor_6_3
      port map ( R => CompressorOut_bh6_67_67   ,
                 X0 => CompressorIn_bh6_67_67);
   heap_bh6_w39_27 <= CompressorOut_bh6_67_67(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w40_25 <= CompressorOut_bh6_67_67(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w41_21 <= CompressorOut_bh6_67_67(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_68_68 <= heap_bh6_w40_10 & heap_bh6_w40_9 & heap_bh6_w40_8 & heap_bh6_w40_7 & heap_bh6_w40_6 & heap_bh6_w40_5;
   Compressor_bh6_68: Compressor_6_3
      port map ( R => CompressorOut_bh6_68_68   ,
                 X0 => CompressorIn_bh6_68_68);
   heap_bh6_w40_26 <= CompressorOut_bh6_68_68(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w41_22 <= CompressorOut_bh6_68_68(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w42_19 <= CompressorOut_bh6_68_68(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_69_69 <= heap_bh6_w40_4 & heap_bh6_w40_3 & heap_bh6_w40_2 & heap_bh6_w40_1 & heap_bh6_w40_0 & heap_bh6_w40_18;
   Compressor_bh6_69: Compressor_6_3
      port map ( R => CompressorOut_bh6_69_69   ,
                 X0 => CompressorIn_bh6_69_69);
   heap_bh6_w40_27 <= CompressorOut_bh6_69_69(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w41_23 <= CompressorOut_bh6_69_69(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w42_20 <= CompressorOut_bh6_69_69(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_70_70 <= heap_bh6_w40_17 & heap_bh6_w40_16 & heap_bh6_w40_15 & heap_bh6_w40_14 & heap_bh6_w40_13 & heap_bh6_w40_12;
   Compressor_bh6_70: Compressor_6_3
      port map ( R => CompressorOut_bh6_70_70   ,
                 X0 => CompressorIn_bh6_70_70);
   heap_bh6_w40_28 <= CompressorOut_bh6_70_70(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w41_24 <= CompressorOut_bh6_70_70(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w42_21 <= CompressorOut_bh6_70_70(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_71_71 <= heap_bh6_w41_9 & heap_bh6_w41_8 & heap_bh6_w41_7 & heap_bh6_w41_6 & heap_bh6_w41_5 & heap_bh6_w41_4;
   Compressor_bh6_71: Compressor_6_3
      port map ( R => CompressorOut_bh6_71_71   ,
                 X0 => CompressorIn_bh6_71_71);
   heap_bh6_w41_25 <= CompressorOut_bh6_71_71(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w42_22 <= CompressorOut_bh6_71_71(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w43_20 <= CompressorOut_bh6_71_71(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_72_72 <= heap_bh6_w41_3 & heap_bh6_w41_2 & heap_bh6_w41_1 & heap_bh6_w41_0 & heap_bh6_w41_17 & heap_bh6_w41_16;
   Compressor_bh6_72: Compressor_6_3
      port map ( R => CompressorOut_bh6_72_72   ,
                 X0 => CompressorIn_bh6_72_72);
   heap_bh6_w41_26 <= CompressorOut_bh6_72_72(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w42_23 <= CompressorOut_bh6_72_72(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w43_21 <= CompressorOut_bh6_72_72(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_73_73 <= heap_bh6_w41_15 & heap_bh6_w41_14 & heap_bh6_w41_13 & heap_bh6_w41_12 & heap_bh6_w41_11 & heap_bh6_w41_10;
   Compressor_bh6_73: Compressor_6_3
      port map ( R => CompressorOut_bh6_73_73   ,
                 X0 => CompressorIn_bh6_73_73);
   heap_bh6_w41_27 <= CompressorOut_bh6_73_73(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w42_24 <= CompressorOut_bh6_73_73(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w43_22 <= CompressorOut_bh6_73_73(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_74_74 <= heap_bh6_w42_9 & heap_bh6_w42_8 & heap_bh6_w42_7 & heap_bh6_w42_6 & heap_bh6_w42_5 & heap_bh6_w42_4;
   Compressor_bh6_74: Compressor_6_3
      port map ( R => CompressorOut_bh6_74_74   ,
                 X0 => CompressorIn_bh6_74_74);
   heap_bh6_w42_25 <= CompressorOut_bh6_74_74(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w43_23 <= CompressorOut_bh6_74_74(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w44_20 <= CompressorOut_bh6_74_74(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_75_75 <= heap_bh6_w42_3 & heap_bh6_w42_2 & heap_bh6_w42_1 & heap_bh6_w42_0 & heap_bh6_w42_17 & heap_bh6_w42_16;
   Compressor_bh6_75: Compressor_6_3
      port map ( R => CompressorOut_bh6_75_75   ,
                 X0 => CompressorIn_bh6_75_75);
   heap_bh6_w42_26 <= CompressorOut_bh6_75_75(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w43_24 <= CompressorOut_bh6_75_75(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w44_21 <= CompressorOut_bh6_75_75(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_76_76 <= heap_bh6_w42_15 & heap_bh6_w42_14 & heap_bh6_w42_13 & heap_bh6_w42_12 & heap_bh6_w42_11 & heap_bh6_w42_10;
   Compressor_bh6_76: Compressor_6_3
      port map ( R => CompressorOut_bh6_76_76   ,
                 X0 => CompressorIn_bh6_76_76);
   heap_bh6_w42_27 <= CompressorOut_bh6_76_76(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w43_25 <= CompressorOut_bh6_76_76(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w44_22 <= CompressorOut_bh6_76_76(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_77_77 <= heap_bh6_w43_10 & heap_bh6_w43_9 & heap_bh6_w43_8 & heap_bh6_w43_7 & heap_bh6_w43_6 & heap_bh6_w43_5;
   Compressor_bh6_77: Compressor_6_3
      port map ( R => CompressorOut_bh6_77_77   ,
                 X0 => CompressorIn_bh6_77_77);
   heap_bh6_w43_26 <= CompressorOut_bh6_77_77(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w44_23 <= CompressorOut_bh6_77_77(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w45_20 <= CompressorOut_bh6_77_77(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_78_78 <= heap_bh6_w43_4 & heap_bh6_w43_3 & heap_bh6_w43_2 & heap_bh6_w43_1 & heap_bh6_w43_0 & heap_bh6_w43_18;
   Compressor_bh6_78: Compressor_6_3
      port map ( R => CompressorOut_bh6_78_78   ,
                 X0 => CompressorIn_bh6_78_78);
   heap_bh6_w43_27 <= CompressorOut_bh6_78_78(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w44_24 <= CompressorOut_bh6_78_78(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w45_21 <= CompressorOut_bh6_78_78(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_79_79 <= heap_bh6_w43_17 & heap_bh6_w43_16 & heap_bh6_w43_15 & heap_bh6_w43_14 & heap_bh6_w43_13 & heap_bh6_w43_12;
   Compressor_bh6_79: Compressor_6_3
      port map ( R => CompressorOut_bh6_79_79   ,
                 X0 => CompressorIn_bh6_79_79);
   heap_bh6_w43_28 <= CompressorOut_bh6_79_79(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w44_25 <= CompressorOut_bh6_79_79(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w45_22 <= CompressorOut_bh6_79_79(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_80_80 <= heap_bh6_w44_9 & heap_bh6_w44_8 & heap_bh6_w44_7 & heap_bh6_w44_6 & heap_bh6_w44_5 & heap_bh6_w44_4;
   Compressor_bh6_80: Compressor_6_3
      port map ( R => CompressorOut_bh6_80_80   ,
                 X0 => CompressorIn_bh6_80_80);
   heap_bh6_w44_26 <= CompressorOut_bh6_80_80(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w45_23 <= CompressorOut_bh6_80_80(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w46_20 <= CompressorOut_bh6_80_80(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_81_81 <= heap_bh6_w44_3 & heap_bh6_w44_2 & heap_bh6_w44_1 & heap_bh6_w44_0 & heap_bh6_w44_17 & heap_bh6_w44_16;
   Compressor_bh6_81: Compressor_6_3
      port map ( R => CompressorOut_bh6_81_81   ,
                 X0 => CompressorIn_bh6_81_81);
   heap_bh6_w44_27 <= CompressorOut_bh6_81_81(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w45_24 <= CompressorOut_bh6_81_81(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w46_21 <= CompressorOut_bh6_81_81(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_82_82 <= heap_bh6_w44_15 & heap_bh6_w44_14 & heap_bh6_w44_13 & heap_bh6_w44_12 & heap_bh6_w44_11 & heap_bh6_w44_10;
   Compressor_bh6_82: Compressor_6_3
      port map ( R => CompressorOut_bh6_82_82   ,
                 X0 => CompressorIn_bh6_82_82);
   heap_bh6_w44_28 <= CompressorOut_bh6_82_82(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w45_25 <= CompressorOut_bh6_82_82(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w46_22 <= CompressorOut_bh6_82_82(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_83_83 <= heap_bh6_w45_9 & heap_bh6_w45_8 & heap_bh6_w45_7 & heap_bh6_w45_6 & heap_bh6_w45_5 & heap_bh6_w45_4;
   Compressor_bh6_83: Compressor_6_3
      port map ( R => CompressorOut_bh6_83_83   ,
                 X0 => CompressorIn_bh6_83_83);
   heap_bh6_w45_26 <= CompressorOut_bh6_83_83(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w46_23 <= CompressorOut_bh6_83_83(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w47_20 <= CompressorOut_bh6_83_83(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_84_84 <= heap_bh6_w45_3 & heap_bh6_w45_2 & heap_bh6_w45_1 & heap_bh6_w45_0 & heap_bh6_w45_17 & heap_bh6_w45_16;
   Compressor_bh6_84: Compressor_6_3
      port map ( R => CompressorOut_bh6_84_84   ,
                 X0 => CompressorIn_bh6_84_84);
   heap_bh6_w45_27 <= CompressorOut_bh6_84_84(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w46_24 <= CompressorOut_bh6_84_84(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w47_21 <= CompressorOut_bh6_84_84(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_85_85 <= heap_bh6_w45_15 & heap_bh6_w45_14 & heap_bh6_w45_13 & heap_bh6_w45_12 & heap_bh6_w45_11 & heap_bh6_w45_10;
   Compressor_bh6_85: Compressor_6_3
      port map ( R => CompressorOut_bh6_85_85   ,
                 X0 => CompressorIn_bh6_85_85);
   heap_bh6_w45_28 <= CompressorOut_bh6_85_85(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w46_25 <= CompressorOut_bh6_85_85(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w47_22 <= CompressorOut_bh6_85_85(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_86_86 <= heap_bh6_w46_9 & heap_bh6_w46_8 & heap_bh6_w46_7 & heap_bh6_w46_6 & heap_bh6_w46_5 & heap_bh6_w46_4;
   Compressor_bh6_86: Compressor_6_3
      port map ( R => CompressorOut_bh6_86_86   ,
                 X0 => CompressorIn_bh6_86_86);
   heap_bh6_w46_26 <= CompressorOut_bh6_86_86(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w47_23 <= CompressorOut_bh6_86_86(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w48_21 <= CompressorOut_bh6_86_86(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_87_87 <= heap_bh6_w46_3 & heap_bh6_w46_2 & heap_bh6_w46_1 & heap_bh6_w46_0 & heap_bh6_w46_17 & heap_bh6_w46_16;
   Compressor_bh6_87: Compressor_6_3
      port map ( R => CompressorOut_bh6_87_87   ,
                 X0 => CompressorIn_bh6_87_87);
   heap_bh6_w46_27 <= CompressorOut_bh6_87_87(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w47_24 <= CompressorOut_bh6_87_87(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w48_22 <= CompressorOut_bh6_87_87(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_88_88 <= heap_bh6_w46_15 & heap_bh6_w46_14 & heap_bh6_w46_13 & heap_bh6_w46_12 & heap_bh6_w46_11 & heap_bh6_w46_10;
   Compressor_bh6_88: Compressor_6_3
      port map ( R => CompressorOut_bh6_88_88   ,
                 X0 => CompressorIn_bh6_88_88);
   heap_bh6_w46_28 <= CompressorOut_bh6_88_88(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w47_25 <= CompressorOut_bh6_88_88(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w48_23 <= CompressorOut_bh6_88_88(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_89_89 <= heap_bh6_w47_9 & heap_bh6_w47_8 & heap_bh6_w47_7 & heap_bh6_w47_6 & heap_bh6_w47_5 & heap_bh6_w47_4;
   Compressor_bh6_89: Compressor_6_3
      port map ( R => CompressorOut_bh6_89_89   ,
                 X0 => CompressorIn_bh6_89_89);
   heap_bh6_w47_26 <= CompressorOut_bh6_89_89(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w48_24 <= CompressorOut_bh6_89_89(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w49_20 <= CompressorOut_bh6_89_89(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_90_90 <= heap_bh6_w47_3 & heap_bh6_w47_2 & heap_bh6_w47_1 & heap_bh6_w47_0 & heap_bh6_w47_17 & heap_bh6_w47_16;
   Compressor_bh6_90: Compressor_6_3
      port map ( R => CompressorOut_bh6_90_90   ,
                 X0 => CompressorIn_bh6_90_90);
   heap_bh6_w47_27 <= CompressorOut_bh6_90_90(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w48_25 <= CompressorOut_bh6_90_90(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w49_21 <= CompressorOut_bh6_90_90(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_91_91 <= heap_bh6_w47_15 & heap_bh6_w47_14 & heap_bh6_w47_13 & heap_bh6_w47_12 & heap_bh6_w47_11 & heap_bh6_w47_10;
   Compressor_bh6_91: Compressor_6_3
      port map ( R => CompressorOut_bh6_91_91   ,
                 X0 => CompressorIn_bh6_91_91);
   heap_bh6_w47_28 <= CompressorOut_bh6_91_91(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w48_26 <= CompressorOut_bh6_91_91(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w49_22 <= CompressorOut_bh6_91_91(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_92_92 <= heap_bh6_w48_10 & heap_bh6_w48_9 & heap_bh6_w48_8 & heap_bh6_w48_7 & heap_bh6_w48_6 & heap_bh6_w48_5;
   Compressor_bh6_92: Compressor_6_3
      port map ( R => CompressorOut_bh6_92_92   ,
                 X0 => CompressorIn_bh6_92_92);
   heap_bh6_w48_27 <= CompressorOut_bh6_92_92(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w49_23 <= CompressorOut_bh6_92_92(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w50_20 <= CompressorOut_bh6_92_92(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_93_93 <= heap_bh6_w48_4 & heap_bh6_w48_3 & heap_bh6_w48_2 & heap_bh6_w48_1 & heap_bh6_w48_0 & heap_bh6_w48_18;
   Compressor_bh6_93: Compressor_6_3
      port map ( R => CompressorOut_bh6_93_93   ,
                 X0 => CompressorIn_bh6_93_93);
   heap_bh6_w48_28 <= CompressorOut_bh6_93_93(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w49_24 <= CompressorOut_bh6_93_93(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w50_21 <= CompressorOut_bh6_93_93(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_94_94 <= heap_bh6_w48_17 & heap_bh6_w48_16 & heap_bh6_w48_15 & heap_bh6_w48_14 & heap_bh6_w48_13 & heap_bh6_w48_12;
   Compressor_bh6_94: Compressor_6_3
      port map ( R => CompressorOut_bh6_94_94   ,
                 X0 => CompressorIn_bh6_94_94);
   heap_bh6_w48_29 <= CompressorOut_bh6_94_94(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w49_25 <= CompressorOut_bh6_94_94(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w50_22 <= CompressorOut_bh6_94_94(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_95_95 <= heap_bh6_w49_9 & heap_bh6_w49_8 & heap_bh6_w49_7 & heap_bh6_w49_6 & heap_bh6_w49_5 & heap_bh6_w49_4;
   Compressor_bh6_95: Compressor_6_3
      port map ( R => CompressorOut_bh6_95_95   ,
                 X0 => CompressorIn_bh6_95_95);
   heap_bh6_w49_26 <= CompressorOut_bh6_95_95(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w50_23 <= CompressorOut_bh6_95_95(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w51_22 <= CompressorOut_bh6_95_95(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_96_96 <= heap_bh6_w49_3 & heap_bh6_w49_2 & heap_bh6_w49_1 & heap_bh6_w49_0 & heap_bh6_w49_17 & heap_bh6_w49_16;
   Compressor_bh6_96: Compressor_6_3
      port map ( R => CompressorOut_bh6_96_96   ,
                 X0 => CompressorIn_bh6_96_96);
   heap_bh6_w49_27 <= CompressorOut_bh6_96_96(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w50_24 <= CompressorOut_bh6_96_96(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w51_23 <= CompressorOut_bh6_96_96(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_97_97 <= heap_bh6_w49_15 & heap_bh6_w49_14 & heap_bh6_w49_13 & heap_bh6_w49_12 & heap_bh6_w49_11 & heap_bh6_w49_10;
   Compressor_bh6_97: Compressor_6_3
      port map ( R => CompressorOut_bh6_97_97   ,
                 X0 => CompressorIn_bh6_97_97);
   heap_bh6_w49_28 <= CompressorOut_bh6_97_97(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w50_25 <= CompressorOut_bh6_97_97(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w51_24 <= CompressorOut_bh6_97_97(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_98_98 <= heap_bh6_w50_9 & heap_bh6_w50_8 & heap_bh6_w50_7 & heap_bh6_w50_6 & heap_bh6_w50_5 & heap_bh6_w50_4;
   Compressor_bh6_98: Compressor_6_3
      port map ( R => CompressorOut_bh6_98_98   ,
                 X0 => CompressorIn_bh6_98_98);
   heap_bh6_w50_26 <= CompressorOut_bh6_98_98(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w51_25 <= CompressorOut_bh6_98_98(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w52_21 <= CompressorOut_bh6_98_98(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_99_99 <= heap_bh6_w50_3 & heap_bh6_w50_2 & heap_bh6_w50_1 & heap_bh6_w50_0 & heap_bh6_w50_17 & heap_bh6_w50_16;
   Compressor_bh6_99: Compressor_6_3
      port map ( R => CompressorOut_bh6_99_99   ,
                 X0 => CompressorIn_bh6_99_99);
   heap_bh6_w50_27 <= CompressorOut_bh6_99_99(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w51_26 <= CompressorOut_bh6_99_99(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w52_22 <= CompressorOut_bh6_99_99(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_100_100 <= heap_bh6_w50_15 & heap_bh6_w50_14 & heap_bh6_w50_13 & heap_bh6_w50_12 & heap_bh6_w50_11 & heap_bh6_w50_10;
   Compressor_bh6_100: Compressor_6_3
      port map ( R => CompressorOut_bh6_100_100   ,
                 X0 => CompressorIn_bh6_100_100);
   heap_bh6_w50_28 <= CompressorOut_bh6_100_100(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w51_27 <= CompressorOut_bh6_100_100(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w52_23 <= CompressorOut_bh6_100_100(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_101_101 <= heap_bh6_w51_10 & heap_bh6_w51_9 & heap_bh6_w51_8 & heap_bh6_w51_7 & heap_bh6_w51_6 & heap_bh6_w51_5;
   Compressor_bh6_101: Compressor_6_3
      port map ( R => CompressorOut_bh6_101_101   ,
                 X0 => CompressorIn_bh6_101_101);
   heap_bh6_w51_28 <= CompressorOut_bh6_101_101(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w52_24 <= CompressorOut_bh6_101_101(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w53_21 <= CompressorOut_bh6_101_101(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_102_102 <= heap_bh6_w51_4 & heap_bh6_w51_3 & heap_bh6_w51_2 & heap_bh6_w51_1 & heap_bh6_w51_0 & heap_bh6_w51_18;
   Compressor_bh6_102: Compressor_6_3
      port map ( R => CompressorOut_bh6_102_102   ,
                 X0 => CompressorIn_bh6_102_102);
   heap_bh6_w51_29 <= CompressorOut_bh6_102_102(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w52_25 <= CompressorOut_bh6_102_102(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w53_22 <= CompressorOut_bh6_102_102(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_103_103 <= heap_bh6_w51_17 & heap_bh6_w51_16 & heap_bh6_w51_15 & heap_bh6_w51_14 & heap_bh6_w51_13 & heap_bh6_w51_12;
   Compressor_bh6_103: Compressor_6_3
      port map ( R => CompressorOut_bh6_103_103   ,
                 X0 => CompressorIn_bh6_103_103);
   heap_bh6_w51_30 <= CompressorOut_bh6_103_103(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w52_26 <= CompressorOut_bh6_103_103(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w53_23 <= CompressorOut_bh6_103_103(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_104_104 <= heap_bh6_w52_9 & heap_bh6_w52_8 & heap_bh6_w52_7 & heap_bh6_w52_6 & heap_bh6_w52_5 & heap_bh6_w52_4;
   Compressor_bh6_104: Compressor_6_3
      port map ( R => CompressorOut_bh6_104_104   ,
                 X0 => CompressorIn_bh6_104_104);
   heap_bh6_w52_27 <= CompressorOut_bh6_104_104(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w53_24 <= CompressorOut_bh6_104_104(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w54_22 <= CompressorOut_bh6_104_104(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_105_105 <= heap_bh6_w52_3 & heap_bh6_w52_2 & heap_bh6_w52_1 & heap_bh6_w52_0 & heap_bh6_w52_17 & heap_bh6_w52_16;
   Compressor_bh6_105: Compressor_6_3
      port map ( R => CompressorOut_bh6_105_105   ,
                 X0 => CompressorIn_bh6_105_105);
   heap_bh6_w52_28 <= CompressorOut_bh6_105_105(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w53_25 <= CompressorOut_bh6_105_105(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w54_23 <= CompressorOut_bh6_105_105(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_106_106 <= heap_bh6_w52_15 & heap_bh6_w52_14 & heap_bh6_w52_13 & heap_bh6_w52_12 & heap_bh6_w52_11 & heap_bh6_w52_10;
   Compressor_bh6_106: Compressor_6_3
      port map ( R => CompressorOut_bh6_106_106   ,
                 X0 => CompressorIn_bh6_106_106);
   heap_bh6_w52_29 <= CompressorOut_bh6_106_106(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w53_26 <= CompressorOut_bh6_106_106(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w54_24 <= CompressorOut_bh6_106_106(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_107_107 <= heap_bh6_w53_9 & heap_bh6_w53_8 & heap_bh6_w53_7 & heap_bh6_w53_6 & heap_bh6_w53_5 & heap_bh6_w53_4;
   Compressor_bh6_107: Compressor_6_3
      port map ( R => CompressorOut_bh6_107_107   ,
                 X0 => CompressorIn_bh6_107_107);
   heap_bh6_w53_27 <= CompressorOut_bh6_107_107(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w54_25 <= CompressorOut_bh6_107_107(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w55_21 <= CompressorOut_bh6_107_107(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_108_108 <= heap_bh6_w53_3 & heap_bh6_w53_2 & heap_bh6_w53_1 & heap_bh6_w53_0 & heap_bh6_w53_17 & heap_bh6_w53_16;
   Compressor_bh6_108: Compressor_6_3
      port map ( R => CompressorOut_bh6_108_108   ,
                 X0 => CompressorIn_bh6_108_108);
   heap_bh6_w53_28 <= CompressorOut_bh6_108_108(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w54_26 <= CompressorOut_bh6_108_108(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w55_22 <= CompressorOut_bh6_108_108(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_109_109 <= heap_bh6_w53_15 & heap_bh6_w53_14 & heap_bh6_w53_13 & heap_bh6_w53_12 & heap_bh6_w53_11 & heap_bh6_w53_10;
   Compressor_bh6_109: Compressor_6_3
      port map ( R => CompressorOut_bh6_109_109   ,
                 X0 => CompressorIn_bh6_109_109);
   heap_bh6_w53_29 <= CompressorOut_bh6_109_109(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w54_27 <= CompressorOut_bh6_109_109(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w55_23 <= CompressorOut_bh6_109_109(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_110_110 <= heap_bh6_w54_10 & heap_bh6_w54_9 & heap_bh6_w54_8 & heap_bh6_w54_7 & heap_bh6_w54_6 & heap_bh6_w54_5;
   Compressor_bh6_110: Compressor_6_3
      port map ( R => CompressorOut_bh6_110_110   ,
                 X0 => CompressorIn_bh6_110_110);
   heap_bh6_w54_28 <= CompressorOut_bh6_110_110(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w55_24 <= CompressorOut_bh6_110_110(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w56_21 <= CompressorOut_bh6_110_110(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_111_111 <= heap_bh6_w54_4 & heap_bh6_w54_3 & heap_bh6_w54_2 & heap_bh6_w54_1 & heap_bh6_w54_0 & heap_bh6_w54_18;
   Compressor_bh6_111: Compressor_6_3
      port map ( R => CompressorOut_bh6_111_111   ,
                 X0 => CompressorIn_bh6_111_111);
   heap_bh6_w54_29 <= CompressorOut_bh6_111_111(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w55_25 <= CompressorOut_bh6_111_111(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w56_22 <= CompressorOut_bh6_111_111(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_112_112 <= heap_bh6_w54_17 & heap_bh6_w54_16 & heap_bh6_w54_15 & heap_bh6_w54_14 & heap_bh6_w54_13 & heap_bh6_w54_12;
   Compressor_bh6_112: Compressor_6_3
      port map ( R => CompressorOut_bh6_112_112   ,
                 X0 => CompressorIn_bh6_112_112);
   heap_bh6_w54_30 <= CompressorOut_bh6_112_112(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w55_26 <= CompressorOut_bh6_112_112(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w56_23 <= CompressorOut_bh6_112_112(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_113_113 <= heap_bh6_w55_9 & heap_bh6_w55_8 & heap_bh6_w55_7 & heap_bh6_w55_6 & heap_bh6_w55_5 & heap_bh6_w55_4;
   Compressor_bh6_113: Compressor_6_3
      port map ( R => CompressorOut_bh6_113_113   ,
                 X0 => CompressorIn_bh6_113_113);
   heap_bh6_w55_27 <= CompressorOut_bh6_113_113(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w56_24 <= CompressorOut_bh6_113_113(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w57_22 <= CompressorOut_bh6_113_113(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_114_114 <= heap_bh6_w55_3 & heap_bh6_w55_2 & heap_bh6_w55_1 & heap_bh6_w55_0 & heap_bh6_w55_17 & heap_bh6_w55_16;
   Compressor_bh6_114: Compressor_6_3
      port map ( R => CompressorOut_bh6_114_114   ,
                 X0 => CompressorIn_bh6_114_114);
   heap_bh6_w55_28 <= CompressorOut_bh6_114_114(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w56_25 <= CompressorOut_bh6_114_114(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w57_23 <= CompressorOut_bh6_114_114(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_115_115 <= heap_bh6_w55_15 & heap_bh6_w55_14 & heap_bh6_w55_13 & heap_bh6_w55_12 & heap_bh6_w55_11 & heap_bh6_w55_10;
   Compressor_bh6_115: Compressor_6_3
      port map ( R => CompressorOut_bh6_115_115   ,
                 X0 => CompressorIn_bh6_115_115);
   heap_bh6_w55_29 <= CompressorOut_bh6_115_115(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w56_26 <= CompressorOut_bh6_115_115(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w57_24 <= CompressorOut_bh6_115_115(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_116_116 <= heap_bh6_w56_9 & heap_bh6_w56_8 & heap_bh6_w56_7 & heap_bh6_w56_6 & heap_bh6_w56_5 & heap_bh6_w56_4;
   Compressor_bh6_116: Compressor_6_3
      port map ( R => CompressorOut_bh6_116_116   ,
                 X0 => CompressorIn_bh6_116_116);
   heap_bh6_w56_27 <= CompressorOut_bh6_116_116(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w57_25 <= CompressorOut_bh6_116_116(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w58_21 <= CompressorOut_bh6_116_116(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_117_117 <= heap_bh6_w56_3 & heap_bh6_w56_2 & heap_bh6_w56_1 & heap_bh6_w56_0 & heap_bh6_w56_17 & heap_bh6_w56_16;
   Compressor_bh6_117: Compressor_6_3
      port map ( R => CompressorOut_bh6_117_117   ,
                 X0 => CompressorIn_bh6_117_117);
   heap_bh6_w56_28 <= CompressorOut_bh6_117_117(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w57_26 <= CompressorOut_bh6_117_117(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w58_22 <= CompressorOut_bh6_117_117(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_118_118 <= heap_bh6_w56_15 & heap_bh6_w56_14 & heap_bh6_w56_13 & heap_bh6_w56_12 & heap_bh6_w56_11 & heap_bh6_w56_10;
   Compressor_bh6_118: Compressor_6_3
      port map ( R => CompressorOut_bh6_118_118   ,
                 X0 => CompressorIn_bh6_118_118);
   heap_bh6_w56_29 <= CompressorOut_bh6_118_118(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w57_27 <= CompressorOut_bh6_118_118(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w58_23 <= CompressorOut_bh6_118_118(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_119_119 <= heap_bh6_w57_10 & heap_bh6_w57_9 & heap_bh6_w57_8 & heap_bh6_w57_7 & heap_bh6_w57_6 & heap_bh6_w57_5;
   Compressor_bh6_119: Compressor_6_3
      port map ( R => CompressorOut_bh6_119_119   ,
                 X0 => CompressorIn_bh6_119_119);
   heap_bh6_w57_28 <= CompressorOut_bh6_119_119(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w58_24 <= CompressorOut_bh6_119_119(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w59_21 <= CompressorOut_bh6_119_119(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_120_120 <= heap_bh6_w57_4 & heap_bh6_w57_3 & heap_bh6_w57_2 & heap_bh6_w57_1 & heap_bh6_w57_0 & heap_bh6_w57_18;
   Compressor_bh6_120: Compressor_6_3
      port map ( R => CompressorOut_bh6_120_120   ,
                 X0 => CompressorIn_bh6_120_120);
   heap_bh6_w57_29 <= CompressorOut_bh6_120_120(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w58_25 <= CompressorOut_bh6_120_120(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w59_22 <= CompressorOut_bh6_120_120(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_121_121 <= heap_bh6_w57_17 & heap_bh6_w57_16 & heap_bh6_w57_15 & heap_bh6_w57_14 & heap_bh6_w57_13 & heap_bh6_w57_12;
   Compressor_bh6_121: Compressor_6_3
      port map ( R => CompressorOut_bh6_121_121   ,
                 X0 => CompressorIn_bh6_121_121);
   heap_bh6_w57_30 <= CompressorOut_bh6_121_121(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w58_26 <= CompressorOut_bh6_121_121(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w59_23 <= CompressorOut_bh6_121_121(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_122_122 <= heap_bh6_w58_9 & heap_bh6_w58_8 & heap_bh6_w58_7 & heap_bh6_w58_6 & heap_bh6_w58_5 & heap_bh6_w58_4;
   Compressor_bh6_122: Compressor_6_3
      port map ( R => CompressorOut_bh6_122_122   ,
                 X0 => CompressorIn_bh6_122_122);
   heap_bh6_w58_27 <= CompressorOut_bh6_122_122(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w59_24 <= CompressorOut_bh6_122_122(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w60_22 <= CompressorOut_bh6_122_122(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_123_123 <= heap_bh6_w58_3 & heap_bh6_w58_2 & heap_bh6_w58_1 & heap_bh6_w58_0 & heap_bh6_w58_17 & heap_bh6_w58_16;
   Compressor_bh6_123: Compressor_6_3
      port map ( R => CompressorOut_bh6_123_123   ,
                 X0 => CompressorIn_bh6_123_123);
   heap_bh6_w58_28 <= CompressorOut_bh6_123_123(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w59_25 <= CompressorOut_bh6_123_123(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w60_23 <= CompressorOut_bh6_123_123(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_124_124 <= heap_bh6_w58_15 & heap_bh6_w58_14 & heap_bh6_w58_13 & heap_bh6_w58_12 & heap_bh6_w58_11 & heap_bh6_w58_10;
   Compressor_bh6_124: Compressor_6_3
      port map ( R => CompressorOut_bh6_124_124   ,
                 X0 => CompressorIn_bh6_124_124);
   heap_bh6_w58_29 <= CompressorOut_bh6_124_124(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w59_26 <= CompressorOut_bh6_124_124(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w60_24 <= CompressorOut_bh6_124_124(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_125_125 <= heap_bh6_w59_9 & heap_bh6_w59_8 & heap_bh6_w59_7 & heap_bh6_w59_6 & heap_bh6_w59_5 & heap_bh6_w59_4;
   Compressor_bh6_125: Compressor_6_3
      port map ( R => CompressorOut_bh6_125_125   ,
                 X0 => CompressorIn_bh6_125_125);
   heap_bh6_w59_27 <= CompressorOut_bh6_125_125(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w60_25 <= CompressorOut_bh6_125_125(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w61_22 <= CompressorOut_bh6_125_125(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_126_126 <= heap_bh6_w59_3 & heap_bh6_w59_2 & heap_bh6_w59_1 & heap_bh6_w59_0 & heap_bh6_w59_17 & heap_bh6_w59_16;
   Compressor_bh6_126: Compressor_6_3
      port map ( R => CompressorOut_bh6_126_126   ,
                 X0 => CompressorIn_bh6_126_126);
   heap_bh6_w59_28 <= CompressorOut_bh6_126_126(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w60_26 <= CompressorOut_bh6_126_126(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w61_23 <= CompressorOut_bh6_126_126(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_127_127 <= heap_bh6_w59_15 & heap_bh6_w59_14 & heap_bh6_w59_13 & heap_bh6_w59_12 & heap_bh6_w59_11 & heap_bh6_w59_10;
   Compressor_bh6_127: Compressor_6_3
      port map ( R => CompressorOut_bh6_127_127   ,
                 X0 => CompressorIn_bh6_127_127);
   heap_bh6_w59_29 <= CompressorOut_bh6_127_127(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w60_27 <= CompressorOut_bh6_127_127(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w61_24 <= CompressorOut_bh6_127_127(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_128_128 <= heap_bh6_w60_10 & heap_bh6_w60_9 & heap_bh6_w60_8 & heap_bh6_w60_7 & heap_bh6_w60_6 & heap_bh6_w60_5;
   Compressor_bh6_128: Compressor_6_3
      port map ( R => CompressorOut_bh6_128_128   ,
                 X0 => CompressorIn_bh6_128_128);
   heap_bh6_w60_28 <= CompressorOut_bh6_128_128(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w61_25 <= CompressorOut_bh6_128_128(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w62_22 <= CompressorOut_bh6_128_128(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_129_129 <= heap_bh6_w60_4 & heap_bh6_w60_3 & heap_bh6_w60_2 & heap_bh6_w60_1 & heap_bh6_w60_0 & heap_bh6_w60_18;
   Compressor_bh6_129: Compressor_6_3
      port map ( R => CompressorOut_bh6_129_129   ,
                 X0 => CompressorIn_bh6_129_129);
   heap_bh6_w60_29 <= CompressorOut_bh6_129_129(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w61_26 <= CompressorOut_bh6_129_129(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w62_23 <= CompressorOut_bh6_129_129(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_130_130 <= heap_bh6_w60_17 & heap_bh6_w60_16 & heap_bh6_w60_15 & heap_bh6_w60_14 & heap_bh6_w60_13 & heap_bh6_w60_12;
   Compressor_bh6_130: Compressor_6_3
      port map ( R => CompressorOut_bh6_130_130   ,
                 X0 => CompressorIn_bh6_130_130);
   heap_bh6_w60_30 <= CompressorOut_bh6_130_130(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w61_27 <= CompressorOut_bh6_130_130(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w62_24 <= CompressorOut_bh6_130_130(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_131_131 <= heap_bh6_w61_9 & heap_bh6_w61_8 & heap_bh6_w61_7 & heap_bh6_w61_6 & heap_bh6_w61_5 & heap_bh6_w61_4;
   Compressor_bh6_131: Compressor_6_3
      port map ( R => CompressorOut_bh6_131_131   ,
                 X0 => CompressorIn_bh6_131_131);
   heap_bh6_w61_28 <= CompressorOut_bh6_131_131(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w62_25 <= CompressorOut_bh6_131_131(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w63_20 <= CompressorOut_bh6_131_131(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_132_132 <= heap_bh6_w61_3 & heap_bh6_w61_2 & heap_bh6_w61_1 & heap_bh6_w61_0 & heap_bh6_w61_17 & heap_bh6_w61_16;
   Compressor_bh6_132: Compressor_6_3
      port map ( R => CompressorOut_bh6_132_132   ,
                 X0 => CompressorIn_bh6_132_132);
   heap_bh6_w61_29 <= CompressorOut_bh6_132_132(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w62_26 <= CompressorOut_bh6_132_132(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w63_21 <= CompressorOut_bh6_132_132(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_133_133 <= heap_bh6_w61_15 & heap_bh6_w61_14 & heap_bh6_w61_13 & heap_bh6_w61_12 & heap_bh6_w61_11 & heap_bh6_w61_10;
   Compressor_bh6_133: Compressor_6_3
      port map ( R => CompressorOut_bh6_133_133   ,
                 X0 => CompressorIn_bh6_133_133);
   heap_bh6_w61_30 <= CompressorOut_bh6_133_133(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w62_27 <= CompressorOut_bh6_133_133(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w63_22 <= CompressorOut_bh6_133_133(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_134_134 <= heap_bh6_w62_9 & heap_bh6_w62_8 & heap_bh6_w62_7 & heap_bh6_w62_6 & heap_bh6_w62_5 & heap_bh6_w62_4;
   Compressor_bh6_134: Compressor_6_3
      port map ( R => CompressorOut_bh6_134_134   ,
                 X0 => CompressorIn_bh6_134_134);
   heap_bh6_w62_28 <= CompressorOut_bh6_134_134(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w63_23 <= CompressorOut_bh6_134_134(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w64_20 <= CompressorOut_bh6_134_134(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_135_135 <= heap_bh6_w62_3 & heap_bh6_w62_2 & heap_bh6_w62_1 & heap_bh6_w62_0 & heap_bh6_w62_17 & heap_bh6_w62_16;
   Compressor_bh6_135: Compressor_6_3
      port map ( R => CompressorOut_bh6_135_135   ,
                 X0 => CompressorIn_bh6_135_135);
   heap_bh6_w62_29 <= CompressorOut_bh6_135_135(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w63_24 <= CompressorOut_bh6_135_135(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w64_21 <= CompressorOut_bh6_135_135(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_136_136 <= heap_bh6_w62_15 & heap_bh6_w62_14 & heap_bh6_w62_13 & heap_bh6_w62_12 & heap_bh6_w62_11 & heap_bh6_w62_10;
   Compressor_bh6_136: Compressor_6_3
      port map ( R => CompressorOut_bh6_136_136   ,
                 X0 => CompressorIn_bh6_136_136);
   heap_bh6_w62_30 <= CompressorOut_bh6_136_136(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w63_25 <= CompressorOut_bh6_136_136(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w64_22 <= CompressorOut_bh6_136_136(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_137_137 <= heap_bh6_w63_8 & heap_bh6_w63_7 & heap_bh6_w63_6 & heap_bh6_w63_5 & heap_bh6_w63_4 & heap_bh6_w63_3;
   Compressor_bh6_137: Compressor_6_3
      port map ( R => CompressorOut_bh6_137_137   ,
                 X0 => CompressorIn_bh6_137_137);
   heap_bh6_w63_26 <= CompressorOut_bh6_137_137(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w64_23 <= CompressorOut_bh6_137_137(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w65_20 <= CompressorOut_bh6_137_137(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_138_138 <= heap_bh6_w63_2 & heap_bh6_w63_1 & heap_bh6_w63_0 & heap_bh6_w63_15 & heap_bh6_w63_14 & heap_bh6_w63_13;
   Compressor_bh6_138: Compressor_6_3
      port map ( R => CompressorOut_bh6_138_138   ,
                 X0 => CompressorIn_bh6_138_138);
   heap_bh6_w63_27 <= CompressorOut_bh6_138_138(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w64_24 <= CompressorOut_bh6_138_138(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w65_21 <= CompressorOut_bh6_138_138(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_139_139 <= heap_bh6_w64_8 & heap_bh6_w64_7 & heap_bh6_w64_6 & heap_bh6_w64_5 & heap_bh6_w64_4 & heap_bh6_w64_3;
   Compressor_bh6_139: Compressor_6_3
      port map ( R => CompressorOut_bh6_139_139   ,
                 X0 => CompressorIn_bh6_139_139);
   heap_bh6_w64_25 <= CompressorOut_bh6_139_139(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w65_22 <= CompressorOut_bh6_139_139(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w66_16 <= CompressorOut_bh6_139_139(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_140_140 <= heap_bh6_w64_2 & heap_bh6_w64_1 & heap_bh6_w64_0 & heap_bh6_w64_15 & heap_bh6_w64_14 & heap_bh6_w64_13;
   Compressor_bh6_140: Compressor_6_3
      port map ( R => CompressorOut_bh6_140_140   ,
                 X0 => CompressorIn_bh6_140_140);
   heap_bh6_w64_26 <= CompressorOut_bh6_140_140(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w65_23 <= CompressorOut_bh6_140_140(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w66_17 <= CompressorOut_bh6_140_140(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_141_141 <= heap_bh6_w65_8 & heap_bh6_w65_7 & heap_bh6_w65_6 & heap_bh6_w65_5 & heap_bh6_w65_4 & heap_bh6_w65_3;
   Compressor_bh6_141: Compressor_6_3
      port map ( R => CompressorOut_bh6_141_141   ,
                 X0 => CompressorIn_bh6_141_141);
   heap_bh6_w65_24 <= CompressorOut_bh6_141_141(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w66_18 <= CompressorOut_bh6_141_141(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w67_16 <= CompressorOut_bh6_141_141(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_142_142 <= heap_bh6_w65_2 & heap_bh6_w65_1 & heap_bh6_w65_0 & heap_bh6_w65_15 & heap_bh6_w65_14 & heap_bh6_w65_13;
   Compressor_bh6_142: Compressor_6_3
      port map ( R => CompressorOut_bh6_142_142   ,
                 X0 => CompressorIn_bh6_142_142);
   heap_bh6_w65_25 <= CompressorOut_bh6_142_142(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w66_19 <= CompressorOut_bh6_142_142(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w67_17 <= CompressorOut_bh6_142_142(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_143_143 <= heap_bh6_w66_6 & heap_bh6_w66_5 & heap_bh6_w66_4 & heap_bh6_w66_3 & heap_bh6_w66_2 & heap_bh6_w66_1;
   Compressor_bh6_143: Compressor_6_3
      port map ( R => CompressorOut_bh6_143_143   ,
                 X0 => CompressorIn_bh6_143_143);
   heap_bh6_w66_20 <= CompressorOut_bh6_143_143(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w67_18 <= CompressorOut_bh6_143_143(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w68_16 <= CompressorOut_bh6_143_143(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_144_144 <= heap_bh6_w66_0 & heap_bh6_w66_11 & heap_bh6_w66_10 & heap_bh6_w66_9 & heap_bh6_w66_8 & heap_bh6_w66_7;
   Compressor_bh6_144: Compressor_6_3
      port map ( R => CompressorOut_bh6_144_144   ,
                 X0 => CompressorIn_bh6_144_144);
   heap_bh6_w66_21 <= CompressorOut_bh6_144_144(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w67_19 <= CompressorOut_bh6_144_144(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w68_17 <= CompressorOut_bh6_144_144(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_145_145 <= heap_bh6_w67_6 & heap_bh6_w67_5 & heap_bh6_w67_4 & heap_bh6_w67_3 & heap_bh6_w67_2 & heap_bh6_w67_1;
   Compressor_bh6_145: Compressor_6_3
      port map ( R => CompressorOut_bh6_145_145   ,
                 X0 => CompressorIn_bh6_145_145);
   heap_bh6_w67_20 <= CompressorOut_bh6_145_145(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w68_18 <= CompressorOut_bh6_145_145(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w69_12 <= CompressorOut_bh6_145_145(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_146_146 <= heap_bh6_w67_0 & heap_bh6_w67_11 & heap_bh6_w67_10 & heap_bh6_w67_9 & heap_bh6_w67_8 & heap_bh6_w67_7;
   Compressor_bh6_146: Compressor_6_3
      port map ( R => CompressorOut_bh6_146_146   ,
                 X0 => CompressorIn_bh6_146_146);
   heap_bh6_w67_21 <= CompressorOut_bh6_146_146(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w68_19 <= CompressorOut_bh6_146_146(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w69_13 <= CompressorOut_bh6_146_146(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_147_147 <= heap_bh6_w68_6 & heap_bh6_w68_5 & heap_bh6_w68_4 & heap_bh6_w68_3 & heap_bh6_w68_2 & heap_bh6_w68_1;
   Compressor_bh6_147: Compressor_6_3
      port map ( R => CompressorOut_bh6_147_147   ,
                 X0 => CompressorIn_bh6_147_147);
   heap_bh6_w68_20 <= CompressorOut_bh6_147_147(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w69_14 <= CompressorOut_bh6_147_147(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w70_12 <= CompressorOut_bh6_147_147(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_148_148 <= heap_bh6_w68_0 & heap_bh6_w68_11 & heap_bh6_w68_10 & heap_bh6_w68_9 & heap_bh6_w68_8 & heap_bh6_w68_7;
   Compressor_bh6_148: Compressor_6_3
      port map ( R => CompressorOut_bh6_148_148   ,
                 X0 => CompressorIn_bh6_148_148);
   heap_bh6_w68_21 <= CompressorOut_bh6_148_148(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w69_15 <= CompressorOut_bh6_148_148(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w70_13 <= CompressorOut_bh6_148_148(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_149_149 <= heap_bh6_w69_4 & heap_bh6_w69_3 & heap_bh6_w69_2 & heap_bh6_w69_1 & heap_bh6_w69_0 & heap_bh6_w69_7;
   Compressor_bh6_149: Compressor_6_3
      port map ( R => CompressorOut_bh6_149_149   ,
                 X0 => CompressorIn_bh6_149_149);
   heap_bh6_w69_16 <= CompressorOut_bh6_149_149(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w70_14 <= CompressorOut_bh6_149_149(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w71_12 <= CompressorOut_bh6_149_149(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_150_150 <= heap_bh6_w70_4 & heap_bh6_w70_3 & heap_bh6_w70_2 & heap_bh6_w70_1 & heap_bh6_w70_0 & heap_bh6_w70_7;
   Compressor_bh6_150: Compressor_6_3
      port map ( R => CompressorOut_bh6_150_150   ,
                 X0 => CompressorIn_bh6_150_150);
   heap_bh6_w70_15 <= CompressorOut_bh6_150_150(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w71_13 <= CompressorOut_bh6_150_150(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w72_8 <= CompressorOut_bh6_150_150(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_151_151 <= heap_bh6_w71_4 & heap_bh6_w71_3 & heap_bh6_w71_2 & heap_bh6_w71_1 & heap_bh6_w71_0 & heap_bh6_w71_7;
   Compressor_bh6_151: Compressor_6_3
      port map ( R => CompressorOut_bh6_151_151   ,
                 X0 => CompressorIn_bh6_151_151);
   heap_bh6_w71_14 <= CompressorOut_bh6_151_151(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w72_9 <= CompressorOut_bh6_151_151(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w73_8 <= CompressorOut_bh6_151_151(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_152_152 <= heap_bh6_w6_4 & heap_bh6_w6_3 & heap_bh6_w6_2 & heap_bh6_w6_1;
   CompressorIn_bh6_152_153(0) <= heap_bh6_w7_4;
   Compressor_bh6_152: Compressor_14_3
      port map ( R => CompressorOut_bh6_152_152   ,
                 X0 => CompressorIn_bh6_152_152,
                 X1 => CompressorIn_bh6_152_153);
   heap_bh6_w6_5 <= CompressorOut_bh6_152_152(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w7_5 <= CompressorOut_bh6_152_152(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w8_5 <= CompressorOut_bh6_152_152(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_153_154 <= heap_bh6_w7_3 & heap_bh6_w7_2 & heap_bh6_w7_1 & heap_bh6_w7_0;
   CompressorIn_bh6_153_155(0) <= heap_bh6_w8_4;
   Compressor_bh6_153: Compressor_14_3
      port map ( R => CompressorOut_bh6_153_153   ,
                 X0 => CompressorIn_bh6_153_154,
                 X1 => CompressorIn_bh6_153_155);
   heap_bh6_w7_6 <= CompressorOut_bh6_153_153(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w8_6 <= CompressorOut_bh6_153_153(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w9_8 <= CompressorOut_bh6_153_153(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_154_156 <= heap_bh6_w8_3 & heap_bh6_w8_2 & heap_bh6_w8_1 & heap_bh6_w8_0;
   CompressorIn_bh6_154_157(0) <= heap_bh6_w9_0;
   Compressor_bh6_154: Compressor_14_3
      port map ( R => CompressorOut_bh6_154_154   ,
                 X0 => CompressorIn_bh6_154_156,
                 X1 => CompressorIn_bh6_154_157);
   heap_bh6_w8_7 <= CompressorOut_bh6_154_154(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w9_9 <= CompressorOut_bh6_154_154(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w10_9 <= CompressorOut_bh6_154_154(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_155_158 <= heap_bh6_w14_3 & heap_bh6_w14_2 & heap_bh6_w14_1 & heap_bh6_w14_0;
   CompressorIn_bh6_155_159(0) <= heap_bh6_w15_4;
   Compressor_bh6_155: Compressor_14_3
      port map ( R => CompressorOut_bh6_155_155   ,
                 X0 => CompressorIn_bh6_155_158,
                 X1 => CompressorIn_bh6_155_159);
   heap_bh6_w14_13 <= CompressorOut_bh6_155_155(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w15_14 <= CompressorOut_bh6_155_155(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w16_14 <= CompressorOut_bh6_155_155(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_156_160 <= heap_bh6_w15_2 & heap_bh6_w15_1 & heap_bh6_w15_0 & heap_bh6_w15_3;
   CompressorIn_bh6_156_161(0) <= heap_bh6_w16_4;
   Compressor_bh6_156: Compressor_14_3
      port map ( R => CompressorOut_bh6_156_156   ,
                 X0 => CompressorIn_bh6_156_160,
                 X1 => CompressorIn_bh6_156_161);
   heap_bh6_w15_15 <= CompressorOut_bh6_156_156(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w16_15 <= CompressorOut_bh6_156_156(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w17_16 <= CompressorOut_bh6_156_156(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_157_162 <= heap_bh6_w23_11 & heap_bh6_w23_10 & heap_bh6_w23_9 & heap_bh6_w23_8;
   CompressorIn_bh6_157_163(0) <= heap_bh6_w24_13;
   Compressor_bh6_157: Compressor_14_3
      port map ( R => CompressorOut_bh6_157_157   ,
                 X0 => CompressorIn_bh6_157_162,
                 X1 => CompressorIn_bh6_157_163);
   heap_bh6_w23_22 <= CompressorOut_bh6_157_157(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w24_23 <= CompressorOut_bh6_157_157(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w25_23 <= CompressorOut_bh6_157_157(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_158_164 <= heap_bh6_w24_12 & heap_bh6_w24_11 & heap_bh6_w24_10 & heap_bh6_w24_9;
   CompressorIn_bh6_158_165(0) <= heap_bh6_w25_13;
   Compressor_bh6_158: Compressor_14_3
      port map ( R => CompressorOut_bh6_158_158   ,
                 X0 => CompressorIn_bh6_158_164,
                 X1 => CompressorIn_bh6_158_165);
   heap_bh6_w24_24 <= CompressorOut_bh6_158_158(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w25_24 <= CompressorOut_bh6_158_158(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w26_25 <= CompressorOut_bh6_158_158(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_159_166 <= heap_bh6_w63_12 & heap_bh6_w63_11 & heap_bh6_w63_10 & heap_bh6_w63_9;
   CompressorIn_bh6_159_167(0) <= heap_bh6_w64_12;
   Compressor_bh6_159: Compressor_14_3
      port map ( R => CompressorOut_bh6_159_159   ,
                 X0 => CompressorIn_bh6_159_166,
                 X1 => CompressorIn_bh6_159_167);
   heap_bh6_w63_28 <= CompressorOut_bh6_159_159(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w64_27 <= CompressorOut_bh6_159_159(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w65_26 <= CompressorOut_bh6_159_159(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_160_168 <= heap_bh6_w72_2 & heap_bh6_w72_1 & heap_bh6_w72_0 & heap_bh6_w72_3;
   CompressorIn_bh6_160_169(0) <= heap_bh6_w73_2;
   Compressor_bh6_160: Compressor_14_3
      port map ( R => CompressorOut_bh6_160_160   ,
                 X0 => CompressorIn_bh6_160_168,
                 X1 => CompressorIn_bh6_160_169);
   heap_bh6_w72_10 <= CompressorOut_bh6_160_160(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w73_9 <= CompressorOut_bh6_160_160(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w74_8 <= CompressorOut_bh6_160_160(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_161_170 <= heap_bh6_w74_2 & heap_bh6_w74_1 & heap_bh6_w74_0 & heap_bh6_w74_3;
   CompressorIn_bh6_161_171(0) <= heap_bh6_w75_0;
   Compressor_bh6_161: Compressor_14_3
      port map ( R => CompressorOut_bh6_161_161   ,
                 X0 => CompressorIn_bh6_161_170,
                 X1 => CompressorIn_bh6_161_171);
   heap_bh6_w74_9 <= CompressorOut_bh6_161_161(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w75_5 <= CompressorOut_bh6_161_161(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w76_5 <= CompressorOut_bh6_161_161(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_162_172 <= heap_bh6_w16_2 & heap_bh6_w16_1 & heap_bh6_w16_0 & heap_bh6_w16_3;
   Compressor_bh6_162: Compressor_4_3
      port map ( R => CompressorOut_bh6_162_162   ,
                 X0 => CompressorIn_bh6_162_172);
   heap_bh6_w16_16 <= CompressorOut_bh6_162_162(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w17_17 <= CompressorOut_bh6_162_162(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w18_18 <= CompressorOut_bh6_162_162(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_163_173 <= heap_bh6_w25_12 & heap_bh6_w25_11 & heap_bh6_w25_10 & heap_bh6_w25_9;
   Compressor_bh6_163: Compressor_4_3
      port map ( R => CompressorOut_bh6_163_163   ,
                 X0 => CompressorIn_bh6_163_173);
   heap_bh6_w25_25 <= CompressorOut_bh6_163_163(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w26_26 <= CompressorOut_bh6_163_163(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w27_27 <= CompressorOut_bh6_163_163(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_164_174 <= heap_bh6_w65_12 & heap_bh6_w65_11 & heap_bh6_w65_10 & heap_bh6_w65_9;
   Compressor_bh6_164: Compressor_4_3
      port map ( R => CompressorOut_bh6_164_164   ,
                 X0 => CompressorIn_bh6_164_174);
   heap_bh6_w65_27 <= CompressorOut_bh6_164_164(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w66_22 <= CompressorOut_bh6_164_164(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w67_22 <= CompressorOut_bh6_164_164(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_165_175 <= heap_bh6_w3_2 & heap_bh6_w3_1 & heap_bh6_w3_0;
   CompressorIn_bh6_165_176 <= heap_bh6_w4_2 & heap_bh6_w4_1;
   Compressor_bh6_165: Compressor_23_3
      port map ( R => CompressorOut_bh6_165_165   ,
                 X0 => CompressorIn_bh6_165_175,
                 X1 => CompressorIn_bh6_165_176);
   heap_bh6_w3_3 <= CompressorOut_bh6_165_165(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w4_3 <= CompressorOut_bh6_165_165(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w5_3 <= CompressorOut_bh6_165_165(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_166_177 <= heap_bh6_w12_2 & heap_bh6_w12_1 & heap_bh6_w12_0;
   CompressorIn_bh6_166_178 <= heap_bh6_w13_2 & heap_bh6_w13_1;
   Compressor_bh6_166: Compressor_23_3
      port map ( R => CompressorOut_bh6_166_166   ,
                 X0 => CompressorIn_bh6_166_177,
                 X1 => CompressorIn_bh6_166_178);
   heap_bh6_w12_12 <= CompressorOut_bh6_166_166(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w13_12 <= CompressorOut_bh6_166_166(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w14_14 <= CompressorOut_bh6_166_166(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_167_179 <= heap_bh6_w21_9 & heap_bh6_w21_8 & heap_bh6_w21_7;
   CompressorIn_bh6_167_180 <= heap_bh6_w22_9 & heap_bh6_w22_8;
   Compressor_bh6_167: Compressor_23_3
      port map ( R => CompressorOut_bh6_167_167   ,
                 X0 => CompressorIn_bh6_167_179,
                 X1 => CompressorIn_bh6_167_180);
   heap_bh6_w21_21 <= CompressorOut_bh6_167_167(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w22_21 <= CompressorOut_bh6_167_167(1); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w23_23 <= CompressorOut_bh6_167_167(2); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_168_181 <= heap_bh6_w5_2 & heap_bh6_w5_1 & heap_bh6_w5_0;
   CompressorIn_bh6_168_182(0) <= heap_bh6_w6_0;
   Compressor_bh6_168: Compressor_13_3
      port map ( R => CompressorOut_bh6_168_168   ,
                 X0 => CompressorIn_bh6_168_181,
                 X1 => CompressorIn_bh6_168_182);
   heap_bh6_w5_4 <= CompressorOut_bh6_168_168(0); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w6_6 <= CompressorOut_bh6_168_168(1); -- cycle= 0 cp= 1.09632e-09
   heap_bh6_w7_7 <= CompressorOut_bh6_168_168(2); -- cycle= 0 cp= 1.09632e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_169_183 <= heap_bh6_w64_11 & heap_bh6_w64_10 & heap_bh6_w64_9;
   Compressor_bh6_169: Compressor_3_2
      port map ( R => CompressorOut_bh6_169_169   ,
                 X0 => CompressorIn_bh6_169_183);
   heap_bh6_w64_28 <= CompressorOut_bh6_169_169(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w65_28 <= CompressorOut_bh6_169_169(1); -- cycle= 0 cp= 1.12248e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_170_184 <= heap_bh6_w73_1 & heap_bh6_w73_0 & heap_bh6_w73_3;
   Compressor_bh6_170: Compressor_3_2
      port map ( R => CompressorOut_bh6_170_170   ,
                 X0 => CompressorIn_bh6_170_184);
   heap_bh6_w73_10 <= CompressorOut_bh6_170_170(0); -- cycle= 0 cp= 1.12248e-09
   heap_bh6_w74_10 <= CompressorOut_bh6_170_170(1); -- cycle= 0 cp= 1.12248e-09
   ----------------Synchro barrier, entering cycle 0----------------
   tempR_bh6_1 <= heap_bh6_w3_3; -- already compressed

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_171_185 <= heap_bh6_w16_14 & heap_bh6_w16_13 & heap_bh6_w16_12 & heap_bh6_w16_11 & heap_bh6_w16_16 & heap_bh6_w16_15;
   Compressor_bh6_171: Compressor_6_3
      port map ( R => CompressorOut_bh6_171_171   ,
                 X0 => CompressorIn_bh6_171_185);
   heap_bh6_w16_17 <= CompressorOut_bh6_171_171(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w17_18 <= CompressorOut_bh6_171_171(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w18_19 <= CompressorOut_bh6_171_171(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_172_186 <= heap_bh6_w17_14 & heap_bh6_w17_13 & heap_bh6_w17_12 & heap_bh6_w17_17 & heap_bh6_w17_16 & heap_bh6_w17_15;
   Compressor_bh6_172: Compressor_6_3
      port map ( R => CompressorOut_bh6_172_172   ,
                 X0 => CompressorIn_bh6_172_186);
   heap_bh6_w17_19 <= CompressorOut_bh6_172_172(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w18_20 <= CompressorOut_bh6_172_172(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w19_19 <= CompressorOut_bh6_172_172(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_173_187 <= heap_bh6_w18_5 & heap_bh6_w18_16 & heap_bh6_w18_14 & heap_bh6_w18_13 & heap_bh6_w18_18 & heap_bh6_w18_17;
   Compressor_bh6_173: Compressor_6_3
      port map ( R => CompressorOut_bh6_173_173   ,
                 X0 => CompressorIn_bh6_173_187);
   heap_bh6_w18_21 <= CompressorOut_bh6_173_173(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w19_20 <= CompressorOut_bh6_173_173(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w20_20 <= CompressorOut_bh6_173_173(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_174_188 <= heap_bh6_w19_5 & heap_bh6_w19_17 & heap_bh6_w19_15 & heap_bh6_w19_13 & heap_bh6_w19_18 & heap_bh6_w19_16;
   Compressor_bh6_174: Compressor_6_3
      port map ( R => CompressorOut_bh6_174_174   ,
                 X0 => CompressorIn_bh6_174_188);
   heap_bh6_w19_21 <= CompressorOut_bh6_174_174(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w20_21 <= CompressorOut_bh6_174_174(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w21_22 <= CompressorOut_bh6_174_174(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_175_189 <= heap_bh6_w20_7 & heap_bh6_w20_6 & heap_bh6_w20_18 & heap_bh6_w20_16 & heap_bh6_w20_14 & heap_bh6_w20_19;
   Compressor_bh6_175: Compressor_6_3
      port map ( R => CompressorOut_bh6_175_175   ,
                 X0 => CompressorIn_bh6_175_189);
   heap_bh6_w20_22 <= CompressorOut_bh6_175_175(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w21_23 <= CompressorOut_bh6_175_175(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w22_22 <= CompressorOut_bh6_175_175(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_176_190 <= heap_bh6_w21_19 & heap_bh6_w21_17 & heap_bh6_w21_15 & heap_bh6_w21_21 & heap_bh6_w21_20 & heap_bh6_w21_18;
   Compressor_bh6_176: Compressor_6_3
      port map ( R => CompressorOut_bh6_176_176   ,
                 X0 => CompressorIn_bh6_176_190);
   heap_bh6_w21_24 <= CompressorOut_bh6_176_176(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w22_23 <= CompressorOut_bh6_176_176(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w23_24 <= CompressorOut_bh6_176_176(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_177_191 <= heap_bh6_w22_7 & heap_bh6_w22_19 & heap_bh6_w22_17 & heap_bh6_w22_15 & heap_bh6_w22_21 & heap_bh6_w22_20;
   Compressor_bh6_177: Compressor_6_3
      port map ( R => CompressorOut_bh6_177_177   ,
                 X0 => CompressorIn_bh6_177_191);
   heap_bh6_w22_24 <= CompressorOut_bh6_177_177(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w23_25 <= CompressorOut_bh6_177_177(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w24_25 <= CompressorOut_bh6_177_177(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_178_192 <= heap_bh6_w23_20 & heap_bh6_w23_18 & heap_bh6_w23_16 & heap_bh6_w23_23 & heap_bh6_w23_22 & heap_bh6_w23_21;
   Compressor_bh6_178: Compressor_6_3
      port map ( R => CompressorOut_bh6_178_178   ,
                 X0 => CompressorIn_bh6_178_192);
   heap_bh6_w23_26 <= CompressorOut_bh6_178_178(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w24_26 <= CompressorOut_bh6_178_178(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w25_26 <= CompressorOut_bh6_178_178(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_179_193 <= heap_bh6_w24_21 & heap_bh6_w24_19 & heap_bh6_w24_17 & heap_bh6_w24_24 & heap_bh6_w24_23 & heap_bh6_w24_22;
   Compressor_bh6_179: Compressor_6_3
      port map ( R => CompressorOut_bh6_179_179   ,
                 X0 => CompressorIn_bh6_179_193);
   heap_bh6_w24_27 <= CompressorOut_bh6_179_179(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w25_27 <= CompressorOut_bh6_179_179(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w26_27 <= CompressorOut_bh6_179_179(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_180_194 <= heap_bh6_w25_21 & heap_bh6_w25_19 & heap_bh6_w25_17 & heap_bh6_w25_25 & heap_bh6_w25_24 & heap_bh6_w25_23;
   Compressor_bh6_180: Compressor_6_3
      port map ( R => CompressorOut_bh6_180_180   ,
                 X0 => CompressorIn_bh6_180_194);
   heap_bh6_w25_28 <= CompressorOut_bh6_180_180(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w26_28 <= CompressorOut_bh6_180_180(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w27_28 <= CompressorOut_bh6_180_180(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_181_195 <= heap_bh6_w26_22 & heap_bh6_w26_20 & heap_bh6_w26_18 & heap_bh6_w26_26 & heap_bh6_w26_25 & heap_bh6_w26_24;
   Compressor_bh6_181: Compressor_6_3
      port map ( R => CompressorOut_bh6_181_181   ,
                 X0 => CompressorIn_bh6_181_195);
   heap_bh6_w26_29 <= CompressorOut_bh6_181_181(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w27_29 <= CompressorOut_bh6_181_181(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w28_28 <= CompressorOut_bh6_181_181(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_182_196 <= heap_bh6_w27_24 & heap_bh6_w27_21 & heap_bh6_w27_19 & heap_bh6_w27_27 & heap_bh6_w27_26 & heap_bh6_w27_25;
   Compressor_bh6_182: Compressor_6_3
      port map ( R => CompressorOut_bh6_182_182   ,
                 X0 => CompressorIn_bh6_182_196);
   heap_bh6_w27_30 <= CompressorOut_bh6_182_182(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w28_29 <= CompressorOut_bh6_182_182(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w29_28 <= CompressorOut_bh6_182_182(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_183_197 <= heap_bh6_w28_25 & heap_bh6_w28_22 & heap_bh6_w28_19 & heap_bh6_w28_27 & heap_bh6_w28_26 & heap_bh6_w28_24;
   Compressor_bh6_183: Compressor_6_3
      port map ( R => CompressorOut_bh6_183_183   ,
                 X0 => CompressorIn_bh6_183_197);
   heap_bh6_w28_30 <= CompressorOut_bh6_183_183(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w29_29 <= CompressorOut_bh6_183_183(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w30_28 <= CompressorOut_bh6_183_183(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_184_198 <= heap_bh6_w29_25 & heap_bh6_w29_22 & heap_bh6_w29_19 & heap_bh6_w29_27 & heap_bh6_w29_26 & heap_bh6_w29_24;
   Compressor_bh6_184: Compressor_6_3
      port map ( R => CompressorOut_bh6_184_184   ,
                 X0 => CompressorIn_bh6_184_198);
   heap_bh6_w29_30 <= CompressorOut_bh6_184_184(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w30_29 <= CompressorOut_bh6_184_184(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w31_29 <= CompressorOut_bh6_184_184(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_185_199 <= heap_bh6_w30_25 & heap_bh6_w30_22 & heap_bh6_w30_19 & heap_bh6_w30_27 & heap_bh6_w30_26 & heap_bh6_w30_24;
   Compressor_bh6_185: Compressor_6_3
      port map ( R => CompressorOut_bh6_185_185   ,
                 X0 => CompressorIn_bh6_185_199);
   heap_bh6_w30_30 <= CompressorOut_bh6_185_185(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w31_30 <= CompressorOut_bh6_185_185(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w32_28 <= CompressorOut_bh6_185_185(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_186_200 <= heap_bh6_w31_11 & heap_bh6_w31_26 & heap_bh6_w31_23 & heap_bh6_w31_20 & heap_bh6_w31_28 & heap_bh6_w31_27;
   Compressor_bh6_186: Compressor_6_3
      port map ( R => CompressorOut_bh6_186_186   ,
                 X0 => CompressorIn_bh6_186_200);
   heap_bh6_w31_31 <= CompressorOut_bh6_186_186(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w32_29 <= CompressorOut_bh6_186_186(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w33_28 <= CompressorOut_bh6_186_186(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_187_201 <= heap_bh6_w32_25 & heap_bh6_w32_22 & heap_bh6_w32_19 & heap_bh6_w32_27 & heap_bh6_w32_26 & heap_bh6_w32_24;
   Compressor_bh6_187: Compressor_6_3
      port map ( R => CompressorOut_bh6_187_187   ,
                 X0 => CompressorIn_bh6_187_201);
   heap_bh6_w32_30 <= CompressorOut_bh6_187_187(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w33_29 <= CompressorOut_bh6_187_187(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w34_29 <= CompressorOut_bh6_187_187(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_188_202 <= heap_bh6_w33_25 & heap_bh6_w33_22 & heap_bh6_w33_19 & heap_bh6_w33_27 & heap_bh6_w33_26 & heap_bh6_w33_24;
   Compressor_bh6_188: Compressor_6_3
      port map ( R => CompressorOut_bh6_188_188   ,
                 X0 => CompressorIn_bh6_188_202);
   heap_bh6_w33_30 <= CompressorOut_bh6_188_188(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w34_30 <= CompressorOut_bh6_188_188(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w35_28 <= CompressorOut_bh6_188_188(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_189_203 <= heap_bh6_w34_11 & heap_bh6_w34_26 & heap_bh6_w34_23 & heap_bh6_w34_20 & heap_bh6_w34_28 & heap_bh6_w34_27;
   Compressor_bh6_189: Compressor_6_3
      port map ( R => CompressorOut_bh6_189_189   ,
                 X0 => CompressorIn_bh6_189_203);
   heap_bh6_w34_31 <= CompressorOut_bh6_189_189(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w35_29 <= CompressorOut_bh6_189_189(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w36_28 <= CompressorOut_bh6_189_189(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_190_204 <= heap_bh6_w35_25 & heap_bh6_w35_22 & heap_bh6_w35_19 & heap_bh6_w35_27 & heap_bh6_w35_26 & heap_bh6_w35_24;
   Compressor_bh6_190: Compressor_6_3
      port map ( R => CompressorOut_bh6_190_190   ,
                 X0 => CompressorIn_bh6_190_204);
   heap_bh6_w35_30 <= CompressorOut_bh6_190_190(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w36_29 <= CompressorOut_bh6_190_190(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w37_29 <= CompressorOut_bh6_190_190(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_191_205 <= heap_bh6_w36_25 & heap_bh6_w36_22 & heap_bh6_w36_19 & heap_bh6_w36_27 & heap_bh6_w36_26 & heap_bh6_w36_24;
   Compressor_bh6_191: Compressor_6_3
      port map ( R => CompressorOut_bh6_191_191   ,
                 X0 => CompressorIn_bh6_191_205);
   heap_bh6_w36_30 <= CompressorOut_bh6_191_191(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w37_30 <= CompressorOut_bh6_191_191(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w38_28 <= CompressorOut_bh6_191_191(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_192_206 <= heap_bh6_w37_11 & heap_bh6_w37_26 & heap_bh6_w37_23 & heap_bh6_w37_20 & heap_bh6_w37_28 & heap_bh6_w37_27;
   Compressor_bh6_192: Compressor_6_3
      port map ( R => CompressorOut_bh6_192_192   ,
                 X0 => CompressorIn_bh6_192_206);
   heap_bh6_w37_31 <= CompressorOut_bh6_192_192(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w38_29 <= CompressorOut_bh6_192_192(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w39_28 <= CompressorOut_bh6_192_192(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_193_207 <= heap_bh6_w38_25 & heap_bh6_w38_22 & heap_bh6_w38_19 & heap_bh6_w38_27 & heap_bh6_w38_26 & heap_bh6_w38_24;
   Compressor_bh6_193: Compressor_6_3
      port map ( R => CompressorOut_bh6_193_193   ,
                 X0 => CompressorIn_bh6_193_207);
   heap_bh6_w38_30 <= CompressorOut_bh6_193_193(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w39_29 <= CompressorOut_bh6_193_193(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w40_29 <= CompressorOut_bh6_193_193(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_194_208 <= heap_bh6_w39_25 & heap_bh6_w39_22 & heap_bh6_w39_19 & heap_bh6_w39_27 & heap_bh6_w39_26 & heap_bh6_w39_24;
   Compressor_bh6_194: Compressor_6_3
      port map ( R => CompressorOut_bh6_194_194   ,
                 X0 => CompressorIn_bh6_194_208);
   heap_bh6_w39_30 <= CompressorOut_bh6_194_194(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w40_30 <= CompressorOut_bh6_194_194(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w41_28 <= CompressorOut_bh6_194_194(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_195_209 <= heap_bh6_w40_11 & heap_bh6_w40_26 & heap_bh6_w40_23 & heap_bh6_w40_20 & heap_bh6_w40_28 & heap_bh6_w40_27;
   Compressor_bh6_195: Compressor_6_3
      port map ( R => CompressorOut_bh6_195_195   ,
                 X0 => CompressorIn_bh6_195_209);
   heap_bh6_w40_31 <= CompressorOut_bh6_195_195(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w41_29 <= CompressorOut_bh6_195_195(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w42_28 <= CompressorOut_bh6_195_195(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_196_210 <= heap_bh6_w41_25 & heap_bh6_w41_22 & heap_bh6_w41_19 & heap_bh6_w41_27 & heap_bh6_w41_26 & heap_bh6_w41_24;
   Compressor_bh6_196: Compressor_6_3
      port map ( R => CompressorOut_bh6_196_196   ,
                 X0 => CompressorIn_bh6_196_210);
   heap_bh6_w41_30 <= CompressorOut_bh6_196_196(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w42_29 <= CompressorOut_bh6_196_196(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w43_29 <= CompressorOut_bh6_196_196(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_197_211 <= heap_bh6_w42_25 & heap_bh6_w42_22 & heap_bh6_w42_19 & heap_bh6_w42_27 & heap_bh6_w42_26 & heap_bh6_w42_24;
   Compressor_bh6_197: Compressor_6_3
      port map ( R => CompressorOut_bh6_197_197   ,
                 X0 => CompressorIn_bh6_197_211);
   heap_bh6_w42_30 <= CompressorOut_bh6_197_197(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w43_30 <= CompressorOut_bh6_197_197(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w44_29 <= CompressorOut_bh6_197_197(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_198_212 <= heap_bh6_w43_11 & heap_bh6_w43_26 & heap_bh6_w43_23 & heap_bh6_w43_20 & heap_bh6_w43_28 & heap_bh6_w43_27;
   Compressor_bh6_198: Compressor_6_3
      port map ( R => CompressorOut_bh6_198_198   ,
                 X0 => CompressorIn_bh6_198_212);
   heap_bh6_w43_31 <= CompressorOut_bh6_198_198(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w44_30 <= CompressorOut_bh6_198_198(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w45_29 <= CompressorOut_bh6_198_198(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_199_213 <= heap_bh6_w44_26 & heap_bh6_w44_23 & heap_bh6_w44_20 & heap_bh6_w44_28 & heap_bh6_w44_27 & heap_bh6_w44_25;
   Compressor_bh6_199: Compressor_6_3
      port map ( R => CompressorOut_bh6_199_199   ,
                 X0 => CompressorIn_bh6_199_213);
   heap_bh6_w44_31 <= CompressorOut_bh6_199_199(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w45_30 <= CompressorOut_bh6_199_199(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w46_29 <= CompressorOut_bh6_199_199(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_200_214 <= heap_bh6_w45_26 & heap_bh6_w45_23 & heap_bh6_w45_20 & heap_bh6_w45_28 & heap_bh6_w45_27 & heap_bh6_w45_25;
   Compressor_bh6_200: Compressor_6_3
      port map ( R => CompressorOut_bh6_200_200   ,
                 X0 => CompressorIn_bh6_200_214);
   heap_bh6_w45_31 <= CompressorOut_bh6_200_200(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w46_30 <= CompressorOut_bh6_200_200(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w47_29 <= CompressorOut_bh6_200_200(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_201_215 <= heap_bh6_w46_26 & heap_bh6_w46_23 & heap_bh6_w46_20 & heap_bh6_w46_28 & heap_bh6_w46_27 & heap_bh6_w46_25;
   Compressor_bh6_201: Compressor_6_3
      port map ( R => CompressorOut_bh6_201_201   ,
                 X0 => CompressorIn_bh6_201_215);
   heap_bh6_w46_31 <= CompressorOut_bh6_201_201(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w47_30 <= CompressorOut_bh6_201_201(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w48_30 <= CompressorOut_bh6_201_201(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_202_216 <= heap_bh6_w47_26 & heap_bh6_w47_23 & heap_bh6_w47_20 & heap_bh6_w47_28 & heap_bh6_w47_27 & heap_bh6_w47_25;
   Compressor_bh6_202: Compressor_6_3
      port map ( R => CompressorOut_bh6_202_202   ,
                 X0 => CompressorIn_bh6_202_216);
   heap_bh6_w47_31 <= CompressorOut_bh6_202_202(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w48_31 <= CompressorOut_bh6_202_202(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w49_29 <= CompressorOut_bh6_202_202(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_203_217 <= heap_bh6_w48_11 & heap_bh6_w48_27 & heap_bh6_w48_24 & heap_bh6_w48_21 & heap_bh6_w48_29 & heap_bh6_w48_28;
   Compressor_bh6_203: Compressor_6_3
      port map ( R => CompressorOut_bh6_203_203   ,
                 X0 => CompressorIn_bh6_203_217);
   heap_bh6_w48_32 <= CompressorOut_bh6_203_203(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w49_30 <= CompressorOut_bh6_203_203(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w50_29 <= CompressorOut_bh6_203_203(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_204_218 <= heap_bh6_w49_26 & heap_bh6_w49_23 & heap_bh6_w49_20 & heap_bh6_w49_28 & heap_bh6_w49_27 & heap_bh6_w49_25;
   Compressor_bh6_204: Compressor_6_3
      port map ( R => CompressorOut_bh6_204_204   ,
                 X0 => CompressorIn_bh6_204_218);
   heap_bh6_w49_31 <= CompressorOut_bh6_204_204(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w50_30 <= CompressorOut_bh6_204_204(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w51_31 <= CompressorOut_bh6_204_204(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_205_219 <= heap_bh6_w50_26 & heap_bh6_w50_23 & heap_bh6_w50_20 & heap_bh6_w50_28 & heap_bh6_w50_27 & heap_bh6_w50_25;
   Compressor_bh6_205: Compressor_6_3
      port map ( R => CompressorOut_bh6_205_205   ,
                 X0 => CompressorIn_bh6_205_219);
   heap_bh6_w50_31 <= CompressorOut_bh6_205_205(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w51_32 <= CompressorOut_bh6_205_205(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w52_30 <= CompressorOut_bh6_205_205(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_206_220 <= heap_bh6_w51_11 & heap_bh6_w51_28 & heap_bh6_w51_25 & heap_bh6_w51_22 & heap_bh6_w51_30 & heap_bh6_w51_29;
   Compressor_bh6_206: Compressor_6_3
      port map ( R => CompressorOut_bh6_206_206   ,
                 X0 => CompressorIn_bh6_206_220);
   heap_bh6_w51_33 <= CompressorOut_bh6_206_206(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w52_31 <= CompressorOut_bh6_206_206(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w53_30 <= CompressorOut_bh6_206_206(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_207_221 <= heap_bh6_w52_27 & heap_bh6_w52_24 & heap_bh6_w52_21 & heap_bh6_w52_29 & heap_bh6_w52_28 & heap_bh6_w52_26;
   Compressor_bh6_207: Compressor_6_3
      port map ( R => CompressorOut_bh6_207_207   ,
                 X0 => CompressorIn_bh6_207_221);
   heap_bh6_w52_32 <= CompressorOut_bh6_207_207(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w53_31 <= CompressorOut_bh6_207_207(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w54_31 <= CompressorOut_bh6_207_207(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_208_222 <= heap_bh6_w53_27 & heap_bh6_w53_24 & heap_bh6_w53_21 & heap_bh6_w53_29 & heap_bh6_w53_28 & heap_bh6_w53_26;
   Compressor_bh6_208: Compressor_6_3
      port map ( R => CompressorOut_bh6_208_208   ,
                 X0 => CompressorIn_bh6_208_222);
   heap_bh6_w53_32 <= CompressorOut_bh6_208_208(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w54_32 <= CompressorOut_bh6_208_208(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w55_30 <= CompressorOut_bh6_208_208(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_209_223 <= heap_bh6_w54_11 & heap_bh6_w54_28 & heap_bh6_w54_25 & heap_bh6_w54_22 & heap_bh6_w54_30 & heap_bh6_w54_29;
   Compressor_bh6_209: Compressor_6_3
      port map ( R => CompressorOut_bh6_209_209   ,
                 X0 => CompressorIn_bh6_209_223);
   heap_bh6_w54_33 <= CompressorOut_bh6_209_209(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w55_31 <= CompressorOut_bh6_209_209(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w56_30 <= CompressorOut_bh6_209_209(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_210_224 <= heap_bh6_w55_27 & heap_bh6_w55_24 & heap_bh6_w55_21 & heap_bh6_w55_29 & heap_bh6_w55_28 & heap_bh6_w55_26;
   Compressor_bh6_210: Compressor_6_3
      port map ( R => CompressorOut_bh6_210_210   ,
                 X0 => CompressorIn_bh6_210_224);
   heap_bh6_w55_32 <= CompressorOut_bh6_210_210(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w56_31 <= CompressorOut_bh6_210_210(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w57_31 <= CompressorOut_bh6_210_210(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_211_225 <= heap_bh6_w56_27 & heap_bh6_w56_24 & heap_bh6_w56_21 & heap_bh6_w56_29 & heap_bh6_w56_28 & heap_bh6_w56_26;
   Compressor_bh6_211: Compressor_6_3
      port map ( R => CompressorOut_bh6_211_211   ,
                 X0 => CompressorIn_bh6_211_225);
   heap_bh6_w56_32 <= CompressorOut_bh6_211_211(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w57_32 <= CompressorOut_bh6_211_211(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w58_30 <= CompressorOut_bh6_211_211(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_212_226 <= heap_bh6_w57_11 & heap_bh6_w57_28 & heap_bh6_w57_25 & heap_bh6_w57_22 & heap_bh6_w57_30 & heap_bh6_w57_29;
   Compressor_bh6_212: Compressor_6_3
      port map ( R => CompressorOut_bh6_212_212   ,
                 X0 => CompressorIn_bh6_212_226);
   heap_bh6_w57_33 <= CompressorOut_bh6_212_212(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w58_31 <= CompressorOut_bh6_212_212(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w59_30 <= CompressorOut_bh6_212_212(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_213_227 <= heap_bh6_w58_27 & heap_bh6_w58_24 & heap_bh6_w58_21 & heap_bh6_w58_29 & heap_bh6_w58_28 & heap_bh6_w58_26;
   Compressor_bh6_213: Compressor_6_3
      port map ( R => CompressorOut_bh6_213_213   ,
                 X0 => CompressorIn_bh6_213_227);
   heap_bh6_w58_32 <= CompressorOut_bh6_213_213(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w59_31 <= CompressorOut_bh6_213_213(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w60_31 <= CompressorOut_bh6_213_213(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_214_228 <= heap_bh6_w59_27 & heap_bh6_w59_24 & heap_bh6_w59_21 & heap_bh6_w59_29 & heap_bh6_w59_28 & heap_bh6_w59_26;
   Compressor_bh6_214: Compressor_6_3
      port map ( R => CompressorOut_bh6_214_214   ,
                 X0 => CompressorIn_bh6_214_228);
   heap_bh6_w59_32 <= CompressorOut_bh6_214_214(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w60_32 <= CompressorOut_bh6_214_214(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w61_31 <= CompressorOut_bh6_214_214(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_215_229 <= heap_bh6_w60_11 & heap_bh6_w60_28 & heap_bh6_w60_25 & heap_bh6_w60_22 & heap_bh6_w60_30 & heap_bh6_w60_29;
   Compressor_bh6_215: Compressor_6_3
      port map ( R => CompressorOut_bh6_215_215   ,
                 X0 => CompressorIn_bh6_215_229);
   heap_bh6_w60_33 <= CompressorOut_bh6_215_215(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w61_32 <= CompressorOut_bh6_215_215(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w62_31 <= CompressorOut_bh6_215_215(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_216_230 <= heap_bh6_w61_28 & heap_bh6_w61_25 & heap_bh6_w61_22 & heap_bh6_w61_30 & heap_bh6_w61_29 & heap_bh6_w61_27;
   Compressor_bh6_216: Compressor_6_3
      port map ( R => CompressorOut_bh6_216_216   ,
                 X0 => CompressorIn_bh6_216_230);
   heap_bh6_w61_33 <= CompressorOut_bh6_216_216(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w62_32 <= CompressorOut_bh6_216_216(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w63_29 <= CompressorOut_bh6_216_216(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_217_231 <= heap_bh6_w62_28 & heap_bh6_w62_25 & heap_bh6_w62_22 & heap_bh6_w62_30 & heap_bh6_w62_29 & heap_bh6_w62_27;
   Compressor_bh6_217: Compressor_6_3
      port map ( R => CompressorOut_bh6_217_217   ,
                 X0 => CompressorIn_bh6_217_231);
   heap_bh6_w62_33 <= CompressorOut_bh6_217_217(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w63_30 <= CompressorOut_bh6_217_217(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w64_29 <= CompressorOut_bh6_217_217(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_218_232 <= heap_bh6_w63_26 & heap_bh6_w63_23 & heap_bh6_w63_20 & heap_bh6_w63_28 & heap_bh6_w63_27 & heap_bh6_w63_25;
   Compressor_bh6_218: Compressor_6_3
      port map ( R => CompressorOut_bh6_218_218   ,
                 X0 => CompressorIn_bh6_218_232);
   heap_bh6_w63_31 <= CompressorOut_bh6_218_218(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w64_30 <= CompressorOut_bh6_218_218(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w65_29 <= CompressorOut_bh6_218_218(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_219_233 <= heap_bh6_w64_25 & heap_bh6_w64_23 & heap_bh6_w64_20 & heap_bh6_w64_28 & heap_bh6_w64_27 & heap_bh6_w64_26;
   Compressor_bh6_219: Compressor_6_3
      port map ( R => CompressorOut_bh6_219_219   ,
                 X0 => CompressorIn_bh6_219_233);
   heap_bh6_w64_31 <= CompressorOut_bh6_219_219(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w65_30 <= CompressorOut_bh6_219_219(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w66_23 <= CompressorOut_bh6_219_219(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_220_234 <= heap_bh6_w65_24 & heap_bh6_w65_22 & heap_bh6_w65_20 & heap_bh6_w65_28 & heap_bh6_w65_27 & heap_bh6_w65_26;
   Compressor_bh6_220: Compressor_6_3
      port map ( R => CompressorOut_bh6_220_220   ,
                 X0 => CompressorIn_bh6_220_234);
   heap_bh6_w65_31 <= CompressorOut_bh6_220_220(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w66_24 <= CompressorOut_bh6_220_220(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w67_23 <= CompressorOut_bh6_220_220(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_221_235 <= heap_bh6_w66_20 & heap_bh6_w66_18 & heap_bh6_w66_16 & heap_bh6_w66_22 & heap_bh6_w66_21 & heap_bh6_w66_19;
   Compressor_bh6_221: Compressor_6_3
      port map ( R => CompressorOut_bh6_221_221   ,
                 X0 => CompressorIn_bh6_221_235);
   heap_bh6_w66_25 <= CompressorOut_bh6_221_221(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w67_24 <= CompressorOut_bh6_221_221(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w68_22 <= CompressorOut_bh6_221_221(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_222_236 <= heap_bh6_w67_20 & heap_bh6_w67_18 & heap_bh6_w67_16 & heap_bh6_w67_22 & heap_bh6_w67_21 & heap_bh6_w67_19;
   Compressor_bh6_222: Compressor_6_3
      port map ( R => CompressorOut_bh6_222_222   ,
                 X0 => CompressorIn_bh6_222_236);
   heap_bh6_w67_25 <= CompressorOut_bh6_222_222(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w68_23 <= CompressorOut_bh6_222_222(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w69_17 <= CompressorOut_bh6_222_222(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_223_237 <= heap_bh6_w68_20 & heap_bh6_w68_18 & heap_bh6_w68_16 & heap_bh6_w68_21 & heap_bh6_w68_19 & heap_bh6_w68_17;
   Compressor_bh6_223: Compressor_6_3
      port map ( R => CompressorOut_bh6_223_223   ,
                 X0 => CompressorIn_bh6_223_237);
   heap_bh6_w68_24 <= CompressorOut_bh6_223_223(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w69_18 <= CompressorOut_bh6_223_223(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w70_16 <= CompressorOut_bh6_223_223(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_224_238 <= heap_bh6_w69_6 & heap_bh6_w69_5 & heap_bh6_w69_14 & heap_bh6_w69_12 & heap_bh6_w69_16 & heap_bh6_w69_15;
   Compressor_bh6_224: Compressor_6_3
      port map ( R => CompressorOut_bh6_224_224   ,
                 X0 => CompressorIn_bh6_224_238);
   heap_bh6_w69_19 <= CompressorOut_bh6_224_224(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w70_17 <= CompressorOut_bh6_224_224(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w71_15 <= CompressorOut_bh6_224_224(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_225_239 <= heap_bh6_w70_6 & heap_bh6_w70_5 & heap_bh6_w70_12 & heap_bh6_w70_15 & heap_bh6_w70_14 & heap_bh6_w70_13;
   Compressor_bh6_225: Compressor_6_3
      port map ( R => CompressorOut_bh6_225_225   ,
                 X0 => CompressorIn_bh6_225_239);
   heap_bh6_w70_18 <= CompressorOut_bh6_225_225(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w71_16 <= CompressorOut_bh6_225_225(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w72_11 <= CompressorOut_bh6_225_225(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_226_240 <= heap_bh6_w10_0 & heap_bh6_w10_9 & heap_bh6_w10_8 & heap_bh6_w10_7;
   CompressorIn_bh6_226_241(0) <= heap_bh6_w11_0;
   Compressor_bh6_226: Compressor_14_3
      port map ( R => CompressorOut_bh6_226_226   ,
                 X0 => CompressorIn_bh6_226_240,
                 X1 => CompressorIn_bh6_226_241);
   heap_bh6_w10_10 <= CompressorOut_bh6_226_226(0); -- cycle= 0 cp= 1.62704e-09
   heap_bh6_w11_10 <= CompressorOut_bh6_226_226(1); -- cycle= 0 cp= 1.62704e-09
   heap_bh6_w12_13 <= CompressorOut_bh6_226_226(2); -- cycle= 0 cp= 1.62704e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_227_242 <= heap_bh6_w12_12 & heap_bh6_w12_11 & heap_bh6_w12_10 & heap_bh6_w12_9;
   CompressorIn_bh6_227_243(0) <= heap_bh6_w13_0;
   Compressor_bh6_227: Compressor_14_3
      port map ( R => CompressorOut_bh6_227_227   ,
                 X0 => CompressorIn_bh6_227_242,
                 X1 => CompressorIn_bh6_227_243);
   heap_bh6_w12_14 <= CompressorOut_bh6_227_227(0); -- cycle= 0 cp= 1.62704e-09
   heap_bh6_w13_13 <= CompressorOut_bh6_227_227(1); -- cycle= 0 cp= 1.62704e-09
   heap_bh6_w14_15 <= CompressorOut_bh6_227_227(2); -- cycle= 0 cp= 1.62704e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_228_244 <= heap_bh6_w13_12 & heap_bh6_w13_11 & heap_bh6_w13_10 & heap_bh6_w13_9;
   CompressorIn_bh6_228_245(0) <= heap_bh6_w14_14;
   Compressor_bh6_228: Compressor_14_3
      port map ( R => CompressorOut_bh6_228_228   ,
                 X0 => CompressorIn_bh6_228_244,
                 X1 => CompressorIn_bh6_228_245);
   heap_bh6_w13_14 <= CompressorOut_bh6_228_228(0); -- cycle= 0 cp= 1.62704e-09
   heap_bh6_w14_16 <= CompressorOut_bh6_228_228(1); -- cycle= 0 cp= 1.62704e-09
   heap_bh6_w15_16 <= CompressorOut_bh6_228_228(2); -- cycle= 0 cp= 1.62704e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_229_246 <= heap_bh6_w14_13 & heap_bh6_w14_12 & heap_bh6_w14_11 & heap_bh6_w14_10;
   CompressorIn_bh6_229_247(0) <= heap_bh6_w15_14;
   Compressor_bh6_229: Compressor_14_3
      port map ( R => CompressorOut_bh6_229_229   ,
                 X0 => CompressorIn_bh6_229_246,
                 X1 => CompressorIn_bh6_229_247);
   heap_bh6_w14_17 <= CompressorOut_bh6_229_229(0); -- cycle= 0 cp= 1.62704e-09
   heap_bh6_w15_17 <= CompressorOut_bh6_229_229(1); -- cycle= 0 cp= 1.62704e-09
   heap_bh6_w16_18 <= CompressorOut_bh6_229_229(2); -- cycle= 0 cp= 1.62704e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_230_248 <= heap_bh6_w31_25 & heap_bh6_w31_24 & heap_bh6_w31_22 & heap_bh6_w31_21;
   CompressorIn_bh6_230_249(0) <= heap_bh6_w32_23;
   Compressor_bh6_230: Compressor_14_3
      port map ( R => CompressorOut_bh6_230_230   ,
                 X0 => CompressorIn_bh6_230_248,
                 X1 => CompressorIn_bh6_230_249);
   heap_bh6_w31_32 <= CompressorOut_bh6_230_230(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w32_31 <= CompressorOut_bh6_230_230(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w33_31 <= CompressorOut_bh6_230_230(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_231_250 <= heap_bh6_w34_25 & heap_bh6_w34_24 & heap_bh6_w34_22 & heap_bh6_w34_21;
   CompressorIn_bh6_231_251(0) <= heap_bh6_w35_23;
   Compressor_bh6_231: Compressor_14_3
      port map ( R => CompressorOut_bh6_231_231   ,
                 X0 => CompressorIn_bh6_231_250,
                 X1 => CompressorIn_bh6_231_251);
   heap_bh6_w34_32 <= CompressorOut_bh6_231_231(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w35_31 <= CompressorOut_bh6_231_231(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w36_31 <= CompressorOut_bh6_231_231(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_232_252 <= heap_bh6_w37_25 & heap_bh6_w37_24 & heap_bh6_w37_22 & heap_bh6_w37_21;
   CompressorIn_bh6_232_253(0) <= heap_bh6_w38_23;
   Compressor_bh6_232: Compressor_14_3
      port map ( R => CompressorOut_bh6_232_232   ,
                 X0 => CompressorIn_bh6_232_252,
                 X1 => CompressorIn_bh6_232_253);
   heap_bh6_w37_32 <= CompressorOut_bh6_232_232(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w38_31 <= CompressorOut_bh6_232_232(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w39_31 <= CompressorOut_bh6_232_232(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_233_254 <= heap_bh6_w40_25 & heap_bh6_w40_24 & heap_bh6_w40_22 & heap_bh6_w40_21;
   CompressorIn_bh6_233_255(0) <= heap_bh6_w41_23;
   Compressor_bh6_233: Compressor_14_3
      port map ( R => CompressorOut_bh6_233_233   ,
                 X0 => CompressorIn_bh6_233_254,
                 X1 => CompressorIn_bh6_233_255);
   heap_bh6_w40_32 <= CompressorOut_bh6_233_233(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w41_31 <= CompressorOut_bh6_233_233(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w42_31 <= CompressorOut_bh6_233_233(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_234_256 <= heap_bh6_w43_25 & heap_bh6_w43_24 & heap_bh6_w43_22 & heap_bh6_w43_21;
   CompressorIn_bh6_234_257(0) <= heap_bh6_w44_24;
   Compressor_bh6_234: Compressor_14_3
      port map ( R => CompressorOut_bh6_234_234   ,
                 X0 => CompressorIn_bh6_234_256,
                 X1 => CompressorIn_bh6_234_257);
   heap_bh6_w43_32 <= CompressorOut_bh6_234_234(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w44_32 <= CompressorOut_bh6_234_234(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w45_32 <= CompressorOut_bh6_234_234(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_235_258 <= heap_bh6_w48_26 & heap_bh6_w48_25 & heap_bh6_w48_23 & heap_bh6_w48_22;
   CompressorIn_bh6_235_259(0) <= heap_bh6_w49_24;
   Compressor_bh6_235: Compressor_14_3
      port map ( R => CompressorOut_bh6_235_235   ,
                 X0 => CompressorIn_bh6_235_258,
                 X1 => CompressorIn_bh6_235_259);
   heap_bh6_w48_33 <= CompressorOut_bh6_235_235(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w49_32 <= CompressorOut_bh6_235_235(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w50_32 <= CompressorOut_bh6_235_235(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_236_260 <= heap_bh6_w51_27 & heap_bh6_w51_26 & heap_bh6_w51_24 & heap_bh6_w51_23;
   CompressorIn_bh6_236_261(0) <= heap_bh6_w52_25;
   Compressor_bh6_236: Compressor_14_3
      port map ( R => CompressorOut_bh6_236_236   ,
                 X0 => CompressorIn_bh6_236_260,
                 X1 => CompressorIn_bh6_236_261);
   heap_bh6_w51_34 <= CompressorOut_bh6_236_236(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w52_33 <= CompressorOut_bh6_236_236(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w53_33 <= CompressorOut_bh6_236_236(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_237_262 <= heap_bh6_w54_27 & heap_bh6_w54_26 & heap_bh6_w54_24 & heap_bh6_w54_23;
   CompressorIn_bh6_237_263(0) <= heap_bh6_w55_25;
   Compressor_bh6_237: Compressor_14_3
      port map ( R => CompressorOut_bh6_237_237   ,
                 X0 => CompressorIn_bh6_237_262,
                 X1 => CompressorIn_bh6_237_263);
   heap_bh6_w54_34 <= CompressorOut_bh6_237_237(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w55_33 <= CompressorOut_bh6_237_237(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w56_33 <= CompressorOut_bh6_237_237(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_238_264 <= heap_bh6_w57_27 & heap_bh6_w57_26 & heap_bh6_w57_24 & heap_bh6_w57_23;
   CompressorIn_bh6_238_265(0) <= heap_bh6_w58_25;
   Compressor_bh6_238: Compressor_14_3
      port map ( R => CompressorOut_bh6_238_238   ,
                 X0 => CompressorIn_bh6_238_264,
                 X1 => CompressorIn_bh6_238_265);
   heap_bh6_w57_34 <= CompressorOut_bh6_238_238(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w58_33 <= CompressorOut_bh6_238_238(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w59_33 <= CompressorOut_bh6_238_238(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_239_266 <= heap_bh6_w60_27 & heap_bh6_w60_26 & heap_bh6_w60_24 & heap_bh6_w60_23;
   CompressorIn_bh6_239_267(0) <= heap_bh6_w61_26;
   Compressor_bh6_239: Compressor_14_3
      port map ( R => CompressorOut_bh6_239_239   ,
                 X0 => CompressorIn_bh6_239_266,
                 X1 => CompressorIn_bh6_239_267);
   heap_bh6_w60_34 <= CompressorOut_bh6_239_239(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w61_34 <= CompressorOut_bh6_239_239(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w62_34 <= CompressorOut_bh6_239_239(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_240_268 <= heap_bh6_w71_6 & heap_bh6_w71_5 & heap_bh6_w71_14 & heap_bh6_w71_13;
   CompressorIn_bh6_240_269(0) <= heap_bh6_w72_10;
   Compressor_bh6_240: Compressor_14_3
      port map ( R => CompressorOut_bh6_240_240   ,
                 X0 => CompressorIn_bh6_240_268,
                 X1 => CompressorIn_bh6_240_269);
   heap_bh6_w71_17 <= CompressorOut_bh6_240_240(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w72_12 <= CompressorOut_bh6_240_240(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w73_11 <= CompressorOut_bh6_240_240(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_241_270 <= heap_bh6_w15_13 & heap_bh6_w15_12 & heap_bh6_w15_11 & heap_bh6_w15_15;
   Compressor_bh6_241: Compressor_4_3
      port map ( R => CompressorOut_bh6_241_241   ,
                 X0 => CompressorIn_bh6_241_270);
   heap_bh6_w15_18 <= CompressorOut_bh6_241_241(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w16_19 <= CompressorOut_bh6_241_241(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w17_20 <= CompressorOut_bh6_241_241(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_242_271 <= heap_bh6_w7_7 & heap_bh6_w7_6 & heap_bh6_w7_5;
   CompressorIn_bh6_242_272 <= heap_bh6_w8_7 & heap_bh6_w8_6;
   Compressor_bh6_242: Compressor_23_3
      port map ( R => CompressorOut_bh6_242_242   ,
                 X0 => CompressorIn_bh6_242_271,
                 X1 => CompressorIn_bh6_242_272);
   heap_bh6_w7_8 <= CompressorOut_bh6_242_242(0); -- cycle= 0 cp= 1.62704e-09
   heap_bh6_w8_8 <= CompressorOut_bh6_242_242(1); -- cycle= 0 cp= 1.62704e-09
   heap_bh6_w9_10 <= CompressorOut_bh6_242_242(2); -- cycle= 0 cp= 1.62704e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_243_273 <= heap_bh6_w25_22 & heap_bh6_w25_20 & heap_bh6_w25_18;
   CompressorIn_bh6_243_274 <= heap_bh6_w26_23 & heap_bh6_w26_21;
   Compressor_bh6_243: Compressor_23_3
      port map ( R => CompressorOut_bh6_243_243   ,
                 X0 => CompressorIn_bh6_243_273,
                 X1 => CompressorIn_bh6_243_274);
   heap_bh6_w25_29 <= CompressorOut_bh6_243_243(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w26_30 <= CompressorOut_bh6_243_243(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w27_31 <= CompressorOut_bh6_243_243(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_244_275 <= heap_bh6_w27_23 & heap_bh6_w27_22 & heap_bh6_w27_20;
   CompressorIn_bh6_244_276 <= heap_bh6_w28_23 & heap_bh6_w28_21;
   Compressor_bh6_244: Compressor_23_3
      port map ( R => CompressorOut_bh6_244_244   ,
                 X0 => CompressorIn_bh6_244_275,
                 X1 => CompressorIn_bh6_244_276);
   heap_bh6_w27_32 <= CompressorOut_bh6_244_244(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w28_31 <= CompressorOut_bh6_244_244(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w29_31 <= CompressorOut_bh6_244_244(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_245_277 <= heap_bh6_w29_23 & heap_bh6_w29_21 & heap_bh6_w29_20;
   CompressorIn_bh6_245_278 <= heap_bh6_w30_23 & heap_bh6_w30_21;
   Compressor_bh6_245: Compressor_23_3
      port map ( R => CompressorOut_bh6_245_245   ,
                 X0 => CompressorIn_bh6_245_277,
                 X1 => CompressorIn_bh6_245_278);
   heap_bh6_w29_32 <= CompressorOut_bh6_245_245(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w30_31 <= CompressorOut_bh6_245_245(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w31_33 <= CompressorOut_bh6_245_245(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_246_279 <= heap_bh6_w45_24 & heap_bh6_w45_22 & heap_bh6_w45_21;
   CompressorIn_bh6_246_280 <= heap_bh6_w46_24 & heap_bh6_w46_22;
   Compressor_bh6_246: Compressor_23_3
      port map ( R => CompressorOut_bh6_246_246   ,
                 X0 => CompressorIn_bh6_246_279,
                 X1 => CompressorIn_bh6_246_280);
   heap_bh6_w45_33 <= CompressorOut_bh6_246_246(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w46_32 <= CompressorOut_bh6_246_246(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w47_32 <= CompressorOut_bh6_246_246(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_247_281 <= heap_bh6_w62_26 & heap_bh6_w62_24 & heap_bh6_w62_23;
   CompressorIn_bh6_247_282 <= heap_bh6_w63_24 & heap_bh6_w63_22;
   Compressor_bh6_247: Compressor_23_3
      port map ( R => CompressorOut_bh6_247_247   ,
                 X0 => CompressorIn_bh6_247_281,
                 X1 => CompressorIn_bh6_247_282);
   heap_bh6_w62_35 <= CompressorOut_bh6_247_247(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w63_32 <= CompressorOut_bh6_247_247(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w64_32 <= CompressorOut_bh6_247_247(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_248_283 <= heap_bh6_w64_24 & heap_bh6_w64_22 & heap_bh6_w64_21;
   CompressorIn_bh6_248_284 <= heap_bh6_w65_25 & heap_bh6_w65_23;
   Compressor_bh6_248: Compressor_23_3
      port map ( R => CompressorOut_bh6_248_248   ,
                 X0 => CompressorIn_bh6_248_283,
                 X1 => CompressorIn_bh6_248_284);
   heap_bh6_w64_33 <= CompressorOut_bh6_248_248(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w65_32 <= CompressorOut_bh6_248_248(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w66_26 <= CompressorOut_bh6_248_248(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_249_285 <= heap_bh6_w73_10 & heap_bh6_w73_9 & heap_bh6_w73_8;
   CompressorIn_bh6_249_286 <= heap_bh6_w74_10 & heap_bh6_w74_9;
   Compressor_bh6_249: Compressor_23_3
      port map ( R => CompressorOut_bh6_249_249   ,
                 X0 => CompressorIn_bh6_249_285,
                 X1 => CompressorIn_bh6_249_286);
   heap_bh6_w73_12 <= CompressorOut_bh6_249_249(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w74_11 <= CompressorOut_bh6_249_249(1); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w75_6 <= CompressorOut_bh6_249_249(2); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_250_287 <= heap_bh6_w9_9 & heap_bh6_w9_8 & heap_bh6_w9_7;
   Compressor_bh6_250: Compressor_3_2
      port map ( R => CompressorOut_bh6_250_250   ,
                 X0 => CompressorIn_bh6_250_287);
   heap_bh6_w9_11 <= CompressorOut_bh6_250_250(0); -- cycle= 0 cp= 1.62704e-09
   heap_bh6_w10_11 <= CompressorOut_bh6_250_250(1); -- cycle= 0 cp= 1.62704e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_251_288 <= heap_bh6_w11_9 & heap_bh6_w11_8 & heap_bh6_w11_7;
   Compressor_bh6_251: Compressor_3_2
      port map ( R => CompressorOut_bh6_251_251   ,
                 X0 => CompressorIn_bh6_251_288);
   heap_bh6_w11_11 <= CompressorOut_bh6_251_251(0); -- cycle= 0 cp= 1.62704e-09
   heap_bh6_w12_15 <= CompressorOut_bh6_251_251(1); -- cycle= 0 cp= 1.62704e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_252_289 <= heap_bh6_w33_23 & heap_bh6_w33_21 & heap_bh6_w33_20;
   Compressor_bh6_252: Compressor_3_2
      port map ( R => CompressorOut_bh6_252_252   ,
                 X0 => CompressorIn_bh6_252_289);
   heap_bh6_w33_32 <= CompressorOut_bh6_252_252(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w34_33 <= CompressorOut_bh6_252_252(1); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_253_290 <= heap_bh6_w36_23 & heap_bh6_w36_21 & heap_bh6_w36_20;
   Compressor_bh6_253: Compressor_3_2
      port map ( R => CompressorOut_bh6_253_253   ,
                 X0 => CompressorIn_bh6_253_290);
   heap_bh6_w36_32 <= CompressorOut_bh6_253_253(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w37_33 <= CompressorOut_bh6_253_253(1); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_254_291 <= heap_bh6_w39_23 & heap_bh6_w39_21 & heap_bh6_w39_20;
   Compressor_bh6_254: Compressor_3_2
      port map ( R => CompressorOut_bh6_254_254   ,
                 X0 => CompressorIn_bh6_254_291);
   heap_bh6_w39_32 <= CompressorOut_bh6_254_254(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w40_33 <= CompressorOut_bh6_254_254(1); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_255_292 <= heap_bh6_w42_23 & heap_bh6_w42_21 & heap_bh6_w42_20;
   Compressor_bh6_255: Compressor_3_2
      port map ( R => CompressorOut_bh6_255_255   ,
                 X0 => CompressorIn_bh6_255_292);
   heap_bh6_w42_32 <= CompressorOut_bh6_255_255(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w43_33 <= CompressorOut_bh6_255_255(1); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_256_293 <= heap_bh6_w47_24 & heap_bh6_w47_22 & heap_bh6_w47_21;
   Compressor_bh6_256: Compressor_3_2
      port map ( R => CompressorOut_bh6_256_256   ,
                 X0 => CompressorIn_bh6_256_293);
   heap_bh6_w47_33 <= CompressorOut_bh6_256_256(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w48_34 <= CompressorOut_bh6_256_256(1); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_257_294 <= heap_bh6_w50_24 & heap_bh6_w50_22 & heap_bh6_w50_21;
   Compressor_bh6_257: Compressor_3_2
      port map ( R => CompressorOut_bh6_257_257   ,
                 X0 => CompressorIn_bh6_257_294);
   heap_bh6_w50_33 <= CompressorOut_bh6_257_257(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w51_35 <= CompressorOut_bh6_257_257(1); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_258_295 <= heap_bh6_w53_25 & heap_bh6_w53_23 & heap_bh6_w53_22;
   Compressor_bh6_258: Compressor_3_2
      port map ( R => CompressorOut_bh6_258_258   ,
                 X0 => CompressorIn_bh6_258_295);
   heap_bh6_w53_34 <= CompressorOut_bh6_258_258(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w54_35 <= CompressorOut_bh6_258_258(1); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_259_296 <= heap_bh6_w56_25 & heap_bh6_w56_23 & heap_bh6_w56_22;
   Compressor_bh6_259: Compressor_3_2
      port map ( R => CompressorOut_bh6_259_259   ,
                 X0 => CompressorIn_bh6_259_296);
   heap_bh6_w56_34 <= CompressorOut_bh6_259_259(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w57_35 <= CompressorOut_bh6_259_259(1); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_260_297 <= heap_bh6_w59_25 & heap_bh6_w59_23 & heap_bh6_w59_22;
   Compressor_bh6_260: Compressor_3_2
      port map ( R => CompressorOut_bh6_260_260   ,
                 X0 => CompressorIn_bh6_260_297);
   heap_bh6_w59_34 <= CompressorOut_bh6_260_260(0); -- cycle= 0 cp= 1.6532e-09
   heap_bh6_w60_35 <= CompressorOut_bh6_260_260(1); -- cycle= 0 cp= 1.6532e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_261_298 <= heap_bh6_w32_21 & heap_bh6_w32_20 & heap_bh6_w32_31 & heap_bh6_w32_30 & heap_bh6_w32_29 & heap_bh6_w32_28;
   Compressor_bh6_261: Compressor_6_3
      port map ( R => CompressorOut_bh6_261_261   ,
                 X0 => CompressorIn_bh6_261_298);
   heap_bh6_w32_32 <= CompressorOut_bh6_261_261(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w33_33 <= CompressorOut_bh6_261_261(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w34_34 <= CompressorOut_bh6_261_261(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_262_299 <= heap_bh6_w35_21 & heap_bh6_w35_20 & heap_bh6_w35_31 & heap_bh6_w35_30 & heap_bh6_w35_29 & heap_bh6_w35_28;
   Compressor_bh6_262: Compressor_6_3
      port map ( R => CompressorOut_bh6_262_262   ,
                 X0 => CompressorIn_bh6_262_299);
   heap_bh6_w35_32 <= CompressorOut_bh6_262_262(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w36_33 <= CompressorOut_bh6_262_262(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w37_34 <= CompressorOut_bh6_262_262(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_263_300 <= heap_bh6_w38_21 & heap_bh6_w38_20 & heap_bh6_w38_31 & heap_bh6_w38_30 & heap_bh6_w38_29 & heap_bh6_w38_28;
   Compressor_bh6_263: Compressor_6_3
      port map ( R => CompressorOut_bh6_263_263   ,
                 X0 => CompressorIn_bh6_263_300);
   heap_bh6_w38_32 <= CompressorOut_bh6_263_263(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w39_33 <= CompressorOut_bh6_263_263(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w40_34 <= CompressorOut_bh6_263_263(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_264_301 <= heap_bh6_w41_21 & heap_bh6_w41_20 & heap_bh6_w41_31 & heap_bh6_w41_30 & heap_bh6_w41_29 & heap_bh6_w41_28;
   Compressor_bh6_264: Compressor_6_3
      port map ( R => CompressorOut_bh6_264_264   ,
                 X0 => CompressorIn_bh6_264_301);
   heap_bh6_w41_32 <= CompressorOut_bh6_264_264(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w42_33 <= CompressorOut_bh6_264_264(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w43_34 <= CompressorOut_bh6_264_264(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_265_302 <= heap_bh6_w44_22 & heap_bh6_w44_21 & heap_bh6_w44_32 & heap_bh6_w44_31 & heap_bh6_w44_30 & heap_bh6_w44_29;
   Compressor_bh6_265: Compressor_6_3
      port map ( R => CompressorOut_bh6_265_265   ,
                 X0 => CompressorIn_bh6_265_302);
   heap_bh6_w44_33 <= CompressorOut_bh6_265_265(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w45_34 <= CompressorOut_bh6_265_265(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w46_33 <= CompressorOut_bh6_265_265(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_266_303 <= heap_bh6_w49_22 & heap_bh6_w49_21 & heap_bh6_w49_32 & heap_bh6_w49_31 & heap_bh6_w49_30 & heap_bh6_w49_29;
   Compressor_bh6_266: Compressor_6_3
      port map ( R => CompressorOut_bh6_266_266   ,
                 X0 => CompressorIn_bh6_266_303);
   heap_bh6_w49_33 <= CompressorOut_bh6_266_266(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w50_34 <= CompressorOut_bh6_266_266(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w51_36 <= CompressorOut_bh6_266_266(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_267_304 <= heap_bh6_w52_23 & heap_bh6_w52_22 & heap_bh6_w52_33 & heap_bh6_w52_32 & heap_bh6_w52_31 & heap_bh6_w52_30;
   Compressor_bh6_267: Compressor_6_3
      port map ( R => CompressorOut_bh6_267_267   ,
                 X0 => CompressorIn_bh6_267_304);
   heap_bh6_w52_34 <= CompressorOut_bh6_267_267(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w53_35 <= CompressorOut_bh6_267_267(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w54_36 <= CompressorOut_bh6_267_267(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_268_305 <= heap_bh6_w55_23 & heap_bh6_w55_22 & heap_bh6_w55_33 & heap_bh6_w55_32 & heap_bh6_w55_31 & heap_bh6_w55_30;
   Compressor_bh6_268: Compressor_6_3
      port map ( R => CompressorOut_bh6_268_268   ,
                 X0 => CompressorIn_bh6_268_305);
   heap_bh6_w55_34 <= CompressorOut_bh6_268_268(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w56_35 <= CompressorOut_bh6_268_268(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w57_36 <= CompressorOut_bh6_268_268(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_269_306 <= heap_bh6_w58_23 & heap_bh6_w58_22 & heap_bh6_w58_33 & heap_bh6_w58_32 & heap_bh6_w58_31 & heap_bh6_w58_30;
   Compressor_bh6_269: Compressor_6_3
      port map ( R => CompressorOut_bh6_269_269   ,
                 X0 => CompressorIn_bh6_269_306);
   heap_bh6_w58_34 <= CompressorOut_bh6_269_269(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w59_35 <= CompressorOut_bh6_269_269(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w60_36 <= CompressorOut_bh6_269_269(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_270_307 <= heap_bh6_w61_24 & heap_bh6_w61_23 & heap_bh6_w61_34 & heap_bh6_w61_33 & heap_bh6_w61_32 & heap_bh6_w61_31;
   Compressor_bh6_270: Compressor_6_3
      port map ( R => CompressorOut_bh6_270_270   ,
                 X0 => CompressorIn_bh6_270_307);
   heap_bh6_w61_35 <= CompressorOut_bh6_270_270(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w62_36 <= CompressorOut_bh6_270_270(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w63_33 <= CompressorOut_bh6_270_270(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_271_308 <= heap_bh6_w18_15 & heap_bh6_w18_21 & heap_bh6_w18_20 & heap_bh6_w18_19;
   CompressorIn_bh6_271_309(0) <= heap_bh6_w19_14;
   Compressor_bh6_271: Compressor_14_3
      port map ( R => CompressorOut_bh6_271_271   ,
                 X0 => CompressorIn_bh6_271_308,
                 X1 => CompressorIn_bh6_271_309);
   heap_bh6_w18_22 <= CompressorOut_bh6_271_271(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w19_22 <= CompressorOut_bh6_271_271(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w20_23 <= CompressorOut_bh6_271_271(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_272_310 <= heap_bh6_w20_17 & heap_bh6_w20_15 & heap_bh6_w20_22 & heap_bh6_w20_21;
   CompressorIn_bh6_272_311(0) <= heap_bh6_w21_16;
   Compressor_bh6_272: Compressor_14_3
      port map ( R => CompressorOut_bh6_272_272   ,
                 X0 => CompressorIn_bh6_272_310,
                 X1 => CompressorIn_bh6_272_311);
   heap_bh6_w20_24 <= CompressorOut_bh6_272_272(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w21_25 <= CompressorOut_bh6_272_272(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w22_25 <= CompressorOut_bh6_272_272(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_273_312 <= heap_bh6_w22_18 & heap_bh6_w22_16 & heap_bh6_w22_24 & heap_bh6_w22_23;
   CompressorIn_bh6_273_313(0) <= heap_bh6_w23_19;
   Compressor_bh6_273: Compressor_14_3
      port map ( R => CompressorOut_bh6_273_273   ,
                 X0 => CompressorIn_bh6_273_312,
                 X1 => CompressorIn_bh6_273_313);
   heap_bh6_w22_26 <= CompressorOut_bh6_273_273(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w23_27 <= CompressorOut_bh6_273_273(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w24_28 <= CompressorOut_bh6_273_273(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_274_314 <= heap_bh6_w23_17 & heap_bh6_w23_26 & heap_bh6_w23_25 & heap_bh6_w23_24;
   CompressorIn_bh6_274_315(0) <= heap_bh6_w24_20;
   Compressor_bh6_274: Compressor_14_3
      port map ( R => CompressorOut_bh6_274_274   ,
                 X0 => CompressorIn_bh6_274_314,
                 X1 => CompressorIn_bh6_274_315);
   heap_bh6_w23_28 <= CompressorOut_bh6_274_274(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w24_29 <= CompressorOut_bh6_274_274(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w25_30 <= CompressorOut_bh6_274_274(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_275_316 <= heap_bh6_w24_18 & heap_bh6_w24_27 & heap_bh6_w24_26 & heap_bh6_w24_25;
   CompressorIn_bh6_275_317(0) <= heap_bh6_w25_29;
   Compressor_bh6_275: Compressor_14_3
      port map ( R => CompressorOut_bh6_275_275   ,
                 X0 => CompressorIn_bh6_275_316,
                 X1 => CompressorIn_bh6_275_317);
   heap_bh6_w24_30 <= CompressorOut_bh6_275_275(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w25_31 <= CompressorOut_bh6_275_275(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w26_31 <= CompressorOut_bh6_275_275(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_276_318 <= heap_bh6_w26_19 & heap_bh6_w26_30 & heap_bh6_w26_29 & heap_bh6_w26_28;
   CompressorIn_bh6_276_319(0) <= heap_bh6_w27_32;
   Compressor_bh6_276: Compressor_14_3
      port map ( R => CompressorOut_bh6_276_276   ,
                 X0 => CompressorIn_bh6_276_318,
                 X1 => CompressorIn_bh6_276_319);
   heap_bh6_w26_32 <= CompressorOut_bh6_276_276(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w27_33 <= CompressorOut_bh6_276_276(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w28_32 <= CompressorOut_bh6_276_276(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_277_320 <= heap_bh6_w27_31 & heap_bh6_w27_30 & heap_bh6_w27_29 & heap_bh6_w27_28;
   CompressorIn_bh6_277_321(0) <= heap_bh6_w28_20;
   Compressor_bh6_277: Compressor_14_3
      port map ( R => CompressorOut_bh6_277_277   ,
                 X0 => CompressorIn_bh6_277_320,
                 X1 => CompressorIn_bh6_277_321);
   heap_bh6_w27_34 <= CompressorOut_bh6_277_277(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w28_33 <= CompressorOut_bh6_277_277(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w29_33 <= CompressorOut_bh6_277_277(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_278_322 <= heap_bh6_w28_31 & heap_bh6_w28_30 & heap_bh6_w28_29 & heap_bh6_w28_28;
   CompressorIn_bh6_278_323(0) <= heap_bh6_w29_32;
   Compressor_bh6_278: Compressor_14_3
      port map ( R => CompressorOut_bh6_278_278   ,
                 X0 => CompressorIn_bh6_278_322,
                 X1 => CompressorIn_bh6_278_323);
   heap_bh6_w28_34 <= CompressorOut_bh6_278_278(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w29_34 <= CompressorOut_bh6_278_278(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w30_32 <= CompressorOut_bh6_278_278(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_279_324 <= heap_bh6_w29_31 & heap_bh6_w29_30 & heap_bh6_w29_29 & heap_bh6_w29_28;
   CompressorIn_bh6_279_325(0) <= heap_bh6_w30_20;
   Compressor_bh6_279: Compressor_14_3
      port map ( R => CompressorOut_bh6_279_279   ,
                 X0 => CompressorIn_bh6_279_324,
                 X1 => CompressorIn_bh6_279_325);
   heap_bh6_w29_35 <= CompressorOut_bh6_279_279(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w30_33 <= CompressorOut_bh6_279_279(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w31_34 <= CompressorOut_bh6_279_279(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_280_326 <= heap_bh6_w30_31 & heap_bh6_w30_30 & heap_bh6_w30_29 & heap_bh6_w30_28;
   CompressorIn_bh6_280_327(0) <= heap_bh6_w31_33;
   Compressor_bh6_280: Compressor_14_3
      port map ( R => CompressorOut_bh6_280_280   ,
                 X0 => CompressorIn_bh6_280_326,
                 X1 => CompressorIn_bh6_280_327);
   heap_bh6_w30_34 <= CompressorOut_bh6_280_280(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w31_35 <= CompressorOut_bh6_280_280(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w32_33 <= CompressorOut_bh6_280_280(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_281_328 <= heap_bh6_w33_32 & heap_bh6_w33_31 & heap_bh6_w33_30 & heap_bh6_w33_29;
   CompressorIn_bh6_281_329(0) <= heap_bh6_w34_33;
   Compressor_bh6_281: Compressor_14_3
      port map ( R => CompressorOut_bh6_281_281   ,
                 X0 => CompressorIn_bh6_281_328,
                 X1 => CompressorIn_bh6_281_329);
   heap_bh6_w33_34 <= CompressorOut_bh6_281_281(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w34_35 <= CompressorOut_bh6_281_281(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w35_33 <= CompressorOut_bh6_281_281(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_282_330 <= heap_bh6_w36_32 & heap_bh6_w36_31 & heap_bh6_w36_30 & heap_bh6_w36_29;
   CompressorIn_bh6_282_331(0) <= heap_bh6_w37_33;
   Compressor_bh6_282: Compressor_14_3
      port map ( R => CompressorOut_bh6_282_282   ,
                 X0 => CompressorIn_bh6_282_330,
                 X1 => CompressorIn_bh6_282_331);
   heap_bh6_w36_34 <= CompressorOut_bh6_282_282(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w37_35 <= CompressorOut_bh6_282_282(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w38_33 <= CompressorOut_bh6_282_282(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_283_332 <= heap_bh6_w39_32 & heap_bh6_w39_31 & heap_bh6_w39_30 & heap_bh6_w39_29;
   CompressorIn_bh6_283_333(0) <= heap_bh6_w40_33;
   Compressor_bh6_283: Compressor_14_3
      port map ( R => CompressorOut_bh6_283_283   ,
                 X0 => CompressorIn_bh6_283_332,
                 X1 => CompressorIn_bh6_283_333);
   heap_bh6_w39_34 <= CompressorOut_bh6_283_283(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w40_35 <= CompressorOut_bh6_283_283(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w41_33 <= CompressorOut_bh6_283_283(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_284_334 <= heap_bh6_w42_32 & heap_bh6_w42_31 & heap_bh6_w42_30 & heap_bh6_w42_29;
   CompressorIn_bh6_284_335(0) <= heap_bh6_w43_33;
   Compressor_bh6_284: Compressor_14_3
      port map ( R => CompressorOut_bh6_284_284   ,
                 X0 => CompressorIn_bh6_284_334,
                 X1 => CompressorIn_bh6_284_335);
   heap_bh6_w42_34 <= CompressorOut_bh6_284_284(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w43_35 <= CompressorOut_bh6_284_284(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w44_34 <= CompressorOut_bh6_284_284(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_285_336 <= heap_bh6_w45_33 & heap_bh6_w45_32 & heap_bh6_w45_31 & heap_bh6_w45_30;
   CompressorIn_bh6_285_337(0) <= heap_bh6_w46_21;
   Compressor_bh6_285: Compressor_14_3
      port map ( R => CompressorOut_bh6_285_285   ,
                 X0 => CompressorIn_bh6_285_336,
                 X1 => CompressorIn_bh6_285_337);
   heap_bh6_w45_35 <= CompressorOut_bh6_285_285(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w46_34 <= CompressorOut_bh6_285_285(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w47_34 <= CompressorOut_bh6_285_285(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_286_338 <= heap_bh6_w46_32 & heap_bh6_w46_31 & heap_bh6_w46_30 & heap_bh6_w46_29;
   CompressorIn_bh6_286_339(0) <= heap_bh6_w47_33;
   Compressor_bh6_286: Compressor_14_3
      port map ( R => CompressorOut_bh6_286_286   ,
                 X0 => CompressorIn_bh6_286_338,
                 X1 => CompressorIn_bh6_286_339);
   heap_bh6_w46_35 <= CompressorOut_bh6_286_286(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w47_35 <= CompressorOut_bh6_286_286(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w48_35 <= CompressorOut_bh6_286_286(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_287_340 <= heap_bh6_w47_32 & heap_bh6_w47_31 & heap_bh6_w47_30 & heap_bh6_w47_29;
   CompressorIn_bh6_287_341(0) <= heap_bh6_w48_34;
   Compressor_bh6_287: Compressor_14_3
      port map ( R => CompressorOut_bh6_287_287   ,
                 X0 => CompressorIn_bh6_287_340,
                 X1 => CompressorIn_bh6_287_341);
   heap_bh6_w47_36 <= CompressorOut_bh6_287_287(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w48_36 <= CompressorOut_bh6_287_287(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w49_34 <= CompressorOut_bh6_287_287(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_288_342 <= heap_bh6_w50_33 & heap_bh6_w50_32 & heap_bh6_w50_31 & heap_bh6_w50_30;
   CompressorIn_bh6_288_343(0) <= heap_bh6_w51_35;
   Compressor_bh6_288: Compressor_14_3
      port map ( R => CompressorOut_bh6_288_288   ,
                 X0 => CompressorIn_bh6_288_342,
                 X1 => CompressorIn_bh6_288_343);
   heap_bh6_w50_35 <= CompressorOut_bh6_288_288(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w51_37 <= CompressorOut_bh6_288_288(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w52_35 <= CompressorOut_bh6_288_288(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_289_344 <= heap_bh6_w53_34 & heap_bh6_w53_33 & heap_bh6_w53_32 & heap_bh6_w53_31;
   CompressorIn_bh6_289_345(0) <= heap_bh6_w54_35;
   Compressor_bh6_289: Compressor_14_3
      port map ( R => CompressorOut_bh6_289_289   ,
                 X0 => CompressorIn_bh6_289_344,
                 X1 => CompressorIn_bh6_289_345);
   heap_bh6_w53_36 <= CompressorOut_bh6_289_289(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w54_37 <= CompressorOut_bh6_289_289(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w55_35 <= CompressorOut_bh6_289_289(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_290_346 <= heap_bh6_w56_34 & heap_bh6_w56_33 & heap_bh6_w56_32 & heap_bh6_w56_31;
   CompressorIn_bh6_290_347(0) <= heap_bh6_w57_35;
   Compressor_bh6_290: Compressor_14_3
      port map ( R => CompressorOut_bh6_290_290   ,
                 X0 => CompressorIn_bh6_290_346,
                 X1 => CompressorIn_bh6_290_347);
   heap_bh6_w56_36 <= CompressorOut_bh6_290_290(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w57_37 <= CompressorOut_bh6_290_290(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w58_35 <= CompressorOut_bh6_290_290(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_291_348 <= heap_bh6_w59_34 & heap_bh6_w59_33 & heap_bh6_w59_32 & heap_bh6_w59_31;
   CompressorIn_bh6_291_349(0) <= heap_bh6_w60_35;
   Compressor_bh6_291: Compressor_14_3
      port map ( R => CompressorOut_bh6_291_291   ,
                 X0 => CompressorIn_bh6_291_348,
                 X1 => CompressorIn_bh6_291_349);
   heap_bh6_w59_36 <= CompressorOut_bh6_291_291(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w60_37 <= CompressorOut_bh6_291_291(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w61_36 <= CompressorOut_bh6_291_291(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_292_350 <= heap_bh6_w62_35 & heap_bh6_w62_34 & heap_bh6_w62_33 & heap_bh6_w62_32;
   CompressorIn_bh6_292_351(0) <= heap_bh6_w63_21;
   Compressor_bh6_292: Compressor_14_3
      port map ( R => CompressorOut_bh6_292_292   ,
                 X0 => CompressorIn_bh6_292_350,
                 X1 => CompressorIn_bh6_292_351);
   heap_bh6_w62_37 <= CompressorOut_bh6_292_292(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w63_34 <= CompressorOut_bh6_292_292(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w64_34 <= CompressorOut_bh6_292_292(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_293_352 <= heap_bh6_w63_32 & heap_bh6_w63_31 & heap_bh6_w63_30 & heap_bh6_w63_29;
   CompressorIn_bh6_293_353(0) <= heap_bh6_w64_33;
   Compressor_bh6_293: Compressor_14_3
      port map ( R => CompressorOut_bh6_293_293   ,
                 X0 => CompressorIn_bh6_293_352,
                 X1 => CompressorIn_bh6_293_353);
   heap_bh6_w63_35 <= CompressorOut_bh6_293_293(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w64_35 <= CompressorOut_bh6_293_293(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w65_33 <= CompressorOut_bh6_293_293(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_294_354 <= heap_bh6_w64_32 & heap_bh6_w64_31 & heap_bh6_w64_30 & heap_bh6_w64_29;
   CompressorIn_bh6_294_355(0) <= heap_bh6_w65_21;
   Compressor_bh6_294: Compressor_14_3
      port map ( R => CompressorOut_bh6_294_294   ,
                 X0 => CompressorIn_bh6_294_354,
                 X1 => CompressorIn_bh6_294_355);
   heap_bh6_w64_36 <= CompressorOut_bh6_294_294(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w65_34 <= CompressorOut_bh6_294_294(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w66_27 <= CompressorOut_bh6_294_294(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_295_356 <= heap_bh6_w65_32 & heap_bh6_w65_31 & heap_bh6_w65_30 & heap_bh6_w65_29;
   CompressorIn_bh6_295_357(0) <= heap_bh6_w66_17;
   Compressor_bh6_295: Compressor_14_3
      port map ( R => CompressorOut_bh6_295_295   ,
                 X0 => CompressorIn_bh6_295_356,
                 X1 => CompressorIn_bh6_295_357);
   heap_bh6_w65_35 <= CompressorOut_bh6_295_295(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w66_28 <= CompressorOut_bh6_295_295(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w67_26 <= CompressorOut_bh6_295_295(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_296_358 <= heap_bh6_w66_26 & heap_bh6_w66_25 & heap_bh6_w66_24 & heap_bh6_w66_23;
   CompressorIn_bh6_296_359(0) <= heap_bh6_w67_17;
   Compressor_bh6_296: Compressor_14_3
      port map ( R => CompressorOut_bh6_296_296   ,
                 X0 => CompressorIn_bh6_296_358,
                 X1 => CompressorIn_bh6_296_359);
   heap_bh6_w66_29 <= CompressorOut_bh6_296_296(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w67_27 <= CompressorOut_bh6_296_296(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w68_25 <= CompressorOut_bh6_296_296(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_297_360 <= heap_bh6_w69_13 & heap_bh6_w69_19 & heap_bh6_w69_18 & heap_bh6_w69_17;
   CompressorIn_bh6_297_361(0) <= heap_bh6_w70_18;
   Compressor_bh6_297: Compressor_14_3
      port map ( R => CompressorOut_bh6_297_297   ,
                 X0 => CompressorIn_bh6_297_360,
                 X1 => CompressorIn_bh6_297_361);
   heap_bh6_w69_20 <= CompressorOut_bh6_297_297(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w70_19 <= CompressorOut_bh6_297_297(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w71_18 <= CompressorOut_bh6_297_297(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_298_362 <= heap_bh6_w71_12 & heap_bh6_w71_17 & heap_bh6_w71_16 & heap_bh6_w71_15;
   CompressorIn_bh6_298_363(0) <= heap_bh6_w72_9;
   Compressor_bh6_298: Compressor_14_3
      port map ( R => CompressorOut_bh6_298_298   ,
                 X0 => CompressorIn_bh6_298_362,
                 X1 => CompressorIn_bh6_298_363);
   heap_bh6_w71_19 <= CompressorOut_bh6_298_298(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w72_13 <= CompressorOut_bh6_298_298(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w73_13 <= CompressorOut_bh6_298_298(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_299_364 <= heap_bh6_w31_32 & heap_bh6_w31_31 & heap_bh6_w31_30 & heap_bh6_w31_29;
   Compressor_bh6_299: Compressor_4_3
      port map ( R => CompressorOut_bh6_299_299   ,
                 X0 => CompressorIn_bh6_299_364);
   heap_bh6_w31_36 <= CompressorOut_bh6_299_299(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w32_34 <= CompressorOut_bh6_299_299(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w33_35 <= CompressorOut_bh6_299_299(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_300_365 <= heap_bh6_w34_32 & heap_bh6_w34_31 & heap_bh6_w34_30 & heap_bh6_w34_29;
   Compressor_bh6_300: Compressor_4_3
      port map ( R => CompressorOut_bh6_300_300   ,
                 X0 => CompressorIn_bh6_300_365);
   heap_bh6_w34_36 <= CompressorOut_bh6_300_300(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w35_34 <= CompressorOut_bh6_300_300(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w36_35 <= CompressorOut_bh6_300_300(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_301_366 <= heap_bh6_w37_32 & heap_bh6_w37_31 & heap_bh6_w37_30 & heap_bh6_w37_29;
   Compressor_bh6_301: Compressor_4_3
      port map ( R => CompressorOut_bh6_301_301   ,
                 X0 => CompressorIn_bh6_301_366);
   heap_bh6_w37_36 <= CompressorOut_bh6_301_301(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w38_34 <= CompressorOut_bh6_301_301(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w39_35 <= CompressorOut_bh6_301_301(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_302_367 <= heap_bh6_w40_32 & heap_bh6_w40_31 & heap_bh6_w40_30 & heap_bh6_w40_29;
   Compressor_bh6_302: Compressor_4_3
      port map ( R => CompressorOut_bh6_302_302   ,
                 X0 => CompressorIn_bh6_302_367);
   heap_bh6_w40_36 <= CompressorOut_bh6_302_302(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w41_34 <= CompressorOut_bh6_302_302(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w42_35 <= CompressorOut_bh6_302_302(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_303_368 <= heap_bh6_w43_32 & heap_bh6_w43_31 & heap_bh6_w43_30 & heap_bh6_w43_29;
   Compressor_bh6_303: Compressor_4_3
      port map ( R => CompressorOut_bh6_303_303   ,
                 X0 => CompressorIn_bh6_303_368);
   heap_bh6_w43_36 <= CompressorOut_bh6_303_303(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w44_35 <= CompressorOut_bh6_303_303(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w45_36 <= CompressorOut_bh6_303_303(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_304_369 <= heap_bh6_w48_33 & heap_bh6_w48_32 & heap_bh6_w48_31 & heap_bh6_w48_30;
   Compressor_bh6_304: Compressor_4_3
      port map ( R => CompressorOut_bh6_304_304   ,
                 X0 => CompressorIn_bh6_304_369);
   heap_bh6_w48_37 <= CompressorOut_bh6_304_304(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w49_35 <= CompressorOut_bh6_304_304(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w50_36 <= CompressorOut_bh6_304_304(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_305_370 <= heap_bh6_w51_34 & heap_bh6_w51_33 & heap_bh6_w51_32 & heap_bh6_w51_31;
   Compressor_bh6_305: Compressor_4_3
      port map ( R => CompressorOut_bh6_305_305   ,
                 X0 => CompressorIn_bh6_305_370);
   heap_bh6_w51_38 <= CompressorOut_bh6_305_305(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w52_36 <= CompressorOut_bh6_305_305(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w53_37 <= CompressorOut_bh6_305_305(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_306_371 <= heap_bh6_w54_34 & heap_bh6_w54_33 & heap_bh6_w54_32 & heap_bh6_w54_31;
   Compressor_bh6_306: Compressor_4_3
      port map ( R => CompressorOut_bh6_306_306   ,
                 X0 => CompressorIn_bh6_306_371);
   heap_bh6_w54_38 <= CompressorOut_bh6_306_306(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w55_36 <= CompressorOut_bh6_306_306(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w56_37 <= CompressorOut_bh6_306_306(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_307_372 <= heap_bh6_w57_34 & heap_bh6_w57_33 & heap_bh6_w57_32 & heap_bh6_w57_31;
   Compressor_bh6_307: Compressor_4_3
      port map ( R => CompressorOut_bh6_307_307   ,
                 X0 => CompressorIn_bh6_307_372);
   heap_bh6_w57_38 <= CompressorOut_bh6_307_307(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w58_36 <= CompressorOut_bh6_307_307(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w59_37 <= CompressorOut_bh6_307_307(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_308_373 <= heap_bh6_w60_34 & heap_bh6_w60_33 & heap_bh6_w60_32 & heap_bh6_w60_31;
   Compressor_bh6_308: Compressor_4_3
      port map ( R => CompressorOut_bh6_308_308   ,
                 X0 => CompressorIn_bh6_308_373);
   heap_bh6_w60_38 <= CompressorOut_bh6_308_308(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w61_37 <= CompressorOut_bh6_308_308(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w62_38 <= CompressorOut_bh6_308_308(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_309_374 <= heap_bh6_w12_15 & heap_bh6_w12_14 & heap_bh6_w12_13;
   CompressorIn_bh6_309_375 <= heap_bh6_w13_14 & heap_bh6_w13_13;
   Compressor_bh6_309: Compressor_23_3
      port map ( R => CompressorOut_bh6_309_309   ,
                 X0 => CompressorIn_bh6_309_374,
                 X1 => CompressorIn_bh6_309_375);
   heap_bh6_w12_16 <= CompressorOut_bh6_309_309(0); -- cycle= 0 cp= 2.15776e-09
   heap_bh6_w13_15 <= CompressorOut_bh6_309_309(1); -- cycle= 0 cp= 2.15776e-09
   heap_bh6_w14_18 <= CompressorOut_bh6_309_309(2); -- cycle= 0 cp= 2.15776e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_310_376 <= heap_bh6_w14_17 & heap_bh6_w14_16 & heap_bh6_w14_15;
   CompressorIn_bh6_310_377 <= heap_bh6_w15_17 & heap_bh6_w15_16;
   Compressor_bh6_310: Compressor_23_3
      port map ( R => CompressorOut_bh6_310_310   ,
                 X0 => CompressorIn_bh6_310_376,
                 X1 => CompressorIn_bh6_310_377);
   heap_bh6_w14_19 <= CompressorOut_bh6_310_310(0); -- cycle= 0 cp= 2.15776e-09
   heap_bh6_w15_19 <= CompressorOut_bh6_310_310(1); -- cycle= 0 cp= 2.15776e-09
   heap_bh6_w16_20 <= CompressorOut_bh6_310_310(2); -- cycle= 0 cp= 2.15776e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_311_378 <= heap_bh6_w16_18 & heap_bh6_w16_19 & heap_bh6_w16_17;
   CompressorIn_bh6_311_379 <= heap_bh6_w17_20 & heap_bh6_w17_19;
   Compressor_bh6_311: Compressor_23_3
      port map ( R => CompressorOut_bh6_311_311   ,
                 X0 => CompressorIn_bh6_311_378,
                 X1 => CompressorIn_bh6_311_379);
   heap_bh6_w16_21 <= CompressorOut_bh6_311_311(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w17_21 <= CompressorOut_bh6_311_311(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w18_23 <= CompressorOut_bh6_311_311(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_312_380 <= heap_bh6_w67_25 & heap_bh6_w67_24 & heap_bh6_w67_23;
   CompressorIn_bh6_312_381 <= heap_bh6_w68_24 & heap_bh6_w68_23;
   Compressor_bh6_312: Compressor_23_3
      port map ( R => CompressorOut_bh6_312_312   ,
                 X0 => CompressorIn_bh6_312_380,
                 X1 => CompressorIn_bh6_312_381);
   heap_bh6_w67_28 <= CompressorOut_bh6_312_312(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w68_26 <= CompressorOut_bh6_312_312(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w69_21 <= CompressorOut_bh6_312_312(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_313_382 <= heap_bh6_w72_8 & heap_bh6_w72_12 & heap_bh6_w72_11;
   CompressorIn_bh6_313_383 <= heap_bh6_w73_12 & heap_bh6_w73_11;
   Compressor_bh6_313: Compressor_23_3
      port map ( R => CompressorOut_bh6_313_313   ,
                 X0 => CompressorIn_bh6_313_382,
                 X1 => CompressorIn_bh6_313_383);
   heap_bh6_w72_14 <= CompressorOut_bh6_313_313(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w73_14 <= CompressorOut_bh6_313_313(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w74_12 <= CompressorOut_bh6_313_313(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_314_384 <= heap_bh6_w19_21 & heap_bh6_w19_20 & heap_bh6_w19_19;
   CompressorIn_bh6_314_385(0) <= heap_bh6_w20_20;
   Compressor_bh6_314: Compressor_13_3
      port map ( R => CompressorOut_bh6_314_314   ,
                 X0 => CompressorIn_bh6_314_384,
                 X1 => CompressorIn_bh6_314_385);
   heap_bh6_w19_23 <= CompressorOut_bh6_314_314(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w20_25 <= CompressorOut_bh6_314_314(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w21_26 <= CompressorOut_bh6_314_314(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_315_386 <= heap_bh6_w21_24 & heap_bh6_w21_23 & heap_bh6_w21_22;
   CompressorIn_bh6_315_387(0) <= heap_bh6_w22_22;
   Compressor_bh6_315: Compressor_13_3
      port map ( R => CompressorOut_bh6_315_315   ,
                 X0 => CompressorIn_bh6_315_386,
                 X1 => CompressorIn_bh6_315_387);
   heap_bh6_w21_27 <= CompressorOut_bh6_315_315(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w22_27 <= CompressorOut_bh6_315_315(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w23_29 <= CompressorOut_bh6_315_315(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_316_388 <= heap_bh6_w25_28 & heap_bh6_w25_27 & heap_bh6_w25_26;
   CompressorIn_bh6_316_389(0) <= heap_bh6_w26_27;
   Compressor_bh6_316: Compressor_13_3
      port map ( R => CompressorOut_bh6_316_316   ,
                 X0 => CompressorIn_bh6_316_388,
                 X1 => CompressorIn_bh6_316_389);
   heap_bh6_w25_32 <= CompressorOut_bh6_316_316(0); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w26_33 <= CompressorOut_bh6_316_316(1); -- cycle= 0 cp= 2.18392e-09
   heap_bh6_w27_35 <= CompressorOut_bh6_316_316(2); -- cycle= 0 cp= 2.18392e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_317_390 <= heap_bh6_w45_29 & heap_bh6_w45_36 & heap_bh6_w45_35 & heap_bh6_w45_34 & heap_bh6_w45_19 & heap_bh6_w45_18;
   Compressor_bh6_317: Compressor_6_3
      port map ( R => CompressorOut_bh6_317_317   ,
                 X0 => CompressorIn_bh6_317_390);
   heap_bh6_w45_37 <= CompressorOut_bh6_317_317(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w46_36 <= CompressorOut_bh6_317_317(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w47_37 <= CompressorOut_bh6_317_317(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_318_391 <= heap_bh6_w50_29 & heap_bh6_w50_36 & heap_bh6_w50_35 & heap_bh6_w50_34 & heap_bh6_w50_19 & heap_bh6_w50_18;
   Compressor_bh6_318: Compressor_6_3
      port map ( R => CompressorOut_bh6_318_318   ,
                 X0 => CompressorIn_bh6_318_391);
   heap_bh6_w50_37 <= CompressorOut_bh6_318_318(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w51_39 <= CompressorOut_bh6_318_318(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w52_37 <= CompressorOut_bh6_318_318(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_319_392 <= heap_bh6_w51_38 & heap_bh6_w51_37 & heap_bh6_w51_36 & heap_bh6_w51_21 & heap_bh6_w51_20 & heap_bh6_w51_19;
   Compressor_bh6_319: Compressor_6_3
      port map ( R => CompressorOut_bh6_319_319   ,
                 X0 => CompressorIn_bh6_319_392);
   heap_bh6_w51_40 <= CompressorOut_bh6_319_319(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w52_38 <= CompressorOut_bh6_319_319(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w53_38 <= CompressorOut_bh6_319_319(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_320_393 <= heap_bh6_w52_36 & heap_bh6_w52_35 & heap_bh6_w52_34 & heap_bh6_w52_20 & heap_bh6_w52_19 & heap_bh6_w52_18;
   Compressor_bh6_320: Compressor_6_3
      port map ( R => CompressorOut_bh6_320_320   ,
                 X0 => CompressorIn_bh6_320_393);
   heap_bh6_w52_39 <= CompressorOut_bh6_320_320(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w53_39 <= CompressorOut_bh6_320_320(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w54_39 <= CompressorOut_bh6_320_320(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_321_394 <= heap_bh6_w53_30 & heap_bh6_w53_37 & heap_bh6_w53_36 & heap_bh6_w53_35 & heap_bh6_w53_20 & heap_bh6_w53_19;
   Compressor_bh6_321: Compressor_6_3
      port map ( R => CompressorOut_bh6_321_321   ,
                 X0 => CompressorIn_bh6_321_394);
   heap_bh6_w53_40 <= CompressorOut_bh6_321_321(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w54_40 <= CompressorOut_bh6_321_321(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w55_37 <= CompressorOut_bh6_321_321(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_322_395 <= heap_bh6_w54_38 & heap_bh6_w54_37 & heap_bh6_w54_36 & heap_bh6_w54_21 & heap_bh6_w54_20 & heap_bh6_w54_19;
   Compressor_bh6_322: Compressor_6_3
      port map ( R => CompressorOut_bh6_322_322   ,
                 X0 => CompressorIn_bh6_322_395);
   heap_bh6_w54_41 <= CompressorOut_bh6_322_322(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w55_38 <= CompressorOut_bh6_322_322(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w56_38 <= CompressorOut_bh6_322_322(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_323_396 <= heap_bh6_w55_36 & heap_bh6_w55_35 & heap_bh6_w55_34 & heap_bh6_w55_20 & heap_bh6_w55_19 & heap_bh6_w55_18;
   Compressor_bh6_323: Compressor_6_3
      port map ( R => CompressorOut_bh6_323_323   ,
                 X0 => CompressorIn_bh6_323_396);
   heap_bh6_w55_39 <= CompressorOut_bh6_323_323(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w56_39 <= CompressorOut_bh6_323_323(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w57_39 <= CompressorOut_bh6_323_323(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_324_397 <= heap_bh6_w56_30 & heap_bh6_w56_37 & heap_bh6_w56_36 & heap_bh6_w56_35 & heap_bh6_w56_20 & heap_bh6_w56_19;
   Compressor_bh6_324: Compressor_6_3
      port map ( R => CompressorOut_bh6_324_324   ,
                 X0 => CompressorIn_bh6_324_397);
   heap_bh6_w56_40 <= CompressorOut_bh6_324_324(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w57_40 <= CompressorOut_bh6_324_324(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w58_37 <= CompressorOut_bh6_324_324(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_325_398 <= heap_bh6_w57_38 & heap_bh6_w57_37 & heap_bh6_w57_36 & heap_bh6_w57_21 & heap_bh6_w57_20 & heap_bh6_w57_19;
   Compressor_bh6_325: Compressor_6_3
      port map ( R => CompressorOut_bh6_325_325   ,
                 X0 => CompressorIn_bh6_325_398);
   heap_bh6_w57_41 <= CompressorOut_bh6_325_325(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w58_38 <= CompressorOut_bh6_325_325(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w59_38 <= CompressorOut_bh6_325_325(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_326_399 <= heap_bh6_w58_36 & heap_bh6_w58_35 & heap_bh6_w58_34 & heap_bh6_w58_20 & heap_bh6_w58_19 & heap_bh6_w58_18;
   Compressor_bh6_326: Compressor_6_3
      port map ( R => CompressorOut_bh6_326_326   ,
                 X0 => CompressorIn_bh6_326_399);
   heap_bh6_w58_39 <= CompressorOut_bh6_326_326(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w59_39 <= CompressorOut_bh6_326_326(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w60_39 <= CompressorOut_bh6_326_326(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_327_400 <= heap_bh6_w59_30 & heap_bh6_w59_37 & heap_bh6_w59_36 & heap_bh6_w59_35 & heap_bh6_w59_20 & heap_bh6_w59_19;
   Compressor_bh6_327: Compressor_6_3
      port map ( R => CompressorOut_bh6_327_327   ,
                 X0 => CompressorIn_bh6_327_400);
   heap_bh6_w59_40 <= CompressorOut_bh6_327_327(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w60_40 <= CompressorOut_bh6_327_327(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w61_38 <= CompressorOut_bh6_327_327(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_328_401 <= heap_bh6_w60_38 & heap_bh6_w60_37 & heap_bh6_w60_36 & heap_bh6_w60_21 & heap_bh6_w60_20 & heap_bh6_w60_19;
   Compressor_bh6_328: Compressor_6_3
      port map ( R => CompressorOut_bh6_328_328   ,
                 X0 => CompressorIn_bh6_328_401);
   heap_bh6_w60_41 <= CompressorOut_bh6_328_328(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w61_39 <= CompressorOut_bh6_328_328(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w62_39 <= CompressorOut_bh6_328_328(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_329_402 <= heap_bh6_w61_37 & heap_bh6_w61_36 & heap_bh6_w61_35 & heap_bh6_w61_21 & heap_bh6_w61_20 & heap_bh6_w61_19;
   Compressor_bh6_329: Compressor_6_3
      port map ( R => CompressorOut_bh6_329_329   ,
                 X0 => CompressorIn_bh6_329_402);
   heap_bh6_w61_40 <= CompressorOut_bh6_329_329(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w62_40 <= CompressorOut_bh6_329_329(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w63_36 <= CompressorOut_bh6_329_329(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_330_403 <= heap_bh6_w62_31 & heap_bh6_w62_38 & heap_bh6_w62_37 & heap_bh6_w62_36 & heap_bh6_w62_21 & heap_bh6_w62_20;
   Compressor_bh6_330: Compressor_6_3
      port map ( R => CompressorOut_bh6_330_330   ,
                 X0 => CompressorIn_bh6_330_403);
   heap_bh6_w62_41 <= CompressorOut_bh6_330_330(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w63_37 <= CompressorOut_bh6_330_330(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w64_37 <= CompressorOut_bh6_330_330(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_331_404 <= heap_bh6_w63_35 & heap_bh6_w63_34 & heap_bh6_w63_33 & heap_bh6_w63_19 & heap_bh6_w63_18 & heap_bh6_w63_17;
   Compressor_bh6_331: Compressor_6_3
      port map ( R => CompressorOut_bh6_331_331   ,
                 X0 => CompressorIn_bh6_331_404);
   heap_bh6_w63_38 <= CompressorOut_bh6_331_331(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w64_38 <= CompressorOut_bh6_331_331(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w65_36 <= CompressorOut_bh6_331_331(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_332_405 <= heap_bh6_w64_36 & heap_bh6_w64_35 & heap_bh6_w64_34 & heap_bh6_w64_19 & heap_bh6_w64_18 & heap_bh6_w64_17;
   Compressor_bh6_332: Compressor_6_3
      port map ( R => CompressorOut_bh6_332_332   ,
                 X0 => CompressorIn_bh6_332_405);
   heap_bh6_w64_39 <= CompressorOut_bh6_332_332(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w65_37 <= CompressorOut_bh6_332_332(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w66_30 <= CompressorOut_bh6_332_332(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_333_406 <= heap_bh6_w65_35 & heap_bh6_w65_34 & heap_bh6_w65_33 & heap_bh6_w65_19 & heap_bh6_w65_18 & heap_bh6_w65_17;
   Compressor_bh6_333: Compressor_6_3
      port map ( R => CompressorOut_bh6_333_333   ,
                 X0 => CompressorIn_bh6_333_406);
   heap_bh6_w65_38 <= CompressorOut_bh6_333_333(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w66_31 <= CompressorOut_bh6_333_333(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w67_29 <= CompressorOut_bh6_333_333(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_334_407 <= heap_bh6_w66_29 & heap_bh6_w66_28 & heap_bh6_w66_27 & heap_bh6_w66_15 & heap_bh6_w66_14 & heap_bh6_w66_13;
   Compressor_bh6_334: Compressor_6_3
      port map ( R => CompressorOut_bh6_334_334   ,
                 X0 => CompressorIn_bh6_334_407);
   heap_bh6_w66_32 <= CompressorOut_bh6_334_334(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w67_30 <= CompressorOut_bh6_334_334(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w68_27 <= CompressorOut_bh6_334_334(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_335_408 <= heap_bh6_w67_28 & heap_bh6_w67_27 & heap_bh6_w67_26 & heap_bh6_w67_15 & heap_bh6_w67_14 & heap_bh6_w67_13;
   Compressor_bh6_335: Compressor_6_3
      port map ( R => CompressorOut_bh6_335_335   ,
                 X0 => CompressorIn_bh6_335_408);
   heap_bh6_w67_31 <= CompressorOut_bh6_335_335(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w68_28 <= CompressorOut_bh6_335_335(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w69_22 <= CompressorOut_bh6_335_335(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_336_409 <= heap_bh6_w68_22 & heap_bh6_w68_26 & heap_bh6_w68_25 & heap_bh6_w68_15 & heap_bh6_w68_14 & heap_bh6_w68_13;
   Compressor_bh6_336: Compressor_6_3
      port map ( R => CompressorOut_bh6_336_336   ,
                 X0 => CompressorIn_bh6_336_409);
   heap_bh6_w68_29 <= CompressorOut_bh6_336_336(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w69_23 <= CompressorOut_bh6_336_336(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w70_20 <= CompressorOut_bh6_336_336(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_337_410 <= heap_bh6_w69_21 & heap_bh6_w69_20 & heap_bh6_w69_11 & heap_bh6_w69_10 & heap_bh6_w69_9 & heap_bh6_w69_8;
   Compressor_bh6_337: Compressor_6_3
      port map ( R => CompressorOut_bh6_337_337   ,
                 X0 => CompressorIn_bh6_337_410);
   heap_bh6_w69_24 <= CompressorOut_bh6_337_337(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w70_21 <= CompressorOut_bh6_337_337(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w71_20 <= CompressorOut_bh6_337_337(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_338_411 <= heap_bh6_w70_17 & heap_bh6_w70_16 & heap_bh6_w70_19 & heap_bh6_w70_11 & heap_bh6_w70_10 & heap_bh6_w70_9;
   Compressor_bh6_338: Compressor_6_3
      port map ( R => CompressorOut_bh6_338_338   ,
                 X0 => CompressorIn_bh6_338_411);
   heap_bh6_w70_22 <= CompressorOut_bh6_338_338(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w71_21 <= CompressorOut_bh6_338_338(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w72_15 <= CompressorOut_bh6_338_338(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_339_412 <= heap_bh6_w71_19 & heap_bh6_w71_18 & heap_bh6_w71_11 & heap_bh6_w71_10 & heap_bh6_w71_9 & heap_bh6_w71_8;
   Compressor_bh6_339: Compressor_6_3
      port map ( R => CompressorOut_bh6_339_339   ,
                 X0 => CompressorIn_bh6_339_412);
   heap_bh6_w71_22 <= CompressorOut_bh6_339_339(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w72_16 <= CompressorOut_bh6_339_339(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w73_15 <= CompressorOut_bh6_339_339(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_340_413 <= heap_bh6_w72_14 & heap_bh6_w72_13 & heap_bh6_w72_7 & heap_bh6_w72_6 & heap_bh6_w72_5 & heap_bh6_w72_4;
   Compressor_bh6_340: Compressor_6_3
      port map ( R => CompressorOut_bh6_340_340   ,
                 X0 => CompressorIn_bh6_340_413);
   heap_bh6_w72_17 <= CompressorOut_bh6_340_340(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w73_16 <= CompressorOut_bh6_340_340(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w74_13 <= CompressorOut_bh6_340_340(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_341_414 <= heap_bh6_w73_14 & heap_bh6_w73_13 & heap_bh6_w73_7 & heap_bh6_w73_6 & heap_bh6_w73_5 & heap_bh6_w73_4;
   Compressor_bh6_341: Compressor_6_3
      port map ( R => CompressorOut_bh6_341_341   ,
                 X0 => CompressorIn_bh6_341_414);
   heap_bh6_w73_17 <= CompressorOut_bh6_341_341(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w74_14 <= CompressorOut_bh6_341_341(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w75_7 <= CompressorOut_bh6_341_341(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_342_415 <= heap_bh6_w74_8 & heap_bh6_w74_11 & heap_bh6_w74_12 & heap_bh6_w74_7 & heap_bh6_w74_6 & heap_bh6_w74_5;
   Compressor_bh6_342: Compressor_6_3
      port map ( R => CompressorOut_bh6_342_342   ,
                 X0 => CompressorIn_bh6_342_415);
   heap_bh6_w74_15 <= CompressorOut_bh6_342_342(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w75_8 <= CompressorOut_bh6_342_342(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w76_6 <= CompressorOut_bh6_342_342(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_343_416 <= heap_bh6_w75_5 & heap_bh6_w75_6 & heap_bh6_w75_4 & heap_bh6_w75_3 & heap_bh6_w75_2 & heap_bh6_w75_1;
   Compressor_bh6_343: Compressor_6_3
      port map ( R => CompressorOut_bh6_343_343   ,
                 X0 => CompressorIn_bh6_343_416);
   heap_bh6_w75_9 <= CompressorOut_bh6_343_343(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w76_7 <= CompressorOut_bh6_343_343(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w77_5 <= CompressorOut_bh6_343_343(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_344_417 <= heap_bh6_w76_0 & heap_bh6_w76_5 & heap_bh6_w76_4 & heap_bh6_w76_3 & heap_bh6_w76_2 & heap_bh6_w76_1;
   Compressor_bh6_344: Compressor_6_3
      port map ( R => CompressorOut_bh6_344_344   ,
                 X0 => CompressorIn_bh6_344_417);
   heap_bh6_w76_8 <= CompressorOut_bh6_344_344(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w77_6 <= CompressorOut_bh6_344_344(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w78_4 <= CompressorOut_bh6_344_344(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_345_418 <= heap_bh6_w27_35 & heap_bh6_w27_34 & heap_bh6_w27_33 & heap_bh6_w27_18;
   CompressorIn_bh6_345_419(0) <= heap_bh6_w28_34;
   Compressor_bh6_345: Compressor_14_3
      port map ( R => CompressorOut_bh6_345_345   ,
                 X0 => CompressorIn_bh6_345_418,
                 X1 => CompressorIn_bh6_345_419);
   heap_bh6_w27_36 <= CompressorOut_bh6_345_345(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w28_35 <= CompressorOut_bh6_345_345(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w29_36 <= CompressorOut_bh6_345_345(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_346_420 <= heap_bh6_w29_35 & heap_bh6_w29_34 & heap_bh6_w29_33 & heap_bh6_w29_18;
   CompressorIn_bh6_346_421(0) <= heap_bh6_w30_34;
   Compressor_bh6_346: Compressor_14_3
      port map ( R => CompressorOut_bh6_346_346   ,
                 X0 => CompressorIn_bh6_346_420,
                 X1 => CompressorIn_bh6_346_421);
   heap_bh6_w29_37 <= CompressorOut_bh6_346_346(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w30_35 <= CompressorOut_bh6_346_346(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w31_37 <= CompressorOut_bh6_346_346(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_347_422 <= heap_bh6_w31_36 & heap_bh6_w31_35 & heap_bh6_w31_34 & heap_bh6_w31_19;
   CompressorIn_bh6_347_423(0) <= heap_bh6_w32_34;
   Compressor_bh6_347: Compressor_14_3
      port map ( R => CompressorOut_bh6_347_347   ,
                 X0 => CompressorIn_bh6_347_422,
                 X1 => CompressorIn_bh6_347_423);
   heap_bh6_w31_38 <= CompressorOut_bh6_347_347(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w32_35 <= CompressorOut_bh6_347_347(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w33_36 <= CompressorOut_bh6_347_347(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_348_424 <= heap_bh6_w33_28 & heap_bh6_w33_35 & heap_bh6_w33_34 & heap_bh6_w33_33;
   CompressorIn_bh6_348_425(0) <= heap_bh6_w34_36;
   Compressor_bh6_348: Compressor_14_3
      port map ( R => CompressorOut_bh6_348_348   ,
                 X0 => CompressorIn_bh6_348_424,
                 X1 => CompressorIn_bh6_348_425);
   heap_bh6_w33_37 <= CompressorOut_bh6_348_348(0); -- cycle= 0 cp= 2.71464e-09
   heap_bh6_w34_37 <= CompressorOut_bh6_348_348(1); -- cycle= 0 cp= 2.71464e-09
   heap_bh6_w35_35 <= CompressorOut_bh6_348_348(2); -- cycle= 0 cp= 2.71464e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_349_426 <= heap_bh6_w35_34 & heap_bh6_w35_33 & heap_bh6_w35_32 & heap_bh6_w35_18;
   CompressorIn_bh6_349_427(0) <= heap_bh6_w36_28;
   Compressor_bh6_349: Compressor_14_3
      port map ( R => CompressorOut_bh6_349_349   ,
                 X0 => CompressorIn_bh6_349_426,
                 X1 => CompressorIn_bh6_349_427);
   heap_bh6_w35_36 <= CompressorOut_bh6_349_349(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w36_36 <= CompressorOut_bh6_349_349(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w37_37 <= CompressorOut_bh6_349_349(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_350_428 <= heap_bh6_w36_35 & heap_bh6_w36_34 & heap_bh6_w36_33 & heap_bh6_w36_18;
   CompressorIn_bh6_350_429(0) <= heap_bh6_w37_36;
   Compressor_bh6_350: Compressor_14_3
      port map ( R => CompressorOut_bh6_350_350   ,
                 X0 => CompressorIn_bh6_350_428,
                 X1 => CompressorIn_bh6_350_429);
   heap_bh6_w36_37 <= CompressorOut_bh6_350_350(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w37_38 <= CompressorOut_bh6_350_350(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w38_35 <= CompressorOut_bh6_350_350(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_351_430 <= heap_bh6_w38_34 & heap_bh6_w38_33 & heap_bh6_w38_32 & heap_bh6_w38_18;
   CompressorIn_bh6_351_431(0) <= heap_bh6_w39_28;
   Compressor_bh6_351: Compressor_14_3
      port map ( R => CompressorOut_bh6_351_351   ,
                 X0 => CompressorIn_bh6_351_430,
                 X1 => CompressorIn_bh6_351_431);
   heap_bh6_w38_36 <= CompressorOut_bh6_351_351(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w39_36 <= CompressorOut_bh6_351_351(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w40_37 <= CompressorOut_bh6_351_351(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_352_432 <= heap_bh6_w39_35 & heap_bh6_w39_34 & heap_bh6_w39_33 & heap_bh6_w39_18;
   CompressorIn_bh6_352_433(0) <= heap_bh6_w40_36;
   Compressor_bh6_352: Compressor_14_3
      port map ( R => CompressorOut_bh6_352_352   ,
                 X0 => CompressorIn_bh6_352_432,
                 X1 => CompressorIn_bh6_352_433);
   heap_bh6_w39_37 <= CompressorOut_bh6_352_352(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w40_38 <= CompressorOut_bh6_352_352(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w41_35 <= CompressorOut_bh6_352_352(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_353_434 <= heap_bh6_w41_34 & heap_bh6_w41_33 & heap_bh6_w41_32 & heap_bh6_w41_18;
   CompressorIn_bh6_353_435(0) <= heap_bh6_w42_28;
   Compressor_bh6_353: Compressor_14_3
      port map ( R => CompressorOut_bh6_353_353   ,
                 X0 => CompressorIn_bh6_353_434,
                 X1 => CompressorIn_bh6_353_435);
   heap_bh6_w41_36 <= CompressorOut_bh6_353_353(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w42_36 <= CompressorOut_bh6_353_353(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w43_37 <= CompressorOut_bh6_353_353(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_354_436 <= heap_bh6_w42_35 & heap_bh6_w42_34 & heap_bh6_w42_33 & heap_bh6_w42_18;
   CompressorIn_bh6_354_437(0) <= heap_bh6_w43_36;
   Compressor_bh6_354: Compressor_14_3
      port map ( R => CompressorOut_bh6_354_354   ,
                 X0 => CompressorIn_bh6_354_436,
                 X1 => CompressorIn_bh6_354_437);
   heap_bh6_w42_37 <= CompressorOut_bh6_354_354(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w43_38 <= CompressorOut_bh6_354_354(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w44_36 <= CompressorOut_bh6_354_354(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_355_438 <= heap_bh6_w46_35 & heap_bh6_w46_34 & heap_bh6_w46_33 & heap_bh6_w46_19;
   CompressorIn_bh6_355_439(0) <= heap_bh6_w47_36;
   Compressor_bh6_355: Compressor_14_3
      port map ( R => CompressorOut_bh6_355_355   ,
                 X0 => CompressorIn_bh6_355_438,
                 X1 => CompressorIn_bh6_355_439);
   heap_bh6_w46_37 <= CompressorOut_bh6_355_355(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w47_38 <= CompressorOut_bh6_355_355(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w48_38 <= CompressorOut_bh6_355_355(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_356_440 <= heap_bh6_w47_35 & heap_bh6_w47_34 & heap_bh6_w47_19 & heap_bh6_w47_18;
   CompressorIn_bh6_356_441(0) <= heap_bh6_w48_37;
   Compressor_bh6_356: Compressor_14_3
      port map ( R => CompressorOut_bh6_356_356   ,
                 X0 => CompressorIn_bh6_356_440,
                 X1 => CompressorIn_bh6_356_441);
   heap_bh6_w47_39 <= CompressorOut_bh6_356_356(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w48_39 <= CompressorOut_bh6_356_356(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w49_36 <= CompressorOut_bh6_356_356(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_357_442 <= heap_bh6_w48_36 & heap_bh6_w48_35 & heap_bh6_w48_20 & heap_bh6_w48_19;
   CompressorIn_bh6_357_443(0) <= heap_bh6_w49_35;
   Compressor_bh6_357: Compressor_14_3
      port map ( R => CompressorOut_bh6_357_357   ,
                 X0 => CompressorIn_bh6_357_442,
                 X1 => CompressorIn_bh6_357_443);
   heap_bh6_w48_40 <= CompressorOut_bh6_357_357(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w49_37 <= CompressorOut_bh6_357_357(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w50_38 <= CompressorOut_bh6_357_357(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_358_444 <= heap_bh6_w77_0 & heap_bh6_w77_4 & heap_bh6_w77_3 & heap_bh6_w77_2;
   CompressorIn_bh6_358_445(0) <= heap_bh6_w78_3;
   Compressor_bh6_358: Compressor_14_3
      port map ( R => CompressorOut_bh6_358_358   ,
                 X0 => CompressorIn_bh6_358_444,
                 X1 => CompressorIn_bh6_358_445);
   heap_bh6_w77_7 <= CompressorOut_bh6_358_358(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w78_5 <= CompressorOut_bh6_358_358(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w79_4 <= CompressorOut_bh6_358_358(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_359_446 <= heap_bh6_w79_3 & heap_bh6_w79_2 & heap_bh6_w79_1 & heap_bh6_w79_0;
   CompressorIn_bh6_359_447(0) <= heap_bh6_w80_3;
   Compressor_bh6_359: Compressor_14_3
      port map ( R => CompressorOut_bh6_359_359   ,
                 X0 => CompressorIn_bh6_359_446,
                 X1 => CompressorIn_bh6_359_447);
   heap_bh6_w79_5 <= CompressorOut_bh6_359_359(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w80_4 <= CompressorOut_bh6_359_359(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w81_4 <= CompressorOut_bh6_359_359(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_360_448 <= heap_bh6_w81_3 & heap_bh6_w81_2 & heap_bh6_w81_1 & heap_bh6_w81_0;
   CompressorIn_bh6_360_449(0) <= heap_bh6_w82_3;
   Compressor_bh6_360: Compressor_14_3
      port map ( R => CompressorOut_bh6_360_360   ,
                 X0 => CompressorIn_bh6_360_448,
                 X1 => CompressorIn_bh6_360_449);
   heap_bh6_w81_5 <= CompressorOut_bh6_360_360(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w82_4 <= CompressorOut_bh6_360_360(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w83_4 <= CompressorOut_bh6_360_360(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_361_450 <= heap_bh6_w83_3 & heap_bh6_w83_2 & heap_bh6_w83_1 & heap_bh6_w83_0;
   CompressorIn_bh6_361_451(0) <= heap_bh6_w84_3;
   Compressor_bh6_361: Compressor_14_3
      port map ( R => CompressorOut_bh6_361_361   ,
                 X0 => CompressorIn_bh6_361_450,
                 X1 => CompressorIn_bh6_361_451);
   heap_bh6_w83_5 <= CompressorOut_bh6_361_361(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w84_4 <= CompressorOut_bh6_361_361(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w85_4 <= CompressorOut_bh6_361_361(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_362_452 <= heap_bh6_w85_3 & heap_bh6_w85_2 & heap_bh6_w85_1 & heap_bh6_w85_0;
   CompressorIn_bh6_362_453(0) <= heap_bh6_w86_3;
   Compressor_bh6_362: Compressor_14_3
      port map ( R => CompressorOut_bh6_362_362   ,
                 X0 => CompressorIn_bh6_362_452,
                 X1 => CompressorIn_bh6_362_453);
   heap_bh6_w85_5 <= CompressorOut_bh6_362_362(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w86_4 <= CompressorOut_bh6_362_362(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w87_4 <= CompressorOut_bh6_362_362(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_363_454 <= heap_bh6_w87_3 & heap_bh6_w87_2 & heap_bh6_w87_1 & heap_bh6_w87_0;
   CompressorIn_bh6_363_455(0) <= heap_bh6_w88_3;
   Compressor_bh6_363: Compressor_14_3
      port map ( R => CompressorOut_bh6_363_363   ,
                 X0 => CompressorIn_bh6_363_454,
                 X1 => CompressorIn_bh6_363_455);
   heap_bh6_w87_5 <= CompressorOut_bh6_363_363(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w88_4 <= CompressorOut_bh6_363_363(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w89_4 <= CompressorOut_bh6_363_363(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_364_456 <= heap_bh6_w89_3 & heap_bh6_w89_2 & heap_bh6_w89_1 & heap_bh6_w89_0;
   CompressorIn_bh6_364_457(0) <= heap_bh6_w90_3;
   Compressor_bh6_364: Compressor_14_3
      port map ( R => CompressorOut_bh6_364_364   ,
                 X0 => CompressorIn_bh6_364_456,
                 X1 => CompressorIn_bh6_364_457);
   heap_bh6_w89_5 <= CompressorOut_bh6_364_364(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w90_4 <= CompressorOut_bh6_364_364(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w91_4 <= CompressorOut_bh6_364_364(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_365_458 <= heap_bh6_w91_3 & heap_bh6_w91_2 & heap_bh6_w91_1 & heap_bh6_w91_0;
   CompressorIn_bh6_365_459(0) <= heap_bh6_w92_2;
   Compressor_bh6_365: Compressor_14_3
      port map ( R => CompressorOut_bh6_365_365   ,
                 X0 => CompressorIn_bh6_365_458,
                 X1 => CompressorIn_bh6_365_459);
   heap_bh6_w91_5 <= CompressorOut_bh6_365_365(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w92_3 <= CompressorOut_bh6_365_365(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w93_3 <= CompressorOut_bh6_365_365(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_366_460 <= heap_bh6_w44_35 & heap_bh6_w44_34 & heap_bh6_w44_33 & heap_bh6_w44_19 & heap_bh6_w44_18;
   Compressor_bh6_366: Compressor_5_3
      port map ( R => CompressorOut_bh6_366_366   ,
                 X0 => CompressorIn_bh6_366_460);
   heap_bh6_w44_37 <= CompressorOut_bh6_366_366(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w45_38 <= CompressorOut_bh6_366_366(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w46_38 <= CompressorOut_bh6_366_366(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_367_461 <= heap_bh6_w49_34 & heap_bh6_w49_33 & heap_bh6_w49_19 & heap_bh6_w49_18;
   Compressor_bh6_367: Compressor_4_3
      port map ( R => CompressorOut_bh6_367_367   ,
                 X0 => CompressorIn_bh6_367_461);
   heap_bh6_w49_38 <= CompressorOut_bh6_367_367(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w50_39 <= CompressorOut_bh6_367_367(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w51_41 <= CompressorOut_bh6_367_367(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_368_462 <= heap_bh6_w20_25 & heap_bh6_w20_24 & heap_bh6_w20_23;
   CompressorIn_bh6_368_463 <= heap_bh6_w21_27 & heap_bh6_w21_26;
   Compressor_bh6_368: Compressor_23_3
      port map ( R => CompressorOut_bh6_368_368   ,
                 X0 => CompressorIn_bh6_368_462,
                 X1 => CompressorIn_bh6_368_463);
   heap_bh6_w20_26 <= CompressorOut_bh6_368_368(0); -- cycle= 0 cp= 2.71464e-09
   heap_bh6_w21_28 <= CompressorOut_bh6_368_368(1); -- cycle= 0 cp= 2.71464e-09
   heap_bh6_w22_28 <= CompressorOut_bh6_368_368(2); -- cycle= 0 cp= 2.71464e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_369_464 <= heap_bh6_w22_27 & heap_bh6_w22_26 & heap_bh6_w22_25;
   CompressorIn_bh6_369_465 <= heap_bh6_w23_29 & heap_bh6_w23_28;
   Compressor_bh6_369: Compressor_23_3
      port map ( R => CompressorOut_bh6_369_369   ,
                 X0 => CompressorIn_bh6_369_464,
                 X1 => CompressorIn_bh6_369_465);
   heap_bh6_w22_29 <= CompressorOut_bh6_369_369(0); -- cycle= 0 cp= 2.71464e-09
   heap_bh6_w23_30 <= CompressorOut_bh6_369_369(1); -- cycle= 0 cp= 2.71464e-09
   heap_bh6_w24_31 <= CompressorOut_bh6_369_369(2); -- cycle= 0 cp= 2.71464e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_370_466 <= heap_bh6_w24_30 & heap_bh6_w24_29 & heap_bh6_w24_28;
   CompressorIn_bh6_370_467 <= heap_bh6_w25_32 & heap_bh6_w25_31;
   Compressor_bh6_370: Compressor_23_3
      port map ( R => CompressorOut_bh6_370_370   ,
                 X0 => CompressorIn_bh6_370_466,
                 X1 => CompressorIn_bh6_370_467);
   heap_bh6_w24_32 <= CompressorOut_bh6_370_370(0); -- cycle= 0 cp= 2.71464e-09
   heap_bh6_w25_33 <= CompressorOut_bh6_370_370(1); -- cycle= 0 cp= 2.71464e-09
   heap_bh6_w26_34 <= CompressorOut_bh6_370_370(2); -- cycle= 0 cp= 2.71464e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_371_468 <= heap_bh6_w93_2 & heap_bh6_w93_1 & heap_bh6_w93_0;
   CompressorIn_bh6_371_469 <= heap_bh6_w94_2 & heap_bh6_w94_1;
   Compressor_bh6_371: Compressor_23_3
      port map ( R => CompressorOut_bh6_371_371   ,
                 X0 => CompressorIn_bh6_371_468,
                 X1 => CompressorIn_bh6_371_469);
   heap_bh6_w93_4 <= CompressorOut_bh6_371_371(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w94_3 <= CompressorOut_bh6_371_371(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w95_3 <= CompressorOut_bh6_371_371(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_372_470 <= heap_bh6_w95_2 & heap_bh6_w95_1 & heap_bh6_w95_0;
   CompressorIn_bh6_372_471 <= heap_bh6_w96_2 & heap_bh6_w96_1;
   Compressor_bh6_372: Compressor_23_3
      port map ( R => CompressorOut_bh6_372_372   ,
                 X0 => CompressorIn_bh6_372_470,
                 X1 => CompressorIn_bh6_372_471);
   heap_bh6_w95_4 <= CompressorOut_bh6_372_372(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w96_3 <= CompressorOut_bh6_372_372(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w97_3 <= CompressorOut_bh6_372_372(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_373_472 <= heap_bh6_w97_2 & heap_bh6_w97_1 & heap_bh6_w97_0;
   CompressorIn_bh6_373_473 <= heap_bh6_w98_2 & heap_bh6_w98_1;
   Compressor_bh6_373: Compressor_23_3
      port map ( R => CompressorOut_bh6_373_373   ,
                 X0 => CompressorIn_bh6_373_472,
                 X1 => CompressorIn_bh6_373_473);
   heap_bh6_w97_4 <= CompressorOut_bh6_373_373(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w98_3 <= CompressorOut_bh6_373_373(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w99_3 <= CompressorOut_bh6_373_373(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_374_474 <= heap_bh6_w99_2 & heap_bh6_w99_1 & heap_bh6_w99_0;
   CompressorIn_bh6_374_475 <= heap_bh6_w100_2 & heap_bh6_w100_1;
   Compressor_bh6_374: Compressor_23_3
      port map ( R => CompressorOut_bh6_374_374   ,
                 X0 => CompressorIn_bh6_374_474,
                 X1 => CompressorIn_bh6_374_475);
   heap_bh6_w99_4 <= CompressorOut_bh6_374_374(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w100_3 <= CompressorOut_bh6_374_374(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w101_3 <= CompressorOut_bh6_374_374(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_375_476 <= heap_bh6_w101_2 & heap_bh6_w101_1 & heap_bh6_w101_0;
   CompressorIn_bh6_375_477 <= heap_bh6_w102_1 & heap_bh6_w102_0;
   Compressor_bh6_375: Compressor_23_3
      port map ( R => CompressorOut_bh6_375_375   ,
                 X0 => CompressorIn_bh6_375_476,
                 X1 => CompressorIn_bh6_375_477);
   heap_bh6_w101_4 <= CompressorOut_bh6_375_375(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w102_2 <= CompressorOut_bh6_375_375(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w103_2 <= CompressorOut_bh6_375_375(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_376_478 <= heap_bh6_w32_33 & heap_bh6_w32_32 & heap_bh6_w32_18;
   CompressorIn_bh6_376_479(0) <= heap_bh6_w33_18;
   Compressor_bh6_376: Compressor_13_3
      port map ( R => CompressorOut_bh6_376_376   ,
                 X0 => CompressorIn_bh6_376_478,
                 X1 => CompressorIn_bh6_376_479);
   heap_bh6_w32_36 <= CompressorOut_bh6_376_376(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w33_38 <= CompressorOut_bh6_376_376(1); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w34_38 <= CompressorOut_bh6_376_376(2); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_377_480 <= heap_bh6_w26_33 & heap_bh6_w26_32 & heap_bh6_w26_31;
   Compressor_bh6_377: Compressor_3_2
      port map ( R => CompressorOut_bh6_377_377   ,
                 X0 => CompressorIn_bh6_377_480);
   heap_bh6_w26_35 <= CompressorOut_bh6_377_377(0); -- cycle= 0 cp= 2.71464e-09
   heap_bh6_w27_37 <= CompressorOut_bh6_377_377(1); -- cycle= 0 cp= 2.71464e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_378_481 <= heap_bh6_w28_33 & heap_bh6_w28_32 & heap_bh6_w28_18;
   Compressor_bh6_378: Compressor_3_2
      port map ( R => CompressorOut_bh6_378_378   ,
                 X0 => CompressorIn_bh6_378_481);
   heap_bh6_w28_36 <= CompressorOut_bh6_378_378(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w29_38 <= CompressorOut_bh6_378_378(1); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_379_482 <= heap_bh6_w30_33 & heap_bh6_w30_32 & heap_bh6_w30_18;
   Compressor_bh6_379: Compressor_3_2
      port map ( R => CompressorOut_bh6_379_379   ,
                 X0 => CompressorIn_bh6_379_482);
   heap_bh6_w30_36 <= CompressorOut_bh6_379_379(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w31_39 <= CompressorOut_bh6_379_379(1); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_380_483 <= heap_bh6_w34_35 & heap_bh6_w34_34 & heap_bh6_w34_19;
   Compressor_bh6_380: Compressor_3_2
      port map ( R => CompressorOut_bh6_380_380   ,
                 X0 => CompressorIn_bh6_380_483);
   heap_bh6_w34_39 <= CompressorOut_bh6_380_380(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w35_37 <= CompressorOut_bh6_380_380(1); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_381_484 <= heap_bh6_w37_35 & heap_bh6_w37_34 & heap_bh6_w37_19;
   Compressor_bh6_381: Compressor_3_2
      port map ( R => CompressorOut_bh6_381_381   ,
                 X0 => CompressorIn_bh6_381_484);
   heap_bh6_w37_39 <= CompressorOut_bh6_381_381(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w38_37 <= CompressorOut_bh6_381_381(1); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_382_485 <= heap_bh6_w40_35 & heap_bh6_w40_34 & heap_bh6_w40_19;
   Compressor_bh6_382: Compressor_3_2
      port map ( R => CompressorOut_bh6_382_382   ,
                 X0 => CompressorIn_bh6_382_485);
   heap_bh6_w40_39 <= CompressorOut_bh6_382_382(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w41_37 <= CompressorOut_bh6_382_382(1); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_383_486 <= heap_bh6_w43_35 & heap_bh6_w43_34 & heap_bh6_w43_19;
   Compressor_bh6_383: Compressor_3_2
      port map ( R => CompressorOut_bh6_383_383   ,
                 X0 => CompressorIn_bh6_383_486);
   heap_bh6_w43_39 <= CompressorOut_bh6_383_383(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w44_38 <= CompressorOut_bh6_383_383(1); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_384_487 <= heap_bh6_w78_2 & heap_bh6_w78_1 & heap_bh6_w78_0;
   Compressor_bh6_384: Compressor_3_2
      port map ( R => CompressorOut_bh6_384_384   ,
                 X0 => CompressorIn_bh6_384_487);
   heap_bh6_w78_6 <= CompressorOut_bh6_384_384(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w79_6 <= CompressorOut_bh6_384_384(1); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_385_488 <= heap_bh6_w80_2 & heap_bh6_w80_1 & heap_bh6_w80_0;
   Compressor_bh6_385: Compressor_3_2
      port map ( R => CompressorOut_bh6_385_385   ,
                 X0 => CompressorIn_bh6_385_488);
   heap_bh6_w80_5 <= CompressorOut_bh6_385_385(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w81_6 <= CompressorOut_bh6_385_385(1); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_386_489 <= heap_bh6_w82_2 & heap_bh6_w82_1 & heap_bh6_w82_0;
   Compressor_bh6_386: Compressor_3_2
      port map ( R => CompressorOut_bh6_386_386   ,
                 X0 => CompressorIn_bh6_386_489);
   heap_bh6_w82_5 <= CompressorOut_bh6_386_386(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w83_6 <= CompressorOut_bh6_386_386(1); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_387_490 <= heap_bh6_w84_2 & heap_bh6_w84_1 & heap_bh6_w84_0;
   Compressor_bh6_387: Compressor_3_2
      port map ( R => CompressorOut_bh6_387_387   ,
                 X0 => CompressorIn_bh6_387_490);
   heap_bh6_w84_5 <= CompressorOut_bh6_387_387(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w85_6 <= CompressorOut_bh6_387_387(1); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_388_491 <= heap_bh6_w86_2 & heap_bh6_w86_1 & heap_bh6_w86_0;
   Compressor_bh6_388: Compressor_3_2
      port map ( R => CompressorOut_bh6_388_388   ,
                 X0 => CompressorIn_bh6_388_491);
   heap_bh6_w86_5 <= CompressorOut_bh6_388_388(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w87_6 <= CompressorOut_bh6_388_388(1); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_389_492 <= heap_bh6_w88_2 & heap_bh6_w88_1 & heap_bh6_w88_0;
   Compressor_bh6_389: Compressor_3_2
      port map ( R => CompressorOut_bh6_389_389   ,
                 X0 => CompressorIn_bh6_389_492);
   heap_bh6_w88_5 <= CompressorOut_bh6_389_389(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w89_6 <= CompressorOut_bh6_389_389(1); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_390_493 <= heap_bh6_w90_2 & heap_bh6_w90_1 & heap_bh6_w90_0;
   Compressor_bh6_390: Compressor_3_2
      port map ( R => CompressorOut_bh6_390_390   ,
                 X0 => CompressorIn_bh6_390_493);
   heap_bh6_w90_5 <= CompressorOut_bh6_390_390(0); -- cycle= 0 cp= 2.91772e-09
   heap_bh6_w91_6 <= CompressorOut_bh6_390_390(1); -- cycle= 0 cp= 2.91772e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_391_494 <= heap_bh6_w46_18 & heap_bh6_w46_38 & heap_bh6_w46_37 & heap_bh6_w46_36;
   CompressorIn_bh6_391_495(0) <= heap_bh6_w47_39;
   Compressor_bh6_391: Compressor_14_3
      port map ( R => CompressorOut_bh6_391_391   ,
                 X0 => CompressorIn_bh6_391_494,
                 X1 => CompressorIn_bh6_391_495);
   heap_bh6_w46_39 <= CompressorOut_bh6_391_391(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w47_40 <= CompressorOut_bh6_391_391(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w48_41 <= CompressorOut_bh6_391_391(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_392_496 <= heap_bh6_w53_18 & heap_bh6_w53_40 & heap_bh6_w53_39 & heap_bh6_w53_38;
   CompressorIn_bh6_392_497(0) <= heap_bh6_w54_41;
   Compressor_bh6_392: Compressor_14_3
      port map ( R => CompressorOut_bh6_392_392   ,
                 X0 => CompressorIn_bh6_392_496,
                 X1 => CompressorIn_bh6_392_497);
   heap_bh6_w53_41 <= CompressorOut_bh6_392_392(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w54_42 <= CompressorOut_bh6_392_392(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w55_40 <= CompressorOut_bh6_392_392(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_393_498 <= heap_bh6_w56_18 & heap_bh6_w56_40 & heap_bh6_w56_39 & heap_bh6_w56_38;
   CompressorIn_bh6_393_499(0) <= heap_bh6_w57_41;
   Compressor_bh6_393: Compressor_14_3
      port map ( R => CompressorOut_bh6_393_393   ,
                 X0 => CompressorIn_bh6_393_498,
                 X1 => CompressorIn_bh6_393_499);
   heap_bh6_w56_41 <= CompressorOut_bh6_393_393(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w57_42 <= CompressorOut_bh6_393_393(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w58_40 <= CompressorOut_bh6_393_393(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_394_500 <= heap_bh6_w59_18 & heap_bh6_w59_40 & heap_bh6_w59_39 & heap_bh6_w59_38;
   CompressorIn_bh6_394_501(0) <= heap_bh6_w60_41;
   Compressor_bh6_394: Compressor_14_3
      port map ( R => CompressorOut_bh6_394_394   ,
                 X0 => CompressorIn_bh6_394_500,
                 X1 => CompressorIn_bh6_394_501);
   heap_bh6_w59_41 <= CompressorOut_bh6_394_394(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w60_42 <= CompressorOut_bh6_394_394(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w61_41 <= CompressorOut_bh6_394_394(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_395_502 <= heap_bh6_w61_18 & heap_bh6_w61_40 & heap_bh6_w61_39 & heap_bh6_w61_38;
   CompressorIn_bh6_395_503(0) <= heap_bh6_w62_19;
   Compressor_bh6_395: Compressor_14_3
      port map ( R => CompressorOut_bh6_395_395   ,
                 X0 => CompressorIn_bh6_395_502,
                 X1 => CompressorIn_bh6_395_503);
   heap_bh6_w61_42 <= CompressorOut_bh6_395_395(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w62_42 <= CompressorOut_bh6_395_395(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w63_39 <= CompressorOut_bh6_395_395(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_396_504 <= heap_bh6_w62_18 & heap_bh6_w62_41 & heap_bh6_w62_40 & heap_bh6_w62_39;
   CompressorIn_bh6_396_505(0) <= heap_bh6_w63_16;
   Compressor_bh6_396: Compressor_14_3
      port map ( R => CompressorOut_bh6_396_396   ,
                 X0 => CompressorIn_bh6_396_504,
                 X1 => CompressorIn_bh6_396_505);
   heap_bh6_w62_43 <= CompressorOut_bh6_396_396(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w63_40 <= CompressorOut_bh6_396_396(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w64_40 <= CompressorOut_bh6_396_396(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_397_506 <= heap_bh6_w64_16 & heap_bh6_w64_39 & heap_bh6_w64_38 & heap_bh6_w64_37;
   CompressorIn_bh6_397_507(0) <= heap_bh6_w65_16;
   Compressor_bh6_397: Compressor_14_3
      port map ( R => CompressorOut_bh6_397_397   ,
                 X0 => CompressorIn_bh6_397_506,
                 X1 => CompressorIn_bh6_397_507);
   heap_bh6_w64_41 <= CompressorOut_bh6_397_397(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w65_39 <= CompressorOut_bh6_397_397(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w66_33 <= CompressorOut_bh6_397_397(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_398_508 <= heap_bh6_w66_12 & heap_bh6_w66_32 & heap_bh6_w66_31 & heap_bh6_w66_30;
   CompressorIn_bh6_398_509(0) <= heap_bh6_w67_12;
   Compressor_bh6_398: Compressor_14_3
      port map ( R => CompressorOut_bh6_398_398   ,
                 X0 => CompressorIn_bh6_398_508,
                 X1 => CompressorIn_bh6_398_509);
   heap_bh6_w66_34 <= CompressorOut_bh6_398_398(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w67_32 <= CompressorOut_bh6_398_398(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w68_30 <= CompressorOut_bh6_398_398(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_399_510 <= heap_bh6_w68_12 & heap_bh6_w68_29 & heap_bh6_w68_28 & heap_bh6_w68_27;
   CompressorIn_bh6_399_511(0) <= heap_bh6_w69_24;
   Compressor_bh6_399: Compressor_14_3
      port map ( R => CompressorOut_bh6_399_399   ,
                 X0 => CompressorIn_bh6_399_510,
                 X1 => CompressorIn_bh6_399_511);
   heap_bh6_w68_31 <= CompressorOut_bh6_399_399(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w69_25 <= CompressorOut_bh6_399_399(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w70_23 <= CompressorOut_bh6_399_399(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_400_512 <= heap_bh6_w70_8 & heap_bh6_w70_22 & heap_bh6_w70_21 & heap_bh6_w70_20;
   CompressorIn_bh6_400_513(0) <= heap_bh6_w71_22;
   Compressor_bh6_400: Compressor_14_3
      port map ( R => CompressorOut_bh6_400_400   ,
                 X0 => CompressorIn_bh6_400_512,
                 X1 => CompressorIn_bh6_400_513);
   heap_bh6_w70_24 <= CompressorOut_bh6_400_400(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w71_23 <= CompressorOut_bh6_400_400(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w72_18 <= CompressorOut_bh6_400_400(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_401_514 <= heap_bh6_w74_4 & heap_bh6_w74_15 & heap_bh6_w74_14 & heap_bh6_w74_13;
   CompressorIn_bh6_401_515(0) <= heap_bh6_w75_9;
   Compressor_bh6_401: Compressor_14_3
      port map ( R => CompressorOut_bh6_401_401   ,
                 X0 => CompressorIn_bh6_401_514,
                 X1 => CompressorIn_bh6_401_515);
   heap_bh6_w74_16 <= CompressorOut_bh6_401_401(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w75_10 <= CompressorOut_bh6_401_401(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w76_9 <= CompressorOut_bh6_401_401(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_402_516 <= heap_bh6_w77_1 & heap_bh6_w77_7 & heap_bh6_w77_6 & heap_bh6_w77_5;
   CompressorIn_bh6_402_517(0) <= heap_bh6_w78_6;
   Compressor_bh6_402: Compressor_14_3
      port map ( R => CompressorOut_bh6_402_402   ,
                 X0 => CompressorIn_bh6_402_516,
                 X1 => CompressorIn_bh6_402_517);
   heap_bh6_w77_8 <= CompressorOut_bh6_402_402(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w78_7 <= CompressorOut_bh6_402_402(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w79_7 <= CompressorOut_bh6_402_402(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_403_518 <= heap_bh6_w29_38 & heap_bh6_w29_37 & heap_bh6_w29_36;
   CompressorIn_bh6_403_519 <= heap_bh6_w30_36 & heap_bh6_w30_35;
   Compressor_bh6_403: Compressor_23_3
      port map ( R => CompressorOut_bh6_403_403   ,
                 X0 => CompressorIn_bh6_403_518,
                 X1 => CompressorIn_bh6_403_519);
   heap_bh6_w29_39 <= CompressorOut_bh6_403_403(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w30_37 <= CompressorOut_bh6_403_403(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w31_40 <= CompressorOut_bh6_403_403(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_404_520 <= heap_bh6_w31_39 & heap_bh6_w31_38 & heap_bh6_w31_37;
   CompressorIn_bh6_404_521 <= heap_bh6_w32_36 & heap_bh6_w32_35;
   Compressor_bh6_404: Compressor_23_3
      port map ( R => CompressorOut_bh6_404_404   ,
                 X0 => CompressorIn_bh6_404_520,
                 X1 => CompressorIn_bh6_404_521);
   heap_bh6_w31_41 <= CompressorOut_bh6_404_404(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w32_37 <= CompressorOut_bh6_404_404(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w33_39 <= CompressorOut_bh6_404_404(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_405_522 <= heap_bh6_w33_37 & heap_bh6_w33_38 & heap_bh6_w33_36;
   CompressorIn_bh6_405_523 <= heap_bh6_w34_37 & heap_bh6_w34_39;
   Compressor_bh6_405: Compressor_23_3
      port map ( R => CompressorOut_bh6_405_405   ,
                 X0 => CompressorIn_bh6_405_522,
                 X1 => CompressorIn_bh6_405_523);
   heap_bh6_w33_40 <= CompressorOut_bh6_405_405(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w34_40 <= CompressorOut_bh6_405_405(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w35_38 <= CompressorOut_bh6_405_405(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_406_524 <= heap_bh6_w35_35 & heap_bh6_w35_37 & heap_bh6_w35_36;
   CompressorIn_bh6_406_525 <= heap_bh6_w36_37 & heap_bh6_w36_36;
   Compressor_bh6_406: Compressor_23_3
      port map ( R => CompressorOut_bh6_406_406   ,
                 X0 => CompressorIn_bh6_406_524,
                 X1 => CompressorIn_bh6_406_525);
   heap_bh6_w35_39 <= CompressorOut_bh6_406_406(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w36_38 <= CompressorOut_bh6_406_406(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w37_40 <= CompressorOut_bh6_406_406(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_407_526 <= heap_bh6_w37_39 & heap_bh6_w37_38 & heap_bh6_w37_37;
   CompressorIn_bh6_407_527 <= heap_bh6_w38_37 & heap_bh6_w38_36;
   Compressor_bh6_407: Compressor_23_3
      port map ( R => CompressorOut_bh6_407_407   ,
                 X0 => CompressorIn_bh6_407_526,
                 X1 => CompressorIn_bh6_407_527);
   heap_bh6_w37_41 <= CompressorOut_bh6_407_407(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w38_38 <= CompressorOut_bh6_407_407(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w39_38 <= CompressorOut_bh6_407_407(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_408_528 <= heap_bh6_w40_39 & heap_bh6_w40_38 & heap_bh6_w40_37;
   CompressorIn_bh6_408_529 <= heap_bh6_w41_37 & heap_bh6_w41_36;
   Compressor_bh6_408: Compressor_23_3
      port map ( R => CompressorOut_bh6_408_408   ,
                 X0 => CompressorIn_bh6_408_528,
                 X1 => CompressorIn_bh6_408_529);
   heap_bh6_w40_40 <= CompressorOut_bh6_408_408(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w41_38 <= CompressorOut_bh6_408_408(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w42_38 <= CompressorOut_bh6_408_408(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_409_530 <= heap_bh6_w43_39 & heap_bh6_w43_38 & heap_bh6_w43_37;
   CompressorIn_bh6_409_531 <= heap_bh6_w44_38 & heap_bh6_w44_37;
   Compressor_bh6_409: Compressor_23_3
      port map ( R => CompressorOut_bh6_409_409   ,
                 X0 => CompressorIn_bh6_409_530,
                 X1 => CompressorIn_bh6_409_531);
   heap_bh6_w43_40 <= CompressorOut_bh6_409_409(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w44_39 <= CompressorOut_bh6_409_409(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w45_39 <= CompressorOut_bh6_409_409(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_410_532 <= heap_bh6_w48_40 & heap_bh6_w48_39 & heap_bh6_w48_38;
   CompressorIn_bh6_410_533 <= heap_bh6_w49_38 & heap_bh6_w49_37;
   Compressor_bh6_410: Compressor_23_3
      port map ( R => CompressorOut_bh6_410_410   ,
                 X0 => CompressorIn_bh6_410_532,
                 X1 => CompressorIn_bh6_410_533);
   heap_bh6_w48_42 <= CompressorOut_bh6_410_410(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w49_39 <= CompressorOut_bh6_410_410(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w50_40 <= CompressorOut_bh6_410_410(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_411_534 <= heap_bh6_w50_39 & heap_bh6_w50_38 & heap_bh6_w50_37;
   CompressorIn_bh6_411_535 <= heap_bh6_w51_41 & heap_bh6_w51_40;
   Compressor_bh6_411: Compressor_23_3
      port map ( R => CompressorOut_bh6_411_411   ,
                 X0 => CompressorIn_bh6_411_534,
                 X1 => CompressorIn_bh6_411_535);
   heap_bh6_w50_41 <= CompressorOut_bh6_411_411(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w51_42 <= CompressorOut_bh6_411_411(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w52_40 <= CompressorOut_bh6_411_411(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_412_536 <= heap_bh6_w72_17 & heap_bh6_w72_16 & heap_bh6_w72_15;
   CompressorIn_bh6_412_537 <= heap_bh6_w73_17 & heap_bh6_w73_16;
   Compressor_bh6_412: Compressor_23_3
      port map ( R => CompressorOut_bh6_412_412   ,
                 X0 => CompressorIn_bh6_412_536,
                 X1 => CompressorIn_bh6_412_537);
   heap_bh6_w72_19 <= CompressorOut_bh6_412_412(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w73_18 <= CompressorOut_bh6_412_412(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w74_17 <= CompressorOut_bh6_412_412(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_413_538 <= heap_bh6_w79_6 & heap_bh6_w79_5 & heap_bh6_w79_4;
   CompressorIn_bh6_413_539 <= heap_bh6_w80_5 & heap_bh6_w80_4;
   Compressor_bh6_413: Compressor_23_3
      port map ( R => CompressorOut_bh6_413_413   ,
                 X0 => CompressorIn_bh6_413_538,
                 X1 => CompressorIn_bh6_413_539);
   heap_bh6_w79_8 <= CompressorOut_bh6_413_413(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w80_6 <= CompressorOut_bh6_413_413(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w81_7 <= CompressorOut_bh6_413_413(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_414_540 <= heap_bh6_w81_6 & heap_bh6_w81_5 & heap_bh6_w81_4;
   CompressorIn_bh6_414_541 <= heap_bh6_w82_5 & heap_bh6_w82_4;
   Compressor_bh6_414: Compressor_23_3
      port map ( R => CompressorOut_bh6_414_414   ,
                 X0 => CompressorIn_bh6_414_540,
                 X1 => CompressorIn_bh6_414_541);
   heap_bh6_w81_8 <= CompressorOut_bh6_414_414(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w82_6 <= CompressorOut_bh6_414_414(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w83_7 <= CompressorOut_bh6_414_414(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_415_542 <= heap_bh6_w83_6 & heap_bh6_w83_5 & heap_bh6_w83_4;
   CompressorIn_bh6_415_543 <= heap_bh6_w84_5 & heap_bh6_w84_4;
   Compressor_bh6_415: Compressor_23_3
      port map ( R => CompressorOut_bh6_415_415   ,
                 X0 => CompressorIn_bh6_415_542,
                 X1 => CompressorIn_bh6_415_543);
   heap_bh6_w83_8 <= CompressorOut_bh6_415_415(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w84_6 <= CompressorOut_bh6_415_415(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w85_7 <= CompressorOut_bh6_415_415(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_416_544 <= heap_bh6_w85_6 & heap_bh6_w85_5 & heap_bh6_w85_4;
   CompressorIn_bh6_416_545 <= heap_bh6_w86_5 & heap_bh6_w86_4;
   Compressor_bh6_416: Compressor_23_3
      port map ( R => CompressorOut_bh6_416_416   ,
                 X0 => CompressorIn_bh6_416_544,
                 X1 => CompressorIn_bh6_416_545);
   heap_bh6_w85_8 <= CompressorOut_bh6_416_416(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w86_6 <= CompressorOut_bh6_416_416(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w87_7 <= CompressorOut_bh6_416_416(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_417_546 <= heap_bh6_w87_6 & heap_bh6_w87_5 & heap_bh6_w87_4;
   CompressorIn_bh6_417_547 <= heap_bh6_w88_5 & heap_bh6_w88_4;
   Compressor_bh6_417: Compressor_23_3
      port map ( R => CompressorOut_bh6_417_417   ,
                 X0 => CompressorIn_bh6_417_546,
                 X1 => CompressorIn_bh6_417_547);
   heap_bh6_w87_8 <= CompressorOut_bh6_417_417(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w88_6 <= CompressorOut_bh6_417_417(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w89_7 <= CompressorOut_bh6_417_417(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_418_548 <= heap_bh6_w89_6 & heap_bh6_w89_5 & heap_bh6_w89_4;
   CompressorIn_bh6_418_549 <= heap_bh6_w90_5 & heap_bh6_w90_4;
   Compressor_bh6_418: Compressor_23_3
      port map ( R => CompressorOut_bh6_418_418   ,
                 X0 => CompressorIn_bh6_418_548,
                 X1 => CompressorIn_bh6_418_549);
   heap_bh6_w89_8 <= CompressorOut_bh6_418_418(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w90_6 <= CompressorOut_bh6_418_418(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w91_7 <= CompressorOut_bh6_418_418(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_419_550 <= heap_bh6_w91_6 & heap_bh6_w91_5 & heap_bh6_w91_4;
   CompressorIn_bh6_419_551 <= heap_bh6_w92_1 & heap_bh6_w92_0;
   Compressor_bh6_419: Compressor_23_3
      port map ( R => CompressorOut_bh6_419_419   ,
                 X0 => CompressorIn_bh6_419_550,
                 X1 => CompressorIn_bh6_419_551);
   heap_bh6_w91_8 <= CompressorOut_bh6_419_419(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w92_4 <= CompressorOut_bh6_419_419(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w93_5 <= CompressorOut_bh6_419_419(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_420_552 <= heap_bh6_w103_1 & heap_bh6_w103_0 & heap_bh6_w103_2;
   CompressorIn_bh6_420_553 <= heap_bh6_w104_1 & heap_bh6_w104_0;
   Compressor_bh6_420: Compressor_23_3
      port map ( R => CompressorOut_bh6_420_420   ,
                 X0 => CompressorIn_bh6_420_552,
                 X1 => CompressorIn_bh6_420_553);
   heap_bh6_w103_3 <= CompressorOut_bh6_420_420(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w104_2 <= CompressorOut_bh6_420_420(1); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w105_2 <= CompressorOut_bh6_420_420(2); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_421_554 <= heap_bh6_w52_39 & heap_bh6_w52_38 & heap_bh6_w52_37;
   Compressor_bh6_421: Compressor_3_2
      port map ( R => CompressorOut_bh6_421_421   ,
                 X0 => CompressorIn_bh6_421_554);
   heap_bh6_w52_41 <= CompressorOut_bh6_421_421(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w53_42 <= CompressorOut_bh6_421_421(1); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_422_555 <= heap_bh6_w55_39 & heap_bh6_w55_38 & heap_bh6_w55_37;
   Compressor_bh6_422: Compressor_3_2
      port map ( R => CompressorOut_bh6_422_422   ,
                 X0 => CompressorIn_bh6_422_555);
   heap_bh6_w55_41 <= CompressorOut_bh6_422_422(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w56_42 <= CompressorOut_bh6_422_422(1); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_423_556 <= heap_bh6_w58_39 & heap_bh6_w58_38 & heap_bh6_w58_37;
   Compressor_bh6_423: Compressor_3_2
      port map ( R => CompressorOut_bh6_423_423   ,
                 X0 => CompressorIn_bh6_423_556);
   heap_bh6_w58_41 <= CompressorOut_bh6_423_423(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w59_42 <= CompressorOut_bh6_423_423(1); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_424_557 <= heap_bh6_w63_38 & heap_bh6_w63_37 & heap_bh6_w63_36;
   Compressor_bh6_424: Compressor_3_2
      port map ( R => CompressorOut_bh6_424_424   ,
                 X0 => CompressorIn_bh6_424_557);
   heap_bh6_w63_41 <= CompressorOut_bh6_424_424(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w64_42 <= CompressorOut_bh6_424_424(1); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_425_558 <= heap_bh6_w65_38 & heap_bh6_w65_37 & heap_bh6_w65_36;
   Compressor_bh6_425: Compressor_3_2
      port map ( R => CompressorOut_bh6_425_425   ,
                 X0 => CompressorIn_bh6_425_558);
   heap_bh6_w65_40 <= CompressorOut_bh6_425_425(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w66_35 <= CompressorOut_bh6_425_425(1); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_426_559 <= heap_bh6_w67_31 & heap_bh6_w67_30 & heap_bh6_w67_29;
   Compressor_bh6_426: Compressor_3_2
      port map ( R => CompressorOut_bh6_426_426   ,
                 X0 => CompressorIn_bh6_426_559);
   heap_bh6_w67_33 <= CompressorOut_bh6_426_426(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w68_32 <= CompressorOut_bh6_426_426(1); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_427_560 <= heap_bh6_w76_8 & heap_bh6_w76_7 & heap_bh6_w76_6;
   Compressor_bh6_427: Compressor_3_2
      port map ( R => CompressorOut_bh6_427_427   ,
                 X0 => CompressorIn_bh6_427_560);
   heap_bh6_w76_10 <= CompressorOut_bh6_427_427(0); -- cycle= 0 cp= 3.44844e-09
   heap_bh6_w77_9 <= CompressorOut_bh6_427_427(1); -- cycle= 0 cp= 3.44844e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_428_561 <= heap_bh6_w47_38 & heap_bh6_w47_37 & heap_bh6_w47_40;
   CompressorIn_bh6_428_562 <= heap_bh6_w48_42 & heap_bh6_w48_41;
   Compressor_bh6_428: Compressor_23_3
      port map ( R => CompressorOut_bh6_428_428   ,
                 X0 => CompressorIn_bh6_428_561,
                 X1 => CompressorIn_bh6_428_562);
   heap_bh6_w47_41 <= CompressorOut_bh6_428_428(0); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w48_43 <= CompressorOut_bh6_428_428(1); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w49_40 <= CompressorOut_bh6_428_428(2); -- cycle= 0 cp= 3.97916e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_429_563 <= heap_bh6_w54_40 & heap_bh6_w54_39 & heap_bh6_w54_42;
   CompressorIn_bh6_429_564 <= heap_bh6_w55_41 & heap_bh6_w55_40;
   Compressor_bh6_429: Compressor_23_3
      port map ( R => CompressorOut_bh6_429_429   ,
                 X0 => CompressorIn_bh6_429_563,
                 X1 => CompressorIn_bh6_429_564);
   heap_bh6_w54_43 <= CompressorOut_bh6_429_429(0); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w55_42 <= CompressorOut_bh6_429_429(1); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w56_43 <= CompressorOut_bh6_429_429(2); -- cycle= 0 cp= 3.97916e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_430_565 <= heap_bh6_w57_40 & heap_bh6_w57_39 & heap_bh6_w57_42;
   CompressorIn_bh6_430_566 <= heap_bh6_w58_41 & heap_bh6_w58_40;
   Compressor_bh6_430: Compressor_23_3
      port map ( R => CompressorOut_bh6_430_430   ,
                 X0 => CompressorIn_bh6_430_565,
                 X1 => CompressorIn_bh6_430_566);
   heap_bh6_w57_43 <= CompressorOut_bh6_430_430(0); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w58_42 <= CompressorOut_bh6_430_430(1); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w59_43 <= CompressorOut_bh6_430_430(2); -- cycle= 0 cp= 3.97916e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_431_567 <= heap_bh6_w60_40 & heap_bh6_w60_39 & heap_bh6_w60_42;
   CompressorIn_bh6_431_568 <= heap_bh6_w61_42 & heap_bh6_w61_41;
   Compressor_bh6_431: Compressor_23_3
      port map ( R => CompressorOut_bh6_431_431   ,
                 X0 => CompressorIn_bh6_431_567,
                 X1 => CompressorIn_bh6_431_568);
   heap_bh6_w60_43 <= CompressorOut_bh6_431_431(0); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w61_43 <= CompressorOut_bh6_431_431(1); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w62_44 <= CompressorOut_bh6_431_431(2); -- cycle= 0 cp= 3.97916e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_432_569 <= heap_bh6_w63_41 & heap_bh6_w63_40 & heap_bh6_w63_39;
   CompressorIn_bh6_432_570 <= heap_bh6_w64_42 & heap_bh6_w64_41;
   Compressor_bh6_432: Compressor_23_3
      port map ( R => CompressorOut_bh6_432_432   ,
                 X0 => CompressorIn_bh6_432_569,
                 X1 => CompressorIn_bh6_432_570);
   heap_bh6_w63_42 <= CompressorOut_bh6_432_432(0); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w64_43 <= CompressorOut_bh6_432_432(1); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w65_41 <= CompressorOut_bh6_432_432(2); -- cycle= 0 cp= 3.97916e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_433_571 <= heap_bh6_w66_35 & heap_bh6_w66_34 & heap_bh6_w66_33;
   CompressorIn_bh6_433_572 <= heap_bh6_w67_33 & heap_bh6_w67_32;
   Compressor_bh6_433: Compressor_23_3
      port map ( R => CompressorOut_bh6_433_433   ,
                 X0 => CompressorIn_bh6_433_571,
                 X1 => CompressorIn_bh6_433_572);
   heap_bh6_w66_36 <= CompressorOut_bh6_433_433(0); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w67_34 <= CompressorOut_bh6_433_433(1); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w68_33 <= CompressorOut_bh6_433_433(2); -- cycle= 0 cp= 3.97916e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_434_573 <= heap_bh6_w68_32 & heap_bh6_w68_31 & heap_bh6_w68_30;
   CompressorIn_bh6_434_574 <= heap_bh6_w69_23 & heap_bh6_w69_22;
   Compressor_bh6_434: Compressor_23_3
      port map ( R => CompressorOut_bh6_434_434   ,
                 X0 => CompressorIn_bh6_434_573,
                 X1 => CompressorIn_bh6_434_574);
   heap_bh6_w68_34 <= CompressorOut_bh6_434_434(0); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w69_26 <= CompressorOut_bh6_434_434(1); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w70_25 <= CompressorOut_bh6_434_434(2); -- cycle= 0 cp= 3.97916e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_435_575 <= heap_bh6_w71_21 & heap_bh6_w71_20 & heap_bh6_w71_23;
   CompressorIn_bh6_435_576 <= heap_bh6_w72_19 & heap_bh6_w72_18;
   Compressor_bh6_435: Compressor_23_3
      port map ( R => CompressorOut_bh6_435_435   ,
                 X0 => CompressorIn_bh6_435_575,
                 X1 => CompressorIn_bh6_435_576);
   heap_bh6_w71_24 <= CompressorOut_bh6_435_435(0); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w72_20 <= CompressorOut_bh6_435_435(1); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w73_19 <= CompressorOut_bh6_435_435(2); -- cycle= 0 cp= 3.97916e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_436_577 <= heap_bh6_w75_8 & heap_bh6_w75_7 & heap_bh6_w75_10;
   CompressorIn_bh6_436_578 <= heap_bh6_w76_10 & heap_bh6_w76_9;
   Compressor_bh6_436: Compressor_23_3
      port map ( R => CompressorOut_bh6_436_436   ,
                 X0 => CompressorIn_bh6_436_577,
                 X1 => CompressorIn_bh6_436_578);
   heap_bh6_w75_11 <= CompressorOut_bh6_436_436(0); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w76_11 <= CompressorOut_bh6_436_436(1); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w77_10 <= CompressorOut_bh6_436_436(2); -- cycle= 0 cp= 3.97916e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_437_579 <= heap_bh6_w78_5 & heap_bh6_w78_4 & heap_bh6_w78_7;
   CompressorIn_bh6_437_580 <= heap_bh6_w79_8 & heap_bh6_w79_7;
   Compressor_bh6_437: Compressor_23_3
      port map ( R => CompressorOut_bh6_437_437   ,
                 X0 => CompressorIn_bh6_437_579,
                 X1 => CompressorIn_bh6_437_580);
   heap_bh6_w78_8 <= CompressorOut_bh6_437_437(0); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w79_9 <= CompressorOut_bh6_437_437(1); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w80_7 <= CompressorOut_bh6_437_437(2); -- cycle= 0 cp= 3.97916e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_438_581 <= heap_bh6_w93_4 & heap_bh6_w93_3 & heap_bh6_w93_5;
   CompressorIn_bh6_438_582 <= heap_bh6_w94_0 & heap_bh6_w94_3;
   Compressor_bh6_438: Compressor_23_3
      port map ( R => CompressorOut_bh6_438_438   ,
                 X0 => CompressorIn_bh6_438_581,
                 X1 => CompressorIn_bh6_438_582);
   heap_bh6_w93_6 <= CompressorOut_bh6_438_438(0); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w94_4 <= CompressorOut_bh6_438_438(1); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w95_5 <= CompressorOut_bh6_438_438(2); -- cycle= 0 cp= 3.97916e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_439_583 <= heap_bh6_w105_1 & heap_bh6_w105_0 & heap_bh6_w105_2;
   CompressorIn_bh6_439_584 <= heap_bh6_w106_1 & heap_bh6_w106_0;
   Compressor_bh6_439: Compressor_23_3
      port map ( R => CompressorOut_bh6_439_439   ,
                 X0 => CompressorIn_bh6_439_583,
                 X1 => CompressorIn_bh6_439_584);
   heap_bh6_w105_3 <= CompressorOut_bh6_439_439(0); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w106_2 <= CompressorOut_bh6_439_439(1); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w107_2 <= CompressorOut_bh6_439_439(2); -- cycle= 0 cp= 3.97916e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_440_585 <= heap_bh6_w39_37 & heap_bh6_w39_36 & heap_bh6_w39_38;
   CompressorIn_bh6_440_586(0) <= heap_bh6_w40_40;
   Compressor_bh6_440: Compressor_13_3
      port map ( R => CompressorOut_bh6_440_440   ,
                 X0 => CompressorIn_bh6_440_585,
                 X1 => CompressorIn_bh6_440_586);
   heap_bh6_w39_39 <= CompressorOut_bh6_440_440(0); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w40_41 <= CompressorOut_bh6_440_440(1); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w41_39 <= CompressorOut_bh6_440_440(2); -- cycle= 0 cp= 3.97916e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_441_587 <= heap_bh6_w42_37 & heap_bh6_w42_36 & heap_bh6_w42_38;
   CompressorIn_bh6_441_588(0) <= heap_bh6_w43_40;
   Compressor_bh6_441: Compressor_13_3
      port map ( R => CompressorOut_bh6_441_441   ,
                 X0 => CompressorIn_bh6_441_587,
                 X1 => CompressorIn_bh6_441_588);
   heap_bh6_w42_39 <= CompressorOut_bh6_441_441(0); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w43_41 <= CompressorOut_bh6_441_441(1); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w44_40 <= CompressorOut_bh6_441_441(2); -- cycle= 0 cp= 3.97916e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_442_589 <= heap_bh6_w45_38 & heap_bh6_w45_37 & heap_bh6_w45_39;
   CompressorIn_bh6_442_590(0) <= heap_bh6_w46_39;
   Compressor_bh6_442: Compressor_13_3
      port map ( R => CompressorOut_bh6_442_442   ,
                 X0 => CompressorIn_bh6_442_589,
                 X1 => CompressorIn_bh6_442_590);
   heap_bh6_w45_40 <= CompressorOut_bh6_442_442(0); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w46_40 <= CompressorOut_bh6_442_442(1); -- cycle= 0 cp= 3.97916e-09
   heap_bh6_w47_42 <= CompressorOut_bh6_442_442(2); -- cycle= 0 cp= 3.97916e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_443_591 <= heap_bh6_w49_36 & heap_bh6_w49_39 & heap_bh6_w49_40;
   CompressorIn_bh6_443_592 <= heap_bh6_w50_41 & heap_bh6_w50_40;
   Compressor_bh6_443: Compressor_23_3
      port map ( R => CompressorOut_bh6_443_443   ,
                 X0 => CompressorIn_bh6_443_591,
                 X1 => CompressorIn_bh6_443_592);
   heap_bh6_w49_41 <= CompressorOut_bh6_443_443(0); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w50_42 <= CompressorOut_bh6_443_443(1); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w51_43 <= CompressorOut_bh6_443_443(2); -- cycle= 0 cp= 4.50988e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_444_593 <= heap_bh6_w73_15 & heap_bh6_w73_18 & heap_bh6_w73_19;
   CompressorIn_bh6_444_594 <= heap_bh6_w74_17 & heap_bh6_w74_16;
   Compressor_bh6_444: Compressor_23_3
      port map ( R => CompressorOut_bh6_444_444   ,
                 X0 => CompressorIn_bh6_444_593,
                 X1 => CompressorIn_bh6_444_594);
   heap_bh6_w73_20 <= CompressorOut_bh6_444_444(0); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w74_18 <= CompressorOut_bh6_444_444(1); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w75_12 <= CompressorOut_bh6_444_444(2); -- cycle= 0 cp= 4.50988e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_445_595 <= heap_bh6_w95_4 & heap_bh6_w95_3 & heap_bh6_w95_5;
   CompressorIn_bh6_445_596 <= heap_bh6_w96_0 & heap_bh6_w96_3;
   Compressor_bh6_445: Compressor_23_3
      port map ( R => CompressorOut_bh6_445_445   ,
                 X0 => CompressorIn_bh6_445_595,
                 X1 => CompressorIn_bh6_445_596);
   heap_bh6_w95_6 <= CompressorOut_bh6_445_445(0); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w96_4 <= CompressorOut_bh6_445_445(1); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w97_5 <= CompressorOut_bh6_445_445(2); -- cycle= 0 cp= 4.50988e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_446_597 <= heap_bh6_w107_1 & heap_bh6_w107_0 & heap_bh6_w107_2;
   CompressorIn_bh6_446_598 <= heap_bh6_w108_1 & heap_bh6_w108_0;
   Compressor_bh6_446: Compressor_23_3
      port map ( R => CompressorOut_bh6_446_446   ,
                 X0 => CompressorIn_bh6_446_597,
                 X1 => CompressorIn_bh6_446_598);
   heap_bh6_w107_3 <= CompressorOut_bh6_446_446(0); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w108_2 <= CompressorOut_bh6_446_446(1); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w109_1 <= CompressorOut_bh6_446_446(2); -- cycle= 0 cp= 4.50988e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_447_599 <= heap_bh6_w41_35 & heap_bh6_w41_38 & heap_bh6_w41_39;
   CompressorIn_bh6_447_600(0) <= heap_bh6_w42_39;
   Compressor_bh6_447: Compressor_13_3
      port map ( R => CompressorOut_bh6_447_447   ,
                 X0 => CompressorIn_bh6_447_599,
                 X1 => CompressorIn_bh6_447_600);
   heap_bh6_w41_40 <= CompressorOut_bh6_447_447(0); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w42_40 <= CompressorOut_bh6_447_447(1); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w43_42 <= CompressorOut_bh6_447_447(2); -- cycle= 0 cp= 4.50988e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_448_601 <= heap_bh6_w44_36 & heap_bh6_w44_39 & heap_bh6_w44_40;
   CompressorIn_bh6_448_602(0) <= heap_bh6_w45_40;
   Compressor_bh6_448: Compressor_13_3
      port map ( R => CompressorOut_bh6_448_448   ,
                 X0 => CompressorIn_bh6_448_601,
                 X1 => CompressorIn_bh6_448_602);
   heap_bh6_w44_41 <= CompressorOut_bh6_448_448(0); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w45_41 <= CompressorOut_bh6_448_448(1); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w46_41 <= CompressorOut_bh6_448_448(2); -- cycle= 0 cp= 4.50988e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_449_603 <= heap_bh6_w56_42 & heap_bh6_w56_41 & heap_bh6_w56_43;
   CompressorIn_bh6_449_604(0) <= heap_bh6_w57_43;
   Compressor_bh6_449: Compressor_13_3
      port map ( R => CompressorOut_bh6_449_449   ,
                 X0 => CompressorIn_bh6_449_603,
                 X1 => CompressorIn_bh6_449_604);
   heap_bh6_w56_44 <= CompressorOut_bh6_449_449(0); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w57_44 <= CompressorOut_bh6_449_449(1); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w58_43 <= CompressorOut_bh6_449_449(2); -- cycle= 0 cp= 4.50988e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_450_605 <= heap_bh6_w59_42 & heap_bh6_w59_41 & heap_bh6_w59_43;
   CompressorIn_bh6_450_606(0) <= heap_bh6_w60_43;
   Compressor_bh6_450: Compressor_13_3
      port map ( R => CompressorOut_bh6_450_450   ,
                 X0 => CompressorIn_bh6_450_605,
                 X1 => CompressorIn_bh6_450_606);
   heap_bh6_w59_44 <= CompressorOut_bh6_450_450(0); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w60_44 <= CompressorOut_bh6_450_450(1); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w61_44 <= CompressorOut_bh6_450_450(2); -- cycle= 0 cp= 4.50988e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_451_607 <= heap_bh6_w62_43 & heap_bh6_w62_42 & heap_bh6_w62_44;
   CompressorIn_bh6_451_608(0) <= heap_bh6_w63_42;
   Compressor_bh6_451: Compressor_13_3
      port map ( R => CompressorOut_bh6_451_451   ,
                 X0 => CompressorIn_bh6_451_607,
                 X1 => CompressorIn_bh6_451_608);
   heap_bh6_w62_45 <= CompressorOut_bh6_451_451(0); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w63_43 <= CompressorOut_bh6_451_451(1); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w64_44 <= CompressorOut_bh6_451_451(2); -- cycle= 0 cp= 4.50988e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_452_609 <= heap_bh6_w65_40 & heap_bh6_w65_39 & heap_bh6_w65_41;
   CompressorIn_bh6_452_610(0) <= heap_bh6_w66_36;
   Compressor_bh6_452: Compressor_13_3
      port map ( R => CompressorOut_bh6_452_452   ,
                 X0 => CompressorIn_bh6_452_609,
                 X1 => CompressorIn_bh6_452_610);
   heap_bh6_w65_42 <= CompressorOut_bh6_452_452(0); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w66_37 <= CompressorOut_bh6_452_452(1); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w67_35 <= CompressorOut_bh6_452_452(2); -- cycle= 0 cp= 4.50988e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_453_611 <= heap_bh6_w70_24 & heap_bh6_w70_23 & heap_bh6_w70_25;
   CompressorIn_bh6_453_612(0) <= heap_bh6_w71_24;
   Compressor_bh6_453: Compressor_13_3
      port map ( R => CompressorOut_bh6_453_453   ,
                 X0 => CompressorIn_bh6_453_611,
                 X1 => CompressorIn_bh6_453_612);
   heap_bh6_w70_26 <= CompressorOut_bh6_453_453(0); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w71_25 <= CompressorOut_bh6_453_453(1); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w72_21 <= CompressorOut_bh6_453_453(2); -- cycle= 0 cp= 4.50988e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_454_613 <= heap_bh6_w77_9 & heap_bh6_w77_8 & heap_bh6_w77_10;
   CompressorIn_bh6_454_614(0) <= heap_bh6_w78_8;
   Compressor_bh6_454: Compressor_13_3
      port map ( R => CompressorOut_bh6_454_454   ,
                 X0 => CompressorIn_bh6_454_613,
                 X1 => CompressorIn_bh6_454_614);
   heap_bh6_w77_11 <= CompressorOut_bh6_454_454(0); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w78_9 <= CompressorOut_bh6_454_454(1); -- cycle= 0 cp= 4.50988e-09
   heap_bh6_w79_10 <= CompressorOut_bh6_454_454(2); -- cycle= 0 cp= 4.50988e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_455_615 <= heap_bh6_w51_39 & heap_bh6_w51_42 & heap_bh6_w51_43;
   CompressorIn_bh6_455_616 <= heap_bh6_w52_41 & heap_bh6_w52_40;
   Compressor_bh6_455: Compressor_23_3
      port map ( R => CompressorOut_bh6_455_455   ,
                 X0 => CompressorIn_bh6_455_615,
                 X1 => CompressorIn_bh6_455_616);
   heap_bh6_w51_44 <= CompressorOut_bh6_455_455(0); -- cycle= 0 cp= 5.0406e-09
   heap_bh6_w52_42 <= CompressorOut_bh6_455_455(1); -- cycle= 0 cp= 5.0406e-09
   heap_bh6_w53_43 <= CompressorOut_bh6_455_455(2); -- cycle= 0 cp= 5.0406e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_456_617 <= heap_bh6_w97_4 & heap_bh6_w97_3 & heap_bh6_w97_5;
   CompressorIn_bh6_456_618 <= heap_bh6_w98_0 & heap_bh6_w98_3;
   Compressor_bh6_456: Compressor_23_3
      port map ( R => CompressorOut_bh6_456_456   ,
                 X0 => CompressorIn_bh6_456_617,
                 X1 => CompressorIn_bh6_456_618);
   heap_bh6_w97_6 <= CompressorOut_bh6_456_456(0); -- cycle= 0 cp= 5.0406e-09
   heap_bh6_w98_4 <= CompressorOut_bh6_456_456(1); -- cycle= 0 cp= 5.0406e-09
   heap_bh6_w99_5 <= CompressorOut_bh6_456_456(2); -- cycle= 0 cp= 5.0406e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_457_619 <= heap_bh6_w64_40 & heap_bh6_w64_43 & heap_bh6_w64_44;
   CompressorIn_bh6_457_620(0) <= heap_bh6_w65_42;
   Compressor_bh6_457: Compressor_13_3
      port map ( R => CompressorOut_bh6_457_457   ,
                 X0 => CompressorIn_bh6_457_619,
                 X1 => CompressorIn_bh6_457_620);
   heap_bh6_w64_45 <= CompressorOut_bh6_457_457(0); -- cycle= 0 cp= 5.0406e-09
   heap_bh6_w65_43 <= CompressorOut_bh6_457_457(1); -- cycle= 0 cp= 5.0406e-09
   heap_bh6_w66_38 <= CompressorOut_bh6_457_457(2); -- cycle= 0 cp= 5.0406e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_458_621 <= heap_bh6_w99_4 & heap_bh6_w99_3 & heap_bh6_w99_5;
   CompressorIn_bh6_458_622 <= heap_bh6_w100_0 & heap_bh6_w100_3;
   Compressor_bh6_458: Compressor_23_3
      port map ( R => CompressorOut_bh6_458_458   ,
                 X0 => CompressorIn_bh6_458_621,
                 X1 => CompressorIn_bh6_458_622);
   heap_bh6_w99_6 <= CompressorOut_bh6_458_458(0); -- cycle= 0 cp= 5.57132e-09
   heap_bh6_w100_4 <= CompressorOut_bh6_458_458(1); -- cycle= 0 cp= 5.57132e-09
   heap_bh6_w101_5 <= CompressorOut_bh6_458_458(2); -- cycle= 0 cp= 5.57132e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_459_623 <= heap_bh6_w53_42 & heap_bh6_w53_41 & heap_bh6_w53_43;
   CompressorIn_bh6_459_624(0) <= heap_bh6_w54_43;
   Compressor_bh6_459: Compressor_13_3
      port map ( R => CompressorOut_bh6_459_459   ,
                 X0 => CompressorIn_bh6_459_623,
                 X1 => CompressorIn_bh6_459_624);
   heap_bh6_w53_44 <= CompressorOut_bh6_459_459(0); -- cycle= 0 cp= 5.57132e-09
   heap_bh6_w54_44 <= CompressorOut_bh6_459_459(1); -- cycle= 0 cp= 5.57132e-09
   heap_bh6_w55_43 <= CompressorOut_bh6_459_459(2); -- cycle= 0 cp= 5.57132e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh6_460_625 <= heap_bh6_w101_4 & heap_bh6_w101_3 & heap_bh6_w101_5;
   CompressorIn_bh6_460_626(0) <= heap_bh6_w102_2;
   Compressor_bh6_460: Compressor_13_3
      port map ( R => CompressorOut_bh6_460_460   ,
                 X0 => CompressorIn_bh6_460_625,
                 X1 => CompressorIn_bh6_460_626);
   heap_bh6_w101_6 <= CompressorOut_bh6_460_460(0); -- cycle= 0 cp= 6.10204e-09
   heap_bh6_w102_3 <= CompressorOut_bh6_460_460(1); -- cycle= 0 cp= 6.10204e-09
   heap_bh6_w103_4 <= CompressorOut_bh6_460_460(2); -- cycle= 0 cp= 6.10204e-09
   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   finalAdderIn0_bh6 <= "0" & heap_bh6_w125_0_d1 & heap_bh6_w124_0_d1 & heap_bh6_w123_0_d1 & heap_bh6_w122_0_d1 & heap_bh6_w121_0_d1 & heap_bh6_w120_0_d1 & heap_bh6_w119_0_d1 & heap_bh6_w118_0_d1 & heap_bh6_w117_0_d1 & heap_bh6_w116_0_d1 & heap_bh6_w115_0_d1 & heap_bh6_w114_0_d1 & heap_bh6_w113_0_d1 & heap_bh6_w112_0_d1 & heap_bh6_w111_0_d1 & heap_bh6_w110_0_d1 & heap_bh6_w109_0_d1 & heap_bh6_w108_2_d1 & heap_bh6_w107_3_d1 & heap_bh6_w106_2_d1 & heap_bh6_w105_3_d1 & heap_bh6_w104_2_d1 & heap_bh6_w103_3_d1 & heap_bh6_w102_3_d1 & heap_bh6_w101_6_d1 & heap_bh6_w100_4_d1 & heap_bh6_w99_6_d1 & heap_bh6_w98_4_d1 & heap_bh6_w97_6_d1 & heap_bh6_w96_4_d1 & heap_bh6_w95_6_d1 & heap_bh6_w94_4_d1 & heap_bh6_w93_6_d1 & heap_bh6_w92_3_d1 & heap_bh6_w91_8_d1 & heap_bh6_w90_6_d1 & heap_bh6_w89_8_d1 & heap_bh6_w88_6_d1 & heap_bh6_w87_8_d1 & heap_bh6_w86_6_d1 & heap_bh6_w85_8_d1 & heap_bh6_w84_6_d1 & heap_bh6_w83_8_d1 & heap_bh6_w82_6_d1 & heap_bh6_w81_8_d1 & heap_bh6_w80_6_d1 & heap_bh6_w79_9_d1 & heap_bh6_w78_9_d1 & heap_bh6_w77_11_d1 & heap_bh6_w76_11_d1 & heap_bh6_w75_11_d1 & heap_bh6_w74_18_d1 & heap_bh6_w73_20_d1 & heap_bh6_w72_20_d1 & heap_bh6_w71_25_d1 & heap_bh6_w70_26_d1 & heap_bh6_w69_25_d1 & heap_bh6_w68_34_d1 & heap_bh6_w67_34_d1 & heap_bh6_w66_37_d1 & heap_bh6_w65_43_d1 & heap_bh6_w64_45_d1 & heap_bh6_w63_43_d1 & heap_bh6_w62_45_d1 & heap_bh6_w61_43_d1 & heap_bh6_w60_44_d1 & heap_bh6_w59_44_d1 & heap_bh6_w58_42_d1 & heap_bh6_w57_44_d1 & heap_bh6_w56_44_d1 & heap_bh6_w55_42_d1 & heap_bh6_w54_44_d1 & heap_bh6_w53_44_d1 & heap_bh6_w52_42_d1 & heap_bh6_w51_44_d1 & heap_bh6_w50_42_d1 & heap_bh6_w49_41_d1 & heap_bh6_w48_43_d1 & heap_bh6_w47_42_d1 & heap_bh6_w46_40_d1 & heap_bh6_w45_41_d1 & heap_bh6_w44_41_d1 & heap_bh6_w43_41_d1 & heap_bh6_w42_40_d1 & heap_bh6_w41_40_d1 & heap_bh6_w40_41_d1 & heap_bh6_w39_39_d1 & heap_bh6_w38_35_d1 & heap_bh6_w37_41_d1 & heap_bh6_w36_38_d1 & heap_bh6_w35_39_d1 & heap_bh6_w34_38_d1 & heap_bh6_w33_40_d1 & heap_bh6_w32_37_d1 & heap_bh6_w31_41_d1 & heap_bh6_w30_37_d1 & heap_bh6_w29_39_d1 & heap_bh6_w28_36_d1 & heap_bh6_w27_37_d1 & heap_bh6_w26_35_d1 & heap_bh6_w25_30_d1 & heap_bh6_w24_32_d1 & heap_bh6_w23_27_d1 & heap_bh6_w22_29_d1 & heap_bh6_w21_25_d1 & heap_bh6_w20_26_d1 & heap_bh6_w19_23_d1 & heap_bh6_w18_23_d1 & heap_bh6_w17_18_d1 & heap_bh6_w16_20_d1 & heap_bh6_w15_18_d1 & heap_bh6_w14_19_d1 & heap_bh6_w13_15_d1 & heap_bh6_w12_16_d1 & heap_bh6_w11_11_d1 & heap_bh6_w10_11_d1 & heap_bh6_w9_11_d1 & heap_bh6_w8_5_d1 & heap_bh6_w7_8_d1 & heap_bh6_w6_6_d1 & heap_bh6_w5_4_d1 & heap_bh6_w4_0_d1;
   finalAdderIn1_bh6 <= "0" & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & heap_bh6_w109_1_d1 & '0' & '0' & '0' & '0' & '0' & heap_bh6_w103_4_d1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & heap_bh6_w92_4_d1 & heap_bh6_w91_7_d1 & '0' & heap_bh6_w89_7_d1 & '0' & heap_bh6_w87_7_d1 & '0' & heap_bh6_w85_7_d1 & '0' & heap_bh6_w83_7_d1 & '0' & heap_bh6_w81_7_d1 & heap_bh6_w80_7_d1 & heap_bh6_w79_10_d1 & '0' & '0' & '0' & heap_bh6_w75_12_d1 & '0' & '0' & heap_bh6_w72_21_d1 & '0' & '0' & heap_bh6_w69_26_d1 & heap_bh6_w68_33_d1 & heap_bh6_w67_35_d1 & heap_bh6_w66_38_d1 & '0' & '0' & '0' & '0' & heap_bh6_w61_44_d1 & '0' & '0' & heap_bh6_w58_43_d1 & '0' & '0' & heap_bh6_w55_43_d1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & heap_bh6_w47_41_d1 & heap_bh6_w46_41_d1 & '0' & '0' & heap_bh6_w43_42_d1 & '0' & '0' & '0' & '0' & heap_bh6_w38_38_d1 & heap_bh6_w37_40_d1 & '0' & heap_bh6_w35_38_d1 & heap_bh6_w34_40_d1 & heap_bh6_w33_39_d1 & '0' & heap_bh6_w31_40_d1 & '0' & '0' & heap_bh6_w28_35_d1 & heap_bh6_w27_36_d1 & heap_bh6_w26_34_d1 & heap_bh6_w25_33_d1 & heap_bh6_w24_31_d1 & heap_bh6_w23_30_d1 & heap_bh6_w22_28_d1 & heap_bh6_w21_28_d1 & '0' & heap_bh6_w19_22_d1 & heap_bh6_w18_22_d1 & heap_bh6_w17_21_d1 & heap_bh6_w16_21_d1 & heap_bh6_w15_19_d1 & heap_bh6_w14_18_d1 & '0' & '0' & heap_bh6_w11_10_d1 & heap_bh6_w10_10_d1 & heap_bh6_w9_10_d1 & heap_bh6_w8_8_d1 & '0' & heap_bh6_w6_5_d1 & heap_bh6_w5_3_d1 & heap_bh6_w4_3_d1;
   finalAdderCin_bh6 <= '0';
   Adder_final6_0: IntAdder_123_f120_uid662  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => finalAdderCin_bh6,
                 R => finalAdderOut_bh6   ,
                 X => finalAdderIn0_bh6,
                 Y => finalAdderIn1_bh6);
   -- concatenate all the compressed chunks
   CompressionResult6 <= finalAdderOut_bh6 & tempR_bh6_1_d1 & tempR_bh6_0_d1;
   -- End of code generated by BitHeap::generateCompressorVHDL
   R <= CompressionResult6(125 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                          IntAdder_76_f120_uid670
--                    (IntAdderAlternative_76_f120_uid674)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_76_f120_uid670 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(75 downto 0);
          Y : in  std_logic_vector(75 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(75 downto 0)   );
end entity;

architecture arch of IntAdder_76_f120_uid670 is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Alternative
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                                 FPMul1262
--                      (FPMult_12_62_12_62_12_62_uid2)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved
-- Authors: Bogdan Pasca, Florent de Dinechin 2008-2011
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FPMul1262 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(12+62+2 downto 0);
          Y : in  std_logic_vector(12+62+2 downto 0);
          R : out  std_logic_vector(12+62+2 downto 0);
    roundit : in std_logic  );        --mod by JDH 11/27/2018
end entity;

architecture arch of FPMul1262 is
   component IntAdder_76_f120_uid670 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(75 downto 0);
             Y : in  std_logic_vector(75 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(75 downto 0)   );
   end component;

   component IntMultiplier_UsingDSP_63_63_126_unsigned_uid4 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(62 downto 0);
             Y : in  std_logic_vector(62 downto 0);
             R : out  std_logic_vector(125 downto 0)   );
   end component;

signal sign, sign_d1 :  std_logic;
signal expX :  std_logic_vector(11 downto 0);
signal expY :  std_logic_vector(11 downto 0);
signal expSumPreSub :  std_logic_vector(13 downto 0);
signal bias :  std_logic_vector(13 downto 0);
signal expSum, expSum_d1 :  std_logic_vector(13 downto 0);
signal sigX :  std_logic_vector(62 downto 0);
signal sigY :  std_logic_vector(62 downto 0);
signal sigProd :  std_logic_vector(125 downto 0);
signal excSel :  std_logic_vector(3 downto 0);
signal exc, exc_d1 :  std_logic_vector(1 downto 0);
signal norm :  std_logic;
signal expPostNorm :  std_logic_vector(13 downto 0);
signal sigProdExt :  std_logic_vector(125 downto 0);
signal expSig :  std_logic_vector(75 downto 0);
--signal sticky :  std_logic;
--signal guard :  std_logic;
--signal round :  std_logic;
signal expSigPostRound :  std_logic_vector(75 downto 0);
signal excPostNorm :  std_logic_vector(1 downto 0);
signal finalExc :  std_logic_vector(1 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            sign_d1 <=  sign;
            expSum_d1 <=  expSum;
            exc_d1 <=  exc;
         end if;
      end process;
   sign <= X(74) xor Y(74);
   expX <= X(73 downto 62);
   expY <= Y(73 downto 62);
   expSumPreSub <= ("00" & expX) + ("00" & expY);
   bias <= CONV_STD_LOGIC_VECTOR(2047,14);
   expSum <= expSumPreSub - bias;
   ----------------Synchro barrier, entering cycle 0----------------
   sigX <= "1" & X(61 downto 0);
   sigY <= "1" & Y(61 downto 0);
   SignificandMultiplication: IntMultiplier_UsingDSP_63_63_126_unsigned_uid4  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => sigProd,
                 X => sigX,
                 Y => sigY);
   ----------------Synchro barrier, entering cycle 1----------------
   ----------------Synchro barrier, entering cycle 0----------------
   excSel <= X(76 downto 75) & Y(76 downto 75);
   with excSel select
   exc <= "00" when  "0000" | "0001" | "0100",
          "01" when "0101",
          "10" when "0110" | "1001" | "1010" ,
          "11" when others;
   ----------------Synchro barrier, entering cycle 1----------------
   norm <= sigProd(125);
   -- exponent update
   expPostNorm <= expSum_d1 + ("0000000000000" & norm);
   ----------------Synchro barrier, entering cycle 1----------------
   -- significand normalization shift
   sigProdExt <= sigProd(124 downto 0) & "0" when norm='1' else
                         sigProd(123 downto 0) & "00";
   expSig <= expPostNorm & sigProdExt(125 downto 64);
--   sticky <= sigProdExt(63);        --mod by JDH 11/27/2018
--   guard <= '0' when sigProdExt(62 downto 0)="000000000000000000000000000000000000000000000000000000000000000" else '1';
--   round <= sticky and ( (guard and not(sigProdExt(64))) or (sigProdExt(64) ))  ;

   RoundingAdder: IntAdder_76_f120_uid670  -- pipelineDepth=0 maxInDelay=3.05416e-09
      port map ( clk  => clk,
                 rst  => rst,
--                 Cin => round,
                 Cin => roundit,       --mod by JDH 11/27/2018
                 R => expSigPostRound   ,
                 X => expSig,
                 Y => "0000000000000000000000000000000000000000000000000000000000000000000000000000");
   with expSigPostRound(75 downto 74) select
   excPostNorm <=  "01"  when  "00",
                               "10"             when "01",
                               "00"             when "11"|"10",
                               "11"             when others;
   with exc_d1 select
   finalExc <= exc_d1 when  "11"|"10"|"00",
                       excPostNorm when others;
   R <= finalExc & sign_d1 & expSigPostRound(73 downto 0);
end architecture;

