let { tap, hold, td, combo, .. } = import "fak/keycode.ncl" in

# We alias commonly used stuff, so we don't end up repeating them over and over.
let kc = tap.reg.kc in
let md = hold.reg.mod in
let me = tap.custom.media in
let XXXX = tap.none & hold.none in
let TTTT = tap.trans & hold.trans in
let DF = tap.layer.DF in
let TG = tap.layer.TG in

# "cu" for custom keys. This is just a name, so it can be whatever you want.
# let cu = {
#   # Again, these are just names. They don't have to be 4-letter or capitalized.
#   COPY = tap.reg.mod.lctl & kc.C,
#   PSTE = tap.reg.mod.lctl & kc.V,
#   CUT =  tap.reg.mod.lctl & kc.X,
#   CLOS = tap.reg.mod.lalt & kc.F4,

#   # Yep. Such names are possible in Nickel.
#   ":P" = tap.reg.mod.lctl & tap.reg.mod.lalt & kc.DEL,

#   # Screenshot
#   SCSH = tap.reg.mod.lgui & tap.reg.mod.lsft & kc.S,
# } in

# 1 tap = play/pause. 2 taps = next track. 3 taps = prev track.
# let my_playback_tap_dance = td.make 200 [
#   me.PLAY,
#   me.NEXT,
#   me.PREV,
#   # Reminder: These can be hold-taps for more complex behavior.
#   # These can even be tap dances... for nested tap dances... but uh... why though?
# ] in

# The following keycode is a hold-tap, since it has a tap and a hold portion
# Important: All hold-taps need to have a behavior bound with `hold.reg.behavior`

# let ctrl_if_held_and_space_if_tapped = 
#   tap.reg.kc.SPC
#   & hold.reg.mod.lctl
#   & hold.reg.behavior {
#     timeout_ms = 300
#     # This will resolve as a hold after 300ms regardless of other keys pressed.
#     # However, if released before the 300ms is up, it will resolve as a tap.
#   }
# in

# XXX: <AI generated code>

# Create a curried function to generate tapdances with a fixed timeout
# and exactly two keycodes (no brackets needed)
let make_td = fun timeout_ms =>
  fun kc1 kc2 => td.make timeout_ms [kc1, kc2]
in

# Create tapdance generators with specific timeouts
# let td_200ms = make_td 200 in
# let td_150ms = make_td 150 in

let tdm = make_td 200 in

# Use the generators to create tapdances (no brackets needed)
# let TD1, TD2 = 
#   td_200ms kc.A kc.B,
#   td_200ms kc.C kc.D
# in

# Example with different timing
# let FAST_TD, SLOW_TD = 
#   td_150ms kc.E kc.F,
#   make_td 300 kc.H kc.I
# in

# XXX: </AI generated code>

                                    #200ms = 300bpm
let spc_dot_comma_tapdance = td.make 200 [kc.SPC & hold.reg.mod.lalt & hold.reg.behavior { timeout_ms = 300 }, kc.DOT, kc.COMM] in

let SDCT = spc_dot_comma_tapdance in


let bspc_del_tapdance = td.make 200 [kc.BSPC & hold.reg.mod.lctl & hold.reg.behavior { timeout_ms = 300 }, kc.DEL & hold.reg.layer 7 & hold.reg.behavior { timeout_ms = 300 }] in
# let bspc_del_tapdance = tdm kc.BSPC & hold.reg.mod.lctl & hold.reg.behavior { timeout_ms = 300 } kc.DEL & hold.reg.layer 1 & hold.reg.behavior { timeout_ms = 300 } in

let BDT = bspc_del_tapdance in

let super_nav_td = td.make 200 [tap.sticky.layer 7, md.lgui] in

# let SNTD = super_nav_td in

let SNTD = tap.sticky.layer 7 & md.lgui & hold.reg.behavior {timeout_ms=150} in

