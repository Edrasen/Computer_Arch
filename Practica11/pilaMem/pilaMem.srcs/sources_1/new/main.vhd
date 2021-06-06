library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( inst : out  STD_LOGIC_VECTOR (24 downto 0);
           pc_in : in  STD_LOGIC_VECTOR (15 downto 0);
		   pc_out: out std_logic_vector(9 downto 0);
		   sp_out : out std_logic_vector(2 downto 0);
           clk,clr,up,dw,wpc : in  STD_LOGIC);
end main;

architecture Behavioral of main is

component pila is
    Port ( d : in  STD_LOGIC_VECTOR (15 downto 0);
           q : out  STD_LOGIC_VECTOR (9 downto 0);
		   sp_out : out std_logic_vector(2 downto 0);
           clk, clr, up, dw, wpc : in  STD_LOGIC);
end component;
component mem_prog is
    Port ( pc : in  STD_LOGIC_VECTOR (9 downto 0);
           inst : out  STD_LOGIC_VECTOR (24 downto 0));
end component;
signal pc_out_aux : std_logic_vector (9 downto 0);

begin

pila1 : pila
	 port map (
		d => pc_in,
		q => pc_out_aux,
		sp_out => sp_out,
		up => up,
		dw => dw,
		wpc => wpc,
		clk => clk,
		clr => clr
		);
		
mem_prog1 : mem_prog
	 port map (
		pc => pc_out_aux,
		inst => inst
		);
pc_out <= pc_out_aux;
end Behavioral;

