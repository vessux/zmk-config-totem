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
Thumb keys:     ⌦ ⎵ ⇥ | @ ⏎ ⌫    
```

*Magic Sturdy layout created by [Ikcelaks](https://github.com/Ikcelaks/keyboard_layouts). Used with appreciation.*

### Magic Key (^)
Located in the top row of the right half, the Magic Key transforms the previously pressed key into a context-sensitive output:

```
┏━━━━━━━━━━━━┳━━━━━━━━━━━━━━┓   ┏━━━━━━━━━━━━┳━━━━━━━━━━━━━━┓   ┏━━━━━━━━━━━━┳━━━━━━━━━━━━━━┓
┃ First Key  ┃ Magic Output ┃   ┃ First Key  ┃ Magic Output ┃   ┃ First Key  ┃ Magic Output ┃
┣━━━━━━━━━━━━╋━━━━━━━━━━━━━━┫   ┣━━━━━━━━━━━━╋━━━━━━━━━━━━━━┫   ┣━━━━━━━━━━━━╋━━━━━━━━━━━━━━┫
┃ A          ┃ O            ┃   ┃ N          ┃ ION          ┃   ┃ [          ┃ ]            ┃
┃ B          ┃ EFORE        ┃   ┃ O          ┃ A            ┃   ┃ ]          ┃ [            ┃
┃ C          ┃ Y            ┃   ┃ P          ┃ Y            ┃   ┃ <          ┃ >            ┃
┃ D          ┃ Y            ┃   ┃ Q          ┃ (none)       ┃   ┃ >          ┃ <            ┃
┃ E          ┃ U            ┃   ┃ R          ┃ L            ┃   ┃ {          ┃ }            ┃
┃ F          ┃ (none)       ┃   ┃ S          ┃ K            ┃   ┃ }          ┃ {            ┃
┃ G          ┃ Y            ┃   ┃ T          ┃ MENT         ┃   ┃ ,          ┃  BUT         ┃
┃ H          ┃ (none)       ┃   ┃ U          ┃ E            ┃   ┃ .          ┃ \            ┃
┃ I          ┃ ON           ┃   ┃ V          ┃ ER           ┃   ┃ /          ┃ (none)       ┃
┃ J          ┃ UST          ┃   ┃ W          ┃ HICH         ┃   ┃ -          ┃ >            ┃
┃ K          ┃ S            ┃   ┃ X          ┃ ES           ┃   ┃ =          ┃ >            ┃
┃ L          ┃ K            ┃   ┃ Y          ┃ P            ┃   ┃ Space      ┃ THE          ┃
┃ M          ┃ ENT          ┃   ┃ Z          ┃ (none)       ┃   ┃ ^ (itself) ┃ N            ┃
┗━━━━━━━━━━━━┻━━━━━━━━━━━━━━┛   ┗━━━━━━━━━━━━┻━━━━━━━━━━━━━━┛   ┗━━━━━━━━━━━━┻━━━━━━━━━━━━━━┛
```

### Smart Repeat Key
Located in the right thumb cluster, this key provides intelligent repetition:

```
┏━━━━━━━━━━━━┳━━━━━━━━━━━━━━┓   ┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━┓   ┏━━━━━━━━━━━━┳━━━━━━━━━━━━━━┓
┃ First Key  ┃ Smart Output ┃   ┃ First Key      ┃ Smart Output ┃   ┃ First Key  ┃ Smart Output ┃
┣━━━━━━━━━━━━╋━━━━━━━━━━━━━━┫   ┣━━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━┫   ┣━━━━━━━━━━━━╋━━━━━━━━━━━━━━┫
┃ A          ┃ ND           ┃   ┃ LEFT           ┃ RIGHT        ┃   ┃ LBRC       ┃ RBRC         ┃
┃ I          ┃ NG           ┃   ┃ RIGHT          ┃ LEFT         ┃   ┃ RBRC       ┃ LBRC         ┃
┃ Y          ┃ OU           ┃   ┃ DOWN           ┃ UP           ┃   ┃ LPAR       ┃ RPAR         ┃
┃ N          ┃ F            ┃   ┃ UP             ┃ DOWN         ┃   ┃ RPAR       ┃ LPAR         ┃
┃ B          ┃ ECAUSE       ┃   ┃ END            ┃ HOME         ┃   ┃ LT         ┃ GT           ┃
┃ W          ┃ OULD         ┃   ┃ HOME           ┃ END          ┃   ┃ GT         ┃ LT           ┃
┃ ,          ┃  AND         ┃   ┃ PG_DN          ┃ PG_UP        ┃   ┃ LBKT       ┃ RBKT         ┃
┃ .          ┃ ORG          ┃   ┃ PG_UP          ┃ PG_DN        ┃   ┃ RBKT       ┃ LBKT         ┃
┃ Space      ┃ FOR          ┃   ┃ SQT            ┃ DQT          ┃   ┃ Modifiers  ┃ Repeat       ┃
┗━━━━━━━━━━━━┻━━━━━━━━━━━━━━┛   ┃ DQT            ┃ SQT          ┃   ┃ Others     ┃ Std. Repeat  ┃
                                ┗━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━┛   ┗━━━━━━━━━━━━┻━━━━━━━━━━━━━━┛
```

For more details, see the comments in the `config/totem.keymap` file.

## BUILD OPTIONS

### Cloud Build (GitHub Actions)
This is the default method for building the firmware:

1. Fork this repo
2. `git clone` your repo to create a local copy on your PC
3. Adjust the totem.keymap file (find all the keycodes on [the zmk docs pages](https://zmk.dev/docs/codes/))
4. `git push` your repo to your fork
5. On the GitHub page of your fork navigate to "Actions"
6. Scroll down and unzip the `firmware.zip` archive that contains the latest firmware
7. Flash the firmware to your keyboard halves (see Flashing Instructions below)

### Local Build (Docker)
For faster development iterations, you can build locally without waiting for GitHub Actions:

1. Make sure Docker Desktop is installed
2. Clone this repository and navigate to it
3. Run `make docker-build` to build the Docker image
4. Run `make build-all` to build firmware for both halves
5. Firmware will be available in the `firmware/` directory:
   - Left half: `seeeduino_xiao_ble-totem_left.uf2`
   - Right half: `seeeduino_xiao_ble-totem_right.uf2`
6. Flash the firmware to your keyboard halves

See [Local Build Documentation](/docs/local-build.md) for more details.

## FLASHING INSTRUCTIONS

1. Connect the keyboard half to your PC and press reset twice
2. The keyboard should appear as a mass storage device
3. Drag and drop the appropriate firmware file onto the storage device:
   - Left half: `seeeduino_xiao_ble-totem_left.uf2`
   - Right half: `seeeduino_xiao_ble-totem_right.uf2`

## KEYBOARD REFERENCE

See the [keyboard layout reference](/docs/key-numbers.md) for key numbers, positions, and usage instructions.