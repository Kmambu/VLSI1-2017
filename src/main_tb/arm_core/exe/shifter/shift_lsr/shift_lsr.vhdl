
library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;

entity shift_lsr is
  port( din           : in std_logic_vector(31 downto 0);
        cin           : in std_logic;
        shift_val     : in std_logic_vector(4 downto 0);
        
        dout          : out std_logic_vector(31 downto 0);
        cout          : out std_logic);
end shift_lsr;

architecture arch of shift_lsr is
signal stageI   : std_logic_vector(32 downto 0);
signal stage1   : std_logic_vector(32 downto 0);
signal stage2   : std_logic_vector(32 downto 0);
signal stage3   : std_logic_vector(32 downto 0);
signal stage4   : std_logic_vector(32 downto 0);
signal stageF   : std_logic_vector(32 downto 0);
begin
  stageI <= din & cin;

  stage1 <= x"0000" & stageI(32 downto 16) when (shift_val(4) = '1') else stageI;
  stage2 <= x"00"   & stage1(32 downto 8)  when (shift_val(3) = '1') else stage1;
  stage3 <= "0000"  & stage2(32 downto 4)  when (shift_val(2) = '1') else stage2;
  stage4 <= "00"    & stage3(32 downto 2)  when (shift_val(1) = '1') else stage3;
  stageF <= '0'     & stage4(32 downto 1)  when (shift_val(0) = '1') else stage4;
  
  dout   <= stageF(32 downto 1);
  cout   <= stageF(0);

end arch;

