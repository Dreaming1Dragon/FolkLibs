package render

import "core:fmt"
import "core:mem"
import "vendor:glfw"
import vk "vendor:vulkan"

foreign import lib {
	"system:vulkan",
}

@(link_prefix = "vk")
@(default_calling_convention="c")
foreign lib {
	CreateInstance::proc(pCreateInfo:^vk.InstanceCreateInfo,pAllocator:^vk.AllocationCallbacks,pInstance:^vk.Instance)->vk.Result ---
	DestroyInstance::proc(instance:vk.Instance,pAllocator:^vk.AllocationCallbacks) ---
	EnumerateInstanceExtensionProperties::proc(pLayerName:cstring,pPropertyCount:^u32,pProperties:[^]vk.ExtensionProperties)->vk.Result ---
	EnumerateInstanceLayerProperties::proc(pPropertyCount:^u32,pProperties:[^]vk.LayerProperties)->vk.Result ---
	GetInstanceProcAddr::proc(instance:vk.Instance,pName:cstring)->vk.ProcVoidFunction ---
	EnumeratePhysicalDevices::proc(instance:vk.Instance,pPhysicalDeviceCount:^u32,pPhysicalDevices:[^]vk.PhysicalDevice)->vk.Result ---
	GetPhysicalDeviceProperties::proc(physicalDevice:vk.PhysicalDevice,pProperties:[^]vk.PhysicalDeviceProperties) ---
	GetPhysicalDeviceFeatures::proc(physicalDevice:vk.PhysicalDevice,pFeatures:[^]vk.PhysicalDeviceFeatures) ---
	GetPhysicalDeviceQueueFamilyProperties::proc(physicalDevice:vk.PhysicalDevice,pQueueFamilyPropertyCount:^u32,pQueueFamilyProperties:[^]vk.QueueFamilyProperties) ---
	CreateDevice::proc(physicalDevice:vk.PhysicalDevice,pCreateInfo:^vk.DeviceCreateInfo,pAllocator:^vk.AllocationCallbacks,pDevice:^vk.Device)->vk.Result ---
	DestroyDevice::proc(device:vk.Device,pAllocator:^vk.AllocationCallbacks) ---
	GetDeviceQueue::proc(device:vk.Device,queueFamilyIndex:u32,queueIndex:u32,pQueue:^vk.Queue) ---
	DestroySurfaceKHR::proc(instance:vk.Instance,surface:vk.SurfaceKHR,pAllocator:^vk.AllocationCallbacks) ---
	GetPhysicalDeviceSurfaceSupportKHR::proc(physicalDevice:vk.PhysicalDevice,queueFamilyIndex:u32,surface:vk.SurfaceKHR,pSupported:^b32)->vk.Result ---
	EnumerateDeviceExtensionProperties::proc(physicalDevice:vk.PhysicalDevice,pLayerName:cstring,pPropertyCount:^u32,pProperties:[^]vk.ExtensionProperties)->vk.Result ---
	GetPhysicalDeviceSurfaceCapabilitiesKHR::proc(physicalDevice:vk.PhysicalDevice,surface:vk.SurfaceKHR,pSurfaceCapabilities:[^]vk.SurfaceCapabilitiesKHR)->vk.Result ---
	GetPhysicalDeviceSurfaceFormatsKHR::proc(physicalDevice:vk.PhysicalDevice,surface:vk.SurfaceKHR,pSurfaceFormatCount:^u32,pSurfaceFormats:[^]vk.SurfaceFormatKHR)->vk.Result ---
	GetPhysicalDeviceSurfacePresentModesKHR::proc(physicalDevice:vk.PhysicalDevice,surface:vk.SurfaceKHR,pPresentModeCount:^u32,pPresentModes:[^]vk.PresentModeKHR)->vk.Result ---
	CreateSwapchainKHR::proc(device:vk.Device,pCreateInfo:^vk.SwapchainCreateInfoKHR,pAllocator:^vk.AllocationCallbacks,pSwapchain:^vk.SwapchainKHR)->vk.Result ---
	DestroySwapchainKHR::proc(device:vk.Device,swapchain:vk.SwapchainKHR,pAllocator:^vk.AllocationCallbacks) ---
	GetSwapchainImagesKHR::proc(device:vk.Device,swapchain:vk.SwapchainKHR,pSwapchainImageCount:^u32,pSwapchainImages:[^]vk.Image)->vk.Result ---
	CreateImageView::proc(device:vk.Device,pCreateInfo:^vk.ImageViewCreateInfo,pAllocator:^vk.AllocationCallbacks,pView:^vk.ImageView)->vk.Result ---
	DestroyImageView::proc(device:vk.Device,imageView:vk.ImageView,pAllocator:^vk.AllocationCallbacks) ---
	CreateShaderModule::proc(device:vk.Device,pCreateInfo:^vk.ShaderModuleCreateInfo,pAllocator:^vk.AllocationCallbacks,pShaderModule:^vk.ShaderModule)->vk.Result ---
	DestroyShaderModule::proc(device:vk.Device,shaderModule:vk.ShaderModule,pAllocator:^vk.AllocationCallbacks) ---
	CreatePipelineLayout::proc(device:vk.Device,pCreateInfo:^vk.PipelineLayoutCreateInfo,pAllocator:^vk.AllocationCallbacks,pPipelineLayout:^vk.PipelineLayout)->vk.Result ---
	DestroyPipelineLayout::proc(device:vk.Device,pipelineLayout:vk.PipelineLayout,pAllocator:^vk.AllocationCallbacks) ---
	CreateRenderPass::proc(device:vk.Device,pCreateInfo:^vk.RenderPassCreateInfo,pAllocator:^vk.AllocationCallbacks,pRenderPass:[^]vk.RenderPass)->vk.Result ---
	DestroyRenderPass::proc(device:vk.Device,renderPass:vk.RenderPass,pAllocator:^vk.AllocationCallbacks) ---
	CreateGraphicsPipelines::proc(device:vk.Device,pipelineCache:vk.PipelineCache,createInfoCount:u32,pCreateInfos:[^]vk.GraphicsPipelineCreateInfo,pAllocator:^vk.AllocationCallbacks,pPipelines:[^]vk.Pipeline)->vk.Result ---
	DestroyPipeline::proc(device:vk.Device,pipeline:vk.Pipeline,pAllocator:^vk.AllocationCallbacks) ---
	CreateFramebuffer::proc(device:vk.Device,pCreateInfo:^vk.FramebufferCreateInfo,pAllocator:^vk.AllocationCallbacks,pFramebuffer:^vk.Framebuffer)->vk.Result ---
	DestroyFramebuffer::proc(device:vk.Device,framebuffer:vk.Framebuffer,pAllocator:^vk.AllocationCallbacks) ---
	CreateCommandPool::proc(device:vk.Device,pCreateInfo:^vk.CommandPoolCreateInfo,pAllocator:^vk.AllocationCallbacks,pCommandPool:^vk.CommandPool)->vk.Result ---
	DestroyCommandPool::proc(device:vk.Device,commandPool:vk.CommandPool,pAllocator:^vk.AllocationCallbacks) ---
	AllocateCommandBuffers::proc(device:vk.Device,pAllocateInfo:^vk.CommandBufferAllocateInfo,pCommandBuffers:[^]vk.CommandBuffer)->vk.Result ---
	BeginCommandBuffer::proc(commandBuffer:vk.CommandBuffer,pBeginInfo:^vk.CommandBufferBeginInfo)->vk.Result ---
	CmdBeginRenderPass::proc(commandBuffer:vk.CommandBuffer,pRenderPassBegin:^vk.RenderPassBeginInfo,contents:vk.SubpassContents) ---
	CmdBindPipeline::proc(commandBuffer:vk.CommandBuffer,pipelineBindPoint:vk.PipelineBindPoint,pipeline:vk.Pipeline) ---
	CmdSetViewport::proc(commandBuffer:vk.CommandBuffer,firstViewport:u32,viewportCount:u32,pViewports:[^]vk.Viewport) ---
	CmdSetScissor::proc(commandBuffer:vk.CommandBuffer,firstScissor:u32,scissorCount:u32,pScissors:[^]vk.Rect2D) ---
	CmdDraw::proc(commandBuffer:vk.CommandBuffer,vertexCount:u32,instanceCount:u32,firstVertex:u32,firstInstance:u32) ---
	CmdEndRenderPass::proc(commandBuffer:vk.CommandBuffer) ---
	EndCommandBuffer::proc(commandBuffer:vk.CommandBuffer)->vk.Result ---
	CreateSemaphore::proc(device:vk.Device,pCreateInfo:^vk.SemaphoreCreateInfo,pAllocator:^vk.AllocationCallbacks,pSemaphore:^vk.Semaphore)->vk.Result ---
	CreateFence::proc(device:vk.Device,pCreateInfo:^vk.FenceCreateInfo,pAllocator:^vk.AllocationCallbacks,pFence:^vk.Fence)->vk.Result ---
	DestroySemaphore::proc(device:vk.Device,semaphore:vk.Semaphore,pAllocator:^vk.AllocationCallbacks) ---
	DestroyFence::proc(device:vk.Device,fence:vk.Fence,pAllocator:^vk.AllocationCallbacks) ---
	WaitForFences::proc(device:vk.Device,fenceCount:u32,pFences:[^]vk.Fence,waitAll:b32,timeout:u64) ---
	ResetFences::proc(device:vk.Device,fenceCount:u32,pFences:[^]vk.Fence)->vk.Result ---
	AcquireNextImageKHR::proc(device:vk.Device,swapchain:vk.SwapchainKHR,timeout:u64,semaphore:vk.Semaphore,fence:vk.Fence,pImageIndex:^u32)->vk.Result ---
	ResetCommandBuffer::proc(commandBuffer:vk.CommandBuffer,flags:vk.CommandBufferResetFlags)->vk.Result ---
	QueueSubmit::proc(queue:vk.Queue,submitCount:u32,pSubmits:[^]vk.SubmitInfo,fence:vk.Fence)->vk.Result ---
	QueuePresentKHR::proc(queue:vk.Queue,pPresentInfo:^vk.PresentInfoKHR)->vk.Result ---
	DeviceWaitIdle::proc(device:vk.Device)->vk.Result ---
	CreateDescriptorSetLayout::proc(device:vk.Device,pCreateInfo:^vk.DescriptorSetLayoutCreateInfo,pAllocator:^vk.AllocationCallbacks,pSetLayout:^vk.DescriptorSetLayout)->vk.Result ---
	DestroyDescriptorSetLayout::proc(device:vk.Device,descriptorSetLayout:vk.DescriptorSetLayout,pAllocator:^vk.AllocationCallbacks) ---
	CreateBuffer::proc(device:vk.Device,pCreateInfo:^vk.BufferCreateInfo,pAllocator:^vk.AllocationCallbacks,pBuffer:^vk.Buffer)->vk.Result ---
	GetBufferMemoryRequirements::proc(device:vk.Device,buffer:vk.Buffer,pMemoryRequirements:[^]vk.MemoryRequirements) ---
	AllocateMemory::proc(device:vk.Device,pAllocateInfo:^vk.MemoryAllocateInfo,pAllocator:^vk.AllocationCallbacks,pMemory:^vk.DeviceMemory)->vk.Result ---
	BindBufferMemory::proc(device:vk.Device,buffer:vk.Buffer,memory:vk.DeviceMemory,memoryOffset:vk.DeviceSize)->vk.Result ---
	GetPhysicalDeviceMemoryProperties::proc(physicalDevice:vk.PhysicalDevice,pMemoryProperties:[^]vk.PhysicalDeviceMemoryProperties) ---
	MapMemory::proc(device:vk.Device,memory:vk.DeviceMemory,offset:vk.DeviceSize,size:vk.DeviceSize,flags:vk.MemoryMapFlags,ppData:^rawptr)->vk.Result ---
	UnmapMemory::proc(device:vk.Device,memory:vk.DeviceMemory) ---
	DestroyBuffer::proc(device:vk.Device,buffer:vk.Buffer,pAllocator:^vk.AllocationCallbacks) ---
	FreeMemory::proc(device:vk.Device,memory:vk.DeviceMemory,pAllocator:^vk.AllocationCallbacks) ---
	CreateDescriptorPool::proc(device:vk.Device,pCreateInfo:^vk.DescriptorPoolCreateInfo,pAllocator:^vk.AllocationCallbacks,pDescriptorPool:^vk.DescriptorPool)->vk.Result ---
	DestroyDescriptorPool::proc(device:vk.Device,descriptorPool:vk.DescriptorPool,pAllocator:^vk.AllocationCallbacks) ---
	AllocateDescriptorSets::proc(device:vk.Device,pAllocateInfo:^vk.DescriptorSetAllocateInfo,pDescriptorSets:[^]vk.DescriptorSet)->vk.Result ---
	UpdateDescriptorSets::proc(device:vk.Device,descriptorWriteCount:u32,pDescriptorWrites:[^]vk.WriteDescriptorSet,descriptorCopyCount:u32,pDescriptorCopies:[^]vk.CopyDescriptorSet) ---
	CmdBindDescriptorSets::proc(commandBuffer:vk.CommandBuffer,pipelineBindPoint:vk.PipelineBindPoint,layout:vk.PipelineLayout,firstSet:u32,descriptorSetCount:u32,pDescriptorSets:[^]vk.DescriptorSet,dynamicOffsetCount:u32,pDynamicOffsets:[^]u32) ---
}

