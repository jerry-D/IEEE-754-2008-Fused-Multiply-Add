--FPAdd1262.vhdl
--vagrant@vagrant-ubuntu-trusty-32:~/flopoco-3.0.beta5$ ./flopoco -name=FPAdd1262 -frequency=120 -useHardMult=no FPAdd 12 62
--Updating entity name to: FPAdd1262
--
--Final report:
--|---Entity IntAdder_77_f120_uid4
--|      Not pipelined
--|---Entity FPAdd_12_62_uid2_RightShifter
--|      Not pipelined
--|---Entity IntAdder_66_f120_uid14
--|      Not pipelined
--|---Entity LZCShifter_67_to_67_counting_128_uid21
--|      Pipeline depth = 1
--|---Entity IntAdder_77_f120_uid24
--|      Pipeline depth = 1
--Entity FPAdd1262
--   Pipeline depth = 3
--Output file: flopoco.vhdl
--vagrant@vagrant-ubuntu-trusty-32:~/flopoco-3.0.beta5$ cat flopoco.vhdl
--------------------------------------------------------------------------------
--                           IntAdder_77_f120_uid4
--                     (IntAdderAlternative_77_f120_uid8)
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

entity IntAdder_77_f120_uid4 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(76 downto 0);
          Y : in  std_logic_vector(76 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(76 downto 0)   );
end entity;

architecture arch of IntAdder_77_f120_uid4 is
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
--                       FPAdd_12_62_uid2_RightShifter
--                     (RightShifter_63_by_max_65_uid11)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2011)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FPAdd_12_62_uid2_RightShifter is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(62 downto 0);
          S : in  std_logic_vector(6 downto 0);
          R : out  std_logic_vector(127 downto 0)   );
end entity;

