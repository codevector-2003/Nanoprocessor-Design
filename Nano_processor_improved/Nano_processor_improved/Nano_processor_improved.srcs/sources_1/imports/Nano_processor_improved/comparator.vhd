----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2025 12:10:02 PM
-- Design Name: 
-- Module Name: comparator - Behavioral
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

entity comparator is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           A_equal_B : out STD_LOGIC;
           A_greater_B : out STD_LOGIC;
           A_lesser_B : out STD_LOGIC;
           Cmp_EN : in STD_LOGIC);
end comparator;

architecture Behavioral of comparator is

    signal eq0, eq1, eq2, eq3 : STD_LOGIC;
    signal gt0, gt1, gt2, gt3 : STD_LOGIC;
    signal lt0, lt1, lt2, lt3 : STD_LOGIC;

begin

    eq0 <= A(0) xnor B(0);
    eq1 <= A(1) xnor B(1);
    eq2 <= A(2) xnor B(2);
    eq3 <= A(3) xnor B(3);

    gt3 <= A(3) and not B(3);
    gt2 <= A(2) and not B(2);
    gt1 <= A(1) and not B(1);
    gt0 <= A(0) and not B(0);

    lt3 <= not A(3) and B(3);
    lt2 <= not A(2) and B(2);
    lt1 <= not A(1) and B(1);
    lt0 <= not A(0) and B(0);

    -- Conditional Output based on Cmp_EN
    A_equal_B <= (eq3 and eq2 and eq1 and eq0) when Cmp_EN = '1' else '0';
    A_greater_B <= (gt3 or (eq3 and gt2) or (eq3 and eq2 and gt1) or (eq3 and eq2 and eq1 and gt0)) when Cmp_EN = '1' else '0';
    A_lesser_B <= (lt3 or (eq3 and lt2) or (eq3 and eq2 and lt1) or (eq3 and eq2 and eq1 and lt0)) when Cmp_EN = '1' else '0';

end Behavioral;

