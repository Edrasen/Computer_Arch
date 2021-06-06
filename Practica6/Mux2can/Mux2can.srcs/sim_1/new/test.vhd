library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mux2chan_tb is
end;

architecture bench of mux2chan_tb is

  component mux2chan
      Port ( shift : in STD_LOGIC_VECTOR (15 downto 0);
             writeData : in STD_LOGIC_VECTOR (15 downto 0);
             SHE : in STD_LOGIC;
             Dout : out STD_LOGIC_VECTOR (15 downto 0));
  end component;

  signal shift: STD_LOGIC_VECTOR (15 downto 0);
  signal writeData: STD_LOGIC_VECTOR (15 downto 0);
  signal SHE: STD_LOGIC;
  signal Dout: STD_LOGIC_VECTOR (15 downto 0);

begin

  uut: mux2chan port map ( shift     => shift,
                           writeData => writeData,
                           SHE       => SHE,
                           Dout      => Dout );

  stimulus: process
  begin
  
    SHE <= '0';
    shift <= "1111111100000000";
    writeData <= "0000000011111111";
    wait for 100 ns;
    SHE <= '1';
    shift <= "1010101010101010";
    writeData <= "0101010101010101";
    wait for 100 ns;
    SHE <= '0';
    shift <= "1111000011110000";
    writeData <= "0000111100001111";
    wait for 100 ns;
    SHE <= '1';
    shift <= "1100110011001100";
    writeData <= "0011001100110011";
    wait for 100 ns;
    SHE <= '1';
    shift <= "1111111100000000";
    writeData <= "0000000011111111";
    wait for 100 ns;
    wait;
  end process;


end;
  