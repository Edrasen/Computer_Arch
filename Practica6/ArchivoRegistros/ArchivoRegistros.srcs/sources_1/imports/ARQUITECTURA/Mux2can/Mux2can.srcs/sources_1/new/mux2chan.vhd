----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.03.2020 11:01:06
-- Design Name: 
-- Module Name: mux2chan - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux2chan is
    Port ( shift : in STD_LOGIC_VECTOR (15 downto 0);
           writeData : in STD_LOGIC_VECTOR (15 downto 0);
           SHE : in STD_LOGIC;
           Dout : out STD_LOGIC_VECTOR (15 downto 0));
end mux2chan;

architecture Behavioral of mux2chan is

begin
    process(SHE, shift, writeData)
    begin
    if SHE = '1' then
        Dout <= shift;
    else
        Dout <= writeData;    
    end if;                                                           
    end process;

end Behavioral;
