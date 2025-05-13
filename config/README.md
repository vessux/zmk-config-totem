# Totem Keyboard Modular Configuration

This directory contains the modular ZMK keymap configuration for the Totem keyboard.

## Directory Structure

The configuration is organized by functionality:

- `magic_key/`: Magic Key functionality
  - `magic_key.dtsi`: Main include file for Magic Key feature
  - `magic_key_behavior.dtsi`: Behavior definition for Magic Key
  - `magic_key_macros.dtsi`: Macros used by Magic Key

- `smart_repeat/`: Smart Repeat functionality
  - `smart_repeat.dtsi`: Main include file for Smart Repeat feature
  - `smart_repeat_behavior.dtsi`: Behavior definition for Smart Repeat
  - `smart_repeat_macros.dtsi`: Macros used by Smart Repeat

- `czech_leader/`: Czech diacritics input using leader key
  - `czech_leader.dtsi`: Main include file for Czech Leader feature
  - `czech_leader_behavior.dtsi`: Behavior definition for Czech Leader Key

- `layers/`: Layer definitions
  - `base_layer.dtsi`: Standard QWERTY layout
  - `base2_layer.dtsi`: Magic Sturdy layout
  - `nav_layer.dtsi`: Navigation and numpad layer
  - `sym_layer.dtsi`: Symbols and media controls
  - `adjust_layer.dtsi`: Bluetooth and function keys

- `combos.dtsi`: Key combinations for special functions

## File Structure

The configuration uses a functional organization:

- `/config/totem.keymap` - Main keymap file that includes all modular components
- Each feature is grouped in its own directory with all related files

## Main Configuration

The main configuration file is `totem.keymap`, which includes all the modular components. This file contains the proper include paths to reference helper libraries and component files.

## Magic Sturdy Layout

The Magic Sturdy layout is an ergonomic keyboard layout designed for efficient typing with special features:

1. **Magic Key**: Located at key position 6 (middle of top row, right half). When pressed after another key, outputs a context-sensitive character or word.

2. **Smart Repeat Key**: Located at key position 35 (left key of right thumb cluster). Provides standard key repetition with intelligent context-aware overrides.

## Features

### Magic Key
The Magic Key provides context-sensitive output based on the previously pressed key. For example, pressing 'I' followed by the Magic Key outputs "ON".

### Smart Repeat
The Smart Repeat key enhances the standard key repeat functionality with context-aware behavior. For example, pressing 'A' followed by Smart Repeat outputs "ND".

### Czech Leader
The Czech Leader key provides access to Czech diacritic characters using a leader key approach. This allows for efficient typing of Czech characters like č, ř, š, etc.

## How to Extend

To add new functionality:

1. Create a new folder for your feature
2. Divide your feature into logical components (behaviors, macros, etc.)
3. Create a main include file for your feature (similar to magic_key.dtsi)
4. Include your feature in the main keymap file

## Using zmk-helpers

This configuration leverages functionality from the urob/zmk-helpers module to simplify the keymap definition:

- Key-labels for more readable key references
- Simplified macro, behavior, and combo definitions
- Unicode character support

## Building the Firmware

The firmware can be built using:

```bash
make build-all
```

This will generate firmware files for both halves of the keyboard in the `firmware/` directory.

## Credits

Based on the Magic Sturdy layout design: https://github.com/Ikcelaks/keyboard_layouts/blob/main/magic_sturdy/magic_sturdy.md 