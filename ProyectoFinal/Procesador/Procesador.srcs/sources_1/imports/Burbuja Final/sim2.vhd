
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sim2 IS
END sim2;
 
ARCHITECTURE behavior OF sim2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Procesador
    PORT(
         clk : IN  std_logic;
         clr : IN  std_logic;
         microInstruccion : OUT  std_logic_vector(19 downto 0);
         PC_salida : OUT  std_logic_vector(15 downto 0);
         readdata_1 : OUT  std_logic_vector(15 downto 0);
         readdata_2 : OUT  std_logic_vector(15 downto 0);
         sr_out : OUT  std_logic_vector(15 downto 0);
         res_ALU : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal clr : std_logic := '0';

 	--Outputs
   signal microInstruccion : std_logic_vector(19 downto 0);
   signal PC_salida : std_logic_vector(15 downto 0);
   signal readdata_1 : std_logic_vector(15 downto 0);
   signal readdata_2 : std_logic_vector(15 downto 0);
   signal sr_out : std_logic_vector(15 downto 0);
   signal res_ALU : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
    
   --mysr <= microInstruccion(1);
	-- Instantiate the Unit Under Test (UUT)
   uut: Procesador PORT MAP (
          clk => clk,
          clr => clr,
          microInstruccion => microInstruccion,
          PC_salida => PC_salida,
          readdata_1 => readdata_1,
          readdata_2 => readdata_2,
          sr_out => sr_out,
          res_Alu => res_Alu
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
      wait for 10 ns;
		clr <= '0';
		wait;
   end process;


END;