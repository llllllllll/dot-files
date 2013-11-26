-- Joe Jevnik
-- 24.11.2013

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.FadeWindows
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Layout.NoBorders
import XMonad.Util.EZConfig
import XMonad.Util.Run

main = do
    xmobar_in <- spawnPipe "xmobar"
    mapM_ spawn ["xcompmgr","sh ~/.fehbg","xrdb ~/.Xresources"]
    xmonad $ defaultConfig
       { layoutHook  = smartBorders $ avoidStruts $ layoutHook defaultConfig
       , terminal    = "xterm"
       , borderWidth = 0
       , modMask     = mod4Mask
       , manageHook  = manage_hooks
       , logHook     = log_hooks xmobar_in
       , startupHook = setWMName "XMonad"
    } `additionalKeys` [ ((0,xK_Print), spawn "gnome-screenshot")
                       , ((mod4Mask,xK_F2), spawn "amixer set Master 1- unmute")
                       , ((mod4Mask,xK_F3), spawn "amixer set Master 1+ unmute")
                       , ((mod4Mask,xK_F1), spawn "amixer set Master toggle")
                       ]

manage_hooks = composeAll
               [ isFullscreen --> doFullFloat
               , manageDocks <+> manageHook defaultConfig
               ]

log_hooks xmobar = composeAll
                   [ fadeInactiveLogHook 0.65
                   , dynamicLogWithPP
                     xmobarPP { ppOutput  = hPutStrLn xmobar
                              , ppTitle   = xmobarColor "#00B7EB" ""
                                            . shorten 50
                              , ppLayout  = const ""
                              , ppCurrent = xmobarColor "#DB2929" ""
                              , ppHidden  = xmobarColor "#00B7EB" ""
                              , ppSep     = " | "
                              }
                   ]
