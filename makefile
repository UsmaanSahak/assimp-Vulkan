VULKAN_SDK_PATH = /home/uas/vulkan/VulkanSDK/1.0.51.0/x86_64
STB_INCLUDE_PATH = /home/uas
OBJ_INCLUDE_PATH = /home/uas
ASSIMP_INCLUDE_PATH = /home/uas/assimp-3.3.1/include
CFLAGS = -std=c++11 -I$(VULKAN_SDK_PATH)/include -I$(STB_INCLUDE_PATH) -I$(OBJ_INCLUDE_PATH) -I$(ASSIMP_INCLUDE_PATH)
LDFLAGS = -L$(VULKAN_SDK_PATH)/lib `pkg-config --static --libs glfw3` -lvulkan -lassimp
VulkanTest: main.cpp
	g++ $(CFLAGS) -g -o VulkanTest main.cpp $(LDFLAGS)
.PHONY: test clean

test: VulkanTest
	LD_LIBRARY_PATH=$(VULKAN_SDK_PATH)/lib VK_LAYER_PATH=$(VULKAN_SDK_PATH)/etc/explicit_layer.d ./VulkanTest

clean:
	rm -f VulkanTest
