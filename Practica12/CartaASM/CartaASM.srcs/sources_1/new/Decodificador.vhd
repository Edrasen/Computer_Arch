
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decodificador is
Port ( B : in  STD_LOGIC_VECTOR (3 downto 0);
           aux : out  STD_LOGIC_VECTOR (6 downto 0));
end Decodificador;

architecture Behavioral of Decodificador is

	constant num_0 : std_logic_vector(6 downto 0) := "0000001";
	constant num_1 : std_logic_vector(6 downto 0) := "1001111";
	constant num_2 : std_logic_vector(6 downto 0) := "0010010";
	constant num_3 : std_logic_vector(6 downto 0) := "0000110";
	constant num_4 : std_logic_vector(6 downto 0) := "1001100";
	constant num_5 : std_logic_vector(6 downto 0) := "0100100";
	constant num_6 : std_logic_vector(6 downto 0) := "0100000";
	constant num_7 : std_logic_vector(6 downto 0) := "0001111";
	constant num_8 : std_logic_vector(6 downto 0) := "0000000";
	constant num_9 : std_logic_vector(6 downto 0) := "0000100";
	constant guion : std_logic_vector(6 downto 0) := "1111110";
begin

	with B select
		aux <= num_0 when "0000",
				num_1 when "0001",
				num_2 when "0010",
				num_3 when "0011",
				num_4 when "0100",
				num_5 when "0101",
				num_6 when "0110",
				num_7 when "0111",
				num_8 when "1000",
				num_9 when "1001",
				guion when others;


end Behavioral;