architecture arch of FPAdd_12_62_uid2_RightShifter is
signal level0 :  std_logic_vector(62 downto 0);
signal ps :  std_logic_vector(6 downto 0);
signal level1 :  std_logic_vector(63 downto 0);
signal level2 :  std_logic_vector(65 downto 0);
signal level3 :  std_logic_vector(69 downto 0);
signal level4 :  std_logic_vector(77 downto 0);
signal level5 :  std_logic_vector(93 downto 0);
signal level6 :  std_logic_vector(125 downto 0);
signal level7 :  std_logic_vector(189 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   level0<= X;
   ps<= S;
   level1<=  (0 downto 0 => '0') & level0 when ps(0) = '1' else    level0 & (0 downto 0 => '0');
   level2<=  (1 downto 0 => '0') & level1 when ps(1) = '1' else    level1 & (1 downto 0 => '0');
   level3<=  (3 downto 0 => '0') & level2 when ps(2) = '1' else    level2 & (3 downto 0 => '0');
   level4<=  (7 downto 0 => '0') & level3 when ps(3) = '1' else    level3 & (7 downto 0 => '0');
   level5<=  (15 downto 0 => '0') & level4 when ps(4) = '1' else    level4 & (15 downto 0 => '0');
   level6<=  (31 downto 0 => '0') & level5 when ps(5) = '1' else    level5 & (31 downto 0 => '0');
   level7<=  (63 downto 0 => '0') & level6 when ps(6) = '1' else    level6 & (63 downto 0 => '0');
   R <= level7(189 downto 62);
end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_66_f120_uid14
--                    (IntAdderAlternative_66_f120_uid18)
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

entity IntAdder_66_f120_uid14 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(65 downto 0);
          Y : in  std_logic_vector(65 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(65 downto 0)   );
end entity;

architecture arch of IntAdder_66_f120_uid14 is
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
--                   LZCShifter_67_to_67_counting_128_uid21
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved
-- Authors: Florent de Dinechin, Bogdan Pasca (2007)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity LZCShifter_67_to_67_counting_128_uid21 is
   port ( clk, rst : in std_logic;
          I : in  std_logic_vector(66 downto 0);
          Count : out  std_logic_vector(6 downto 0);
          O : out  std_logic_vector(66 downto 0)   );
end entity;

architecture arch of LZCShifter_67_to_67_counting_128_uid21 is
signal level7 :  std_logic_vector(66 downto 0);
signal count6, count6_d1 :  std_logic;
signal level6 :  std_logic_vector(66 downto 0);
signal count5, count5_d1 :  std_logic;
signal level5, level5_d1 :  std_logic_vector(66 downto 0);
signal count4, count4_d1 :  std_logic;
signal level4 :  std_logic_vector(66 downto 0);
signal count3 :  std_logic;
signal level3 :  std_logic_vector(66 downto 0);
signal count2 :  std_logic;
signal level2 :  std_logic_vector(66 downto 0);
signal count1 :  std_logic;
signal level1 :  std_logic_vector(66 downto 0);
signal count0 :  std_logic;
signal level0 :  std_logic_vector(66 downto 0);
signal sCount :  std_logic_vector(6 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            count6_d1 <=  count6;
            count5_d1 <=  count5;
            level5_d1 <=  level5;
            count4_d1 <=  count4;
         end if;
      end process;
   level7 <= I ;
   count6<= '1' when level7(66 downto 3) = (66 downto 3=>'0') else '0';
   level6<= level7(66 downto 0) when count6='0' else level7(2 downto 0) & (63 downto 0 => '0');

   count5<= '1' when level6(66 downto 35) = (66 downto 35=>'0') else '0';
   level5<= level6(66 downto 0) when count5='0' else level6(34 downto 0) & (31 downto 0 => '0');

   count4<= '1' when level5(66 downto 51) = (66 downto 51=>'0') else '0';
   ----------------Synchro barrier, entering cycle 1----------------
   level4<= level5_d1(66 downto 0) when count4_d1='0' else level5_d1(50 downto 0) & (15 downto 0 => '0');

   count3<= '1' when level4(66 downto 59) = (66 downto 59=>'0') else '0';
   level3<= level4(66 downto 0) when count3='0' else level4(58 downto 0) & (7 downto 0 => '0');

   count2<= '1' when level3(66 downto 63) = (66 downto 63=>'0') else '0';
   level2<= level3(66 downto 0) when count2='0' else level3(62 downto 0) & (3 downto 0 => '0');

   count1<= '1' when level2(66 downto 65) = (66 downto 65=>'0') else '0';
   level1<= level2(66 downto 0) when count1='0' else level2(64 downto 0) & (1 downto 0 => '0');

   count0<= '1' when level1(66 downto 66) = (66 downto 66=>'0') else '0';
   level0<= level1(66 downto 0) when count0='0' else level1(65 downto 0) & (0 downto 0 => '0');

   O <= level0;
   sCount <= count6_d1 & count5_d1 & count4_d1 & count3 & count2 & count1 & count0;
   Count <= sCount;
end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_77_f120_uid24
--                     (IntAdderClassical_77_f120_uid26)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_77_f120_uid24 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(76 downto 0);
          Y : in  std_logic_vector(76 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(76 downto 0)   );
end entity;

architecture arch of IntAdder_77_f120_uid24 is
signal X_d1 :  std_logic_vector(76 downto 0);
signal Y_d1 :  std_logic_vector(76 downto 0);
signal Cin_d1 :  std_logic;
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            X_d1 <=  X;
            Y_d1 <=  Y;
            Cin_d1 <=  Cin;
         end if;
      end process;
   --Classical
   ----------------Synchro barrier, entering cycle 1----------------
    R <= X_d1 + Y_d1 + Cin_d1;
end architecture;

--------------------------------------------------------------------------------
--                                 FPAdd1262
--                             (FPAdd_12_62_uid2)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved
-- Authors: Bogdan Pasca, Florent de Dinechin (2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 3 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FPAdd1262 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(12+62+2 downto 0);
          Y : in  std_logic_vector(12+62+2 downto 0);
          R : out  std_logic_vector(12+62+2 downto 0);
 addToRoundBit : in std_logic );       --mod by JDH 11/27/2018
end entity;

architecture arch of FPAdd1262 is
   component FPAdd_12_62_uid2_RightShifter is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(62 downto 0);
             S : in  std_logic_vector(6 downto 0);
             R : out  std_logic_vector(127 downto 0)   );
   end component;

   component IntAdder_66_f120_uid14 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(65 downto 0);
             Y : in  std_logic_vector(65 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(65 downto 0)   );
   end component;

   component IntAdder_77_f120_uid24 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(76 downto 0);
             Y : in  std_logic_vector(76 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(76 downto 0)   );
   end component;

   component IntAdder_77_f120_uid4 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(76 downto 0);
             Y : in  std_logic_vector(76 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(76 downto 0)   );
   end component;

   component LZCShifter_67_to_67_counting_128_uid21 is
      port ( clk, rst : in std_logic;
             I : in  std_logic_vector(66 downto 0);
             Count : out  std_logic_vector(6 downto 0);
             O : out  std_logic_vector(66 downto 0)   );
   end component;

signal excExpFracX :  std_logic_vector(75 downto 0);
signal excExpFracY :  std_logic_vector(75 downto 0);
signal eXmeY :  std_logic_vector(12 downto 0);
signal eYmeX :  std_logic_vector(12 downto 0);
signal addCmpOp1 :  std_logic_vector(76 downto 0);
signal addCmpOp2 :  std_logic_vector(76 downto 0);
signal cmpRes :  std_logic_vector(76 downto 0);
signal swap :  std_logic;
signal newX, newX_d1 :  std_logic_vector(76 downto 0);
signal newY :  std_logic_vector(76 downto 0);
signal expX, expX_d1 :  std_logic_vector(11 downto 0);
signal excX :  std_logic_vector(1 downto 0);
signal excY :  std_logic_vector(1 downto 0);
signal signX :  std_logic;
signal signY :  std_logic;
signal EffSub, EffSub_d1, EffSub_d2, EffSub_d3 :  std_logic;
signal sXsYExnXY :  std_logic_vector(5 downto 0);
signal sdExnXY :  std_logic_vector(3 downto 0);
signal fracY :  std_logic_vector(62 downto 0);
signal excRt, excRt_d1, excRt_d2, excRt_d3 :  std_logic_vector(1 downto 0);
signal signR, signR_d1, signR_d2, signR_d3 :  std_logic;
signal expDiff :  std_logic_vector(12 downto 0);
signal shiftedOut :  std_logic;
signal shiftVal :  std_logic_vector(6 downto 0);
signal shiftedFracY, shiftedFracY_d1 :  std_logic_vector(127 downto 0);
signal sticky :  std_logic;
signal fracYfar :  std_logic_vector(65 downto 0);
signal EffSubVector :  std_logic_vector(65 downto 0);
signal fracYfarXorOp :  std_logic_vector(65 downto 0);
signal fracXfar :  std_logic_vector(65 downto 0);
signal cInAddFar :  std_logic;
signal fracAddResult :  std_logic_vector(65 downto 0);
signal fracGRS :  std_logic_vector(66 downto 0);
signal extendedExpInc, extendedExpInc_d1 :  std_logic_vector(13 downto 0);
signal nZerosNew :  std_logic_vector(6 downto 0);
signal shiftedFrac :  std_logic_vector(66 downto 0);
signal updatedExp :  std_logic_vector(13 downto 0);
signal eqdiffsign, eqdiffsign_d1 :  std_logic;
signal expFrac :  std_logic_vector(76 downto 0);
--signal stk :  std_logic;  --mod by JDH
--signal rnd :  std_logic;
--signal grd :  std_logic;
--signal lsb :  std_logic;
--signal addToRoundBit :  std_logic;  --mod by JDH
signal RoundedExpFrac :  std_logic_vector(76 downto 0);
signal upExc :  std_logic_vector(1 downto 0);
signal fracR :  std_logic_vector(61 downto 0);
signal expR :  std_logic_vector(11 downto 0);
signal exExpExc :  std_logic_vector(3 downto 0);
signal excRt2 :  std_logic_vector(1 downto 0);
signal excR :  std_logic_vector(1 downto 0);
signal signR2 :  std_logic;
signal computedR :  std_logic_vector(76 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            newX_d1 <=  newX;
            expX_d1 <=  expX;
            EffSub_d1 <=  EffSub;
            EffSub_d2 <=  EffSub_d1;
            EffSub_d3 <=  EffSub_d2;
            excRt_d1 <=  excRt;
            excRt_d2 <=  excRt_d1;
            excRt_d3 <=  excRt_d2;
            signR_d1 <=  signR;
            signR_d2 <=  signR_d1;
            signR_d3 <=  signR_d2;
            shiftedFracY_d1 <=  shiftedFracY;
            extendedExpInc_d1 <=  extendedExpInc;
            eqdiffsign_d1 <=  eqdiffsign;
         end if;
      end process;
-- Exponent difference and swap  --
   excExpFracX <= X(76 downto 75) & X(73 downto 0);
   excExpFracY <= Y(76 downto 75) & Y(73 downto 0);
   eXmeY <= ("0" & X(73 downto 62)) - ("0" & Y(73 downto 62));
   eYmeX <= ("0" & Y(73 downto 62)) - ("0" & X(73 downto 62));
   addCmpOp1<= "0" & excExpFracX;
   addCmpOp2<= "1" & not(excExpFracY);
   cmpAdder: IntAdder_77_f120_uid4  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => '1',
                 R => cmpRes,
                 X => addCmpOp1,
                 Y => addCmpOp2);

   swap <= cmpRes(76);
   newX <= X when swap = '0' else Y;
   newY <= Y when swap = '0' else X;
   expX<= newX(73 downto 62);
   excX<= newX(76 downto 75);
   excY<= newY(76 downto 75);
   signX<= newX(74);
   signY<= newY(74);
   EffSub <= signX xor signY;
   sXsYExnXY <= signX & signY & excX & excY;
   sdExnXY <= excX & excY;
   fracY <= "000000000000000000000000000000000000000000000000000000000000000" when excY="00" else ('1' & newY(61 downto 0));
   with sXsYExnXY select
   excRt <= "00" when "000000"|"010000"|"100000"|"110000",
      "01" when "000101"|"010101"|"100101"|"110101"|"000100"|"010100"|"100100"|"110100"|"000001"|"010001"|"100001"|"110001",
      "10" when "111010"|"001010"|"001000"|"011000"|"101000"|"111000"|"000010"|"010010"|"100010"|"110010"|"001001"|"011001"|"101001"|"111001"|"000110"|"010110"|"100110"|"110110",
      "11" when others;
   signR<= '0' when (sXsYExnXY="100000" or sXsYExnXY="010000") else signX;
   ---------------- cycle 0----------------
   expDiff <= eXmeY when swap = '0' else eYmeX;
   shiftedOut <= '1' when (expDiff >= 64) else '0';
   shiftVal <= expDiff(6 downto 0) when shiftedOut='0' else CONV_STD_LOGIC_VECTOR(65,7) ;
   RightShifterComponent: FPAdd_12_62_uid2_RightShifter  -- pipelineDepth=0 maxInDelay=5.26788e-09
      port map ( clk  => clk,
                 rst  => rst,
                 R => shiftedFracY,
                 S => shiftVal,
                 X => fracY);
   ----------------Synchro barrier, entering cycle 1----------------
   sticky <= '0' when (shiftedFracY_d1(62 downto 0)=CONV_STD_LOGIC_VECTOR(0,62)) else '1';
   ---------------- cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   fracYfar <= "0" & shiftedFracY_d1(127 downto 63);
   EffSubVector <= (65 downto 0 => EffSub_d1);
   fracYfarXorOp <= fracYfar xor EffSubVector;
   fracXfar <= "01" & (newX_d1(61 downto 0)) & "00";
   cInAddFar <= EffSub_d1 and not sticky;
   fracAdder: IntAdder_66_f120_uid14  -- pipelineDepth=0 maxInDelay=1.61944e-09
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => cInAddFar,
                 R => fracAddResult,
                 X => fracXfar,
                 Y => fracYfarXorOp);
   fracGRS<= fracAddResult & sticky;
   extendedExpInc<= ("00" & expX_d1) + '1';
   LZC_component: LZCShifter_67_to_67_counting_128_uid21  -- pipelineDepth=1 maxInDelay=3.80544e-09
      port map ( clk  => clk,
                 rst  => rst,
                 Count => nZerosNew,
                 I => fracGRS,
                 O => shiftedFrac);
   ----------------Synchro barrier, entering cycle 2----------------
   updatedExp <= extendedExpInc_d1 - ("0000000" & nZerosNew);
   eqdiffsign <= '1' when nZerosNew="1111111" else '0';
   expFrac<= updatedExp & shiftedFrac(65 downto 3);
   ---------------- cycle 2----------------
