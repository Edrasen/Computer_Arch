library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity sumador_tb is
end;

architecture bench of sumador_tb is

  component sumador
      Port ( a,b : in STD_LOGIC_VECTOR (7 downto 0);
             cin : in STD_LOGIC;
             s : out STD_LOGIC_VECTOR (7 downto 0);
             cout: out STD_LOGIC);
  end component;

  signal a,b: STD_LOGIC_VECTOR (7 downto 0);
  signal cin: STD_LOGIC;
  signal s: STD_LOGIC_VECTOR (7 downto 0);
  signal cout: STD_LOGIC;

begin

  uut: sumador port map ( a    => a,
                          b    => b,
                          cin  => cin,
                          s    => s,
                          cout => cout );

  stimulus: process
  begin
    a <= "11001000";
    b <= "01000111";
    cin <= '0';
    wait;
  end process;


end;