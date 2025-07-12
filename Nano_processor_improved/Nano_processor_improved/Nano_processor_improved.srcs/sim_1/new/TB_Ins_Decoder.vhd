library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Ins_Decoder_tb is
end Ins_Decoder_tb;

architecture Behavioral of Ins_Decoder_tb is

    -- Component declaration for the Unit Under Test (UUT)
    component Ins_Decoder
        Port (
            Ins         : in  STD_LOGIC_VECTOR(12 downto 0);
            Jump        : in  STD_LOGIC_VECTOR(3 downto 0);
            Register_EN : out STD_LOGIC_VECTOR(2 downto 0);
            Load_sel    : out STD_LOGIC_VECTOR(2 downto 0);
            I_value     : out STD_LOGIC_VECTOR(3 downto 0);
            Reg_A       : out STD_LOGIC_VECTOR(2 downto 0);
            Reg_B       : out STD_LOGIC_VECTOR(2 downto 0);
            Add_sub     : out STD_LOGIC;
            Jump_flag   : out STD_LOGIC;
            Address_J   : out STD_LOGIC_VECTOR(2 downto 0);
            Cmp_EN      : out STD_LOGIC;
            Mul_EN      : out STD_LOGIC;
            Sft_EN      : out STD_LOGIC;
            Sft_Dir     : out STD_LOGIC;
            LU_EN       : out STD_LOGIC;
            LU_Op_Select: out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

    -- Signals for connecting to the UUT
    signal Ins         : STD_LOGIC_VECTOR(12 downto 0);
    signal Jump        : STD_LOGIC_VECTOR(3 downto 0);
    signal Register_EN : STD_LOGIC_VECTOR(2 downto 0);
    signal Load_sel    : STD_LOGIC_VECTOR(2 downto 0);
    signal I_value     : STD_LOGIC_VECTOR(3 downto 0);
    signal Reg_A       : STD_LOGIC_VECTOR(2 downto 0);
    signal Reg_B       : STD_LOGIC_VECTOR(2 downto 0);
    signal Add_sub     : STD_LOGIC;
    signal Jump_flag   : STD_LOGIC;
    signal Address_J   : STD_LOGIC_VECTOR(2 downto 0);
    signal Cmp_EN      : STD_LOGIC;
    signal Mul_EN      : STD_LOGIC;
    signal Sft_EN      : STD_LOGIC;
    signal Sft_Dir     : STD_LOGIC;
    signal LU_EN       : STD_LOGIC;
    signal LU_Op_Select: STD_LOGIC_VECTOR(1 downto 0);

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
            Address_J   => Address_J,
            Cmp_EN      => Cmp_EN,
            Mul_EN      => Mul_EN,
            Sft_EN      => Sft_EN,
            Sft_Dir     => Sft_Dir,
            LU_EN       => LU_EN,
            LU_Op_Select=> LU_Op_Select
        );

    -- Test Process
    process
    begin
        -- Test case 1: MOV instruction (opcode = "010")
        Ins <= "0100010000101"; -- MOV R1, 5
        Jump <= "0000";
        wait for 100 ns;

        -- Test case 2: CMP instruction (opcode = "100")
        Ins <= "1000100110000"; -- CMP R2, R3
        Jump <= "0000";
        wait for 100 ns;

        -- Test case 3: MUL instruction (opcode = "101")
        Ins <= "1010100110000"; -- MUL R2, R3
        Jump <= "0000";
        wait for 100 ns;

        -- Test case 4: SFT instruction (opcode = "111") - Shift Right
        Ins <= "1110110000100"; -- SFT R3, RIGHT
        Jump <= "0000";
        wait for 100 ns;

        -- Test case 5: JZR instruction (opcode = "011")
        Ins <= "0110000000111"; -- JZR R0, 7
        Jump <= "0000";
        wait for 100 ns;

        -- End Simulation
        wait;
    end process;

end Behavioral;
