----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 03:13:52 PM
-- Design Name: 
-- Module Name: p_counter - Behavioral
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

entity p_counter is
    Port ( Mux_Output : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end p_counter;

architecture Behavioral of p_counter is

COMPONENT D_FF
    Port ( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
END COMPONENT;

begin
    D_FF_0: D_FF
        port map ( D => Mux_Output(0),
                   Res => Res,
                   Clk => Clk,
                   Q => Q(0));
                   
    D_FF_1: D_FF
        port map ( D => Mux_Output(1),
                   Res => Res,
                   Clk => Clk,
                   Q => Q(1));
                   
    D_FF_2: D_FF
        port map ( D => Mux_Output(2),
                   Res => Res,
                   Clk => Clk,
                   Q => Q(2));
                   
end Behavioral;
