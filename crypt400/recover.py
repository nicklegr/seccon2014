#! /usr/bin/env python2
import sys
def e(a,b):
	u,u1,v,v1,g,g1=1,0,0,1,a,b
	while g1:
		q=g//g1
		u,u1=u1,u-q*u1
		v,v1=v1,v-q*v1
		g,g1=g1,g-q*g1
	return u,v,g
def f(a,m):
	x,y,g=e(a,m)
	return x%m
p=int(sys.argv[1])
q=int(sys.argv[2])
if p>=q:
	sys.exit(1)
u=f(p,q)
d=f(65536+1,(p-1)*(q-1)//e(p-1,q-1)[2])
pt=bytearray(256)
qt=bytearray(256)
ut=bytearray(256)
dt=bytearray(512)
for i in range(256):
	pt[i]=(p>>(2040-8*i))&0xff
	qt[i]=(q>>(2040-8*i))&0xff
	ut[i]=(u>>(2040-8*i))&0xff
for i in range(512):
	dt[i]=(d>>(4088-8*i))&0xff
with open('key.gpg.masked','rb') as fi:
	o=bytearray(fi.read(4775))
o[0xd7f:0x0e7f]=pt
o[0xe81:0x0f81]=qt
o[0xf83:0x1083]=ut
o[0xb7d:0x0d7d]=dt
with open('key.gpg','wb') as fo:
	fo.write(o)
