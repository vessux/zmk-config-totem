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

## Row and Column Breakdown

The Totem keyboard has an organized layout with:

- **3 main rows** per half plus thumb keys
- **5 columns** per half (plus an extra column key on each outer edge in the bottom row)
- **3 thumb keys** per half

### Left Half

- **Top row**: Keys 0-4
- **Middle row**: Keys 10-14
- **Bottom row**: Keys 20-25 (including the extra outer key)
- **Thumb keys**: Keys 32-34

### Right Half

- **Top row**: Keys 5-9
- **Middle row**: Keys 15-19
- **Bottom row**: Keys 26-31 (including the extra outer key)
- **Thumb keys**: Keys 35-37

## Using Key Numbers in ZMK

When creating custom behaviors or macros in ZMK, you'll reference these key positions. For example, in your keymap file:

```c
// Example: Creating a key position-based macro
macros {
    // Trigger a macro when keys 21 (left S) and 28 (right E) are pressed
    two_key_macro: two_key_macro {
        compatible = "zmk,behavior-macro";
        #binding-cells = <0>;
        bindings = <&macro_press &kp LC(SPACE)>,
                  <&macro_release &kp LC(SPACE)>;
        label = "TWO_KEY_MACRO";
        key-positions = <21 28>;
    };
};
```

## Key Number vs. Key Code

It's important to understand the difference:

- **Key numbers** (0-37): Physical positions on the keyboard
- **Key codes** (e.g., `&kp A`, `&kp SPACE`): The actual output of a key

Your keymap file maps key codes to key numbers, defining what each physical position does.