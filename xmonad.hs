import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Actions.Volume
import XMonad.Layout.NoBorders
import XMonad.Hooks.FadeWindows
import XMonad.Hooks.FadeInactive
import XMonad.Util.Run
import XMonad.Util.EZConfig
import System.IO

main = do
  xmobar_in <- spawnPipe "xmobar" 
  xmproc <- spawnPipe "xcompmgr" >> spawnPipe "sh ~/.fehbg" >> 
            spawnPipe "sh ~/Documents/mouse.sh"
  xmonad $ defaultConfig
    { layoutHook         = smartBorders $ avoidStruts $ layoutHook defaultConfig
    , terminal           = "gnome-terminal"
    , borderWidth        = 0
    , modMask            = mod4Mask
    , manageHook         = manage_hooks
    , logHook            = log_hooks xmobar_in
                           
    } `additionalKeys`
    [ ((mod4Mask .|. shiftMask, xK_z), spawn "gnome-screensaver-command --lock") 
    , ((0,xK_Print), spawn "gnome-screenshot")
    , ((mod4Mask,xK_F2), spawn "amixer set Master 2- unmute")
    , ((mod4Mask,xK_F3), spawn "amixer set Master 2+ unmute")
    , ((mod4Mask,xK_F1), spawn "amixer set Master toggle")
    ]

manage_hooks = composeAll
                [ isFullscreen --> doFullFloat
                , manageDocks <+> manageHook defaultConfig
                ]

log_hooks xmobar = composeAll
                   [ fadeInactiveLogHook 0.65
                   , dynamicLogWithPP xmobarPP { ppOutput  = hPutStrLn xmobar
                                               , ppTitle   = xmobarColor "#00B7EB" "" . shorten 50
                                               , ppLayout  = const ""
                                               , ppCurrent = xmobarColor "#DB2929" ""
                                               , ppHidden  = xmobarColor "#00B7EB" ""
                                               , ppSep     = " | "
                                               }
                   ]


