<picture>
  <source media="(prefers-color-scheme: dark)" srcset="/docs/images/TOTEM_logo_dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="/docs/images/TOTEM_logo_bright.svg">
  <img alt="TOTEM logo font" src="/docs/images/TOTEM_logo_bright.svg">
</picture>

# ZMK CONFIG FOR THE TOTEM SPLIT KEYBOARD

[Here](https://github.com/GEIGEIGEIST/totem) you can find the hardware files and build guide.\
[Here](https://github.com/GEIGEIGEIST/qmk-config-totem) you can find the QMK config for the TOTEM.

TOTEM is a 38 key column-staggered split keyboard running [ZMK](https://zmk.dev/) or [QMK](https://docs.qmk.fm/). It's meant to be used with a SEEED XIAO BLE or RP2040.


![TOTEM layout](/docs/images/TOTEM_layout.svg)

## SPECIAL FEATURES

### Magic Sturdy Layout
This configuration implements the Magic Sturdy layout, an optimized layout with special productivity features. The base layout is:

```
Top row:    V M L C P | B ^ U O ,
Home row:   S T R D Y | F N E A I
Bottom row: X K J G W | Z H ' ? .
Thumb keys: Space Tab / | @ Shift _
```

### Magic Key (^)
Located in the top row of the right half, the Magic Key transforms the previously pressed key into a context-sensitive output:
- Press B, then Magic Key → outputs "efore" (completing "before")
- Press W, then Magic Key → outputs "hich" (completing "which")
- Press Space, then Magic Key → outputs "THE"
And many more combinations!

### Smart Repeat Key
Located in the right thumb cluster, this key provides intelligent repetition:
- Standard key repetition works as expected
- Context-aware overrides for common combinations:
  * Press A, then Repeat → outputs "nd" 
  * Press B, then Repeat → outputs "ecause"
  * Press W, then Repeat → outputs "ould"
- Smart navigation and bracket/quote pair handling

For more details, see the comments in the `config/totem.keymap` file.

## HOW TO USE

- fork this repo
- `git clone` your repo, to create a local copy on your PC (you can use the [command line](https://www.atlassian.com/git/tutorials) or [github desktop](https://desktop.github.com/))
- adjust the totem.keymap file (find all the keycodes on [the zmk docs pages](https://zmk.dev/docs/codes/))
- `git push` your repo to your fork
- on the GitHub page of your fork navigate to "Actions"
- scroll down and unzip the `firmware.zip` archive that contains the latest firmware
- connect the left half of the TOTEM to your PC, press reset twice
- the keyboard should now appear as a mass storage device
- drag'n'drop the `totem_left-seeeduino_xiao_ble-zmk.uf2` file from the archive onto the storage device
- repeat this process with the right half and the `totem_right-seeeduino_xiao_ble-zmk.uf2` file.