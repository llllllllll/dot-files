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
import XMonad.Hooks.ManageDocks (manageDocks,avoidStruts)
import XMonad.Hooks.ManageHelpers (isFullscreen,doFullFloat)
import XMonad.Hooks.SetWMName (setWMName)
import XMonad.ManageHook (className,(=?),(<&&>))
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Util.EZConfig (additionalKeys,parseKey)
import XMonad.Util.Run (spawnPipe)


main :: IO ()
main = do
    xmobarIn <- spawnPipe "xmobar -x 2"
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
            ] ++ viewScreenKeys [xK_w, xK_e, xK_r]
  where
      viewScreenKeys = viewScreenKeys' 0
      viewScreenKeys' _ [] = []
      viewScreenKeys' s (k:ts) = ((mod4Mask,k), viewScreen $ P s) :
                                 viewScreenKeys' (s + 1) ts


manageHooks :: Query (Endo WindowSet)
manageHooks =
    composeAll
    [ isFullscreen <&&> notFirefox --> doFullFloat
    , manageDocks <+> manageHook defaultConfig
    ]
  where
      notFirefox = (not . isInfixOf "firefox") <$> (map toLower <$> className)


logHooks :: Handle -> X ()
logHooks xmobar =
    composeAll
    [ fadeInactiveLogHook 0.65
    , dynamicLogWithPP
      xmobarPP { ppOutput  = hPutStrLn xmobar
               , ppTitle   = xmobarColor "#00B7EB" "" . shorten 50
               , ppLayout  = const ""
               , ppCurrent = xmobarColor "#DB2929" ""
               , ppHidden  = xmobarColor "#00B7EB" ""
               , ppSep     = " | "
               }
    ]
