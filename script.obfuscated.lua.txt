-- hide.lat / lite / 7c1730264dccf7c14a577c04
local joLLj0=(getfenv and getfenv(1)) or _ENV or _G
local L0lilIojiolo,Ll0LOIl1oLo1=string.byte,string.char
local function ll0I1jLILO1iII(jjiij1O0O,iOOoli0ljjolL)
local LLOIij=""
local LjLo1olLo1o=#iOOoli0ljjolL
for iIi0IIOliII=1,#jjiij1O0O do LLOIij=LLOIij..Ll0LOIl1oLo1((L0lilIojiolo(jjiij1O0O,iIi0IIOliII)-L0lilIojiolo(iOOoli0ljjolL,(iIi0IIOliII-1)%LjLo1olLo1o+1))%256) end
return LLOIij
end
local IOi01ol1iI010i=joLLj0[ll0I1jLILO1iII("\012\199\210\254\197\218","\153bf")]
local Lo0oILlll=joLLj0[ll0I1jLILO1iII("\015\135\145%\195X","\156\019\031\188U\241")][ll0I1jLILO1iII("\000\138\222","\141\021|\203")]
local IlOj1liO1ooIl=joLLj0[ll0I1jLILO1iII("\232{\205\231\223","t\026k{z\217\017")][ll0I1jLILO1iII("v*\1855\253\233","\019\187K\210\156u\227")]
local io1jIOOoIlLj=joLLj0[ll0I1jLILO1iII("\179mZV","F\012\230\238o#")][ll0I1jLILO1iII("$\195\030\0000","\190W\175\145")]
local i0o1Il0j1oi1o0=joLLj0[ll0I1jLILO1iII("\136\145\127\198B\252y\148","\020\"\017Q\213\154")]
local jLIj1L1o1l=joLLj0[ll0I1jLILO1iII("F\135\255\248\210","\225\021\141\137`\214")]
local i1LIjjLiij0=joLLj0[ll0I1jLILO1iII("\231p=J","s\247\205\229\142\186")]
local ILI1OOjO0oj=joLLj0[ll0I1jLILO1iII("\028n\149\227\026}\130\234\022k\141\219","\181\009!v")]
local L1lLll1iIj1jlO=joLLj0[ll0I1jLILO1iII("\027\170\184\253\014\189","\169IA\150")]
local jjjioL=joLLj0[ll0I1jLILO1iII("\139\237\152\145","\029\136 ")]
local LOloLlo1jj,iILi1lO,IoLO1jjoL1Oj,Ill0ojlollL0=ll0I1jLILO1iII("ffuwW","\242\005\019\011"),ll0I1jLILO1iII("3l\186t\156\242<e","\205\247L\017(\137"),ll0I1jLILO1iII("\022e|=\148)","\183\006\019\201/"),ll0I1jLILO1iII("\"*\255\219\190/","\195\203\156zR")
local IiLljIi=joLLj0[ll0I1jLILO1iII("\194\022\253\005z","^\177\155\144\019_\234")]
local lOooOIl=67
if IiLljIi then local LoOLllOl0ILOOO=IiLljIi[ll0I1jLILO1iII("^\135\179Mz\180Kx\189","\234\021R")] if LoOLllOl0ILOOO then local function Iio0joO0joj() local iiL1Il0,iILjIji0lljIIO=LoOLllOl0ILOOO():gsub(":%d+","") if iILjIji0lljIIO>=2 then return 3188 end return 67 end lOooOIl=Iio0joO0joj() end end
local lojlloLL=(Ll0LOIl1oLo1(71,74)=="GJ" and 5990 or 5)+lOooOIl+i0o1Il0j1oi1o0("8150")*4+L0lilIojiolo("B")+IOi01ol1iI010i("#",0,0,0,0,0,0)*8
local Ij100l1oOOjji0=joLLj0[ll0I1jLILO1iII("i\251\008\029Z","\245\154\166\177")][ll0I1jLILO1iII("\164\189\196\031","4\\a\180")] or function(...) return {n=IOi01ol1iI010i("#",...),...} end
local l0O1jOiL0OLj=joLLj0[ll0I1jLILO1iII("\020Or\".","\160\238\016\182\201\145")][ll0I1jLILO1iII("N\176{\000<\173","\217B\011\159")] or joLLj0[ll0I1jLILO1iII("!#b\2250O","\172\181\242\128\205\228")]
local Lo01o0o="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function iLjloOI1ll(l1IOOoj)
local Iij1LoOILOOoI={}
for li1lIjO=1,64 do Iij1LoOILOOoI[L0lilIojiolo(Lo01o0o,li1lIjO)]=li1lIjO-1 end
local jI1il1Oi1I,IiO00L11,i1IiOllO1io,II0jLIoIL={},0,0,0
for li1lIjO=1,#l1IOOoj do
local l1Oiioilo0Lj=Iij1LoOILOOoI[L0lilIojiolo(l1IOOoj,li1lIjO)]
if l1Oiioilo0Lj then
IiO00L11=IiO00L11*64+l1Oiioilo0Lj
i1IiOllO1io=i1IiOllO1io+6
if i1IiOllO1io>=8 then i1IiOllO1io=i1IiOllO1io-8 II0jLIoIL=II0jLIoIL+1 jI1il1Oi1I[II0jLIoIL]=Ll0LOIl1oLo1(io1jIOOoIlLj(IiO00L11/(2^i1IiOllO1io))%256) IiO00L11=IiO00L11%(2^i1IiOllO1io) end
end
end
return IlOj1liO1ooIl(jI1il1Oi1I)
end
local Lo1ll00I="sxHws/ySDACbrcm0XgIjXZmsruUr9e8qZTkHhFBab2QJvOdL/B1Mj7utkr1HSpBYv8s7HI3LYmMsLsfAzaRNgLYKj2E4dFsOiekeJ44k0uOAjd9IAvh39BAnnEqYGhRwRtJFZcTJuGv364Aj4fOPtb8kEdCwB1/Zld5ZQuzZNqEO4LgRmNUdPoR9gg9b6YGHUBirWdlS+IRrRIfzOWUS1DTENwM+ua0jkK+o476qYNs2Hegqhqn5/nn05UPVDFkz/ZN5lo0GfybmdvG8KlBltjJdp1llcyqSHVkU3yWOfeyXMloVqow3R2V4iqLNqZTDDVUAsGmrbJAETY1CXLHol6tEEACNHltrzLhvA99qtJVFKXzMDTdzg8S7uG8JQKvka3mv9CGVdUJPrhKwN7i7dJIJMMm0+Ni1yCunLw7CQPrLVIIw0TZ32AuBQGDF0l8fdbXtRsu9v1ydT2O6lOV8YHIPFLIVJXKrn5fTqwx/dp8kp4U/8OyaQMbJL6eIPv4mEMPOToXE8dvnpEvnnpgb77bOwfDL6jvgdvSJQUIvUuShMartN/UkeAgeNH1GSKHJBaboi3A9AgZZFtywfy77KU3YcxmLjkP9ug2rk2MqEigNsYmpoP/KqhE0SQr9zWsU3sCPXxp6rQqqdmwaK4W4izts2HjvpmlFPksW+SGgGUUMbAbS2QgYR4H0WH1vZKMYOCMJaEFOg4vrlil7EbhN2liudUEQZ/yGWxUfJ8s59XDC7UKdkDsCCK7FMi6Ll0mazyj5Gfp1HV386ehxpfi0rkfEgxwYBo9W9KOioiRVg548c6yI142ukwY56rYaysQfOwHBKPXlVrxiVQJ74gutRW1WHRhTpTyGE5JVIMrLfkmSKV/C2f8MhOzvM4IffdYBR98D4f3oUInzTwJakm1B4q2MGoETjduviB9U9ROr6zrX3bG9RnyzUcxkgDkj3MZuIYYxFMK+Agqr19keFGhLkctpsWqMsF3gumh989phvPTk8s7ICVc9RklSbAgBMMDgYhN3lILTNbnYc7zLbuidlleOCLEfZwxWnDt0HqdW9oczLhr5oTIcAti0tW/MT5jpByWXvXR5sJ1qMQ=="
local function IlO1iI(L1L0IIji1oLlOl)
if #L1L0IIji1oLlOl~=826 then jLIj1L1o1l("VM integrity check failed",0) end
local l0l01OILL0L0i=(225797160)+lojlloLL
local ji1j0I0olo0=224
local loiLoOlL={}
local LlI1Li,L0LLiil=1,0
for iiL1Il0=1,#L1L0IIji1oLlOl do
l0l01OILL0L0i=(l0l01OILL0L0i*24839+2569807125)%4294967296
local jOLOoiI=L0lilIojiolo(L1L0IIji1oLlOl,iiL1Il0)
local IIjoO1iiLIl0L=(io1jIOOoIlLj(l0l01OILL0L0i/65536)+ji1j0I0olo0+(iiL1Il0-1)*43)%256
local I010jiiOjLL=(jOLOoiI-IIjoO1iiLIl0L)%256
loiLoOlL[iiL1Il0]=Ll0LOIl1oLo1(I010jiiOjLL)
LlI1Li=(LlI1Li*257+I010jiiOjLL+1)%4294967291
L0LLiil=(L0LLiil*65599+I010jiiOjLL+1)%4294967279
ji1j0I0olo0=(ji1j0I0olo0*37+jOLOoiI+1)%251
end
if LlI1Li~=995121143 or L0LLiil~=3945663982 then jLIj1L1o1l("VM integrity check failed",0) end
return IlOj1liO1ooIl(loiLoOlL)
end
local ilooij10j=IlO1iI(iLjloOI1ll(Lo1ll00I))
local jOLOoiI=1
local function Lj1L0I0oI1(iiL1Il0)
if iiL1Il0<0 or jOLOoiI+iiL1Il0-1>#ilooij10j then jLIj1L1o1l("VM payload is truncated",0) end
end
local function I11jOi()
Lj1L0I0oI1(1)
local iiL1Il0=L0lilIojiolo(ilooij10j,jOLOoiI)
jOLOoiI=jOLOoiI+1
return iiL1Il0
end
local function jIll11iIILoI0()
Lj1L0I0oI1(2)
local iiL1Il0,I010jiiOjLL=L0lilIojiolo(ilooij10j,jOLOoiI,jOLOoiI+1)
jOLOoiI=jOLOoiI+2
return iiL1Il0+I010jiiOjLL*256
end
local function lL0L11iLIljo()
Lj1L0I0oI1(4)
local iiL1Il0,I010jiiOjLL,L1L0IIji1oLlOl,loiLoOlL=L0lilIojiolo(ilooij10j,jOLOoiI,jOLOoiI+3)
jOLOoiI=jOLOoiI+4
return iiL1Il0+I010jiiOjLL*256+L1L0IIji1oLlOl*65536+loiLoOlL*16777216
end
local function liLljLlo0OOl()
local iiL1Il0=lL0L11iLIljo()
Lj1L0I0oI1(iiL1Il0)
local I010jiiOjLL=Lo0oILlll(ilooij10j,jOLOoiI,jOLOoiI+iiL1Il0-1)
jOLOoiI=jOLOoiI+iiL1Il0
return I010jiiOjLL
end
local function lllljl()
local iiL1Il0=I11jOi()
local I010jiiOjLL=liLljLlo0OOl()
if iiL1Il0==0 then return i0o1Il0j1oi1o0(I010jiiOjLL)
elseif iiL1Il0==1 then return I010jiiOjLL
elseif iiL1Il0==2 then return 1/0
elseif iiL1Il0==3 then return -1/0
else return 0/0 end
end
local function Ljo0IOiIoj0(iiOoI1iOIIoLL)
if iiOoI1iOIIoLL>200 then jLIj1L1o1l("VM function nesting limit exceeded",0) end
local lLio1i=I11jOi()
local iiL1Il0=I11jOi()
if iiL1Il0>1 then jLIj1L1o1l("VM invalid function flags",0) end
local I1ojjoI=lL0L11iLIljo()
local I010jiiOjLL=jIll11iIILoI0()
local joOO1jLLjoL1={}
for L1L0IIji1oLlOl=1,I010jiiOjLL do local IIijjjOjjLlLI=jIll11iIILoI0() joOO1jLLjoL1[L1L0IIji1oLlOl]={IIijjjOjjLlLI,liLljLlo0OOl()} end
local loiLoOlL=lL0L11iLIljo()
Lj1L0I0oI1(loiLoOlL*12)
local I1i01iOOl={}
for L1L0IIji1oLlOl=1,loiLoOlL do
I1i01iOOl[L1L0IIji1oLlOl]={lL0L11iLIljo(),jIll11iIILoI0(),jIll11iIILoI0(),lL0L11iLIljo()}
end
local jOLOoiI=jIll11iIILoI0()
local jIijoLLI10L={}
for L1L0IIji1oLlOl=1,jOLOoiI do jIijoLLI10L[L1L0IIji1oLlOl]=Ljo0IOiIoj0(iiOoI1iOIIoLL+1) end
local lIl1oOILoIO=jIll11iIILoI0()
local l10iOjOlLI1={}
for L1L0IIji1oLlOl=1,lIl1oOILoIO do l10iOjOlLI1[L1L0IIji1oLlOl]={I11jOi(),jIll11iIILoI0()} end
return {lLio1i,iiL1Il0,I1i01iOOl,joOO1jLLjoL1,jIijoLLI10L,l10iOjOlLI1,{},I1ojjoI}
end
local function j1OjlI1(ilIolLlilL0IjO,lLj1L1jlol0oLI,IIijjjOjjLlLI)
if lLj1L1jlol0oLI[IIijjjOjjLlLI]~=nil then return lLj1L1jlol0oLI[IIijjjOjjLlLI] end
local l1IOOoj=ilIolLlilL0IjO[IIijjjOjjLlLI]
local Iij1LoOILOOoI=l1IOOoj[1]
local li1lIjO=l1IOOoj[2]
local jI1il1Oi1I=(58490+Iij1LoOILOOoI*251+1)%65536
local IiO00L11={}
for i1IiOllO1io=1,#li1lIjO do
jI1il1Oi1I=(jI1il1Oi1I*40503+12345)%65536
IiO00L11[i1IiOllO1io]=Ll0LOIl1oLo1((L0lilIojiolo(li1lIjO,i1IiOllO1io)-io1jIOOoIlLj(jI1il1Oi1I/256)%256-i1IiOllO1io*(58490%256))%256)
end
local II0jLIoIL=IlOj1liO1ooIl(IiO00L11)
if #II0jLIoIL<5 then jLIj1L1o1l("VM invalid constant",0) end
local l1Oiioilo0Lj=L0lilIojiolo(II0jLIoIL,1)
local j0I1jl0I11=L0lilIojiolo(II0jLIoIL,2)+L0lilIojiolo(II0jLIoIL,3)*256+L0lilIojiolo(II0jLIoIL,4)*65536+L0lilIojiolo(II0jLIoIL,5)*16777216
if j0I1jl0I11~=#II0jLIoIL-5 or l1Oiioilo0Lj>4 then jLIj1L1o1l("VM invalid constant",0) end
local ijo1ljloj00=Lo0oILlll(II0jLIoIL,6,5+j0I1jl0I11)
local jljlIIOoli0O
if l1Oiioilo0Lj==0 then jljlIIOoli0O=i0o1Il0j1oi1o0(ijo1ljloj00) elseif l1Oiioilo0Lj==1 then jljlIIOoli0O=ijo1ljloj00 elseif l1Oiioilo0Lj==2 then jljlIIOoli0O=1/0 elseif l1Oiioilo0Lj==3 then jljlIIOoli0O=-1/0 else jljlIIOoli0O=0/0 end
lLj1L1jlol0oLI[IIijjjOjjLlLI]=jljlIIOoli0O
return jljlIIOoli0O
end
local Ij1ojOlol0lL1={}
local l0LLol1Li1LO=jIll11iIILoI0()
for jll1j0ioLIj0=1,l0LLol1Li1LO do local iiL1Il0=jIll11iIILoI0() local I010jiiOjLL=jIll11iIILoI0() Ij1ojOlol0lL1[iiL1Il0]=I010jiiOjLL end
local joOlllIO0=Ljo0IOiIoj0(0)
if jOLOoiI~=#ilooij10j+1 then jLIj1L1o1l("VM trailing payload data",0) end
ilooij10j=nil
Lo1ll00I=nil
local l1IiOOLOOoL
local function lloL0i(joOlllIO0,l10iOjOlLI1)
return function(...) return l1IiOOLOOoL(joOlllIO0,l10iOjOlLI1,Ij100l1oOOjji0(...)) end
end
l1IiOOLOOoL=function(joOlllIO0,l10iOjOlLI1,L1jiL0o11Oj)
local iojll0l0jjoIjI={}
local iLI1j0LIojoo=0
local lLio1i=joOlllIO0[1]
local liL1LjoOiiO0o=L1jiL0o11Oj.n
for iiL1Il0=1,lLio1i do iojll0l0jjoIjI[iiL1Il0-1]=L1jiL0o11Oj[iiL1Il0] end
local IIO1ii1o1i0,IjlLL0l={},0
if joOlllIO0[2]==1 then IjlLL0l=liL1LjoOiiO0o-lLio1i; if IjlLL0l<0 then IjlLL0l=0 end; for iiL1Il0=1,IjlLL0l do IIO1ii1o1i0[iiL1Il0]=L1jiL0o11Oj[lLio1i+iiL1Il0] end end
local I1i01iOOl,joOO1jLLjoL1,jIijoLLI10L=joOlllIO0[3],joOlllIO0[4],joOlllIO0[5]
local lO1OO1Lo=joOlllIO0[7]
local LLiilOoOLjIl=1
local lIl1oOILoIO=0
while true do
local LLIo1j11=I1i01iOOl[LLiilOoOLjIl]
if LLIo1j11==nil then jLIj1L1o1l("VM invalid instruction address",0) end
local IoIIolj00=(joOlllIO0[8]+LLiilOoOLjIl*65599)%4294967296
LLiilOoOLjIl=LLiilOoOLjIl+1
IoIIolj00=(IoIIolj00*1664525+1013904223)%4294967296
local l1i0olIjIO0Ij1=(LLIo1j11[2]-IoIIolj00)%65536
IoIIolj00=(IoIIolj00*1664525+1013904223)%4294967296
local iiL1Il0=(LLIo1j11[3]-IoIIolj00)%65536
IoIIolj00=(IoIIolj00*1664525+1013904223)%4294967296
local I010jiiOjLL=(LLIo1j11[4]-IoIIolj00)%4294967296
IoIIolj00=(IoIIolj00*1664525+1013904223)%4294967296
local L1L0IIji1oLlOl=(LLIo1j11[1]-IoIIolj00)%4294967296
local loiLoOlL=Ij1ojOlol0lL1[l1i0olIjIO0Ij1]
if (loiLoOlL*loiLoOlL)%4==2 then iLI1j0LIojoo=iLI1j0LIojoo+9 end
if loiLoOlL==12 then
iojll0l0jjoIjI[iiL1Il0]=iojll0l0jjoIjI[I010jiiOjLL][1]
elseif loiLoOlL==28 then
iojll0l0jjoIjI[iiL1Il0]=(iojll0l0jjoIjI[I010jiiOjLL]<=iojll0l0jjoIjI[L1L0IIji1oLlOl])
elseif loiLoOlL==30 then
iojll0l0jjoIjI[iiL1Il0]=iojll0l0jjoIjI[I010jiiOjLL][iojll0l0jjoIjI[L1L0IIji1oLlOl]]
elseif loiLoOlL==27 then
joLLj0[j1OjlI1(joOO1jLLjoL1,lO1OO1Lo,I010jiiOjLL+1)]=iojll0l0jjoIjI[iiL1Il0]
elseif loiLoOlL==1 then
iojll0l0jjoIjI[iiL1Il0]=iojll0l0jjoIjI[I010jiiOjLL]
elseif loiLoOlL==20 then
iojll0l0jjoIjI[iiL1Il0]=iojll0l0jjoIjI[I010jiiOjLL]*iojll0l0jjoIjI[L1L0IIji1oLlOl]
elseif loiLoOlL==25 then
iojll0l0jjoIjI[iiL1Il0]=(iojll0l0jjoIjI[I010jiiOjLL]>=iojll0l0jjoIjI[L1L0IIji1oLlOl])
elseif loiLoOlL==9 then
iojll0l0jjoIjI[iiL1Il0]=joLLj0[j1OjlI1(joOO1jLLjoL1,lO1OO1Lo,I010jiiOjLL+1)]
elseif loiLoOlL==33 then
local Iij1LoOILOOoI=iojll0l0jjoIjI[iiL1Il0]
local II0jLIoIL=iojll0l0jjoIjI[iiL1Il0+1]
local l1Oiioilo0Lj=iojll0l0jjoIjI[iiL1Il0+2]
local IiO00L11=Ij100l1oOOjji0(Iij1LoOILOOoI(II0jLIoIL,l1Oiioilo0Lj))
local i1IiOllO1io=IiO00L11[1]
if i1IiOllO1io~=nil then
iojll0l0jjoIjI[iiL1Il0+2]=i1IiOllO1io
for l1IOOoj=1,I010jiiOjLL do iojll0l0jjoIjI[iiL1Il0+3+l1IOOoj-1]=IiO00L11[l1IOOoj] end
LLiilOoOLjIl=L1L0IIji1oLlOl+1
end
elseif loiLoOlL==10 then
iojll0l0jjoIjI[iiL1Il0]=iojll0l0jjoIjI[I010jiiOjLL]+iojll0l0jjoIjI[L1L0IIji1oLlOl]
elseif loiLoOlL==40 then
iojll0l0jjoIjI[iiL1Il0]=(iojll0l0jjoIjI[I010jiiOjLL]~=iojll0l0jjoIjI[L1L0IIji1oLlOl])
elseif loiLoOlL==4 then
iojll0l0jjoIjI[iiL1Il0]=iojll0l0jjoIjI[I010jiiOjLL]^iojll0l0jjoIjI[L1L0IIji1oLlOl]
elseif loiLoOlL==16 then
for l1IOOoj=iiL1Il0,iiL1Il0+2 do
iojll0l0jjoIjI[l1IOOoj]=i0o1Il0j1oi1o0(iojll0l0jjoIjI[l1IOOoj])
if iojll0l0jjoIjI[l1IOOoj]==nil then jLIj1L1o1l("Numeric for bounds and step must be numbers",0) end
end
local Iij1LoOILOOoI=iojll0l0jjoIjI[iiL1Il0+2]
local li1lIjO
if Iij1LoOILOOoI>0 then li1lIjO=iojll0l0jjoIjI[iiL1Il0]<=iojll0l0jjoIjI[iiL1Il0+1] else li1lIjO=iojll0l0jjoIjI[iiL1Il0]>=iojll0l0jjoIjI[iiL1Il0+1] end
if li1lIjO then iojll0l0jjoIjI[iiL1Il0+3]=iojll0l0jjoIjI[iiL1Il0] else LLiilOoOLjIl=I010jiiOjLL+1 end
elseif loiLoOlL==41 then
iojll0l0jjoIjI[iiL1Il0]=(I010jiiOjLL~=0)
elseif loiLoOlL==44 then
iojll0l0jjoIjI[iiL1Il0]=not iojll0l0jjoIjI[I010jiiOjLL]
elseif loiLoOlL==23 then
iojll0l0jjoIjI[iiL1Il0]=(iojll0l0jjoIjI[I010jiiOjLL]==iojll0l0jjoIjI[L1L0IIji1oLlOl])
elseif loiLoOlL==18 then
local Iij1LoOILOOoI=iojll0l0jjoIjI[iiL1Il0]
local li1lIjO
if I010jiiOjLL==0 then li1lIjO=lIl1oOILoIO-iiL1Il0-1 else li1lIjO=I010jiiOjLL-1 end
local jI1il1Oi1I={}
for l1IOOoj=1,li1lIjO do jI1il1Oi1I[l1IOOoj]=iojll0l0jjoIjI[iiL1Il0+l1IOOoj] end
local IiO00L11=Ij100l1oOOjji0(Iij1LoOILOOoI(l0O1jOiL0OLj(jI1il1Oi1I,1,li1lIjO)))
if L1L0IIji1oLlOl==0 then
local i1IiOllO1io=IiO00L11.n
for l1IOOoj=1,i1IiOllO1io do iojll0l0jjoIjI[iiL1Il0+l1IOOoj-1]=IiO00L11[l1IOOoj] end
lIl1oOILoIO=iiL1Il0+i1IiOllO1io
else
for l1IOOoj=1,L1L0IIji1oLlOl-1 do iojll0l0jjoIjI[iiL1Il0+l1IOOoj-1]=IiO00L11[l1IOOoj] end
end
elseif loiLoOlL==19 then
iojll0l0jjoIjI[iiL1Il0]=iojll0l0jjoIjI[I010jiiOjLL]/iojll0l0jjoIjI[L1L0IIji1oLlOl]
elseif loiLoOlL==32 then
iojll0l0jjoIjI[iiL1Il0]=iojll0l0jjoIjI[I010jiiOjLL]%iojll0l0jjoIjI[L1L0IIji1oLlOl]
elseif loiLoOlL==21 then
iojll0l0jjoIjI[iiL1Il0]=iojll0l0jjoIjI[I010jiiOjLL]..iojll0l0jjoIjI[L1L0IIji1oLlOl]
elseif loiLoOlL==3 then
if I010jiiOjLL==0 then
for l1IOOoj=1,IjlLL0l do iojll0l0jjoIjI[iiL1Il0+l1IOOoj-1]=IIO1ii1o1i0[l1IOOoj] end
lIl1oOILoIO=iiL1Il0+IjlLL0l
else
for l1IOOoj=1,I010jiiOjLL-1 do iojll0l0jjoIjI[iiL1Il0+l1IOOoj-1]=IIO1ii1o1i0[l1IOOoj] end
end
elseif loiLoOlL==31 then
iojll0l0jjoIjI[iiL1Il0]=l10iOjOlLI1[I010jiiOjLL+1][1]
elseif loiLoOlL==38 then
for l1IOOoj=iiL1Il0,iiL1Il0+I010jiiOjLL do iojll0l0jjoIjI[l1IOOoj]=nil end
elseif loiLoOlL==5 then
local li1lIjO
if I010jiiOjLL==0 then li1lIjO=lIl1oOILoIO-iiL1Il0-1 else li1lIjO=I010jiiOjLL end
local Iij1LoOILOOoI=iojll0l0jjoIjI[iiL1Il0]
for l1IOOoj=1,li1lIjO do Iij1LoOILOOoI[L1L0IIji1oLlOl+l1IOOoj]=iojll0l0jjoIjI[iiL1Il0+l1IOOoj] end
elseif loiLoOlL==6 then
iojll0l0jjoIjI[iiL1Il0]=(iojll0l0jjoIjI[I010jiiOjLL]>iojll0l0jjoIjI[L1L0IIji1oLlOl])
elseif loiLoOlL==22 then
if (not not iojll0l0jjoIjI[iiL1Il0])==(I010jiiOjLL~=0) then LLiilOoOLjIl=L1L0IIji1oLlOl+1 end
elseif loiLoOlL==15 then
local Iij1LoOILOOoI=jIijoLLI10L[I010jiiOjLL+1]
local jI1il1Oi1I={}
local IiO00L11=Iij1LoOILOOoI[6]
for l1IOOoj=1,#IiO00L11 do
local i1IiOllO1io=IiO00L11[l1IOOoj]
if i1IiOllO1io[1]==1 then jI1il1Oi1I[l1IOOoj]=iojll0l0jjoIjI[i1IiOllO1io[2]] else jI1il1Oi1I[l1IOOoj]=l10iOjOlLI1[i1IiOllO1io[2]+1] end
end
iojll0l0jjoIjI[iiL1Il0]=lloL0i(Iij1LoOILOOoI,jI1il1Oi1I)
elseif loiLoOlL==2 then
iojll0l0jjoIjI[iiL1Il0]=#iojll0l0jjoIjI[I010jiiOjLL]
elseif loiLoOlL==14 then
iojll0l0jjoIjI[iiL1Il0]={}
elseif loiLoOlL==43 then
iojll0l0jjoIjI[iiL1Il0]=-iojll0l0jjoIjI[I010jiiOjLL]
elseif loiLoOlL==17 then
iojll0l0jjoIjI[iiL1Il0+1]=iojll0l0jjoIjI[I010jiiOjLL]; iojll0l0jjoIjI[iiL1Il0]=iojll0l0jjoIjI[I010jiiOjLL][iojll0l0jjoIjI[L1L0IIji1oLlOl]]
elseif loiLoOlL==13 then
iojll0l0jjoIjI[iiL1Il0]=j1OjlI1(joOO1jLLjoL1,lO1OO1Lo,I010jiiOjLL+1)
elseif loiLoOlL==39 then
iojll0l0jjoIjI[I010jiiOjLL][1]=iojll0l0jjoIjI[iiL1Il0]
elseif loiLoOlL==24 then
iojll0l0jjoIjI[iiL1Il0]=iojll0l0jjoIjI[I010jiiOjLL]-iojll0l0jjoIjI[L1L0IIji1oLlOl]
elseif loiLoOlL==26 then
LLiilOoOLjIl=I010jiiOjLL+1
elseif loiLoOlL==36 then
iLI1j0LIojoo=(iLI1j0LIojoo+I010jiiOjLL)%(L1L0IIji1oLlOl+1)
elseif loiLoOlL==37 then
iojll0l0jjoIjI[iiL1Il0]=iojll0l0jjoIjI[iiL1Il0]+iojll0l0jjoIjI[iiL1Il0+2]
local Iij1LoOILOOoI=iojll0l0jjoIjI[iiL1Il0+2]
local li1lIjO
if Iij1LoOILOOoI>0 then li1lIjO=iojll0l0jjoIjI[iiL1Il0]<=iojll0l0jjoIjI[iiL1Il0+1] else li1lIjO=iojll0l0jjoIjI[iiL1Il0]>=iojll0l0jjoIjI[iiL1Il0+1] end
if li1lIjO then iojll0l0jjoIjI[iiL1Il0+3]=iojll0l0jjoIjI[iiL1Il0]; LLiilOoOLjIl=I010jiiOjLL+1 end
elseif loiLoOlL==8 then
l10iOjOlLI1[I010jiiOjLL+1][1]=iojll0l0jjoIjI[iiL1Il0]
elseif loiLoOlL==29 then
iojll0l0jjoIjI[iiL1Il0][iojll0l0jjoIjI[I010jiiOjLL]]=iojll0l0jjoIjI[L1L0IIji1oLlOl]
elseif loiLoOlL==35 then
iojll0l0jjoIjI[iiL1Il0]=(iojll0l0jjoIjI[I010jiiOjLL]<iojll0l0jjoIjI[L1L0IIji1oLlOl])
elseif loiLoOlL==11 then
local l1IOOoj=iojll0l0jjoIjI[iiL1Il0]
if i1LIjjLiij0(l1IOOoj)~=iILi1lO then
local Iij1LoOILOOoI=ILI1OOjO0oj(l1IOOoj)
if Iij1LoOILOOoI~=nil and i1LIjjLiij0(Iij1LoOILOOoI)~=LOloLlo1jj then jLIj1L1o1l("Protected iterator metatables require an explicit iterator function",0) end
local li1lIjO=Iij1LoOILOOoI and L1lLll1iIj1jlO(Iij1LoOILOOoI,IoLO1jjoL1Oj)
if li1lIjO~=nil then
iojll0l0jjoIjI[iiL1Il0],iojll0l0jjoIjI[iiL1Il0+1],iojll0l0jjoIjI[iiL1Il0+2]=li1lIjO(l1IOOoj)
elseif i1LIjjLiij0(l1IOOoj)==LOloLlo1jj and (Iij1LoOILOOoI==nil or L1lLll1iIj1jlO(Iij1LoOILOOoI,Ill0ojlollL0)==nil) then
iojll0l0jjoIjI[iiL1Il0],iojll0l0jjoIjI[iiL1Il0+1],iojll0l0jjoIjI[iiL1Il0+2]=jjjioL,l1IOOoj,nil
end
end
elseif loiLoOlL==7 then
local li1lIjO
if I010jiiOjLL==0 then li1lIjO=lIl1oOILoIO-iiL1Il0 else li1lIjO=I010jiiOjLL-1 end
local jI1il1Oi1I={}
for l1IOOoj=1,li1lIjO do jI1il1Oi1I[l1IOOoj]=iojll0l0jjoIjI[iiL1Il0+l1IOOoj-1] end
return l0O1jOiL0OLj(jI1il1Oi1I,1,li1lIjO)
elseif loiLoOlL==34 then
iojll0l0jjoIjI[iiL1Il0]={iojll0l0jjoIjI[I010jiiOjLL]}
elseif loiLoOlL==42 then
iojll0l0jjoIjI[iiL1Il0]=iojll0l0jjoIjI[I010jiiOjLL]//iojll0l0jjoIjI[L1L0IIji1oLlOl]
else jLIj1L1o1l() end
end
return iLI1j0LIojoo
end
return l1IiOOLOOoL(joOlllIO0,{},Ij100l1oOOjji0(...))
