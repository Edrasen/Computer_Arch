library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ArchivoRegistro is
    generic (
		n : integer := 16
	 );
    Port ( readReg1,readReg2 : in  STD_LOGIC_VECTOR (3 downto 0);
           shamt : in  STD_LOGIC_VECTOR (3 downto 0);
           writeRegister : in  STD_LOGIC_VECTOR (3 downto 0);
           writeDataIn : in  STD_LOGIC_VECTOR (n-1 downto 0);
           wr : in  STD_LOGIC;
           sheEn : in  STD_LOGIC;
           dirS : in  STD_LOGIC;
           clk,clr : in  STD_LOGIC;
           readData1,readData2 : inout  STD_LOGIC_VECTOR (n-1 downto 0));
end ArchivoRegistro;

architecture Behavioral of ArchivoRegistro is

TYPE MATRIX IS ARRAY(0 TO N-1) OF STD_LOGIC_VECTOR(N-1 DOWNTO 0);

SIGNAL REG_MATRIX : MATRIX;

SIGNAL L_VECTOR     : STD_LOGIC_VECTOR(N-1 DOWNTO 0);

SIGNAL NEW_DATA     : STD_LOGIC_VECTOR(N-1 DOWNTO 0);

SIGNAL BS_WRITE_DATA : STD_LOGIC_VECTOR(N-1 DOWNTO 0);

COMPONENT Registro
    Port ( d : in STD_LOGIC_VECTOR (15 downto 0);
           q : out STD_LOGIC_VECTOR (15 downto 0);
           clr, clk, l : in STD_LOGIC);
END COMPONENT;   

COMPONENT Demux 
    Port ( WR : in STD_LOGIC;
           writeReg : in STD_LOGIC_VECTOR (3 downto 0);
           Lout : out STD_LOGIC_VECTOR (15 downto 0));
END COMPONENT;

COMPONENT barrelSh
    Port ( readData : in STD_LOGIC_VECTOR (15 downto 0);
           s : in STD_LOGIC_VECTOR (3 downto 0);
           dir : in STD_LOGIC;
           res : out STD_LOGIC_VECTOR (15 downto 0));
END COMPONENT;

COMPONENT mux16chan 
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
END COMPONENT;

COMPONENT mux2chan 
    Port ( shift : in STD_LOGIC_VECTOR (15 downto 0);
           writeData : in STD_LOGIC_VECTOR (15 downto 0);
           SHE : in STD_LOGIC;
           Dout : out STD_LOGIC_VECTOR (15 downto 0));
END COMPONENT;


begin

    Ciclo: FOR i IN 0 TO N-1 GENERATE
		Inst_Registro: Registro PORT MAP(
			clk => clk,
			clr => clr,
			l => L_VECTOR(i),
			d => NEW_DATA,
			q => REG_MATRIX(i)
		);	
    END GENERATE Ciclo;
		
    Inst_muxUNO: mux16chan PORT MAP(
           readReg => readReg1,
           q0 => REG_MATRIX(0),
           q1 => REG_MATRIX(1),
           q2 => REG_MATRIX(2),
           q3 => REG_MATRIX(3),
           q4 => REG_MATRIX(4),
           q5 => REG_MATRIX(5),
           q6 => REG_MATRIX(6),
           q7 => REG_MATRIX(7),
           q8 => REG_MATRIX(8),
           q9 => REG_MATRIX(9),
           qA => REG_MATRIX(10),
           qB => REG_MATRIX(11),
           qC => REG_MATRIX(12),
           qD => REG_MATRIX(13),
           qE => REG_MATRIX(14),
           qF => REG_MATRIX(15),
           readData => readData1         
           );
     
    Inst_muxDOS: mux16chan PORT MAP(
           readReg => readReg2,
           q0 => REG_MATRIX(0),
           q1 => REG_MATRIX(1),
           q2 => REG_MATRIX(2),
           q3 => REG_MATRIX(3),
           q4 => REG_MATRIX(4),
           q5 => REG_MATRIX(5),
           q6 => REG_MATRIX(6),
           q7 => REG_MATRIX(7),
           q8 => REG_MATRIX(8),
           q9 => REG_MATRIX(9),
           qA => REG_MATRIX(10),
           qB => REG_MATRIX(11),
           qC => REG_MATRIX(12),
           qD => REG_MATRIX(13),
           qE => REG_MATRIX(14),
           qF => REG_MATRIX(15),
           readData => readData2         
           );
           
    Inst_DEMUX: Demux PORT MAP(
           WR       => wr, 
           writeReg => writeRegister,
           Lout     => L_VECTOR
           );
     
    Inst_BarrelSh: barrelSh PORT MAP(
            readData => readData1,
            s        => shamt,
            dir      => dirS,
            res      => BS_WRITE_DATA
            );
            
    Inst_mux2a1: mux2chan PORT MAP(
            shift     => BS_WRITE_DATA,
            writeData => writeDataIn,
            SHE => sheEN,
            Dout => NEW_DATA
            );
     
end Behavioral;
