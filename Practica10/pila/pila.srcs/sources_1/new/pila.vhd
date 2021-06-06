library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity main is
    Port ( pc_in : in  STD_LOGIC_VECTOR (15 downto 0);
           up : in  STD_LOGIC;
           dw : in  STD_LOGIC;
           wpc : in  STD_LOGIC;
           clk : in  STD_LOGIC;
		   clr : in STD_LOGIC;
		   pc_out : out  STD_LOGIC_VECTOR (15 downto 0);
		   sp_out  : out STD_LOGIC_VECTOR(2 downto 0));
end main;

architecture Behavioral of main is
type nivel is array(0 to 7)of std_logic_vector(15 downto 0);
signal pila : nivel;
begin
process(clk, clr, pila)

variable sp : integer range 0 to 7:=0;
begin
	if(clr = '1')then			--RESET
		pila <= (others => (others => ('0')));
		sp := 0;
	elsif(rising_edge(clk))then
			if(up = '0' and dw = '0' and wpc = '0')then		--RETENCI?N INCREMENTO PC
				sp := sp;
				pila(sp) <= pila(sp) + 1;
			elsif(up = '0' and dw = '0' and wpc = '1')then  --SALTOS
				pila(sp) <= pc_in;
			elsif(up = '1' and dw = '0' and wpc = '1')then	--CALL
				sp := sp + 1;
				pila(sp) <= pc_in;
			elsif(up = '0' and dw = '1' and wpc = '0')then  --DECREMENTO
				sp := sp - 1;
				if(sp < 0) then
					sp := 7;
				end if;
				pila(sp) <= pila(sp) + 1;
			end if;
	end if;
	pc_out <= pila(sp);
	sp_out <= std_logic_vector(to_unsigned(sp, sp_out'length));
end process;
end Behavioral;

