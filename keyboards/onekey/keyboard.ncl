let { DirectPinKey, .. } = import "fak/keyboard.ncl" in
let { CH552T, .. } = import "fak/mcus.ncl" in

{
  mcu = CH552T,
  usb_dev = {
    vendor_id = 49374,  # 0xC0DE
    product_id = 28, # 0x001C
    product_ver = 256,  # 0x0100
  },
  keys =
    let D = DirectPinKey in
    [
        D 35,
    ]
}