----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 12:37:57 AM
-- Design Name: 
-- Module Name: Nano_Processor - Behavioral
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

entity Nano_Processor is
  Port (
  Reset : IN STD_LOGIC;
  Clk_in : IN STD_LOGIC;
  Zero : OUT STD_LOGIC;
  Overflow : OUT STD_LOGIC;
  LED : OUT STD_LOGIC_VECTOR(3 downto 0);
  Display : OUT STD_LOGIC_VECTOR(6 downto 0); --7 segment display
  Anode : OUT STD_LOGIC_VECTOR(3 downto 0)
   );
end Nano_Processor;

architecture Behavioral of Nano_Processor is

COMPONENT Program_ROM
    Port (
        Rom_IN  : IN  STD_LOGIC_VECTOR(2 downto 0);
        Rom_OUT : OUT STD_LOGIC_VECTOR(11 downto 0)
    );
END COMPONENT;

COMPONENT Ins_Decoder
  Port ( 
  Ins :         IN STD_LOGIC_VECTOR(11 downto 0); --Instructions
  Jump :        IN STD_LOGIC_VECTOR( 3 downto 0);
  Register_EN : OUT STD_LOGIC_VECTOR(2 downto 0); --Register Enable
  Load_sel :    OUT STD_LOGIC;                     -- Select the load
  I_value :     OUT STD_LOGIC_VECTOR(3 downto 0); --Immediate value
  Reg_A :       OUT STD_LOGIC_VECTOR(2 downto 0);
  Reg_B :       OUT STD_LOGIC_VECTOR(2 downto 0);
  Add_sub :     OUT STD_LOGIC;
  Jump_flag :   OUT STD_LOGIC;
  Address_J :   OUT STD_LOGIC_VECTOR(2 downto 0)
    );
END COMPONENT;

COMPONENT p_counter
    Port ( Mux_Output : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
END COMPONENT;

COMPONENT T_bit_Adder --three bit adder
    Port (
        A      : in  STD_LOGIC_VECTOR(2 downto 0);
        B      : in  STD_LOGIC_VECTOR(2 downto 0);
        Sum    : out STD_LOGIC_VECTOR(2 downto 0)
    );
END COMPONENT;

COMPONENT Reg_Bank
  Port (
  reg_en : IN STD_LOGIC_VECTOR(2 downto 0); --select the register
  val_in : IN STD_LOGIC_VECTOR(3 downto 0); -- data for registers
  clk_in : IN STD_LOGIC; --input clock signal
  res    : IN STD_LOGIC; --reset the all registers in bank
  
  --out put of data fropm registers
  R_0 : out STD_LOGIC_VECTOR (3 downto 0);
  R_1 : out STD_LOGIC_VECTOR (3 downto 0);
  R_2 : out STD_LOGIC_VECTOR (3 downto 0);
  R_3 : out STD_LOGIC_VECTOR (3 downto 0);
  R_4 : out STD_LOGIC_VECTOR (3 downto 0);
  R_5 : out STD_LOGIC_VECTOR (3 downto 0);
  R_6 : out STD_LOGIC_VECTOR (3 downto 0);
  R_7 : out STD_LOGIC_VECTOR (3 downto 0)
   );
END COMPONENT;

COMPONENT Adder_Substractor
    PORT(
    A: IN STD_LOGIC_VECTOR(3 downto 0);
    B: IN STD_LOGIC_VECTOR(3 downto 0);
    EN:IN STD_LOGIC; --This enable system decide whether use adder or substractor
    V: OUT STD_LOGIC;--overflow bit
    Ca_out:OUT STD_LOGIC;
    zero : OUT STD_LOGIC;
    D: OUT STD_LOGIC_VECTOR(3 downto 0));
END COMPONENT;

COMPONENT MUX_8way_4bit
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
END COMPONENT;

COMPONENT MUX_2_way_4_bits
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

COMPONENT Multiplexer
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Sel : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (2 downto 0));
END COMPONENT;

COMPONENT Slow_Clk
    PORT( Clk_in : in STD_LOGIC;
          Clk_out : out STD_LOGIC);
END COMPONENT;

COMPONENT Seven_Segment
    PORT( address : in STD_LOGIC_VECTOR (3 downto 0);
    data : out STD_LOGIC_VECTOR (6 downto 0));
