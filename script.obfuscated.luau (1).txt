-- hide.lat / lite / 5e10735ddf05
local lj00ljj=(getfenv and getfenv(1)) or _ENV or _G
local IOilj0I1ljOiOL,iiOlOIjOLi0O=string.byte,string.char
local function IiLooIl011(IjloIL,LIOiL00LOOLlj)
local ll0l0ji=""
local ioi0j0O0IO=#LIOiL00LOOLlj
for joIijOiiol0=1,#IjloIL do ll0l0ji=ll0l0ji..iiOlOIjOLi0O((IOilj0I1ljOiOL(IjloIL,joIijOiiol0)-IOilj0I1ljOiOL(LIOiL00LOOLlj,(joIijOiiol0-1)%ioi0j0O0IO+1))%256) end
return ll0l0ji
end
local lj1il1lOjL0o=lj00ljj[IiLooIl011("\131\001\154\030s\016","\016\156.\185")]
local lloOjj0LLl01O=lj00ljj[IiLooIl011("\234\134F\224\128;","w\018\212")][IiLooIl011("dw\227","\241\002\129\145\152")]
local iLj1L01=lj00ljj[IiLooIl011("Y^\017H\015","\229\253\175\220\170\250")][IiLooIl011("\151\251<\189\236=","4\140\206Z\139\201")]
local iIOOOo=lj00ljj[IiLooIl011("\239\031\002Z","\130\190\142\242!")][IiLooIl011("\223\210\172\228\254","yf=u\140G\019")]
local IOoojoI0Ii1iO=lj00ljj[IiLooIl011("oI\183\222i\026`L","\251\218Ii\252\184")]
local LjlLL1LlLl=lj00ljj[IiLooIl011("\184m\004\239\195","S\251\146\128QJ")]
local jIojilooIioOj=lj1il1lOjL0o("#",0,0)*20+IOilj0I1ljOiOL("c")+IOoojoI0Ii1iO("4712")*6+(iiOlOIjOLi0O(81,69)=="QE" and 3447 or 36)
local liolojO=lj00ljj[IiLooIl011("\002\127\145\253\228","\142\030/\145\127$")][IiLooIl011("\r\015\247-","\157\174\148\194Q")] or function(...) return {n=lj1il1lOjL0o("#",...),...} end
local ijIilL=lj00ljj[IiLooIl011("n\142\007\216_","\250-\165l")][IiLooIl011("f{\161=}B","\241\r1\220\026\215")] or lj00ljj[IiLooIl011("z\016\179f\005\174","\005\162C")]
local jLli0LjLOO1o0="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function iL1ilO0olIj(j11LlLo0)
local ii1Lli={}
for LlIlol=1,64 do ii1Lli[IOilj0I1ljOiOL(jLli0LjLOO1o0,LlIlol)]=LlIlol-1 end
local il0o0i,i0LiILIOI1l,ji0oOOoIL,LjLL0j={},0,0,0
for LlIlol=1,#j11LlLo0 do
local jloi11L=ii1Lli[IOilj0I1ljOiOL(j11LlLo0,LlIlol)]
if jloi11L then
i0LiILIOI1l=i0LiILIOI1l*64+jloi11L
ji0oOOoIL=ji0oOOoIL+6
if ji0oOOoIL>=8 then ji0oOOoIL=ji0oOOoIL-8 LjLL0j=LjLL0j+1 il0o0i[LjLL0j]=iiOlOIjOLi0O(iIOOOo(i0LiILIOI1l/(2^ji0oOOoIL))%256) i0LiILIOI1l=i0LiILIOI1l%(2^ji0oOOoIL) end
end
end
return iLj1L01(il0o0i)
end
local jIl0lOL0iLi="G9iBuI1DXCgI2tiJBdJne3QCEdQ5HMwPqkP7DjMj5JPDq2y2GsO+y11MMvPc6Yh1gl9B8Q+0BfyR1BsRJs+j5oeThQstLe/zxYTrOzooFXjmvmKl7DEfX5tVQfO1l8d6YmqgSiT/JKHko1b4VRHcIt3H8WD0N5RAu+sh/2LcweajyTTTBrj7W0XubaJblem74Lnaap3cA2VLFuVEzaxabUDJ0zMuF6v0B7bIspNLSMMPO69+HHKue4xcjwt0cXgoiQHSYejRgInlAIj3k+Og80QYzlvSNTgoeLhU9i+SZu0zFI6D3al9ICplAcpPocO69Ry7dD+Xb1MGqJ/WoBJfYXVorP1eLcrjiqw6FNHth8NSqLPxA+/9xEPvkNbh3vg4GSpq0cd85JlC4rSqOF75ll3iPgGakEoL7gx4HD/OZWU3dP8QN4Vjf4wyt1mnSgPkaqdI1n3h6KUkDGmqqK+M7PMTrZiHl5IQLjLlnUctG8iLsF7nuu0QUWvZqw6Zan6Cjo84H/apvADcTRif10K3/Irprc+6hyTzajUvwWmhpsRRpokHLQmZJ4PhilG94dDerALFu2TqATi6lsjc7UNgsApbJGsejypayP8MMdvLFRdMvvWEqqoJygGMydWwybKusCn/1mcEBo/TYLh7c07ECNrF5SjtyY6hsqa0FlAgvdJ/oCwnNgsXbMgk02giGpA55B4xYm+X/SPyErGZt7qu7iU0wO4TXMpJM4ZvOgVM/TKrMQnZcX7n38ioqw6tenlSnmLDmumHA//0I/Bt3W4Q8ovAPfx9KKOtmvTwvT5qXyOlJ/wNTvBhzcr08DWSNAtrhmfM2yW/9AuJap5XLdSVSX1u037GZKJ3Vz8YztEQy1F2Dzcnn/+9wUR3weTfBlwwWXPUJxvGl99iQx9AGOlme77uNAGoCpz+2x2YM0npBoTGv5Hs4yrs2msSI8ovQ+hwsaf5xOVuhUQGEEppmFI3xGdH8egs5C6LMxkqCTMAxX4jsF5TVFOSSxPk0guvHvOvd6tAybZtnXpcXsyli9zpQ1TY+6rRwR4Ar8u+EPLgZLIMh5gpbst7H5Kdf+0Jz+P/jk2j2CeDPqgTvUS1IfBnC4ixSRe2/VM9Vzfv8aWUkbjIyH3QWqaH"
local function IOlOLi(jij0IliL)
local iI0olj=(916879616)+jIojilooIioOj
local liI0jl0=220
local l0OoIOII0Oo11j={}
for j00O1LIjI=1,#jij0IliL do
iI0olj=(iI0olj*18669+2334623303)%4294967296
local L1LIIl=IOilj0I1ljOiOL(jij0IliL,j00O1LIjI)
local i1o0jO=(iIOOOo(iI0olj/65536)+liI0jl0+(j00O1LIjI-1)*105)%256
l0OoIOII0Oo11j[j00O1LIjI]=iiOlOIjOLi0O((L1LIIl-i1o0jO)%256)
liI0jl0=(liI0jl0*41+L1LIIl+1)%251
end
return iLj1L01(l0OoIOII0Oo11j)
end
local iI0LlojOjLl1ji=IOlOLi(iL1ilO0olIj(jIl0lOL0iLi))
local L1LIIl=1
local function j1o0Lj0O11joj()
local j00O1LIjI=IOilj0I1ljOiOL(iI0LlojOjLl1ji,L1LIIl)
L1LIIl=L1LIIl+1
return j00O1LIjI
end
local function ijii100ioo1()
local j00O1LIjI,L0LOOoi1=IOilj0I1ljOiOL(iI0LlojOjLl1ji,L1LIIl,L1LIIl+1)
L1LIIl=L1LIIl+2
return j00O1LIjI+L0LOOoi1*256
end
local function Iilol0o()
local j00O1LIjI,L0LOOoi1,jij0IliL,l0OoIOII0Oo11j=IOilj0I1ljOiOL(iI0LlojOjLl1ji,L1LIIl,L1LIIl+3)
L1LIIl=L1LIIl+4
return j00O1LIjI+L0LOOoi1*256+jij0IliL*65536+l0OoIOII0Oo11j*16777216
end
local function LjOljIojI0()
local j00O1LIjI=Iilol0o()
local L0LOOoi1=lloOjj0LLl01O(iI0LlojOjLl1ji,L1LIIl,L1LIIl+j00O1LIjI-1)
L1LIIl=L1LIIl+j00O1LIjI
return L0LOOoi1
end
local function ilo00jIOiIl()
local j00O1LIjI=j1o0Lj0O11joj()
local L0LOOoi1=LjOljIojI0()
if j00O1LIjI==0 then return IOoojoI0Ii1iO(L0LOOoi1)
elseif j00O1LIjI==1 then return L0LOOoi1
elseif j00O1LIjI==2 then return 1/0
elseif j00O1LIjI==3 then return -1/0
else return 0/0 end
end
local function i0IiL11OI()
local I0ljiL=j1o0Lj0O11joj()
local j00O1LIjI=j1o0Lj0O11joj()
local L0LOOoi1=ijii100ioo1()
local loLlI1lLIliIoO={}
for jij0IliL=1,L0LOOoi1 do local Lii1j0Lj=ijii100ioo1() loLlI1lLIliIoO[jij0IliL]={Lii1j0Lj,LjOljIojI0()} end
local l0OoIOII0Oo11j=Iilol0o()
local LL11ojLO={}
for jij0IliL=1,l0OoIOII0Oo11j do
LL11ojLO[jij0IliL]={ijii100ioo1(),ijii100ioo1(),Iilol0o(),Iilol0o()}
end
local L1LIIl=ijii100ioo1()
local jljiijL01ll1I={}
for jij0IliL=1,L1LIIl do jljiijL01ll1I[jij0IliL]=i0IiL11OI() end
local I0ijli0=ijii100ioo1()
local Illjiil={}
for jij0IliL=1,I0ijli0 do Illjiil[jij0IliL]={j1o0Lj0O11joj(),ijii100ioo1()} end
return {I0ljiL,j00O1LIjI,LL11ojLO,loLlI1lLIliIoO,jljiijL01ll1I,Illjiil,{}}
end
local function ijLlo1(IILj0l1I,Lj0iloO0lo,Lii1j0Lj)
if Lj0iloO0lo[Lii1j0Lj]~=nil then return Lj0iloO0lo[Lii1j0Lj] end
local j11LlLo0=IILj0l1I[Lii1j0Lj]
local ii1Lli=j11LlLo0[1]
local LlIlol=j11LlLo0[2]
local il0o0i=(6721+ii1Lli*251+1)%65536
local i0LiILIOI1l={}
for ji0oOOoIL=1,#LlIlol do
il0o0i=(il0o0i*40503+12345)%65536
i0LiILIOI1l[ji0oOOoIL]=iiOlOIjOLi0O((IOilj0I1ljOiOL(LlIlol,ji0oOOoIL)-iIOOOo(il0o0i/256)%256-ji0oOOoIL*(6721%256))%256)
end
local LjLL0j=iLj1L01(i0LiILIOI1l)
local jloi11L=IOilj0I1ljOiOL(LjLL0j,1)
local LjOiIoi=IOilj0I1ljOiOL(LjLL0j,2)+IOilj0I1ljOiOL(LjLL0j,3)*256+IOilj0I1ljOiOL(LjLL0j,4)*65536+IOilj0I1ljOiOL(LjLL0j,5)*16777216
local I0IoI1=lloOjj0LLl01O(LjLL0j,6,5+LjOiIoi)
local iLilj0Ol
if jloi11L==0 then iLilj0Ol=IOoojoI0Ii1iO(I0IoI1) elseif jloi11L==1 then iLilj0Ol=I0IoI1 elseif jloi11L==2 then iLilj0Ol=1/0 elseif jloi11L==3 then iLilj0Ol=-1/0 else iLilj0Ol=0/0 end
Lj0iloO0lo[Lii1j0Lj]=iLilj0Ol
return iLilj0Ol
end
local LI0oOoliO={}
local l00LjLIO0=ijii100ioo1()
for jjjjoliiIlOi=1,l00LjLIO0 do local j00O1LIjI=ijii100ioo1() local L0LOOoi1=ijii100ioo1() LI0oOoliO[j00O1LIjI]=L0LOOoi1 end
local j00LjIO10Ll0=i0IiL11OI()
local j0oOLLOj01iO
local function IIIjLli(j00LjIO10Ll0,Illjiil)
return function(...) return j0oOLLOj01iO(j00LjIO10Ll0,Illjiil,liolojO(...)) end
end
j0oOLLOj01iO=function(j00LjIO10Ll0,Illjiil,L0iILI1lL1)
local IO11L1j00iI={}
local jLOLjoil1o1=0
local I0ljiL=j00LjIO10Ll0[1]
local iILIlLO0=L0iILI1lL1.n
for j00O1LIjI=1,I0ljiL do IO11L1j00iI[j00O1LIjI-1]=L0iILI1lL1[j00O1LIjI] end
local LLjlOi1Lj0,LlII0I0OiI={},0
if j00LjIO10Ll0[2]==1 then LlII0I0OiI=iILIlLO0-I0ljiL; if LlII0I0OiI<0 then LlII0I0OiI=0 end; for j00O1LIjI=1,LlII0I0OiI do LLjlOi1Lj0[j00O1LIjI]=L0iILI1lL1[I0ljiL+j00O1LIjI] end end
local LL11ojLO,loLlI1lLIliIoO,jljiijL01ll1I=j00LjIO10Ll0[3],j00LjIO10Ll0[4],j00LjIO10Ll0[5]
local ii0O0oioIlIi1=j00LjIO10Ll0[7]
local iillliiilo=1
local I0ijli0=0
while true do
local I1lLOI01O=LL11ojLO[iillliiilo]
iillliiilo=iillliiilo+1
local LooIoilLOI1,j00O1LIjI,L0LOOoi1,jij0IliL=I1lLOI01O[1],I1lLOI01O[2],I1lLOI01O[3],I1lLOI01O[4]
local l0OoIOII0Oo11j=LI0oOoliO[LooIoilLOI1]
if (iillliiilo*iillliiilo*iillliiilo-iillliiilo)%6~=0 then jLOLjoil1o1=jLOLjoil1o1+7 end
if (l0OoIOII0Oo11j*l0OoIOII0Oo11j)%4==2 then jLOLjoil1o1=jLOLjoil1o1+8 end
if l0OoIOII0Oo11j==22 then
IO11L1j00iI[j00O1LIjI]=IO11L1j00iI[j00O1LIjI]-IO11L1j00iI[j00O1LIjI+2]; iillliiilo=L0LOOoi1+1
elseif l0OoIOII0Oo11j==7 then
IO11L1j00iI[j00O1LIjI]=(IO11L1j00iI[L0LOOoi1]<=IO11L1j00iI[jij0IliL])
elseif l0OoIOII0Oo11j==27 then
IO11L1j00iI[j00O1LIjI]=-IO11L1j00iI[L0LOOoi1]
elseif l0OoIOII0Oo11j==26 then
IO11L1j00iI[j00O1LIjI]=IO11L1j00iI[L0LOOoi1]^IO11L1j00iI[jij0IliL]
elseif l0OoIOII0Oo11j==11 then
if (not not IO11L1j00iI[j00O1LIjI])==(L0LOOoi1~=0) then iillliiilo=jij0IliL+1 end
elseif l0OoIOII0Oo11j==39 then
IO11L1j00iI[j00O1LIjI]=IO11L1j00iI[j00O1LIjI]+IO11L1j00iI[j00O1LIjI+2]
local ii1Lli=IO11L1j00iI[j00O1LIjI+2]
if (ii1Lli>0 and IO11L1j00iI[j00O1LIjI]<=IO11L1j00iI[j00O1LIjI+1]) or (ii1Lli<=0 and IO11L1j00iI[j00O1LIjI]>=IO11L1j00iI[j00O1LIjI+1]) then IO11L1j00iI[j00O1LIjI+3]=IO11L1j00iI[j00O1LIjI]; iillliiilo=L0LOOoi1+1 end
elseif l0OoIOII0Oo11j==36 then
IO11L1j00iI[j00O1LIjI]=lj00ljj[ijLlo1(loLlI1lLIliIoO,ii0O0oioIlIi1,L0LOOoi1+1)]
elseif l0OoIOII0Oo11j==29 then
IO11L1j00iI[j00O1LIjI]=IO11L1j00iI[L0LOOoi1]-IO11L1j00iI[jij0IliL]
elseif l0OoIOII0Oo11j==23 then
IO11L1j00iI[j00O1LIjI]=IO11L1j00iI[L0LOOoi1][IO11L1j00iI[jij0IliL]]
elseif l0OoIOII0Oo11j==20 then
lj00ljj[ijLlo1(loLlI1lLIliIoO,ii0O0oioIlIi1,L0LOOoi1+1)]=IO11L1j00iI[j00O1LIjI]
elseif l0OoIOII0Oo11j==6 then
iillliiilo=L0LOOoi1+1
elseif l0OoIOII0Oo11j==38 then
if L0LOOoi1==0 then
for j11LlLo0=1,LlII0I0OiI do IO11L1j00iI[j00O1LIjI+j11LlLo0-1]=LLjlOi1Lj0[j11LlLo0] end
I0ijli0=j00O1LIjI+LlII0I0OiI
else
for j11LlLo0=1,L0LOOoi1-1 do IO11L1j00iI[j00O1LIjI+j11LlLo0-1]=LLjlOi1Lj0[j11LlLo0] end
end
elseif l0OoIOII0Oo11j==35 then
IO11L1j00iI[L0LOOoi1][1]=IO11L1j00iI[j00O1LIjI]
elseif l0OoIOII0Oo11j==17 then
IO11L1j00iI[j00O1LIjI]=Illjiil[L0LOOoi1+1][1]
elseif l0OoIOII0Oo11j==31 then
IO11L1j00iI[j00O1LIjI]=(IO11L1j00iI[L0LOOoi1]-IO11L1j00iI[L0LOOoi1]%IO11L1j00iI[jij0IliL])/IO11L1j00iI[jij0IliL]
elseif l0OoIOII0Oo11j==30 then
IO11L1j00iI[j00O1LIjI]=#IO11L1j00iI[L0LOOoi1]
elseif l0OoIOII0Oo11j==5 then
local LlIlol
if L0LOOoi1==0 then LlIlol=I0ijli0-j00O1LIjI else LlIlol=L0LOOoi1-1 end
local il0o0i={}
for j11LlLo0=1,LlIlol do il0o0i[j11LlLo0]=IO11L1j00iI[j00O1LIjI+j11LlLo0-1] end
return ijIilL(il0o0i,1,LlIlol)
elseif l0OoIOII0Oo11j==12 then
for j11LlLo0=j00O1LIjI,j00O1LIjI+L0LOOoi1 do IO11L1j00iI[j11LlLo0]=nil end
elseif l0OoIOII0Oo11j==28 then
IO11L1j00iI[j00O1LIjI][IO11L1j00iI[L0LOOoi1]]=IO11L1j00iI[jij0IliL]
elseif l0OoIOII0Oo11j==15 then
IO11L1j00iI[j00O1LIjI]=not IO11L1j00iI[L0LOOoi1]
elseif l0OoIOII0Oo11j==18 then
IO11L1j00iI[j00O1LIjI]=IO11L1j00iI[L0LOOoi1]..IO11L1j00iI[jij0IliL]
elseif l0OoIOII0Oo11j==21 then
local LlIlol
if L0LOOoi1==0 then LlIlol=I0ijli0-j00O1LIjI-1 else LlIlol=L0LOOoi1 end
local ii1Lli=IO11L1j00iI[j00O1LIjI]
for j11LlLo0=1,LlIlol do ii1Lli[jij0IliL+j11LlLo0]=IO11L1j00iI[j00O1LIjI+j11LlLo0] end
elseif l0OoIOII0Oo11j==24 then
IO11L1j00iI[j00O1LIjI]=((IO11L1j00iI[j00O1LIjI] or 0)+L0LOOoi1)%(jij0IliL+1)
elseif l0OoIOII0Oo11j==1 then
local ii1Lli=IO11L1j00iI[j00O1LIjI]
local LjLL0j=IO11L1j00iI[j00O1LIjI+1]
local jloi11L=IO11L1j00iI[j00O1LIjI+2]
local i0LiILIOI1l=liolojO(ii1Lli(LjLL0j,jloi11L))
local ji0oOOoIL=i0LiILIOI1l[1]
if ji0oOOoIL~=nil then
IO11L1j00iI[j00O1LIjI+2]=ji0oOOoIL
for j11LlLo0=1,L0LOOoi1 do IO11L1j00iI[j00O1LIjI+3+j11LlLo0-1]=i0LiILIOI1l[j11LlLo0] end
iillliiilo=jij0IliL+1
end
elseif l0OoIOII0Oo11j==9 then
IO11L1j00iI[j00O1LIjI]={IO11L1j00iI[L0LOOoi1]}
elseif l0OoIOII0Oo11j==2 then
IO11L1j00iI[j00O1LIjI+1]=IO11L1j00iI[L0LOOoi1]; IO11L1j00iI[j00O1LIjI]=IO11L1j00iI[L0LOOoi1][IO11L1j00iI[jij0IliL]]
elseif l0OoIOII0Oo11j==14 then
IO11L1j00iI[j00O1LIjI]=IO11L1j00iI[L0LOOoi1]
elseif l0OoIOII0Oo11j==4 then
IO11L1j00iI[j00O1LIjI]=IO11L1j00iI[L0LOOoi1]/IO11L1j00iI[jij0IliL]
elseif l0OoIOII0Oo11j==19 then
IO11L1j00iI[j00O1LIjI]=(IO11L1j00iI[L0LOOoi1]==IO11L1j00iI[jij0IliL])
elseif l0OoIOII0Oo11j==34 then
IO11L1j00iI[j00O1LIjI]=(IO11L1j00iI[L0LOOoi1]~=IO11L1j00iI[jij0IliL])
elseif l0OoIOII0Oo11j==33 then
IO11L1j00iI[j00O1LIjI]=ijLlo1(loLlI1lLIliIoO,ii0O0oioIlIi1,L0LOOoi1+1)
elseif l0OoIOII0Oo11j==42 then
IO11L1j00iI[j00O1LIjI]=(L0LOOoi1~=0)
elseif l0OoIOII0Oo11j==25 then
IO11L1j00iI[j00O1LIjI]=(IO11L1j00iI[L0LOOoi1]>=IO11L1j00iI[jij0IliL])
elseif l0OoIOII0Oo11j==32 then
IO11L1j00iI[j00O1LIjI]=IO11L1j00iI[L0LOOoi1][1]
elseif l0OoIOII0Oo11j==40 then
IO11L1j00iI[j00O1LIjI]={}
elseif l0OoIOII0Oo11j==41 then
IO11L1j00iI[j00O1LIjI]=IO11L1j00iI[L0LOOoi1]%IO11L1j00iI[jij0IliL]
elseif l0OoIOII0Oo11j==13 then
IO11L1j00iI[j00O1LIjI]=IO11L1j00iI[L0LOOoi1]+IO11L1j00iI[jij0IliL]
elseif l0OoIOII0Oo11j==16 then
local ii1Lli=jljiijL01ll1I[L0LOOoi1+1]
local il0o0i={}
local i0LiILIOI1l=ii1Lli[6]
for j11LlLo0=1,#i0LiILIOI1l do
local ji0oOOoIL=i0LiILIOI1l[j11LlLo0]
if ji0oOOoIL[1]==1 then il0o0i[j11LlLo0]=IO11L1j00iI[ji0oOOoIL[2]] else il0o0i[j11LlLo0]=Illjiil[ji0oOOoIL[2]+1] end
end
IO11L1j00iI[j00O1LIjI]=IIIjLli(ii1Lli,il0o0i)
elseif l0OoIOII0Oo11j==37 then
IO11L1j00iI[j00O1LIjI]=(IO11L1j00iI[L0LOOoi1]>IO11L1j00iI[jij0IliL])
elseif l0OoIOII0Oo11j==10 then
IO11L1j00iI[j00O1LIjI]=(IO11L1j00iI[L0LOOoi1]<IO11L1j00iI[jij0IliL])
elseif l0OoIOII0Oo11j==8 then
local ii1Lli=IO11L1j00iI[j00O1LIjI]
local LlIlol
if L0LOOoi1==0 then LlIlol=I0ijli0-j00O1LIjI-1 else LlIlol=L0LOOoi1-1 end
local il0o0i={}
for j11LlLo0=1,LlIlol do il0o0i[j11LlLo0]=IO11L1j00iI[j00O1LIjI+j11LlLo0] end
local i0LiILIOI1l=liolojO(ii1Lli(ijIilL(il0o0i,1,LlIlol)))
if jij0IliL==0 then
local ji0oOOoIL=i0LiILIOI1l.n
for j11LlLo0=1,ji0oOOoIL do IO11L1j00iI[j00O1LIjI+j11LlLo0-1]=i0LiILIOI1l[j11LlLo0] end
I0ijli0=j00O1LIjI+ji0oOOoIL
else
for j11LlLo0=1,jij0IliL-1 do IO11L1j00iI[j00O1LIjI+j11LlLo0-1]=i0LiILIOI1l[j11LlLo0] end
end
elseif l0OoIOII0Oo11j==43 then
Illjiil[L0LOOoi1+1][1]=IO11L1j00iI[j00O1LIjI]
elseif l0OoIOII0Oo11j==3 then
IO11L1j00iI[j00O1LIjI]=IO11L1j00iI[L0LOOoi1]*IO11L1j00iI[jij0IliL]
else LjlLL1LlLl() end
end
return jLOLjoil1o1
end
return j0oOLLOj01iO(j00LjIO10Ll0,{},liolojO(...))
