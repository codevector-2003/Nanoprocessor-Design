----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2025 07:52:54 PM
-- Design Name: 
-- Module Name: Mux_8way_4bit - Behavioral
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

entity Mux_8way_4bit is
    Port ( D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           D2 : in STD_LOGIC_VECTOR (3 downto 0);
           D3 : in STD_LOGIC_VECTOR (3 downto 0);
           D4 : in STD_LOGIC_VECTOR (3 downto 0);
           D5 : in STD_LOGIC_VECTOR (3 downto 0);
           D6 : in STD_LOGIC_VECTOR (3 downto 0);
           D7 : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_8way_4bit;

architecture Structural of Mux_8way_4bit is
    component Mux_8_to_1
        Port (
            D : in STD_LOGIC_VECTOR (7 downto 0);
            EN : in STD_LOGIC;
            S : in STD_LOGIC_VECTOR (2 downto 0);
            Y : out STD_LOGIC
        );
    end component;
            
begin
    GenMux: for i in 0 to 3 generate
        MuxBit: Mux_8_to_1
            port map (
                D(7) => D7(i),
                D(6) => D6(i),
                D(5) => D5(i),
                D(4) => D4(i),
                D(3) => D3(i),
                D(2) => D2(i),
                D(1) => D1(i),
                D(0) => D0(i),
                EN => EN,
                S => S,
                Y => Y(i)
            );
    end generate GenMux;

end Structural;
