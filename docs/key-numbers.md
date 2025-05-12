# Totem Keyboard Key Numbers Reference

## Purpose

This reference document maps the physical keys on your Totem keyboard to their numerical positions. These key numbers are essential for:

- Creating and editing keymap files
- Troubleshooting specific keys
- Referencing positions in your code
- Understanding the physical layout when customizing behaviors

## Key Mapping

Each key on the Totem has a unique position number (0-37). When defining behaviors, macros, or key bindings in your keymap file, you'll need to reference these positions.

```
             ┏━━━━━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━━┓   ┏━━━━━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━━┓
             ┃     0     ┃     1     ┃     2     ┃     3     ┃     4     ┃   ┃     5     ┃     6     ┃     7     ┃     8     ┃     9     ┃
             ┣━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━┫   ┣━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━┫
             ┃    10     ┃    11     ┃    12     ┃    13     ┃    14     ┃   ┃    15     ┃    16     ┃    17     ┃    18     ┃    19     ┃
 ┏━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━┫   ┣━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━┓
 ┃    20     ┃    21     ┃    22     ┃    23     ┃    24     ┃    25     ┃   ┃    26     ┃    27     ┃    28     ┃    29     ┃    30     ┃    31     ┃
 ┗━━━━━━━━━━━┻━━━━━━━━━━━┻━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━┫   ┣━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━┻━━━━━━━━━━━┻━━━━━━━━━━━┛
                                     ┃    32     ┃    33     ┃    34     ┃   ┃    35     ┃    36     ┃    37     ┃
                                     ┗━━━━━━━━━━━┻━━━━━━━━━━━┻━━━━━━━━━━━┛   ┗━━━━━━━━━━━┻━━━━━━━━━━━┻━━━━━━━━━━━┛
```

## Key Labels

Instead of using numeric key positions directly, ZMK-Helpers provides human-readable labels for all keys. These labels are defined in `zmk-helpers/key-labels/totem.h`. Using these labels makes your keymap more readable and less error-prone.

```
             ┏━━━━━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━━┓   ┏━━━━━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━━┓
             ┃    LT4    ┃    LT3    ┃    LT2    ┃    LT1    ┃    LT0    ┃   ┃    RT0    ┃    RT1    ┃    RT2    ┃    RT3    ┃    RT4    ┃
             ┣━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━┫   ┣━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━┫
             ┃    LM4    ┃    LM3    ┃    LM2    ┃    LM1    ┃    LM0    ┃   ┃    RM0    ┃    RM1    ┃    RM2    ┃    RM3    ┃    RM4    ┃
 ┏━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━┫   ┣━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━┓
 ┃    LB5    ┃    LB4    ┃    LB3    ┃    LB2    ┃    LB1    ┃    LB0    ┃   ┃    RB0    ┃    RB1    ┃    RB2    ┃    RB3    ┃    RB4    ┃    RB5    ┃
 ┗━━━━━━━━━━━┻━━━━━━━━━━━┻━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━┫   ┣━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━╋━━━━━━━━━━━┻━━━━━━━━━━━┻━━━━━━━━━━━┛
                                     ┃    LH2    ┃    LH1    ┃    LH0    ┃   ┃    RH0    ┃    RH1    ┃    RH2    ┃
                                     ┗━━━━━━━━━━━┻━━━━━━━━━━━┻━━━━━━━━━━━┛   ┗━━━━━━━━━━━┻━━━━━━━━━━━┻━━━━━━━━━━━┛
```

### Label Naming Convention

The labels follow a consistent pattern:
- First letter: Side (`L` for left, `R` for right)
- Second letter: Row (`T` for top, `M` for middle, `B` for bottom, `H` for thumb)
- Number: Column position (0-5, numbered from the center outward)

### Key Label to Key Number Mapping

| Left Half Labels | Key Number | | Right Half Labels | Key Number |
|------------------|------------|--|------------------|------------|
| LT0              | 4          | | RT0              | 5          |
| LT1              | 3          | | RT1              | 6          |
| LT2              | 2          | | RT2              | 7          |
| LT3              | 1          | | RT3              | 8          |
| LT4              | 0          | | RT4              | 9          |
| LM0              | 14         | | RM0              | 15         |
| LM1              | 13         | | RM1              | 16         |
| LM2              | 12         | | RM2              | 17         |
| LM3              | 11         | | RM3              | 18         |
| LM4              | 10         | | RM4              | 19         |
| LB0              | 25         | | RB0              | 26         |
| LB1              | 24         | | RB1              | 27         |
| LB2              | 23         | | RB2              | 28         |
| LB3              | 22         | | RB3              | 29         |
| LB4              | 21         | | RB4              | 30         |
| LB5              | 20         | | RB5              | 31         |
| LH0              | 34         | | RH0              | 35         |
| LH1              | 33         | | RH1              | 36         |
| LH2              | 32         | | RH2              | 37         |

## Using Key Labels in ZMK

To use key labels in your keymap:

1. Include the totem.h header file:
   ```c
   #include "zmk-helpers/key-labels/totem.h"
   ```

2. Use labels instead of numbers for key positions:
   ```c
   // Example: Creating a combo that uses labels instead of numbers
   combos {
       compatible = "zmk,combos";
       combo_esc {
           timeout-ms = <50>;
           key-positions = <LT4 LT3>;  // Instead of <0 1>
           bindings = <&kp ESC>;
       };
   };
   ```

## Row and Column Breakdown

The Totem keyboard has an organized layout with:

- **3 main rows** per half plus thumb keys
- **5 columns** per half (plus an extra column key on each outer edge in the bottom row)
- **3 thumb keys** per half

### Left Half

- **Top row**: Keys 0-4 (LT4-LT0)
- **Middle row**: Keys 10-14 (LM4-LM0)
- **Bottom row**: Keys 20-25 (LB5-LB0)
- **Thumb keys**: Keys 32-34 (LH2-LH0)

### Right Half

- **Top row**: Keys 5-9 (RT0-RT4)
- **Middle row**: Keys 15-19 (RM0-RM4)
- **Bottom row**: Keys 26-31 (RB0-RB5)
- **Thumb keys**: Keys 35-37 (RH0-RH2)

## Key Number vs. Key Code

It's important to understand the difference:

- **Key numbers** (0-37): Physical positions on the keyboard
- **Key labels** (e.g., `LT0`, `RB3`): Human-readable names for physical positions
- **Key codes** (e.g., `&kp A`, `&kp SPACE`): The actual output of a key

Your keymap file maps key codes to key positions (using either numbers or labels), defining what each physical position does.