CreateDebugUtilsMessengerEXT::proc(instance:vk.Instance,pCreateInfo:^vk.DebugUtilsMessengerCreateInfoEXT,pAllocator:^vk.AllocationCallbacks,pDebugMessenger:^vk.DebugUtilsMessengerEXT)->vk.Result{
	func:=vk.ProcCreateDebugUtilsMessengerEXT(GetInstanceProcAddr(instance,"vkCreateDebugUtilsMessengerEXT"))
	if func!=nil{
		return func(instance,pCreateInfo,pAllocator,pDebugMessenger);
	}else{
		return .ERROR_EXTENSION_NOT_PRESENT;
	}
}

DestroyDebugUtilsMessengerEXT::proc(instance:vk.Instance,debugMessenger:vk.DebugUtilsMessengerEXT,pAllocator:^vk.AllocationCallbacks){
	func:=vk.ProcDestroyDebugUtilsMessengerEXT(GetInstanceProcAddr(instance,"vkDestroyDebugUtilsMessengerEXT"))
	if func!=nil{
		func(instance,debugMessenger,pAllocator)
	}
}

validationLayers:=([]cstring){
	"VK_LAYER_KHRONOS_validation"
}

deviceExtensions:=([]cstring){
	vk.KHR_SWAPCHAIN_EXTENSION_NAME
}

enableValidationLayers:=true

MAX_FRAMES_IN_FLIGHT::2
UINT64_MAX::transmute(u64)i64(-1)

runTime:f32
deltaTime:f32
bgColor:[3]f32={0.2,0.3,0.3}
resolution:[2]f32
quit:bool

// @(private="file")
// VAO,VBO:u32
// @(private="file")
// resolutionLoc:i32

BufferData::struct{
	layoutBinding:vk.DescriptorSetLayoutBinding,
	size:vk.DeviceSize,
	type:vk.DescriptorType,
}

Buffer::struct{
	buffer:vk.Buffer,
	memory:vk.DeviceMemory,
	mapped:rawptr,
}

Pipeline::struct{
	buffers:#soa[dynamic]BufferData,
	layout:vk.PipelineLayout,
	pipeline:vk.Pipeline,
	descriptorSetLayout:vk.DescriptorSetLayout,
	descriptorPool:vk.DescriptorPool,
	frames:#soa[MAX_FRAMES_IN_FLIGHT]struct{
		descriptorSet:vk.DescriptorSet,
		buffers:[dynamic]Buffer
	}
}

// @(private="file")
Context:struct{
	instance:vk.Instance,
	debugMessenger:vk.DebugUtilsMessengerEXT,
	surface:vk.SurfaceKHR,
	physicalDevice:vk.PhysicalDevice,
	device:vk.Device,
	queues:struct{
		graphics:vk.Queue,
		present:vk.Queue,
	},
	swap:struct{
		chain:vk.SwapchainKHR,
		images:#soa[]struct{
			image:vk.Image,
			view:vk.ImageView,
			buffer:vk.Framebuffer,
		},
		format:vk.Format,
		extent:vk.Extent2D,
	},
	renderPass:vk.RenderPass,
	commandPool:vk.CommandPool,
	currentFrame:u32,
	frames:#soa[MAX_FRAMES_IN_FLIGHT]struct{
		commandBuffer:vk.CommandBuffer,
		sync:struct{
			image:vk.Semaphore,
			render:vk.Semaphore,
			inFlight:vk.Fence,
		},
	},
	framebufferResized:bool,
	// pipeline:Pipeline,
	imageIndex:u32,
}

window:glfw.WindowHandle

GL_MAJOR_VERSION::4
GL_MINOR_VERSION::3

ResizeCallbackStruct::struct{
	resized:^bool,
	resolution:^[2]f32,
}

ResizeCallbackData:=ResizeCallbackStruct{
	resized=&Context.framebufferResized,
	resolution=&resolution,
}

framebufferResizeCallback::proc"c"(window:glfw.WindowHandle,width:i32,height:i32){
	data:=(^ResizeCallbackStruct)(glfw.GetWindowUserPointer(window))
	data.resized^=true
	data.resolution^={f32(width),f32(height)}
	// (^bool)(glfw.GetWindowUserPointer(window))^=true
}

