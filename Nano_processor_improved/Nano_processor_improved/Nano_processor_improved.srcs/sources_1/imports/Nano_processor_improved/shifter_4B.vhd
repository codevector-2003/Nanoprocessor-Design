----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2025 05:49:13 PM
-- Design Name: 
-- Module Name: shifter_4B - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 4-bit Shifter with Enable Signal
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.02 - Output set to 0000 when Sft_EN is 0
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shifter_4B is
    Port (
        Data_In : in STD_LOGIC_VECTOR (3 downto 0);
        Shift_Dir : in STD_LOGIC;
        Sft_EN : in STD_LOGIC;
        Data_Out : out STD_LOGIC_VECTOR (3 downto 0)
    );
end shifter_4B;

architecture Behavioral of shifter_4B is
begin
    process(Data_In, Shift_Dir, Sft_EN)
    begin
        if Sft_EN = '0' then
            Data_Out <= "0000";
        else
            if Shift_Dir = '0' then
                Data_Out(0) <= '0';
                Data_Out(1) <= Data_In(0);
                Data_Out(2) <= Data_In(1);
                Data_Out(3) <= Data_In(2);
            else
                Data_Out(0) <= Data_In(1);
                Data_Out(1) <= Data_In(2);
                Data_Out(2) <= Data_In(3);
                Data_Out(3) <= '0';
           end if;
        end if;
    end process;

end Behavioral;
