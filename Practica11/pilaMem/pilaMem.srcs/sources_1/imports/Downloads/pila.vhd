library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pila is
    Port ( d : in  STD_LOGIC_VECTOR (15 downto 0);
           q : out  STD_LOGIC_VECTOR (9 downto 0);
		   sp_out : out std_logic_vector(2 downto 0);
           clk, clr, up, dw, wpc : in  STD_LOGIC);
end pila;

architecture Behavioral of pila is
type pcarray is array(0 to 7) of std_logic_vector(15 downto 0);
begin

	process(clk,clr)
	variable sp : std_logic_vector(2 downto 0);
	variable pcaux : pcarray;
	begin
		if(clr = '1')then
			sp := "000";
			pcaux := (others => (others => '0'));
		elsif(rising_edge(clk))then
			if( wpc = '1' and up = '0' and dw = '0' )then -- jmp 
				pcaux(conv_integer(sp)) := d;
			elsif( wpc= '1' and up = '1' and dw = '0' )then	-- call
				sp := sp + 1;
				pcaux(conv_integer(sp)) := d;
			elsif( wpc = '0' and up = '0' and dw = '1' )then -- ret
				sp := sp - 1;
				pcaux(conv_integer(sp)) := pcaux(conv_integer(sp)) + 1;
			elsif( wpc = '0' and up = '0' and dw = '0' )then -- inc
				pcaux(conv_integer(sp)) := pcaux(conv_integer(sp)) + 1;
			end if;			
		end if;
		q <= pcaux(conv_integer(sp))(9 downto 0);
		sp_out <= sp;
	end process;
	
end Behavioral;

