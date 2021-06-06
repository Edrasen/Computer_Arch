----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.03.2020 23:27:54
-- Design Name: 
-- Module Name: Demux - Behavioral
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

entity Demux is
    Port ( WR : in STD_LOGIC;
           writeReg : in STD_LOGIC_VECTOR (3 downto 0);
           Lout : out STD_LOGIC_VECTOR (15 downto 0));
end Demux;

architecture Behavioral of Demux is

begin
    process(WR, writeReg)
    begin
        if WR = '0' then
            Lout <= (others=>'0');
        else
            if writeReg = "0000" then
                Lout <= "0000000000000001";
            elsif writeReg = "0001" then 
                Lout <= "0000000000000010";
            elsif writeReg = "0010" then 
                Lout <= "0000000000000100";
            elsif writeReg = "0011" then 
                Lout <= "0000000000001000";
            elsif writeReg = "0100" then 
                Lout <= "0000000000010000";
            elsif writeReg = "0101" then 
                Lout <= "0000000000100000";
            elsif writeReg = "0110" then 
                Lout <= "0000000001000000";
            elsif writeReg = "0111" then 
                Lout <= "0000000010000000";
            elsif writeReg = "1000" then 
                Lout <= "0000000100000000";    
            elsif writeReg = "1001" then 
                Lout <= "0000001000000000";
            elsif writeReg = "1010" then 
                Lout <= "0000010000000000";
            elsif writeReg = "1011" then 
                Lout <= "0000100000000000";
            elsif writeReg = "1100" then 
                Lout <= "0001000000000000";
            elsif writeReg = "1101" then 
                Lout <= "0010000000000000";
            elsif writeReg = "1110" then 
                Lout <= "0100000000000000";
            else
                Lout <= "1000000000000000";
                         
            end if; 
        end if;
    end process;

end Behavioral;
