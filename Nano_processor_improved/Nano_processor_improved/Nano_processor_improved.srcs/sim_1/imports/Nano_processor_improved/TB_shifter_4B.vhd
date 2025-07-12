----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2025 06:27:53 PM
-- Design Name: 
-- Module Name: TB_shifter_4B - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench for 4-bit Shifter with Enable Signal
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.02 - Added Sft_EN signal
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_shifter_4B is
end TB_shifter_4B;

architecture Behavioral of TB_shifter_4B is

    component shifter_4B
        Port ( 
            Data_In : in STD_LOGIC_VECTOR (3 downto 0);
            Shift_Dir : in STD_LOGIC;
            Sft_EN : in STD_LOGIC;
            Data_Out : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    signal Data_In : STD_LOGIC_VECTOR (3 downto 0);
    signal Shift_Dir : STD_LOGIC;
    signal Sft_EN : STD_LOGIC;
    signal Data_Out : STD_LOGIC_VECTOR (3 downto 0);

begin

    UUT : shifter_4B
    port map(
        Data_In => Data_In,
        Shift_Dir => Shift_Dir,
        Sft_EN => Sft_EN,
        Data_Out => Data_Out
    );

    process
    begin
        -- Enable shifting and shift left
        Sft_EN <= '1';
        Data_In <= "1010";
        Shift_Dir <= '0';
        wait for 20 ns;

        -- Enable shifting and shift right
        Sft_EN <= '1';
        Data_In <= "1010";
        Shift_Dir <= '1';
        wait for 20 ns;

        -- Disable shifting, hold the previous state
        Sft_EN <= '0';
        Data_In <= "1100";
        Shift_Dir <= '0';
        wait for 20 ns;

        -- Enable shifting and shift left
        Sft_EN <= '1';
        Data_In <= "1111";
        Shift_Dir <= '0';
        wait for 20 ns;

        -- Disable shifting, hold the previous state
        Sft_EN <= '0';
        Data_In <= "1000";
        Shift_Dir <= '1';
        wait for 20 ns;

        -- Enable shifting and shift right
        Sft_EN <= '1';
        Data_In <= "0110";
        Shift_Dir <= '1';
        wait for 20 ns;

        wait;
    end process;

end Behavioral;
