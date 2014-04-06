-- Joe Jevnik
-- 2014.4.6

import XMonad
import XMonad.Hooks.DynamicLog    ( xmobarColor,shorten,xmobarPP,ppSep,ppTitle
                                  , ppCurrent,ppHidden,ppOutput,ppLayout
                                  , dynamicLogWithPP)
import XMonad.Hooks.FadeInactive  (fadeInactiveLogHook)
import XMonad.Hooks.ManageDocks   (manageDocks,avoidStruts)
import XMonad.Hooks.ManageHelpers (isFullscreen,doFullFloat)
import XMonad.Hooks.SetWMName     (setWMName)
import XMonad.Layout.NoBorders    (smartBorders)
import XMonad.Util.EZConfig       (additionalKeys,parseKey)
import XMonad.Util.Run            (spawnPipe)

import Data.Monoid                (Endo)
import System.IO                  (Handle,hPutStrLn)

main :: IO ()
main = do
    xmobarIn <- spawnPipe "xmobar"
    mapM_ spawn ["xcompmgr","sh ~/.fehbg","xrdb ~/.Xresources"]
    xmonad $ defaultConfig
       { layoutHook  = smartBorders $ avoidStruts $ layoutHook defaultConfig
       , terminal    = "xterm"
       , borderWidth = 0
       , modMask     = mod4Mask
       , manageHook  = manageHooks
       , logHook     = logHooks xmobarIn
       , startupHook = setWMName "XMonad"
       } `additionalKeys` addedKeys

addedKeys :: [((ButtonMask, KeySym), X ())]
addedKeys = [ ((0,xK_Print),        spawn "gnome-screenshot")
            , ((mod4Mask,xK_F2),    spawn "amixer set Master 1- unmute")
            , ((mod4Mask,xK_F3),    spawn "amixer set Master 1+ unmute")
            , ((mod4Mask,xK_grave), spawn "strp -c")
            ]

manageHooks :: Query (Endo WindowSet)
manageHooks = composeAll
              [ isFullscreen --> doFullFloat
              , manageDocks <+> manageHook defaultConfig
              ]

logHooks :: Handle -> X ()
logHooks xmobar = composeAll
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
