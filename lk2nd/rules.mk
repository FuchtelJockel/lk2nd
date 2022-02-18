LOCAL_DIR := $(GET_LOCAL_DIR)

ifneq ($(LK1ST_PANEL),)
# Filter out original panel implementation
OBJS := $(filter-out target/$(TARGET)/oem_panel.o, $(OBJS))
MODULES += lk2nd/panel
CFLAGS += -DLK1ST_PANEL=$(LK1ST_PANEL)
else ifeq ($(DISPLAY_USE_CONTINUOUS_SPLASH),1)
# Filter out original display implementation
OBJS := $(filter-out target/$(TARGET)/target_display.o target/$(TARGET)/oem_panel.o, $(OBJS))
ifneq ($(filter $(DEFINES),DISPLAY_TYPE_MDSS=1),)
    OBJS += $(LOCAL_DIR)/target_display_cont_splash_mdp5.o
else
    $(error Continuous splash display is not supported for the current target)
endif
endif
