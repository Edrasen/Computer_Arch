library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Suma8Bits_tb is
    generic(
                n : integer := 8
    );
end;

architecture bench of Suma8Bits_tb is
  component Suma8Bits
  		
      Port ( a,b : in  STD_LOGIC_VECTOR (n-1 downto 0);
             cin : in  STD_LOGIC;
             cout : out  STD_LOGIC;
             s : out  STD_LOGIC_VECTOR (n-1 downto 0));
  end component;

  signal a,b: STD_LOGIC_VECTOR (n-1 downto 0);
  signal cin: STD_LOGIC;
  signal cout: STD_LOGIC;
  signal s: STD_LOGIC_VECTOR (n-1 downto 0);

begin

  sumador: Suma8Bits
   port map ( 
        a => a,
        b => b,
        cin  => cin,
        cout => cout,
        s => s );
        
    stimulus: process
    begin
       a <= x"00"; 
       b <= x"03";
       cin <= '0';
    wait;
    end process;


end;