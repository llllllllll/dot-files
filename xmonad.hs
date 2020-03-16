import Control.Applicative ((<$>))
import Data.Char (toLower)
import Data.List (isInfixOf)
import Data.Monoid (Endo)
import System.IO (Handle,hPutStrLn)

import XMonad
import XMonad.Actions.PhysicalScreens (PhysicalScreen(P), viewScreen)
import XMonad.Hooks.DynamicLog ( xmobarColor,shorten,xmobarPP,ppSep,ppTitle
                               , ppCurrent,ppHidden,ppOutput,ppLayout
                               , dynamicLogWithPP
                               )
import XMonad.Hooks.FadeInactive (fadeInactiveLogHook)
import XMonad.Hooks.ManageDocks ( manageDocks
                                , avoidStruts
                                , docksEventHook
                                , docksStartupHook
                                )
import XMonad.Hooks.ManageHelpers (isFullscreen,doFullFloat)
import XMonad.Hooks.SetWMName (setWMName)
import XMonad.ManageHook (className,(=?),(<&&>))
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Util.EZConfig (additionalKeys,parseKey)
import XMonad.Util.Run (spawnPipe)


main :: IO ()
main = do
    xmobarIn <- spawnPipe "xmobar -x 2"
    let xautolock = "LOCK_LOG=/var/log/xautolock.log xautolock \
                    \ -time 15\
                    \ -locker slock\
                    \ -nowlocker slock\
                    \ -corners -000"
    mapM_ spawn [ "xcompmgr"
                , "xrdb ~/.Xresources"
                , xautolock
                ]
    xmonad $ def
       { layoutHook      = smartBorders $ avoidStruts $ layoutHook defaultConfig
       , terminal        = "urxvt"
       , borderWidth     = 0
       , modMask         = mod4Mask
       , manageHook      = manageHooks
       , logHook         = logHooks xmobarIn
       , startupHook     = docksStartupHook <+> setWMName "XMonad"
       , handleEventHook = docksEventHook
       } `additionalKeys` addedKeys


addedKeys :: [((ButtonMask, KeySym), X ())]
addedKeys = [ ((mod4Mask,xK_p),      spawn "dmenu_run -fn 'Droid Sans Mono-13'")
            , ((0,xK_Print),        spawn screenShotCommand)
            , ((mod4Mask,xK_F2),    spawn "amixer set Master 1- unmute")
            , ((mod4Mask,xK_F3),    spawn "amixer set Master 1+ unmute")
            , ((mod4Mask,xK_grave), spawn "jisho-word-grabber")
            ]
  where
      -- We need to sleep for 0.3 seconds to release the keyboard
      -- before we spawn our screenshot command.
      screenShotCommand = "sleep 0.3; screenshot"


manageHooks :: Query (Endo WindowSet)
manageHooks =
    composeAll
    [ isFullscreen --> doFullFloat
    , manageDocks <+> manageHook defaultConfig
    ]


logHooks :: Handle -> X ()
logHooks xmobar =
    composeAll
    [ fadeInactiveLogHook 0.65
    , dynamicLogWithPP
      xmobarPP { ppOutput  = hPutStrLn xmobar
               , ppTitle   = xmobarColor "#00B7EB" "" . shorten 25
               , ppLayout  = const ""
               , ppCurrent = xmobarColor "#DB2929" ""
               , ppHidden  = xmobarColor "#00B7EB" ""
               , ppSep     = " | "
               }
    ]
