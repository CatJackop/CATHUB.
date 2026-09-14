-- hide.lat / lite / 870c0102e0d6
local ioLjl1OL1I10=(getfenv and getfenv(1)) or _ENV or _G
local loi0IlOj1II,lj0jl01Ojo=string.byte,string.char
local function IoOijoL(jo1oil1loIO1,Lilil1OI01III0)
local IoOLojLlI=""
local l1jLl00=#Lilil1OI01III0
for j01Lii0LLlO1o0=1,#jo1oil1loIO1 do IoOLojLlI=IoOLojLlI..lj0jl01Ojo((loi0IlOj1II(jo1oil1loIO1,j01Lii0LLlO1o0)-loi0IlOj1II(Lilil1OI01III0,(j01Lii0LLlO1o0-1)%l1jLl00+1))%256) end
return IoOLojLlI
end
local Iillo0jo=ioLjl1OL1I10[IoOijoL("('\207\128\011\026","\181\194c\027\168\166F")]
local jl00jlLoLojO1=ioLjl1OL1I10[IoOijoL("\198\"\186H\193\021","S\174H\223")][IoOijoL("\009}\171","\150\008I")]
local i0Oi0iI1Oi1lL=ioLjl1OL1I10[IoOijoL("\129\000(5\237","\r\159\198\201\136@")][IoOijoL("\190)Y\246\246\207","[\186\235\147\149[\151")]
local L1O0iO10L=ioLjl1OL1I10[IoOijoL("\179q\151\174","F\016#")][IoOijoL("0\237n9\243","\202\129\255")]
local lojo0Lo1ijOio=ioLjl1OL1I10[IoOijoL("h\244\189\131a\231\180\128","\244\133O\014")]
local Ljl0I1IL=ioLjl1OL1I10[IoOijoL("p\2552\240K","\011\141\192\129\217Z")]
local l0lj01ol0Iolo=Iillo0jo("#",0,0,0)*11+lojo0Lo1ijOio("7523")*1+loi0IlOj1II("l")+(lj0jl01Ojo(81,80)=="QP" and 2837 or 42)
local Loill0=ioLjl1OL1I10[IoOijoL("\197\137\031g\167","Q(\189\251B")][IoOijoL("y\031\004\226","\009\190\161w\237")] or function(...) return {n=Iillo0jo("#",...),...} end
local jl0Oll=ioLjl1OL1I10[IoOijoL("\002~\1748\150","\142\029L\2041dn")][IoOijoL("\241\169\167\148\216\180","|;73uI\021")] or ioLjl1OL1I10[IoOijoL("\151\173\135\131\162\130","\"?\023")]
local iILLOoLlIijOo="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function Lo11oi0jiIOL(j1LiOOo)
local ijIjjLOIL00={}
for jOOILllo=1,64 do ijIjjLOIL00[loi0IlOj1II(iILLOoLlIijOo,jOOILllo)]=jOOILllo-1 end
local jLi0oj,lIi1jI,j1OIO1ILiO,L1oij0lIji1l={},0,0,0
for jOOILllo=1,#j1LiOOo do
local Ll1lIIioOiIOL1=ijIjjLOIL00[loi0IlOj1II(j1LiOOo,jOOILllo)]
if Ll1lIIioOiIOL1 then
lIi1jI=lIi1jI*64+Ll1lIIioOiIOL1
j1OIO1ILiO=j1OIO1ILiO+6
if j1OIO1ILiO>=8 then j1OIO1ILiO=j1OIO1ILiO-8 L1oij0lIji1l=L1oij0lIji1l+1 jLi0oj[L1oij0lIji1l]=lj0jl01Ojo(L1O0iO10L(lIi1jI/(2^j1OIO1ILiO))%256) lIi1jI=lIi1jI%(2^j1OIO1ILiO) end
end
end
return i0Oi0iI1Oi1lL(jLi0oj)
end
local iiIOLO="3vV7dhJHlGHwsNiKl6kQLgxQm5+Nku1hYgljyUCCw1fWzjuU0Zyjo48Nedf/xipvUCpDhkQ5ECf33BPEmMxGKvFxckMmQNoMHpCEZ2bLoVJqnphOnWA3zqh7BkqWrG58z03GQTUJNicqoypHIUsV6f0draE8oYQOdGsrPxqcarB0nu+hN5qJBrIg6TToRHBAHny+fxsa8p6r5Qz76mkNJ0jw4gy8ZVu44rrcnkX+zc4Fq+Kac4DUB6KwmwPxuAxnGP3UjR9sZOUFJNOnsp7VoIGWrdrVckyOiji8aafoNCAOr8M/EqUJAMkABO6SSxxlEkBcp2KzHCmcpntKqkaUzNTYDsPSD5a6q3rK2O5VCf8/e7g0GKH3rZCqgCac/ZjlpFLqwiZZsPISAl8ZUsmfy1eb97MfWvgSywPFWzAxx8Ce4Y1Miov+XkFWv42rnSAxBGsHtrgMQQEo60pPb+G3OFyT1+NLGZUpK2t7cm1TupobhViFD5svZvvBuudLN04g59nblPxbMBVuNWU6qx5B01jUDRZFf4k73b7SPIgpaG2BUSPTwl9ImPBpf0AP2DrjUm4RTYKegEsg/8gwhUG/HOgCc2Of9qo1KmlUxdI1ma8viVSFMaVhv/gERWmJHLvMcVHAn8geP7FLM+gk+2qr+jsJb+1K/Hc28L3Pz/f3KZe5FZjc06X2n/dVDC9QtV6q9y210804hPEHbc53zkIsJc0aIat4aum0fPZBlRojWmQVX40Zp2cAw6sXjqtlQFA7wAMAjxGJn481dhtM0JpC13sI5m+aLba9SnGWunp0RuuUcFjWg9rYm4Jmv6z1//Wn1HK1jXKofn/Vl8rpCbUXXZiFXHstBYgcr3Ns8hO1C4wKZOt/7AFsq3C1v61JGBHuv3o4y10KWgcolAu/XupkNNFUKtizFIqaZop7yEYcXwd6BV1YyqnnJnX9+lZ8iKMrVpl1wZVd46JJH3/xtdQP4StbEIpOD26NRx70w+UzE0qdAXiGgW5Gdvmo7Dz8MxrX9u/YIBsC67486oLDTdaSjgZR1sFWzvCJgAdEQwRakAdidsLtch160ndCxYspjfWhMpnIKYzgwurdfMlPinWsE9WZK6nKt5iywQAYp175LLXiLvOwp+/eZ6nN1tRiMfM8E71cMUJJaSiZfRSi3DFtp+Ywvz0J6+Due5tfTlmxEE4="
local function i1jlIo(i10ioOloIiLiji)
local Iio1I1j1iol=(3130359471)+l0lj01ol0Iolo
local Ijo0III=125
local LOo1oL1i={}
for I0Lj0L10j0LI=1,#i10ioOloIiLiji do
Iio1I1j1iol=(Iio1I1j1iol*58373+3414847975)%4294967296
local jLO0LiljL=loi0IlOj1II(i10ioOloIiLiji,I0Lj0L10j0LI)
local i0OLjOLio=(L1O0iO10L(Iio1I1j1iol/65536)+Ijo0III+(I0Lj0L10j0LI-1)*134)%256
LOo1oL1i[I0Lj0L10j0LI]=lj0jl01Ojo((jLO0LiljL-i0OLjOLio)%256)
Ijo0III=(Ijo0III*53+jLO0LiljL+1)%251
end
return i0Oi0iI1Oi1lL(LOo1oL1i)
end
local I10oojo=i1jlIo(Lo11oi0jiIOL(iiIOLO))
local jLO0LiljL=1
local function liio1IoL0iIl()
local I0Lj0L10j0LI=loi0IlOj1II(I10oojo,jLO0LiljL)
jLO0LiljL=jLO0LiljL+1
return I0Lj0L10j0LI
end
local function j1iiLO()
local I0Lj0L10j0LI,jolOIjlojOli=loi0IlOj1II(I10oojo,jLO0LiljL,jLO0LiljL+1)
jLO0LiljL=jLO0LiljL+2
return I0Lj0L10j0LI+jolOIjlojOli*256
end
local function iOLoIjo1Oo()
local I0Lj0L10j0LI,jolOIjlojOli,i10ioOloIiLiji,LOo1oL1i=loi0IlOj1II(I10oojo,jLO0LiljL,jLO0LiljL+3)
jLO0LiljL=jLO0LiljL+4
return I0Lj0L10j0LI+jolOIjlojOli*256+i10ioOloIiLiji*65536+LOo1oL1i*16777216
end
local function lIL0oLlII()
local I0Lj0L10j0LI=iOLoIjo1Oo()
local jolOIjlojOli=jl00jlLoLojO1(I10oojo,jLO0LiljL,jLO0LiljL+I0Lj0L10j0LI-1)
jLO0LiljL=jLO0LiljL+I0Lj0L10j0LI
return jolOIjlojOli
end
local function lLOjOoo10o()
local I0Lj0L10j0LI=liio1IoL0iIl()
local jolOIjlojOli=lIL0oLlII()
if I0Lj0L10j0LI==0 then return lojo0Lo1ijOio(jolOIjlojOli)
elseif I0Lj0L10j0LI==1 then return jolOIjlojOli
elseif I0Lj0L10j0LI==2 then return 1/0
elseif I0Lj0L10j0LI==3 then return -1/0
else return 0/0 end
end
local function ji1Ll1O()
local IOlIIol0OoIiOi=liio1IoL0iIl()
local I0Lj0L10j0LI=liio1IoL0iIl()
local jolOIjlojOli=j1iiLO()
local LlllL00iO0Oil={}
for i10ioOloIiLiji=1,jolOIjlojOli do local lI00Ijl=j1iiLO() LlllL00iO0Oil[i10ioOloIiLiji]={lI00Ijl,lIL0oLlII()} end
local LOo1oL1i=iOLoIjo1Oo()
local I1ILiLi={}
for i10ioOloIiLiji=1,LOo1oL1i do
I1ILiLi[i10ioOloIiLiji]={j1iiLO(),j1iiLO(),iOLoIjo1Oo(),iOLoIjo1Oo()}
end
local jLO0LiljL=j1iiLO()
local L1l0LjoOOIO0L={}
for i10ioOloIiLiji=1,jLO0LiljL do L1l0LjoOOIO0L[i10ioOloIiLiji]=ji1Ll1O() end
local IiILO1IOIjoIOl=j1iiLO()
local LL0oIiOIO={}
for i10ioOloIiLiji=1,IiILO1IOIjoIOl do LL0oIiOIO[i10ioOloIiLiji]={liio1IoL0iIl(),j1iiLO()} end
return {IOlIIol0OoIiOi,I0Lj0L10j0LI,I1ILiLi,LlllL00iO0Oil,L1l0LjoOOIO0L,LL0oIiOIO,{}}
end
local function jLjo0LILj1o(LiIooj1,lOOI1o1joo11lO,lI00Ijl)
if lOOI1o1joo11lO[lI00Ijl]~=nil then return lOOI1o1joo11lO[lI00Ijl] end
local j1LiOOo=LiIooj1[lI00Ijl]
local ijIjjLOIL00=j1LiOOo[1]
local jOOILllo=j1LiOOo[2]
local jLi0oj=(19120+ijIjjLOIL00*251+1)%65536
local lIi1jI={}
for j1OIO1ILiO=1,#jOOILllo do
jLi0oj=(jLi0oj*40503+12345)%65536
lIi1jI[j1OIO1ILiO]=lj0jl01Ojo((loi0IlOj1II(jOOILllo,j1OIO1ILiO)-L1O0iO10L(jLi0oj/256)%256-j1OIO1ILiO*(19120%256))%256)
end
local L1oij0lIji1l=i0Oi0iI1Oi1lL(lIi1jI)
local Ll1lIIioOiIOL1=loi0IlOj1II(L1oij0lIji1l,1)
local loLiOi0L=loi0IlOj1II(L1oij0lIji1l,2)+loi0IlOj1II(L1oij0lIji1l,3)*256+loi0IlOj1II(L1oij0lIji1l,4)*65536+loi0IlOj1II(L1oij0lIji1l,5)*16777216
local IOIlLoIilIO=jl00jlLoLojO1(L1oij0lIji1l,6,5+loLiOi0L)
local LooIIOolLIlIIL
if Ll1lIIioOiIOL1==0 then LooIIOolLIlIIL=lojo0Lo1ijOio(IOIlLoIilIO) elseif Ll1lIIioOiIOL1==1 then LooIIOolLIlIIL=IOIlLoIilIO elseif Ll1lIIioOiIOL1==2 then LooIIOolLIlIIL=1/0 elseif Ll1lIIioOiIOL1==3 then LooIIOolLIlIIL=-1/0 else LooIIOolLIlIIL=0/0 end
lOOI1o1joo11lO[lI00Ijl]=LooIIOolLIlIIL
return LooIIOolLIlIIL
end
local L1oj0j000l1L={}
local LoOjllI=j1iiLO()
for ljOOo0jl=1,LoOjllI do local I0Lj0L10j0LI=j1iiLO() local jolOIjlojOli=j1iiLO() L1oj0j000l1L[I0Lj0L10j0LI]=jolOIjlojOli end
local LLOojl=ji1Ll1O()
local I0LlOliiOI
local function iolooOi0OLiiO(LLOojl,LL0oIiOIO)
return function(...) return I0LlOliiOI(LLOojl,LL0oIiOIO,Loill0(...)) end
end
I0LlOliiOI=function(LLOojl,LL0oIiOIO,LL0OOjiiIOj)
local LLilL1LLiOj={}
local IOljLo0I1i10j=0
local IOlIIol0OoIiOi=LLOojl[1]
local li10jOLliL=LL0OOjiiIOj.n
for I0Lj0L10j0LI=1,IOlIIol0OoIiOi do LLilL1LLiOj[I0Lj0L10j0LI-1]=LL0OOjiiIOj[I0Lj0L10j0LI] end
local jlj1iL,ILjLlOojOlI1l={},0
if LLOojl[2]==1 then ILjLlOojOlI1l=li10jOLliL-IOlIIol0OoIiOi; if ILjLlOojOlI1l<0 then ILjLlOojOlI1l=0 end; for I0Lj0L10j0LI=1,ILjLlOojOlI1l do jlj1iL[I0Lj0L10j0LI]=LL0OOjiiIOj[IOlIIol0OoIiOi+I0Lj0L10j0LI] end end
local I1ILiLi,LlllL00iO0Oil,L1l0LjoOOIO0L=LLOojl[3],LLOojl[4],LLOojl[5]
local iL0iLIO=LLOojl[7]
local IjlI0llIOoO=1
local IiILO1IOIjoIOl=0
while true do
local j0llilljlliIO=I1ILiLi[IjlI0llIOoO]
IjlI0llIOoO=IjlI0llIOoO+1
local L0LlIL0loi,I0Lj0L10j0LI,jolOIjlojOli,i10ioOloIiLiji=j0llilljlliIO[1],j0llilljlliIO[2],j0llilljlliIO[3],j0llilljlliIO[4]
local LOo1oL1i=L1oj0j000l1L[L0LlIL0loi]
if (IjlI0llIOoO*IjlI0llIOoO+IjlI0llIOoO)%2~=0 then IOljLo0I1i10j=IOljLo0I1i10j+7 end
if (IjlI0llIOoO*IjlI0llIOoO*IjlI0llIOoO-IjlI0llIOoO)%6~=0 then IOljLo0I1i10j=IOljLo0I1i10j+1 end
if LOo1oL1i==17 then
LLilL1LLiOj[I0Lj0L10j0LI]=(LLilL1LLiOj[jolOIjlojOli]~=LLilL1LLiOj[i10ioOloIiLiji])
elseif LOo1oL1i==34 then
LLilL1LLiOj[I0Lj0L10j0LI]={}
elseif LOo1oL1i==36 then
LLilL1LLiOj[I0Lj0L10j0LI]=LLilL1LLiOj[jolOIjlojOli]..LLilL1LLiOj[i10ioOloIiLiji]
elseif LOo1oL1i==26 then
if (not not LLilL1LLiOj[I0Lj0L10j0LI])==(jolOIjlojOli~=0) then IjlI0llIOoO=i10ioOloIiLiji+1 end
elseif LOo1oL1i==9 then
LLilL1LLiOj[I0Lj0L10j0LI]=not LLilL1LLiOj[jolOIjlojOli]
elseif LOo1oL1i==39 then
LLilL1LLiOj[I0Lj0L10j0LI]=LLilL1LLiOj[I0Lj0L10j0LI]-LLilL1LLiOj[I0Lj0L10j0LI+2]; IjlI0llIOoO=jolOIjlojOli+1
elseif LOo1oL1i==15 then
LLilL1LLiOj[I0Lj0L10j0LI]=LLilL1LLiOj[jolOIjlojOli][LLilL1LLiOj[i10ioOloIiLiji]]
elseif LOo1oL1i==5 then
IjlI0llIOoO=jolOIjlojOli+1
elseif LOo1oL1i==6 then
local jOOILllo
if jolOIjlojOli==0 then jOOILllo=IiILO1IOIjoIOl-I0Lj0L10j0LI-1 else jOOILllo=jolOIjlojOli end
local ijIjjLOIL00=LLilL1LLiOj[I0Lj0L10j0LI]
for j1LiOOo=1,jOOILllo do ijIjjLOIL00[i10ioOloIiLiji+j1LiOOo]=LLilL1LLiOj[I0Lj0L10j0LI+j1LiOOo] end
elseif LOo1oL1i==31 then
LLilL1LLiOj[I0Lj0L10j0LI]=LLilL1LLiOj[jolOIjlojOli]+LLilL1LLiOj[i10ioOloIiLiji]
elseif LOo1oL1i==41 then
LL0oIiOIO[jolOIjlojOli+1][1]=LLilL1LLiOj[I0Lj0L10j0LI]
elseif LOo1oL1i==40 then
LLilL1LLiOj[jolOIjlojOli][1]=LLilL1LLiOj[I0Lj0L10j0LI]
elseif LOo1oL1i==20 then
LLilL1LLiOj[I0Lj0L10j0LI]=jLjo0LILj1o(LlllL00iO0Oil,iL0iLIO,jolOIjlojOli+1)
elseif LOo1oL1i==12 then
LLilL1LLiOj[I0Lj0L10j0LI]=LLilL1LLiOj[jolOIjlojOli]-LLilL1LLiOj[i10ioOloIiLiji]
elseif LOo1oL1i==19 then
LLilL1LLiOj[I0Lj0L10j0LI]=LLilL1LLiOj[jolOIjlojOli]*LLilL1LLiOj[i10ioOloIiLiji]
elseif LOo1oL1i==1 then
LLilL1LLiOj[I0Lj0L10j0LI]=(LLilL1LLiOj[jolOIjlojOli]==LLilL1LLiOj[i10ioOloIiLiji])
elseif LOo1oL1i==14 then
LLilL1LLiOj[I0Lj0L10j0LI]=-LLilL1LLiOj[jolOIjlojOli]
elseif LOo1oL1i==28 then
LLilL1LLiOj[I0Lj0L10j0LI+1]=LLilL1LLiOj[jolOIjlojOli]; LLilL1LLiOj[I0Lj0L10j0LI]=LLilL1LLiOj[jolOIjlojOli][LLilL1LLiOj[i10ioOloIiLiji]]
elseif LOo1oL1i==32 then
LLilL1LLiOj[I0Lj0L10j0LI]=LLilL1LLiOj[jolOIjlojOli]
elseif LOo1oL1i==4 then
LLilL1LLiOj[I0Lj0L10j0LI]=(LLilL1LLiOj[jolOIjlojOli]>LLilL1LLiOj[i10ioOloIiLiji])
elseif LOo1oL1i==30 then
local ijIjjLOIL00=L1l0LjoOOIO0L[jolOIjlojOli+1]
local jLi0oj={}
local lIi1jI=ijIjjLOIL00[6]
for j1LiOOo=1,#lIi1jI do
local j1OIO1ILiO=lIi1jI[j1LiOOo]
if j1OIO1ILiO[1]==1 then jLi0oj[j1LiOOo]=LLilL1LLiOj[j1OIO1ILiO[2]] else jLi0oj[j1LiOOo]=LL0oIiOIO[j1OIO1ILiO[2]+1] end
end
LLilL1LLiOj[I0Lj0L10j0LI]=iolooOi0OLiiO(ijIjjLOIL00,jLi0oj)
elseif LOo1oL1i==29 then
for j1LiOOo=I0Lj0L10j0LI,I0Lj0L10j0LI+jolOIjlojOli do LLilL1LLiOj[j1LiOOo]=nil end
elseif LOo1oL1i==21 then
ioLjl1OL1I10[jLjo0LILj1o(LlllL00iO0Oil,iL0iLIO,jolOIjlojOli+1)]=LLilL1LLiOj[I0Lj0L10j0LI]
elseif LOo1oL1i==8 then
local ijIjjLOIL00=LLilL1LLiOj[I0Lj0L10j0LI]
local L1oij0lIji1l=LLilL1LLiOj[I0Lj0L10j0LI+1]
local Ll1lIIioOiIOL1=LLilL1LLiOj[I0Lj0L10j0LI+2]
local lIi1jI=Loill0(ijIjjLOIL00(L1oij0lIji1l,Ll1lIIioOiIOL1))
local j1OIO1ILiO=lIi1jI[1]
if j1OIO1ILiO~=nil then
LLilL1LLiOj[I0Lj0L10j0LI+2]=j1OIO1ILiO
for j1LiOOo=1,jolOIjlojOli do LLilL1LLiOj[I0Lj0L10j0LI+3+j1LiOOo-1]=lIi1jI[j1LiOOo] end
IjlI0llIOoO=i10ioOloIiLiji+1
end
elseif LOo1oL1i==42 then
LLilL1LLiOj[I0Lj0L10j0LI]={LLilL1LLiOj[jolOIjlojOli]}
elseif LOo1oL1i==33 then
LLilL1LLiOj[I0Lj0L10j0LI]=LLilL1LLiOj[jolOIjlojOli]^LLilL1LLiOj[i10ioOloIiLiji]
elseif LOo1oL1i==22 then
LLilL1LLiOj[I0Lj0L10j0LI]=#LLilL1LLiOj[jolOIjlojOli]
elseif LOo1oL1i==37 then
LLilL1LLiOj[I0Lj0L10j0LI]=LLilL1LLiOj[jolOIjlojOli][1]
elseif LOo1oL1i==25 then
LLilL1LLiOj[I0Lj0L10j0LI]=LLilL1LLiOj[jolOIjlojOli]/LLilL1LLiOj[i10ioOloIiLiji]
elseif LOo1oL1i==13 then
if jolOIjlojOli==0 then
for j1LiOOo=1,ILjLlOojOlI1l do LLilL1LLiOj[I0Lj0L10j0LI+j1LiOOo-1]=jlj1iL[j1LiOOo] end
IiILO1IOIjoIOl=I0Lj0L10j0LI+ILjLlOojOlI1l
else
for j1LiOOo=1,jolOIjlojOli-1 do LLilL1LLiOj[I0Lj0L10j0LI+j1LiOOo-1]=jlj1iL[j1LiOOo] end
end
elseif LOo1oL1i==23 then
LLilL1LLiOj[I0Lj0L10j0LI][LLilL1LLiOj[jolOIjlojOli]]=LLilL1LLiOj[i10ioOloIiLiji]
elseif LOo1oL1i==2 then
LLilL1LLiOj[I0Lj0L10j0LI]=LLilL1LLiOj[I0Lj0L10j0LI]+LLilL1LLiOj[I0Lj0L10j0LI+2]
local ijIjjLOIL00=LLilL1LLiOj[I0Lj0L10j0LI+2]
if (ijIjjLOIL00>0 and LLilL1LLiOj[I0Lj0L10j0LI]<=LLilL1LLiOj[I0Lj0L10j0LI+1]) or (ijIjjLOIL00<=0 and LLilL1LLiOj[I0Lj0L10j0LI]>=LLilL1LLiOj[I0Lj0L10j0LI+1]) then LLilL1LLiOj[I0Lj0L10j0LI+3]=LLilL1LLiOj[I0Lj0L10j0LI]; IjlI0llIOoO=jolOIjlojOli+1 end
elseif LOo1oL1i==18 then
LLilL1LLiOj[I0Lj0L10j0LI]=(LLilL1LLiOj[jolOIjlojOli]>=LLilL1LLiOj[i10ioOloIiLiji])
elseif LOo1oL1i==38 then
local ijIjjLOIL00=LLilL1LLiOj[I0Lj0L10j0LI]
local jOOILllo
if jolOIjlojOli==0 then jOOILllo=IiILO1IOIjoIOl-I0Lj0L10j0LI-1 else jOOILllo=jolOIjlojOli-1 end
local jLi0oj={}
for j1LiOOo=1,jOOILllo do jLi0oj[j1LiOOo]=LLilL1LLiOj[I0Lj0L10j0LI+j1LiOOo] end
local lIi1jI=Loill0(ijIjjLOIL00(jl0Oll(jLi0oj,1,jOOILllo)))
if i10ioOloIiLiji==0 then
local j1OIO1ILiO=lIi1jI.n
for j1LiOOo=1,j1OIO1ILiO do LLilL1LLiOj[I0Lj0L10j0LI+j1LiOOo-1]=lIi1jI[j1LiOOo] end
IiILO1IOIjoIOl=I0Lj0L10j0LI+j1OIO1ILiO
else
for j1LiOOo=1,i10ioOloIiLiji-1 do LLilL1LLiOj[I0Lj0L10j0LI+j1LiOOo-1]=lIi1jI[j1LiOOo] end
end
elseif LOo1oL1i==16 then
LLilL1LLiOj[I0Lj0L10j0LI]=(LLilL1LLiOj[jolOIjlojOli]-LLilL1LLiOj[jolOIjlojOli]%LLilL1LLiOj[i10ioOloIiLiji])/LLilL1LLiOj[i10ioOloIiLiji]
elseif LOo1oL1i==27 then
LLilL1LLiOj[I0Lj0L10j0LI]=((LLilL1LLiOj[I0Lj0L10j0LI] or 0)+jolOIjlojOli)%(i10ioOloIiLiji+1)
elseif LOo1oL1i==43 then
local jOOILllo
if jolOIjlojOli==0 then jOOILllo=IiILO1IOIjoIOl-I0Lj0L10j0LI else jOOILllo=jolOIjlojOli-1 end
local jLi0oj={}
for j1LiOOo=1,jOOILllo do jLi0oj[j1LiOOo]=LLilL1LLiOj[I0Lj0L10j0LI+j1LiOOo-1] end
return jl0Oll(jLi0oj,1,jOOILllo)
elseif LOo1oL1i==35 then
LLilL1LLiOj[I0Lj0L10j0LI]=LLilL1LLiOj[jolOIjlojOli]%LLilL1LLiOj[i10ioOloIiLiji]
elseif LOo1oL1i==10 then
LLilL1LLiOj[I0Lj0L10j0LI]=(LLilL1LLiOj[jolOIjlojOli]<=LLilL1LLiOj[i10ioOloIiLiji])
elseif LOo1oL1i==24 then
LLilL1LLiOj[I0Lj0L10j0LI]=(jolOIjlojOli~=0)
elseif LOo1oL1i==11 then
LLilL1LLiOj[I0Lj0L10j0LI]=LL0oIiOIO[jolOIjlojOli+1][1]
elseif LOo1oL1i==7 then
LLilL1LLiOj[I0Lj0L10j0LI]=ioLjl1OL1I10[jLjo0LILj1o(LlllL00iO0Oil,iL0iLIO,jolOIjlojOli+1)]
elseif LOo1oL1i==3 then
LLilL1LLiOj[I0Lj0L10j0LI]=(LLilL1LLiOj[jolOIjlojOli]<LLilL1LLiOj[i10ioOloIiLiji])
else Ljl0I1IL() end
end
return IOljLo0I1i10j
end
return I0LlOliiOI(LLOojl,{},Loill0(...))
