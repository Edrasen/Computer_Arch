
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity alu1 is
    Port ( a,b,cin,sela,selb : in  STD_LOGIC;
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           res,cout : out  STD_LOGIC);
end alu1;

architecture Behavioral of alu1 is

component sum1 is
    Port ( a,b,cin : in  STD_LOGIC;
           s,cout : out  STD_LOGIC);
end component;



signal aux_a, aux_b, res_and, res_or, res_xor, res_suma : std_logic;
begin

	aux_a <= a xor sela;
	aux_b <= b xor selb;
	
	
	res_and <= aux_a and aux_b;
	res_or <= aux_a or aux_b;
	res_xor <= aux_a xor aux_b;
	
	sumador: sum1 port map (
		a => aux_a,
		b => aux_b,
		cin => cin,
      	s => res_suma,
		cout => cout 
		);
		
	res <= res_and when op = "00" else 
			 res_or when op = "01" else 
			 res_xor when op = "10" else 
			 res_suma;

end Behavioral;

