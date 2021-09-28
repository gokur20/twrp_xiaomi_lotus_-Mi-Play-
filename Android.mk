# Replace $$DEVICE$$ with your Device Name's Value. Mine is Primo_RX5.
# Replace $$BRAND$$ with your Brand's / Manufacturer's Value, Mine is WALTON 

ifneq ($(filter Mi_Play,$(TARGET_DEVICE)),)

LOCAL_PATH := device/Xiaomi/Mi_Play

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
