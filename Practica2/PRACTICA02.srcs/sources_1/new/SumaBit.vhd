library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SumaBit is
    Port ( a, b, cin : in STD_LOGIC;
           s, cout : out STD_LOGIC);
end SumaBit;

architecture Behavioral of SumaBit is

begin
    s <= (a XOR b) XOR cin;
	cout <= (a AND cin) OR (b AND cin) OR (a AND b);
end Behavioral;
