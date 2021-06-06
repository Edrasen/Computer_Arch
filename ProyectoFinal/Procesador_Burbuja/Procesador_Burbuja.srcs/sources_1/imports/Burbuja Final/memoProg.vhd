library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity MemProg is
	generic(
		n : integer := 10 --bits de CP / log2(#palabras)
	);
	port(
		pc : in std_logic_vector (n - 1 downto 0);
		inst : out std_logic_vector (24 downto 0)
		);
end MemProg;

architecture Funcion of MemProg is

	--CONSTANTES DE INSTRUCCIONES
	--Instrucciones tipo R
	constant tipo_r : std_logic_vector (4 downto 0) := "00000";
	--Carga y Almacenamiento
	constant li : std_logic_vector (4 downto 0) := "00001";
	constant lwi : std_logic_vector (4 downto 0) := "00010";
	constant lw : std_logic_vector (4 downto 0) := "10111";
	constant swi : std_logic_vector (4 downto 0) := "00011";
	constant sw : std_logic_vector (4 downto 0) := "00100";
	--Aritmticas
	constant addi : std_logic_vector (4 downto 0) := "00101";
	constant subi : std_logic_vector (4 downto 0) := "00110";
	--Identificador Aritmticas R
	constant add : std_logic_vector (3 downto 0) := "0000";
	constant sub : std_logic_vector (3 downto 0) := "0001";
	--Logicas
	constant andi : std_logic_vector (4 downto 0) := "00111";
	constant ori : std_logic_vector (4 downto 0) := "01000";
	constant xori : std_logic_vector (4 downto 0) := "01001";
	constant nandi : std_logic_vector (4 downto 0) := "01010";
	constant nori : std_logic_vector (4 downto 0) := "01011";
	constant xnori : std_logic_vector (4 downto 0) := "01100";
	--Identificador Logicas R
	constant andr : std_logic_vector (3 downto 0) := "0010";
	constant orr : std_logic_vector (3 downto 0) := "0011";
	constant xorr : std_logic_vector (3 downto 0) := "0100";
	constant nandr : std_logic_vector (3 downto 0) := "0101";
	constant norr : std_logic_vector (3 downto 0) := "0110";
	constant xnorr : std_logic_vector (3 downto 0) := "0111";
	constant notr : std_logic_vector (3 downto 0) := "1000";
	--Identificador Corrimiento R
	constant sllr : std_logic_vector (3 downto 0) := "1001";
	constant srlr : std_logic_vector (3 downto 0) := "1010";
	--Saltos Condicionales e Incondicionales
	constant beqi : std_logic_vector (4 downto 0) := "01101";
	constant bnei : std_logic_vector (4 downto 0) := "01110";
	constant blti : std_logic_vector (4 downto 0) := "01111";
	constant bleti : std_logic_vector (4 downto 0) := "10000";
	constant bgti : std_logic_vector (4 downto 0) := "10001";
	constant bgeti : std_logic_vector (4 downto 0) := "10010";
	constant b : std_logic_vector (4 downto 0) := "10011";
	--Manejo de Subrutinas
	constant call : std_logic_vector (4 downto 0) := "10100";
	constant ret : std_logic_vector (4 downto 0) := "10101";
	--Otros
	constant nop : std_logic_vector (4 downto 0) := "10110";
	constant su : std_logic_vector (3 downto 0) := "0000"; -- sin usar
	--Registros
	constant R0 : std_logic_vector (3 downto 0) := "0000";
	constant R1 : std_logic_vector (3 downto 0) := "0001";
	constant R2 : std_logic_vector (3 downto 0) := "0010";
	constant R3 : std_logic_vector (3 downto 0) := "0011";
	constant R4 : std_logic_vector (3 downto 0) := "0100";
	constant R5 : std_logic_vector (3 downto 0) := "0101";
	constant R6 : std_logic_vector (3 downto 0) := "0110";
	constant R7 : std_logic_vector (3 downto 0) := "0111";
	constant R8 : std_logic_vector (3 downto 0) := "1000";
	constant R9 : std_logic_vector (3 downto 0) := "1001";
	constant R10 : std_logic_vector (3 downto 0) := "1010";
	constant R11 : std_logic_vector (3 downto 0) := "1011";
	constant R12 : std_logic_vector (3 downto 0) := "1100";
	constant R13 : std_logic_vector (3 downto 0) := "1101";
	constant R14 : std_logic_vector (3 downto 0) := "1110";
	constant R15 : std_logic_vector (3 downto 0) := "1111";
	
	--PROGRAMA
	type aux is array(0 to 2**n - 1) of std_logic_vector(24 downto 0);
	constant programa : aux := (
		

---		BUBBLE -----------------------------------------------------------
		call & SU & x"0006", 					--	(0) B ARREGLO -> (6)
		call & SU & x"000E", 					--	(1) B BURBUJA -> (22)
		call & SU & x"001F",					--	(2) B MOSTRAR -> (42)
		B & SU & x"0003",						--	(3) B (2)
		--FIN-------------------------------------------------------------
		NOP & SU & SU & SU & SU & SU,			--	(4) NOP FIN 
		B & SU & x"0003",						--	(5) Branch - - - - - - 
		--ARREGLO---------------------------------------------------------								
		LI & R0 & X"0000",                  -- (6)       
        LI & R1 & X"0057",                  -- (7)    
        LI & R2 & X"0023",                  -- (8)    
        SW & R1 & R0 & X"000",              -- (9)
        ADDI & R0 & R0 & X"001",            -- (10)
        ADDI & R1 & R1 & X"003",            -- (11)
        BLETI & R2 & R0 & X"FFD",           -- (12)				
		ret & SU & SU & SU & SU & SU,	    -- (13) - - FIN ARREGLO-          	
		--BURBUJA---------------------------------------------------------
		LI & R10 & x"0023",						--	(14) LIMITE I   R10= 35
		LI & R11 & x"0023",						--	(15) LIMITE J   R11= 35
		LI & R2 & x"0000",						--	(16) CONTADOR I R2 = 0
		LI & R3 & x"0001",						--	(17) Contador J	R3 = 1
		--CICLO I---------------------------------------------------------
		--CICLO J---------------------------------------------------------
		SUBI & R6 & R3 & x"001",				--	(18) R6 = R3 - 1 = 0 -
		LW & R4 & R6 & x"000",					--	(19) R4 = MEM[R6] = MEM[R3 -1] = MEM[J-1]
		LW & R5 & R3 & x"000",					--	(20) R5 = MEM[R3] = MEM[J] - - -
		ADDI & R4 & R4 & x"000",				--	(21) R4 = R4
		ADDI & R5 & R5 & x"000",				--	(22) R5 = R5
		BGETI & R5 & R4 & x"005",				--	(23) BLTI INCREMENTO J R4 >= R5 -> PC(23 + 5)
		----INTERCAMBIO----------------------------------------------------
		SW & R4 & R3 & x"000",			--	(24) MEM[R3 + 0] = R4
		SW & R5 & R6 & x"000",			--	(25) MEM[R6 + 0] = R5
		----INCREMENTO J ---------------------------------------------------
		ADDI & R3 & R3 & x"001",		--	(26) R3 = J (R8) + 1
		BLETI & R11 & R3 & x"FF7",		--	(27) BNEI CICLO J R3 <= R11 = 4 -> 32 - 9
		----INCREMENTO I----------------------------------------------------
		ADDI  & R2 & R2 & x"001",		--	(28) R2 = R2 + 1
		BLETI & R10 & R2 & x"FF4",		--	(29) BNEI CICLO I R2 <= R10 = 4 -> 34-12
		ret & SU & SU & SU & SU & SU,			--	(30) Regresar FIN Burbuja
		
		--MOSTRAR---------------------------------------------------------------
		LWI & R14 & x"0000",					--	(31) R14 = MEM[0]
		LWI & R14 & x"0001",					--	(32) R14 = MEM[1]
		LWI & R14 & x"0002",					--	(33) R14 = MEM[2]
		LWI & R14 & x"0003",					--	(34) R14 = MEM[3]
		LWI & R14 & x"0004",					--	(35) R14 = MEM[4]
		LWI & R14 & x"0005",					--	(36) R14 = MEM[4]
		
		LWI & R14 & x"0006",					--	(37) R14 = MEM[0]
		LWI & R14 & x"0007",					--	(38) R14 = MEM[1]
		LWI & R14 & x"0008",					--	(39) R14 = MEM[2]
		LWI & R14 & x"0009",					--	(40) R14 = MEM[3]
		LWI & R14 & x"000a",					--	(41) R14 = MEM[4]
		LWI & R14 & x"000b",					--	(42) R14 = MEM[4]
		
		LWI & R14 & x"000c",					--	(43) R14 = MEM[0]
		LWI & R14 & x"000d",					--	(44) R14 = MEM[1]
		LWI & R14 & x"000e",					--	(45) R14 = MEM[2]
		LWI & R14 & x"000f",					--	(46) R14 = MEM[3]
		LWI & R14 & x"0010",					--	(47) R14 = MEM[4]
		LWI & R14 & x"0011",					--	(48) R14 = MEM[4]
		
		LWI & R14 & x"0012",					--	(49) R14 = MEM[0]
		LWI & R14 & x"0013",					--	(50) R14 = MEM[1]
		LWI & R14 & x"0014",					--	(51) R14 = MEM[2]
		LWI & R14 & x"0015",					--	(52) R14 = MEM[3]
		LWI & R14 & x"0016",					--	(53) R14 = MEM[4]
		LWI & R14 & x"0017",					--	(54) R14 = MEM[4]
		
		LWI & R14 & x"0018",					--	(55) R14 = MEM[0]
		LWI & R14 & x"0019",					--	(56) R14 = MEM[1]
		LWI & R14 & x"001A",					--	(57) R14 = MEM[2]
		LWI & R14 & x"001B",					--	(58) R14 = MEM[3]
		LWI & R14 & x"001C",					--	(59) R14 = MEM[4]
		LWI & R14 & x"001D",
		                    --  (60)
		LWI & R14 & x"001E",                    --  (61)
		LWI & R14 & x"001F",
		LWI & R14 & x"0020",
		LWI & R14 & x"0021",
		LWI & R14 & x"0022",
		LWI & R14 & x"0023",
		LWI & R14 & x"0024",
		ret & SU & SU & SU & SU & SU,			--	(40)
		others => (others => '0')
	);
	
	begin
		inst <= programa( conv_integer(PC) );
end Funcion;