InitWindow::proc(width,height:i32,name:cstring)->(ok:bool=true){
	// glfw.WindowHint(glfw.RESIZABLE,1)
	// glfw.WindowHint(glfw.CONTEXT_VERSION_MAJOR,GL_MAJOR_VERSION)
	// glfw.WindowHint(glfw.CONTEXT_VERSION_MINOR,GL_MINOR_VERSION)
	// glfw.WindowHint(glfw.OPENGL_PROFILE,glfw.OPENGL_CORE_PROFILE)
	
	if(glfw.Init()!=true){
		fmt.println("Failed to initialize GLFW")
		return false
	}
	defer if !ok do glfw.Terminate()
	
	glfw.WindowHint(glfw.CLIENT_API,glfw.NO_API)
	glfw.WindowHint(glfw.RESIZABLE,glfw.TRUE)

	window=glfw.CreateWindow(width,height,name,nil,nil)
	if window==nil {
		fmt.println("Unable to create window")
		return false
	}
	defer if !ok do glfw.DestroyWindow(window)
	resolution={f32(width),f32(height)}
	
	glfw.SetFramebufferSizeCallback(window,framebufferResizeCallback)
	glfw.SetWindowUserPointer(window,&ResizeCallbackData)
	// glfw.MakeContextCurrent(window)
	// glfw.SwapInterval(1)
	// gl.load_up_to(int(GL_MAJOR_VERSION),GL_MINOR_VERSION,glfw.gl_set_proc_address)
	// VAO,VBO=ScreenVerts()
	
	glfw.SetKeyCallback(window,key_callback)
	glfw.SetCursorPosCallback(window,mouse_callback)
	// glfw.SetFramebufferSizeCallback(window,size_callback)
	
	// resolution=[2]f32{f32(width),f32(height)}
	
	return initVulkan()
}

DestroyWindow::proc(){
	closeVulkan()
	glfw.DestroyWindow(window)
	glfw.Terminate()
}

BeginDrawing::proc(color:[4]f32){
	glfw.PollEvents()
	time:=f32(glfw.GetTime())
	deltaTime=time-runTime
	runTime=time
	
	using Context
	sync:=&frames[currentFrame].sync
	commandBuffer:=&frames[currentFrame].commandBuffer
	
	WaitForFences(device,1,&sync.inFlight,true,UINT64_MAX)
	result:=AcquireNextImageKHR(device,swap.chain,UINT64_MAX,sync.image,0,&imageIndex)
	
	if(result==.ERROR_OUT_OF_DATE_KHR){
		recreateSwapChain()
		return
	}else if(result!=.SUCCESS && result!=.SUBOPTIMAL_KHR){
		fmt.println("failed to acquire swap chain image!")
		// return false
		quit=true
	}
	
	ResetFences(device,1,&sync.inFlight)
	ResetCommandBuffer(commandBuffer^,{})
	
	beginInfo:vk.CommandBufferBeginInfo
	beginInfo.sType=.COMMAND_BUFFER_BEGIN_INFO
	if(BeginCommandBuffer(commandBuffer^,&beginInfo)!=.SUCCESS){
		fmt.println("failed to begin recording command buffer!")
		// return false
		quit=true
	}
	renderPassInfo:vk.RenderPassBeginInfo
	renderPassInfo.sType=.RENDER_PASS_BEGIN_INFO
	renderPassInfo.renderPass=Context.renderPass
	renderPassInfo.framebuffer=Context.swap.images.buffer[imageIndex]
	// renderPassInfo.renderArea.offset={0,0}
	renderPassInfo.renderArea.extent=Context.swap.extent
	clearColor:=vk.ClearValue{color={float32=color}}
	renderPassInfo.clearValueCount=1
	renderPassInfo.pClearValues=&clearColor
	CmdBeginRenderPass(commandBuffer^,&renderPassInfo,.INLINE)
}

EndDrawing::proc(){
	using Context
	sync:=&frames[currentFrame].sync
	commandBuffer:=&frames[currentFrame].commandBuffer
	
	CmdEndRenderPass(commandBuffer^)
	if(EndCommandBuffer(commandBuffer^)!=.SUCCESS){
		fmt.println("failed to record command buffer!")
		// return false
		quit=true
	}
	
	submitInfo:vk.SubmitInfo
	submitInfo.sType=.SUBMIT_INFO
	waitSemaphores:=[]vk.Semaphore{sync.image}
	waitStages:=[]vk.PipelineStageFlags{{.COLOR_ATTACHMENT_OUTPUT}}
	submitInfo.waitSemaphoreCount=1
	submitInfo.pWaitSemaphores=&waitSemaphores[0]
	submitInfo.pWaitDstStageMask=&waitStages[0]
	submitInfo.commandBufferCount=1
	submitInfo.pCommandBuffers=commandBuffer
	signalSemaphores:=[]vk.Semaphore{sync.render}
	submitInfo.signalSemaphoreCount=1
	submitInfo.pSignalSemaphores=&signalSemaphores[0]
	if(QueueSubmit(queues.graphics,1,&submitInfo,sync.inFlight)!=.SUCCESS){
		fmt.println("failed to submit draw command buffer!")
		// return false
		quit=true
	}
	presentInfo:vk.PresentInfoKHR
	presentInfo.sType=.PRESENT_INFO_KHR
	presentInfo.waitSemaphoreCount=1
	presentInfo.pWaitSemaphores=&signalSemaphores[0]
	swapChains:=[]vk.SwapchainKHR{swap.chain}
	presentInfo.swapchainCount=1
	presentInfo.pSwapchains=&swapChains[0]
	presentInfo.pImageIndices=&imageIndex
	result:=QueuePresentKHR(queues.present,&presentInfo)
	if(result==.ERROR_OUT_OF_DATE_KHR || result==.SUBOPTIMAL_KHR || framebufferResized){
		framebufferResized=false
		recreateSwapChain()
	}else if(result!=.SUCCESS){
		fmt.println("failed to present swap chain image!")
		// return false
		quit=true
	}
	currentFrame=(currentFrame+1)%MAX_FRAMES_IN_FLIGHT
	inputUpdate()
	quit|=bool(glfw.WindowShouldClose(window))
}

BeginShaderMode::proc(pipeline:^Pipeline){
	using Context
	sync:=&frames[currentFrame].sync
	commandBuffer:=&frames[currentFrame].commandBuffer
	
	CmdBindPipeline(commandBuffer^,.GRAPHICS,pipeline.pipeline)
	CmdBindDescriptorSets(commandBuffer^,.GRAPHICS,pipeline.layout,0,1,&pipeline.frames.descriptorSet[currentFrame],0,nil)
	DefaultViewport(commandBuffer^)
}

EndShaderMode::proc(){
	using Context
	sync:=&frames[currentFrame].sync
	commandBuffer:=&frames[currentFrame].commandBuffer
	// quit|=!drawFrame()
	CmdDraw(commandBuffer^,4,1,0,0)
}

// BeginScreenMode::

DefaultViewport::proc(commandBuffer:vk.CommandBuffer){
	viewport:vk.Viewport
	viewport.x=0
	viewport.y=0
	viewport.width=f32(Context.swap.extent.width)
	viewport.height=f32(Context.swap.extent.height)
	viewport.minDepth=0
	viewport.maxDepth=1
	CmdSetViewport(commandBuffer,0,1,&viewport)
	scissor:vk.Rect2D
	// scissor.offset={0,0}
	scissor.extent=Context.swap.extent
	CmdSetScissor(commandBuffer,0,1,&scissor)
}

// createDescriptorSets::proc()->(ok:bool=true){
// 	using Context
// 	layouts:[MAX_FRAMES_IN_FLIGHT]vk.DescriptorSetLayout//TODO: descriptorSetLayout
// 	allocInfo:vk.DescriptorSetAllocateInfo
// 	allocInfo.sType=.DESCRIPTOR_SET_ALLOCATE_INFO
// 	allocInfo.descriptorPool=descriptorPool
// 	allocInfo.descriptorSetCount=MAX_FRAMES_IN_FLIGHT
// 	allocInfo.pSetLayouts=&layouts[0]
// 	if AllocateDescriptorSets(device,&allocInfo,&frames.descriptorSet[0])!=.SUCCESS {
// 		fmt.println("failed to allocate descriptor sets!")
// 		return false
// 	}
// 	for i in 0..<MAX_FRAMES_IN_FLIGHT{
// 		bufferInfo:vk.DescriptorBufferInfo
// 		bufferInfo.buffer=uniformBuffers[i]
// 		bufferInfo.offset=0
// 		bufferInfo.range=size_of(UniformBufferObject)
// 		descriptorWrite:vk.WriteDescriptorSet
// 		descriptorWrite.sType=.WRITE_DESCRIPTOR_SET
// 		descriptorWrite.dstSet=&frames.descriptorSet[i]
// 		descriptorWrite.dstBinding=0
// 		descriptorWrite.dstArrayElement=0
// 		descriptorWrite.descriptorType=.UNIFORM_BUFFER
// 		descriptorWrite.descriptorCount=1
// 		descriptorWrite.pBufferInfo=&bufferInfo
// 		UpdateDescriptorSets(device,1,&descriptorWrite,0,nil)
// 	}
// 	return
// }

// createDescriptorPool::proc()->(ok:bool=true){
// 	using Context
// 	poolSize:vk.DescriptorPoolSize
// 	poolSize.type=.UNIFORM_BUFFER
// 	poolSize.descriptorCount=MAX_FRAMES_IN_FLIGHT
// 	poolInfo:vk.DescriptorPoolCreateInfo
// 	poolInfo.sType=.DESCRIPTOR_POOL_CREATE_INFO
// 	poolInfo.poolSizeCount=1
// 	poolInfo.pPoolSizes=&poolSize
// 	poolInfo.maxSets=MAX_FRAMES_IN_FLIGHT
// 	if CreateDescriptorPool(device,&poolInfo,nil,&descriptorPool)!=.SUCCESS{
// 		fmt.println("failed to create descriptor pool!")
// 		return false
// 	}
// 	return
// }

