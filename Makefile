THEOS_PACKAGE_DIR_NAME = debs
TARGET = :clang
ARCHS = arm64
FINALPACKAGE = 1
THEOS_DEVICE_PORT=22
THEOS_DEVICE_IP = 192.168.3.2
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = TranslucentNotification
TranslucentNotification_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += preferences
include $(THEOS_MAKE_PATH)/aggregate.mk
