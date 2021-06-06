library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Suma8Bits is
		generic (
			n : integer := 8
		);
    Port ( a,b : in  STD_LOGIC_VECTOR (n-1 downto 0);
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (n-1 downto 0));
end Suma8Bits;

architecture Behavioral of Suma8Bits is

component SumaBit is
    Port ( a,b,cin : in  STD_LOGIC;
           s,cout : out  STD_LOGIC);
end component;

signal c : std_logic_vector(n downto 0);
signal eb: std_logic_vector(n-1 downto 0);

begin

	c(0) <= cin;
    ciclo: for i in 0 to n-1 generate
    
    eb(i) <= b(i) xor c(0);
    
        biti : SumaBit Port map (
         a => a(i), 
         b => eb(i),
         cin => c(i),
         s => s(i),
         cout => c(i+1)
         );
    end generate;
     
    cout <= c(n);
	
end Behavioral;

