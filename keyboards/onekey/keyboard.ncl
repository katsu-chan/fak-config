let { DirectPinKey, ColToRowKey, .. } = import "fak/keyboard.ncl" in
let { CH552T, .. } = import "fak/mcus.ncl" in

{
  mcu = CH552T,
  usb_dev = {
    vendor_id = 49374,  # 0xC0DE
    product_id = 28, # 0x001C
    product_ver = 256,  # 0x0100
  },
  matrix = {
    cols = [30,31,32,33,34,35],
    rows = [11,12,13,14,15,16]
  },
  keys =
    let D = DirectPinKey in
    let M = ColToRowKey in
    [
        #D 30,
        
          M 5 0, M 5 1, M 5 2
    ]
}