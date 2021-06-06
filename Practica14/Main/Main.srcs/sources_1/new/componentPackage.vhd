
library IEEE;
use IEEE.STD_LOGIC_1164.all;

package componentPackage is

-- type <new_type> is
--  record
--    <type_name>        : std_logic_vector( 7 downto 0);
--    <type_name>        : std_logic;
-- end record;
--
-- Declare constants
--
-- constant <constant_name>		: time := <time_unit> ns;
-- constant <constant_name>		: integer := <value;
--
-- Declare functions and procedure
--
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--
component RegFlags is
		port
		(
			--Banderas de la ALU
			OV: in std_logic;
			N:  in std_logic;
			Z:  in std_logic;
			C:  in std_logic;
			
			LF:  in std_logic;
			clk: in std_logic;
			clr: in std_logic;
			
			OV_out: inout std_logic;
			N_out:  inout std_logic;
			Z_out:  inout std_logic;
			C_out:  inout std_logic
		);
	end component;
	
	component VerifCond is
		port
		(
			--Banderas de la ALU
			OV: in std_logic;
			Z: in std_logic;
			N: in std_logic;
			C: in std_logic;
			
			EQ: out std_logic;
			NEQ: out std_logic;
			LT: out std_logic;
			LET: out std_logic;
			GT: out std_logic;
			GET: out std_logic
		);
	end component;
	
	component DetectorNivel is
		port
		(
			clk: in std_logic;
			clr: in std_logic;
			NA: out std_logic
		);
	end component;
	
	component UC is
		port
		(
			
			TIPOR: in std_logic;
			BEQI: in std_logic;
			BNEI: in std_logic;
			BLTI: in std_logic;
			BLETI: in std_logic;
			BGTI: in std_logic;
			BGETI: in std_logic;
			
			NA: in std_logic;
			
			EQ: in std_logic;
			NEQ: in std_logic;
			LT: in std_logic;
			LET: in std_logic;
			GT: in std_logic;
			GET: in std_logic;
			
			SDOPC: out std_logic;
			SM: out std_logic
		);
	end component;
	
	component DecoIns is
		port
		(
			OP_CODE: in std_logic_vector(4 downto 0);	
			
			TIPOR: 	out std_logic;
			BEQI: 	out std_logic;
			BNEI: 	out std_logic;
			BLTI: 	out std_logic;
			BLETI: 	out std_logic;
			BGTI: 	out std_logic;
			BGETI: 	out std_logic
		);
	end component;
	
	component CodOperROM is
		generic
		(
			--Tama?o del Bus de Microinstrucciones
			constant tamWord: integer:=20;
			--Tama?o del Bus de Direcciones
			constant tamDir: integer:=5
		);
		port
		(
			--Bus de Direcciones
			BusDir: in std_logic_vector(tamDir-1 downto 0);
			--Bus de Instrucciones
			MicroInstruccionOP: out std_logic_vector(tamWord-1 downto 0)
		);
	end component;

	component CodFunROM is
		generic
		(
			--Tama?o del Bus de Microinstrucciones
			constant tamWord: integer:=20;
			--Tama?o del Bus de Direcciones
			constant tamDir: integer:=4
		);
		port
		(
			--Bus de Direcciones
			BusDir: in std_logic_vector(tamDir-1 downto 0);
			--Bus de Microinstrucciones
			MicroinstruccionFuncion: out std_logic_vector(tamWord-1 downto 0)
		);
	end component;
end componentPackage;

