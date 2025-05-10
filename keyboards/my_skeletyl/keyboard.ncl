let { DirectPinKey, ColToRowKey, PeripheralSideKey, SoftSerialPin, RowToColKey, .. } = import "fak/keyboard.ncl" in
let { CH552T, .. } = import "fak/mcus.ncl" in

{
  mcu = CH552T,
  matrix = {
    cols = [30, 31, 32, 33, 34, 35],
    rows = [10, 11, 14, 15, 16, 17], 
  },
  usb_dev = {
    vendor_id = 65535,
    product_id = 0,
    product_ver = 42069,
    # FIXME: There is a known issue with strings making USB connection slow
    # manufacturer = "bastardkb",
    # product = "skeletyl",
  },
  keys =
    let D = DirectPinKey in
    let M = ColToRowKey in
    let S = PeripheralSideKey in
    let R = RowToColKey in
    [
      # Stupid LLM, its colemak/qwerty. first letter is the colemak letter, second is the qwerty letter.
      # it turns out LLMs dont know colemak
      
      M 0 0, M 0 3, M 1 0, M 1 3, M 2 0,                      M 3 3, M 4 0, M 4 3, M 5 0, M 5 3,
      # Q/Q,   W/W,   F/E,   P/R,   G/T,                        J/Y,   L/U,   U/I,   Y/O,   :/P,

      M 0 1, M 0 4, M 1 1, M 1 4, M 2 1,                      M 3 4, M 4 1, M 4 4, M 5 1, M 5 4,
      # A/A,   R/S,   S/D,   T/F,   D/G,                        H/H,   N/J,   E/K,   I/L,   O/:,

      M 0 2, M 0 5, M 1 2, M 1 5, M 2 2,                      M 3 5, M 4 2, M 4 5, M 5 2, M 5 5,
      # Z/Z,   X/X,   C/C,   V/V,   B/B,                        K/N,   M/M,   ,/,    ./.,   ///,

                           M 2 3, M 2 4, M 2 5,        M 3 0, M 3 1, M 3 2,
                           #Ctrl,   Alt,    Fn,        Super,  LAlt, LCtrl,
    ]
}
