
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY simulacion_prog1 IS
END simulacion_prog1;
 
ARCHITECTURE behavior OF simulacion_prog1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Procesador
    PORT(
         clk : IN  std_logic;
         clr : IN  std_logic;
         microInstruccion : OUT  std_logic_vector(19 downto 0);
         PC_salida : OUT  std_logic_vector(15 downto 0);
         resultado : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal clr : std_logic := '0';

 	--Outputs
   signal microInstruccion : std_logic_vector(19 downto 0);
   signal PC_salida : std_logic_vector(15 downto 0);
   signal resultado : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Procesador PORT MAP (
          clk => clk,
          clr => clr,
          microInstruccion => microInstruccion,
          PC_salida => PC_salida,
          resultado => resultado
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- insert stimulus here 
		clr <= '1';
      wait for 30 ns;
		clr <= '0';
		wait;
   end process;

END;