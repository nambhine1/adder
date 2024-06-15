library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity addition is
    Port (
        a : in std_logic_vector(5 downto 0);
        b : in std_logic_vector(5 downto 0);
        sum : out std_logic_vector(6 downto 0)
    );
end addition;

architecture Behavioral of addition is
begin
    process(a, b)
    begin
        -- Perform addition with zero-extension and convert back to std_logic_vector
        sum <= std_logic_vector(unsigned('0' & a) + unsigned('0' & b));
    end process;
end Behavioral;
