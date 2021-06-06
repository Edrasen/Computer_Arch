
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity alun is
			generic(
				no : integer := 4
			);
    Port ( a,b : in  STD_LOGIC_VECTOR (no-1 downto 0);
           cn : in  STD_LOGIC_VECTOR (3 downto 0);
           res : out  STD_LOGIC_VECTOR (no-1 downto 0);
           c : out  STD_LOGIC;
           n : out  STD_LOGIC;
           ov : out  STD_LOGIC;
           z : out  STD_LOGIC
			  );
end alun;

architecture Behavioral of alun is

component alu1 is
	port(a,b,cin,sela,selb : in  STD_LOGIC;
        op : in  STD_LOGIC_VECTOR (1 downto 0);
        res,cout : out  STD_LOGIC);
end component;

signal ca : std_logic_vector(no downto 0);
signal re : std_logic_vector(no-1 downto 0);
signal q : std_logic;
begin
			ca(0)<=cn(2);
			ciclo: for i in 0 to no-1 generate
			objeto1: alu1 port map
			(	a => a(i),
				b => b(i),
				cin => ca(i),
				sela => cn(3),
				selb => cn(2),
				op(1) => cn(1),
				op(0) => cn(0),
				res => re(i),
				cout => ca(i+1)
			);
			--q<=re(i) or q;
			end generate;
			c<= ca(no) when (cn and "0011")="0011" else 
				'0';
			ov<= ca(no) xor ca(no-1) when (cn and "0011")="0011" else
				'0';
			n <= re(no-1);
			--ov <= ca(no) xor ca(no-1);
			res<=re;
			--sq <= '0';
			z<=not(re(0) or re(1) or re(2) or re(3));
		
end Behavioral;

