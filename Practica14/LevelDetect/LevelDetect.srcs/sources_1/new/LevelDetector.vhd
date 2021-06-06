library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
entity DetectorNivel is
 port
 (
 clk: in std_logic;
 clr: in std_logic;
 NA: out std_logic
 );
end DetectorNivel;
architecture Behavioral of DetectorNivel is
 signal pclk1,nclk1: std_logic;
begin
 process(clk,clr)
 begin
 if (clr='1') then
 pclk1<='1';
 elsif (rising_edge(clk)) then
 pclk1<=(not pclk1);
 end if;
 end process;

 process(clk,clr)
 begin
 if (clr='1') then
 nclk1<='0';
 elsif (falling_edge(clk)) then
 nclk1<=(not nclk1);
 end if;
 end process;
 NA <= (pclk1 xor nclk1);
end Behavioral;