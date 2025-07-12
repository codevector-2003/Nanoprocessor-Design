----------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Mux_5W_4B is
--  Port ( );
end TB_Mux_5W_4B;

architecture Behavioral of TB_Mux_5W_4B is
component Mux_5W_4B
port( Immediate_Value : in STD_LOGIC_VECTOR (3 downto 0);
           R : in STD_LOGIC_VECTOR (3 downto 0);
           M_1 : in STD_LOGIC_VECTOR (3 downto 0);
           M_2 : in STD_LOGIC_VECTOR (3 downto 0);
           M_3 : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Mux_Out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Immediate_Value, R, M_1, M_2, M_3 : STD_LOGIC_VECTOR(3 downto 0);
signal Sel : STD_LOGIC_VECTOR(2 downto 0);
signal Mux_Out : STD_LOGIC_VECTOR(3 downto 0);

begin
UUT : Mux_5W_4B
port map(
    Immediate_Value => Immediate_Value,
        R => R,
        M_1 => M_1,
        M_2 => M_2,
        M_3 => M_3,
        Sel => Sel,
        Mux_Out => Mux_Out
); 
process
begin
    R <= "0101"; -- Sel = "000"
    Immediate_Value <= "1111"; -- Sel = "010"
    M_1 <= "1010"; -- Sel = "110"
    M_2 <= "0000"; -- Sel = "111"
    M_3 <= "1100"; -- Sel = "101"
    
    Sel <= "000"; wait for 100 ns; -- Output: R
        Sel <= "001"; wait for 100 ns; -- Output: 0000 (default)
        Sel <= "010"; wait for 100 ns; -- Output: Immediate_Value
        Sel <= "101"; wait for 100 ns; -- Output: M_3
        Sel <= "110"; wait for 100 ns; -- Output: M_1
        Sel <= "111"; wait for 100 ns; -- Output: M_2
    
    wait;
 end process;   

end Behavioral;
