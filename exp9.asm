assume cs:codesg ;111111111111111111

data segment    ;0123456789ABCDEF
	db	'welcome to masm!' ;ds:[bx]
	
	db	00000010b;green		;ds:[si]
	db	01000010b;green characters on a red background
	db	01110001b;blue characters on a white background
data ends

codesg segment
start:	mov ax,data
	mov ds,ax
	mov bx,0
	mov si,16	;memory address deviation in 
	mov ax,0b800h
	mov es,ax 	;memory address segment in later
	mov bp,0	;memory address deviation in later
	mov cx,3
s0:	push bx
	push cx
	push bp
	mov cx,16
s:	mov al,[bx]
	mov ah,[si]
	mov es:[bp],ax
	inc bx
	add bp,2
	loop s
	add si,1
	pop bp
	pop cx
	pop bx
	add bp,160
	loop s0


	mov ax,4c00h
	int 21
	
codesg ends
end start
