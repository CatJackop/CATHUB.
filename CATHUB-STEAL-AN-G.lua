-- hide.lat / lite / d65e8b46d95a
local ij0i0jlI01j1O=(getfenv and getfenv(1)) or _ENV or _G
local ljlOLOO,joI1lO0l0L0I=string.byte,string.char
local function LO11jIj(ij0OILIOLIjjL,iLOojOOjOj1OI)
local LIoLjLlI=""
local I0jjiO1L1L1i=#iLOojOOjOj1OI
for Li0Ojo=1,#ij0OILIOLIjjL do LIoLjLlI=LIoLjLlI..joI1lO0l0L0I((ljlOLOO(ij0OILIOLIjjL,Li0Ojo)-ljlOLOO(iLOojOOjOj1OI,(Li0Ojo-1)%I0jjiO1L1L1i+1))%256) end
return LIoLjLlI
end
local j01iOIijli0=ij0i0jlI01j1O[LO11jIj("\014\195\214\170u\015","\155^jE\018\155\135")]
local LLOOl0I0O0I=ij0i0jlI01j1O[LO11jIj("\255\241l\193C\243","\140}\250X\213")][LO11jIj("I\166c","\2141\001\156Z\163")]
local jO1OlOj1o01j=ij0i0jlI01j1O[LO11jIj("\185\197\136\248\170","Ed&\140")][LO11jIj("\134\169V\009\132\174","#:\232\166")]
local iio11I=ij0i0jlI01j1O[LO11jIj("\2445dx","\135\212\240\016F ")][LO11jIj("O\164\255_\008","\2338\144\240\150\140\255")]
local Ioo1i1jiii=ij0i0jlI01j1O[LO11jIj("\223\148\196\224\146\184\208\151","k%V")]
local iOiLI0Ij=ij0i0jlI01j1O[LO11jIj("r\023\160U\127","\r\165.\230")]
local li11Illj=Ioo1i1jiii("8685")*2+ljlOLOO("b")+(joI1lO0l0L0I(80,81)=="PQ" and 5208 or 52)+j01iOIijli0("#",0,0)*21
local IiiijIIi=ij0i0jlI01j1O[LO11jIj("\165P\154\254\150","1\2398\146")][LO11jIj("\1578x\219","-\215\021p\228")] or function(...) return {n=j01iOIijli0("#",...),...} end
local LI0L0l=ij0i0jlI01j1O[LO11jIj("{oTa\169","\007\014\242\245D\226\187")][LO11jIj(")Fk\188\023C","\180\216\251[")] or ij0i0jlI01j1O[LO11jIj("q}\022\011\150\127","\252\015\166\1703\020")]
local IiILI10="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function j1lj0I(i1LjoI)
local ILLLjLoOoi0oj={}
for iiII1LLiI=1,64 do ILLLjLoOoi0oj[ljlOLOO(IiILI10,iiII1LLiI)]=iiII1LLiI-1 end
local lOLliI,L1ojLj1oiIOLol,llooiloI0O,loILoOLOoj1i={},0,0,0
for iiII1LLiI=1,#i1LjoI do
local lII1I0l=ILLLjLoOoi0oj[ljlOLOO(i1LjoI,iiII1LLiI)]
if lII1I0l then
L1ojLj1oiIOLol=L1ojLj1oiIOLol*64+lII1I0l
llooiloI0O=llooiloI0O+6
if llooiloI0O>=8 then llooiloI0O=llooiloI0O-8 loILoOLOoj1i=loILoOLOoj1i+1 lOLliI[loILoOLOoj1i]=joI1lO0l0L0I(iio11I(L1ojLj1oiIOLol/(2^llooiloI0O))%256) L1ojLj1oiIOLol=L1ojLj1oiIOLol%(2^llooiloI0O) end
end
end
return jO1OlOj1o01j(lOLliI)
end
local Illl0Ilj0LL0="XFtXlO63Gx1rrV7xsFADymfyxMB/ehGa2WrHGqgyKs5wNqh/IGJ57VanxbqCfdWS+3UCHoeuiSa1t7tBKAs20soziCybEBO3elXqXwfvP6jVUr8uIENQsq8lhk+S6ohXLz7D4IG/WcVcfC2A6P1P+Wug/1FkjoGq35cfWlSZLVLjA9OyjZphr0SQGp1EvXjleUWiNcvxo4sDhJ5DMHxgdYV23Mbg6Lu1CPpcQd/8fYGc0EDfUXn8bgrireGg6+LkXhQc4i3SpYAKEQ/ofRZU5/fSZEpAvIde3adxsOfeG9BnuoAJ/qFkM3ucL6g7Ur3skFcFMzpbxYv4joxnvn5btwRMue/dIuHEAniH/SC19giDd3Trr4E1H8T1kC++6i4dSL3eNBZx2yf0ExGI24/H3s2k7sZ/Q1LFVhDeM5dao/11F9/Lm4jKVG/4f5T0g1TCJCycuU88ZtKL+T6Zlwsj8HHb7l472LqP5ekO47pNQ45zhtlDO/0XjtAuYlEHVhndCppK7k2IJyFhDLm6KoqTfwPuF07czXaJuxxF+/4CJK+L7WgeXDihueH9oGs3rwSlX92FBp+SJGLxhPdvNWXaUvKK3/t6rlqAD1Ul2r1Q/SJ2D6D7utX0I8IriLAEZdfKFHRXdOlEqnoqrd3TahIjtxd+IaPjWB9Tf8UT4YMXROyBvoxYyDRaWzrlJ/P31/sKQtB717HYIS9tFshM28KeOlT6961S8m5di5nswL/FCEALZk9EqeeCkSl/LWq4SNZY2x5x0MJKwgjtI7Er+TPzH5/gmxW6N59RyojE5XUR0bInqk/A1pNH5NH8Gfqk4o0YEy/rtHkoEiLZBQK8iueDnWe/P2MFF959M8NjBlCsYNM/izwSv7o85BmL1SMi1uFiBEzAn1f/A61liwCMBOry34A/IynK61PSByA51wXs0+CrtHiVHgEYJNTPCV8ECpgb9d4aX90X4LLopYvKSG5rmByIrYubJnflV4tpu4u2"
local function LIIIooO1OO(IjI11oLL1lIliI)
local lLl0L00jIlOoLO=(3593584954)+li11Illj
local IOjLLO1o1O1I=29
local L0i1010Llio={}
for Lj11i00=1,#IjI11oLL1lIliI do
lLl0L00jIlOoLO=(lLl0L00jIlOoLO*53663+3631706593)%4294967296
local ilOlL0Ll1=ljlOLOO(IjI11oLL1lIliI,Lj11i00)
local IIi1O1jjOoOiII=(iio11I(lLl0L00jIlOoLO/65536)+IOjLLO1o1O1I+(Lj11i00-1)*47)%256
L0i1010Llio[Lj11i00]=joI1lO0l0L0I((ilOlL0Ll1-IIi1O1jjOoOiII)%256)
IOjLLO1o1O1I=(IOjLLO1o1O1I*31+ilOlL0Ll1+1)%251
end
return jO1OlOj1o01j(L0i1010Llio)
end
local LLLL0jlj0il=LIIIooO1OO(j1lj0I(Illl0Ilj0LL0))
local ilOlL0Ll1=1
local function lIO0110iLli()
local Lj11i00=ljlOLOO(LLLL0jlj0il,ilOlL0Ll1)
ilOlL0Ll1=ilOlL0Ll1+1
return Lj11i00
end
local function i00II0olIl1L10()
local Lj11i00,l0ioLil01ILj=ljlOLOO(LLLL0jlj0il,ilOlL0Ll1,ilOlL0Ll1+1)
ilOlL0Ll1=ilOlL0Ll1+2
return Lj11i00+l0ioLil01ILj*256
end
local function jijIIOoo()
local Lj11i00,l0ioLil01ILj,IjI11oLL1lIliI,L0i1010Llio=ljlOLOO(LLLL0jlj0il,ilOlL0Ll1,ilOlL0Ll1+3)
ilOlL0Ll1=ilOlL0Ll1+4
return Lj11i00+l0ioLil01ILj*256+IjI11oLL1lIliI*65536+L0i1010Llio*16777216
end
local function j0lo0LjiiolI()
local Lj11i00=jijIIOoo()
local l0ioLil01ILj=LLOOl0I0O0I(LLLL0jlj0il,ilOlL0Ll1,ilOlL0Ll1+Lj11i00-1)
ilOlL0Ll1=ilOlL0Ll1+Lj11i00
return l0ioLil01ILj
end
local function Lo1LlO()
local Lj11i00=lIO0110iLli()
local l0ioLil01ILj=j0lo0LjiiolI()
if Lj11i00==0 then return Ioo1i1jiii(l0ioLil01ILj)
elseif Lj11i00==1 then return l0ioLil01ILj
elseif Lj11i00==2 then return 1/0
elseif Lj11i00==3 then return -1/0
else return 0/0 end
end
local function Ii00o1()
local lo11IIl=lIO0110iLli()
local Lj11i00=lIO0110iLli()
local l0ioLil01ILj=i00II0olIl1L10()
local li00001ll1o={}
for IjI11oLL1lIliI=1,l0ioLil01ILj do local loLOOll1lj0i=i00II0olIl1L10() li00001ll1o[IjI11oLL1lIliI]={loLOOll1lj0i,j0lo0LjiiolI()} end
local L0i1010Llio=jijIIOoo()
local jlI0IoIli1j1jO={}
for IjI11oLL1lIliI=1,L0i1010Llio do
jlI0IoIli1j1jO[IjI11oLL1lIliI]={i00II0olIl1L10(),i00II0olIl1L10(),jijIIOoo(),jijIIOoo()}
end
local ilOlL0Ll1=i00II0olIl1L10()
local lL0L000oljlO={}
for IjI11oLL1lIliI=1,ilOlL0Ll1 do lL0L000oljlO[IjI11oLL1lIliI]=Ii00o1() end
local jILjjjlo11oLo=i00II0olIl1L10()
local LlOiLooO0IO={}
for IjI11oLL1lIliI=1,jILjjjlo11oLo do LlOiLooO0IO[IjI11oLL1lIliI]={lIO0110iLli(),i00II0olIl1L10()} end
return {lo11IIl,Lj11i00,jlI0IoIli1j1jO,li00001ll1o,lL0L000oljlO,LlOiLooO0IO,{}}
end
local function iLjil0O0(lLj0I1oLj1,Lijji1,loLOOll1lj0i)
if Lijji1[loLOOll1lj0i]~=nil then return Lijji1[loLOOll1lj0i] end
local i1LjoI=lLj0I1oLj1[loLOOll1lj0i]
local ILLLjLoOoi0oj=i1LjoI[1]
local iiII1LLiI=i1LjoI[2]
local lOLliI=(53134+ILLLjLoOoi0oj*251+1)%65536
local L1ojLj1oiIOLol={}
for llooiloI0O=1,#iiII1LLiI do
lOLliI=(lOLliI*40503+12345)%65536
L1ojLj1oiIOLol[llooiloI0O]=joI1lO0l0L0I((ljlOLOO(iiII1LLiI,llooiloI0O)-iio11I(lOLliI/256)%256-llooiloI0O*(53134%256))%256)
end
local loILoOLOoj1i=jO1OlOj1o01j(L1ojLj1oiIOLol)
local lII1I0l=ljlOLOO(loILoOLOoj1i,1)
local jOi0Oo0jj=ljlOLOO(loILoOLOoj1i,2)+ljlOLOO(loILoOLOoj1i,3)*256+ljlOLOO(loILoOLOoj1i,4)*65536+ljlOLOO(loILoOLOoj1i,5)*16777216
local ilII11OjLL0=LLOOl0I0O0I(loILoOLOoj1i,6,5+jOi0Oo0jj)
local IjLL1iIijo1
if lII1I0l==0 then IjLL1iIijo1=Ioo1i1jiii(ilII11OjLL0) elseif lII1I0l==1 then IjLL1iIijo1=ilII11OjLL0 elseif lII1I0l==2 then IjLL1iIijo1=1/0 elseif lII1I0l==3 then IjLL1iIijo1=-1/0 else IjLL1iIijo1=0/0 end
Lijji1[loLOOll1lj0i]=IjLL1iIijo1
return IjLL1iIijo1
end
local ljjl0LilL0jjI={}
local lilOj0oOO1=i00II0olIl1L10()
for Ij100iI=1,lilOj0oOO1 do local Lj11i00=i00II0olIl1L10() local l0ioLil01ILj=i00II0olIl1L10() ljjl0LilL0jjI[Lj11i00]=l0ioLil01ILj end
local i1o1Ll=Ii00o1()
local jjoLLO0oijoo0i
local function IOjjljL(i1o1Ll,LlOiLooO0IO)
return function(...) return jjoLLO0oijoo0i(i1o1Ll,LlOiLooO0IO,IiiijIIi(...)) end
end
jjoLLO0oijoo0i=function(i1o1Ll,LlOiLooO0IO,j0lLjI1OooL01l)
local I01oiI1Ii={}
local ioIj1IOIo=0
local lo11IIl=i1o1Ll[1]
local lLjl0IL0=j0lLjI1OooL01l.n
for Lj11i00=1,lo11IIl do I01oiI1Ii[Lj11i00-1]=j0lLjI1OooL01l[Lj11i00] end
local j1oIoj,I1loLiO={},0
if i1o1Ll[2]==1 then I1loLiO=lLjl0IL0-lo11IIl; if I1loLiO<0 then I1loLiO=0 end; for Lj11i00=1,I1loLiO do j1oIoj[Lj11i00]=j0lLjI1OooL01l[lo11IIl+Lj11i00] end end
local jlI0IoIli1j1jO,li00001ll1o,lL0L000oljlO=i1o1Ll[3],i1o1Ll[4],i1o1Ll[5]
local iIOo110=i1o1Ll[7]
local lOIOO0ooo1o=1
local jILjjjlo11oLo=0
while true do
local ljIlo1=jlI0IoIli1j1jO[lOIOO0ooo1o]
lOIOO0ooo1o=lOIOO0ooo1o+1
local LLo1Ol,Lj11i00,l0ioLil01ILj,IjI11oLL1lIliI=ljIlo1[1],ljIlo1[2],ljIlo1[3],ljIlo1[4]
local L0i1010Llio=ljjl0LilL0jjI[LLo1Ol]
if (lOIOO0ooo1o*(lOIOO0ooo1o+1)*(lOIOO0ooo1o+2))%3~=0 then ioIj1IOIo=ioIj1IOIo-5 end
if L0i1010Llio==4 then
lOIOO0ooo1o=l0ioLil01ILj+1
elseif L0i1010Llio==22 then
if (not not I01oiI1Ii[Lj11i00])==(l0ioLil01ILj~=0) then lOIOO0ooo1o=IjI11oLL1lIliI+1 end
elseif L0i1010Llio==24 then
I01oiI1Ii[Lj11i00]=(I01oiI1Ii[l0ioLil01ILj]<=I01oiI1Ii[IjI11oLL1lIliI])
elseif L0i1010Llio==25 then
I01oiI1Ii[Lj11i00]=I01oiI1Ii[l0ioLil01ILj][I01oiI1Ii[IjI11oLL1lIliI]]
elseif L0i1010Llio==35 then
I01oiI1Ii[Lj11i00]=I01oiI1Ii[l0ioLil01ILj]/I01oiI1Ii[IjI11oLL1lIliI]
elseif L0i1010Llio==36 then
LlOiLooO0IO[l0ioLil01ILj+1][1]=I01oiI1Ii[Lj11i00]
elseif L0i1010Llio==31 then
I01oiI1Ii[Lj11i00]=I01oiI1Ii[l0ioLil01ILj]^I01oiI1Ii[IjI11oLL1lIliI]
elseif L0i1010Llio==40 then
I01oiI1Ii[Lj11i00]=(I01oiI1Ii[l0ioLil01ILj]-I01oiI1Ii[l0ioLil01ILj]%I01oiI1Ii[IjI11oLL1lIliI])/I01oiI1Ii[IjI11oLL1lIliI]
elseif L0i1010Llio==38 then
I01oiI1Ii[Lj11i00]=iLjil0O0(li00001ll1o,iIOo110,l0ioLil01ILj+1)
elseif L0i1010Llio==13 then
I01oiI1Ii[Lj11i00]=I01oiI1Ii[Lj11i00]-I01oiI1Ii[Lj11i00+2]; lOIOO0ooo1o=l0ioLil01ILj+1
elseif L0i1010Llio==42 then
I01oiI1Ii[Lj11i00]=I01oiI1Ii[l0ioLil01ILj]
elseif L0i1010Llio==43 then
I01oiI1Ii[Lj11i00]=I01oiI1Ii[l0ioLil01ILj]-I01oiI1Ii[IjI11oLL1lIliI]
elseif L0i1010Llio==11 then
ij0i0jlI01j1O[iLjil0O0(li00001ll1o,iIOo110,l0ioLil01ILj+1)]=I01oiI1Ii[Lj11i00]
elseif L0i1010Llio==34 then
I01oiI1Ii[Lj11i00]=I01oiI1Ii[l0ioLil01ILj][1]
elseif L0i1010Llio==3 then
I01oiI1Ii[Lj11i00]=(I01oiI1Ii[l0ioLil01ILj]>=I01oiI1Ii[IjI11oLL1lIliI])
elseif L0i1010Llio==2 then
if l0ioLil01ILj==0 then
for i1LjoI=1,I1loLiO do I01oiI1Ii[Lj11i00+i1LjoI-1]=j1oIoj[i1LjoI] end
jILjjjlo11oLo=Lj11i00+I1loLiO
else
for i1LjoI=1,l0ioLil01ILj-1 do I01oiI1Ii[Lj11i00+i1LjoI-1]=j1oIoj[i1LjoI] end
end
elseif L0i1010Llio==39 then
I01oiI1Ii[Lj11i00]={I01oiI1Ii[l0ioLil01ILj]}
elseif L0i1010Llio==1 then
local iiII1LLiI
if l0ioLil01ILj==0 then iiII1LLiI=jILjjjlo11oLo-Lj11i00 else iiII1LLiI=l0ioLil01ILj-1 end
local lOLliI={}
for i1LjoI=1,iiII1LLiI do lOLliI[i1LjoI]=I01oiI1Ii[Lj11i00+i1LjoI-1] end
return LI0L0l(lOLliI,1,iiII1LLiI)
elseif L0i1010Llio==41 then
local iiII1LLiI
if l0ioLil01ILj==0 then iiII1LLiI=jILjjjlo11oLo-Lj11i00-1 else iiII1LLiI=l0ioLil01ILj end
local ILLLjLoOoi0oj=I01oiI1Ii[Lj11i00]
for i1LjoI=1,iiII1LLiI do ILLLjLoOoi0oj[IjI11oLL1lIliI+i1LjoI]=I01oiI1Ii[Lj11i00+i1LjoI] end
elseif L0i1010Llio==7 then
local ILLLjLoOoi0oj=I01oiI1Ii[Lj11i00]
local iiII1LLiI
if l0ioLil01ILj==0 then iiII1LLiI=jILjjjlo11oLo-Lj11i00-1 else iiII1LLiI=l0ioLil01ILj-1 end
local lOLliI={}
for i1LjoI=1,iiII1LLiI do lOLliI[i1LjoI]=I01oiI1Ii[Lj11i00+i1LjoI] end
local L1ojLj1oiIOLol=IiiijIIi(ILLLjLoOoi0oj(LI0L0l(lOLliI,1,iiII1LLiI)))
if IjI11oLL1lIliI==0 then
local llooiloI0O=L1ojLj1oiIOLol.n
for i1LjoI=1,llooiloI0O do I01oiI1Ii[Lj11i00+i1LjoI-1]=L1ojLj1oiIOLol[i1LjoI] end
jILjjjlo11oLo=Lj11i00+llooiloI0O
else
for i1LjoI=1,IjI11oLL1lIliI-1 do I01oiI1Ii[Lj11i00+i1LjoI-1]=L1ojLj1oiIOLol[i1LjoI] end
end
elseif L0i1010Llio==12 then
I01oiI1Ii[Lj11i00]=I01oiI1Ii[l0ioLil01ILj]%I01oiI1Ii[IjI11oLL1lIliI]
elseif L0i1010Llio==19 then
I01oiI1Ii[Lj11i00]=(I01oiI1Ii[l0ioLil01ILj]==I01oiI1Ii[IjI11oLL1lIliI])
elseif L0i1010Llio==26 then
for i1LjoI=Lj11i00,Lj11i00+l0ioLil01ILj do I01oiI1Ii[i1LjoI]=nil end
elseif L0i1010Llio==9 then
I01oiI1Ii[l0ioLil01ILj][1]=I01oiI1Ii[Lj11i00]
elseif L0i1010Llio==5 then
I01oiI1Ii[Lj11i00]=(I01oiI1Ii[l0ioLil01ILj]~=I01oiI1Ii[IjI11oLL1lIliI])
elseif L0i1010Llio==23 then
local ILLLjLoOoi0oj=I01oiI1Ii[Lj11i00]
local loILoOLOoj1i=I01oiI1Ii[Lj11i00+1]
local lII1I0l=I01oiI1Ii[Lj11i00+2]
local L1ojLj1oiIOLol=IiiijIIi(ILLLjLoOoi0oj(loILoOLOoj1i,lII1I0l))
local llooiloI0O=L1ojLj1oiIOLol[1]
if llooiloI0O~=nil then
I01oiI1Ii[Lj11i00+2]=llooiloI0O
for i1LjoI=1,l0ioLil01ILj do I01oiI1Ii[Lj11i00+3+i1LjoI-1]=L1ojLj1oiIOLol[i1LjoI] end
lOIOO0ooo1o=IjI11oLL1lIliI+1
end
elseif L0i1010Llio==15 then
I01oiI1Ii[Lj11i00][I01oiI1Ii[l0ioLil01ILj]]=I01oiI1Ii[IjI11oLL1lIliI]
elseif L0i1010Llio==27 then
I01oiI1Ii[Lj11i00]=not I01oiI1Ii[l0ioLil01ILj]
elseif L0i1010Llio==29 then
I01oiI1Ii[Lj11i00]={}
elseif L0i1010Llio==30 then
I01oiI1Ii[Lj11i00]=(I01oiI1Ii[l0ioLil01ILj]>I01oiI1Ii[IjI11oLL1lIliI])
elseif L0i1010Llio==6 then
I01oiI1Ii[Lj11i00+1]=I01oiI1Ii[l0ioLil01ILj]; I01oiI1Ii[Lj11i00]=I01oiI1Ii[l0ioLil01ILj][I01oiI1Ii[IjI11oLL1lIliI]]
elseif L0i1010Llio==20 then
I01oiI1Ii[Lj11i00]=LlOiLooO0IO[l0ioLil01ILj+1][1]
elseif L0i1010Llio==8 then
I01oiI1Ii[Lj11i00]=I01oiI1Ii[l0ioLil01ILj]+I01oiI1Ii[IjI11oLL1lIliI]
elseif L0i1010Llio==18 then
I01oiI1Ii[Lj11i00]=-I01oiI1Ii[l0ioLil01ILj]
elseif L0i1010Llio==28 then
I01oiI1Ii[Lj11i00]=I01oiI1Ii[l0ioLil01ILj]*I01oiI1Ii[IjI11oLL1lIliI]
elseif L0i1010Llio==32 then
I01oiI1Ii[Lj11i00]=(l0ioLil01ILj~=0)
elseif L0i1010Llio==33 then
local ILLLjLoOoi0oj=lL0L000oljlO[l0ioLil01ILj+1]
local lOLliI={}
local L1ojLj1oiIOLol=ILLLjLoOoi0oj[6]
for i1LjoI=1,#L1ojLj1oiIOLol do
local llooiloI0O=L1ojLj1oiIOLol[i1LjoI]
if llooiloI0O[1]==1 then lOLliI[i1LjoI]=I01oiI1Ii[llooiloI0O[2]] else lOLliI[i1LjoI]=LlOiLooO0IO[llooiloI0O[2]+1] end
end
I01oiI1Ii[Lj11i00]=IOjjljL(ILLLjLoOoi0oj,lOLliI)
elseif L0i1010Llio==17 then
I01oiI1Ii[Lj11i00]=ij0i0jlI01j1O[iLjil0O0(li00001ll1o,iIOo110,l0ioLil01ILj+1)]
elseif L0i1010Llio==14 then
I01oiI1Ii[Lj11i00]=I01oiI1Ii[Lj11i00]+I01oiI1Ii[Lj11i00+2]
local ILLLjLoOoi0oj=I01oiI1Ii[Lj11i00+2]
if (ILLLjLoOoi0oj>0 and I01oiI1Ii[Lj11i00]<=I01oiI1Ii[Lj11i00+1]) or (ILLLjLoOoi0oj<=0 and I01oiI1Ii[Lj11i00]>=I01oiI1Ii[Lj11i00+1]) then I01oiI1Ii[Lj11i00+3]=I01oiI1Ii[Lj11i00]; lOIOO0ooo1o=l0ioLil01ILj+1 end
elseif L0i1010Llio==21 then
I01oiI1Ii[Lj11i00]=(I01oiI1Ii[l0ioLil01ILj]<I01oiI1Ii[IjI11oLL1lIliI])
elseif L0i1010Llio==10 then
I01oiI1Ii[Lj11i00]=#I01oiI1Ii[l0ioLil01ILj]
elseif L0i1010Llio==37 then
I01oiI1Ii[Lj11i00]=((I01oiI1Ii[Lj11i00] or 0)+l0ioLil01ILj)%(IjI11oLL1lIliI+1)
elseif L0i1010Llio==16 then
I01oiI1Ii[Lj11i00]=I01oiI1Ii[l0ioLil01ILj]..I01oiI1Ii[IjI11oLL1lIliI]
else iOiLI0Ij() end
end
return ioIj1IOIo
end
return jjoLLO0oijoo0i(i1o1Ll,{},IiiijIIi(...))
