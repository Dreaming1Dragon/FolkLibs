package render

import "core:fmt"
import "vendor:glfw"
import "base:runtime"

KeyBind::struct{
	set:bool,
	hold:bool,
	code:i32
}

input:struct{
	keys:[]KeyBind,
	mouse:[2]f32
}

@(private="file")
mouseCaptured:bool
@(private="file")
mousePos:[2]f32

CaptureCursor::proc(){
	glfw.SetInputMode(window,glfw.CURSOR,glfw.CURSOR_DISABLED)
	mouseCaptured=true
}

ReleaseCursor::proc(){
	glfw.SetInputMode(window,glfw.CURSOR,glfw.CURSOR_NORMAL)
	mouseCaptured=false
}

GetKey::proc($KEY)->u32{
	return glfw.KEY
}

inputInit::proc(keys:[]KeyBind){
	input.keys=keys
}

key_callback::proc"c"(window:glfw.WindowHandle,key,scancode,action,mods:i32){
	// context = runtime.default_context()
	for &k in input.keys{
		if(k.code==key){
			if(action==glfw.PRESS){
				k.set=true
			}else if(action==glfw.RELEASE){
				k.set=false
			}
		}
	}
}

mouse_callback::proc"c"(window:glfw.WindowHandle,xpos,ypos:f64){
	// context = runtime.default_context()
	pos:[2]f32={f32(xpos),resolution.y-f32(ypos)}
	if mouseCaptured{
		input.mouse=pos-mousePos
	}else{
		input.mouse=pos
	}
	// fmt.println(input.mouse)
	mousePos=pos
}

inputUpdate::proc(){
	// fmt.println(input.mouse)
	for &k,i in input.keys{
		if !k.hold{
			k.set=false
		}
	}
	if mouseCaptured{
		input.mouse={0,0}
	}
}

