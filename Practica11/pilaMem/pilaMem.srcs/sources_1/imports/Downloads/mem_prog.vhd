library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mem_prog is
	
   Port ( pc : in  STD_LOGIC_VECTOR (9 downto 0);
          inst : out  STD_LOGIC_VECTOR (24 downto 0)
	);
end mem_prog;

architecture Behavioral of mem_prog is
-----------------instrucciones de carga y almacenamiento-------------------------
constant op_li : std_logic_vector(4 downto 0) := "00001";
constant op_lwi : std_logic_vector(4 downto 0) := "00010";
constant op_lw : std_logic_vector(4 downto 0) := "10111";
constant op_swi : std_logic_vector(4 downto 0) := "00011";
constant op_sw : std_logic_vector(4 downto 0) := "00100";
-----------------instrucciones aritmeticas---------------------------------------
constant op_add : std_logic_vector(4 downto 0) := "00000";
constant op_sub : std_logic_vector(4 downto 0) := "00000";
constant op_addi : std_logic_vector(4 downto 0) := "00101";
constant op_subi : std_logic_vector(4 downto 0) := "00110";

constant id_add : std_logic_vector(3 downto 0) := "0000";
constant id_sub : std_logic_vector(3 downto 0) := "0001";
-----------------instrucciones logicas-------------------------------------------
constant op_and : std_logic_vector(4 downto 0) := "00000";
constant op_or : std_logic_vector(4 downto 0) := "00000";
constant op_xor : std_logic_vector(4 downto 0) := "00000";
constant op_nand : std_logic_vector(4 downto 0) := "00000";
constant op_nor : std_logic_vector(4 downto 0) := "00000";
constant op_xnor : std_logic_vector(4 downto 0) := "00000";
constant op_not : std_logic_vector(4 downto 0) := "00000";
constant op_andi : std_logic_vector(4 downto 0) := "00111";
constant op_ori : std_logic_vector(4 downto 0) := "01000";
constant op_xori : std_logic_vector(4 downto 0) := "01001";
constant op_nandi : std_logic_vector(4 downto 0) := "01010";
constant op_nori : std_logic_vector(4 downto 0) := "01011";
constant op_xnori : std_logic_vector(4 downto 0) := "01100";

constant id_and : std_logic_vector(3 downto 0) := "0010";
constant id_or : std_logic_vector(3 downto 0) := "0011";
constant id_xor : std_logic_vector(3 downto 0) := "0100";
constant id_nand : std_logic_vector(3 downto 0) := "0101";
constant id_nor : std_logic_vector(3 downto 0) := "0110";
constant id_xnor : std_logic_vector(3 downto 0) := "0111";
constant id_not : std_logic_vector(3 downto 0) := "1000";
----------------------instrucciones de corrimiento-------------------------------
constant op_sll : std_logic_vector(4 downto 0) := "00000";
constant op_srl : std_logic_vector(4 downto 0) := "00000";

constant id_sll : std_logic_vector(3 downto 0) := "1001";
constant id_srl : std_logic_vector(3 downto 0) := "1010";
-------------instrucciones de saltos condicionales e incondicionales-------------
constant op_beqi : std_logic_vector(4 downto 0) := "01101";
constant op_bnei : std_logic_vector(4 downto 0) := "01110";
constant op_blti : std_logic_vector(4 downto 0) := "01111";
constant op_bleti : std_logic_vector(4 downto 0) := "10000";
constant op_bgti : std_logic_vector(4 downto 0) := "10001";
constant op_bgeti : std_logic_vector(4 downto 0) := "10010";
constant op_b : std_logic_vector(4 downto 0) := "10011";
------------------instrucciones de manejo de subrutinas--------------------------
constant op_call : std_logic_vector(4 downto 0) := "10100";
constant op_ret : std_logic_vector(4 downto 0) := "10101";
---------------------------otras instrucciones-----------------------------------
constant op_nop : std_logic_vector(4 downto 0) := "10110";
-------------------------------registros-----------------------------------------
constant r0 : std_logic_vector(3 downto 0) := "0000";
constant r1 : std_logic_vector(3 downto 0) := "0001";
constant r2 : std_logic_vector(3 downto 0) := "0010";
constant r3 : std_logic_vector(3 downto 0) := "0011";
constant r4 : std_logic_vector(3 downto 0) := "0100";
constant r5 : std_logic_vector(3 downto 0) := "0101";
constant r6 : std_logic_vector(3 downto 0) := "0110";
constant r7 : std_logic_vector(3 downto 0) := "0111";
constant r8 : std_logic_vector(3 downto 0) := "1000";
constant r9 : std_logic_vector(3 downto 0) := "1001";
constant r10 : std_logic_vector(3 downto 0) := "1010";
constant r11 : std_logic_vector(3 downto 0) := "1011";
constant r12 : std_logic_vector(3 downto 0) := "1100";
constant r13 : std_logic_vector(3 downto 0) := "1101";
constant r14 : std_logic_vector(3 downto 0) := "1110";
constant r15 : std_logic_vector(3 downto 0) := "1111";
constant su : std_logic_vector(3 downto 0) := "0000";
-------------------------------------------------------
type banco is array (0 to (2**9) - 1) of std_logic_vector(24 downto 0);
constant memoria : banco := (
op_li&r6&x"0057", 				--1. li r6 #87
op_li&r8&x"005A",			    --2. li r8 #90
op_add&r8&r2&r3&su&id_add,
op_sub&r1&r2&r3&su&id_sub,
op_call&su&x"0009",
op_li&r6&x"0057", 				--li r6 #87  
op_li&r8&x"005A",			    --li r8 #90
op_call&su&x"000D",				--call 13
op_add&r8&r2&r3&su&id_add,
op_sub&r1&r2&r3&su&id_sub,
op_li&r6&x"0057",			    --li r6 #87
op_ret&su&su&su&su&su,			--ret 
op_sub&r1&r2&r3&su&id_sub,
op_li&r6&x"0057",			    --li r6 #87
op_ret&su&su&su&su&su,			--ret 
op_b&su&x"0012",				--b 18
op_nop&su&su&su&su&su,
op_nop&su&su&su&su&su,
op_b&su&x"0011",					--b 17	
others => (others => '0')
);

begin
inst <= memoria(conv_integer(pc));
end Behavioral;

