
# 默认动作

default :
	../z_tools/make.exe img

# 镜像文件生成

antos.bin : antos.nas Makefile
	../z_tools/nask.exe antos.nas antos.bin antos.lst

antos.img : antos.bin Makefile
	../z_tools/edimg.exe   imgin:../z_tools/fdimg0at.tek \
		wbinimg src:antos.bin len:512 from:0 to:0   imgout:antos.img

# 其他指令

asm :
	../z_tools/make.exe -r antos.bin

img :
	../z_tools/make.exe -r antos.img

run :
	../z_tools/make.exe img
	copy antos.img ..\z_tools\qemu\fdimage0.bin
	../z_tools/make.exe -C ../z_tools/qemu

install :
	../z_tools/make.exe img
	../z_tools/imgtol.com w a: antos.img

clean :
	-del antos.bin
	-del antos.lst

src_only :
	../z_tools/make.exe clean
	-del antos.img
