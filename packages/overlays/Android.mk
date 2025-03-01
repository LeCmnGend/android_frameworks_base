# Copyright (C) 2019 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := frameworks-base-overlays
LOCAL_REQUIRED_MODULES := \
	AccentColorBlackOverlay \
        AccentColorRoseOverlay \
        AccentColorScooterOverlay \
        AccentColorSlateOverlay \
        AccentColorSuperNovaOverlay \
        AccentColorPurpleHeatOverlay \
        AccentColorHadalZoneOverlay \
        AccentColorLostInForestOverlay \
        AccentColorTorchRedOverlay \
	AccentColorCinnamonOverlay \
	AccentColorOceanOverlay \
	AccentColorOrchidOverlay \
	AccentColorSpaceOverlay \
	AccentColorGreenOverlay \
	AccentColorPurpleOverlay \
	AccentColorPaletteOverlay \
	AccentColorCarbonOverlay \
        FadedPink \
        DeepRed \
        PinkRed \
        KindaIndigo \
        ArmyGreen \
        Grey \
	AccentColorSandOverlay \
	AccentColorAmethystOverlay \
	AccentColorAquamarineOverlay \
	AccentColorTangerineOverlay \
	AccentColorBlueGrayOverlay \
	AccentColorCyanOverlay \
	AccentColorFlatPinkOverlay \
	AccentColorIndigoOverlay \
	AccentColorLightPurpleOverlay \
	AccentColorPinkOverlay \
	AccentColorRedOverlay \
	AccentColorTealOverlay \
	AccentColorCocaColaOverlay \
	AccentColorCoralOverlay \
	AccentColorDiscordOverlay \
	AccentColorFerrariRedOverlay \
	AccentColorGoldenShowerOverlay \
	AccentColorJollibeeOverlay \
	AccentColorNextbitOverlay \
	AccentColorOnePlusOverlay \
	AccentColorParanoidOverlay \
	AccentColorPepsiOverlay \
	AccentColorPixelBlueOGOverlay \
	AccentColorRazerOverlay \
	AccentColorStarbucksOverlay \
	AccentColorXboxOverlay \
	AccentColorXiaomiOverlay \
	AccentColorPixelBlueOverlay \
	AccentColorGoogleBlueOverlay \
	AccentColorGoogleRedOverlay \
	AccentColorGoogleYellowOverlay \
	AccentColorGoogleGreenOverlay \
	AccentColorGoogleGrayOverlay \
	AccentColorAppleBlueOverlay \
	AccentColorAppleGreenOverlay \
	AccentColorAppleIndigoOverlay \
	AccentColorAppleOrangeOverlay \
	AccentColorApplePinkOverlay \
	AccentColorApplePurpleOverlay \
	AccentColorAppleRedOverlay \
	AccentColorAppleTealOverlay \
	AccentColorAppleYellowOverlay \
	DisplayCutoutEmulationCornerOverlay \
	DisplayCutoutEmulationDoubleOverlay \
    DisplayCutoutEmulationHoleOverlay \
	DisplayCutoutEmulationTallOverlay \
	DisplayCutoutEmulationWaterfallOverlay \
	IconPackCircularAndroidOverlay \
	IconPackCircularLauncherOverlay \
	IconPackCircularSettingsOverlay \
	IconPackCircularSystemUIOverlay \
	IconPackCircularThemePickerOverlay \
	IconPackVictorAndroidOverlay \
    IconPackVictorLauncherOverlay \
    IconPackVictorSettingsOverlay \
    IconPackVictorSystemUIOverlay \
    IconPackVictorThemePickerOverlay \
    IconPackSamAndroidOverlay \
    IconPackSamLauncherOverlay \
    IconPackSamSettingsOverlay \
    IconPackSamSystemUIOverlay \
    IconPackSamThemePickerOverlay \
    IconPackKaiAndroidOverlay \
    IconPackKaiLauncherOverlay \
    IconPackKaiSettingsOverlay \
    IconPackKaiSystemUIOverlay \
    IconPackKaiThemePickerOverlay \
	IconPackFilledAndroidOverlay \
	IconPackFilledLauncherOverlay \
	IconPackFilledSettingsOverlay \
	IconPackFilledSystemUIOverlay \
	IconPackFilledThemePickerOverlay \
	IconPackRoundedAndroidOverlay \
	IconPackRoundedLauncherOverlay \
	IconPackRoundedSettingsOverlay \
	IconPackRoundedSystemUIOverlay \
	IconPackRoundedThemePickerOverlay \
	IconShapePebbleOverlay \
        IconShapeCylinderOverlay \
	IconShapeRoundedHexagonOverlay \
	IconShapeRoundedRectOverlay \
	IconShapeSquareOverlay \
	IconShapeSquircleOverlay \
	IconShapeTaperedRectOverlay \
	IconShapeTeardropOverlay \
	IconShapeVesselOverlay \
	IconShapeFlowerOverlay \
	IconShapeHeartOverlay \
	IconShapeHexagonOverlay \
     NavigationBarMode2ButtonOverlay \
	NavigationBarMode3ButtonOverlay \
	NavigationBarModeGesturalOverlay \
	NavigationBarModeGesturalOverlayNarrowBack \
	NavigationBarModeGesturalOverlayWideBack \
	NavigationBarModeGesturalOverlayExtraWideBack \
	NavigationBarNoHintOverlay \
	preinstalled-packages-platform-overlays.xml

include $(BUILD_PHONY_PACKAGE)
include $(CLEAR_VARS)

LOCAL_MODULE := frameworks-base-overlays-debug

include $(BUILD_PHONY_PACKAGE)
include $(call first-makefiles-under,$(LOCAL_PATH))
