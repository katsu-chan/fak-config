let { DirectPinKey, ColToRowKey, PeripheralSideKey, SoftSerialPin, RowToColKey, .. } = import "fak/keyboard.ncl" in
let { CH552T, .. } = import "fak/mcus.ncl" in

{
  mcu = CH552T,
  matrix = {
    cols = [30, 31, 34],
    rows = [10, 14, 15, 16],
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
      # Q/Q,   W/W,   F/E,   P/R,   G/T,
      M 0 0, M 0 2, M 1 0, M 1 2, M 2 0,
      # A/A,   R/S,   S/D,   T/F,   D/G,
      # Z/Z,   X/X,   C/C,   V/V,   B/B,

                           M 2 1, M 2 2, M 2 3,
                           #Ctrl,   Alt,    Fn

      M 0 1, M 0 3, M 1 1, M 1 3
    ]
}
