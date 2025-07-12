----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 12:10:13 AM
-- Design Name: 
-- Module Name: Mux_5W_4B - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_5W_4B is
    Port ( Immediate_Value : in STD_LOGIC_VECTOR (3 downto 0);
           R : in STD_LOGIC_VECTOR (3 downto 0);
           M_1 : in STD_LOGIC_VECTOR (3 downto 0);
           M_2 : in STD_LOGIC_VECTOR (3 downto 0);
           M_3 : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Mux_Out : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_5W_4B;

architecture Behavioral of Mux_5W_4B is

begin
    process(Immediate_Value,R,M_1,M_2,M_3,Sel)
    begin
        if Sel = "000" then
            Mux_Out <= R;
        elsif Sel = "001" then
            Mux_Out <= Immediate_Value;
        elsif Sel = "010" then
            Mux_Out <= Immediate_Value;
        elsif Sel = "101" then
            Mux_Out <= M_3;
        elsif Sel = "110" then
            Mux_Out <= M_1;
        elsif Sel = "111" then
            Mux_Out <= M_2;
        else
            Mux_Out <= "0000";
        
    end if;
    end process;
end Behavioral;
