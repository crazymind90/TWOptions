ARCHS = arm64e arm64 armv7 armv7s

THEOS_DEVICE_IP = 192.168.1.4

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = TWOptions

TWOptions_FILES = Tweak.xm CMManager.m
TWOptions_CFLAGS = -fobjc-arc
TWOptions_EXTRA_FRAMEWORKS += Cephei
TWOptions_FRAMEWORKS = UIKit


include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += TWOptions
include $(THEOS_MAKE_PATH)/aggregate.mk

install3::
		install3.exec


install2::
		install2.exec
