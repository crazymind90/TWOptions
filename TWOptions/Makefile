include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = TWOptions

TWOptions_FILES = TWOptionsController.m
TWOptions_INSTALL_PATH = /Library/PreferenceBundles
TWOptions_FRAMEWORKS = UIKit
TWOptions_PRIVATE_FRAMEWORKS = Preferences
TWOptions_EXTRA_FRAMEWORKS = Cephei CepheiPrefs
TWOptions_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/TWOptions.plist$(ECHO_END)