# Keymap definition
{
  # virtual_keys = [
  #   # Combo activated by the first and second physical keys
  #   combo.make 42 [0, 1],

  #   # Combo activated by the third, fourth, and fifth physical keys
  #   combo.make 69 [2, 3, 4],
  # ],

    layers = [
      [ # L0 colemak
        kc.Q, kc.W, kc.F, kc.P, kc.G,                        kc.J, kc.L, kc.U, kc.Y, kc.SCLN,
        kc.A, kc.R, kc.S, kc.T, kc.D,                        kc.H, kc.N, kc.E, kc.I, kc.O,
        kc.Z, kc.X, kc.C, kc.V, kc.B,                        kc.K, kc.M, kc.COMM, kc.DOT, kc.SLSH,
                           BDT, md.lalt, hold.reg.mod.lsft, SNTD, SDCT, md.rctl,
      ],
      [ #L1 qwerty
        kc.Q, kc.W, kc.E, kc.R, kc.T,                        kc.Y, kc.U, kc.I, kc.O, kc.P,
        kc.A, kc.S, kc.D, kc.F, kc.G,                        kc.H, kc.J, kc.K, kc.L, kc.SCLN,
        kc.Z, kc.X, kc.C, kc.V, kc.B,                        kc.N, kc.M, kc.COMM, kc.DOT, kc.SLSH,
                           BDT, md.lalt, hold.reg.mod.lsft, SNTD, SDCT, md.rctl,
      ],
      [ #L2 osu
        XXXX, XXXX, XXXX, XXXX, XXXX,                        XXXX, kc.UP, XXXX, kc.DOWN, XXXX,
         BDT, md.lsft, XXXX, XXXX, XXXX,                        XXXX, kc.LEFT, XXXX, kc.RIGHT, XXXX,
        XXXX, XXXX, XXXX, XXXX, XXXX,                        XXXX, XXXX, XXXX, XXXX, XXXX,
                         kc.LEFT, XXXX, kc.RIGHT,        md.lalt, kc.SPC, XXXX,
      ],
      [ #L3 minecraft 
        kc.N1, kc.N2, kc.N3, kc.N4, kc.N5,                        XXXX, XXXX, XXXX, XXXX, XXXX,
        md.lctl, kc.Q, kc.W, kc.E, kc.T,                        XXXX, XXXX, XXXX, XXXX, XXXX,
        md.lsft, kc.A, kc.S, kc.D, kc.F,                        XXXX, XXXX, XXXX, XXXX, XXXX,
                          XXXX, kc.SPC, kc.ESC,            XXXX, XXXX, DF 1,
      ],
      [ # L4 3rd nav bruh
        kc.ESC, XXXX, XXXX, XXXX, XXXX,                        XXXX, XXXX, XXXX, XXXX, XXXX,
        kc.TAB, XXXX, XXXX, XXXX, XXXX,                        XXXX, kc.HOME, kc.PGDN, kc.PGUP, kc.END,
        XXXX, XXXX, XXXX, XXXX, XXXX,                        XXXX, XXXX, XXXX, XXXX, kc.ENTER,
                          XXXX, XXXX, XXXX,            SNTD, XXXX, XXXX,
      ],
      [ # L5 nav nav.
        XXXX, XXXX, XXXX, XXXX, XXXX,                        XXXX, XXXX, XXXX, XXXX, XXXX,
        XXXX, XXXX, XXXX, XXXX, XXXX,                        XXXX, kc.LEFT, kc.DOWN, kc.UP, kc.RIGHT,
        XXXX, XXXX, XXXX, XXXX, XXXX,                        XXXX, XXXX, XXXX, XXXX, XXXX,
                          XXXX, XXXX, XXXX,            SNTD, XXXX, XXXX,
      ],
      [ # L6 num
        kc.N1, kc.N2, kc.N3, kc.N4, kc.N5,                        kc.N6, kc.N7, kc.N8, kc.N9, kc.N0,
        kc.N6, kc.N7, kc.N8, kc.N9, kc.N0,                        XXXX, TG 6, XXXX, XXXX, XXXX,
        XXXX, XXXX, XXXX, XXXX, XXXX,                        XXXX, XXXX, XXXX, XXXX, XXXX,
                          XXXX, XXXX, md.lsft,            md.lgui, XXXX, XXXX,
      ],
      [ # L7 nav
        XXXX, XXXX, XXXX, XXXX, XXXX,                        XXXX, XXXX, XXXX, XXXX, XXXX,
        TG 4, DF 1, DF 0, XXXX, XXXX,                        TG 5, TG 6, XXXX, XXXX, XXXX,
        XXXX, XXXX, XXXX, XXXX, XXXX,                        XXXX, DF 3, XXXX, XXXX, XXXX,
                          XXXX, TG 2, XXXX,            XXXX, XXXX, XXXX,
      ],
    ]

  # layers = [
  #   [ # Layer 0
  #     cu.COPY, cu.PSTE, cu.CUT,
  #     me.VOLU, me.VOLD, me.MUTE,
  #     cu.SCSH, cu.CLOS, cu.":P",

  #     # Combos start here in the same order we defined them above
  #     hold.reg.layer 1,
  #     hold.reg.layer 2,
  #   ],
  #   [ # Layer 1
  #     kc.A,    kc.B,    kc.C,
  #     kc.D,    kc.E,    kc.F,
  #     kc.G,    kc.H,    kc.I,

  #     TTTT,
  #     my_playback_tap_dance, 
  #   ],
  #   [ # Layer 2
  #     kc.N7,   kc.N8,   kc.N9,
  #     kc.N4,   kc.N5,   kc.N6,
  #     kc.N1,   kc.N2,   kc.N3,

  #     ctrl_if_held_and_space_if_tapped,
  #     TTTT,
  #   ],
  # ]
}
