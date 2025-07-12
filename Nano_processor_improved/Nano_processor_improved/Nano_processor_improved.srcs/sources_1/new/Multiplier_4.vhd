----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2025 01:40:20 PM
-- Design Name: 
-- Module Name: Multiplier_4 - Behavioral
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

entity Multiplier_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Mul_EN : in STD_LOGIC);
end Multiplier_4;

architecture Behavioral of Multiplier_4 is

    COMPONENT FA is
        Port (
            A      : in  std_logic;
            B      : in  std_logic;
            C_in   : in  std_logic;
            S      : out std_logic;
            C_out  : out std_logic
        );
    end COMPONENT;

    SIGNAL y0x0, y0x1, y0x2, y0x3 : std_logic;
    SIGNAL y1x0, y1x1, y1x2, y1x3 : std_logic;
    SIGNAL y2x0, y2x1, y2x2       : std_logic;
    SIGNAL y3x0, y3x1             : std_logic;

    SIGNAL s_0_1, s_0_2, s_0_3, s_0_4       : std_logic;
    SIGNAL s_1_0, s_1_1, s_1_2, s_1_3, s_1_4: std_logic;
    SIGNAL c_0_0, c_0_1, c_0_2, c_0_3       : std_logic;
    SIGNAL c_1_0, c_1_1, c_1_2, c_1_3, c_1_4: std_logic;

begin

    FA_0_0 : FA port map(
        A     => y0x1,
        B     => y1x0,
        C_in  => '0',
        S     => s_0_1,
        C_out => c_0_0
    );

    FA_0_1 : FA port map(
        A     => y2x0,
        B     => y1x1,
        C_in  => '0',
        S     => s_1_0,
        C_out => c_1_0
    );

    FA_1_0 : FA port map(
        A     => s_1_0,
        B     => y0x2,
        C_in  => c_0_0,
        S     => s_0_2,
        C_out => c_0_1
    );

    FA_0_2 : FA port map(
        A     => y3x0,
        B     => y2x1,
        C_in  => '0',
        S     => s_1_1,
        C_out => c_1_1
    );

    FA_1_1 : FA port map(
        A     => s_1_1,
        B     => y1x2,
        C_in  => c_1_0,
        S     => s_1_2,
        C_out => c_1_2
    );

    FA_2_0 : FA port map(
        A     => s_1_2,
        B     => y0x3,
        C_in  => c_0_1,
        S     => s_0_3,
        C_out => c_0_2
    );

    FA_1_2 : FA port map(
        A     => y2x2,
        B     => y3x1,
        C_in  => c_1_1,
        S     => s_1_3,
        C_out => c_1_3
    );

    FA_2_1 : FA port map(
        A     => s_1_3,
        B     => y1x3,
        C_in  => c_1_2,
        S     => s_1_4,
        C_out => c_1_4
    );

    FA_3_0 : FA port map(
        A     => s_1_4,
        B     => c_0_2,
        C_in  => '0',
        S     => s_0_4,
        C_out => c_0_3
    );

    -- Partial Products
    y0x0 <= B(0) AND A(0) when Mul_EN = '1' else '0';
    y0x1 <= B(0) AND A(1) when Mul_EN = '1' else '0';
    y0x2 <= B(0) AND A(2) when Mul_EN = '1' else '0';
    y0x3 <= B(0) AND A(3) when Mul_EN = '1' else '0';

    y1x0 <= B(1) AND A(0) when Mul_EN = '1' else '0';
    y1x1 <= B(1) AND A(1) when Mul_EN = '1' else '0';
    y1x2 <= B(1) AND A(2) when Mul_EN = '1' else '0';
    y1x3 <= B(1) AND A(3) when Mul_EN = '1' else '0';

    y2x0 <= B(2) AND A(0) when Mul_EN = '1' else '0';
    y2x1 <= B(2) AND A(1) when Mul_EN = '1' else '0';
    y2x2 <= B(2) AND A(2) when Mul_EN = '1' else '0';

    y3x0 <= B(3) AND A(0) when Mul_EN = '1' else '0';
    y3x1 <= B(3) AND A(1) when Mul_EN = '1' else '0';

    -- Output Assignment
    Y(0)      <= y0x0;
    Y(1)      <= s_0_1;
    Y(2)      <= s_0_2;
    Y(3)      <= s_0_3;
    Overflow  <= s_0_4;  -- Changed to output only 5 bits

end Behavioral;
