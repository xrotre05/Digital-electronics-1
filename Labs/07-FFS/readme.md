# 07-FFS

## 1. Preparation tasks

### D-type flip-flop

q<sub>n+1</sub> = d

| **D** | **Qn** | **Q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-- |
   | 0 | 0 | 0 | Remember |
   | 0 | 1 | 0 | Remember |
   | 1 | 0 | 1 | Sample |
   | 1 | 1 | 1 | Sample |

###  JK-type flip-flop

q<sub>n+1</sub>=j/q<sub>n</sub> +/kq<sub>n</sub>

   | **J** | **K** | **Qn** | **Q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | 0 | 0 | 0 | 0 | No change |
   | 0 | 0 | 1 | 1 | No change |
   | 0 | 1 | 0 | 0 | Reset |
   | 0 | 1 | 1 | 0 | Reset |
   | 1 | 0 | 0 | 1 | Set |
   | 1 | 0 | 1 | 1 | Set |
   | 1 | 1 | 0 | 1 | Toggle |
   | 1 | 1 | 1 | 0 | Toggle |

###  T-type flip-flop

q<sub>n+1</sub>=t/q<sub>n</sub> +/tq<sub>n</sub>

   | **T** | **Qn** | **Q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-- |
   | 0 | 0 | 0 | No change |
   | 0 | 1 | 1 | No change |
   | 1 | 0 | 1 | Toggle |
   | 1 | 1 | 0 | Toggle |

## 2. D latch

### VHDL code of the process `p_d_latch `
```vhfl
 p_d_latch : process(en,d,arst)
        begin
            if (arst = '1') then
                q     <= '0';
                q_bar <= '1';    
            elsif (en = '1') then
                q       <= d;
                q_bar   <= not d;
            end if;
    end process p_d_latch;
```

### VHDL reset and stimulus processes from the testbench `tb_d_latch.vhd`

```vhdl
p_stimulus : process
    begin
       report "Stimulus process started" severity note;
       
       s_en   <= '0';
       s_d    <= '0';
       s_arst <= '0';
       wait for 20 ns;
            
       s_d    <= '1';  
       wait for 20 ns;  
       s_d    <= '0';
       wait for 20 ns;
       s_d    <= '1';  
       wait for 20 ns;  
       s_d    <= '0';
       wait for 20 ns;
       
       --test enable
       s_en   <= '1';
       wait for 20 ns;
       s_d    <= '1';
       wait for 20 ns;
       s_d    <= '0';   
       wait for 20 ns;
       s_d    <= '1'; 
       wait for 20 ns;
       s_d    <= '0'; 
       wait for 20 ns;
       s_en   <= '0'; --enable deactivated
       wait for 20 ns;
       s_d    <= '1';
       wait for 20 ns;
       s_d    <= '0';   
       wait for 20 ns;
       s_d    <= '1'; 
       wait for 20 ns;
       s_d    <= '0'; 
       wait for 20 ns;
       
       
       
       --test reset
       s_en   <= '1';
        wait for 20 ns;
       s_d    <= '1';
        wait for 20 ns;
       s_d    <= '0';   
       wait for 20 ns;
       s_d    <= '1'; 
       wait for 20 ns;
       s_d    <= '0'; 
       wait for 20 ns;
       s_arst <= '1'; --reset active
       wait for 20 ns;
       s_d    <= '1';
       wait for 20 ns;
       s_d    <= '0';
       wait for 20 ns;
       s_arst <= '0'; --reset deactive
       wait for 50 ns;
       s_d    <= '1';
       wait for 20 ns;
       s_d    <= '0';   
       wait for 20 ns;
       s_d    <= '1'; 
       wait for 20 ns;
       s_d    <= '0'; 
       wait for 20 ns;
       
       report "Stimulus process finished" severity note;
       wait;
   end process p_stimulus;
```
### Screenshot with simulated time waveforms
![alt text](https://github.com/xrotre05/Digital-electronics-1/blob/main/Labs/07-FFS/d-latch.PNG "d-latch")

## 3. Flip-flops
