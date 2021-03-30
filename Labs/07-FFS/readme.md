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
