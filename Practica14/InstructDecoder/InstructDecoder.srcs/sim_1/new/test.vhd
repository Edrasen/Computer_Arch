library ieee;
use ieee.std_logic_1164.all;

entity tb_DecoIns is
end tb_DecoIns;

architecture tb of tb_DecoIns is

    component DecoIns
        port (OP_CODE : in std_logic_vector (4 downto 0);
              TIPOR   : out std_logic;
              BEQI    : out std_logic;
              BNEI    : out std_logic;
              BLTI    : out std_logic;
              BLETI   : out std_logic;
              BGTI    : out std_logic;
              BGETI   : out std_logic);
    end component;

    signal OP_CODE : std_logic_vector (4 downto 0);
    signal TIPOR   : std_logic;
    signal BEQI    : std_logic;
    signal BNEI    : std_logic;
    signal BLTI    : std_logic;
    signal BLETI   : std_logic;
    signal BGTI    : std_logic;
    signal BGETI   : std_logic;

begin

    dut : DecoIns
    port map (OP_CODE => OP_CODE,
              TIPOR   => TIPOR,
              BEQI    => BEQI,
              BNEI    => BNEI,
              BLTI    => BLTI,
              BLETI   => BLETI,
              BGTI    => BGTI,
              BGETI   => BGETI);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        OP_CODE <= "00000";
        wait for 100ns;
        OP_CODE <= "01101";
        wait for 100ns;
    end process;

end tb;
