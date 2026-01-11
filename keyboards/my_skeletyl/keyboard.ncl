let { DirectPinKey, ColToRowKey, PeripheralSideKey, SoftSerialPin, RowToColKey, .. } = import "fak/keyboard.ncl" in
let { CH552T, CH552G, .. } = import "fak/mcus.ncl" in

let side_central = {
  mcu = CH552T,
  matrix = {
    cols = [32, 33, 34],
    rows = [10, 11, 14, 15, 16, 17], 
  },
  split.channel = CH552T.features.uart_30_31
} in

let side_periph = {
  mcu = CH552G,
  matrix = {
    cols = [32, 33, 34],
    rows = [14, 15, 16],
  },
  split.channel = CH552G.features.uart_30_31
  keys =
    let C = ColToRowKey in
    let R = RowToColKey in
    [
                    R 0 0, C 1 0, R 1 0, C 2 0, R 2 0,
      #               J/Y,   L/U,   U/I,   Y/O,   :/P,
       
                    R 0 1, C 1 1, R 1 1, C 2 1, R 2 1,
      #               H/H,   N/J,   E/K,   I/L,   O/:,
       
                    R 0 2, C 1 2, R 1 2, C 2 2, R 2 2,
      #               K/N,   M/M,   ,/,    ./.,   ///,

      C 0 2, C 0 1, C 0 0,
    # Super,  LAlt, LCtrl,
    ]
} in 

side_central & {
  usb_dev = {
    vendor_id = 65535,
    product_id = 0,
    product_ver = 42069,
    # FIXME: There is a known issue with strings making USB connection slow
    # manufacturer = "bastardkb",
    # product = "skeletyl",
  },
  split.peripheral = side_periph,
  keys =
    let D = DirectPinKey in
    let C = ColToRowKey in
    let R = RowToColKey in
    let S = PeripheralSideKey in
    [
      # Stupid LLM, its colemak/qwerty. first letter is the colemak letter, second is the qwerty letter.
      # it turns out LLMs dont know colemak
      
      M 0 0, M 0 3, M 1 0, M 1 3, M 2 0,                        S 0,   S 1,   S 2,   S 3,   S 4,
      # Q/Q,   W/W,   F/E,   P/R,   G/T,                        J/Y,   L/U,   U/I,   Y/O,   :/P,

      M 0 1, M 0 4, M 1 1, M 1 4, M 2 1,                        S 5,   S 6,   S 7,   S 8,   S 9,
      # A/A,   R/S,   S/D,   T/F,   D/G,                        H/H,   N/J,   E/K,   I/L,   O/:,

      M 0 2, M 0 5, M 1 2, M 1 5, M 2 2,                       S 10,  S 11,  S 12,  S 13,  S 14,
      # Z/Z,   X/X,   C/C,   V/V,   B/B,                        K/N,   M/M,   ,/,,   ./.,   ///,

                           M 2 3, M 2 4, M 2 5,         S 15,  S 16,  S 17,
                           #Ctrl,   Alt,    Fn,        Super,  LAlt, LCtrl,
    ]
}