end COMPONENT;

SIGNAL Overflw,Z,slow_clock,carry : STD_LOGIC; --overflw for Overflow Z for zero flag
SIGNAL Counter : STD_LOGIC_VECTOR( 2 downto 0); -- output of program counter
SIGNAL Instructions : STD_LOGIC_VECTOR(11 downto 0); --Intruction bus
SIGNAL Adder: STD_LOGIC_VECTOR(2 downto 0); --3 bit adder output
SIGNAL Multiplexer_out: STD_LOGIC_VECTOR(2 downto 0);  --2 way 3 bit multiplexer out
SIGNAL Load_Sel,Add_or_Sub,Jmp_Flag : STD_LOGIC;
SIGNAL Immediate_Value: STD_LOGIC_VECTOR (3 downto 0);
SIGNAL D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,M_A,M_B, M_0,R : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL Reg_Sel_MuxA,Reg_Enable,Reg_Sel_MuxB,Address_JMP : STD_LOGIC_VECTOR (2 downto 0);


begin
Slow_Clock_0 : Slow_Clk
    PORT MAP ( Clk_in => Clk_in,
               Clk_out => slow_clock );
               
Program_counter: p_counter
    PORT MAP ( Mux_Output =>Multiplexer_out,
               Res =>Reset,
               Clk =>slow_clock,
               Q => counter);

ALU : Adder_Substractor
    PORT MAP(A =>M_B,
             B =>M_A,
             EN=>Add_or_Sub,
             V =>overflw,
             Ca_out=>carry,
             zero =>Z,
             D=>R);    
             
Adder_3_bit:T_bit_Adder 
    PORT MAP (
               A=>Counter ,
               B =>"001",
               Sum=>Adder             
               );

Register_Bank: Reg_Bank
    PORT MAP(reg_en => Reg_Enable,
             val_in => M_0,
             clk_in => slow_clock, 
             res    => Reset,
  --out put of data fropm registers
             R_0 =>D_0,
             R_1 =>D_1,
             R_2 =>D_2,
             R_3 =>D_3,
             R_4 =>D_4,
             R_5 =>D_5,
             R_6 =>D_6,
             R_7 =>D_7);
             
MuX_2_way_4bit : MUX_2_way_4_bits
    PORT MAP(A =>R,
             B =>Immediate_Value,
             Sel =>Load_Sel,
             EN =>'1',
             Y =>M_0);

Mux_2_way_3bit : Multiplexer
    PORT MAP(A=>Adder, 
             B=>Address_JMP, 
             EN=>'1',
             Sel=>Jmp_Flag,
             Output=>Multiplexer_out);
             
Mux_A : MUX_8way_4bit
    PORT MAP (D0=>D_0, 
              D1=>D_1, 
              D2=>D_2, 
              D3=>D_3, 
              D4=>D_4, 
              D5=>D_5, 
              D6=>D_6, 
              D7=>D_7, 
              EN=>'1', 
              S =>Reg_Sel_MuxA,
              Y =>M_A);  
              
Mux_B : MUX_8way_4bit
    PORT MAP (D0=>D_0, 
              D1=>D_1, 
              D2=>D_2, 
              D3=>D_3, 
              D4=>D_4, 
              D5=>D_5, 
              D6=>D_6, 
              D7=>D_7, 
              EN=>'1', 
              S =>Reg_Sel_MuxB,
              Y =>M_B);  
              
 ROM : Program_ROM
    PORT MAP (Rom_IN=>Counter ,
              Rom_OUT=>Instructions );
              
 S_Display : Seven_Segment
    PORT MAP(address=>D_7,
             data=>Display );    
             
 Instruction_Decoder: Ins_Decoder
    PORT MAP(
      Ins =>Instructions,
      Jump =>M_A,
      Register_EN=>Reg_Enable, 
      Load_sel=> Load_Sel,
      I_value=>Immediate_Value, 
      Reg_A =>Reg_Sel_MuxA,
      Reg_B =>Reg_Sel_MuxB,
      Add_sub=>Add_or_Sub, 
      Jump_flag=>Jmp_Flag, 
      Address_J=>Address_JMP 
      );  
      
LED <= D_7;
Anode <= "1110";
Overflow <= Overflw; 
Zero<=Z;
end Behavioral;