CreatePipeline::proc()->(pipeline:Pipeline,ok:bool=true){
	using Context
	return
}

MakeSSBO::proc(pipeline:^Pipeline,size:int,binding:u32){
	layoutBinding:vk.DescriptorSetLayoutBinding
	layoutBinding.binding=binding
	layoutBinding.descriptorCount=1
	layoutBinding.descriptorType=.STORAGE_BUFFER
	layoutBinding.stageFlags={.FRAGMENT}
	// layoutBinding.pImmutableSamplers=nil // Optional
	bufferSize:=vk.DeviceSize(size)
	append(&pipeline.buffers,BufferData{
		layoutBinding=layoutBinding,
		size=bufferSize,
		type=.STORAGE_BUFFER,
	})

	for i in 0..<MAX_FRAMES_IN_FLIGHT{
		last:=len(pipeline.frames[i].buffers)
		append(&pipeline.frames[i].buffers,Buffer{})
		createBuffer(bufferSize,{.STORAGE_BUFFER},{.HOST_VISIBLE,.HOST_COHERENT},&pipeline.frames[i].buffers[last].buffer,&pipeline.frames[i].buffers[last].memory)
		// MapMemory(Context.device,pipeline.frames[i].buffers[last].memory,0,bufferSize,{},&pipeline.frames[i].buffers[last].mapped)
	}
}

MakeUBO::proc(pipeline:^Pipeline,size:int,binding:u32){
	layoutBinding:vk.DescriptorSetLayoutBinding
	layoutBinding.binding=binding
	layoutBinding.descriptorCount=1
	layoutBinding.descriptorType=.UNIFORM_BUFFER
	layoutBinding.stageFlags={.FRAGMENT}
	// layoutBinding.pImmutableSamplers=nil // Optional
	bufferSize:=vk.DeviceSize(size)
	append(&pipeline.buffers,BufferData{
		layoutBinding=layoutBinding,
		size=bufferSize,
		type=.UNIFORM_BUFFER,
	})

	for i in 0..<MAX_FRAMES_IN_FLIGHT{
		last:=len(pipeline.frames[i].buffers)
		append(&pipeline.frames[i].buffers,Buffer{})
		createBuffer(bufferSize,{.UNIFORM_BUFFER},{.HOST_VISIBLE,.HOST_COHERENT},&pipeline.frames[i].buffers[last].buffer,&pipeline.frames[i].buffers[last].memory)
		// MapMemory(Context.device,pipeline.frames[i].buffers[last].memory,0,bufferSize,{},&pipeline.frames[i].buffers[last].mapped)
	}
}

MakeBuffers::proc(pipeline:^Pipeline)->(ok:bool=true){
	layoutInfo:vk.DescriptorSetLayoutCreateInfo
	layoutInfo.sType=.DESCRIPTOR_SET_LAYOUT_CREATE_INFO
	layoutInfo.bindingCount=u32(len(pipeline.buffers))
	layoutInfo.pBindings=&pipeline.buffers.layoutBinding[0]
	if(CreateDescriptorSetLayout(Context.device,&layoutInfo,nil,&pipeline.descriptorSetLayout)!=.SUCCESS){
		fmt.println("failed to create descriptor set layout!")
		ok=false;return
	}
	
	buffers:[dynamic][dynamic]BufferData
	defer{
		for buffer in buffers{
			delete(buffer)
		}
		delete(buffers)
	}
	outer:for buffer in pipeline.buffers{
		for &pool in buffers{
			if pool[0].type==buffer.type{
				append(&pool,buffer)
				continue outer
			}
		}
		pool:[dynamic]BufferData
		append(&pool,buffer)
		append(&buffers,pool)
	}
	poolSizes:=make([]vk.DescriptorPoolSize,len(buffers))
	defer delete(poolSizes)
	for &poolSize,i in poolSizes{
		poolSize.type=buffers[i][0].type
		poolSize.descriptorCount=MAX_FRAMES_IN_FLIGHT*u32(len(buffers[i]))
	}
	poolInfo:vk.DescriptorPoolCreateInfo
	poolInfo.sType=.DESCRIPTOR_POOL_CREATE_INFO
	poolInfo.poolSizeCount=u32(len(poolSizes))
	poolInfo.pPoolSizes=&poolSizes[0]
	poolInfo.maxSets=MAX_FRAMES_IN_FLIGHT
	if CreateDescriptorPool(Context.device,&poolInfo,nil,&pipeline.descriptorPool)!=.SUCCESS{
		fmt.println("failed to create descriptor pool!")
		ok=false;return
	}
	
	layouts:[MAX_FRAMES_IN_FLIGHT]vk.DescriptorSetLayout
	for &layout in layouts do layout=pipeline.descriptorSetLayout
	allocInfo:vk.DescriptorSetAllocateInfo
	allocInfo.sType=.DESCRIPTOR_SET_ALLOCATE_INFO
	allocInfo.descriptorPool=pipeline.descriptorPool
	allocInfo.descriptorSetCount=MAX_FRAMES_IN_FLIGHT
	allocInfo.pSetLayouts=&layouts[0]
	if AllocateDescriptorSets(Context.device,&allocInfo,&pipeline.frames.descriptorSet[0])!=.SUCCESS {
		fmt.println("failed to allocate descriptor sets!")
		return false
	}
	for i in 0..<MAX_FRAMES_IN_FLIGHT{
		bufferInfo:=make([]vk.DescriptorBufferInfo,len(pipeline.buffers))
		defer delete(bufferInfo)
		descriptorWrites:=make([]vk.WriteDescriptorSet,len(pipeline.buffers))
		defer delete(descriptorWrites)
		for j in 0..<len(pipeline.buffers){
			bufferInfo[j].buffer=pipeline.frames[i].buffers[j].buffer
			bufferInfo[j].offset=0
			bufferInfo[j].range=pipeline.buffers[j].size
			descriptorWrites[j].sType=.WRITE_DESCRIPTOR_SET
			descriptorWrites[j].dstSet=pipeline.frames[i].descriptorSet
			descriptorWrites[j].dstBinding=u32(j)
			descriptorWrites[j].dstArrayElement=0
			descriptorWrites[j].descriptorType=pipeline.buffers[j].type
			descriptorWrites[j].descriptorCount=1
			descriptorWrites[j].pBufferInfo=&bufferInfo[j]
		}
		UpdateDescriptorSets(Context.device,u32(len(pipeline.buffers)),&descriptorWrites[0],0,nil)
	}
	return
}

DestroyBuffers::proc(pipeline:Pipeline){
	DeviceWaitIdle(Context.device)
	for i in 0..<MAX_FRAMES_IN_FLIGHT{
		for buffer in pipeline.frames[i].buffers{
			DestroyBuffer(Context.device,buffer.buffer,nil)
			FreeMemory(Context.device,buffer.memory,nil)
		}
		delete(pipeline.frames[i].buffers)
	}
	delete(pipeline.buffers)
	// DestroyDes
	DestroyDescriptorPool(Context.device,pipeline.descriptorPool,nil)
	DestroyDescriptorSetLayout(Context.device,pipeline.descriptorSetLayout,nil)
}

UpdateBuffer::proc(pipeline:^Pipeline,ind:int,data:rawptr,size:int){
	// TODO: only map memory here?
	dst:rawptr
	MapMemory(Context.device,pipeline.frames[Context.currentFrame].buffers[ind].memory,0,vk.DeviceSize(size),{},&dst)
	// mem.copy(pipeline.frames[Context.currentFrame].buffers[ind].mapped,data,size)
	mem.copy(dst,data,size)
	UnmapMemory(Context.device,pipeline.frames[Context.currentFrame].buffers[ind].memory)
}

