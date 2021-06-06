LIBRARY ieee;
LIBRARY STD;
USE STD.TEXTIO.ALL;

USE ieee.std_logic_TEXTIO.ALL;	--PERMITE USAR STD_LOGIC 
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;

entity tb_Arreglo is
end tb_Arreglo;

architecture tb of tb_Arreglo is

    component Arreglo
        port (addrs   : in std_logic_vector (10 downto 0);
              dataIn  : in std_logic_vector (15 downto 0);
              clk     : in std_logic;
              wd      : in std_logic;
              dataOut : out std_logic_vector (15 downto 0));
    end component;

    signal addrs   : std_logic_vector (10 downto 0);
    signal dataIn  : std_logic_vector (15 downto 0);
    signal clk     : std_logic;
    signal wd      : std_logic;
    signal dataOut : std_logic_vector (15 downto 0);

    constant CLK_period : time := 10 ns;

begin

    dut : Arreglo
    port map (addrs   => addrs,
              dataIn  => dataIn,
              clk     => clk,
              wd      => wd,
              dataOut => dataOut);

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
    VARIABLE VAR_DATAOUT : STD_LOGIC_VECTOR(15 DOWNTO 0);
    
	
	file ARCH_VEC : TEXT;
	variable LINEA_VEC : line;
	
    VARIABLE VAR_RDATAIN :  STD_LOGIC_VECTOR(15 DOWNTO 0);
	VARIABLE VAR_RADDRS : STD_LOGIC_VECTOR(10 DOWNTO 0);
	VARIABLE VAR_RWD : STD_LOGIC;

	
	VARIABLE CADENA : STRING(1 TO 4);
	VARIABLE CADENA_I : STRING(1 TO 6);
	VARIABLE CADENA_X : STRING(1 TO 5);
	VARIABLE CADENA_W : STRING(1 TO 7);
	
	
    begin
        file_open(ARCH_RES, "D:\ESCOM\ARQUITECTURA\MemoriaDatos\MemoriaDatos.srcs\sim_1\new\resultado.txt", WRITE_MODE); 	
		file_open(ARCH_VEC, "D:\ESCOM\ARQUITECTURA\MemoriaDatos\MemoriaDatos.srcs\sim_1\new\entradas.txt", READ_MODE); 	

		CADENA_X := " ADD ";
		write(LINEA_RES, CADENA_X, right, CADENA_X'LENGTH+1);	
		CADENA := " WD ";
		write(LINEA_RES, CADENA, right, CADENA'LENGTH+1);
		CADENA_W := "dataIN ";
		write(LINEA_RES, CADENA_W, right, CADENA_W'LENGTH+1);	
		CADENA_W := "dataOUT";
		write(LINEA_RES, CADENA_W, right, CADENA_W'LENGTH+1);
		writeline(ARCH_RES,LINEA_RES);
      wait for 100 ns;
      
      FOR I IN 0 TO 11 LOOP
			readline(ARCH_VEC,LINEA_VEC);
			
			Hread(LINEA_VEC, VAR_RADDRS);
			addrs <= VAR_RADDRS;

			read(LINEA_VEC, VAR_RWD);
			wd <= VAR_RWD;

			Hread(LINEA_VEC, VAR_RDATAIN);
			dataIn <= VAR_RDATAIN;
			
			WAIT UNTIL RISING_EDGE(CLK);
			
			VAR_Dataout := dataOut;		
	
			Hwrite(LINEA_RES, VAR_RADDRS, 	right, 5);
			write(LINEA_RES, VAR_RWD, 	right, 5);
			Hwrite (LINEA_RES, VAR_RDATAIN, right, 7);	
			Hwrite (LINEA_RES, VAR_DATAOUT, 	right, 8);	
				
			writeline(ARCH_RES,LINEA_RES);

		end loop;	
        
        file_close(ARCH_VEC);
		file_close(ARCH_RES);  

        -- EDIT Add stimuli here
        wait for CLK_period*10;

        -- Stop the clock and hence terminate the simulation
        wait;
    end process;

end tb;