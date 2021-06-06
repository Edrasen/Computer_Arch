----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.03.2020 12:29:38
-- Design Name: 
-- Module Name: mux16chan - Behavioral
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

entity mux16chan is
    Port ( readReg : in STD_LOGIC_VECTOR (3 downto 0);
           q0 : in STD_LOGIC_VECTOR (15 downto 0);
           q1 : in STD_LOGIC_VECTOR (15 downto 0);
           q2 : in STD_LOGIC_VECTOR (15 downto 0);
           q3 : in STD_LOGIC_VECTOR (15 downto 0);
           q4 : in STD_LOGIC_VECTOR (15 downto 0);
           q5 : in STD_LOGIC_VECTOR (15 downto 0);
           q6 : in STD_LOGIC_VECTOR (15 downto 0);
           q7 : in STD_LOGIC_VECTOR (15 downto 0);
           q8 : in STD_LOGIC_VECTOR (15 downto 0);
           q9 : in STD_LOGIC_VECTOR (15 downto 0);
           qA : in STD_LOGIC_VECTOR (15 downto 0);
           qB : in STD_LOGIC_VECTOR (15 downto 0);
           qC : in STD_LOGIC_VECTOR (15 downto 0);
           qD : in STD_LOGIC_VECTOR (15 downto 0);
           qE : in STD_LOGIC_VECTOR (15 downto 0);
           qF : in STD_LOGIC_VECTOR (15 downto 0);
           readData : out STD_LOGIC_VECTOR (15 downto 0));
end mux16chan;

architecture Behavioral of mux16chan is

begin

    readData <= q0 when readReg = "0000" else
                q1 when readReg = "0001" else
                q2 when readReg = "0010" else
                q3 when readReg = "0011" else
                q4 when readReg = "0100" else
                q5 when readReg = "0101" else
                q6 when readReg = "0110" else
                q7 when readReg = "0111" else
                q8 when readReg = "1000" else
                q9 when readReg = "1001" else
                qA when readReg = "1010" else
                qB when readReg = "1011" else
                qC when readReg = "1100" else
                qD when readReg = "1101" else
                qE when readReg = "1110" else
                qF when readReg = "1111" else
                q0;

end Behavioral;
