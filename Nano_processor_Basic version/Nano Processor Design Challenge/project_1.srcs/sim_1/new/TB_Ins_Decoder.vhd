library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ins_Decoder_tb is
end Ins_Decoder_tb;

architecture Behavioral of Ins_Decoder_tb is

    -- Component declaration for the Unit Under Test (UUT)
    component Ins_Decoder
        Port (
            Ins         : in  STD_LOGIC_VECTOR(11 downto 0);
            Jump        : in  STD_LOGIC_VECTOR(3 downto 0);
            Register_EN : out STD_LOGIC_VECTOR(2 downto 0);
            Load_sel    : out STD_LOGIC;
            I_value     : out STD_LOGIC_VECTOR(3 downto 0);
            Reg_A       : out STD_LOGIC_VECTOR(2 downto 0);
            Reg_B       : out STD_LOGIC_VECTOR(2 downto 0);
            Add_sub     : out STD_LOGIC;
            Jump_flag   : out STD_LOGIC;
            Address_J   : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    -- Signals for connecting to the UUT
    signal Ins         : STD_LOGIC_VECTOR(11 downto 0);
    signal Jump        : STD_LOGIC_VECTOR(3 downto 0);
    signal Register_EN : STD_LOGIC_VECTOR(2 downto 0);
    signal Load_sel    : STD_LOGIC;
    signal I_value     : STD_LOGIC_VECTOR(3 downto 0);
    signal Reg_A       : STD_LOGIC_VECTOR(2 downto 0);
    signal Reg_B       : STD_LOGIC_VECTOR(2 downto 0);
    signal Add_sub     : STD_LOGIC;
    signal Jump_flag   : STD_LOGIC;
    signal Address_J   : STD_LOGIC_VECTOR(2 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: Ins_Decoder
        Port map (
            Ins         => Ins,
            Jump        => Jump,
            Register_EN => Register_EN,
            Load_sel    => Load_sel,
            I_value     => I_value,
            Reg_A       => Reg_A,
            Reg_B       => Reg_B,
            Add_sub     => Add_sub,
            Jump_flag   => Jump_flag,
            Address_J   => Address_J
        );

    -- Test Process
    process
    begin
        -- Test case 1: ADD instruction (opcode = "00")
        -- Ins = "00 AAABBB xxxx" e.g., Reg_A=010, Reg_B=001
        Ins <= "000100010000"; -- opcode=00, Reg_A=001, Reg_B=001, rest=0000
        Jump <= "0000";  -- No jump condition
        wait for 100 ns;

        -- Test case 2: NEG instruction (opcode = "01")
        Ins <= "010110000000"; -- opcode=01, Reg_A=101
        Jump <= "0000";
        wait for 100 ns;

        -- Test case 3: MOV instruction (opcode = "10")
        Ins <= "101000000101"; -- opcode=10, Reg_A=100, Imme=0101
        Jump <= "0000";
        wait for 100 ns;

        -- Test case 4: JZR instruction with Jump = "0000" (should trigger Jump_flag)
        Ins <= "111000000011"; -- opcode=11, Address_J = 0011
        Jump <= "0000";
        wait for 100 ns;

        -- Test case 5: JZR instruction with Jump != "0000" (Jump_flag should be 0)
        Ins <= "111000000011"; -- same JZR instruction
        Jump <= "0010";
        wait for 100 ns;

        -- Finish simulation
        wait;
    end process;

end Behavioral;