MakeScreenPipeline::proc(pipeline:^Pipeline,$fs:string)->(ok:bool=true){
	vs:=string(#load("screen.spv"))
	
	vsModule:=createShaderModule(vs) or_return
	fsModule:=createShaderModule(fs) or_return
	defer{
		DestroyShaderModule(Context.device,fsModule,nil)
		DestroyShaderModule(Context.device,vsModule,nil)
	}
	
	vertShaderStageInfo:vk.PipelineShaderStageCreateInfo
	vertShaderStageInfo.sType=.PIPELINE_SHADER_STAGE_CREATE_INFO
	vertShaderStageInfo.stage={.VERTEX}
	vertShaderStageInfo.module=vsModule
	vertShaderStageInfo.pName="main"
	
	fragShaderStageInfo:vk.PipelineShaderStageCreateInfo
	fragShaderStageInfo.sType=.PIPELINE_SHADER_STAGE_CREATE_INFO
	fragShaderStageInfo.stage={.FRAGMENT}
	fragShaderStageInfo.module=fsModule
	fragShaderStageInfo.pName="main"
	
	shaderStages:=[2]vk.PipelineShaderStageCreateInfo{vertShaderStageInfo,fragShaderStageInfo}
	return MakePipelineFromShaderStages(pipeline,shaderStages[:])
}

MakePipeline::proc(pipeline:^Pipeline,$vs:string,$fs:string)->(ok:bool=true){
	// vs:=string(#load(vspath))
	// fs:=string(#load(fspath))
	
	vsModule:=createShaderModule(vs) or_return
	fsModule:=createShaderModule(fs) or_return
	defer{
		DestroyShaderModule(Context.device,fsModule,nil)
		DestroyShaderModule(Context.device,vsModule,nil)
	}
	
	vertShaderStageInfo:vk.PipelineShaderStageCreateInfo
	vertShaderStageInfo.sType=.PIPELINE_SHADER_STAGE_CREATE_INFO
	vertShaderStageInfo.stage={.VERTEX}
	vertShaderStageInfo.module=vsModule
	vertShaderStageInfo.pName="main"
	
	fragShaderStageInfo:vk.PipelineShaderStageCreateInfo
	fragShaderStageInfo.sType=.PIPELINE_SHADER_STAGE_CREATE_INFO
	fragShaderStageInfo.stage={.FRAGMENT}
	fragShaderStageInfo.module=fsModule
	fragShaderStageInfo.pName="main"
	
	shaderStages:=[2]vk.PipelineShaderStageCreateInfo{vertShaderStageInfo,fragShaderStageInfo}
	return MakePipelineFromShaderStages(pipeline,shaderStages[:])
}

MakePipelineFromShaderStages::proc(pipeline:^Pipeline,shaderStages:[]vk.PipelineShaderStageCreateInfo)->(ok:bool=true){
	MakeBuffers(pipeline) or_return
	dynamicStates:=[?]vk.DynamicState{.VIEWPORT,.SCISSOR}
	dynamicState:vk.PipelineDynamicStateCreateInfo
	dynamicState.sType=.PIPELINE_DYNAMIC_STATE_CREATE_INFO
	dynamicState.dynamicStateCount=u32(len(dynamicStates))
	dynamicState.pDynamicStates=raw_data(dynamicStates[:])
	
	vertexInputInfo:vk.PipelineVertexInputStateCreateInfo
	vertexInputInfo.sType=.PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO
	
	inputAssembly:vk.PipelineInputAssemblyStateCreateInfo
	inputAssembly.sType=.PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO
	inputAssembly.topology=.TRIANGLE_FAN
	inputAssembly.primitiveRestartEnable=false
	
	viewport:vk.Viewport
	viewport.x=0
	viewport.y=0
	viewport.width=f32(Context.swap.extent.width)
	viewport.height=f32(Context.swap.extent.height)
	viewport.minDepth=0
	viewport.maxDepth=1
	
	scissor:vk.Rect2D
	scissor.offset={0,0}
	scissor.extent=Context.swap.extent
	
	viewportState:vk.PipelineViewportStateCreateInfo
	viewportState.sType=.PIPELINE_VIEWPORT_STATE_CREATE_INFO;
	viewportState.viewportCount=1
	viewportState.pViewports = &viewport;
	viewportState.scissorCount=1
	viewportState.pScissors = &scissor;
	
	rasterizer:vk.PipelineRasterizationStateCreateInfo
	rasterizer.sType=.PIPELINE_RASTERIZATION_STATE_CREATE_INFO
	rasterizer.depthClampEnable=false
	rasterizer.rasterizerDiscardEnable=false
	rasterizer.polygonMode=.FILL
	rasterizer.lineWidth=1
	rasterizer.cullMode={.BACK}
	rasterizer.frontFace=.CLOCKWISE
	rasterizer.depthBiasEnable=false
	
	multisampling:vk.PipelineMultisampleStateCreateInfo
	multisampling.sType=.PIPELINE_MULTISAMPLE_STATE_CREATE_INFO
	multisampling.sampleShadingEnable=false
	multisampling.rasterizationSamples={._1}
	
	// Depth test here
	
	colorBlendAttachment:vk.PipelineColorBlendAttachmentState
	colorBlendAttachment.colorWriteMask={.R,.G,.B,.A}
	colorBlendAttachment.blendEnable=false
	
	colorBlending:vk.PipelineColorBlendStateCreateInfo
	colorBlending.sType=.PIPELINE_COLOR_BLEND_STATE_CREATE_INFO
	colorBlending.logicOpEnable=false
	colorBlending.logicOp=.COPY
	colorBlending.attachmentCount=1
	colorBlending.pAttachments=&colorBlendAttachment

	pipelineLayoutInfo:vk.PipelineLayoutCreateInfo
	pipelineLayoutInfo.sType=.PIPELINE_LAYOUT_CREATE_INFO
	// if pipeline.descriptorSetLayout!=nil{
		pipelineLayoutInfo.setLayoutCount=1
		pipelineLayoutInfo.pSetLayouts=&pipeline.descriptorSetLayout
	// }

	if CreatePipelineLayout(Context.device,&pipelineLayoutInfo,nil,&pipeline.layout)!=.SUCCESS{
		fmt.println("failed to create pipeline layout!")
		ok=false;return
	}
	
	pipelineInfo:vk.GraphicsPipelineCreateInfo
	pipelineInfo.sType=.GRAPHICS_PIPELINE_CREATE_INFO
	pipelineInfo.stageCount=u32(len(shaderStages))
	pipelineInfo.pStages=raw_data(shaderStages)
	pipelineInfo.pVertexInputState=&vertexInputInfo
	pipelineInfo.pInputAssemblyState=&inputAssembly
	pipelineInfo.pViewportState=&viewportState
	pipelineInfo.pRasterizationState=&rasterizer
	pipelineInfo.pMultisampleState=&multisampling
	pipelineInfo.pColorBlendState=&colorBlending
	pipelineInfo.pDynamicState=&dynamicState
	pipelineInfo.layout=pipeline.layout
	pipelineInfo.renderPass=Context.renderPass
	pipelineInfo.subpass=0
	
	if CreateGraphicsPipelines(Context.device,0,1,&pipelineInfo,nil,&pipeline.pipeline)!=.SUCCESS{
		fmt.println("failed to create graphics pipeline!")
		ok=false;return
	}
	return
}

DestroyShader::proc(pipeline:Pipeline){
	DeviceWaitIdle(Context.device)
	DestroyPipeline(Context.device,pipeline.pipeline,nil)
	DestroyPipelineLayout(Context.device,pipeline.layout,nil)
}

createBuffer::proc(size:vk.DeviceSize,usage:vk.BufferUsageFlags,properties:vk.MemoryPropertyFlags,buffer:^vk.Buffer,bufferMemory:^vk.DeviceMemory)->(ok:bool=true){
	bufferInfo:vk.BufferCreateInfo
	bufferInfo.sType=.BUFFER_CREATE_INFO
	bufferInfo.size=size
	bufferInfo.usage=usage
	bufferInfo.sharingMode=.EXCLUSIVE

	if(CreateBuffer(Context.device,&bufferInfo,nil,buffer)!=.SUCCESS){
		fmt.println("failed to create buffer!")
		return false
	}

	memRequirements:vk.MemoryRequirements
	GetBufferMemoryRequirements(Context.device,buffer^,&memRequirements)

	allocInfo:vk.MemoryAllocateInfo
	allocInfo.sType=.MEMORY_ALLOCATE_INFO
	allocInfo.allocationSize=memRequirements.size
	allocInfo.memoryTypeIndex=findMemoryType(memRequirements.memoryTypeBits,properties) or_return

	if(AllocateMemory(Context.device,&allocInfo,nil,bufferMemory)!=.SUCCESS){
		fmt.println("failed to allocate buffer memory!")
		return false
	}

	BindBufferMemory(Context.device,buffer^,bufferMemory^,0)
	return
}

findMemoryType::proc(typeFilter:u32,properties:vk.MemoryPropertyFlags)->(type:u32,ok:bool=true){
	memProperties:vk.PhysicalDeviceMemoryProperties
	GetPhysicalDeviceMemoryProperties(Context.physicalDevice,&memProperties)

	for i in 0..<memProperties.memoryTypeCount{
		if bool(typeFilter & (1 << i)) && (memProperties.memoryTypes[i].propertyFlags & properties)==properties{
			type=i;return
		}
	}
	fmt.println("failed to find suitable memory type!")
	ok=false;return
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// drawFrame::proc()->(ok:bool=true){
// 	using Context
	
// 	// recordCommandBuffer(commandBuffer^,Context.pipeline,imageIndex)
// 	return
// }

recreateSwapChain::proc()->(ok:bool=true){
	width,height:=glfw.GetFramebufferSize(window)
	for width==0 || height==0{
		width,height=glfw.GetFramebufferSize(window)
		glfw.WaitEvents()
	}
	//TODO: do this ^^^?
	DeviceWaitIdle(Context.device)
	cleanupSwapChain()
	createSwapChain() or_return
	createImageViews() or_return
	createFramebuffers() or_return
	return
}

cleanupSwapChain::proc(){
	using Context
	for image in swap.images{
		framebuffer:=image.buffer
		DestroyFramebuffer(device,framebuffer,nil)
	}
	for image in swap.images{
		imageView:=image.view
		DestroyImageView(device,imageView,nil)
	}
	delete(swap.images)
	DestroySwapchainKHR(device,swap.chain,nil)
}

initVulkan::proc()->(ok:bool=true){
	using Context
	sync:=&frames[currentFrame].sync
	commandBuffer:=&frames[currentFrame].commandBuffer
	createInstance() or_return
	defer if !ok do DestroyInstance(instance,nil)
	setupDebugMessenger() or_return
	defer if !ok do DestroyDebugUtilsMessengerEXT(instance,debugMessenger,nil)
	createSurface() or_return
	defer if !ok do DestroySurfaceKHR(instance,surface,nil)
	pickPhysicalDevice() or_return
	createLogicalDevice() or_return
	defer if !ok do DestroyDevice(device,nil)
	createSwapChain() or_return
	defer if !ok{
		DestroySwapchainKHR(device,swap.chain,nil)
		delete(swap.images)
	}
	createImageViews() or_return
	defer if !ok{
		for image in swap.images{
			imageView:=image.view
			DestroyImageView(device,imageView,nil)
		}
		// delete(swap.imageViews)
	}
	createRenderPass() or_return
	defer if !ok do DestroyRenderPass(device,renderPass,nil)
	createFramebuffers() or_return
	defer if !ok{
		for image in swap.images{
			framebuffer:=image.buffer
			DestroyFramebuffer(device,framebuffer,nil)
		}
	}
	createCommandPool() or_return
	defer if !ok{
		DestroyCommandPool(device,commandPool,nil)
	}
	// createDescriptorPool() or_return
	// defer if !ok do DestroyDescriptorPool(device,descriptorPool,nil)
	// createDescriptorSets() or_return
	createCommandBuffers() or_return
	createSyncObjects() or_return
	defer if !ok{
		DestroySemaphore(device,sync.image,nil)
		DestroySemaphore(device,sync.render,nil)
		DestroyFence(device,sync.inFlight,nil)
	}
	return
}

closeVulkan::proc(){
	using Context
	sync:=&frames[currentFrame].sync
	commandBuffer:=&frames[currentFrame].commandBuffer
	DeviceWaitIdle(device)
	for i in 0..<MAX_FRAMES_IN_FLIGHT{
		DestroySemaphore(device,frames[i].sync.image,nil)
		DestroySemaphore(device,frames[i].sync.render,nil)
		DestroyFence(device,frames[i].sync.inFlight,nil)
	}
	// DestroyDescriptorPool(device,descriptorPool,nil)
	DestroyCommandPool(device,commandPool,nil)
	DestroyRenderPass(device,renderPass,nil)
	cleanupSwapChain()
	DestroyDevice(device,nil)
	if enableValidationLayers{
		DestroyDebugUtilsMessengerEXT(instance,debugMessenger,nil)
	}
	DestroySurfaceKHR(instance,surface,nil)
	DestroyInstance(instance,nil)
}

createSyncObjects::proc()->(ok:bool=true){
	using Context
	semaphoreInfo:vk.SemaphoreCreateInfo
	semaphoreInfo.sType=.SEMAPHORE_CREATE_INFO
	fenceInfo:vk.FenceCreateInfo
	fenceInfo.sType=.FENCE_CREATE_INFO
	fenceInfo.flags={.SIGNALED}
	for i in 0..<MAX_FRAMES_IN_FLIGHT{
		if(CreateSemaphore(device,&semaphoreInfo,nil,&frames[i].sync.image)!=.SUCCESS ||
				CreateSemaphore(device,&semaphoreInfo,nil,&frames[i].sync.render)!=.SUCCESS ||
				CreateFence(device,&fenceInfo,nil,&frames[i].sync.inFlight)!=.SUCCESS){
			fmt.println("failed to create semaphores!")
			return false
		}
	}
	return
}

createCommandBuffers::proc()->(ok:bool=true){
	using Context
	allocInfo:vk.CommandBufferAllocateInfo
	allocInfo.sType=.COMMAND_BUFFER_ALLOCATE_INFO
	allocInfo.commandPool=commandPool
	allocInfo.level=.PRIMARY
	allocInfo.commandBufferCount=u32(len(frames))
	if(AllocateCommandBuffers(device,&allocInfo,&frames.commandBuffer[0])!=.SUCCESS){
		fmt.println("failed to allocate command buffers!")
		return false
	}
	return
}

createCommandPool::proc()->(ok:bool=true){
	using Context
	queueFamilyIndices:=QueueFamiliesFind(physicalDevice)

	poolInfo:vk.CommandPoolCreateInfo
	poolInfo.sType=.COMMAND_POOL_CREATE_INFO
	poolInfo.flags={.RESET_COMMAND_BUFFER}
	poolInfo.queueFamilyIndex=queueFamilyIndices.graphicsFamily.?;
	if(CreateCommandPool(device,&poolInfo,nil,&commandPool)!=.SUCCESS){
		fmt.println("failed to create command pool!")
		return false
	}
	return
}

createFramebuffers::proc()->(ok:bool=true){
	using Context
	// swap.framebuffers=make([]vk.Framebuffer,len(swap.imageViews))
	for image,i in swap.images{
		attachments:=[?]vk.ImageView{image.view}

		framebufferInfo:vk.FramebufferCreateInfo
		framebufferInfo.sType=.FRAMEBUFFER_CREATE_INFO
		framebufferInfo.renderPass=renderPass
		framebufferInfo.attachmentCount=1
		framebufferInfo.pAttachments=raw_data(attachments[:])
		framebufferInfo.width=swap.extent.width
		framebufferInfo.height=swap.extent.height
		framebufferInfo.layers=1

		if CreateFramebuffer(device,&framebufferInfo,nil,&swap.images.buffer[i])!=.SUCCESS{
			fmt.println("failed to create framebuffer!")
			return false
		}
	}
	return
}

createRenderPass::proc()->(ok:bool=true){
	using Context
	colorAttachment:vk.AttachmentDescription
	colorAttachment.format=swap.format
	colorAttachment.samples={._1}
	colorAttachment.loadOp=.CLEAR
	colorAttachment.storeOp=.STORE
	colorAttachment.stencilLoadOp=.DONT_CARE
	colorAttachment.stencilStoreOp=.DONT_CARE
	colorAttachment.initialLayout=.UNDEFINED
	colorAttachment.finalLayout=.PRESENT_SRC_KHR
	
	colorAttachmentRef:vk.AttachmentReference
	colorAttachmentRef.attachment=0
	colorAttachmentRef.layout=.COLOR_ATTACHMENT_OPTIMAL
	
	subpass:vk.SubpassDescription
	subpass.pipelineBindPoint=.GRAPHICS
	subpass.colorAttachmentCount=1
	subpass.pColorAttachments=&colorAttachmentRef
	
	dependency:vk.SubpassDependency
	dependency.srcSubpass=vk.SUBPASS_EXTERNAL
	dependency.dstSubpass=0
	dependency.srcStageMask={.COLOR_ATTACHMENT_OUTPUT}
	dependency.srcAccessMask={}
	dependency.dstStageMask={.COLOR_ATTACHMENT_OUTPUT}
	dependency.dstAccessMask={.COLOR_ATTACHMENT_WRITE}
	
	renderPassInfo:vk.RenderPassCreateInfo
	renderPassInfo.sType=.RENDER_PASS_CREATE_INFO
	renderPassInfo.attachmentCount=1
	renderPassInfo.pAttachments=&colorAttachment
	renderPassInfo.subpassCount=1
	renderPassInfo.pSubpasses=&subpass
	renderPassInfo.dependencyCount=1
	renderPassInfo.pDependencies=&dependency

	if CreateRenderPass(device,&renderPassInfo,nil,&renderPass)!=.SUCCESS{
		fmt.println("failed to create render pass!")
		return false
	}
	return
}

createImageViews::proc()->(ok:bool=true){
	using Context
	// swap.imageViews=make([]vk.ImageView,len(swap.images))
	for image,i in swap.images{
		createInfo:vk.ImageViewCreateInfo
		createInfo.sType=.IMAGE_VIEW_CREATE_INFO
		createInfo.image=image.image
		createInfo.viewType=.D2
		createInfo.format=swap.format
		createInfo.components.r=.IDENTITY
		createInfo.components.g=.IDENTITY
		createInfo.components.b=.IDENTITY
		createInfo.components.a=.IDENTITY
		createInfo.subresourceRange.aspectMask={.COLOR}
		createInfo.subresourceRange.baseMipLevel=0
		createInfo.subresourceRange.levelCount=1
		createInfo.subresourceRange.baseArrayLayer=0
		createInfo.subresourceRange.layerCount=1
		if CreateImageView(device,&createInfo,nil,&swap.images.view[i])!=.SUCCESS{
			fmt.println("failed to create image views!")
			return false
		}
	}
	return
}

createSwapChain::proc()->(ok:bool=true){
	using Context
	swapChainSupport:=querySwapChainSupport(physicalDevice)
	defer{
		delete(swapChainSupport.formats)
		delete(swapChainSupport.presentModes)
	}
	surfaceFormat:=chooseSwapSurfaceFormat(swapChainSupport.formats)
	presentMode:=chooseSwapPresentMode(swapChainSupport.presentModes)
	swap.extent=chooseSwapExtent(swapChainSupport.capabilities)
	
	imageCount:=swapChainSupport.capabilities.minImageCount+1
	if swapChainSupport.capabilities.maxImageCount>0 && imageCount>swapChainSupport.capabilities.maxImageCount{
		imageCount=swapChainSupport.capabilities.maxImageCount
	}
	createInfo:vk.SwapchainCreateInfoKHR 
	createInfo.sType=.SWAPCHAIN_CREATE_INFO_KHR
	createInfo.surface=surface
	
	createInfo.minImageCount=imageCount
	createInfo.imageFormat=surfaceFormat.format
	swap.format=surfaceFormat.format
	createInfo.imageColorSpace=surfaceFormat.colorSpace
	createInfo.imageExtent=swap.extent
	createInfo.imageArrayLayers=1
	createInfo.imageUsage={.COLOR_ATTACHMENT}
	
	indices:=QueueFamiliesFind(physicalDevice)
	queueFamilyIndices:=[]u32{indices.graphicsFamily.?,indices.presentFamily.?}

	if indices.graphicsFamily!=indices.presentFamily{
		createInfo.imageSharingMode=.CONCURRENT
		createInfo.queueFamilyIndexCount=2
		createInfo.pQueueFamilyIndices=raw_data(queueFamilyIndices)
	}else{
		createInfo.imageSharingMode=.EXCLUSIVE
	}
	createInfo.preTransform=swapChainSupport.capabilities.currentTransform
	createInfo.compositeAlpha={.OPAQUE}
	createInfo.presentMode=presentMode
	createInfo.clipped=true
	createInfo.oldSwapchain=0
	
	if CreateSwapchainKHR(device,&createInfo,nil,&swap.chain)!=.SUCCESS{
		fmt.println("failed to create swap chain!")
		return false
	}
	GetSwapchainImagesKHR(device,swap.chain,&imageCount,nil)
	swap.images=make_soa_slice(#soa[]struct{image:vk.Image,view:vk.ImageView,buffer:vk.Framebuffer},int(imageCount))
	GetSwapchainImagesKHR(device,swap.chain,&imageCount,&swap.images.image[0])
	return
}

createSurface::proc()->(ok:bool=true){
	using Context
	if err:=glfw.CreateWindowSurface(instance,window,nil,&surface);err!=.SUCCESS{
		fmt.println("failed to create window surface!",err);
		return false
	}
	return
}

createLogicalDevice::proc()->(ok:bool=true){
	using Context
	indices:=QueueFamiliesFind(physicalDevice)
	uniqueQueueFamilies:=[?]u32{indices.graphicsFamily.?,indices.presentFamily.?}
	queueCreateInfos:[dynamic]vk.DeviceQueueCreateInfo
	queuePriority:f32=1.0
	outer: for queueFamily,i in uniqueQueueFamilies{
		for family in uniqueQueueFamilies[:i]{
			if family==queueFamily do continue outer
		}
		queueCreateInfo:vk.DeviceQueueCreateInfo
		queueCreateInfo.sType=.DEVICE_QUEUE_CREATE_INFO
		queueCreateInfo.queueFamilyIndex=indices.graphicsFamily.?
		queueCreateInfo.queueCount=1
		queueCreateInfo.pQueuePriorities=&queuePriority
		append(&queueCreateInfos,queueCreateInfo)
	}
	defer delete(queueCreateInfos)
	
	deviceFeatures:vk.PhysicalDeviceFeatures
	
	createInfo:vk.DeviceCreateInfo
	createInfo.sType=.DEVICE_CREATE_INFO
	createInfo.queueCreateInfoCount=u32(len(queueCreateInfos))
	createInfo.pQueueCreateInfos=raw_data(queueCreateInfos)
	createInfo.pEnabledFeatures=&deviceFeatures
	
	createInfo.enabledExtensionCount=u32(len(deviceExtensions))
	createInfo.ppEnabledExtensionNames=raw_data(deviceExtensions)
	if enableValidationLayers{
		createInfo.enabledLayerCount=u32(len(validationLayers))
		createInfo.ppEnabledLayerNames=raw_data(validationLayers)
	}else{
		createInfo.enabledLayerCount=0;
	}
	
	if CreateDevice(physicalDevice,&createInfo,nil,&device)!=.SUCCESS{
		fmt.println("failed to create logical device!")
		return false
	}
	GetDeviceQueue(device,indices.graphicsFamily.?,0,&queues.graphics)
	GetDeviceQueue(device,indices.presentFamily.?,0,&queues.present)
	return
}

pickPhysicalDevice::proc()->(ok:bool=true){
	using Context
	deviceCount:u32
	EnumeratePhysicalDevices(instance,&deviceCount,nil)
	if deviceCount==0{
		fmt.println("failed to find GPUs with Vulkan support!")
		return false
	}
	devices:=make([]vk.PhysicalDevice,deviceCount)
	defer delete(devices)
	EnumeratePhysicalDevices(instance,&deviceCount,raw_data(devices))
	for device in devices{
		if isDeviceSuitable(device){
			physicalDevice=device
			break
		}
	}

	if physicalDevice==nil{
		fmt.println("failed to find a suitable GPU!")
		return false
	}
	return
}

setupDebugMessenger::proc()->(ok:bool=true){
	using Context
	if !enableValidationLayers do return
	createInfo:vk.DebugUtilsMessengerCreateInfoEXT
	populateDebugMessengerCreateInfo(&createInfo)
	if CreateDebugUtilsMessengerEXT(instance,&createInfo,nil,&debugMessenger)!=.SUCCESS{
		fmt.println("Failed to setup debug messenger")
		return false
	}
	return
}

createInstance::proc()->(ok:bool=true){
	using Context
	if enableValidationLayers && !checkValidationLayerSupport(){
		fmt.println("validation layers requested, but not available!")
		return false
	}
	appInfo:vk.ApplicationInfo
	appInfo.sType=.APPLICATION_INFO
	appInfo.pApplicationName="Hello Triangle"
	appInfo.applicationVersion=vk.MAKE_VERSION(1,0,0)
	appInfo.pEngineName="No Engine"
	appInfo.engineVersion=vk.MAKE_VERSION(1,0,0)
	appInfo.apiVersion=vk.API_VERSION_1_0
	
	createInfo:vk.InstanceCreateInfo
	createInfo.sType=.INSTANCE_CREATE_INFO
	createInfo.pApplicationInfo=&appInfo

	glfwExtensions:=getRequiredExtensions()
	defer delete(glfwExtensions)
	createInfo.enabledExtensionCount=u32(len(glfwExtensions))
	createInfo.ppEnabledExtensionNames=raw_data(glfwExtensions)
	
	debugCreateInfo:vk.DebugUtilsMessengerCreateInfoEXT
	if enableValidationLayers{
		createInfo.enabledLayerCount=u32(len(validationLayers))
		createInfo.ppEnabledLayerNames=raw_data(validationLayers)
		
		populateDebugMessengerCreateInfo(&debugCreateInfo)
		createInfo.pNext=&debugCreateInfo
	}else{
		createInfo.enabledLayerCount=0;
	}
	
	if CreateInstance(&createInfo,nil,&instance)!=.SUCCESS{
		fmt.println("Failed to create instance")
		return false
	}
	// extensionCount:u32=0
	// EnumerateInstanceExtensionProperties(nil,&extensionCount,nil)
	// extensions:=make([]vk.ExtensionProperties,extensionCount)
	// EnumerateInstanceExtensionProperties(nil,&extensionCount,raw_data(extensions))
	// fmt.println("available extensions:")
	// for ext in extensions{
	// 	fmt.println('\t',ext.extensionName)
	// }
	// delete(extensions)
	return
}

populateDebugMessengerCreateInfo::proc(createInfo:^vk.DebugUtilsMessengerCreateInfoEXT){
	createInfo.sType=.DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT
	createInfo.messageSeverity={.VERBOSE,.WARNING,.ERROR}
	createInfo.messageType={.GENERAL,.VALIDATION,.PERFORMANCE}
	createInfo.pfnUserCallback=vk.ProcDebugUtilsMessengerCallbackEXT(debugCallback)
}

checkValidationLayerSupport::proc()->bool{
	layerCount:u32
	EnumerateInstanceLayerProperties(&layerCount,nil)
	availableLayers:=make([]vk.LayerProperties,layerCount)
	defer delete(availableLayers)
	EnumerateInstanceLayerProperties(&layerCount,raw_data(availableLayers))
	for layerName in validationLayers{
		layerFound:=false
		loop: for layerProperties in availableLayers{
			for c,i in layerProperties.layerName{
				// fmt.printf("%c",c)
				if c!=(transmute([^]u8)layerName)[i] do break
				if c==0{
					layerFound=true
					break loop
				}
			}
		}
		if !layerFound{
			return false
		}
	}
	return true
}

getRequiredExtensions::proc()->[dynamic]cstring{
	glfwExtensions:=glfw.GetRequiredInstanceExtensions()
	extensions:[dynamic]cstring
	for ext in glfwExtensions{
		append(&extensions,ext)
	}
	if enableValidationLayers{
		append(&extensions,vk.EXT_DEBUG_UTILS_EXTENSION_NAME)
	}
	return extensions
}

debugCallback::proc(
	messageSeverity:vk.DebugUtilsMessageSeverityFlagsEXT,
	messageTypes:vk.DebugUtilsMessageTypeFlagsEXT,
	pCallbackData:^vk.DebugUtilsMessengerCallbackDataEXT,
	pUserData:rawptr)->b32{
	fmt.println("validation layer:",pCallbackData.pMessage)
	return false
}

QueueFamilyIndices::struct{
	graphicsFamily:Maybe(u32),
	presentFamily:Maybe(u32),
}

isDeviceSuitable::proc(device:vk.PhysicalDevice)->bool{
	indices:=QueueFamiliesFind(device)
	extensionsSupported:=checkDeviceExtensionSupport(device)
	swapChainAdequate:bool
	if extensionsSupported{
		swapChainSupport:=querySwapChainSupport(device)
		// defer delete(swapChainSupport.formats)
		swapChainAdequate=len(swapChainSupport.formats)>0 && len(swapChainSupport.presentModes)>0
		SwapChainSupportDetailsDestroy(swapChainSupport)
	}
	return QueueFamiliesComplete(indices) && extensionsSupported && swapChainAdequate
	// deviceProperties:VkPhysicalDeviceProperties
	// GetPhysicalDeviceProperties(device,&deviceProperties)
	// deviceFeatures:VkPhysicalDeviceFeatures
	// GetPhysicalDeviceFeatures(device,&deviceFeatures)
	// return deviceProperties.deviceType == VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU && deviceFeatures.geometryShader
}

QueueFamiliesComplete::proc(indices:QueueFamilyIndices)->bool{
	_=indices.graphicsFamily.? or_return
	_=indices.presentFamily.? or_return
	return true
}

QueueFamiliesFind::proc(device:vk.PhysicalDevice)->QueueFamilyIndices{
	indices:QueueFamilyIndices
	queueFamilyCount:u32
	GetPhysicalDeviceQueueFamilyProperties(device,&queueFamilyCount,nil)
	queueFamilies:=make([]vk.QueueFamilyProperties,queueFamilyCount)
	defer delete(queueFamilies)
	GetPhysicalDeviceQueueFamilyProperties(device,&queueFamilyCount,raw_data(queueFamilies))
	for queueFamily,i in queueFamilies{
		if vk.QueueFlag.GRAPHICS in queueFamily.queueFlags{
			indices.graphicsFamily=u32(i)
		}
		presentSupport:b32
		GetPhysicalDeviceSurfaceSupportKHR(device,u32(i),Context.surface,&presentSupport)
		if presentSupport{
			indices.presentFamily=u32(i)
		}
		if QueueFamiliesComplete(indices){
			break
		}
	}
	return indices;
}

checkDeviceExtensionSupport::proc(device:vk.PhysicalDevice)->bool{
	extensionCount:u32
	EnumerateDeviceExtensionProperties(device,nil,&extensionCount,nil)
	availableExtensions:=make([]vk.ExtensionProperties,extensionCount)
	defer delete(availableExtensions)
	EnumerateDeviceExtensionProperties(device,nil,&extensionCount,raw_data(availableExtensions))
	outer: for extension in deviceExtensions{
		inner: for avb in availableExtensions{
			for c,i in string(extension){
				if u8(c)!=avb.extensionName[i] do continue inner
			}
			continue outer
		}
		return false
	}
	return true
}

SwapChainSupportDetails::struct{
	capabilities:vk.SurfaceCapabilitiesKHR,
	formats:[]vk.SurfaceFormatKHR,
	presentModes:[]vk.PresentModeKHR,
}

SwapChainSupportDetailsDestroy::proc(details:SwapChainSupportDetails){
	delete(details.formats)
	delete(details.presentModes)
}

querySwapChainSupport::proc(device:vk.PhysicalDevice)->SwapChainSupportDetails{
	details:SwapChainSupportDetails
	GetPhysicalDeviceSurfaceCapabilitiesKHR(device,Context.surface,&details.capabilities)
	formatCount:u32
	GetPhysicalDeviceSurfaceFormatsKHR(device,Context.surface,&formatCount,nil)
	if formatCount!=0{
		details.formats=make([]vk.SurfaceFormatKHR,int(formatCount))
		GetPhysicalDeviceSurfaceFormatsKHR(device,Context.surface,&formatCount,raw_data(details.formats))
	}
	presentModeCount:u32
	GetPhysicalDeviceSurfacePresentModesKHR(device,Context.surface,&presentModeCount,nil)
	if presentModeCount!=0{
		details.presentModes=make([]vk.PresentModeKHR,int(presentModeCount))
		GetPhysicalDeviceSurfacePresentModesKHR(device,Context.surface,&presentModeCount,raw_data(details.presentModes))
	}
	return details;
}

chooseSwapSurfaceFormat::proc(availableFormats:[]vk.SurfaceFormatKHR)->vk.SurfaceFormatKHR{
	for availableFormat in availableFormats{
		if availableFormat.format==.B8G8R8A8_SRGB && availableFormat.colorSpace==.SRGB_NONLINEAR{
			return availableFormat
		}
	}
	return availableFormats[0]
}

chooseSwapPresentMode::proc(availablePresentModes:[]vk.PresentModeKHR)->vk.PresentModeKHR{
	for availablePresentMode in availablePresentModes{
		if availablePresentMode==.MAILBOX{
			return availablePresentMode
		}
	}
	return .FIFO
}

chooseSwapExtent::proc(capabilities:vk.SurfaceCapabilitiesKHR)->vk.Extent2D{
	if capabilities.currentExtent.width!=transmute(u32)i32(-1){
		return capabilities.currentExtent
	}else{
		width,height:=glfw.GetFramebufferSize(window)
		actualExtent:=vk.Extent2D{
			u32(width),
			u32(height)
		}
		actualExtent.width=clamp(actualExtent.width,capabilities.minImageExtent.width,capabilities.maxImageExtent.width)
		actualExtent.height=clamp(actualExtent.height,capabilities.minImageExtent.height,capabilities.maxImageExtent.height)
		return actualExtent;
	}
}

createShaderModule::proc(code:string)->(shaderModule:vk.ShaderModule,ok:bool=true){
	createInfo:vk.ShaderModuleCreateInfo
	createInfo.sType=.SHADER_MODULE_CREATE_INFO
	createInfo.codeSize=len(code)
	createInfo.pCode=transmute(^u32)raw_data(code)
	if CreateShaderModule(Context.device,&createInfo,nil,&shaderModule)!=.SUCCESS{
		fmt.println("failed to create shader module!")
		ok=false
	}
	return
}

// recordCommandBuffer::proc(commandBuffer:vk.CommandBuffer,pipeline:Pipeline,imageIndex:u32)->(ok:bool=true){
// 	beginInfo:vk.CommandBufferBeginInfo
// 	beginInfo.sType=.COMMAND_BUFFER_BEGIN_INFO
// 	if(BeginCommandBuffer(commandBuffer,&beginInfo)!=.SUCCESS){
// 		fmt.println("failed to begin recording command buffer!")
// 		return false
// 	}
// 	renderPassInfo:vk.RenderPassBeginInfo
// 	renderPassInfo.sType=.RENDER_PASS_BEGIN_INFO
// 	renderPassInfo.renderPass=Context.renderPass
// 	renderPassInfo.framebuffer=Context.swap.images.buffer[imageIndex]
// 	// renderPassInfo.renderArea.offset={0,0}
// 	renderPassInfo.renderArea.extent=Context.swap.extent
// 	clearColor:=vk.ClearValue{color={float32={.5,.25,0,1}}}
// 	renderPassInfo.clearValueCount=1
// 	renderPassInfo.pClearValues=&clearColor
// 	CmdBeginRenderPass(commandBuffer,&renderPassInfo,.INLINE)
	
// 	CmdBindPipeline(commandBuffer,.GRAPHICS,pipeline.pipeline)
// 	viewport:vk.Viewport
// 	viewport.x=0
// 	viewport.y=0
// 	viewport.width=f32(Context.swap.extent.width)
// 	viewport.height=f32(Context.swap.extent.height)
// 	viewport.minDepth=0
// 	viewport.maxDepth=1
// 	CmdSetViewport(commandBuffer,0,1,&viewport)
// 	scissor:vk.Rect2D
// 	// scissor.offset={0,0}
// 	scissor.extent=Context.swap.extent
// 	CmdSetScissor(commandBuffer,0,1,&scissor)
// 	CmdDraw(commandBuffer,3,1,0,0)
	
// 	CmdEndRenderPass(commandBuffer)
// 	if(EndCommandBuffer(commandBuffer)!=.SUCCESS){
// 		fmt.println("failed to record command buffer!")
// 		return false
// 	}
// 	return
// }

