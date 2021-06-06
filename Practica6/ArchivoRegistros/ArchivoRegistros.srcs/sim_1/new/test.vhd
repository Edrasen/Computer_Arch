
LIBRARY ieee;
LIBRARY STD;
USE STD.TEXTIO.ALL;

USE ieee.std_logic_TEXTIO.ALL;	--PERMITE USAR STD_LOGIC 
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;

entity tb_ArchivoRegistro is
end tb_ArchivoRegistro;

architecture tb of tb_ArchivoRegistro is

    component ArchivoRegistro
        port (readReg1      : in std_logic_vector (3 downto 0);
              readReg2      : in std_logic_vector (3 downto 0);
              shamt         : in std_logic_vector (3 downto 0);
              writeRegister : in std_logic_vector (3 downto 0);
              writeDataIn   : in std_logic_vector (15 downto 0);
              wr            : in std_logic;
              sheEn         : in std_logic;
              dirS          : in std_logic;
              clk           : in std_logic;
              clr           : in std_logic;
              readData1     : inout std_logic_vector (15 downto 0);
              readData2     : inout std_logic_vector (15 downto 0));
    end component;

    signal readReg1      : std_logic_vector (3 downto 0);
    signal readReg2      : std_logic_vector (3 downto 0);
    signal shamt         : std_logic_vector (3 downto 0);
    signal writeRegister : std_logic_vector (3 downto 0);
    signal writeDataIn   : std_logic_vector (15 downto 0);
    signal wr            : std_logic;
    signal sheEn         : std_logic;
    signal dirS          : std_logic;
    signal clk           : std_logic;
    signal clr           : std_logic;
    signal readData1     : std_logic_vector (15 downto 0);
    signal readData2     : std_logic_vector (15 downto 0);
    
    constant CLK_period : time := 10 ns;

begin

    dut : ArchivoRegistro
    port map (readReg1      => readReg1,
              readReg2      => readReg2,
              shamt         => shamt,
              writeRegister => writeRegister,
              writeDataIn   => writeDataIn,
              wr            => wr,
              sheEn         => sheEn,
              dirS          => dirS,
              clk           => clk,
              clr           => clr,
              readData1     => readData1,
              readData2     => readData2
              );
              
    CLK_process :process
    begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
    end process;


    stimuli : process
    file ARCH_RES : TEXT;
    variable LINEA_RES : LINE;
    VARIABLE VAR_RDU : STD_LOGIC_VECTOR(15 DOWNTO 0);
	VARIABLE VAR_RDD : STD_LOGIC_VECTOR(15 DOWNTO 0);
	
	file ARCH_VEC : TEXT;
	variable LINEA_VEC : line;
	

	VARIABLE VAR_RR1    :  STD_LOGIC_VECTOR(3 DOWNTO 0);
	VARIABLE VAR_RR2    :  STD_LOGIC_VECTOR(3 DOWNTO 0);
	VARIABLE VAR_SHAMT  :  STD_LOGIC_VECTOR(3 DOWNTO 0);
	VARIABLE VAR_WRE    :  STD_LOGIC_VECTOR(3 DOWNTO 0);
	VARIABLE VAR_WD     :  STD_LOGIC_VECTOR(15 DOWNTO 0);
	VARIABLE VAR_WR     :  STD_LOGIC;
	VARIABLE VAR_SHE    :  STD_LOGIC;
	VARIABLE VAR_DIR    :  STD_LOGIC;
	VARIABLE VAR_CLR    :  STD_LOGIC;

	
	VARIABLE CADENA : STRING(1 TO 4);
	VARIABLE CADENA_I : STRING(1 TO 6);
	VARIABLE CADENA_W : STRING(1 TO 10);
	VARIABLE CADENA_X : STRING(1 TO 5);
	
	
    begin
        file_open(ARCH_RES, "D:\ESCOM\ARQUITECTURA\ArchivoRegistros\ArchivoRegistros.srcs\sim_1\new\resultado.txt", WRITE_MODE); 	
		file_open(ARCH_VEC, "D:\ESCOM\ARQUITECTURA\ArchivoRegistros\ArchivoRegistros.srcs\sim_1\new\entradas.txt", READ_MODE); 	

		CADENA_X := "  RR1";
		write(LINEA_RES, CADENA_X, right, CADENA_X'LENGTH+1);	
		CADENA := " RR2";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		CADENA_I := " SHAMT";
		write(LINEA_RES, CADENA_I, right, CADENA_I'LENGTH+1);	
		CADENA_X := " WREG";
		write(LINEA_RES, CADENA_X, right, CADENA_X'LENGTH+1);
		CADENA := " WD ";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		CADENA_I := "   WR ";
		write(LINEA_RES, CADENA_I, right, CADENA_I'LENGTH+1);
		CADENA := " SHE";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		CADENA := " DIR";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		CADENA := " RD1";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		CADENA := " RD2";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		writeline(ARCH_RES,LINEA_RES);
      wait for 100 ns;
      
      FOR I IN 0 TO 11 LOOP
			readline(ARCH_VEC,LINEA_VEC);
			
			Hread(LINEA_VEC, VAR_RR1);
			readReg1<=VAR_RR1;

			Hread(LINEA_VEC, VAR_RR2);
			readReg2<=VAR_RR2;

			Hread(LINEA_VEC, VAR_SHAMT);
			SHAMT<=VAR_SHAMT;
			
			Hread(LINEA_VEC, VAR_WRE);
			writeRegister<=VAR_WRE;
			
			Hread(LINEA_VEC, VAR_WD);
			writeDataIn<=VAR_WD;
			
			read(LINEA_VEC, VAR_WR);
			WR<=VAR_WR;

			read(LINEA_VEC, VAR_SHE);
			sheEn<=VAR_SHE;
			
			read(LINEA_VEC, VAR_DIR);
			dirS<=VAR_DIR;

			read(LINEA_VEC, VAR_CLR);
			CLR<=VAR_CLR;
			
			WAIT UNTIL RISING_EDGE(CLK);
			VAR_RDU := readData1;	
			VAR_RDD := readData2;	
	
			Hwrite(LINEA_RES, VAR_RR1, 	right, 5);
			Hwrite(LINEA_RES, VAR_RR2, 	right, 5);
			Hwrite (LINEA_RES, VAR_SHAMT, right, 5);	
			Hwrite (LINEA_RES, VAR_WRE, 	right, 8);	
			Hwrite (LINEA_RES, VAR_WD, 	right, 7);	
			write(LINEA_RES, VAR_WR, 	right, 5);
			write(LINEA_RES, VAR_SHE, 	right, 5);
			write(LINEA_RES, VAR_DIR, 	right, 5);
			Hwrite (LINEA_RES, VAR_RDU, right, 6);	
			Hwrite (LINEA_RES, VAR_RDD, right, 6);	
			writeline(ARCH_RES,LINEA_RES);

		end loop;	
        
        file_close(ARCH_VEC);
		file_close(ARCH_RES);  

        wait for CLK_period*10;
        
        wait;
    end process;

end tb;

