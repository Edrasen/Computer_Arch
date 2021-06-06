
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity barrelSh_tb is
end;

architecture bench of barrelSh_tb is

  component barrelSh
      Port ( readData : in STD_LOGIC_VECTOR (15 downto 0);
             s : in STD_LOGIC_VECTOR (3 downto 0);
             dir : in STD_LOGIC;
             res : out STD_LOGIC_VECTOR (15 downto 0));
  end component;

  signal readData: STD_LOGIC_VECTOR (15 downto 0);
  signal s: STD_LOGIC_VECTOR (3 downto 0);
  signal dir: STD_LOGIC;
  signal res: STD_LOGIC_VECTOR (15 downto 0);

begin

  uut: barrelSh port map ( readData => readData,
                           s        => s,
                           dir      => dir,
                           res      => res );

  stimulus: process
  begin
  
   s <= "1001";
   readData <= x"FFFF";
   dir <= '0';
   wait for 100ns;
   readData <= x"00FF";
   dir <= '1';
   s <= "0101";
   wait for 100ns;
   wait;
  end process;


end;
  