----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.06.2024 14:54:03
-- Design Name: 
-- Module Name: tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity tb is
--  Port ( );
end tb;

architecture Behavioral of tb is
    signal a : std_logic_vector(5 downto 0) := (others => '0');
    signal b : std_logic_vector(5 downto 0) := (others => '0');
    signal sum : std_logic_vector(6 downto 0);

begin

    add : entity work.addition
        port map (
            a => a,
            b => b,
            sum => sum
        );

    stimulus : process 
    begin
        -- Initialize inputs
        a <= "000000";
        b <= "000000";

        -- Test all combinations from 0 to 31
        for i in 0 to 31 loop
            a <= std_logic_vector(to_unsigned(i, a'length));
            b <= std_logic_vector(to_unsigned(i, b'length));
            wait for 100 ns;
        end loop;

        -- End simulation
        report "Simulation passed";
        std.env.stop;
    end process stimulus;
    
    checker : process 
      begin
        wait until  sum'event ;
        if sum /= (std_logic_vector(unsigned('0' & a) + unsigned('0' & b))) then
            report "failed addition mismached" severity failure;
        end if;
    end process checker;

end Behavioral;