--   stk<= shiftedFrac(1) or shiftedFrac(0);        --mod by JDH 11/27/2018
--   rnd<= shiftedFrac(2);
--   grd<= shiftedFrac(3);
--   lsb<= shiftedFrac(4);
--   addToRoundBit<= '0' when (lsb='0' and grd='1' and rnd='0' and stk='0')  else '1';  
   roundingAdder: IntAdder_77_f120_uid24  -- pipelineDepth=1 maxInDelay=7.01548e-09
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => addToRoundBit,
                 R => RoundedExpFrac,
                 X => expFrac,
                 Y => "00000000000000000000000000000000000000000000000000000000000000000000000000000");
   ---------------- cycle 3----------------
   upExc <= RoundedExpFrac(76 downto 75);
   fracR <= RoundedExpFrac(62 downto 1);
   expR <= RoundedExpFrac(74 downto 63);
   exExpExc <= upExc & excRt_d3;
   with (exExpExc) select
   excRt2<= "00" when "0000"|"0100"|"1000"|"1100"|"1001"|"1101",
      "01" when "0001",
      "10" when "0010"|"0110"|"1010"|"1110"|"0101",
      "11" when others;
   excR <= "00" when (eqdiffsign_d1='1' and EffSub_d3='1') else excRt2;
   signR2 <= '0' when (eqdiffsign_d1='1' and EffSub_d3='1') else signR_d3;
   computedR <= excR & signR2 & expR & fracR;
   R <= computedR;
end architecture;

