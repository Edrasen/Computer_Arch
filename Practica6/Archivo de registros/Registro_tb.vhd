----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2020 04:37:42 PM
-- Design Name: 
-- Module Name: Registro_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Registro_tb is
--  Port ( );
end Registro_tb;

architecture Behavioral of Registro_tb is
component Registro is
    Port ( d : in STD_LOGIC_VECTOR (15 downto 0);
           q : out STD_LOGIC_VECTOR (15 downto 0);
           clr, clk, l : in STD_LOGIC);
end component;

signal d : STD_LOGIC_VECTOR (15 downto 0);
signal  q :  STD_LOGIC_VECTOR (15 downto 0);
signal clr, clk, l : STD_LOGIC;

--constant periodo : time := 10 ns;

begin



u1 : Registro
    Port map ( 
    d => d,
    q => q,
    clk => clk,
    clr => clr,
    l => l
    );
    
reloj : process
begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
end process;

reg : process
begin
    clr <= '1';
    wait for 40 ns;
    clr <= '0';
    l <= '1';
    d <= x"1234";
    wait for 10 ns;
    l <= '0';
    d <= x"8765";
    wait;

end process;


end Behavioral;
