if not ffi then
    return error("Turn on Allow insecure FFI")
end

local _DEBUG = false

local function boot(tag, fresh)
    if not _DEBUG then return end
    if file == nil or file.Open == nil then return end
    local ok, fp = pcall(file.Open, 'hvhgg_prime_log.txt', fresh and 'w' or 'a')
    if not ok or fp == nil then return end
    pcall(fp.Write, fp, '[HvH.gg Prime] boot: ' .. tag .. '\r\n')
    pcall(fp.Close, fp)
end

local function boot_time()
    if globals == nil or globals.RealTime == nil then return nil end
    local ok, v = pcall(globals.RealTime)
    if not ok or type(v) ~= 'number' then return nil end
    return v
end

local function already_running()
    local p = rawget(_G, '__hvhgg_prime')
    if type(p) ~= 'table' or p.dead == true or type(p.beat) ~= 'number' then return false end
    local now = boot_time()
    if now == nil then return false end
    return (now - p.beat) < 5
end

if already_running() then
    boot('skipped, already running')
    print('[HvH.gg Prime] this load does nothing, an instance is already running')
    return
end

boot('chunk entered', true)

local json = (function()
    local a=true;local b=false;local c='json'local pairs,type,tostring,tonumber,getmetatable,setmetatable,rawset=pairs,type,tostring,tonumber,getmetatable,setmetatable,rawset;local error,require,select=error,require,select;local d,e=math.floor,math.huge;local f,g,h,i,j,k,l,m=string.rep,string.gsub,string.sub,string.byte,string.char,string.find,string.len,string.format;local n=string.match;local o=table.concat;local p={version="dkjson 2.5"}if b then _G[c]=p end;local q=nil;p.null=setmetatable({},{__tojson=function()return"null"end})local function r(s)local t,u,v=0,0,0;for w,x in pairs(s)do if w=='n'and type(x)=='number'then v=x;if x>t then t=x end else if type(w)~='number'or w<1 or d(w)~=w then return false end;if w>t then t=w end;u=u+1 end end;if t>10 and t>v and t>u*2 then return false end;return true,t end;local y={["\""]="\\\"",["\\"]="\\\\",["\b"]="\\b",["\f"]="\\f",["\n"]="\\n",["\r"]="\\r",["\t"]="\\t"}local function z(A)local B=y[A]if B then return B end;local C,D,E,F=i(A,1,4)C,D,E,F=C or 0,D or 0,E or 0,F or 0;if C<=0x7f then B=C elseif 0xc0<=C and C<=0xdf and D>=0x80 then B=(C-0xc0)*0x40+D-0x80 elseif 0xe0<=C and C<=0xef and D>=0x80 and E>=0x80 then B=((C-0xe0)*0x40+D-0x80)*0x40+E-0x80 elseif 0xf0<=C and C<=0xf7 and D>=0x80 and E>=0x80 and F>=0x80 then B=(((C-0xf0)*0x40+D-0x80)*0x40+E-0x80)*0x40+F-0x80 else return""end;if B<=0xffff then return m("\\u%.4x",B)elseif B<=0x10ffff then B=B-0x10000;local G,H=0xD800+d(B/0x400),0xDC00+B%0x400;return m("\\u%.4x\\u%.4x",G,H)else return""end end;local function I(J,K,L)if k(J,K)then return g(J,K,L)else return J end end;local function M(B)B=I(B,"[%z\1-\31\"\\\127]",z)if k(B,"[\194\216\220\225\226\239]")then B=I(B,"\194[\128-\159\173]",z)B=I(B,"\216[\128-\132]",z)B=I(B,"\220\143",z)B=I(B,"\225\158[\180\181]",z)B=I(B,"\226\128[\140-\143\168-\175]",z)B=I(B,"\226\129[\160-\175]",z)B=I(B,"\239\187\191",z)B=I(B,"\239\191[\176-\191]",z)end;return"\""..B.."\""end;p.quotestring=M;local function N(J,O,u)local P,Q=k(J,O,1,true)if P then return h(J,1,P-1)..u..h(J,Q+1,-1)else return J end end;local R,S;local function T()R=n(tostring(0.5),"([^05+])")S="[^0-9%-%+eE"..g(R,"[%^%$%(%)%%%.%[%]%*%+%-%?]","%%%0").."]+"end;T()local function U(V)return N(I(tostring(V),S,""),R,".")end;local function W(J)local V=tonumber(N(J,".",R))if not V then T()V=tonumber(N(J,".",R))end;return V end;local function X(Y,Z,_)Z[_+1]="\n"Z[_+2]=f("  ",Y)_=_+2;return _ end;function p.addnewline(a0)if a0.indent then a0.bufferlen=X(a0.level or 0,a0.buffer,a0.bufferlen or#a0.buffer)end end;local a1;local function a2(a3,B,a4,a5,Y,Z,_,a6,a7,a0)local a8=type(a3)if a8~='string'and a8~='number'then return nil,"type '"..a8 .."' is not supported as a key by JSON."end;if a4 then _=_+1;Z[_]=","end;if a5 then _=X(Y,Z,_)end;Z[_+1]=M(a3)Z[_+2]=":"return a1(B,a5,Y,Z,_+2,a6,a7,a0)end;local function a9(aa,Z,a0)local _=a0.bufferlen;if type(aa)=='string'then _=_+1;Z[_]=aa end;return _ end;local function ab(ac,B,a0,Z,_,ad)ad=ad or ac;local ae=a0.exception;if not ae then return nil,ad else a0.bufferlen=_;local af,ag=ae(ac,B,a0,ad)if not af then return nil,ag or ad end;return a9(af,Z,a0)end end;function p.encodeexception(ac,B,a0,ad)return M("<"..ad..">")end;a1=function(B,a5,Y,Z,_,a6,a7,a0)local ah=type(B)local ai=getmetatable(B)ai=type(ai)=='table'and ai;local aj=ai and ai.__tojson;if aj then if a6[B]then return ab('reference cycle',B,a0,Z,_)end;a6[B]=true;a0.bufferlen=_;local af,ag=aj(B,a0)if not af then return ab('custom encoder failed',B,a0,Z,_,ag)end;a6[B]=nil;_=a9(af,Z,a0)elseif B==nil then _=_+1;Z[_]="null"elseif ah=='number'then local ak;if B~=B or B>=e or-B>=e then ak="null"else ak=U(B)end;_=_+1;Z[_]=ak elseif ah=='boolean'then _=_+1;Z[_]=B and"true"or"false"elseif ah=='string'then _=_+1;Z[_]=M(B)elseif ah=='table'then if a6[B]then return ab('reference cycle',B,a0,Z,_)end;a6[B]=true;Y=Y+1;local al,u=r(B)if u==0 and ai and ai.__jsontype=='object'then al=false end;local ag;if al then _=_+1;Z[_]="["for P=1,u do _,ag=a1(B[P],a5,Y,Z,_,a6,a7,a0)if not _ then return nil,ag end;if P<u then _=_+1;Z[_]=","end end;_=_+1;Z[_]="]"else local a4=false;_=_+1;Z[_]="{"local am=ai and ai.__jsonorder or a7;if am then local an={}u=#am;for P=1,u do local w=am[P]local x=B[w]if x then an[w]=true;_,ag=a2(w,x,a4,a5,Y,Z,_,a6,a7,a0)a4=true end end;for w,x in pairs(B)do if not an[w]then _,ag=a2(w,x,a4,a5,Y,Z,_,a6,a7,a0)if not _ then return nil,ag end;a4=true end end else for w,x in pairs(B)do _,ag=a2(w,x,a4,a5,Y,Z,_,a6,a7,a0)if not _ then return nil,ag end;a4=true end end;if a5 then _=X(Y-1,Z,_)end;_=_+1;Z[_]="}"end;a6[B]=nil else return ab('unsupported type',B,a0,Z,_,"type '"..ah.."' is not supported by JSON.")end;return _ end;function p.encode(B,a0)a0=a0 or{}local ao=a0.buffer;local Z=ao or{}a0.buffer=Z;T()local af,ag=a1(B,a0.indent,a0.level or 0,Z,a0.bufferlen or 0,a0.tables or{},a0.keyorder,a0)if not af then error(ag,2)elseif ao==Z then a0.bufferlen=af;return true else a0.bufferlen=nil;a0.buffer=nil;return o(Z)end end;local function ap(J,aq)local ar,as,at=1,1,0;while true do as=k(J,"\n",as,true)if as and as<aq then ar=ar+1;at=as;as=as+1 else break end end;return"line "..ar..", column "..aq-at end;local function au(J,av,aq)return nil,l(J)+1,"unterminated "..av.." at "..ap(J,aq)end;local function aw(J,as)while true do as=k(J,"%S",as)if not as then return nil end;local ax=h(J,as,as+1)if ax=="\239\187"and h(J,as+2,as+2)=="\191"then as=as+3 elseif ax=="//"then as=k(J,"[\n\r]",as+2)if not as then return nil end elseif ax=="/*"then as=k(J,"*/",as+2)if not as then return nil end;as=as+2 else return as end end end;local ay={["\""]="\"",["\\"]="\\",["/"]="/",["b"]="\b",["f"]="\f",["n"]="\n",["r"]="\r",["t"]="\t"}local function az(B)if B<0 then return nil elseif B<=0x007f then return j(B)elseif B<=0x07ff then return j(0xc0+d(B/0x40),0x80+d(B)%0x40)elseif B<=0xffff then return j(0xe0+d(B/0x1000),0x80+d(B/0x40)%0x40,0x80+d(B)%0x40)elseif B<=0x10ffff then return j(0xf0+d(B/0x40000),0x80+d(B/0x1000)%0x40,0x80+d(B/0x40)%0x40,0x80+d(B)%0x40)else return nil end end;local function aA(J,as)local aB=as+1;local Z,u={},0;while true do local aC=k(J,"[\"\\]",aB)if not aC then return au(J,"string",as)end;if aC>aB then u=u+1;Z[u]=h(J,aB,aC-1)end;if h(J,aC,aC)=="\""then aB=aC+1;break else local aD=h(J,aC+1,aC+1)local B;if aD=="u"then B=tonumber(h(J,aC+2,aC+5),16)if B then local aE;if 0xD800<=B and B<=0xDBff then if h(J,aC+6,aC+7)=="\\u"then aE=tonumber(h(J,aC+8,aC+11),16)if aE and 0xDC00<=aE and aE<=0xDFFF then B=(B-0xD800)*0x400+aE-0xDC00+0x10000 else aE=nil end end end;B=B and az(B)if B then if aE then aB=aC+12 else aB=aC+6 end end end end;if not B then B=ay[aD]or aD;aB=aC+2 end;u=u+1;Z[u]=B end end;if u==1 then return Z[1],aB elseif u>1 then return o(Z),aB else return"",aB end end;local aF;local function aG(av,aH,J,aI,aJ,aK,aL)local aM=l(J)local s,u={},0;local as=aI+1;if av=='object'then setmetatable(s,aK)else setmetatable(s,aL)end;while true do as=aw(J,as)if not as then return au(J,av,aI)end;local aN=h(J,as,as)if aN==aH then return s,as+1 end;local aO,aP;aO,as,aP=aF(J,as,aJ,aK,aL)if aP then return nil,as,aP end;as=aw(J,as)if not as then return au(J,av,aI)end;aN=h(J,as,as)if aN==":"then if aO==nil then return nil,as,"cannot use nil as table index (at "..ap(J,as)..")"end;as=aw(J,as+1)if not as then return au(J,av,aI)end;local aQ;aQ,as,aP=aF(J,as,aJ,aK,aL)if aP then return nil,as,aP end;s[aO]=aQ;as=aw(J,as)if not as then return au(J,av,aI)end;aN=h(J,as,as)else u=u+1;s[u]=aO end;if aN==","then as=as+1 end end end;aF=function(J,as,aJ,aK,aL)as=as or 1;as=aw(J,as)if not as then return nil,l(J)+1,"no valid JSON value (reached the end)"end;local aN=h(J,as,as)if aN=="{"then return aG('object',"}",J,as,aJ,aK,aL)elseif aN=="["then return aG('array',"]",J,as,aJ,aK,aL)elseif aN=="\""then return aA(J,as)else local aR,aS=k(J,"^%-?[%d%.]+[eE]?[%+%-]?%d*",as)if aR then local aT=W(h(J,aR,aS))if aT then return aT,aS+1 end end;aR,aS=k(J,"^%a%w*",as)if aR then local aU=h(J,aR,aS)if aU=="true"then return true,aS+1 elseif aU=="false"then return false,aS+1 elseif aU=="null"then return aJ,aS+1 end end;return nil,as,"no valid JSON value at "..ap(J,as)end end;local function aV(...)if select("#",...)>0 then return...else return{__jsontype='object'},{__jsontype='array'}end end;function p.decode(J,as,aJ,...)local aK,aL=aV(...)return aF(J,as,aJ,aK,aL)end;function p.use_lpeg()local aW=require("lpeg")if aW.version()=="0.11"then error"due to a bug in LPeg 0.11, it cannot be used for JSON matching"end;local aX=aW.match;local aY,aZ,a_=aW.P,aW.S,aW.R;local function b0(J,as,ag,a0)if not a0.msg then a0.msg=ag.." at "..ap(J,as)a0.pos=as end;return false end;local function b1(ag)return aW.Cmt(aW.Cc(ag)*aW.Carg(2),b0)end;local b2=aY"//"*(1-aZ"\n\r")^0;local b3=aY"/*"*(1-aY"*/")^0*aY"*/"local b4=(aZ" \n\r\t"+aY"\239\187\191"+b2+b3)^0;local b5=1-aZ"\"\\\n\r"local b6=aY"\\"*aW.C(aZ"\"\\/bfnrt"+b1"unsupported escape sequence")/ay;local b7=a_("09","af","AF")local function b8(b9,as,ba,bb)ba,bb=tonumber(ba,16),tonumber(bb,16)if 0xD800<=ba and ba<=0xDBff and 0xDC00<=bb and bb<=0xDFFF then return true,az((ba-0xD800)*0x400+bb-0xDC00+0x10000)else return false end end;local function bc(bd)return az(tonumber(bd,16))end;local be=aY"\\u"*aW.C(b7*b7*b7*b7)local bf=aW.Cmt(be*be,b8)+be/bc;local bg=bf+b6+b5;local bh=aY"\""*aW.Cs(bg^0)*(aY"\""+b1"unterminated string")local bi=aY"-"^-1*(aY"0"+a_"19"*a_"09"^0)local bj=aY"."*a_"09"^0;local bk=aZ"eE"*aZ"+-"^-1*a_"09"^1;local bl=bi*bj^-1*bk^-1/W;local bm=aY"true"*aW.Cc(true)+aY"false"*aW.Cc(false)+aY"null"*aW.Carg(1)local bn=bl+bh+bm;local bo,bp;local function bq(J,as,aJ,a0)local br,bs;local bt;local bu,bv={},0;repeat br,bs,bt=aX(bo,J,as,aJ,a0)if not bt then break end;as=bt;bv=bv+1;bu[bv]=br until bs=='last'return as,setmetatable(bu,a0.arraymeta)end;local function bw(J,as,aJ,a0)local br,a3,bs;local bt;local bu={}repeat a3,br,bs,bt=aX(bp,J,as,aJ,a0)if not bt then break end;as=bt;bu[a3]=br until bs=='last'return as,setmetatable(bu,a0.objectmeta)end;local bx=aY"["*aW.Cmt(aW.Carg(1)*aW.Carg(2),bq)*b4*(aY"]"+b1"']' expected")local by=aY"{"*aW.Cmt(aW.Carg(1)*aW.Carg(2),bw)*b4*(aY"}"+b1"'}' expected")local bz=b4*(bx+by+bn)local bA=bz+b4*b1"value expected"bo=bz*b4*(aY","*aW.Cc'cont'+aW.Cc'last')*aW.Cp()local bB=aW.Cg(b4*bh*b4*(aY":"+b1"colon expected")*bA)bp=bB*b4*(aY","*aW.Cc'cont'+aW.Cc'last')*aW.Cp()local bC=bA*aW.Cp()function p.decode(J,as,aJ,...)local a0={}a0.objectmeta,a0.arraymeta=aV(...)local br,bD=aX(bC,J,as,aJ,a0)if a0.msg then return nil,a0.pos,a0.msg else return br,bD end end;p.use_lpeg=function()return p end;p.using_lpeg=true;return p end;p.parse=p.decode;p.stringify=p.encode;return p

end)()

boot('json ok')

local utils = {}

do
    local decls = {
        'void* GetModuleHandleA(const char*);',
        'void* GetProcAddress(void*, const char*);',
        'void GetSystemTimeAsFileTime(void*);',
    }
    for i = 1, #decls do pcall(ffi.cdef, decls[i]) end

    local C = ffi.C
    local stamp = ffi.new('uint32_t[2]')
    local B64 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

    function utils.find_export(module, name)
        local h = C.GetModuleHandleA(module)
        if h == nil then return nil end
        local p = C.GetProcAddress(h, name)
        if p == nil then return nil end
        return p
    end

    function utils.get_unix_time()
        C.GetSystemTimeAsFileTime(stamp)
        local hi, lo = tonumber(stamp[1]), tonumber(stamp[0])
        return math.floor((hi * 4294967296 + lo) / 10000000 - 11644473600)
    end

    function utils.base64_encode(s)
        local out = {}
        for i = 1, #s, 3 do
            local a, b, c = s:byte(i, i + 2)
            local v = a * 65536 + (b or 0) * 256 + (c or 0)
            local q = {}
            for k = 1, 4 do
                q[5 - k] = B64:sub(v % 64 + 1, v % 64 + 1)
                v = math.floor(v / 64)
            end
            if c == nil then q[4] = '=' end
            if b == nil then q[3] = '=' end
            out[#out + 1] = table.concat(q)
        end
        return table.concat(out)
    end
end

boot('utils ok')

local http = rawget(_G, '__hvhgg_http') or (function()
    local a=ffi.cast('uint64_t(__stdcall*)(const char*)',utils.find_export('kernel32.dll','GetModuleHandleA'))local b=ffi.cast('uint64_t(__stdcall*)(uint64_t, const char*)',utils.find_export('kernel32.dll','GetProcAddress'))local c=a('steam_api64.dll')local d=ffi.cast("void*(__thiscall*)()",b(c,'SteamClient'))local e=ffi.cast("int(__stdcall*)()",b(c,'SteamAPI_GetHSteamPipe'))local f=ffi.cast("int(__stdcall*)()",b(c,'SteamAPI_GetHSteamPipe'))local g=ffi.cast("void*(__thiscall*)(void*, int, const char*)",b(c,'SteamAPI_ISteamClient_GetISteamUtils'))local h=ffi.cast("uint64_t(__thiscall*)(void*, int, int, const char*)",b(c,'SteamAPI_ISteamClient_GetISteamHTTP'))local i=h(d(),e(),f(),"STEAMHTTP_INTERFACE_VERSION003")local j=g(d(),e(),"SteamUtils009")local assert,pcall,xpcall,error,setmetatable,tostring,tonumber,type,pairs,ipairs=assert,pcall,xpcall,error,setmetatable,tostring,tonumber,type,pairs,ipairs;local k=string.format;local l,m,n,o,p,q=ffi.typeof,ffi.sizeof,ffi.cast,ffi.cdef,ffi.string,ffi.gc;local r,s,t=string.lower,string.len,string.find;local u=utils.base64_encode;local v,w;do ffi.cdef([[
		typedef uint64_t SteamAPICall_t;
		struct SteamAPI_callback_base_vtbl {
			void(__thiscall *run1)(struct SteamAPI_callback_base *, void *, bool, uint64_t);
			void(__thiscall *run2)(struct SteamAPI_callback_base *, void *);
			int(__thiscall *get_size)(struct SteamAPI_callback_base *);
		};
		struct SteamAPI_callback_base {
			struct SteamAPI_callback_base_vtbl *vtbl;
			uint8_t flags;
			int id;
			uint64_t api_call_handle;
			struct SteamAPI_callback_base_vtbl vtbl_storage[1];
		};
	]])local x={[-1]="No failure",[0]="Steam gone",[1]="Network failure",[2]="Invalid handle",[3]="Mismatched callback"}local y,z;local A,B;local C;local D=l("struct SteamAPI_callback_base")local E=m(D)local F=l("struct SteamAPI_callback_base[1]")local G=l("struct SteamAPI_callback_base*")local H=l("uintptr_t")local I={}local J={}local K={}local function L(M)return tostring(tonumber(n(H,M)))end;local function N(self,O,P)if P then P=x[C(self.api_call_handle)]or"Unknown error"end;self.api_call_handle=0;xpcall(function()local Q=L(self)local R=I[Q]if R~=nil then xpcall(R,error,O,P)end;if J[Q]~=nil then I[Q]=nil;J[Q]=nil end end,error)end;local function S(self,O,P,T)if T==self.api_call_handle then N(self,O,P)end end;local function U(self,O)N(self,O,false)end;local function V(self)return E end;local function W(self)if self.api_call_handle~=0 then z(self,self.api_call_handle)self.api_call_handle=0;local Q=L(self)I[Q]=nil;J[Q]=nil end end;local X=l([[    struct {
			int8_t nRefCount;
		}
	]])local function Y()for Q,Z in pairs(J)do local _=n(G,Z)W(_)end;for Q,Z in pairs(K)do local _=n(G,Z)B(_)end end;ffi.metatype(X,{__gc=function(self)return Y()end})local a0=ffi.new(X)ffi.metatype(D,{__gc=W,__index={cancel=W}})local a1=n("void(__thiscall *)(struct SteamAPI_callback_base *, void *, bool, uint64_t)",S)local a2=n("void(__thiscall *)(struct SteamAPI_callback_base *, void *)",U)local a3=n("int(__thiscall *)(struct SteamAPI_callback_base *)",V)function v(T,R,a4)assert(T~=0)local a5=F()local _=n(G,a5)_.vtbl_storage[0].run1=a1;_.vtbl_storage[0].run2=a2;_.vtbl_storage[0].get_size=a3;_.vtbl=_.vtbl_storage;_.api_call_handle=T;_.id=a4;local Q=L(_)I[Q]=R;J[Q]=a5;y(_,T)return _ end;function w(a4,R)assert(K[a4]==nil)a0.nRefCount=0;local a5=F()local _=n(G,a5)_.vtbl_storage[0].run1=a1;_.vtbl_storage[0].run2=a2;_.vtbl_storage[0].get_size=a3;_.vtbl=_.vtbl_storage;_.api_call_handle=0;_.id=a4;local Q=L(_)I[Q]=R;K[a4]=a5;A(_,a4)end;local function a6(_,a7,type)return n(type,n("void***",_)[0][a7])end;y=ffi.cast("void(__cdecl*)(struct SteamAPI_callback_base *, uint64_t)",b(c,'SteamAPI_RegisterCallResult'))z=ffi.cast("void(__cdecl*)(struct SteamAPI_callback_base *, uint64_t)",b(c,'SteamAPI_UnregisterCallResult'))A=ffi.cast("void(__cdecl*)(struct SteamAPI_callback_base *, int)",b(c,'SteamAPI_RegisterCallback'))B=ffi.cast("void(__cdecl*)(struct SteamAPI_callback_base *)",b(c,'SteamAPI_UnregisterCallback'))local a8=ffi.cast("int(__thiscall*)(void*, SteamAPICall_t)",b(c,'SteamAPI_ISteamUtils_GetAPICallFailureReason'))function C(a9)return a8(j,a9)end end;ffi.cdef([[
	typedef uint32_t http_HTTPRequestHandle;
	typedef uint32_t http_HTTPCookieContainerHandle;
	enum http_EHTTPMethod {
		k_EHTTPMethodInvalid,
		k_EHTTPMethodGET,
		k_EHTTPMethodHEAD,
		k_EHTTPMethodPOST,
		k_EHTTPMethodPUT,
		k_EHTTPMethodDELETE,
		k_EHTTPMethodOPTIONS,
		k_EHTTPMethodPATCH,
	};
	struct http_ISteamHTTPVtbl {
		http_HTTPRequestHandle(__thiscall *CreateHTTPRequest)(uintptr_t, enum http_EHTTPMethod, const char *);
		bool(__thiscall *SetHTTPRequestContextValue)(uintptr_t, http_HTTPRequestHandle, uint64_t);
		bool(__thiscall *SetHTTPRequestNetworkActivityTimeout)(uintptr_t, http_HTTPRequestHandle, uint32_t);
		bool(__thiscall *SetHTTPRequestHeaderValue)(uintptr_t, http_HTTPRequestHandle, const char *, const char *);
		bool(__thiscall *SetHTTPRequestGetOrPostParameter)(uintptr_t, http_HTTPRequestHandle, const char *, const char *);
		bool(__thiscall *SendHTTPRequest)(uintptr_t, http_HTTPRequestHandle, SteamAPICall_t *);
		bool(__thiscall *SendHTTPRequestAndStreamResponse)(uintptr_t, http_HTTPRequestHandle, SteamAPICall_t *);
		bool(__thiscall *DeferHTTPRequest)(uintptr_t, http_HTTPRequestHandle);
		bool(__thiscall *PrioritizeHTTPRequest)(uintptr_t, http_HTTPRequestHandle);
		bool(__thiscall *GetHTTPResponseHeaderSize)(uintptr_t, http_HTTPRequestHandle, const char *, uint32_t *);
		bool(__thiscall *GetHTTPResponseHeaderValue)(uintptr_t, http_HTTPRequestHandle, const char *, uint8_t *, uint32_t);
		bool(__thiscall *GetHTTPResponseBodySize)(uintptr_t, http_HTTPRequestHandle, uint32_t *);
		bool(__thiscall *GetHTTPResponseBodyData)(uintptr_t, http_HTTPRequestHandle, uint8_t *, uint32_t);
		bool(__thiscall *GetHTTPStreamingResponseBodyData)(uintptr_t, http_HTTPRequestHandle, uint32_t, uint8_t *, uint32_t);
		bool(__thiscall *ReleaseHTTPRequest)(uintptr_t, http_HTTPRequestHandle);
		bool(__thiscall *GetHTTPDownloadProgressPct)(uintptr_t, http_HTTPRequestHandle, float *);
		bool(__thiscall *SetHTTPRequestRawPostBody)(uintptr_t, http_HTTPRequestHandle, const char *, uint8_t *, uint32_t);
		http_HTTPCookieContainerHandle(__thiscall *CreateCookieContainer)(uintptr_t, bool);
		bool(__thiscall *ReleaseCookieContainer)(uintptr_t, http_HTTPCookieContainerHandle);
		bool(__thiscall *SetCookie)(uintptr_t, http_HTTPCookieContainerHandle, const char *, const char *, const char *);
		bool(__thiscall *SetHTTPRequestCookieContainer)(uintptr_t, http_HTTPRequestHandle, http_HTTPCookieContainerHandle);
		bool(__thiscall *SetHTTPRequestUserAgentInfo)(uintptr_t, http_HTTPRequestHandle, const char *);
		bool(__thiscall *SetHTTPRequestRequiresVerifiedCertificate)(uintptr_t, http_HTTPRequestHandle, bool);
		bool(__thiscall *SetHTTPRequestAbsoluteTimeoutMS)(uintptr_t, http_HTTPRequestHandle, uint32_t);
		bool(__thiscall *GetHTTPRequestWasTimedOut)(uintptr_t, http_HTTPRequestHandle, bool *pbWasTimedOut);
	};
]])local aa={get=1,head=2,post=3,put=4,delete=5,options=6,patch=7}local ab={[100]="Continue",[101]="Switching Protocols",[102]="Processing",[200]="OK",[201]="Created",[202]="Accepted",[203]="Non-Authoritative Information",[204]="No Content",[205]="Reset Content",[206]="Partial Content",[207]="Multi-Status",[208]="Already Reported",[250]="Low on Storage Space",[226]="IM Used",[300]="Multiple Choices",[301]="Moved Permanently",[302]="Found",[303]="See Other",[304]="Not Modified",[305]="Use Proxy",[306]="Switch Proxy",[307]="Temporary Redirect",[308]="Permanent Redirect",[400]="Bad Request",[401]="Unauthorized",[402]="Payment Required",[403]="Forbidden",[404]="Not Found",[405]="Method Not Allowed",[406]="Not Acceptable",[407]="Proxy Authentication Required",[408]="Request Timeout",[409]="Conflict",[410]="Gone",[411]="Length Required",[412]="Precondition Failed",[413]="Request Entity Too Large",[414]="Request-URI Too Long",[415]="Unsupported Media Type",[416]="Requested Range Not Satisfiable",[417]="Expectation Failed",[418]="I'm a teapot",[420]="Enhance Your Calm",[422]="Unprocessable Entity",[423]="Locked",[424]="Failed Dependency",[424]="Method Failure",[425]="Unordered Collection",[426]="Upgrade Required",[428]="Precondition Required",[429]="Too Many Requests",[431]="Request Header Fields Too Large",[444]="No Response",[449]="Retry With",[450]="Blocked by Windows Parental Controls",[451]="Parameter Not Understood",[451]="Unavailable For Legal Reasons",[451]="Redirect",[452]="Conference Not Found",[453]="Not Enough Bandwidth",[454]="Session Not Found",[455]="Method Not Valid in This State",[456]="Header Field Not Valid for Resource",[457]="Invalid Range",[458]="Parameter Is Read-Only",[459]="Aggregate Operation Not Allowed",[460]="Only Aggregate Operation Allowed",[461]="Unsupported Transport",[462]="Destination Unreachable",[494]="Request Header Too Large",[495]="Cert Error",[496]="No Cert",[497]="HTTP to HTTPS",[499]="Client Closed Request",[500]="Internal Server Error",[501]="Not Implemented",[502]="Bad Gateway",[503]="Service Unavailable",[504]="Gateway Timeout",[505]="HTTP Version Not Supported",[506]="Variant Also Negotiates",[507]="Insufficient Storage",[508]="Loop Detected",[509]="Bandwidth Limit Exceeded",[510]="Not Extended",[511]="Network Authentication Required",[551]="Option not supported",[598]="Network read timeout error",[599]="Network connect timeout error"}local ac={"params","body","json"}local ad=2101;local ae=2102;local af=2103;local ag=l([[
struct {
	http_HTTPRequestHandle m_hRequest;
	uint64_t m_ulContextValue;
	bool m_bRequestSuccessful;
	int m_eStatusCode;
	uint32_t m_unBodySize;
} *
]])local ah=l([[
struct {
	http_HTTPRequestHandle m_hRequest;
	uint64_t m_ulContextValue;
} *
]])local ai=l([[
struct {
	http_HTTPRequestHandle m_hRequest;
	uint64_t m_ulContextValue;
	uint32_t m_cOffset;
	uint32_t m_cBytesReceived;
} *
]])local aj=l([[
struct {
	http_HTTPCookieContainerHandle m_hCookieContainer;
}
]])local ak=l("SteamAPICall_t[1]")local al=l("const char[?]")local am=l("uint8_t[?]")local an=l("unsigned int[?]")local ao=l("bool[1]")local ap=l("float[1]")local function aq()local ar=ffi.cast("struct http_ISteamHTTPVtbl**",i)[0]if ar==0 or ar==nil then return error("find_isteamhttp failed")end;return i,ar end;local function as(at,au)return function(...)return at(au,...)end end;local av,aw=aq()local ax=as(aw.CreateHTTPRequest,av)local ay=as(aw.SetHTTPRequestContextValue,av)local az=as(aw.SetHTTPRequestNetworkActivityTimeout,av)local aA=as(aw.SetHTTPRequestHeaderValue,av)local aB=as(aw.SetHTTPRequestGetOrPostParameter,av)local aC=as(aw.SendHTTPRequest,av)local aD=as(aw.SendHTTPRequestAndStreamResponse,av)local aE=as(aw.DeferHTTPRequest,av)local aF=as(aw.PrioritizeHTTPRequest,av)local aG=as(aw.GetHTTPResponseHeaderSize,av)local aH=as(aw.GetHTTPResponseHeaderValue,av)local aI=as(aw.GetHTTPResponseBodySize,av)local aJ=as(aw.GetHTTPResponseBodyData,av)local aK=as(aw.GetHTTPStreamingResponseBodyData,av)local aL=as(aw.ReleaseHTTPRequest,av)local aM=as(aw.GetHTTPDownloadProgressPct,av)local aN=as(aw.SetHTTPRequestRawPostBody,av)local aO=as(aw.CreateCookieContainer,av)local aP=as(aw.ReleaseCookieContainer,av)local aQ=as(aw.SetCookie,av)local aR=as(aw.SetHTTPRequestCookieContainer,av)local aS=as(aw.SetHTTPRequestUserAgentInfo,av)local aT=as(aw.SetHTTPRequestRequiresVerifiedCertificate,av)local aU=as(aw.SetHTTPRequestAbsoluteTimeoutMS,av)local aV=as(aw.GetHTTPRequestWasTimedOut,av)local aW,aX={},false;local aY,aZ=false,{}local a_,b0=false,{}local b1=setmetatable({},{__mode="k"})local b2,b3=setmetatable({},{__mode="k"}),setmetatable({},{__mode="v"})local b4={}local b5={__index=function(b6,b7)local b8=b2[b6]if b8==nil then return end;b7=tostring(b7)if b8.m_hRequest~=0 then local b9=an(1)if aG(b8.m_hRequest,b7,b9)then if b9~=nil then b9=b9[0]if b9<0 then return end;local ba=am(b9)if aH(b8.m_hRequest,b7,ba,b9)then b6[b7]=p(ba,b9-1)return b6[b7]end end end end end,__metatable=false}local bb={__index={set_cookie=function(bc,bd,be,b7,Z)local a9=b1[bc]if a9==nil or a9.m_hCookieContainer==0 then return end;aQ(a9.m_hCookieContainer,bd,be,tostring(b7).."="..tostring(Z))end},__metatable=false}local function bf(a9)if a9.m_hCookieContainer~=0 then aP(a9.m_hCookieContainer)a9.m_hCookieContainer=0 end end;local function bg(b8)if b8.m_hRequest~=0 then aL(b8.m_hRequest)b8.m_hRequest=0 end end;local function bh(bi,...)aL(bi)return error(...)end;local function bj(b8,bk,bl,bm,...)local bn=b3[b8.m_hRequest]if bn==nil then bn=setmetatable({},b5)b3[b8.m_hRequest]=bn end;b2[bn]=b8;bm.headers=bn;aX=true;xpcall(bk,error,bl,bm,...)aX=false end;local function bo(O,P)if O==nil then return end;local b8=n(ag,O)if b8.m_hRequest~=0 then local bk=aW[b8.m_hRequest]if bk~=nil then aW[b8.m_hRequest]=nil;b0[b8.m_hRequest]=nil;aZ[b8.m_hRequest]=nil;if bk then local bl=P==false and b8.m_bRequestSuccessful;local bp=b8.m_eStatusCode;local bq={status=bp}local br=b8.m_unBodySize;if bl and br>0 then local ba=am(br)if aJ(b8.m_hRequest,ba,br)then bq.body=p(ba,br)end elseif not b8.m_bRequestSuccessful then local bs=ao()aV(b8.m_hRequest,bs)bq.timed_out=bs~=nil and bs[0]==true end;if bp>0 then bq.status_message=ab[bp]or"Unknown status"elseif P then bq.status_message=k("IO Failure: %s",P)else bq.status_message=bq.timed_out and"Timed out"or"Unknown error"end;bj(b8,bk,bl,bq)end;bg(b8)end end end;local function bt(O,P)if O==nil then return end;local b8=n(ah,O)if b8.m_hRequest~=0 then local bk=aZ[b8.m_hRequest]if bk then bj(b8,bk,P==false,{})end end end;local function bu(O,P)if O==nil then return end;local b8=n(ai,O)if b8.m_hRequest~=0 then local bk=b0[b8.m_hRequest]if b0[b8.m_hRequest]then local bm={}local bv=ap()if aM(b8.m_hRequest,bv)then bm.download_progress=tonumber(bv[0])end;local ba=am(b8.m_cBytesReceived)if aK(b8.m_hRequest,b8.m_cOffset,ba,b8.m_cBytesReceived)then bm.body=p(ba,b8.m_cBytesReceived)end;bj(b8,bk,P==false,bm)end end end;local function bw(bx,be,by,bz)if type(by)=="function"and bz==nil then bz=by;by={}end;by=by or{}local bx=aa[r(tostring(bx))]if bx==nil then return error("invalid HTTP method")end;if type(be)~="string"then return error("URL has to be a string")end;local bA,bB,bC;if type(bz)=="function"then bA=bz elseif type(bz)=="table"then bA=bz.completed or bz.complete;bB=bz.headers_received or bz.headers;bC=bz.data_received or bz.data;if bA~=nil and type(bA)~="function"then return error("callbacks.completed callback has to be a function")elseif bB~=nil and type(bB)~="function"then return error("callbacks.headers_received callback has to be a function")elseif bC~=nil and type(bC)~="function"then return error("callbacks.data_received callback has to be a function")end else return error("callbacks has to be a function or table")end;local bi=ax(bx,be)if bi==0 then return error("Failed to create HTTP request")end;local bD=false;for bE,Q in ipairs(ac)do if by[Q]~=nil then if bD then return error("can only set options.params, options.body or options.json")else bD=true end end end;local bF;if by.json~=nil then local bG;bF=json.stringify(by.json)bG=bF~="null"if not bG then return error("options.json is invalid: "..bF)end end;local bH=by.network_timeout;if bH==nil then bH=10 end;if type(bH)=="number"and bH>0 then if not az(bi,bH)then return bh(bi,"failed to set network_timeout")end elseif bH~=nil then return bh(bi,"options.network_timeout has to be of type number and greater than 0")end;local bI=by.absolute_timeout;if bI==nil then bI=30 end;if type(bI)=="number"and bI>0 then if not aU(bi,bI*1000)then return bh(bi,"failed to set absolute_timeout")end elseif bI~=nil then return bh(bi,"options.absolute_timeout has to be of type number and greater than 0")end;local bJ=bF~=nil and"application/json"or"text/plain"local bK;local bn=by.headers;if type(bn)=="table"then for b7,Z in pairs(bn)do b7=tostring(b7)Z=tostring(Z)local bL=r(b7)if bL=="content-type"then bJ=Z elseif bL=="authorization"then bK=true end;if not aA(bi,b7,Z)then return bh(bi,"failed to set header "..b7)end end elseif bn~=nil then return bh(bi,"options.headers has to be of type table")end;local bM=by.authorization;if type(bM)=="table"then if bK then return bh(bi,"Cannot set both options.authorization and the 'Authorization' header.")end;local bN,bO=bM[1],bM[2]local bP=k("Basic %s",u(k("%s:%s",tostring(bN),tostring(bO)),"base64"))if not aA(bi,"Authorization",bP)then return bh(bi,"failed to apply options.authorization")end elseif bM~=nil then return bh(bi,"options.authorization has to be of type table")end;local bQ=bF or by.body;if type(bQ)=="string"then local bR=s(bQ)if not aN(bi,bJ,n("unsigned char*",bQ),bR)then return bh(bi,"failed to set post body")end elseif bQ~=nil then return bh(bi,"options.body has to be of type string")end;local bS=by.params;if type(bS)=="table"then for b7,Z in pairs(bS)do b7=tostring(b7)if not aB(bi,b7,tostring(Z))then return bh(bi,"failed to set parameter "..b7)end end elseif bS~=nil then return bh(bi,"options.params has to be of type table")end;local bT=by.require_ssl;if type(bT)=="boolean"then if not aT(bi,bT==true)then return bh(bi,"failed to set require_ssl")end elseif bT~=nil then return bh(bi,"options.require_ssl has to be of type boolean")end;local bU=by.user_agent_info;if type(bU)=="string"then if not aS(bi,tostring(bU))then return bh(bi,"failed to set user_agent_info")end elseif bU~=nil then return bh(bi,"options.user_agent_info has to be of type string")end;local bV=by.cookie_container;if type(bV)=="table"then local a9=b1[bV]if a9~=nil and a9.m_hCookieContainer~=0 then if not aR(bi,a9.m_hCookieContainer)then return bh(bi,"failed to set user_agent_info")end else return bh(bi,"options.cookie_container has to a valid cookie container")end elseif bV~=nil then return bh(bi,"options.cookie_container has to a valid cookie container")end;local bW=aC;local bX=by.stream_response;if type(bX)=="boolean"then if bX then bW=aD;if bA==nil and bB==nil and bC==nil then return bh(bi,"a 'completed', 'headers_received' or 'data_received' callback is required")end else if bA==nil then return bh(bi,"'completed' callback has to be set for non-streamed requests")elseif bB~=nil or bC~=nil then return bh(bi,"non-streamed requests only support 'completed' callbacks")end end elseif bX~=nil then return bh(bi,"options.stream_response has to be of type boolean")end;if bB~=nil or bC~=nil then aZ[bi]=bB or false;if bB~=nil then if not aY then w(ae,bt)aY=true end end;b0[bi]=bC or false;if bC~=nil then if not a_ then w(af,bu)a_=true end end end;local bY=ak()if not bW(bi,bY)then aL(bi)if bA~=nil then bA(false,{status=0,status_message="Failed to send request"})end;return end;if by.priority=="defer"or by.priority=="prioritize"then local at=by.priority=="prioritize"and aF or aE;if not at(bi)then return bh(bi,"failed to set priority")end elseif by.priority~=nil then return bh(bi,"options.priority has to be 'defer' of 'prioritize'")end;aW[bi]=bA or false;if bA~=nil then v(bY[0],bo,ad)end end;local function bZ(b_)if b_~=nil and type(b_)~="boolean"then return error("allow_modification has to be of type boolean")end;local c0=aO(b_==true)if c0~=nil then local a9=aj(c0)q(a9,bf)local Q=setmetatable({},bb)b1[Q]=a9;return Q end end;local c1={request=bw,create_cookie_container=bZ}for bx in pairs(aa)do c1[bx]=function(...)return bw(bx,...)end end;return c1
end)()

rawset(_G, '__hvhgg_http', http)

boot('http ok')

local sha2 = (function()
    local a=false;local unpack,b,c,d,e,f,g,h,i,j,k,l,m,tonumber,type,n=table.unpack or unpack,table.concat,string.byte,string.char,string.rep,string.sub,string.gsub,string.gmatch,string.format,math.floor,math.ceil,math.min,math.max,tonumber,type,math.huge;local function o(p)local q,r,s,t=0,p,p;while true do q,t,r,s=q+1,r,r+r+1,s+s+q%2;if q>256 or r-(r-1)~=1 or s-(s-1)~=1 or r==s then return q,false elseif r==t then return q,true end end end;local u=2/3;local v=u*5>3 and u*4<3 and o(1.0)>=53;assert(v,"at least 53-bit floating point numbers are required")local w,x=o(1)local y=x and w==64;local z=x and w==32;assert(y or z or not x,"Lua integers must be either 32-bit or 64-bit")local A=true;local B;local C;local D;local E;local F;if A then E=bit;F="bit"local G,H=true,D;if G then D=H end;B=false;C=type(jit)=="table"and jit.arch or D and D.arch or nil else for I,J in ipairs(_VERSION=="Lua 5.2"and{"bit32","bit"}or{"bit","bit32"})do if type(_G[J])=="table"and _G[J].bxor then E=_G[J]F=J;break end end end;if a then print("Abilities:")print("   Lua version:               "..(A and"LuaJIT "..(B and"2.1 "or"2.0 ")..(C or"")..(D and" with FFI"or" without FFI")or _VERSION))print("   Integer bitwise operators: "..(y and"int64"or z and"int32"or"no"))print("   32-bit bitwise library:    "..(F or"not found"))end;local K,L;if A and D then K="Using 'ffi' library of LuaJIT"L="FFI"elseif A then K="Using special code for sandboxed LuaJIT (no FFI)"L="LJ"elseif y then K="Using native int64 bitwise operators"L="INT64"elseif z then K="Using native int32 bitwise operators"L="INT32"elseif F then K="Using '"..F.."' library"L="LIB32"else K="Emulating bitwise operators using look-up table"L="EMUL"end;if a then print("Implementation selected:")print("   "..K)end;local M,N,O,P,Q,R,S,T,U,V,W;if L=="FFI"or L=="LJ"or L=="LIB32"then M=E.band;N=E.bor;O=E.bxor;P=E.lshift;Q=E.rshift;R=E.rol or E.lrotate;S=E.ror or E.rrotate;T=E.bnot;U=E.tobit;V=E.tohex;assert(M and N and O and P and Q and R and S and T,"Library '"..F.."' is incomplete")W=O end;V=V or pcall(i,"%x",2^31)and function(u)return i("%08x",u%4294967296)end or function(u)return i("%08x",(u+2^31)%2^32-2^31)end;local function X(u,Y)return O(u,Y or 0xA5A5A5A5)%4294967296 end;local function Z()return{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}end;local _,a0,a1,a2,a3,a4,a5,a6;local a7,a8,a9,aa,ab,ac={},{},{},{},{},{}local ad={[224]={},[256]=aa}local ae,af={[384]={},[512]=a9},{[384]={},[512]=aa}local ag,ah={},{0x67452301,0xEFCDAB89,0x98BADCFE,0x10325476,0xC3D2E1F0}local ai={0,0,0,0,0,0,0,0,28,25,26,27,0,0,10,9,11,12,0,15,16,17,18,0,20,22,23,21}local aj,ak;local al={}local am,an,ao=al,al,{}local ap,aq,ar=4294967296,0,0;local as={{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16},{15,11,5,9,10,16,14,7,2,13,1,3,12,8,6,4},{12,9,13,1,6,3,16,14,11,15,4,7,8,2,10,5},{8,10,4,2,14,13,12,15,3,7,6,11,5,1,16,9},{10,1,6,8,3,5,11,16,15,2,12,13,7,9,4,14},{3,13,7,11,1,12,9,4,5,14,8,6,16,15,2,10},{13,6,2,16,15,14,5,11,1,8,7,4,10,3,9,12},{14,12,8,15,13,2,4,10,6,1,16,5,9,7,3,11},{7,16,15,10,12,4,1,9,13,3,14,8,2,5,11,6},{11,3,9,5,8,7,2,6,16,12,10,15,4,13,14,1}}as[11],as[12]=as[1],as[2]local at={1,3,4,11,13,10,12,6,1,3,4,11,13,10,2,7,5,8,14,15,16,9,2,7,5,8,14,15}local function au(av)local aw={}for I,ax in ipairs{1,9,13,17,18,21}do aw[ax]="<"..e(av,ax)end;return aw end;if L=="FFI"then local ay=D.new("int32_t[?]",80)an=ay;ao=D.new("int32_t[?]",16)at=D.new("uint8_t[?]",#at+1,0,unpack(at))for az=1,10 do as[az]=D.new("uint8_t[?]",#as[az]+1,0,unpack(as[az]))end;as[11],as[12]=as[1],as[2]function _(aA,aB,aC,ax)local aD,aE=ay,a8;for aF=aC,aC+ax-1,64 do for az=0,15 do aF=aF+4;local aG,E,aH,aI=c(aB,aF-3,aF)aD[az]=N(P(aG,24),P(E,16),P(aH,8),aI)end;for az=16,63 do local aG,E=aD[az-15],aD[az-2]aD[az]=U(O(S(aG,7),R(aG,14),Q(aG,3))+O(R(E,15),R(E,13),Q(E,10))+aD[az-7]+aD[az-16])end;local aG,E,aH,aI,aJ,aK,aL,aM=aA[1],aA[2],aA[3],aA[4],aA[5],aA[6],aA[7],aA[8]for az=0,63,8 do local aN=U(O(aL,M(aJ,O(aK,aL)))+O(S(aJ,6),S(aJ,11),R(aJ,7))+aD[az]+aE[az+1]+aM)aM,aL,aK,aJ=aL,aK,aJ,U(aI+aN)aI,aH,E,aG=aH,E,aG,U(O(M(aG,O(E,aH)),M(E,aH))+O(S(aG,2),S(aG,13),R(aG,10))+aN)aN=U(O(aL,M(aJ,O(aK,aL)))+O(S(aJ,6),S(aJ,11),R(aJ,7))+aD[az+1]+aE[az+2]+aM)aM,aL,aK,aJ=aL,aK,aJ,U(aI+aN)aI,aH,E,aG=aH,E,aG,U(O(M(aG,O(E,aH)),M(E,aH))+O(S(aG,2),S(aG,13),R(aG,10))+aN)aN=U(O(aL,M(aJ,O(aK,aL)))+O(S(aJ,6),S(aJ,11),R(aJ,7))+aD[az+2]+aE[az+3]+aM)aM,aL,aK,aJ=aL,aK,aJ,U(aI+aN)aI,aH,E,aG=aH,E,aG,U(O(M(aG,O(E,aH)),M(E,aH))+O(S(aG,2),S(aG,13),R(aG,10))+aN)aN=U(O(aL,M(aJ,O(aK,aL)))+O(S(aJ,6),S(aJ,11),R(aJ,7))+aD[az+3]+aE[az+4]+aM)aM,aL,aK,aJ=aL,aK,aJ,U(aI+aN)aI,aH,E,aG=aH,E,aG,U(O(M(aG,O(E,aH)),M(E,aH))+O(S(aG,2),S(aG,13),R(aG,10))+aN)aN=U(O(aL,M(aJ,O(aK,aL)))+O(S(aJ,6),S(aJ,11),R(aJ,7))+aD[az+4]+aE[az+5]+aM)aM,aL,aK,aJ=aL,aK,aJ,U(aI+aN)aI,aH,E,aG=aH,E,aG,U(O(M(aG,O(E,aH)),M(E,aH))+O(S(aG,2),S(aG,13),R(aG,10))+aN)aN=U(O(aL,M(aJ,O(aK,aL)))+O(S(aJ,6),S(aJ,11),R(aJ,7))+aD[az+5]+aE[az+6]+aM)aM,aL,aK,aJ=aL,aK,aJ,U(aI+aN)aI,aH,E,aG=aH,E,aG,U(O(M(aG,O(E,aH)),M(E,aH))+O(S(aG,2),S(aG,13),R(aG,10))+aN)aN=U(O(aL,M(aJ,O(aK,aL)))+O(S(aJ,6),S(aJ,11),R(aJ,7))+aD[az+6]+aE[az+7]+aM)aM,aL,aK,aJ=aL,aK,aJ,U(aI+aN)aI,aH,E,aG=aH,E,aG,U(O(M(aG,O(E,aH)),M(E,aH))+O(S(aG,2),S(aG,13),R(aG,10))+aN)aN=U(O(aL,M(aJ,O(aK,aL)))+O(S(aJ,6),S(aJ,11),R(aJ,7))+aD[az+7]+aE[az+8]+aM)aM,aL,aK,aJ=aL,aK,aJ,U(aI+aN)aI,aH,E,aG=aH,E,aG,U(O(M(aG,O(E,aH)),M(E,aH))+O(S(aG,2),S(aG,13),R(aG,10))+aN)end;aA[1],aA[2],aA[3],aA[4]=U(aG+aA[1]),U(E+aA[2]),U(aH+aA[3]),U(aI+aA[4])aA[5],aA[6],aA[7],aA[8]=U(aJ+aA[5]),U(aK+aA[6]),U(aL+aA[7]),U(aM+aA[8])end end;local aO=D.new("int64_t[?]",80)am=aO;local aP=D.typeof"int64_t"local aQ=D.typeof"int32_t"local aR=D.typeof"uint32_t"aq=aP(2^32)if B then local aS,aT,aU,aV,aW,aX,aY,aZ=M,N,O,T,P,Q,R,S;aj=V;do local a_=D.new("int64_t[?]",16)local aD=am;local function b0(aG,E,aH,aI,b1,b2)local b3,b4,b5,b6=a_[aG],a_[E],a_[aH],a_[aI]b3=aD[b1]+b3+b4;b6=aZ(aU(b6,b3),32)b5=b5+b6;b4=aZ(aU(b4,b5),24)b3=aD[b2]+b3+b4;b6=aZ(aU(b6,b3),16)b5=b5+b6;b4=aY(aU(b4,b5),1)a_[aG],a_[E],a_[aH],a_[aI]=b3,b4,b5,b6 end;function a5(aA,I,aB,aC,ax,b7,b8,b9)local ba,bb,bc,bd,be,bf,bg,bh=aA[1],aA[2],aA[3],aA[4],aA[5],aA[6],aA[7],aA[8]for aF=aC,aC+ax-1,128 do if aB then for az=1,16 do aF=aF+8;local aG,E,aH,aI,aJ,aK,aL,aM=c(aB,aF-7,aF)aD[az]=aU(N(P(aM,24),P(aL,16),P(aK,8),aJ)*aP(2^32),aR(aQ(N(P(aI,24),P(aH,16),P(E,8),aG))))end end;a_[0x0],a_[0x1],a_[0x2],a_[0x3],a_[0x4],a_[0x5],a_[0x6],a_[0x7]=ba,bb,bc,bd,be,bf,bg,bh;a_[0x8],a_[0x9],a_[0xA],a_[0xB],a_[0xD],a_[0xE],a_[0xF]=a9[1],a9[2],a9[3],a9[4],a9[6],a9[7],a9[8]b7=b7+(b8 or 128)a_[0xC]=aU(a9[5],b7)if b8 then a_[0xE]=aV(a_[0xE])end;if b9 then a_[0xF]=aV(a_[0xF])end;for az=1,12 do local bi=as[az]b0(0,4,8,12,bi[1],bi[2])b0(1,5,9,13,bi[3],bi[4])b0(2,6,10,14,bi[5],bi[6])b0(3,7,11,15,bi[7],bi[8])b0(0,5,10,15,bi[9],bi[10])b0(1,6,11,12,bi[11],bi[12])b0(2,7,8,13,bi[13],bi[14])b0(3,4,9,14,bi[15],bi[16])end;ba=aU(ba,a_[0x0],a_[0x8])bb=aU(bb,a_[0x1],a_[0x9])bc=aU(bc,a_[0x2],a_[0xA])bd=aU(bd,a_[0x3],a_[0xB])be=aU(be,a_[0x4],a_[0xC])bf=aU(bf,a_[0x5],a_[0xD])bg=aU(bg,a_[0x6],a_[0xE])bh=aU(bh,a_[0x7],a_[0xF])end;aA[1],aA[2],aA[3],aA[4],aA[5],aA[6],aA[7],aA[8]=ba,bb,bc,bd,be,bf,bg,bh;return b7 end end;local bj=D.typeof"int64_t[?]"ak=0;ar=aP(2^32)function Z()return bj(30)end;function a3(bk,I,aB,aC,ax,bl)local bm=ab;local bn=Q(bl,3)for aF=aC,aC+ax-1,bl do for az=0,bn-1 do aF=aF+8;local aM,aL,aK,aJ,aI,aH,E,aG=c(aB,aF-7,aF)bk[az]=aU(bk[az],aT(N(P(aG,24),P(E,16),P(aH,8),aI)*aP(2^32),aR(aQ(N(P(aJ,24),P(aK,16),P(aL,8),aM)))))end;for bo=1,24 do for az=0,4 do bk[25+az]=aU(bk[az],bk[az+5],bk[az+10],bk[az+15],bk[az+20])end;local bp=aU(bk[25],aY(bk[27],1))bk[1],bk[6],bk[11],bk[16]=aY(aU(bp,bk[6]),44),aY(aU(bp,bk[16]),45),aY(aU(bp,bk[1]),1),aY(aU(bp,bk[11]),10)bk[21]=aY(aU(bp,bk[21]),2)bp=aU(bk[26],aY(bk[28],1))bk[2],bk[7],bk[12],bk[22]=aY(aU(bp,bk[12]),43),aY(aU(bp,bk[22]),61),aY(aU(bp,bk[7]),6),aY(aU(bp,bk[2]),62)bk[17]=aY(aU(bp,bk[17]),15)bp=aU(bk[27],aY(bk[29],1))bk[3],bk[8],bk[18],bk[23]=aY(aU(bp,bk[18]),21),aY(aU(bp,bk[3]),28),aY(aU(bp,bk[23]),56),aY(aU(bp,bk[8]),55)bk[13]=aY(aU(bp,bk[13]),25)bp=aU(bk[28],aY(bk[25],1))bk[4],bk[14],bk[19],bk[24]=aY(aU(bp,bk[24]),14),aY(aU(bp,bk[19]),8),aY(aU(bp,bk[4]),27),aY(aU(bp,bk[14]),39)bk[9]=aY(aU(bp,bk[9]),20)bp=aU(bk[29],aY(bk[26],1))bk[5],bk[10],bk[15],bk[20]=aY(aU(bp,bk[10]),3),aY(aU(bp,bk[20]),18),aY(aU(bp,bk[5]),36),aY(aU(bp,bk[15]),41)bk[0]=aU(bp,bk[0])bk[0],bk[1],bk[2],bk[3],bk[4]=aU(bk[0],aS(aV(bk[1]),bk[2]),bm[bo]),aU(bk[1],aS(aV(bk[2]),bk[3])),aU(bk[2],aS(aV(bk[3]),bk[4])),aU(bk[3],aS(aV(bk[4]),bk[0])),aU(bk[4],aS(aV(bk[0]),bk[1]))bk[5],bk[6],bk[7],bk[8],bk[9]=aU(bk[8],aS(aV(bk[9]),bk[5])),aU(bk[9],aS(aV(bk[5]),bk[6])),aU(bk[5],aS(aV(bk[6]),bk[7])),aU(bk[6],aS(aV(bk[7]),bk[8])),aU(bk[7],aS(aV(bk[8]),bk[9]))bk[10],bk[11],bk[12],bk[13],bk[14]=aU(bk[11],aS(aV(bk[12]),bk[13])),aU(bk[12],aS(aV(bk[13]),bk[14])),aU(bk[13],aS(aV(bk[14]),bk[10])),aU(bk[14],aS(aV(bk[10]),bk[11])),aU(bk[10],aS(aV(bk[11]),bk[12]))bk[15],bk[16],bk[17],bk[18],bk[19]=aU(bk[19],aS(aV(bk[15]),bk[16])),aU(bk[15],aS(aV(bk[16]),bk[17])),aU(bk[16],aS(aV(bk[17]),bk[18])),aU(bk[17],aS(aV(bk[18]),bk[19])),aU(bk[18],aS(aV(bk[19]),bk[15]))bk[20],bk[21],bk[22],bk[23],bk[24]=aU(bk[22],aS(aV(bk[23]),bk[24])),aU(bk[23],aS(aV(bk[24]),bk[20])),aU(bk[24],aS(aV(bk[20]),bk[21])),aU(bk[20],aS(aV(bk[21]),bk[22])),aU(bk[21],aS(aV(bk[22]),bk[23]))end end end;local bq=0xA5A5A5A5*aP(2^32+1)function X(br,bs)return aU(br,bs or bq)end;function a0(aA,I,aB,aC,ax)local aD,aE=aO,a7;for aF=aC,aC+ax-1,128 do for az=0,15 do aF=aF+8;local aG,E,aH,aI,aJ,aK,aL,aM=c(aB,aF-7,aF)aD[az]=aT(N(P(aG,24),P(E,16),P(aH,8),aI)*aP(2^32),aR(aQ(N(P(aJ,24),P(aK,16),P(aL,8),aM))))end;for az=16,79 do local aG,E=aD[az-15],aD[az-2]aD[az]=aU(aZ(aG,1),aZ(aG,8),aX(aG,7))+aU(aZ(E,19),aY(E,3),aX(E,6))+aD[az-7]+aD[az-16]end;local aG,E,aH,aI,aJ,aK,aL,aM=aA[1],aA[2],aA[3],aA[4],aA[5],aA[6],aA[7],aA[8]for az=0,79,8 do local aN=aU(aZ(aJ,14),aZ(aJ,18),aY(aJ,23))+aU(aL,aS(aJ,aU(aK,aL)))+aM+aE[az+1]+aD[az]aM,aL,aK,aJ=aL,aK,aJ,aN+aI;aI,aH,E,aG=aH,E,aG,aU(aS(aU(aG,E),aH),aS(aG,E))+aU(aZ(aG,28),aY(aG,25),aY(aG,30))+aN;aN=aU(aZ(aJ,14),aZ(aJ,18),aY(aJ,23))+aU(aL,aS(aJ,aU(aK,aL)))+aM+aE[az+2]+aD[az+1]aM,aL,aK,aJ=aL,aK,aJ,aN+aI;aI,aH,E,aG=aH,E,aG,aU(aS(aU(aG,E),aH),aS(aG,E))+aU(aZ(aG,28),aY(aG,25),aY(aG,30))+aN;aN=aU(aZ(aJ,14),aZ(aJ,18),aY(aJ,23))+aU(aL,aS(aJ,aU(aK,aL)))+aM+aE[az+3]+aD[az+2]aM,aL,aK,aJ=aL,aK,aJ,aN+aI;aI,aH,E,aG=aH,E,aG,aU(aS(aU(aG,E),aH),aS(aG,E))+aU(aZ(aG,28),aY(aG,25),aY(aG,30))+aN;aN=aU(aZ(aJ,14),aZ(aJ,18),aY(aJ,23))+aU(aL,aS(aJ,aU(aK,aL)))+aM+aE[az+4]+aD[az+3]aM,aL,aK,aJ=aL,aK,aJ,aN+aI;aI,aH,E,aG=aH,E,aG,aU(aS(aU(aG,E),aH),aS(aG,E))+aU(aZ(aG,28),aY(aG,25),aY(aG,30))+aN;aN=aU(aZ(aJ,14),aZ(aJ,18),aY(aJ,23))+aU(aL,aS(aJ,aU(aK,aL)))+aM+aE[az+5]+aD[az+4]aM,aL,aK,aJ=aL,aK,aJ,aN+aI;aI,aH,E,aG=aH,E,aG,aU(aS(aU(aG,E),aH),aS(aG,E))+aU(aZ(aG,28),aY(aG,25),aY(aG,30))+aN;aN=aU(aZ(aJ,14),aZ(aJ,18),aY(aJ,23))+aU(aL,aS(aJ,aU(aK,aL)))+aM+aE[az+6]+aD[az+5]aM,aL,aK,aJ=aL,aK,aJ,aN+aI;aI,aH,E,aG=aH,E,aG,aU(aS(aU(aG,E),aH),aS(aG,E))+aU(aZ(aG,28),aY(aG,25),aY(aG,30))+aN;aN=aU(aZ(aJ,14),aZ(aJ,18),aY(aJ,23))+aU(aL,aS(aJ,aU(aK,aL)))+aM+aE[az+7]+aD[az+6]aM,aL,aK,aJ=aL,aK,aJ,aN+aI;aI,aH,E,aG=aH,E,aG,aU(aS(aU(aG,E),aH),aS(aG,E))+aU(aZ(aG,28),aY(aG,25),aY(aG,30))+aN;aN=aU(aZ(aJ,14),aZ(aJ,18),aY(aJ,23))+aU(aL,aS(aJ,aU(aK,aL)))+aM+aE[az+8]+aD[az+7]aM,aL,aK,aJ=aL,aK,aJ,aN+aI;aI,aH,E,aG=aH,E,aG,aU(aS(aU(aG,E),aH),aS(aG,E))+aU(aZ(aG,28),aY(aG,25),aY(aG,30))+aN end;aA[1]=aG+aA[1]aA[2]=E+aA[2]aA[3]=aH+aA[3]aA[4]=aI+aA[4]aA[5]=aJ+aA[5]aA[6]=aK+aA[6]aA[7]=aL+aA[7]aA[8]=aM+aA[8]end end else local bt=D.new("union{int64_t i64; struct{int32_t "..(D.abi("le")and"lo, hi"or"hi, lo")..";} i32;}[3]")local function bu(aG)bt[0].i64=aG;local bv,bw=bt[0].i32.lo,bt[0].i32.hi;local bx=O(Q(bv,1),P(bw,31),Q(bv,8),P(bw,24),Q(bv,7),P(bw,25))local by=O(Q(bw,1),P(bv,31),Q(bw,8),P(bv,24),Q(bw,7))return by*aP(2^32)+aR(aQ(bx))end;local function bz(E)bt[0].i64=E;local bA,bB=bt[0].i32.lo,bt[0].i32.hi;local bC=O(Q(bA,19),P(bB,13),P(bA,3),Q(bB,29),Q(bA,6),P(bB,26))local bD=O(Q(bB,19),P(bA,13),P(bB,3),Q(bA,29),Q(bB,6))return bD*aP(2^32)+aR(aQ(bC))end;local function bE(aJ)bt[0].i64=aJ;local bF,bG=bt[0].i32.lo,bt[0].i32.hi;local bC=O(Q(bF,14),P(bG,18),Q(bF,18),P(bG,14),P(bF,23),Q(bG,9))local bD=O(Q(bG,14),P(bF,18),Q(bG,18),P(bF,14),P(bG,23),Q(bF,9))return bD*aP(2^32)+aR(aQ(bC))end;local function bH(aG)bt[0].i64=aG;local bA,bB=bt[0].i32.lo,bt[0].i32.hi;local bC=O(Q(bA,28),P(bB,4),P(bA,30),Q(bB,2),P(bA,25),Q(bB,7))local bD=O(Q(bB,28),P(bA,4),P(bB,30),Q(bA,2),P(bB,25),Q(bA,7))return bD*aP(2^32)+aR(aQ(bC))end;local function bI(aJ,aK,aL)bt[0].i64=aK;bt[1].i64=aL;bt[2].i64=aJ;local bJ,bK=bt[0].i32.lo,bt[0].i32.hi;local bL,bM=bt[1].i32.lo,bt[1].i32.hi;local bF,bG=bt[2].i32.lo,bt[2].i32.hi;local bN=O(bL,M(bF,O(bJ,bL)))local bO=O(bM,M(bG,O(bK,bM)))return bO*aP(2^32)+aR(aQ(bN))end;local function bP(aG,E,aH)bt[0].i64=aG;bt[1].i64=E;bt[2].i64=aH;local bv,bw=bt[0].i32.lo,bt[0].i32.hi;local bA,bB=bt[1].i32.lo,bt[1].i32.hi;local bQ,bR=bt[2].i32.lo,bt[2].i32.hi;local bN=O(M(O(bv,bA),bQ),M(bv,bA))local bO=O(M(O(bw,bB),bR),M(bw,bB))return bO*aP(2^32)+aR(aQ(bN))end;local function bS(aG,E,s)bt[0].i64=aG;bt[1].i64=E;local bv,bw=bt[0].i32.lo,bt[0].i32.hi;local bA,bB=bt[1].i32.lo,bt[1].i32.hi;local bQ,bR=O(bv,bA),O(bw,bB)local bx=O(Q(bQ,s),P(bR,-s))local by=O(Q(bR,s),P(bQ,-s))return by*aP(2^32)+aR(aQ(bx))end;local function bT(aG,E)bt[0].i64=aG;bt[1].i64=E;local bv,bw=bt[0].i32.lo,bt[0].i32.hi;local bA,bB=bt[1].i32.lo,bt[1].i32.hi;local bQ,bR=O(bv,bA),O(bw,bB)local bx=O(P(bQ,1),Q(bR,31))local by=O(P(bR,1),Q(bQ,31))return by*aP(2^32)+aR(aQ(bx))end;local function bU(aG,E)bt[0].i64=aG;bt[1].i64=E;local bv,bw=bt[0].i32.lo,bt[0].i32.hi;local bA,bB=bt[1].i32.lo,bt[1].i32.hi;local by,bx=O(bv,bA),O(bw,bB)return by*aP(2^32)+aR(aQ(bx))end;local function aU(aG,E)bt[0].i64=aG;bt[1].i64=E;local bv,bw=bt[0].i32.lo,bt[0].i32.hi;local bA,bB=bt[1].i32.lo,bt[1].i32.hi;local bx,by=O(bv,bA),O(bw,bB)return by*aP(2^32)+aR(aQ(bx))end;local function bV(aG,E,aH)bt[0].i64=aG;bt[1].i64=E;bt[2].i64=aH;local bv,bw=bt[0].i32.lo,bt[0].i32.hi;local bA,bB=bt[1].i32.lo,bt[1].i32.hi;local bQ,bR=bt[2].i32.lo,bt[2].i32.hi;local bx,by=O(bv,bA,bQ),O(bw,bB,bR)return by*aP(2^32)+aR(aQ(bx))end;function X(br,bs)bt[0].i64=br;local bW,bX=bt[0].i32.lo,bt[0].i32.hi;local bY,bZ=0xA5A5A5A5,0xA5A5A5A5;if bs then bt[1].i64=bs;bY,bZ=bt[1].i32.lo,bt[1].i32.hi end;bW=O(bW,bY)bX=O(bX,bZ)return bX*aP(2^32)+aR(aQ(bW))end;function aj(br)bt[0].i64=br;return V(bt[0].i32.hi)..V(bt[0].i32.lo)end;function a0(aA,I,aB,aC,ax)local aD,aE=aO,a7;for aF=aC,aC+ax-1,128 do for az=0,15 do aF=aF+8;local aG,E,aH,aI,aJ,aK,aL,aM=c(aB,aF-7,aF)aD[az]=N(P(aG,24),P(E,16),P(aH,8),aI)*aP(2^32)+aR(aQ(N(P(aJ,24),P(aK,16),P(aL,8),aM)))end;for az=16,79 do aD[az]=bu(aD[az-15])+bz(aD[az-2])+aD[az-7]+aD[az-16]end;local aG,E,aH,aI,aJ,aK,aL,aM=aA[1],aA[2],aA[3],aA[4],aA[5],aA[6],aA[7],aA[8]for az=0,79,8 do local aN=bE(aJ)+bI(aJ,aK,aL)+aM+aE[az+1]+aD[az]aM,aL,aK,aJ=aL,aK,aJ,aN+aI;aI,aH,E,aG=aH,E,aG,bP(aG,E,aH)+bH(aG)+aN;aN=bE(aJ)+bI(aJ,aK,aL)+aM+aE[az+2]+aD[az+1]aM,aL,aK,aJ=aL,aK,aJ,aN+aI;aI,aH,E,aG=aH,E,aG,bP(aG,E,aH)+bH(aG)+aN;aN=bE(aJ)+bI(aJ,aK,aL)+aM+aE[az+3]+aD[az+2]aM,aL,aK,aJ=aL,aK,aJ,aN+aI;aI,aH,E,aG=aH,E,aG,bP(aG,E,aH)+bH(aG)+aN;aN=bE(aJ)+bI(aJ,aK,aL)+aM+aE[az+4]+aD[az+3]aM,aL,aK,aJ=aL,aK,aJ,aN+aI;aI,aH,E,aG=aH,E,aG,bP(aG,E,aH)+bH(aG)+aN;aN=bE(aJ)+bI(aJ,aK,aL)+aM+aE[az+5]+aD[az+4]aM,aL,aK,aJ=aL,aK,aJ,aN+aI;aI,aH,E,aG=aH,E,aG,bP(aG,E,aH)+bH(aG)+aN;aN=bE(aJ)+bI(aJ,aK,aL)+aM+aE[az+6]+aD[az+5]aM,aL,aK,aJ=aL,aK,aJ,aN+aI;aI,aH,E,aG=aH,E,aG,bP(aG,E,aH)+bH(aG)+aN;aN=bE(aJ)+bI(aJ,aK,aL)+aM+aE[az+7]+aD[az+6]aM,aL,aK,aJ=aL,aK,aJ,aN+aI;aI,aH,E,aG=aH,E,aG,bP(aG,E,aH)+bH(aG)+aN;aN=bE(aJ)+bI(aJ,aK,aL)+aM+aE[az+8]+aD[az+7]aM,aL,aK,aJ=aL,aK,aJ,aN+aI;aI,aH,E,aG=aH,E,aG,bP(aG,E,aH)+bH(aG)+aN end;aA[1]=aG+aA[1]aA[2]=E+aA[2]aA[3]=aH+aA[3]aA[4]=aI+aA[4]aA[5]=aJ+aA[5]aA[6]=aK+aA[6]aA[7]=aL+aA[7]aA[8]=aM+aA[8]end end;do local a_=D.new("int64_t[?]",16)local aD=am;local function b0(aG,E,aH,aI,b1,b2)local b3,b4,b5,b6=a_[aG],a_[E],a_[aH],a_[aI]b3=aD[b1]+b3+b4;b6=bU(b6,b3)b5=b5+b6;b4=bS(b4,b5,24)b3=aD[b2]+b3+b4;b6=bS(b6,b3,16)b5=b5+b6;b4=bT(b4,b5)a_[aG],a_[E],a_[aH],a_[aI]=b3,b4,b5,b6 end;function a5(aA,I,aB,aC,ax,b7,b8,b9)local ba,bb,bc,bd,be,bf,bg,bh=aA[1],aA[2],aA[3],aA[4],aA[5],aA[6],aA[7],aA[8]for aF=aC,aC+ax-1,128 do if aB then for az=1,16 do aF=aF+8;local aG,E,aH,aI,aJ,aK,aL,aM=c(aB,aF-7,aF)aD[az]=aU(N(P(aM,24),P(aL,16),P(aK,8),aJ)*aP(2^32),aR(aQ(N(P(aI,24),P(aH,16),P(E,8),aG))))end end;a_[0x0],a_[0x1],a_[0x2],a_[0x3],a_[0x4],a_[0x5],a_[0x6],a_[0x7]=ba,bb,bc,bd,be,bf,bg,bh;a_[0x8],a_[0x9],a_[0xA],a_[0xB],a_[0xD],a_[0xE],a_[0xF]=a9[1],a9[2],a9[3],a9[4],a9[6],a9[7],a9[8]b7=b7+(b8 or 128)a_[0xC]=aU(a9[5],b7)if b8 then a_[0xE]=-1-a_[0xE]end;if b9 then a_[0xF]=-1-a_[0xF]end;for az=1,12 do local bi=as[az]b0(0,4,8,12,bi[1],bi[2])b0(1,5,9,13,bi[3],bi[4])b0(2,6,10,14,bi[5],bi[6])b0(3,7,11,15,bi[7],bi[8])b0(0,5,10,15,bi[9],bi[10])b0(1,6,11,12,bi[11],bi[12])b0(2,7,8,13,bi[13],bi[14])b0(3,4,9,14,bi[15],bi[16])end;ba=bV(ba,a_[0x0],a_[0x8])bb=bV(bb,a_[0x1],a_[0x9])bc=bV(bc,a_[0x2],a_[0xA])bd=bV(bd,a_[0x3],a_[0xB])be=bV(be,a_[0x4],a_[0xC])bf=bV(bf,a_[0x5],a_[0xD])bg=bV(bg,a_[0x6],a_[0xE])bh=bV(bh,a_[0x7],a_[0xF])end;aA[1],aA[2],aA[3],aA[4],aA[5],aA[6],aA[7],aA[8]=ba,bb,bc,bd,be,bf,bg,bh;return b7 end end end;function a1(aA,aB,aC,ax)local aD,aE=ay,ag;for aF=aC,aC+ax-1,64 do for az=0,15 do aF=aF+4;local aG,E,aH,aI=c(aB,aF-3,aF)aD[az]=N(P(aI,24),P(aH,16),P(E,8),aG)end;local aG,E,aH,aI=aA[1],aA[2],aA[3],aA[4]for az=0,15,4 do aG,aI,aH,E=aI,aH,E,U(R(O(aI,M(E,O(aH,aI)))+aE[az+1]+aD[az]+aG,7)+E)aG,aI,aH,E=aI,aH,E,U(R(O(aI,M(E,O(aH,aI)))+aE[az+2]+aD[az+1]+aG,12)+E)aG,aI,aH,E=aI,aH,E,U(R(O(aI,M(E,O(aH,aI)))+aE[az+3]+aD[az+2]+aG,17)+E)aG,aI,aH,E=aI,aH,E,U(R(O(aI,M(E,O(aH,aI)))+aE[az+4]+aD[az+3]+aG,22)+E)end;for az=16,31,4 do local aL=5*az;aG,aI,aH,E=aI,aH,E,U(R(O(aH,M(aI,O(E,aH)))+aE[az+1]+aD[M(aL+1,15)]+aG,5)+E)aG,aI,aH,E=aI,aH,E,U(R(O(aH,M(aI,O(E,aH)))+aE[az+2]+aD[M(aL+6,15)]+aG,9)+E)aG,aI,aH,E=aI,aH,E,U(R(O(aH,M(aI,O(E,aH)))+aE[az+3]+aD[M(aL-5,15)]+aG,14)+E)aG,aI,aH,E=aI,aH,E,U(R(O(aH,M(aI,O(E,aH)))+aE[az+4]+aD[M(aL,15)]+aG,20)+E)end;for az=32,47,4 do local aL=3*az;aG,aI,aH,E=aI,aH,E,U(R(O(E,aH,aI)+aE[az+1]+aD[M(aL+5,15)]+aG,4)+E)aG,aI,aH,E=aI,aH,E,U(R(O(E,aH,aI)+aE[az+2]+aD[M(aL+8,15)]+aG,11)+E)aG,aI,aH,E=aI,aH,E,U(R(O(E,aH,aI)+aE[az+3]+aD[M(aL-5,15)]+aG,16)+E)aG,aI,aH,E=aI,aH,E,U(R(O(E,aH,aI)+aE[az+4]+aD[M(aL-2,15)]+aG,23)+E)end;for az=48,63,4 do local aL=7*az;aG,aI,aH,E=aI,aH,E,U(R(O(aH,N(E,T(aI)))+aE[az+1]+aD[M(aL,15)]+aG,6)+E)aG,aI,aH,E=aI,aH,E,U(R(O(aH,N(E,T(aI)))+aE[az+2]+aD[M(aL+7,15)]+aG,10)+E)aG,aI,aH,E=aI,aH,E,U(R(O(aH,N(E,T(aI)))+aE[az+3]+aD[M(aL-2,15)]+aG,15)+E)aG,aI,aH,E=aI,aH,E,U(R(O(aH,N(E,T(aI)))+aE[az+4]+aD[M(aL+5,15)]+aG,21)+E)end;aA[1],aA[2],aA[3],aA[4]=U(aG+aA[1]),U(E+aA[2]),U(aH+aA[3]),U(aI+aA[4])end end;function a2(aA,aB,aC,ax)local aD=ay;for aF=aC,aC+ax-1,64 do for az=0,15 do aF=aF+4;local aG,E,aH,aI=c(aB,aF-3,aF)aD[az]=N(P(aG,24),P(E,16),P(aH,8),aI)end;for az=16,79 do aD[az]=R(O(aD[az-3],aD[az-8],aD[az-14],aD[az-16]),1)end;local aG,E,aH,aI,aJ=aA[1],aA[2],aA[3],aA[4],aA[5]for az=0,19,5 do aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(aI,M(E,O(aI,aH)))+aD[az]+0x5A827999+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(aI,M(E,O(aI,aH)))+aD[az+1]+0x5A827999+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(aI,M(E,O(aI,aH)))+aD[az+2]+0x5A827999+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(aI,M(E,O(aI,aH)))+aD[az+3]+0x5A827999+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(aI,M(E,O(aI,aH)))+aD[az+4]+0x5A827999+aJ)end;for az=20,39,5 do aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(E,aH,aI)+aD[az]+0x6ED9EBA1+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(E,aH,aI)+aD[az+1]+0x6ED9EBA1+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(E,aH,aI)+aD[az+2]+0x6ED9EBA1+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(E,aH,aI)+aD[az+3]+0x6ED9EBA1+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(E,aH,aI)+aD[az+4]+0x6ED9EBA1+aJ)end;for az=40,59,5 do aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(M(aI,O(E,aH)),M(E,aH))+aD[az]+0x8F1BBCDC+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(M(aI,O(E,aH)),M(E,aH))+aD[az+1]+0x8F1BBCDC+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(M(aI,O(E,aH)),M(E,aH))+aD[az+2]+0x8F1BBCDC+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(M(aI,O(E,aH)),M(E,aH))+aD[az+3]+0x8F1BBCDC+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(M(aI,O(E,aH)),M(E,aH))+aD[az+4]+0x8F1BBCDC+aJ)end;for az=60,79,5 do aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(E,aH,aI)+aD[az]+0xCA62C1D6+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(E,aH,aI)+aD[az+1]+0xCA62C1D6+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(E,aH,aI)+aD[az+2]+0xCA62C1D6+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(E,aH,aI)+aD[az+3]+0xCA62C1D6+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(E,aH,aI)+aD[az+4]+0xCA62C1D6+aJ)end;aA[1],aA[2],aA[3],aA[4],aA[5]=U(aG+aA[1]),U(E+aA[2]),U(aH+aA[3]),U(aI+aA[4]),U(aJ+aA[5])end end end;if L=="FFI"and not B or L=="LJ"then if L=="FFI"then local b_=D.typeof"int32_t[?]"function Z()return b_(31)end end;function a3(c0,c1,aB,aC,ax,bl)local c2,c3=ab,ac;local bn=Q(bl,3)for aF=aC,aC+ax-1,bl do for az=1,bn do local aG,E,aH,aI=c(aB,aF+1,aF+4)c0[az]=O(c0[az],N(P(aI,24),P(aH,16),P(E,8),aG))aF=aF+8;aG,E,aH,aI=c(aB,aF-3,aF)c1[az]=O(c1[az],N(P(aI,24),P(aH,16),P(E,8),aG))end;for bo=1,24 do for az=1,5 do c0[25+az]=O(c0[az],c0[az+5],c0[az+10],c0[az+15],c0[az+20])end;for az=1,5 do c1[25+az]=O(c1[az],c1[az+5],c1[az+10],c1[az+15],c1[az+20])end;local c4=O(c0[26],P(c0[28],1),Q(c1[28],31))local c5=O(c1[26],P(c1[28],1),Q(c0[28],31))c0[2],c1[2],c0[7],c1[7],c0[12],c1[12],c0[17],c1[17]=O(Q(O(c4,c0[7]),20),P(O(c5,c1[7]),12)),O(Q(O(c5,c1[7]),20),P(O(c4,c0[7]),12)),O(Q(O(c4,c0[17]),19),P(O(c5,c1[17]),13)),O(Q(O(c5,c1[17]),19),P(O(c4,c0[17]),13)),O(P(O(c4,c0[2]),1),Q(O(c5,c1[2]),31)),O(P(O(c5,c1[2]),1),Q(O(c4,c0[2]),31)),O(P(O(c4,c0[12]),10),Q(O(c5,c1[12]),22)),O(P(O(c5,c1[12]),10),Q(O(c4,c0[12]),22))local c6,aA=O(c4,c0[22]),O(c5,c1[22])c0[22],c1[22]=O(P(c6,2),Q(aA,30)),O(P(aA,2),Q(c6,30))c4=O(c0[27],P(c0[29],1),Q(c1[29],31))c5=O(c1[27],P(c1[29],1),Q(c0[29],31))c0[3],c1[3],c0[8],c1[8],c0[13],c1[13],c0[23],c1[23]=O(Q(O(c4,c0[13]),21),P(O(c5,c1[13]),11)),O(Q(O(c5,c1[13]),21),P(O(c4,c0[13]),11)),O(Q(O(c4,c0[23]),3),P(O(c5,c1[23]),29)),O(Q(O(c5,c1[23]),3),P(O(c4,c0[23]),29)),O(P(O(c4,c0[8]),6),Q(O(c5,c1[8]),26)),O(P(O(c5,c1[8]),6),Q(O(c4,c0[8]),26)),O(Q(O(c4,c0[3]),2),P(O(c5,c1[3]),30)),O(Q(O(c5,c1[3]),2),P(O(c4,c0[3]),30))c6,aA=O(c4,c0[18]),O(c5,c1[18])c0[18],c1[18]=O(P(c6,15),Q(aA,17)),O(P(aA,15),Q(c6,17))c4=O(c0[28],P(c0[30],1),Q(c1[30],31))c5=O(c1[28],P(c1[30],1),Q(c0[30],31))c0[4],c1[4],c0[9],c1[9],c0[19],c1[19],c0[24],c1[24]=O(P(O(c4,c0[19]),21),Q(O(c5,c1[19]),11)),O(P(O(c5,c1[19]),21),Q(O(c4,c0[19]),11)),O(P(O(c4,c0[4]),28),Q(O(c5,c1[4]),4)),O(P(O(c5,c1[4]),28),Q(O(c4,c0[4]),4)),O(Q(O(c4,c0[24]),8),P(O(c5,c1[24]),24)),O(Q(O(c5,c1[24]),8),P(O(c4,c0[24]),24)),O(Q(O(c4,c0[9]),9),P(O(c5,c1[9]),23)),O(Q(O(c5,c1[9]),9),P(O(c4,c0[9]),23))c6,aA=O(c4,c0[14]),O(c5,c1[14])c0[14],c1[14]=O(P(c6,25),Q(aA,7)),O(P(aA,25),Q(c6,7))c4=O(c0[29],P(c0[26],1),Q(c1[26],31))c5=O(c1[29],P(c1[26],1),Q(c0[26],31))c0[5],c1[5],c0[15],c1[15],c0[20],c1[20],c0[25],c1[25]=O(P(O(c4,c0[25]),14),Q(O(c5,c1[25]),18)),O(P(O(c5,c1[25]),14),Q(O(c4,c0[25]),18)),O(P(O(c4,c0[20]),8),Q(O(c5,c1[20]),24)),O(P(O(c5,c1[20]),8),Q(O(c4,c0[20]),24)),O(P(O(c4,c0[5]),27),Q(O(c5,c1[5]),5)),O(P(O(c5,c1[5]),27),Q(O(c4,c0[5]),5)),O(Q(O(c4,c0[15]),25),P(O(c5,c1[15]),7)),O(Q(O(c5,c1[15]),25),P(O(c4,c0[15]),7))c6,aA=O(c4,c0[10]),O(c5,c1[10])c0[10],c1[10]=O(P(c6,20),Q(aA,12)),O(P(aA,20),Q(c6,12))c4=O(c0[30],P(c0[27],1),Q(c1[27],31))c5=O(c1[30],P(c1[27],1),Q(c0[27],31))c0[6],c1[6],c0[11],c1[11],c0[16],c1[16],c0[21],c1[21]=O(P(O(c4,c0[11]),3),Q(O(c5,c1[11]),29)),O(P(O(c5,c1[11]),3),Q(O(c4,c0[11]),29)),O(P(O(c4,c0[21]),18),Q(O(c5,c1[21]),14)),O(P(O(c5,c1[21]),18),Q(O(c4,c0[21]),14)),O(Q(O(c4,c0[6]),28),P(O(c5,c1[6]),4)),O(Q(O(c5,c1[6]),28),P(O(c4,c0[6]),4)),O(Q(O(c4,c0[16]),23),P(O(c5,c1[16]),9)),O(Q(O(c5,c1[16]),23),P(O(c4,c0[16]),9))c0[1],c1[1]=O(c4,c0[1]),O(c5,c1[1])c0[1],c0[2],c0[3],c0[4],c0[5]=O(c0[1],M(T(c0[2]),c0[3]),c2[bo]),O(c0[2],M(T(c0[3]),c0[4])),O(c0[3],M(T(c0[4]),c0[5])),O(c0[4],M(T(c0[5]),c0[1])),O(c0[5],M(T(c0[1]),c0[2]))c0[6],c0[7],c0[8],c0[9],c0[10]=O(c0[9],M(T(c0[10]),c0[6])),O(c0[10],M(T(c0[6]),c0[7])),O(c0[6],M(T(c0[7]),c0[8])),O(c0[7],M(T(c0[8]),c0[9])),O(c0[8],M(T(c0[9]),c0[10]))c0[11],c0[12],c0[13],c0[14],c0[15]=O(c0[12],M(T(c0[13]),c0[14])),O(c0[13],M(T(c0[14]),c0[15])),O(c0[14],M(T(c0[15]),c0[11])),O(c0[15],M(T(c0[11]),c0[12])),O(c0[11],M(T(c0[12]),c0[13]))c0[16],c0[17],c0[18],c0[19],c0[20]=O(c0[20],M(T(c0[16]),c0[17])),O(c0[16],M(T(c0[17]),c0[18])),O(c0[17],M(T(c0[18]),c0[19])),O(c0[18],M(T(c0[19]),c0[20])),O(c0[19],M(T(c0[20]),c0[16]))c0[21],c0[22],c0[23],c0[24],c0[25]=O(c0[23],M(T(c0[24]),c0[25])),O(c0[24],M(T(c0[25]),c0[21])),O(c0[25],M(T(c0[21]),c0[22])),O(c0[21],M(T(c0[22]),c0[23])),O(c0[22],M(T(c0[23]),c0[24]))c1[1],c1[2],c1[3],c1[4],c1[5]=O(c1[1],M(T(c1[2]),c1[3]),c3[bo]),O(c1[2],M(T(c1[3]),c1[4])),O(c1[3],M(T(c1[4]),c1[5])),O(c1[4],M(T(c1[5]),c1[1])),O(c1[5],M(T(c1[1]),c1[2]))c1[6],c1[7],c1[8],c1[9],c1[10]=O(c1[9],M(T(c1[10]),c1[6])),O(c1[10],M(T(c1[6]),c1[7])),O(c1[6],M(T(c1[7]),c1[8])),O(c1[7],M(T(c1[8]),c1[9])),O(c1[8],M(T(c1[9]),c1[10]))c1[11],c1[12],c1[13],c1[14],c1[15]=O(c1[12],M(T(c1[13]),c1[14])),O(c1[13],M(T(c1[14]),c1[15])),O(c1[14],M(T(c1[15]),c1[11])),O(c1[15],M(T(c1[11]),c1[12])),O(c1[11],M(T(c1[12]),c1[13]))c1[16],c1[17],c1[18],c1[19],c1[20]=O(c1[20],M(T(c1[16]),c1[17])),O(c1[16],M(T(c1[17]),c1[18])),O(c1[17],M(T(c1[18]),c1[19])),O(c1[18],M(T(c1[19]),c1[20])),O(c1[19],M(T(c1[20]),c1[16]))c1[21],c1[22],c1[23],c1[24],c1[25]=O(c1[23],M(T(c1[24]),c1[25])),O(c1[24],M(T(c1[25]),c1[21])),O(c1[25],M(T(c1[21]),c1[22])),O(c1[21],M(T(c1[22]),c1[23])),O(c1[22],M(T(c1[23]),c1[24]))end end end end;if L=="LJ"then function _(aA,aB,aC,ax)local aD,aE=al,a8;for aF=aC,aC+ax-1,64 do for az=1,16 do aF=aF+4;local aG,E,aH,aI=c(aB,aF-3,aF)aD[az]=N(P(aG,24),P(E,16),P(aH,8),aI)end;for az=17,64 do local aG,E=aD[az-15],aD[az-2]aD[az]=U(U(O(S(aG,7),R(aG,14),Q(aG,3))+O(R(E,15),R(E,13),Q(E,10)))+U(aD[az-7]+aD[az-16]))end;local aG,E,aH,aI,aJ,aK,aL,aM=aA[1],aA[2],aA[3],aA[4],aA[5],aA[6],aA[7],aA[8]for az=1,64,8 do local aN=U(O(S(aJ,6),S(aJ,11),R(aJ,7))+O(aL,M(aJ,O(aK,aL)))+aE[az]+aD[az]+aM)aM,aL,aK,aJ=aL,aK,aJ,U(aI+aN)aI,aH,E,aG=aH,E,aG,U(O(M(aG,O(E,aH)),M(E,aH))+O(S(aG,2),S(aG,13),R(aG,10))+aN)aN=U(O(S(aJ,6),S(aJ,11),R(aJ,7))+O(aL,M(aJ,O(aK,aL)))+aE[az+1]+aD[az+1]+aM)aM,aL,aK,aJ=aL,aK,aJ,U(aI+aN)aI,aH,E,aG=aH,E,aG,U(O(M(aG,O(E,aH)),M(E,aH))+O(S(aG,2),S(aG,13),R(aG,10))+aN)aN=U(O(S(aJ,6),S(aJ,11),R(aJ,7))+O(aL,M(aJ,O(aK,aL)))+aE[az+2]+aD[az+2]+aM)aM,aL,aK,aJ=aL,aK,aJ,U(aI+aN)aI,aH,E,aG=aH,E,aG,U(O(M(aG,O(E,aH)),M(E,aH))+O(S(aG,2),S(aG,13),R(aG,10))+aN)aN=U(O(S(aJ,6),S(aJ,11),R(aJ,7))+O(aL,M(aJ,O(aK,aL)))+aE[az+3]+aD[az+3]+aM)aM,aL,aK,aJ=aL,aK,aJ,U(aI+aN)aI,aH,E,aG=aH,E,aG,U(O(M(aG,O(E,aH)),M(E,aH))+O(S(aG,2),S(aG,13),R(aG,10))+aN)aN=U(O(S(aJ,6),S(aJ,11),R(aJ,7))+O(aL,M(aJ,O(aK,aL)))+aE[az+4]+aD[az+4]+aM)aM,aL,aK,aJ=aL,aK,aJ,U(aI+aN)aI,aH,E,aG=aH,E,aG,U(O(M(aG,O(E,aH)),M(E,aH))+O(S(aG,2),S(aG,13),R(aG,10))+aN)aN=U(O(S(aJ,6),S(aJ,11),R(aJ,7))+O(aL,M(aJ,O(aK,aL)))+aE[az+5]+aD[az+5]+aM)aM,aL,aK,aJ=aL,aK,aJ,U(aI+aN)aI,aH,E,aG=aH,E,aG,U(O(M(aG,O(E,aH)),M(E,aH))+O(S(aG,2),S(aG,13),R(aG,10))+aN)aN=U(O(S(aJ,6),S(aJ,11),R(aJ,7))+O(aL,M(aJ,O(aK,aL)))+aE[az+6]+aD[az+6]+aM)aM,aL,aK,aJ=aL,aK,aJ,U(aI+aN)aI,aH,E,aG=aH,E,aG,U(O(M(aG,O(E,aH)),M(E,aH))+O(S(aG,2),S(aG,13),R(aG,10))+aN)aN=U(O(S(aJ,6),S(aJ,11),R(aJ,7))+O(aL,M(aJ,O(aK,aL)))+aE[az+7]+aD[az+7]+aM)aM,aL,aK,aJ=aL,aK,aJ,U(aI+aN)aI,aH,E,aG=aH,E,aG,U(O(M(aG,O(E,aH)),M(E,aH))+O(S(aG,2),S(aG,13),R(aG,10))+aN)end;aA[1],aA[2],aA[3],aA[4]=U(aG+aA[1]),U(E+aA[2]),U(aH+aA[3]),U(aI+aA[4])aA[5],aA[6],aA[7],aA[8]=U(aJ+aA[5]),U(aK+aA[6]),U(aL+aA[7]),U(aM+aA[8])end end;local function c7(bv,bw,bA,bB,bQ,bR,c8,c9)local ca=bv%2^32+bA%2^32+bQ%2^32+c8%2^32;local cb=bw+bB+bR+c9;local bN=U(ca)local bO=U(cb+j(ca/2^32))return bN,bO end;if C=="x86"then function a0(cc,cd,aB,aC,ax)local aD,ce,cf=al,a7,a8;for aF=aC,aC+ax-1,128 do for az=1,16*2 do aF=aF+4;local aG,E,aH,aI=c(aB,aF-3,aF)aD[az]=N(P(aG,24),P(E,16),P(aH,8),aI)end;for cg=17*2,80*2,2 do local bv,bw=aD[cg-30],aD[cg-31]local bx=O(N(Q(bv,1),P(bw,31)),N(Q(bv,8),P(bw,24)),N(Q(bv,7),P(bw,25)))local by=O(N(Q(bw,1),P(bv,31)),N(Q(bw,8),P(bv,24)),Q(bw,7))local bA,bB=aD[cg-4],aD[cg-5]local bC=O(N(Q(bA,19),P(bB,13)),N(P(bA,3),Q(bB,29)),N(Q(bA,6),P(bB,26)))local bD=O(N(Q(bB,19),P(bA,13)),N(P(bB,3),Q(bA,29)),Q(bB,6))aD[cg],aD[cg-1]=c7(bx,by,bC,bD,aD[cg-14],aD[cg-15],aD[cg-32],aD[cg-33])end;local bv,bA,bQ,c8,bF,bJ,bL,ch=cc[1],cc[2],cc[3],cc[4],cc[5],cc[6],cc[7],cc[8]local bw,bB,bR,c9,bG,bK,bM,ci=cd[1],cd[2],cd[3],cd[4],cd[5],cd[6],cd[7],cd[8]local cj=0;for az=1,80 do local bx=O(bL,M(bF,O(bJ,bL)))local by=O(bM,M(bG,O(bK,bM)))local bC=O(N(Q(bF,14),P(bG,18)),N(Q(bF,18),P(bG,14)),N(P(bF,23),Q(bG,9)))local bD=O(N(Q(bG,14),P(bF,18)),N(Q(bG,18),P(bF,14)),N(P(bG,23),Q(bF,9)))local ca=bC%2^32+bx%2^32+ch%2^32+ce[az]+aD[2*az]%2^32;local ck,cl=U(ca),U(bD+by+ci+cf[az]+aD[2*az-1]+j(ca/2^32))cj=cj+cj;ch,ci,bL,bM,bJ,bK=N(cj,bL),N(cj,bM),N(cj,bJ),N(cj,bK),N(cj,bF),N(cj,bG)local ca=ck%2^32+c8%2^32;bF,bG=U(ca),U(cl+c9+j(ca/2^32))c8,c9,bQ,bR,bA,bB=N(cj,bQ),N(cj,bR),N(cj,bA),N(cj,bB),N(cj,bv),N(cj,bw)bC=O(N(Q(bA,28),P(bB,4)),N(P(bA,30),Q(bB,2)),N(P(bA,25),Q(bB,7)))bD=O(N(Q(bB,28),P(bA,4)),N(P(bB,30),Q(bA,2)),N(P(bB,25),Q(bA,7)))bx=N(M(c8,bQ),M(bA,O(c8,bQ)))by=N(M(c9,bR),M(bB,O(c9,bR)))local ca=ck%2^32+bx%2^32+bC%2^32;bv,bw=U(ca),U(cl+by+bD+j(ca/2^32))end;cc[1],cd[1]=c7(cc[1],cd[1],bv,bw,0,0,0,0)cc[2],cd[2]=c7(cc[2],cd[2],bA,bB,0,0,0,0)cc[3],cd[3]=c7(cc[3],cd[3],bQ,bR,0,0,0,0)cc[4],cd[4]=c7(cc[4],cd[4],c8,c9,0,0,0,0)cc[5],cd[5]=c7(cc[5],cd[5],bF,bG,0,0,0,0)cc[6],cd[6]=c7(cc[6],cd[6],bJ,bK,0,0,0,0)cc[7],cd[7]=c7(cc[7],cd[7],bL,bM,0,0,0,0)cc[8],cd[8]=c7(cc[8],cd[8],ch,ci,0,0,0,0)end end else function a0(cc,cd,aB,aC,ax)local aD,ce,cf=al,a7,a8;for aF=aC,aC+ax-1,128 do for az=1,16*2 do aF=aF+4;local aG,E,aH,aI=c(aB,aF-3,aF)aD[az]=N(P(aG,24),P(E,16),P(aH,8),aI)end;for cg=17*2,80*2,2 do local bv,bw=aD[cg-30],aD[cg-31]local bx=O(N(Q(bv,1),P(bw,31)),N(Q(bv,8),P(bw,24)),N(Q(bv,7),P(bw,25)))local by=O(N(Q(bw,1),P(bv,31)),N(Q(bw,8),P(bv,24)),Q(bw,7))local bA,bB=aD[cg-4],aD[cg-5]local bC=O(N(Q(bA,19),P(bB,13)),N(P(bA,3),Q(bB,29)),N(Q(bA,6),P(bB,26)))local bD=O(N(Q(bB,19),P(bA,13)),N(P(bB,3),Q(bA,29)),Q(bB,6))aD[cg],aD[cg-1]=c7(bx,by,bC,bD,aD[cg-14],aD[cg-15],aD[cg-32],aD[cg-33])end;local bv,bA,bQ,c8,bF,bJ,bL,ch=cc[1],cc[2],cc[3],cc[4],cc[5],cc[6],cc[7],cc[8]local bw,bB,bR,c9,bG,bK,bM,ci=cd[1],cd[2],cd[3],cd[4],cd[5],cd[6],cd[7],cd[8]for az=1,80 do local bx=O(bL,M(bF,O(bJ,bL)))local by=O(bM,M(bG,O(bK,bM)))local bC=O(N(Q(bF,14),P(bG,18)),N(Q(bF,18),P(bG,14)),N(P(bF,23),Q(bG,9)))local bD=O(N(Q(bG,14),P(bF,18)),N(Q(bG,18),P(bF,14)),N(P(bG,23),Q(bF,9)))local ca=bC%2^32+bx%2^32+ch%2^32+ce[az]+aD[2*az]%2^32;local ck,cl=U(ca),U(bD+by+ci+cf[az]+aD[2*az-1]+j(ca/2^32))ch,ci,bL,bM,bJ,bK=bL,bM,bJ,bK,bF,bG;local ca=ck%2^32+c8%2^32;bF,bG=U(ca),U(cl+c9+j(ca/2^32))c8,c9,bQ,bR,bA,bB=bQ,bR,bA,bB,bv,bw;bC=O(N(Q(bA,28),P(bB,4)),N(P(bA,30),Q(bB,2)),N(P(bA,25),Q(bB,7)))bD=O(N(Q(bB,28),P(bA,4)),N(P(bB,30),Q(bA,2)),N(P(bB,25),Q(bA,7)))bx=N(M(c8,bQ),M(bA,O(c8,bQ)))by=N(M(c9,bR),M(bB,O(c9,bR)))local ca=ck%2^32+bC%2^32+bx%2^32;bv,bw=U(ca),U(cl+bD+by+j(ca/2^32))end;cc[1],cd[1]=c7(cc[1],cd[1],bv,bw,0,0,0,0)cc[2],cd[2]=c7(cc[2],cd[2],bA,bB,0,0,0,0)cc[3],cd[3]=c7(cc[3],cd[3],bQ,bR,0,0,0,0)cc[4],cd[4]=c7(cc[4],cd[4],c8,c9,0,0,0,0)cc[5],cd[5]=c7(cc[5],cd[5],bF,bG,0,0,0,0)cc[6],cd[6]=c7(cc[6],cd[6],bJ,bK,0,0,0,0)cc[7],cd[7]=c7(cc[7],cd[7],bL,bM,0,0,0,0)cc[8],cd[8]=c7(cc[8],cd[8],ch,ci,0,0,0,0)end end end;function a1(aA,aB,aC,ax)local aD,aE=al,ag;for aF=aC,aC+ax-1,64 do for az=1,16 do aF=aF+4;local aG,E,aH,aI=c(aB,aF-3,aF)aD[az]=N(P(aI,24),P(aH,16),P(E,8),aG)end;local aG,E,aH,aI=aA[1],aA[2],aA[3],aA[4]for az=1,16,4 do aG,aI,aH,E=aI,aH,E,U(R(O(aI,M(E,O(aH,aI)))+aE[az]+aD[az]+aG,7)+E)aG,aI,aH,E=aI,aH,E,U(R(O(aI,M(E,O(aH,aI)))+aE[az+1]+aD[az+1]+aG,12)+E)aG,aI,aH,E=aI,aH,E,U(R(O(aI,M(E,O(aH,aI)))+aE[az+2]+aD[az+2]+aG,17)+E)aG,aI,aH,E=aI,aH,E,U(R(O(aI,M(E,O(aH,aI)))+aE[az+3]+aD[az+3]+aG,22)+E)end;for az=17,32,4 do local aL=5*az-4;aG,aI,aH,E=aI,aH,E,U(R(O(aH,M(aI,O(E,aH)))+aE[az]+aD[M(aL,15)+1]+aG,5)+E)aG,aI,aH,E=aI,aH,E,U(R(O(aH,M(aI,O(E,aH)))+aE[az+1]+aD[M(aL+5,15)+1]+aG,9)+E)aG,aI,aH,E=aI,aH,E,U(R(O(aH,M(aI,O(E,aH)))+aE[az+2]+aD[M(aL+10,15)+1]+aG,14)+E)aG,aI,aH,E=aI,aH,E,U(R(O(aH,M(aI,O(E,aH)))+aE[az+3]+aD[M(aL-1,15)+1]+aG,20)+E)end;for az=33,48,4 do local aL=3*az+2;aG,aI,aH,E=aI,aH,E,U(R(O(E,aH,aI)+aE[az]+aD[M(aL,15)+1]+aG,4)+E)aG,aI,aH,E=aI,aH,E,U(R(O(E,aH,aI)+aE[az+1]+aD[M(aL+3,15)+1]+aG,11)+E)aG,aI,aH,E=aI,aH,E,U(R(O(E,aH,aI)+aE[az+2]+aD[M(aL+6,15)+1]+aG,16)+E)aG,aI,aH,E=aI,aH,E,U(R(O(E,aH,aI)+aE[az+3]+aD[M(aL-7,15)+1]+aG,23)+E)end;for az=49,64,4 do local aL=az*7;aG,aI,aH,E=aI,aH,E,U(R(O(aH,N(E,T(aI)))+aE[az]+aD[M(aL-7,15)+1]+aG,6)+E)aG,aI,aH,E=aI,aH,E,U(R(O(aH,N(E,T(aI)))+aE[az+1]+aD[M(aL,15)+1]+aG,10)+E)aG,aI,aH,E=aI,aH,E,U(R(O(aH,N(E,T(aI)))+aE[az+2]+aD[M(aL+7,15)+1]+aG,15)+E)aG,aI,aH,E=aI,aH,E,U(R(O(aH,N(E,T(aI)))+aE[az+3]+aD[M(aL-2,15)+1]+aG,21)+E)end;aA[1],aA[2],aA[3],aA[4]=U(aG+aA[1]),U(E+aA[2]),U(aH+aA[3]),U(aI+aA[4])end end;function a2(aA,aB,aC,ax)local aD=al;for aF=aC,aC+ax-1,64 do for az=1,16 do aF=aF+4;local aG,E,aH,aI=c(aB,aF-3,aF)aD[az]=N(P(aG,24),P(E,16),P(aH,8),aI)end;for az=17,80 do aD[az]=R(O(aD[az-3],aD[az-8],aD[az-14],aD[az-16]),1)end;local aG,E,aH,aI,aJ=aA[1],aA[2],aA[3],aA[4],aA[5]for az=1,20,5 do aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(aI,M(E,O(aI,aH)))+aD[az]+0x5A827999+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(aI,M(E,O(aI,aH)))+aD[az+1]+0x5A827999+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(aI,M(E,O(aI,aH)))+aD[az+2]+0x5A827999+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(aI,M(E,O(aI,aH)))+aD[az+3]+0x5A827999+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(aI,M(E,O(aI,aH)))+aD[az+4]+0x5A827999+aJ)end;for az=21,40,5 do aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(E,aH,aI)+aD[az]+0x6ED9EBA1+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(E,aH,aI)+aD[az+1]+0x6ED9EBA1+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(E,aH,aI)+aD[az+2]+0x6ED9EBA1+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(E,aH,aI)+aD[az+3]+0x6ED9EBA1+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(E,aH,aI)+aD[az+4]+0x6ED9EBA1+aJ)end;for az=41,60,5 do aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(M(aI,O(E,aH)),M(E,aH))+aD[az]+0x8F1BBCDC+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(M(aI,O(E,aH)),M(E,aH))+aD[az+1]+0x8F1BBCDC+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(M(aI,O(E,aH)),M(E,aH))+aD[az+2]+0x8F1BBCDC+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(M(aI,O(E,aH)),M(E,aH))+aD[az+3]+0x8F1BBCDC+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(M(aI,O(E,aH)),M(E,aH))+aD[az+4]+0x8F1BBCDC+aJ)end;for az=61,80,5 do aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(E,aH,aI)+aD[az]+0xCA62C1D6+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(E,aH,aI)+aD[az+1]+0xCA62C1D6+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(E,aH,aI)+aD[az+2]+0xCA62C1D6+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(E,aH,aI)+aD[az+3]+0xCA62C1D6+aJ)aJ,aI,aH,E,aG=aI,aH,S(E,2),aG,U(R(aG,5)+O(E,aH,aI)+aD[az+4]+0xCA62C1D6+aJ)end;aA[1],aA[2],aA[3],aA[4],aA[5]=U(aG+aA[1]),U(E+aA[2]),U(aH+aA[3]),U(aI+aA[4]),U(aJ+aA[5])end end;do local cm,cn={},{}local function b0(aG,E,aH,aI,b1,b2)local aD=al;local co,cp,cq,cr=cm[aG],cm[E],cm[aH],cm[aI]local cs,ct,cu,cv=cn[aG],cn[E],cn[aH],cn[aI]local aN=aD[2*b1-1]+co%2^32+cp%2^32;co=U(aN)cs=U(aD[2*b1]+cs+ct+j(aN/2^32))cr,cv=O(cv,cs),O(cr,co)aN=cq%2^32+cr%2^32;cq=U(aN)cu=U(cu+cv+j(aN/2^32))cp,ct=O(cp,cq),O(ct,cu)cp,ct=O(Q(cp,24),P(ct,8)),O(Q(ct,24),P(cp,8))aN=aD[2*b2-1]+co%2^32+cp%2^32;co=U(aN)cs=U(aD[2*b2]+cs+ct+j(aN/2^32))cr,cv=O(cr,co),O(cv,cs)cr,cv=O(Q(cr,16),P(cv,16)),O(Q(cv,16),P(cr,16))aN=cq%2^32+cr%2^32;cq=U(aN)cu=U(cu+cv+j(aN/2^32))cp,ct=O(cp,cq),O(ct,cu)cp,ct=O(P(cp,1),Q(ct,31)),O(P(ct,1),Q(cp,31))cm[aG],cm[E],cm[aH],cm[aI]=co,cp,cq,cr;cn[aG],cn[E],cn[aH],cn[aI]=cs,ct,cu,cv end;function a5(cc,cd,aB,aC,ax,b7,b8,b9)local aD=al;local cw,cx,cy,cz,cA,cB,cC,cD=cc[1],cc[2],cc[3],cc[4],cc[5],cc[6],cc[7],cc[8]local cE,cF,cG,cH,cI,cJ,cK,cL=cd[1],cd[2],cd[3],cd[4],cd[5],cd[6],cd[7],cd[8]for aF=aC,aC+ax-1,128 do if aB then for az=1,32 do aF=aF+4;local aG,E,aH,aI=c(aB,aF-3,aF)aD[az]=aI*2^24+N(P(aH,16),P(E,8),aG)end end;cm[0x0],cm[0x1],cm[0x2],cm[0x3],cm[0x4],cm[0x5],cm[0x6],cm[0x7]=cw,cx,cy,cz,cA,cB,cC,cD;cm[0x8],cm[0x9],cm[0xA],cm[0xB],cm[0xC],cm[0xD],cm[0xE],cm[0xF]=a9[1],a9[2],a9[3],a9[4],a9[5],a9[6],a9[7],a9[8]cn[0x0],cn[0x1],cn[0x2],cn[0x3],cn[0x4],cn[0x5],cn[0x6],cn[0x7]=cE,cF,cG,cH,cI,cJ,cK,cL;cn[0x8],cn[0x9],cn[0xA],cn[0xB],cn[0xC],cn[0xD],cn[0xE],cn[0xF]=aa[1],aa[2],aa[3],aa[4],aa[5],aa[6],aa[7],aa[8]b7=b7+(b8 or 128)local cM=b7%2^32;local cN=j(b7/2^32)cm[0xC]=O(cm[0xC],cM)cn[0xC]=O(cn[0xC],cN)if b8 then cm[0xE]=T(cm[0xE])cn[0xE]=T(cn[0xE])end;if b9 then cm[0xF]=T(cm[0xF])cn[0xF]=T(cn[0xF])end;for az=1,12 do local bi=as[az]b0(0,4,8,12,bi[1],bi[2])b0(1,5,9,13,bi[3],bi[4])b0(2,6,10,14,bi[5],bi[6])b0(3,7,11,15,bi[7],bi[8])b0(0,5,10,15,bi[9],bi[10])b0(1,6,11,12,bi[11],bi[12])b0(2,7,8,13,bi[13],bi[14])b0(3,4,9,14,bi[15],bi[16])end;cw=O(cw,cm[0x0],cm[0x8])cx=O(cx,cm[0x1],cm[0x9])cy=O(cy,cm[0x2],cm[0xA])cz=O(cz,cm[0x3],cm[0xB])cA=O(cA,cm[0x4],cm[0xC])cB=O(cB,cm[0x5],cm[0xD])cC=O(cC,cm[0x6],cm[0xE])cD=O(cD,cm[0x7],cm[0xF])cE=O(cE,cn[0x0],cn[0x8])cF=O(cF,cn[0x1],cn[0x9])cG=O(cG,cn[0x2],cn[0xA])cH=O(cH,cn[0x3],cn[0xB])cI=O(cI,cn[0x4],cn[0xC])cJ=O(cJ,cn[0x5],cn[0xD])cK=O(cK,cn[0x6],cn[0xE])cL=O(cL,cn[0x7],cn[0xF])end;cc[1],cc[2],cc[3],cc[4],cc[5],cc[6],cc[7],cc[8]=cw%2^32,cx%2^32,cy%2^32,cz%2^32,cA%2^32,cB%2^32,cC%2^32,cD%2^32;cd[1],cd[2],cd[3],cd[4],cd[5],cd[6],cd[7],cd[8]=cE%2^32,cF%2^32,cG%2^32,cH%2^32,cI%2^32,cJ%2^32,cK%2^32,cL%2^32;return b7 end end end;if L=="FFI"or L=="LJ"then do local aD=an;local a_=ao;local function b0(aG,E,aH,aI,b1,b2)local b3,b4,b5,b6=a_[aG],a_[E],a_[aH],a_[aI]b3=U(aD[b1]+b3+b4)b6=S(O(b6,b3),16)b5=U(b5+b6)b4=S(O(b4,b5),12)b3=U(aD[b2]+b3+b4)b6=S(O(b6,b3),8)b5=U(b5+b6)b4=S(O(b4,b5),7)a_[aG],a_[E],a_[aH],a_[aI]=b3,b4,b5,b6 end;function a4(aA,aB,aC,ax,b7,b8,b9)local ba,bb,bc,bd,be,bf,bg,bh=U(aA[1]),U(aA[2]),U(aA[3]),U(aA[4]),U(aA[5]),U(aA[6]),U(aA[7]),U(aA[8])for aF=aC,aC+ax-1,64 do if aB then for az=1,16 do aF=aF+4;local aG,E,aH,aI=c(aB,aF-3,aF)aD[az]=N(P(aI,24),P(aH,16),P(E,8),aG)end end;a_[0x0],a_[0x1],a_[0x2],a_[0x3],a_[0x4],a_[0x5],a_[0x6],a_[0x7]=ba,bb,bc,bd,be,bf,bg,bh;a_[0x8],a_[0x9],a_[0xA],a_[0xB],a_[0xE],a_[0xF]=U(aa[1]),U(aa[2]),U(aa[3]),U(aa[4]),U(aa[7]),U(aa[8])b7=b7+(b8 or 64)local cO=b7%2^32;local cP=j(b7/2^32)a_[0xC]=O(aa[5],cO)a_[0xD]=O(aa[6],cP)if b8 then a_[0xE]=T(a_[0xE])end;if b9 then a_[0xF]=T(a_[0xF])end;for az=1,10 do local bi=as[az]b0(0,4,8,12,bi[1],bi[2])b0(1,5,9,13,bi[3],bi[4])b0(2,6,10,14,bi[5],bi[6])b0(3,7,11,15,bi[7],bi[8])b0(0,5,10,15,bi[9],bi[10])b0(1,6,11,12,bi[11],bi[12])b0(2,7,8,13,bi[13],bi[14])b0(3,4,9,14,bi[15],bi[16])end;ba=O(ba,a_[0x0],a_[0x8])bb=O(bb,a_[0x1],a_[0x9])bc=O(bc,a_[0x2],a_[0xA])bd=O(bd,a_[0x3],a_[0xB])be=O(be,a_[0x4],a_[0xC])bf=O(bf,a_[0x5],a_[0xD])bg=O(bg,a_[0x6],a_[0xE])bh=O(bh,a_[0x7],a_[0xF])end;aA[1],aA[2],aA[3],aA[4],aA[5],aA[6],aA[7],aA[8]=ba,bb,bc,bd,be,bf,bg,bh;return b7 end;function a6(aB,aC,ax,cQ,cR,cS,cT,cU,cV)cV=cV or 64;local ba,bb,bc,bd,be,bf,bg,bh=U(cS[1]),U(cS[2]),U(cS[3]),U(cS[4]),U(cS[5]),U(cS[6]),U(cS[7]),U(cS[8])cT=cT or cS;for aF=aC,aC+ax-1,64 do if aB then for az=1,16 do aF=aF+4;local aG,E,aH,aI=c(aB,aF-3,aF)aD[az]=N(P(aI,24),P(aH,16),P(E,8),aG)end end;a_[0x0],a_[0x1],a_[0x2],a_[0x3],a_[0x4],a_[0x5],a_[0x6],a_[0x7]=ba,bb,bc,bd,be,bf,bg,bh;a_[0x8],a_[0x9],a_[0xA],a_[0xB]=U(aa[1]),U(aa[2]),U(aa[3]),U(aa[4])a_[0xC]=U(cR%2^32)a_[0xD]=j(cR/2^32)a_[0xE],a_[0xF]=cV,cQ;for az=1,7 do b0(0,4,8,12,at[az],at[az+14])b0(1,5,9,13,at[az+1],at[az+2])b0(2,6,10,14,at[az+16],at[az+7])b0(3,7,11,15,at[az+15],at[az+17])b0(0,5,10,15,at[az+21],at[az+5])b0(1,6,11,12,at[az+3],at[az+6])b0(2,7,8,13,at[az+4],at[az+18])b0(3,4,9,14,at[az+19],at[az+20])end;if cU then cT[9]=O(ba,a_[0x8])cT[10]=O(bb,a_[0x9])cT[11]=O(bc,a_[0xA])cT[12]=O(bd,a_[0xB])cT[13]=O(be,a_[0xC])cT[14]=O(bf,a_[0xD])cT[15]=O(bg,a_[0xE])cT[16]=O(bh,a_[0xF])end;ba=O(a_[0x0],a_[0x8])bb=O(a_[0x1],a_[0x9])bc=O(a_[0x2],a_[0xA])bd=O(a_[0x3],a_[0xB])be=O(a_[0x4],a_[0xC])bf=O(a_[0x5],a_[0xD])bg=O(a_[0x6],a_[0xE])bh=O(a_[0x7],a_[0xF])end;cT[1],cT[2],cT[3],cT[4],cT[5],cT[6],cT[7],cT[8]=ba,bb,bc,bd,be,bf,bg,bh end end end;do local function cW(cX,cY,cZ,c_)local H,d0,d1,d2={},0.0,0.0,1.0;for az=1,c_ do for q=m(1,az+1-#cY),l(az,#cX)do d0=d0+cZ*cX[q]*cY[az+1-q]end;local d3=d0%2^24;H[az]=j(d3)d0=(d0-d3)/2^24;d1=d1+d3*d2;d2=d2*2^24 end;return H,d1 end;local d4,d5,d6,p,d7,d8=0,{4,1,2,-2,2},4,{1},aa,a9;repeat d6=d6+d5[d6%6]local aI=1;repeat aI=aI+d5[aI%6]if aI*aI>d6 then local d9=d6^(1/3)local da=d9*2^40;da=cW({da-da%1},p,1.0,2)local I,db=cW(da,cW(da,da,1.0,4),-1.0,4)local dc=da[2]%65536*65536+j(da[1]/256)local dd=da[1]%256*16777216+j(db*2^-56/3*d9/d6)if d4<16 then d9=d6^(1/2)da=d9*2^40;da=cW({da-da%1},p,1.0,2)I,db=cW(da,da,-1.0,2)local dc=da[2]%65536*65536+j(da[1]/256)local dd=da[1]%256*16777216+j(db*2^-17/d9)local d4=d4%8+1;ad[224][d4]=dd;d7[d4],d8[d4]=dc,dd+dc*aq;if d4>7 then d7,d8=af[384],ae[384]end end;d4=d4+1;a8[d4],a7[d4]=dc,dd%ap+dc*aq;break end until d6%aI==0 until d4>79 end;for de=224,256,32 do local cc,cd={}if aj then for az=1,8 do cc[az]=X(a9[az])end else cd={}for az=1,8 do cc[az]=X(a9[az])cd[az]=X(aa[az])end end;a0(cc,cd,"SHA-512/"..tostring(de).."\128"..e("\0",115).."\88",0,128)ae[de]=cc;af[de]=cd end;do local df,dg,dh=math.sin,math.abs,math.modf;for d4=1,64 do local dc,dd=dh(dg(df(d4))*2^16)ag[d4]=dc*65536+j(dd*2^16)end end;do local di=29;local function dj()local dk=di%2;di=W((di-dk)/2,142*dk)return dk end;for d4=1,24 do local dd,s=0;for I=1,6 do s=s and s*s*2 or 1;dd=dd+dj()*s end;local dc=dj()*s;ac[d4],ab[d4]=dc,dd+dc*ar end end;if L=="FFI"then a8=D.new("uint32_t[?]",#a8+1,0,unpack(a8))a7=D.new("int64_t[?]",#a7+1,0,unpack(a7))if ar==0 then ab=D.new("uint32_t[?]",#ab+1,0,unpack(ab))ac=D.new("uint32_t[?]",#ac+1,0,unpack(ac))else ab=D.new("int64_t[?]",#ab+1,0,unpack(ab))end end;local function dl(de,dm)local aA,dn,dp={unpack(ad[de])},0.0,""local function dq(dr)if dr then if dp then dn=dn+#dr;local aC=0;if dp~=""and#dp+#dr>=64 then aC=64-#dp;_(aA,dp..f(dr,1,aC),0,64)dp=""end;local ax=#dr-aC;local ds=ax%64;_(aA,dr,aC,ax-ds)dp=dp..f(dr,#dr+1-ds)return dq else error("Adding more chunks is not allowed after receiving the result",2)end else if dp then local dt={dp,"\128",e("\0",(-9-dn)%64+1)}dp=nil;dn=dn*8/256^7;for az=4,10 do dn=dn%1*256;dt[az]=d(j(dn))end;dt=b(dt)_(aA,dt,0,#dt)local du=de/32;for az=1,du do aA[az]=V(aA[az])end;aA=b(aA,"",1,du)end;return aA end end;if dm then return dq(dm)()else return dq end end;local function dv(de,dm)local dn,dp,cc,cd=0.0,"",{unpack(ae[de])},not aj and{unpack(af[de])}local function dq(dr)if dr then if dp then dn=dn+#dr;local aC=0;if dp~=""and#dp+#dr>=128 then aC=128-#dp;a0(cc,cd,dp..f(dr,1,aC),0,128)dp=""end;local ax=#dr-aC;local ds=ax%128;a0(cc,cd,dr,aC,ax-ds)dp=dp..f(dr,#dr+1-ds)return dq else error("Adding more chunks is not allowed after receiving the result",2)end else if dp then local dt={dp,"\128",e("\0",(-17-dn)%128+9)}dp=nil;dn=dn*8/256^7;for az=4,10 do dn=dn%1*256;dt[az]=d(j(dn))end;dt=b(dt)a0(cc,cd,dt,0,#dt)local du=k(de/64)if aj then for az=1,du do cc[az]=aj(cc[az])end else for az=1,du do cc[az]=V(cd[az])..V(cc[az])end;cd=nil end;cc=f(b(cc,"",1,du),1,de/4)end;return cc end end;if dm then return dq(dm)()else return dq end end;local dw,dx,dy,dz;do function dw(dA)return g(dA,"%x%x",function(dB)return d(tonumber(dB,16))end)end;function dx(dC)return g(dC,".",function(aH)return i("%02x",c(aH))end)end;local dD={['+']=62,['-']=62,[62]='+',['/']=63,['_']=63,[63]='/',['=']=-1,['.']=-1,[-1]='='}local dE=0;for az,dF in ipairs{'AZ','az','09'}do for dG=c(dF),c(dF,2)do local dH=d(dG)dD[dH]=dE;dD[dE]=dH;dE=dE+1 end end;function dy(dC)local H={}for aF=1,#dC,3 do local dI,dJ,dK,dL=c(f(dC,aF,aF+2)..'\0',1,-1)H[#H+1]=dD[j(dI/4)]..dD[dI%4*16+j(dJ/16)]..dD[dK and dJ%16*4+j(dK/64)or-1]..dD[dL and dK%64 or-1]end;return b(H)end;function dz(dM)local H,dN={},3;for aF,dH in h(g(dM,'%s+',''),'()(.)')do local dO=dD[dH]if dO<0 then dN=dN-1;dO=0 end;local d4=aF%4;if d4>0 then H[-d4]=dO else local dI=H[-1]*4+j(H[-2]/16)local dJ=H[-2]%16*16+j(H[-3]/4)local dK=H[-3]%4*64+dO;H[#H+1]=f(d(dI,dJ,dK),1,dN)end end;return b(H)end end;local dP;local function dQ(aB,c_,dR)return g(aB,".",function(aH)return d(W(c(aH),dR))end)..e(d(dR),c_-#aB)end;local function dS(dT,dU,dm)local dV=dP[dT]if not dV then error("Unknown hash function",2)end;if#dU>dV then dU=dw(dT(dU))end;local dW=dT()(dQ(dU,dV,0x36))local H;local function dq(dr)if not dr then H=H or dT(dQ(dU,dV,0x5C)..dw(dW()))return H elseif H then error("Adding more chunks is not allowed after receiving the result",2)else dW(dr)return dq end end;if dm then return dq(dm)()else return dq end end;local dX={sha224=function(dm)return dl(224,dm)end,sha256=function(dm)return dl(256,dm)end,sha512_224=function(dm)return dv(224,dm)end,sha512_256=function(dm)return dv(256,dm)end,sha384=function(dm)return dv(384,dm)end,sha512=function(dm)return dv(512,dm)end,hmac=dS,hex_to_bin=dw,bin_to_hex=dx,base64_to_bin=dz,bin_to_base64=dy,hex2bin=dw,bin2hex=dx,base642bin=dz,bin2base64=dy}dP={[dX.sha224]=64,[dX.sha256]=64,[dX.sha512_224]=128,[dX.sha512_256]=128,[dX.sha384]=128,[dX.sha512]=128}return dX
end)()

boot('sha2 ok')

local log
local notify

local db = {
    file = file ~= nil and (file.Open ~= nil or file.Write ~= nil),
    warned = false,
    log_on = false,
    auth = "hvhgg_prime_auth.txt",
    ui = "hvhgg_prime_ui.txt",
    log = "hvhgg_prime_log.txt",
}

function db.put(path, body, mode)
    if not db.file then return false, 'file api unavailable' end

    local why = 'no writer'
    if file.Open ~= nil then
        local ok, fp = pcall(file.Open, path, mode)
        if not ok then
            why = tostring(fp)
        elseif fp == nil then
            why = 'file.Open returned nil'
        else
            local wrote, err = pcall(fp.Write, fp, body)
            pcall(fp.Close, fp)
            if wrote then return true end
            why = tostring(err)
        end
    end

    if mode ~= 'a' and file.Write ~= nil then
        local ok, err = pcall(file.Write, path, body)
        if ok then return true end
        why = tostring(err)
    end

    return false, why
end

function db.get(path)
    if not db.file then return nil end

    if file.Read ~= nil then
        local ok, raw = pcall(file.Read, path)
        if ok and type(raw) == "string" and #raw > 0 then return raw end
    end

    if file.Open == nil then return nil end
    local ok, fp = pcall(file.Open, path, 'r')
    if not ok or fp == nil then return nil end
    local got, raw = pcall(fp.Read, fp)
    pcall(fp.Close, fp)
    if got and type(raw) == "string" and #raw > 0 then return raw end
    return nil
end

function db.read(path)
    local raw = db.get(path)
    if raw == nil then return nil end
    local ok, t = pcall(json.parse, raw)
    if not ok or type(t) ~= "table" then return nil end
    return t
end

function db.write(path, data)
    local ok, raw = pcall(json.stringify, data)
    if not ok or type(raw) ~= "string" then
        return log('[HvH.gg Prime] db: encode failed (' .. path .. ') ' .. tostring(raw))
    end

    local wrote, why = db.put(path, raw, 'w')
    if wrote then
        db.warned = false
        return
    end

    if db.warned then return end
    db.warned = true
    log('[HvH.gg Prime] db: save failed (' .. path .. ') ' .. tostring(why))
    if notify ~= nil then notify('Save failed: ' .. tostring(why), 'error') end
end

log = function(s)
    s = tostring(s)
    print(s)
    if db.log_on then db.put(db.log, s .. '\r\n', 'a') end
end

if _DEBUG and db.file then
    local ok, why = db.put(db.log, '===== load =====\r\n', 'a')
    db.log_on = ok
    if not ok then print('[HvH.gg Prime] db: log file off (' .. tostring(why) .. ')') end
end

log('[HvH.gg Prime] load: begin  file=' .. tostring(db.file) .. ' log=' .. tostring(db.log_on))

local XUID_SIG = "48 83 EC 28 4C 8B 0D ?? ?? ?? ?? 4C 8D 05 ?? ?? ?? ?? BA ?? ?? ?? ?? 48 8D 0D ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 48 8D 05 ?? ?? ?? ?? 48 83 C4 28 C3"

local xuid_at = mem.FindPattern('client.dll', XUID_SIG)
if xuid_at == nil then
    return error('[HvH.gg Prime] xuid signature not found in client.dll')
end

local my_xuid = ffi.string(ffi.cast("char* (__fastcall*) ()", ffi.cast('void*', xuid_at))())
if type(my_xuid) ~= 'string' or #my_xuid == 0 then
    return error('[HvH.gg Prime] xuid came back empty')
end

log('[HvH.gg Prime] load: xuid ok')

local API_URL = _DEBUG and "https://dev-api.mmhvh.com/v2/lua/" or "https://api.mmhvh.com/v2/lua/"
local WEB_URL = _DEBUG and "https://dev.mmhvh.com" or "https://mmhvh.com"

local CLIENT = "AIMWARE"
local VERSION = "1.0.1"

local UPDATE_URL = "https://github.com/mmhvh/aimware-cs2-lua/blob/main/mmhvh_prime.lua"

local HTTP_UA = "Mozilla/5.0 CHEAT_" .. CLIENT
local HTTP_REFERER = "https://mmhvh.com/"

if _DEBUG then log('[HvH.gg Prime] debug: ON  api=' .. API_URL) end

local T = { lang = 2, no_cjk = false }

T.s = {
    ['Cannot reach the HvH.gg Prime'] = '无法连接到 HvH.gg Prime',
    ['Too many requests, please slow down'] = '操作过于频繁，请稍等片刻再试',
    ['API server error %d (empty response)'] = 'API 服务器错误 %d (响应为空)',
    ['API server returned a bad response (%s)'] = 'API 服务器返回了无效响应 (%s)',
    ['HTTP request failed: '] = 'HTTP 请求发送失败：',
    ['Session expired, please log in again'] = '会话已过期，请重新登录',
    ['Unknown error'] = '未知错误',
    ['Unexpected situation'] = '出现异常，请稍后重试',

    ['Could not read your AIMWARE username'] = '无法读取 AIMWARE 用户名',
    ['Failed to start login'] = '发起登录失败',
    ['Confirm the login in your browser'] = '请在浏览器中确认登录',
    ['Login cancelled'] = '已取消登录',
    ['Login failed'] = '登录失败',
    ['Login failed, please try again'] = '登录失败，请重试',
    ['Login was rejected'] = '登录已被拒绝',
    ['Login link expired, please try again'] = '登录链接已过期，请重试',
    ['Logged in, welcome back'] = '登录成功，欢迎回来',
    ['Logged out'] = '已退出登录',

    ['Still loading matchmaking config, try again in a moment'] = '匹配配置仍在加载，请稍后再试',
    ['You must select at least %d maps'] = '至少需要选择 %d 张地图',
    ['Joining match'] = '正在加入比赛',
    ['Autojoining match'] = '正在自动加入比赛',

    ['Failed to link this Steam account'] = '绑定该 Steam 账号失败',
    ['Steam account linked'] = 'Steam 账号绑定成功',
    ['Failed to unlink this Steam account'] = '解绑该 Steam 账号失败',
    ['Steam account unlinked'] = 'Steam 账号已解绑',
    ['Failed to leave your lobby'] = '退出大厅失败',
    ['Left your lobby to unlink this Steam account'] = '已退出大厅，正在解绑该 Steam 账号',
    ['Failed to load stats'] = '战绩加载失败',

    ['Auto'] = '自动',
    ['China'] = '中国',
    ['Asia-Pacific'] = '亚太',
    ['US'] = '美国',
    ['Europe'] = '欧洲',
    ['Shanghai'] = '上海',
    ['Beijing'] = '北京',
    ['Shenzhen'] = '深圳',
    ['Hong Kong'] = '香港',
    ['Singapore'] = '新加坡',
    ['Sydney'] = '悉尼',
    ['US West'] = '美国西部',
    ['US East'] = '美国东部',
    ['Los Angeles'] = '洛杉矶',
    ['Chicago'] = '芝加哥',
    ['Frankfurt'] = '法兰克福',
    ['London'] = '伦敦',
    ['Helsinki'] = '赫尔辛基',
    ['1 region'] = '1 个地区',
    ['%d regions'] = '%d 个地区',

    ['PLAY'] = '匹配',
    ['STATS'] = '战绩',
    ['STEAM'] = '账号',

    ['Sure?'] = '确认?',
    ['Logout'] = '退出登录',
    ['Login'] = '登录',
    ['Cancel'] = '取消',
    ['Refresh'] = '刷新',
    ['Open link'] = '打开链接',
    ['Link this Steam'] = '绑定当前 Steam',
    ['Loading...'] = '加载中...',

    ['Confirm this login in your browser.'] =
        '请在浏览器中确认本次登录。',
    ['Sign in with your mmhvh.com account to start matchmaking. Your browser will open for confirmation.'] =
        '使用 mmhvh.com 账号登录后即可开始匹配，浏览器会打开等待确认。',
    ['Loading your profile...'] = '正在加载账号信息...',
    ['You are in a lobby hosted by someone else. The host controls the queue.'] =
        '你正在别人创建的大厅里，由房主控制匹配。',
    ['Room'] = '房间',
    ['Room code'] = '房间号',
    ['Join room'] = '加入房间',
    ['Create room'] = '创建房间',
    ['Create or join room'] = '创建或加入房间',
    ['Leave room'] = '离开房间',
    ['Leave'] = '离开',
    ['Join'] = '加入',
    ['HOST'] = '房主',
    ['AWAY'] = '离开',
    ['Room created'] = '房间已创建',
    ['Joined the room'] = '已加入房间',
    ['Left the room'] = '已离开房间',
    ['No room code yet'] = '还没有房间号',
    ['That is not a valid room code'] = '这不是有效的房间号',
    ['Enter a room code like ABCDE-FGHI'] = '请输入 ABCDE-FGHI 这种房间号',
    ['Leave your current room first'] = '请先离开当前房间',
    ['You are already in a room'] = '你已经在房间里了',
    ['Failed to join the room'] = '加入房间失败',
    ['Failed to create the room'] = '创建房间失败',
    ['Failed to leave the room'] = '离开房间失败',
    ['Failed to kick that player'] = '踢出玩家失败',
    ['Kicked %s'] = '已将 %s 踢出房间',
    ['%d maps'] = '%d 张图',
    ['Waiting for the host to start the queue.'] = '等待房主开始匹配。',
    ['Ready.'] = '就绪。',
    ['Script v%s is outdated, latest is v%s. Please update.'] = '脚本版本 v%s 过旧，最新版本 v%s，请更新。',
    ['Download update'] = '前往下载新版',
    ['Opened the download page'] = '已打开下载页面',
    ['Could not open the link'] = '无法打开链接',

    ['The Steam account you are playing on is not linked to your HvH.gg Prime account. Link it before queueing.'] =
        '当前游戏使用的 Steam 账号还没有绑定到 HvH.gg Prime 账号，绑定后才能匹配。',
    ['Loading matchmaking config...'] = '正在加载匹配配置...',
    ['Game mode'] = '游戏模式',
    ['Region'] = '服务器地区',
    ['Map pool'] = '地图池',
    ['All'] = '全选',
    ['None'] = '清空',
    ['%d/%d  (min %d)'] = '%d/%d (至少 %d)',
    ['Start queue'] = '开始匹配',
    ['Select at least %d maps to queue.'] = '至少选择 %d 张地图才能开始匹配。',

    ['Match settings'] = '比赛设置',
    ['Show'] = '展开',
    ['Hide'] = '收起',
    ['On'] = '启用',
    ['Off'] = '禁用',
    ['Unlimited'] = '不限制',
    ['%d guns'] = '%d 把',
    ['Unrestricted'] = '不限制',
    ['Limited'] = '限制',
    ['Blocked'] = '禁止',
    ['Ready Required'] = '需要准备',
    ['Teleportation'] = '允许TP',
    ['DDoS Protection'] = 'DDOS防护',
    ['Wallbang'] = '允许穿墙',
    ['No Spread'] = '无扩散',
    ['Rapid Fire'] = '快速射击',
    ['DT Mode'] = 'DT模式',
    ['Ping Balance'] = '平衡Ping',
    ['AWP / Team'] = 'AWP/队',
    ['Scout / Team'] = '鸟狙/队',
    ['Auto / Team'] = '连狙/队',
    ['Air Accelerate'] = '空速',
    ['Web Radar'] = '网页雷达',
    ['Spectators'] = '允许观战',
    ['Record Demo'] = '录制Demo',
    ['Vote Mode'] = '投票选图',
    ['Overtime'] = '加时赛',
    ['Knife Round'] = '刀局选边',

    ['Searching for a match'] = '正在寻找比赛',
    ['Players in queue'] = '匹配人数',
    ['%d total'] = '共 %d 人',
    ['no data'] = '暂无数据',
    ['Stop queue'] = '停止匹配',

    ['Match found! Waiting for players to accept...'] = '找到比赛！等待其他玩家接受...',
    ['Match found! Loading server...'] = '找到比赛！正在启动服务器...',
    ['Match found! Waiting for server to start...'] = '找到比赛！等待服务器就绪...',
    ['Match found!'] = '找到比赛！',
    ['Confirming match...'] = '正在确认比赛...',
    ['You are in the match'] = '你已在比赛中',
    ['Match is live'] = '比赛进行中',
    ['Match'] = '比赛',
    ['Locating a server...'] = '正在分配服务器...',
    ['Connect'] = '连接服务器',

    ['just now'] = '刚刚',
    ['%dm ago'] = '%d 分钟前',
    ['%dh ago'] = '%d 小时前',
    ['%dd ago'] = '%d 天前',
    ['Loading your stats...'] = '正在加载战绩...',
    ['No stats yet. Play a match first.'] = '还没有战绩，先打一场比赛吧。',
    ['Tier points'] = '段位分',
    ['Season %d'] = '第 %d 赛季',
    ['unranked'] = '未上榜',
    ['W / L'] = '胜 / 负',
    ['K / D'] = '击杀 / 死亡',
    ['HS %'] = '爆头率',
    ['Likes'] = '点赞',
    ['Recent matches'] = '最近比赛',
    ['No matches yet.'] = '还没有比赛记录。',
    ['WIN'] = '胜',
    ['LOSS'] = '负',
    ['TIE'] = '平',
    ['LIVE'] = '进行',
    ['Leaderboard'] = '排行榜',
    ['top %d'] = '前 %d 名',
    ['Leaderboard unavailable.'] = '排行榜暂时不可用。',
    ['you'] = '我',

    ['in-game'] = '游戏内',
    ['web'] = '网页',
    ['unverified'] = '未验证',
    ['Current Steam account'] = '当前 Steam 账号',
    ['linked'] = '已绑定',
    ['not linked'] = '未绑定',
    ['This Steam account is not linked to your HvH.gg Prime account yet. You cannot queue with it until you link it.'] =
        '该 Steam 账号还没有绑定到 HvH.gg Prime 账号，绑定前无法用它匹配。',
    ['Linked accounts'] = '已绑定账号',
    ['%d linked'] = '已绑定 %d 个',
    ['No Steam accounts linked yet.'] = '还没有绑定任何 Steam 账号。',
    ['Unbind'] = '解绑',
    ['Next'] = '下一页',
    ['Prev'] = '上一页',

    ['Map ban'] = 'BAN 地图',
    ['Side pick'] = '选择阵营',
    ['Region vote'] = '地区投票',
    ['Captain draft'] = '队长选人',
    ['Vote complete'] = '投票结束',
    ['Round %d'] = '第 %d 回合',
    ['Your turn to ban'] = '轮到你的队伍 BAN 图',
    ['Opponent is banning'] = '对手正在 BAN 图',
    ['Opponent picks the starting side'] = '对手拥有选边权',
    ['You pick the starting side'] = '你的队伍拥有选边权',
    ['Everyone votes for the server region'] = '全体玩家投票选择服务器地区',
    ['Captains are picking players'] = '队长正在选人',
    ['Drafting is web only'] = '游戏内不支持队长选人，请到网页操作',
    ['%d/%d voted'] = '已投 %d/%d',
    ['Pick %d'] = '选 %d 张',
    ['Selected %d/%d'] = '已选 %d/%d',
    ['Banned'] = '已 BAN',
    ['Disabled'] = '已禁用',
    ['Terrorist'] = '恐怖分子',
    ['CounterTerrorist'] = '反恐精英',
    ['Map'] = '地图',
    ['Starting side'] = '起始阵营',
    ['Waiting for the server...'] = '正在准备服务器...',
    ['Failed to submit your vote'] = '投票提交失败',
    ['Voting  |  %s  |  %ds'] = '投票中  |  %s  |  %d 秒',

    ['Failed to change language'] = '切换语言失败',
    ['HvH.gg Prime  |  waiting for browser confirmation'] = 'HvH.gg Prime  |  等待浏览器确认',
    ['In queue  %02d:%02d  |  %s  |  %s'] = '匹配中  %02d:%02d  |  %s  |  %s',
    ['Match is live  |  open the menu to connect'] = '比赛进行中  |  打开菜单即可连接',
}

local function L(s)
    if T.lang ~= 2 or T.no_cjk then return s end
    local v = T.s[s]
    if v == nil then return s end
    return v
end

local MAPS = {
    cs_office    = { 'Office',      '办公室' },
    cs_agency    = { 'Agency',      '办公大楼' },
    cs_italy     = { 'Italy',       '意大利小镇' },
    de_dust2     = { 'Dust 2',      '炙热沙城Ⅱ' },
    de_mirage    = { 'Mirage',      '荒漠迷城' },
    de_inferno   = { 'Inferno',     '炼狱小镇' },
    de_vertigo   = { 'Vertigo',     '殒命大厦' },
    de_nuke      = { 'Nuke',        '核子危机' },
    de_shortnuke = { 'Shortnuke',   '核子危机' },
    de_overpass  = { 'Overpass',    '死亡游乐园' },
    de_rooftop   = { 'Rooftop',     '巅峰对决' },
    de_palacio   = { 'Palacio',     '佩纳宫' },
    de_ancient   = { 'Ancient',     '远古遗迹' },
    de_sanctum   = { 'Sanctum',     '圣堂' },
    de_poseidon  = { 'Poseidon',    '波塞冬' },
    de_brewery   = { 'Brewery',     '酿酒厂' },
    de_assembly  = { 'Assembly',    '装配车间' },
    de_memento   = { 'Memento',     '婚礼会馆' },
    de_whistle   = { 'Whistle',     '火车博物馆' },
    de_dogtown   = { 'Dogtown',     '多格镇' },
    de_palais    = { 'Palais',      '大皇宫' },
    de_train     = { 'Train',       '列车停放站' },
    de_anubis    = { 'Anubis',      '阿努比斯' },
    de_cache     = { 'Cache',       '死城之谜' },
    de_tuscan    = { 'Tuscan',      '托斯卡纳' },
    de_boyard    = { 'Boyard',      '博涯堡垒' },
    de_chalice   = { 'Chalice',     '圣杯要塞' },
    de_cbble     = { 'Cobblestone', '古堡激战' },
    de_lake      = { 'Lake',        '湖畔庄园' },
    de_safehouse = { 'Safehouse',   '安全处所' },
    de_shortdust = { 'Shortdust',   '简易沙城' },
    de_stmarc    = { 'Stmarc',      '圣马克镇' },
    de_bank      = { 'Bank',        '金库危机' },
    de_elysion   = { 'Elysion',     '极乐净土' },
}

local function map_label(id)
    if type(id) ~= 'string' or #id == 0 then return '' end
    local e = MAPS[id]
    if e == nil then return id end
    if T.lang == 2 and not T.no_cjk then return e[2] end
    return e[1]
end

local MODES = {
    C5v5 = { '5v5 Full Map', '5v5 全图' },
    C3v3 = { '3v3 Full Map', '3v3 全图' },
    C2v2 = { '2v2 Full Map', '2v2 全图' },
    C1v1 = { '1v1 Full Map', '1v1 全图' },
    W3v3 = { '3v3 Wingman',  '3v3 搭档' },
    W2v2 = { '2v2 Wingman',  '2v2 搭档' },
    W1v1 = { '1v1 Wingman',  '1v1 搭档' },
}

local regions = {}

local function real_time()
    if globals == nil or globals.RealTime == nil then return 0 end
    local ok, v = pcall(globals.RealTime)
    if not ok or type(v) ~= 'number' then return 0 end
    return v
end

local ping_state = {
    timeout = 10000,
    every = 10,
    keep = 5,
    started = false,
    gen = 0,
    sweep = 0,
    pending = 0,
    next_at = 0,
    order = {},
}

local function ping_sort()
    table.sort(regions, function(a, b)
        if a.latency ~= b.latency then return a.latency < b.latency end
        return a.idx < b.idx
    end)

    local prev, changed = ping_state.order, false
    for i = 1, #regions do
        if prev[i] ~= regions[i].name then changed = true end
        prev[i] = regions[i].name
    end
    if changed then ping_state.gen = ping_state.gen + 1 end
end

local function ping_tick()
    if not ping_state.started then return end
    local now = real_time()
    if now <= 0 or now < ping_state.next_at then return end
    ping_state.next_at = now + ping_state.every
    ping_state.sweep = ping_state.sweep + 1
    ping_state.pending = 1

    local mine = ping_state.sweep
    local opts = { network_timeout = 5, absolute_timeout = 8 }

    local function done(v, ms)
        v.pinging = false
        v.slot = v.slot % ping_state.keep + 1
        v.hist[v.slot] = ms
        local best = v.hist[1]
        for i = 2, #v.hist do
            if v.hist[i] < best then best = v.hist[i] end
        end
        v.latency = best
        if mine ~= ping_state.sweep then return end
        ping_state.pending = ping_state.pending - 1
        if ping_state.pending <= 0 then ping_sort() end
    end

    for _, v in ipairs(regions) do
        if not v.pinging then
            v.pinging = true
            ping_state.pending = ping_state.pending + 1
            local function cb(status, response)
                if status and type(response) == 'table' and response.body ~= nil then
                    return done(v, (real_time() - now) * 1000 * 0.8)
                end
                done(v, ping_state.timeout)
            end
            if not pcall(http.get, v.ping_url, opts, cb) and v.pinging then
                done(v, ping_state.timeout)
            end
        end
    end

    ping_state.pending = ping_state.pending - 1
    if ping_state.pending <= 0 then ping_sort() end
end

local function ping()
    if ping_state.started then return end
    ping_state.started = true
    ping_state.next_at = 0
end

local function get_cheat_username()
    if cheat == nil or cheat.GetUserName == nil then return nil end
    local ok, name = pcall(cheat.GetUserName)
    if not ok or type(name) ~= "string" or #name == 0 then return nil end
    return name
end

local function get_link_code()
    local user = get_cheat_username()
    if user == nil then return nil end
    local time = tostring(utils.get_unix_time())
    local hmac = sha2.hmac(sha2.sha256, "SteamAPI_RegisterCallResult[1]", user .. time)
    return user .. "." .. time .. "." .. hmac
end

local function with_xuid(args)
    local t = args or {}
    local time = math.floor(utils.get_unix_time())
    t.xuid = my_xuid
    t.xuidTime = time
    t.xuidSig = sha2.hmac(sha2.sha256, "ValidateAuthTicketResponse_t[1]", my_xuid .. "." .. time)
    return t
end

local cfg = {
    ready = false,
    fetching = false,
    retry_at = 0,
    checked = false,
    latest = nil,
    outdated = false,
    modes = {},
    pools = {
        c = { min = 0, maps = {} },
        w = { min = 0, maps = {} },
    },
}

function cfg.blocked()
    return cfg.outdated or not cfg.checked
end

local function mode_entry(id)
    for _, m in ipairs(cfg.modes) do
        if m.id == id then return m end
    end
    return nil
end

local REGION_GROUPS = {}

local settings = {
    mode = nil,
    region = 1,
    lang = T.lang,
    rules = false,
    x = 60,
    y = 170,
    c_maps = {},
    w_maps = {},
    c_saved = {},
    w_saved = {},
}

local function load_settings()
    local function saved_names(v)
        local out = {}
        if type(v) ~= "table" then return out end
        for _, n in ipairs(v) do
            if type(n) == "string" and #n > 0 then out[#out + 1] = n end
        end
        return out
    end

    local d = db.read(db.ui)
    if d == nil then return end

    if type(d.mode) == "string" and #d.mode > 0 then settings.mode = d.mode end
    local v = tonumber(d.region)
    if v ~= nil and v >= 1 then settings.region = math.floor(v) end
    v = tonumber(d.lang)
    if v == 1 or v == 2 then settings.lang = math.floor(v) end
    if type(d.rules) == "boolean" then settings.rules = d.rules end
    v = tonumber(d.x)
    if v ~= nil then settings.x = v end
    v = tonumber(d.y)
    if v ~= nil then settings.y = v end

    settings.c_saved = saved_names(d.c)
    settings.w_saved = saved_names(d.w)
end

local function save_settings()
    local function selected_names(target, valid)
        local out = {}
        for _, n in ipairs(valid) do
            if target[n] then out[#out + 1] = n end
        end
        return out
    end

    db.write(db.ui, {
        mode = settings.mode or "",
        region = settings.region,
        lang = settings.lang,
        rules = settings.rules,
        x = math.floor(settings.x),
        y = math.floor(settings.y),
        c = cfg.ready and selected_names(settings.c_maps, cfg.pools.c.maps) or settings.c_saved,
        w = cfg.ready and selected_names(settings.w_maps, cfg.pools.w.maps) or settings.w_saved,
    })
end

local function get_game_mode()
    if settings.mode ~= nil then return settings.mode end
    local first = cfg.modes[1]
    if first ~= nil then return first.id end
    return nil
end

local function use_wingman_maps()
    local e = mode_entry(get_game_mode())
    return e ~= nil and e.wingman == true
end

local function vote_mode_on()
    local e = mode_entry(get_game_mode())
    return e ~= nil and type(e.settings) == 'table' and e.settings.voteMode == true
end

local function pool_key()
    if use_wingman_maps() then return "w" end
    return "c"
end

local function active_map_names()
    return cfg.pools[pool_key()].maps
end

local function active_map_set()
    if pool_key() == "w" then return settings.w_maps end
    return settings.c_maps
end

local function get_selected_maps()
    local names, set = active_map_names(), active_map_set()
    local all = vote_mode_on()
    local out = {}
    for _, n in ipairs(names) do
        if all or set[n] then out[#out + 1] = n end
    end
    return out
end

local function count_selected_maps()
    local names, set = active_map_names(), active_map_set()
    if vote_mode_on() then return #names end
    local n = 0
    for i = 1, #names do
        if set[names[i]] then n = n + 1 end
    end
    return n
end

local function min_maps()
    return cfg.pools[pool_key()].min
end

local function mode_label(id)
    local t = MODES[id]
    if t ~= nil then
        if T.lang == 2 and not T.no_cjk then return t[2] end
        return t[1]
    end
    local e = mode_entry(id)
    if e ~= nil then return e.label end
    return id or ""
end

local function apply_saved_maps(set, names, saved)
    local chosen = {}
    for _, name in ipairs(saved) do chosen[name] = true end
    local any = false
    for _, n in ipairs(names) do
        if chosen[n] then any = true end
    end
    for _, n in ipairs(names) do
        set[n] = (not any) or (chosen[n] == true)
    end
end

local GAME = "CS2"

local function apply_config(data)
    if type(data) ~= "table" then return false end
    local games = data.games
    if type(games) ~= "table" then return false end
    local g = games[GAME]
    if type(g) ~= "table" then return false end

    local modes, comp, wing = g.modes, g.competitive, g.wingman
    if type(modes) ~= "table" or #modes == 0 then return false end
    if type(comp) ~= "table" or type(comp.maps) ~= "table" or #comp.maps == 0 then return false end
    if type(wing) ~= "table" or type(wing.maps) ~= "table" or #wing.maps == 0 then return false end

    local parsed = {}
    for _, m in ipairs(modes) do
        if type(m) == "table" and type(m.id) == "string" then
            parsed[#parsed + 1] = {
                id = m.id,
                label = m.label or m.id,
                wingman = m.wingman == true,
                settings = (type(m.settings) == "table") and m.settings or nil,
            }
        end
    end
    if #parsed == 0 then return false end

    if type(g.regions) ~= "table" or type(g.regionGroups) ~= "table" then return false end
    local rs, gs = {}, {}
    for _, r in ipairs(g.regions) do
        if type(r) == "table" and type(r.id) == "string" and type(r.group) == "string" and type(r.pingUrl) == "string" then
            local i = #rs + 1
            rs[i] = {
                name = r.id,
                label = type(r.label) == "string" and r.label or r.id,
                group = r.group,
                ping_url = r.pingUrl,
                idx = i,
                latency = ping_state.timeout,
                pinging = false,
                hist = {},
                slot = 0,
            }
        end
    end
    for _, r in ipairs(g.regionGroups) do
        if type(r) == "table" and type(r.id) == "string" then
            gs[#gs + 1] = { id = r.id, label = type(r.label) == "string" and r.label or r.id }
        end
    end
    if #rs == 0 or #gs == 0 then return false end

    cfg.modes = parsed
    cfg.pools.c = { min = comp.minMaps or 0, maps = comp.maps }
    cfg.pools.w = { min = wing.minMaps or 0, maps = wing.maps }

    regions = rs
    REGION_GROUPS = gs
    if settings.region > #REGION_GROUPS then settings.region = 1 end
    ping_state.gen = ping_state.gen + 1

    if settings.mode == nil or mode_entry(settings.mode) == nil then
        settings.mode = cfg.modes[1].id
    end

    apply_saved_maps(settings.c_maps, cfg.pools.c.maps, settings.c_saved)
    apply_saved_maps(settings.w_maps, cfg.pools.w.maps, settings.w_saved)

    local versions = data.clientVersions
    cfg.latest = (type(versions) == "table" and type(versions[CLIENT]) == "string") and versions[CLIENT] or nil
    cfg.outdated = cfg.latest ~= nil and cfg.latest ~= VERSION

    cfg.ready = true
    return true
end

local function active_regions()
    local id = (REGION_GROUPS[settings.region] or REGION_GROUPS[1] or { id = "AUTO" }).id
    local list = {}
    for _, v in ipairs(regions) do
        if id == "AUTO" or v.group == id then list[#list + 1] = v end
    end
    if #list == 0 then
        for _, v in ipairs(regions) do list[#list + 1] = v end
    end
    return list
end

local function get_region_list()
    local out = {}
    for _, v in ipairs(active_regions()) do out[#out + 1] = v.name end
    return out
end

local function region_list_key()
    return table.concat(get_region_list(), ",")
end

local function region_summary()
    if ping_state.sum_key == settings.region and ping_state.sum_gen == ping_state.gen
        and ping_state.sum_lang == T.lang then
        return ping_state.sum_n, ping_state.sum_text
    end

    local list = active_regions()
    local parts = {}
    for i = 1, #list do parts[i] = L(list[i].label) end

    ping_state.sum_key = settings.region
    ping_state.sum_gen = ping_state.gen
    ping_state.sum_lang = T.lang
    ping_state.sum_n = #list
    ping_state.sum_text = table.concat(parts, ', ')
    return ping_state.sum_n, ping_state.sum_text
end

local region_order = {}

local function ordered_region_groups()
    if ping_state.order_gen == ping_state.gen and #region_order == #REGION_GROUPS then
        return region_order
    end

    local lat = {}
    for i = 1, #REGION_GROUPS do
        local id, best = REGION_GROUPS[i].id, nil
        for _, v in ipairs(regions) do
            if v.group == id and (best == nil or v.latency < best) then best = v.latency end
        end
        lat[i] = best or ping_state.timeout
        region_order[i] = i
    end

    table.sort(region_order, function(a, b)
        local aa, ab = REGION_GROUPS[a].id == 'AUTO', REGION_GROUPS[b].id == 'AUTO'
        if aa ~= ab then return aa end
        if lat[a] ~= lat[b] then return lat[a] < lat[b] end
        return a < b
    end)

    ping_state.order_gen = ping_state.gen
    return region_order
end

local function region_count_text(n)
    if n == 1 then return L('1 region') end
    return (L('%d regions')):format(n)
end

log('[HvH.gg Prime] load: settings')
load_settings()
T.lang = settings.lang

local frame_id = 0
local frame_time = utils.get_unix_time()

local state = {
    requesting = 0,
    api_seq = 0,
    logged_in = false,
    login_token = nil,
    login_renew = 0,
    login_session = nil,
    login_url = nil,
    last_error = nil,
    error_backoff_until = 0,
    fail_streak = 0,
    user = nil,
    lobby = nil,
    match = nil,
    auto_join = true,
    auto_accepted = false,
    recheck = false,
    queueCount = nil,
    sent_region_key = nil,
    lang_want = nil,
    lang_seen = nil,
    conn_frame = -1,
    conn_value = false,
    accept_charset = true,
}

local busy = {
    login = false,
    queue = false,
    check = false,
    region = false,
    poll = false,
    lang = false,
    vote = false,
    room = false,
    lobby = false,
}

local TOAST_TTL = 5
local TOAST_MAX = 3
local toasts = {}

notify = function(message, kind)
    message = tostring(message)
    log('[HvH.gg Prime] ' .. message)

    local last = toasts[#toasts]
    if last ~= nil and last.text == message then
        last.expires = utils.get_unix_time() + TOAST_TTL
        last.error = kind == 'error'
        return
    end

    toasts[#toasts + 1] = {
        text = message,
        error = kind == 'error',
        expires = utils.get_unix_time() + TOAST_TTL,
    }
    if #toasts > TOAST_MAX then table.remove(toasts, 1) end
end

local forget_session
local vote
local room

local function http_detail(ok, response)
    local code, msg, timed, blen = 'nil', 'nil', 'nil', 'nil'
    if type(response) == 'table' then
        code = tostring(response.status)
        msg = tostring(response.status_message)
        timed = tostring(response.timed_out)
        if type(response.body) == 'string' then blen = tostring(#response.body) end
    end
    return ('ok=%s code=%s msg=%s timedOut=%s bodyLen=%s'):format(tostring(ok), code, msg, timed, blen)
end

local function post_once(url, options, on_done)
    return pcall(http.post, url, options, on_done)
end

local function api(authorize, endpoint, args, callback, opts)
    if state.requesting > 2 then
        if _DEBUG then
            log(('[HvH.gg Prime] http SKIP %s (inflight=%d)'):format(endpoint, state.requesting))
        end
        return false
    end
    if authorize and state.login_token == nil then return false end

    local soft = opts ~= nil and opts.soft == true

    local options = {
        headers = { Referer = HTTP_REFERER },
        user_agent_info = HTTP_UA,
        network_timeout = 10,
        absolute_timeout = 15,
    }

    if authorize then
        options.headers.Authorization = "Bearer " .. state.login_token
    end

    if state.accept_charset then
        options.headers["Accept-Charset"] = "utf-8"
    end

    if args then options["json"] = args end

    state.requesting = state.requesting + 1

    state.api_seq = state.api_seq + 1
    local seq = state.api_seq
    local sent_at = real_time()

    local url = API_URL .. endpoint

    local function on_done(ok, response)
        state.requesting = state.requesting - 1

        local body = nil
        if type(response) == 'table' and type(response.body) == 'string' then body = response.body end
        local code = nil
        if type(response) == 'table' then code = tonumber(response.status) end

        local took = (real_time() - sent_at) * 1000

        if code == 429 then
            if soft then return callback(false, nil, 429) end

            local wait = nil
            if type(response) == 'table' and type(response.headers) == 'table' then
                local retry = response.headers['Retry-After']
                if retry == nil then retry = response.headers['retry-after'] end
                wait = tonumber(retry)
            end
            if wait == nil then
                wait = 30
            elseif wait < 1 then
                wait = 1
            elseif wait > 300 then
                wait = 300
            end

            if _DEBUG then
                log(('[HvH.gg Prime] http 429 #%d %s wait=%ds took=%.0fms'):format(
                    seq, endpoint, wait, took))
            end

            local detail = L('Too many requests, please slow down')
            if state.last_error ~= detail then notify(detail, 'error') end
            state.last_error = detail

            state.error_backoff_until = utils.get_unix_time() + wait
            return callback(false)
        end

        if ok ~= true or body == nil then
            if soft then
                if _DEBUG then
                    log(('[HvH.gg Prime] http FAIL(soft) #%d %s %s took=%.0fms'):format(
                        seq, endpoint, http_detail(ok, response), took))
                end
                return callback(false, nil, code)
            end

            state.fail_streak = state.fail_streak + 1
            if _DEBUG then
                log(('[HvH.gg Prime] http FAIL #%d t=%d %s auth=%s %s took=%.0fms streak=%d inflight=%d'):format(
                    seq, utils.get_unix_time(), endpoint, tostring(authorize == true),
                    http_detail(ok, response), took, state.fail_streak, state.requesting))
            end

            local detail = L('Cannot reach the HvH.gg Prime')
            if code ~= nil and code > 0 then
                detail = (L('API server error %d (empty response)')):format(code)
            end

            local wait = 2
            if state.fail_streak >= 3 then
                wait = 15
            elseif state.fail_streak >= 2 then
                wait = 5
            end
            if state.fail_streak >= 2 then
                if state.last_error ~= detail then notify(detail, 'error') end
                state.last_error = detail
            end
            state.error_backoff_until = utils.get_unix_time() + wait
            return callback(false)
        end

        local unauthorized = code == 401
            or body == "Nice try bro"
            or body == "Login revoked"
            or body == "Nice try funny"
        if unauthorized and authorize then
            if _DEBUG then
                log(('[HvH.gg Prime] http 401 #%d %s body=%s'):format(seq, endpoint, string.sub(body, 1, 80)))
            end
            if soft then return callback(false, nil, 401) end
            if state.logged_in then
                forget_session()
                notify(L('Session expired, please log in again'), 'error')
            end
            return callback(false)
        end

        local result = json.parse(body)
        if result == nil then
            if soft then
                if _DEBUG then
                    log(('[HvH.gg Prime] http BADJSON(soft) #%d %s code=%s body=%s'):format(
                        seq, endpoint, tostring(code), string.sub(body, 1, 200)))
                end
                return callback(false, nil, code)
            end

            state.fail_streak = state.fail_streak + 1
            if _DEBUG then
                log(('[HvH.gg Prime] http BADJSON #%d t=%d %s %s took=%.0fms body=%s'):format(
                    seq, utils.get_unix_time(), endpoint, http_detail(ok, response), took,
                    string.sub(body, 1, 200)))
            end
            local detail = (L('API server returned a bad response (%s)')):format(tostring(code))
            if state.last_error ~= detail then notify(detail, 'error') end
            state.last_error = detail
            state.error_backoff_until = utils.get_unix_time() + 15
            return callback(false)
        end

        if not soft then state.fail_streak = 0 end
        if _DEBUG then
            log(('[HvH.gg Prime] http ok #%d %s code=%s took=%.0fms len=%d body=%s'):format(
                seq, endpoint, tostring(code), took, #body, string.sub(body, 1, 256)))
        end
        callback(true, result, code)
    end

    local posted, err = post_once(url, options, on_done)

    if not posted and state.accept_charset then
        state.accept_charset = false
        options.headers["Accept-Charset"] = nil
        log('[HvH.gg Prime] http: Accept-Charset rejected by steam, dropped')
        posted, err = post_once(url, options, on_done)
    end

    if not posted then
        state.requesting = state.requesting - 1
        state.fail_streak = state.fail_streak + 1
        state.error_backoff_until = utils.get_unix_time() + 15
        notify(L('HTTP request failed: ') .. tostring(err), 'error')
        return false
    end

    return true
end

local function send(flag, authorize, endpoint, args, callback)
    if busy[flag] then return false end
    busy[flag] = true
    local sent = api(authorize, endpoint, args, function(ok, data)
        busy[flag] = false
        callback(ok, data)
    end)
    if not sent then busy[flag] = false end
    return sent
end

local function fetch_config()
    if cfg.ready or cfg.fetching then return end
    cfg.fetching = true

    local sent = api(false, "config", {}, function(ok, data)
        cfg.fetching = false
        cfg.checked = true
        if not ok or data == nil or data.status ~= true or not apply_config(data.data) then
            cfg.retry_at = utils.get_unix_time() + 15
            return
        end
        log(('[HvH.gg Prime] config: %d modes, %d comp maps (min %d), %d wingman maps (min %d)'):format(
            #cfg.modes, #cfg.pools.c.maps, cfg.pools.c.min, #cfg.pools.w.maps, cfg.pools.w.min))
        if cfg.outdated then
            log(('[HvH.gg Prime] version: %s is outdated, latest is %s, stopping'):format(VERSION, cfg.latest))
            notify((L('Script v%s is outdated, latest is v%s. Please update.')):format(VERSION, cfg.latest), 'error')
            return
        end
        ping()
        state.recheck = true
    end)

    if not sent then
        cfg.fetching = false
        cfg.checked = true
        cfg.retry_at = utils.get_unix_time() + 5
    end
end

local function save_session()
    if state.login_token == nil then return end
    db.write(db.auth, { token = state.login_token, renew = math.floor(state.login_renew or 0) })
end

local function clear_session_store()
    db.write(db.auth, { token = "", renew = 0 })
end

local function load_session()
    local d = db.read(db.auth)
    if d == nil or type(d.token) ~= "string" or #d.token == 0 then return end

    local token = d.token
    local renew_at = tonumber(d.renew) or 0

    if renew_at > 0 and renew_at <= utils.get_unix_time() then return end
    state.login_token = token
    state.login_renew = renew_at
    state.logged_in = true
end

local reset_steam_state
local apply_language

forget_session = function()
    if reset_steam_state ~= nil then reset_steam_state() end
    if room ~= nil then
        room.reset()
        room.open = false
    end
    state.login_token = nil
    state.logged_in = false
    state.user = nil
    state.login_renew = 0
    state.lobby = nil
    state.match = nil
    state.queueCount = nil
    state.sent_region_key = nil
    state.lang_want = nil
    state.lang_seen = nil
    state.recheck = false
    state.last_error = nil
    state.error_backoff_until = 0
    clear_session_store()
end

local function login(user, token, renewAt)
    state.login_token = token
    state.logged_in = true
    state.user = user
    state.login_renew = renewAt / 1000
    state.login_session = nil
    state.login_url = nil
    state.last_error = nil
    state.error_backoff_until = 0
    save_session()
    notify(L('Logged in, welcome back'))
end

local overlay = (function()
    local o = { inited = false, friends = nil, go = nil, utils = nil, on = nil }

    local function proc(name)
        return utils.find_export('steam_api64.dll', name)
    end

    local function as_ptr(p)
        if p == nil then return nil end
        if tonumber(ffi.cast('uintptr_t', p)) == 0 then return nil end
        return p
    end

    local function call0(sig, p)
        if p == nil then return nil end
        local ok, v = pcall(function()
            return ffi.cast(sig, p)()
        end)
        if not ok then return nil end
        return as_ptr(v)
    end

    local function init()
        if o.inited then return o.go ~= nil and o.friends ~= nil end
        o.inited = true

        local friends = call0('void*(__cdecl*)()', proc('SteamAPI_SteamFriends_v018'))
        if friends == nil then
            friends = call0('void*(__cdecl*)()', proc('SteamAPI_SteamFriends_v017'))
        end
        if friends == nil then
            local client = call0('void*(__cdecl*)()', proc('SteamClient'))
            local getu, getp, getf = proc('SteamAPI_GetHSteamUser'), proc('SteamAPI_GetHSteamPipe'), proc('SteamAPI_ISteamClient_GetISteamFriends')
            if client ~= nil and getu ~= nil and getp ~= nil and getf ~= nil then
                local ok, v = pcall(function()
                    local user = ffi.cast('int(__cdecl*)()', getu)()
                    local pipe = ffi.cast('int(__cdecl*)()', getp)()
                    local gf = ffi.cast('void*(__cdecl*)(void*, int, int, const char*)', getf)
                    local f = gf(client, user, pipe, 'SteamFriends018')
                    if as_ptr(f) == nil then f = gf(client, user, pipe, 'SteamFriends017') end
                    return f
                end)
                if ok then friends = as_ptr(v) end
            end
        end

        local openp = proc('SteamAPI_ISteamFriends_ActivateGameOverlayToWebPage')
        if friends == nil or openp == nil then
            log('[HvH.gg Prime] overlay: init failed friends=' .. tostring(friends ~= nil) .. ' open=' .. tostring(openp ~= nil))
            return false
        end

        o.friends = friends
        o.go = ffi.cast('void(__cdecl*)(void*, const char*, int)', openp)

        local u = call0('void*(__cdecl*)()', proc('SteamAPI_SteamUtils_v010'))
        local en = proc('SteamAPI_ISteamUtils_IsOverlayEnabled')
        if u ~= nil and en ~= nil then
            o.utils = u
            o.on = ffi.cast('bool(__cdecl*)(void*)', en)
        end

        log('[HvH.gg Prime] overlay: ready')
        return true
    end

    function o.open(url)
        if type(url) ~= 'string' or #url == 0 then return false end
        if not init() then return false end
        if o.on ~= nil then
            local ok, on = pcall(o.on, o.utils)
            if ok and not on then
                log('[HvH.gg Prime] overlay: disabled')
                return false
            end
        end
        url = (url:gsub('"', ''))
        local target = url
        if url:sub(1, 8) == 'https://' or url:sub(1, 7) == 'http://' then
            target = 'steam://openurl/' .. url
        end
        local ok, err = pcall(o.go, o.friends, target, 1)
        if not ok then
            log('[HvH.gg Prime] overlay: open failed ' .. tostring(err))
            return false
        end
        log('[HvH.gg Prime] overlay: open ' .. target)
        return true
    end

    return o
end)()

local function open_link(s, ok_msg)
    if s == nil or not overlay.open(s) then
        notify(L('Could not open the link'), 'error')
        return
    end
    notify(L(ok_msg))
end

local function go_download()
    open_link(UPDATE_URL, 'Opened the download page')
end

local function cancel_login()
    if state.login_session == nil then return end
    state.login_session = nil
    state.login_url = nil
    notify(L('Login cancelled'))
end

local function start_login()
    if busy.login or state.logged_in then return end
    local link_code = get_link_code()
    if link_code == nil then
        return notify(L('Could not read your AIMWARE username'), 'error')
    end
    if not send('login', false, "login-session", { client = CLIENT, linkCode = link_code }, function(api_success, data)
        if not api_success then return end

        if data.status ~= true or data.data == nil or data.data.sessionId == nil then
            return notify(data.error or L('Failed to start login'), 'error')
        end

        state.login_session = data.data.sessionId
        state.login_url = WEB_URL .. "/cheat-device?code=" .. data.data.sessionId
        state.last_error = nil
        state.error_backoff_until = 0
        open_link(state.login_url, 'Confirm the login in your browser')
    end) then
        notify(L('Unexpected situation'), 'error')
    end
end

local function poll_login()
    if state.login_session == nil then return end
    send('poll', false, "login-poll", { sessionId = state.login_session }, function(api_success, data)
        if state.login_session == nil then return end
        if not api_success then return end

        if data.status ~= true or data.data == nil then
            state.login_session = nil
            state.login_url = nil
            return notify(data.error or L('Login failed'), 'error')
        end

        local status = data.data.loginStatus
        if status == "PENDING" then return end

        if status == "APPROVED" then
            if data.data.token == nil or data.data.user == nil or data.data.renewAt == nil then
                state.login_session = nil
                state.login_url = nil
                return notify(L('Login failed, please try again'), 'error')
            end
            return login(data.data.user, data.data.token, data.data.renewAt)
        end

        state.login_session = nil
        state.login_url = nil
        if status == "DENIED" then
            notify(L('Login was rejected'), 'error')
        else
            notify(L('Login link expired, please try again'), 'error')
        end
    end)
end

local function do_logout()
    if not state.logged_in then return end
    api(true, "logout", {}, function() end)
    forget_session()
    notify(L('Logged out'))
end

local function sync_language()
    local want = state.lang_want
    if want == nil or not state.logged_in then return end
    send('lang', true, "set-language", { language = want }, function(api_success, data)
        if not api_success or data == nil then return end
        if data.status == true then
            if state.lang_want == want then state.lang_want = nil end
        else
            state.lang_want = nil
            notify(data.error or L('Failed to change language'), 'error')
        end
    end)
end

local function api_check_state()
    return send('check', true, "check-state", {}, function(api_success, data)
        if not api_success then return end

        if data.status == true then
            state.last_error = nil
            state.error_backoff_until = 0

            if data.data ~= nil then
                local everything = data.data
                state.user = everything.user
                state.queueCount = everything.queueCount
                state.lobby = everything.lobby
                state.match = everything.match
                if room ~= nil then room.seen(everything.lobby) end

                local srv = (state.user ~= nil) and state.user.language or nil
                if type(srv) == 'string' and srv ~= state.lang_seen then
                    state.lang_seen = srv
                    if state.lang_want == nil and apply_language ~= nil then
                        apply_language((srv == 'ZH') and 2 or 1)
                    end
                end
            end
        else
            local message = data.error or L('Unknown error')
            if message ~= state.last_error then notify(message, 'error') end
            state.last_error = message
            state.error_backoff_until = utils.get_unix_time() + 15
        end
    end)
end

local function api_update_region()
    if not cfg.ready then return false end
    local key = region_list_key()
    if key == state.sent_region_key then return false end
    return send('region', true, "update-lobby-region", { region = get_region_list() }, function(api_success, data)
        if not api_success then return end
        if data.status == true then
            state.sent_region_key = key
            state.lobby = data.lobby
        else
            notify(data.error, 'error')
        end
    end)
end

local function server_ip()
    if engine == nil or engine.GetServerIP == nil then return nil end
    local ok, ip = pcall(engine.GetServerIP)
    if not ok or type(ip) ~= 'string' or #ip == 0 then return nil end
    return ip
end

local function is_connected()
    if state.conn_frame == frame_id then return state.conn_value end
    state.conn_frame = frame_id
    state.conn_value = false
    local m = state.match
    if m ~= nil and m.state == "IN_PROGRESS" then
        local ip = server_ip()
        if ip ~= nil then
            state.conn_value = ip == ("%s:%d"):format(tostring(m.server), m.port or 0)
                or ip == tostring(m.server)
        end
    end
    return state.conn_value
end

local function connect_cmd()
    return ("connect %s:%d"):format(state.match.server, state.match.port)
end

local function join_server()
    if state.match ~= nil and state.match.state == "IN_PROGRESS" and (not is_connected()) then
        notify(L('Joining match'))
        client.Command(connect_cmd(), true)
    end
end

local function tick()
    if cfg.blocked() then return end
    if not state.logged_in or state.login_token == nil then return end

    if utils.get_unix_time() < state.error_backoff_until then return end

    if state.login_renew > 0 and state.login_renew <= utils.get_unix_time() then
        notify(L('Session expired, please log in again'), 'error')
        return forget_session()
    end

    api_check_state()
    sync_language()
    if room ~= nil then room.sync() end

    local user = state.user
    if user == nil then return end

    if user.lobbyId ~= nil and state.lobby ~= nil then
        if user.uid == state.lobby.hostUid then api_update_region() end
    end

    if user.state == "IDLE" then
        state.auto_join = true
        state.auto_accepted = false
    elseif user.state == "IN_MATCH" then
        if state.match ~= nil and state.match.state == "WAITING_FOR_PLAYERS" and not state.auto_accepted then
            state.auto_accepted = true
            api(true, "accept-match", {}, function() end)
        end
        if state.match ~= nil and state.match.state == "VOTING" then vote.sync() end
        if state.auto_join and state.match ~= nil and state.match.state == "IN_PROGRESS" then
            if not is_connected() then
                notify(L('Autojoining match'))
                client.Command(connect_cmd(), true)
            end
            state.auto_join = false
        end
    end
end

local function set_queue_hvhgg(start)
    busy.queue = true
    if not api(true, start and "start-queue" or "stop-queue", {}, function(api_success, data)
        busy.queue = false
        if not api_success then return end
        if data.status == true then
            state.lobby = data.lobby
            state.recheck = true
        else
            notify(data.error, 'error')
        end
    end) then
        busy.queue = false
        notify(L('Unexpected situation'), 'error')
    end
end

local function start_queue_hvhgg()
    if busy.queue or busy.room then return end

    if not cfg.ready then
        return notify(L('Still loading matchmaking config, try again in a moment'), 'error')
    end

    local selected_maps = get_selected_maps()
    local MIN_MAPS = min_maps()
    if #selected_maps < MIN_MAPS then
        return notify((L('You must select at least %d maps')):format(MIN_MAPS), 'error')
    end

    local gameMode = get_game_mode()
    local region = get_region_list()
    local region_key = table.concat(region, ",")

    local in_lobby = state.user ~= nil and state.user.lobbyId ~= nil

    local endpoint = in_lobby and "update-lobby" or "create-lobby"
    local args
    if in_lobby then
        args = { game = GAME, gameMode = gameMode, region = region, maps = selected_maps }
    else
        args = with_xuid({ game = GAME, gameMode = gameMode, region = region, maps = selected_maps })
    end

    busy.queue = true
    if not api(true, endpoint, args, function(api_success, data)
        if not api_success then
            busy.queue = false
            return
        end
        if data.status ~= true then
            busy.queue = false
            return notify(data.error, 'error')
        end
        state.sent_region_key = region_key
        state.lobby = data.lobby
        if room ~= nil then room.mark() end
        set_queue_hvhgg(true)
    end) then
        busy.queue = false
        notify(L('Unexpected situation'), 'error')
    end
end

local function cancel_queue_hvhgg()
    if busy.queue then return end
    set_queue_hvhgg(false)
end

room = (function()
    local M = {}
    M.code = ''
    M.focus = false
    M.over = false
    M.sent_fp = nil
    M.confirm = nil
    M.confirm_until = 0
    M.confirm_who = nil
    M.open = false
    M.max = 10
    M.held = nil

    local KEYS = {}
    for i = 0, 9 do KEYS[#KEYS + 1] = { 0x30 + i, string.char(48 + i) } end
    for i = 0, 25 do KEYS[#KEYS + 1] = { 0x41 + i, string.char(65 + i) } end
    for i = 0, 9 do KEYS[#KEYS + 1] = { 0x60 + i, string.char(48 + i) } end
    KEYS[#KEYS + 1] = { 0x08, 1 }
    KEYS[#KEYS + 1] = { 0x0D, 2 }

    function M.norm(s)
        s = tostring(s or ''):upper()
        local path = s:match('LOBBY/JOIN/([A-Z0-9%-]+)')
        if path ~= nil then s = path end
        s = s:gsub('[^A-Z0-9]', '')
        if #s > 9 then s = s:sub(1, 9) end
        if #s > 5 then return s:sub(1, 5) .. '-' .. s:sub(6) end
        return s
    end

    function M.ok(s)
        return type(s) == 'string' and #s == 10
            and s:match('^[A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9]%-[A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9]$') ~= nil
    end

    function M.back()
        local s = M.code
        if #s == 0 then return end
        if s:sub(-1) == '-' then s = s:sub(1, -2) end
        if #s > 0 then s = s:sub(1, -2) end
        M.code = M.norm(s)
    end

    function M.poll()
        if not M.focus or input == nil or input.IsButtonDown == nil then
            M.held = nil
            return
        end
        local held = M.held
        if type(held) ~= 'table' then held = {} end
        local now = {}
        for i = 1, #KEYS do
            local vk = KEYS[i][1]
            local ok, v = pcall(input.IsButtonDown, vk)
            if ok and v == true then
                now[vk] = true
                if not held[vk] then
                    local kind = KEYS[i][2]
                    if kind == 1 then
                        M.back()
                    elseif kind == 2 then
                        M.join()
                    else
                        M.code = M.norm(M.code .. kind)
                    end
                end
            end
        end
        M.held = now
    end

    function M.fp_of(mode, maps, region)
        local ms, rs = {}, {}
        if type(maps) == 'table' then
            for i = 1, #maps do ms[i] = maps[i] end
        end
        table.sort(ms)
        if type(region) == 'table' then
            for i = 1, #region do rs[i] = region[i] end
        end
        return tostring(mode or '') .. '|' .. table.concat(ms, ',') .. '|' .. table.concat(rs, ',')
    end

    function M.fp()
        return M.fp_of(get_game_mode(), get_selected_maps(), get_region_list())
    end

    function M.mark()
        M.sent_fp = M.fp()
    end

    function M.seen(lb)
        if M.sent_fp ~= nil then return end
        if type(lb) ~= 'table' then return end
        M.sent_fp = M.fp_of(lb.gameMode, lb.maps, lb.region)
    end

    function M.reset()
        M.sent_fp = nil
        M.focus = false
        M.held = nil
        M.confirm = nil
        M.confirm_until = 0
        M.confirm_who = nil
    end

    function M.in_room()
        local lb = state.lobby
        return lb ~= nil and lb.isValid == true
    end

    function M.party()
        local lb = state.lobby
        if lb == nil or lb.isValid ~= true or type(lb.players) ~= 'table' then return false end
        return #lb.players > 1
    end

    function M.panel()
        if M.in_room() then return true end
        return M.open == true
    end

    function M.is_host()
        local u, lb = state.user, state.lobby
        return u ~= nil and lb ~= nil and lb.isValid == true and lb.hostUid == u.uid
    end

    function M.mode()
        local lb = state.lobby
        if type(lb) == 'table' and type(lb.gameMode) == 'string' and #lb.gameMode > 0 then
            return lb.gameMode
        end
        return get_game_mode()
    end

    function M.code_of()
        local lb = state.lobby
        if type(lb) == 'table' and type(lb.lobbyCode) == 'string' then return lb.lobbyCode end
        return ''
    end

    function M.sync()
        if not M.is_host() then return end
        local u = state.user
        if u == nil or u.state ~= 'IDLE' then return end
        if not cfg.ready or busy.lobby or busy.queue or busy.room then return end
        local maps = get_selected_maps()
        if #maps < min_maps() then return end
        local fp = M.fp()
        if fp == M.sent_fp then return end
        local gameMode = get_game_mode()
        local region = get_region_list()
        send('lobby', true, 'update-lobby', {
            game = GAME, gameMode = gameMode, region = region, maps = maps
        }, function(ok, data)
            if not ok then return end
            if data.status == true then
                M.sent_fp = fp
                state.lobby = data.lobby
                state.sent_region_key = table.concat(region, ',')
            else
                notify(data.error, 'error')
            end
        end)
    end

    function M.join()
        if busy.room or busy.queue then return end
        local code = M.norm(M.code)
        M.code = code
        if not M.ok(code) then return notify(L('Enter a room code like ABCDE-FGHI'), 'error') end
        if not cfg.ready then
            return notify(L('Still loading matchmaking config, try again in a moment'), 'error')
        end
        local user = state.user
        if user ~= nil and user.lobbyId ~= nil then
            return notify(L('Leave your current room first'), 'error')
        end
        if not send('room', true, 'join-lobby', with_xuid({ lobbyCode = code }), function(ok, data)
            if not ok then return end
            if data.status ~= true then
                return notify(data.error or L('Failed to join the room'), 'error')
            end
            state.lobby = data.lobby
            M.seen(data.lobby)
            M.focus = false
            M.open = true
            state.recheck = true
            notify(L('Joined the room'))
        end) then
            notify(L('Unexpected situation'), 'error')
        end
    end

    function M.create()
        if busy.room or busy.queue then return end
        if not cfg.ready then
            return notify(L('Still loading matchmaking config, try again in a moment'), 'error')
        end
        local user = state.user
        if user ~= nil and user.lobbyId ~= nil then
            return notify(L('You are already in a room'), 'error')
        end
        local maps = get_selected_maps()
        local need = min_maps()
        if #maps < need then
            return notify((L('You must select at least %d maps')):format(need), 'error')
        end
        local gameMode = get_game_mode()
        local region = get_region_list()
        if not send('room', true, 'create-lobby', with_xuid({
            game = GAME, gameMode = gameMode, region = region, maps = maps
        }), function(ok, data)
            if not ok then return end
            if data.status ~= true then
                return notify(data.error or L('Failed to create the room'), 'error')
            end
            state.lobby = data.lobby
            state.sent_region_key = table.concat(region, ',')
            M.mark()
            M.open = true
            state.recheck = true
            notify(L('Room created'))
        end) then
            notify(L('Unexpected situation'), 'error')
        end
    end

    function M.leave()
        if busy.room then return end
        if not send('room', true, 'leave-lobby', {}, function(ok, data)
            if not ok then return end
            if data.status ~= true then
                return notify(data.error or L('Failed to leave the room'), 'error')
            end
            if data.user ~= nil then state.user = data.user end
            state.lobby = nil
            state.sent_region_key = nil
            M.reset()
            M.open = false
            state.recheck = true
            notify(L('Left the room'))
        end) then
            notify(L('Unexpected situation'), 'error')
        end
    end

    function M.kick(uid, name)
        if busy.room or type(uid) ~= 'string' or #uid == 0 then return end
        if not send('room', true, 'kick-player', { targetUid = uid }, function(ok, data)
            if not ok then return end
            if data.status ~= true then
                return notify(data.error or L('Failed to kick that player'), 'error')
            end
            state.lobby = data.lobby
            state.recheck = true
            notify((L('Kicked %s')):format(name))
        end) then
            notify(L('Unexpected situation'), 'error')
        end
    end

    function M.copy_code()
        local code = M.code_of()
        if #code == 0 then return notify(L('No room code yet'), 'error') end
        notify(code)
    end

    function M.ask(kind, who)
        if M.confirm == kind and M.confirm_who == who and frame_time < M.confirm_until then
            M.confirm = nil
            M.confirm_who = nil
            return true
        end
        M.confirm = kind
        M.confirm_who = who
        M.confirm_until = frame_time + 5
        return false
    end

    return M
end)()

local PN_BATCH = 12

local pn = {
    name = {},
    want = {},
    n_want = 0,
    inflight = false,
    retry_at = 0,
    off = false,
}

function pn.requeue(batch, n)
    for i = 1, n do
        local x = batch[i]
        if pn.name[x] == nil and not pn.want[x] then
            pn.want[x] = true
            pn.n_want = pn.n_want + 1
        end
    end
end

local function player_name(xuid, fallback)
    if type(xuid) ~= 'string' or #xuid == 0 then return fallback end
    local got = pn.name[xuid]
    if got ~= nil then
        if #got > 0 then return got end
        return fallback
    end
    if not pn.off and not pn.want[xuid] then
        pn.want[xuid] = true
        pn.n_want = pn.n_want + 1
    end
    return fallback
end

local function fetch_player_names()
    if pn.off or pn.inflight or pn.n_want == 0 then return end
    if not state.logged_in or frame_time < pn.retry_at then return end

    local batch, n, left = {}, 0, 0
    for x in pairs(pn.want) do
        if n < PN_BATCH then
            n = n + 1
            batch[n] = x
            pn.want[x] = nil
        else
            left = left + 1
        end
    end
    pn.n_want = left
    if n == 0 then return end

    pn.inflight = true
    local sent = api(true, "steam-players", { steam_ids = batch }, function(ok, data, code)
        pn.inflight = false

        if not ok or data == nil or data.status ~= true or type(data.data) ~= 'table' then
            if code == 401 then
                pn.off = true
                log('[HvH.gg Prime] steam names: off (unauthorized)')
                return
            end
            pn.retry_at = utils.get_unix_time() + 60
            pn.requeue(batch, n)
            return
        end

        for _, it in ipairs(data.data) do
            if type(it) == 'table' and type(it.steam_id) == 'string' then
                local nm = it.name
                if type(nm) ~= 'string' or #nm == 0 or nm == it.steam_id then nm = '' end
                pn.name[it.steam_id] = nm
            end
        end
    end, { soft = true })

    if not sent then
        pn.inflight = false
        pn.retry_at = utils.get_unix_time() + 5
        pn.requeue(batch, n)
    end
end

local steam = {
    items = nil,
    loading = 0,
    retry_at = 0,
    confirm = nil,
    confirm_until = 0,

    page = 1,
    per_page = 6,
}

reset_steam_state = function()
    steam.items = nil
    steam.loading = 0
    steam.retry_at = 0
    steam.confirm = nil
    steam.confirm_until = 0
    steam.page = 1
    pn.off = false
    pn.retry_at = 0
end

local function steam_has(x)
    if steam.items == nil then return nil end
    for _, it in ipairs(steam.items) do
        if it.xuid == x then return true end
    end
    return false
end

local function apply_xuid_list(data)
    if type(data) ~= "table" or type(data.items) ~= "table" then return false end
    steam.items = data.items
    steam.confirm = nil
    return true
end

local function fetch_xuids(force)
    if not state.logged_in then return end
    if steam.loading > 0 then return end
    if steam.items ~= nil and not force then return end

    steam.loading = 1
    if not api(true, "xuids", {}, function(ok, data)
        steam.loading = 0
        if not ok or data == nil or data.status ~= true or not apply_xuid_list(data.data) then
            steam.retry_at = utils.get_unix_time() + 15
        end
    end) then
        steam.loading = 0
        steam.retry_at = utils.get_unix_time() + 5
    end
end

local function link_current_xuid()
    if steam.loading > 0 then return end
    steam.loading = 1
    if not api(true, "link-xuid", with_xuid({}), function(ok, data)
        steam.loading = 0
        if not ok or data == nil then return end
        if data.status ~= true or not apply_xuid_list(data.data) then
            return notify(data.error or L('Failed to link this Steam account'), 'error')
        end
        notify(L('Steam account linked'))
    end) then
        steam.loading = 0
        notify(L('Unexpected situation'), 'error')
    end
end

local function unlink_xuid(x)
    if steam.loading > 0 then return end
    steam.loading = 1

    local function send_unlink()
        if not api(true, "unlink-xuid", { xuid = x }, function(ok, data)
            steam.loading = 0
            if not ok or data == nil then return end
            if data.status ~= true or not apply_xuid_list(data.data) then
                return notify(data.error or L('Failed to unlink this Steam account'), 'error')
            end
            notify(L('Steam account unlinked'))
        end) then
            steam.loading = 0
            notify(L('Unexpected situation'), 'error')
        end
    end

    if state.user == nil or state.user.lobbyId == nil then return send_unlink() end

    if not api(true, "leave-lobby", {}, function(ok, data)
        if not ok or data == nil then
            steam.loading = 0
            return
        end
        if data.status ~= true then
            steam.loading = 0
            return notify(data.error or L('Failed to leave your lobby'), 'error')
        end
        if data.user ~= nil then state.user = data.user end
        state.lobby = nil
        state.sent_region_key = nil
        if room ~= nil then room.reset() end
        notify(L('Left your lobby to unlink this Steam account'))
        send_unlink()
    end) then
        steam.loading = 0
        notify(L('Unexpected situation'), 'error')
    end
end

local stats = {
    profile = nil,
    matches = nil,
    board = nil,
    loading = 0,
    fetched_at = 0,
    error = nil,
}

local STATS_TTL = 60

local function fetch_stats(force)
    if not state.logged_in then return end
    if stats.loading > 0 then return end
    local now = utils.get_unix_time()
    if not force and stats.fetched_at > 0 and now - stats.fetched_at < STATS_TTL then return end

    stats.error = nil
    stats.loading = 1

    local function finish(done)
        stats.loading = 0
        if done then stats.fetched_at = utils.get_unix_time() end
    end

    local function take(data, apply)
        if data == nil then return end
        if data.status ~= true or data.data == nil then
            stats.error = data.error or L('Failed to load stats')
            return
        end
        apply(data.data)
    end

    local function step_board()
        if not api(true, "leaderboard", { startIndex = 0, count = 10 }, function(ok, data)
            if ok then take(data, function(d) stats.board = d.items end) end
            finish(ok)
        end) then finish(false) end
    end

    local function step_matches()
        if not api(true, "matches", { xuid = my_xuid, startIndex = 0, count = 8 }, function(ok, data)
            if ok then take(data, function(d) stats.matches = d.items end) end
            step_board()
        end) then finish(false) end
    end

    if not api(true, "profile", { xuid = my_xuid }, function(ok, data)
        if ok then take(data, function(d) stats.profile = d end) end
        step_matches()
    end) then finish(false) end
end

log('[HvH.gg Prime] load: logic ok')

local UI = {
    init_done = false,
    ok = false,
    w = 440,
    x = settings.x,
    y = settings.y,
    interactive = false,
    cx = 0, cy = 0,
    clicked = false,
    down = false,
    drag = false,
    drag_dx = 0, drag_dy = 0,
    measuring = false,
    bottom = 0,
    lang_w = 32,
    free_total = 20,
    page = 'play',
    first_draw_logged = false,
}

local F = {}
local C = {}

local host = { ref = nil, dead = false, gone = false, beat = 0 }

host.n = (rawget(_G, '__hvhgg_prime_n') or 0) + 1
rawset(_G, '__hvhgg_prime_n', host.n)

if GetScriptName ~= nil then
    local ok, nm = pcall(GetScriptName)
    if ok and type(nm) == 'string' and #nm > 0 then host.script = nm end
end

do
    local was = rawget(_G, '__hvhgg_prime')
    rawset(_G, '__hvhgg_prime', host)
    if type(was) == 'table' then
        was.dead = true
        log('[HvH.gg Prime] load: superseding a previous instance')
    end
end

function host.alive(o)
    if o == nil then return false end
    local ok, v = pcall(o.IsActive, o)
    return ok and v == true
end

function host.init()
    if gui == nil or gui.Reference == nil then
        log('[HvH.gg Prime] ui: no gui.Reference, panel will stay hidden')
        return
    end

    local ok, obj = pcall(gui.Reference, 'Menu')
    if ok and obj ~= nil and obj.IsActive ~= nil then host.ref = obj end

    log('[HvH.gg Prime] ui: host menu=' .. tostring(host.ref ~= nil))
end

function host.open()
    return host.alive(host.ref)
end

function host.shutdown()
    if host.gone then return end
    host.gone = true
    host.dead = true

    if rawget(_G, '__hvhgg_prime') == host then rawset(_G, '__hvhgg_prime', nil) end
    log('[HvH.gg Prime] unload: done')
end

local FT = {
    names = { 'Microsoft YaHei UI', 'Microsoft YaHei', 'Noto Sans SC', 'SimHei', 'SimSun', 'Segoe UI', 'Tahoma' },
    size = { main = 13, bold = 13, title = 17 },
}

function FT.make(name, size, weight)
    if draw.CreateFont == nil then return nil end
    local ok, f = pcall(draw.CreateFont, name, size, weight, false, true)
    if not ok or f == nil then return nil end
    return f
end

function FT.cjk(f)
    if f == nil or draw.SetFont == nil or draw.GetTextSize == nil then return 0 end
    local ok, w = pcall(function()
        draw.SetFont(f)
        return (draw.GetTextSize('中文'))
    end)
    if not ok or type(w) ~= 'number' then return 0 end
    return w
end

apply_language = function(n)
    if T.no_cjk or n == T.lang then return end
    settings.lang = n
    T.lang = n
    save_settings()
    log('[HvH.gg Prime] ui: language from account = ' .. tostring(n))
end

local function ui_init()
    local pick, main, wide = nil, nil, false

    for i = 1, #FT.names do
        local f = FT.make(FT.names[i], FT.size.main, 400)
        if f ~= nil then
            local w = FT.cjk(f)
            if pick == nil then pick, main = FT.names[i], f end
            if w > 0 then
                pick, main, wide = FT.names[i], f, true
                break
            end
        end
    end

    F.main = main
    F.bold = pick and FT.make(pick, FT.size.bold, 700) or main
    F.title = pick and FT.make(pick, FT.size.title, 700) or main
    if F.bold == nil then F.bold = main end
    if F.title == nil then F.title = main end

    if not wide then
        T.no_cjk = true
        T.lang = 1
    end

    log('[HvH.gg Prime] ui: font ' .. tostring(pick) .. ' cjk=' .. tostring(wide))

    C.bg        = { 30, 30, 30, 250 }
    C.title_bg  = { 39, 39, 39, 255 }
    C.panel     = { 48, 48, 48, 255 }
    C.line      = { 255, 255, 255, 30 }
    C.text      = { 255, 255, 255, 255 }
    C.text_dim  = { 255, 255, 255, 179 }
    C.text_mute = { 255, 255, 255, 97 }
    C.chip      = { 255, 255, 255, 20 }
    C.hover     = { 255, 255, 255, 22 }
    C.shadow    = { 0, 0, 0, 110 }

    C.primary       = { 25, 118, 210, 255 }
    C.primary_light = { 144, 202, 249, 255 }
    C.on_primary    = { 255, 255, 255, 255 }

    C.vip       = { 249, 115, 22, 255 }
    C.svip      = { 192, 132, 252, 255 }

    C.mod       = { 56, 189, 248, 255 }
    C.admin     = { 239, 68, 68, 255 }
    C.dhdj      = { 250, 204, 21, 255 }
    C.on_dhdj   = { 30, 30, 30, 255 }

    C.good      = { 102, 187, 106, 255 }
    C.warn      = { 255, 167, 38, 255 }
    C.danger    = { 211, 47, 47, 255 }
    C.danger_lt = { 244, 67, 54, 255 }

    UI.ok = true
end

local CH = {
    max = 2048,
    ascii = {},
    size = {},
    upper = {},
    ell = {},
    wrap = {},
    n = { ascii = 0, size = 0, upper = 0, ell = 0, wrap = 0 },
}

function CH.room(name)
    if CH.n[name] < CH.max then return false end
    CH[name] = {}
    CH.n[name] = 0
    return true
end

function CH.put(name, key, value)
    CH.room(name)
    CH[name][key] = value
    CH.n[name] = CH.n[name] + 1
    return value
end

function CH.u8(s, i)
    local b = s:byte(i)
    if b == nil then return i + 1 end
    if b >= 0xF0 then return i + 4 end
    if b >= 0xE0 then return i + 3 end
    if b >= 0xC0 then return i + 2 end
    return i + 1
end

local function is_ascii(s)
    local v = CH.ascii[s]
    if v ~= nil then return v end
    return CH.put('ascii', s, s:find('[\128-\255]') == nil)
end

local function mod_a(col, v)
    return { col[1], col[2], col[3], col[4] * v }
end

local function set_color(col)
    if col == nil then return end
    draw.Color(col[1], col[2], col[3], col[4])
end

local function screen_size()
    if draw.GetScreenSize == nil then return 1920, 1080 end
    local ok, w, h = pcall(draw.GetScreenSize)
    if not ok or type(w) ~= 'number' or type(h) ~= 'number' then return 1920, 1080 end
    return w, h
end

local function snap(v)
    return math.floor(v + 0.5)
end

local function fill(x, y, w, h, col, round)
    if UI.measuring then return end
    set_color(col)
    local x1, y1, x2, y2 = snap(x), snap(y), snap(x + w), snap(y + h)
    if round ~= nil and round > 0 and draw.RoundedRectFill ~= nil then
        draw.RoundedRectFill(x1, y1, x2, y2, round)
    else
        draw.FilledRect(x1, y1, x2, y2)
    end
end

local function stroke(x, y, w, h, col, round)
    if UI.measuring then return end
    set_color(col)
    local x1, y1, x2, y2 = snap(x), snap(y), snap(x + w), snap(y + h)
    if round ~= nil and round > 0 and draw.RoundedRect ~= nil then
        draw.RoundedRect(x1, y1, x2, y2, round)
    else
        draw.OutlinedRect(x1, y1, x2, y2)
    end
end

local cur_font = nil

local function use_font(font)
    if font == nil then return false end
    if cur_font ~= font then
        draw.SetFont(font)
        cur_font = font
    end
    return true
end

local function raw_size(font, s)
    local per = CH.size[font]
    if per ~= nil then
        local v = per[s]
        if v ~= nil then return v[1], v[2] end
    end

    local w, h = #s * 7, 13
    if use_font(font) then
        local ok, a, b = pcall(draw.GetTextSize, s)
        if ok and type(a) == 'number' then
            w = a
            if type(b) == 'number' and b > 0 then h = b end
        end
    end

    if CH.room('size') then per = nil end
    if per == nil then
        per = {}
        CH.size[font] = per
    end
    per[s] = { w, h }
    CH.n.size = CH.n.size + 1
    return w, h
end

local function text_size(font, s)
    if font == nil then return #s * 7, 13 end
    return raw_size(font, s)
end

local function shadow(x, y, w, h)
    if UI.measuring or draw.ShadowRect == nil then return end
    set_color(C.shadow)
    draw.ShadowRect(snap(x), snap(y), snap(x + w), snap(y + h), 6)
end

local function text(font, x, y, s, col)
    if UI.measuring then return end
    if not use_font(font) then return end
    set_color(col)
    draw.Text(snap(x), snap(y), s)
end

local function text_center(font, cx, y, s, col)
    local w = text_size(font, s)
    text(font, cx - w * 0.5, y, s, col)
end

local function text_right(font, rx, y, s, col)
    local w = text_size(font, s)
    text(font, rx - w, y, s, col)
end

local function char_width(font, ch)
    if font == nil then return 7 end
    return (raw_size(font, ch))
end

local function spaced_width(font, s, sp)
    if font == nil or not is_ascii(s) then return text_size(font, s) end
    local total = 0
    for i = 1, #s do total = total + char_width(font, s:sub(i, i)) + sp end
    return total - sp
end

local function text_spaced(font, x, y, s, col, sp)
    if font == nil then return end
    if not is_ascii(s) then return text(font, x, y, s, col) end
    if UI.measuring then return end
    if not use_font(font) then return end
    set_color(col)
    for i = 1, #s do
        local ch = s:sub(i, i)
        if ch ~= ' ' then
            draw.Text(snap(x), snap(y), ch)
        end
        x = x + char_width(font, ch) + sp
    end
end

local function upper_of(s)
    local v = CH.upper[s]
    if v ~= nil then return v end
    return CH.put('upper', s, s:upper())
end

local function ellipsize(font, s, max_w)
    local c = CH.ell[s]
    if c ~= nil and c.f == font and c.w == max_w then return c.out end

    local out = s
    if text_size(font, s) > max_w then
        local kept, i = nil, 1
        while i <= #s do
            local j = CH.u8(s, i)
            if text_size(font, s:sub(1, j - 1) .. '...') > max_w then break end
            kept = s:sub(1, j - 1)
            i = j
        end
        if kept ~= nil then out = kept .. '...' end
    end

    CH.put('ell', s, { f = font, w = max_w, out = out })
    return out
end

local function wrap_lines(font, s, max_w)
    s = tostring(s)
    local c = CH.wrap[s]
    if c ~= nil and c.f == font and c.w == max_w then return c.lines end

    local function token_end(raw, i)
        local b = raw:byte(i)
        if b >= 128 then return CH.u8(raw, i) end
        if b == 32 then return i + 1 end
        local j = i
        while j <= #raw do
            local n = raw:byte(j)
            if n >= 128 or n == 32 then break end
            j = j + 1
        end
        return j
    end

    local out = {}
    for raw in (s .. "\n"):gmatch("([^\n]*)\n") do
        if text_size(font, raw) <= max_w then
            out[#out + 1] = raw
        else
            local cur, i = "", 1
            while i <= #raw do
                local j = token_end(raw, i)
                local tok = raw:sub(i, j - 1)
                i = j
                if tok ~= " " or #cur > 0 then
                    if #cur > 0 and text_size(font, cur .. tok) > max_w then
                        out[#out + 1] = cur
                        cur = (tok == " ") and "" or tok
                    else
                        cur = cur .. tok
                    end
                end
            end
            if #cur > 0 then out[#out + 1] = cur end
        end
    end

    CH.put('wrap', s, { f = font, w = max_w, lines = out })
    return out
end

local function hit(x, y, w, h)
    if UI.measuring or not UI.interactive then return false end
    return UI.cx >= x and UI.cx <= x + w and UI.cy >= y and UI.cy <= y + h
end

local LINE_H = 16

local function line_height(font, s)
    local _, h = text_size(font, s)
    if h + 2 > LINE_H then return h + 2 end
    return LINE_H
end

local function row_h()
    if UI.row_frame ~= frame_id then
        UI.row_frame = frame_id
        local h = 15
        if F.main ~= nil then local _; _, h = raw_size(F.main, 'Ag') end
        UI.row_value = (h + 3 > 18) and (h + 3) or 18
    end
    return UI.row_value
end

local function paragraph(x, y, w, s, col)
    local lines = wrap_lines(F.main, s, w)
    local lh = line_height(F.main, lines[1] or '')
    for i = 1, #lines do
        text(F.main, x, y + (i - 1) * lh, lines[i], col or C.text_dim)
    end
    return #lines * lh
end

local R_SURFACE = 4
local R_BUTTON = 4
local R_CHIP = 4
local LS_BUTTON = 0.6
local LS_OVERLINE = 1.4

local function button(x, y, w, h, label, style, disabled)
    local latin = is_ascii(label)
    if latin then label = upper_of(label) end
    local over = (not disabled) and hit(x, y, w, h)

    local base = nil
    local fg = C.primary_light
    local outlined = false

    if style == 'primary' then
        base = C.primary
        fg = C.on_primary
    elseif style == 'danger' then
        base = C.danger
        fg = C.on_primary
    elseif style == 'ghost' then
        fg = C.primary_light
    elseif style == 'quiet' then
        fg = C.text_dim
    else
        outlined = true
    end

    if disabled then
        base = C.chip
        fg = C.text_mute
        outlined = false
    end

    if base ~= nil then
        fill(x, y, w, h, base, R_BUTTON)
    elseif outlined then
        stroke(x, y, w, h, C.line, R_BUTTON)
    end
    if over then fill(x, y, w, h, C.hover, R_BUTTON) end

    local tw, th = text_size(F.bold, label)
    if latin then
        tw = spaced_width(F.bold, label, LS_BUTTON)
        text_spaced(F.bold, x + (w - tw) * 0.5, y + (h - th) * 0.5, label, fg, LS_BUTTON)
    else
        text(F.bold, x + (w - tw) * 0.5, y + (h - th) * 0.5, label, fg)
    end
    return over and UI.clicked
end

local function url_field(x, y, w, url)
    local over = hit(x, y, w, 30)
    fill(x, y, w, 30, C.panel, 6)
    if over then fill(x, y, w, 30, C.hover, 6) end
    text(F.main, x + 10, y + 9, ellipsize(F.main, tostring(url), w - 20), C.text_dim)
    return over and UI.clicked
end

local function chip(x, y, w, h, label, selected)
    local over = hit(x, y, w, h)
    fill(x, y, w, h, selected and C.primary or C.chip, R_CHIP)
    if over then fill(x, y, w, h, C.hover, R_CHIP) end
    local tw, th = text_size(F.main, label)
    text(F.main, x + (w - tw) * 0.5, y + (h - th) * 0.5, label, selected and C.on_primary or C.text_dim)
    return over and UI.clicked
end

local function section(x, y, w, label, right_label)
    local sep = line_height(F.main, label) + 2
    if is_ascii(label) then
        text_spaced(F.main, x, y, upper_of(label), C.text_mute, LS_OVERLINE)
    else
        text(F.main, x, y, label, C.text_mute)
    end
    if right_label ~= nil then
        text_right(F.main, x + w, y, right_label, C.text_mute)
    end
    fill(x, y + sep, w, 1, C.line)
    return sep + 10
end

local PAD = 14
local TITLE_H = 38

local function act(fn) UI.action = fn end

local function logout_button(x, y, w, h)
    local confirming = frame_time < (UI.logout_until or 0)
    if button(x, y, w, h, confirming and L('Sure?') or L('Logout'), confirming and 'danger' or 'quiet') then
        if confirming then
            act(function()
                UI.logout_until = 0
                do_logout()
            end)
        else
            local deadline = frame_time + 5
            act(function() UI.logout_until = deadline end)
        end
    end
end

local RULES = {
    { 'playerAccept', 'Ready Required' },
    { 'teleportation', 'Teleportation' },
    { 'dedicatedIp', 'DDoS Protection' },
    { 'wallbang', 'Wallbang' },
    { 'noSpread', 'No Spread' },
    { 'rapidFire', 'Rapid Fire' },
    { 'dtMode', 'DT Mode' },
    { 'pingBalance', 'Ping Balance' },
    { 'restrictAwp', 'AWP / Team' },
    { 'restrictScout', 'Scout / Team' },
    { 'restrictAuto', 'Auto / Team' },
    { 'airAccelerate', 'Air Accelerate' },
    { 'allowRadar', 'Web Radar' },
    { 'allowSpectators', 'Spectators' },
    { 'recordDemo', 'Record Demo' },
    { 'voteMode', 'Vote Mode' },
    { 'overtime', 'Overtime' },
    { 'knifeRound', 'Knife Round' },
}

local function rule_value(k, v)
    if k == 'dtMode' then
        local n = tonumber(v) or 0
        return L((n >= 2 and 'Blocked') or (n == 1 and 'Limited') or 'Unrestricted'),
            (n > 0) and C.good or C.danger_lt
    end
    if k == 'airAccelerate' then
        return tostring(math.floor(tonumber(v) or 0)), C.primary_light
    end
    if k == 'pingBalance' then
        local n = tonumber(v) or 0
        if n > 0 then return ('%dms'):format(n), C.primary_light end
        return L('Off'), C.danger_lt
    end
    if k == 'restrictAwp' or k == 'restrictScout' or k == 'restrictAuto' then
        local n = tonumber(v)
        if n == nil or n < 0 then return L('Unlimited'), C.primary_light end
        return (L('%d guns')):format(n), C.primary_light
    end
    if v == true then return L('On'), C.good end
    return L('Off'), C.danger_lt
end

local function build_match_settings(x, y, w)
    local e = mode_entry(get_game_mode())
    local s = (e ~= nil and type(e.settings) == 'table') and e.settings or nil
    if s == nil then return 0 end

    local y0, hdr_y = y, y
    y = y + section(x, y, w, L('Match settings'))
    if button(x + w - 62, hdr_y - 4, 62, 22, settings.rules and L('Hide') or L('Show'), 'ghost') then
        act(function()
            settings.rules = not settings.rules
            save_settings()
        end)
    end
    if not settings.rules then return y - y0 end

    local cw, rh, n = (w - 16) * 0.5, row_h(), 0
    for i = 1, #RULES do
        local v = s[RULES[i][1]]
        if v ~= nil then
            local bx = x + (n % 2) * (cw + 16)
            local by = y + math.floor(n / 2) * rh
            local txt, col = rule_value(RULES[i][1], v)
            local tw = text_size(F.main, txt)
            text_right(F.main, bx + cw, by, txt, col)
            text(F.main, bx, by, ellipsize(F.main, L(RULES[i][2]), cw - tw - 8), C.text_dim)
            n = n + 1
        end
    end
    return (y - y0) + math.ceil(n / 2) * rh + 4
end

local function build_logged_out(x, y, w)
    local y0 = y
    if state.login_session ~= nil then
        y = y + paragraph(x, y, w, L('Confirm this login in your browser.')) + 10
        if url_field(x, y, w, state.login_url) then
            act(function() open_link(state.login_url, 'Confirm the login in your browser') end)
        end
        y = y + 40
        if button(x, y, 110, 32, L('Open link')) then act(function() open_link(state.login_url, 'Confirm the login in your browser') end) end
        if button(x + 120, y, 110, 32, L('Cancel'), 'ghost') then act(cancel_login) end
        y = y + 32
    else
        y = y + paragraph(x, y, w, L('Sign in with your mmhvh.com account to start matchmaking. Your browser will open for confirmation.')) + 12
        if button(x, y, 130, 34, L('Login'), 'primary', busy.login) then act(start_login) end
        y = y + 34
    end
    return y - y0
end

local function build_idle(x, y, w)
    local y0 = y

    if steam_has(my_xuid) == false then
        y = y + paragraph(x, y, w,
            L('The Steam account you are playing on is not linked to your HvH.gg Prime account. Link it before queueing.'),
            C.warn) + 8
        if button(x, y, 170, 34, L('Link this Steam'), 'primary', steam.loading > 0) then
            act(link_current_xuid)
        end
        y = y + 42
    end

    if not cfg.ready then
        return (y - y0) + paragraph(x, y, w, L('Loading matchmaking config...'))
    end

    y = y + section(x, y, w, L('Game mode'))
    local cw = (w - 8) * 0.5
    for i = 1, #cfg.modes do
        local col = (i - 1) % 2
        local row = math.floor((i - 1) / 2)
        local m = cfg.modes[i]
        if chip(x + col * (cw + 8), y + row * 38, cw, 32, mode_label(m.id), settings.mode == m.id) then
            act(function() settings.mode = m.id; save_settings() end)
        end
    end
    y = y + math.ceil(#cfg.modes / 2) * 38 + 6

    y = y + build_match_settings(x, y, w)

    local rn, rtext = region_summary()
    y = y + section(x, y, w, L('Region'), region_count_text(rn))
    local rw = (w - 12) / 3
    local order = ordered_region_groups()
    for i = 1, #order do
        local gi = order[i]
        local col = (i - 1) % 3
        local row = math.floor((i - 1) / 3)
        if chip(x + col * (rw + 6), y + row * 36, rw, 30, L(REGION_GROUPS[gi].label), settings.region == gi) then
            act(function() settings.region = gi; save_settings() end)
        end
    end
    y = y + math.ceil(#order / 3) * 36 + 2
    text(F.main, x, y, ellipsize(F.main, rtext, w), C.text_mute)
    y = y + 20

    local picked = count_selected_maps()
    local need = min_maps()

    if not vote_mode_on() then
        local names, set = active_map_names(), active_map_set()
        local hdr_y = y
        y = y + section(x, y, w, L('Map pool'))
        text_right(F.main, x + w - 116, hdr_y, (L('%d/%d  (min %d)')):format(picked, #names, need), C.text_mute)

        if button(x + w - 106, hdr_y - 4, 50, 22, L('All'), 'ghost') then
            act(function()
                for _, n in ipairs(names) do set[n] = true end
                save_settings()
            end)
        end
        if button(x + w - 52, hdr_y - 4, 52, 22, L('None'), 'ghost') then
            act(function()
                for _, n in ipairs(names) do set[n] = false end
                save_settings()
            end)
        end

        local mw = (w - 8) * 0.5
        for i = 1, #names do
            local col = (i - 1) % 2
            local row = math.floor((i - 1) / 2)
            local n = names[i]
            if chip(x + col * (mw + 8), y + row * 34, mw, 28, map_label(n), set[n] == true) then
                act(function() set[n] = not (set[n] == true); save_settings() end)
            end
        end
        y = y + math.ceil(#names / 2) * 34 + 10
    end

    if room.in_room() then
        y = y + room.build_bar(x, y, w)
        local enough = picked >= need
        if button(x, y, w, 38, L('Start queue'), 'primary', busy.queue or busy.room or (not enough)) then
            act(start_queue_hvhgg)
        end
        y = y + 38
        if not enough then
            y = y + 6
            y = y + paragraph(x, y, w, (L('Select at least %d maps to queue.')):format(need), C.warn)
        end
    elseif room.open then
        y = y + room.build_join(x, y, w)
    else
        local enough = picked >= need
        if button(x, y, w, 38, L('Start queue'), 'primary', busy.queue or busy.room or (not enough)) then
            act(start_queue_hvhgg)
        end
        y = y + 42
        if button(x, y, w, 32, L('Create or join room'), 'ghost') then
            act(function() room.open = true end)
        end
        y = y + 32
        if not enough then
            y = y + 6
            y = y + paragraph(x, y, w, (L('Select at least %d maps to queue.')):format(need), C.warn)
        end
    end

    return y - y0
end

local function build_matchmaking(x, y, w)
    local y0 = y

    local elapsed = 0
    if state.lobby ~= nil and state.lobby.startedAt ~= nil then
        elapsed = frame_time - math.floor(state.lobby.startedAt / 1000)
        if elapsed < 0 then elapsed = 0 end
    end

    local rn, rtext = region_summary()

    fill(x, y, w, 86, C.panel, 8)
    text(F.main, x + 14, y + 12, L('Searching for a match'), C.text_mute)
    text(F.title, x + 14, y + 30, ("%02d:%02d"):format(math.floor(elapsed / 60), elapsed % 60), C.text)
    text_right(F.main, x + w - 14, y + 32, mode_label(room.mode()), C.text_dim)
    fill(x + 14, y + 58, w - 28, 1, C.line)
    text(F.main, x + 14, y + 62, region_count_text(rn), C.text_dim)
    text_right(F.main, x + w - 14, y + 62, ellipsize(F.main, rtext, w - 110), C.text_mute)
    y = y + 96

    if room.in_room() then
        y = y + room.build_bar(x, y, w)
    end

    local total, q5, q2, q1 = 0, 0, 0, 0
    local has_counts = state.queueCount ~= nil
    if has_counts then
        total = state.queueCount.total or 0
        local per = state.queueCount.cs2 or {}
        q5 = per.C5v5 or 0
        q2 = (per.C2v2 or 0) + (per.W2v2 or 0)
        q1 = (per.C1v1 or 0) + (per.W1v1 or 0)
    end

    y = y + section(x, y, w, L('Players in queue'),
        has_counts and (L('%d total')):format(total) or L('no data'))
    local qw = (w - 12) / 3
    local entries = { { '5v5', q5 }, { '2v2', q2 }, { '1v1', q1 } }
    for i = 1, 3 do
        local bx = x + (i - 1) * (qw + 6)
        fill(bx, y, qw, 40, C.panel, 6)
        text_center(F.title, bx + qw * 0.5, y + 6, tostring(entries[i][2]), C.text)
        text_center(F.main, bx + qw * 0.5, y + 24, entries[i][1], C.text_mute)
    end
    y = y + 50

    if room.is_host() then
        if button(x, y, w, 36, L('Stop queue'), 'danger', busy.queue) then act(cancel_queue_hvhgg) end
        y = y + 36
    end

    return y - y0
end

local MATCH_STATE_TEXT = {
    WAITING_FOR_PLAYERS = 'Match found! Waiting for players to accept...',
    WAITING_FOR_SERVER  = 'Match found! Loading server...',
    WAITING_FOR_GAME    = 'Match found! Waiting for server to start...',
}

vote = (function()
    local M = {}

    local sel = {}
    local round_key = nil
    local round_max = 0
    local want_ep, want_args, want_fp, sent_fp = nil, nil, nil, nil

    local SIDES = { 'CounterTerrorist', 'Terrorist' }

    local function region_label(id)
        for i = 1, #regions do
            if regions[i].name == id then return L(regions[i].label) end
        end
        return id
    end

    local function left_sec(vm)
        local d = tonumber(vm.phaseDeadline)
        if d == nil then return 0 end
        local n = math.floor(d / 1000) - frame_time
        if n < 0 then return 0 end
        return n
    end

    local function resync(vm)
        local key = tostring(vm.phase) .. '|' .. tostring(vm.currentRound) .. '|' .. tostring(vm.currentTurn)
        if key == round_key then return end
        round_key = key
        round_max = 0
        want_ep, want_args, want_fp, sent_fp = nil, nil, nil, nil
        sel = {}
        if type(vm.myMapVote) == 'table' then
            for i = 1, #vm.myMapVote do sel[i] = vm.myMapVote[i] end
        end
    end

    local function flush()
        if want_fp == nil or want_fp == sent_fp then return end
        if busy.vote then return end
        local fp = want_fp
        send('vote', true, want_ep, want_args, function(api_success, data)
            if not api_success then return end
            sent_fp = fp
            if data.status ~= true then
                notify(data.error or L('Failed to submit your vote'), 'error')
                round_key = nil
            end
        end)
    end

    local function submit(ep, args, fp)
        want_ep, want_args, want_fp = ep, args, fp
        flush()
    end

    function M.sync()
        local m = state.match
        if m == nil or m.state ~= 'VOTING' or m.voteMode == nil then return end
        resync(m.voteMode)
        flush()
    end

    local function sel_index(id)
        for i = 1, #sel do
            if sel[i] == id then return i end
        end
        return nil
    end

    local function send_maps()
        local copy = {}
        for i = 1, #sel do copy[i] = sel[i] end
        submit('vote-map', { maps = copy }, 'm:' .. table.concat(copy, ','))
    end

    local function click_map(id, k)
        local i = sel_index(id)
        if i ~= nil then
            if k <= 1 then return end
            table.remove(sel, i)
            return
        end
        if k <= 1 then
            sel = { id }
            return send_maps()
        end
        if #sel >= k then return end
        sel[#sel + 1] = id
        if #sel == k then send_maps() end
    end

    local function cell(x, y, w, h, label, tag, tag_col, selected, clickable)
        local over = clickable and hit(x, y, w, h)
        fill(x, y, w, h, selected and C.primary or C.chip, R_CHIP)
        if over then fill(x, y, w, h, C.hover, R_CHIP) end

        local fg = C.text_dim
        if selected then fg = C.on_primary elseif not clickable then fg = C.text_mute end

        local tw = 0
        if tag ~= nil then tw = text_size(F.main, tag) + 8 end
        local _, th = text_size(F.main, 'Ag')
        text(F.main, x + 8, y + (h - th) * 0.5, ellipsize(F.main, label, w - 16 - tw), fg)
        if tag ~= nil then
            text_right(F.main, x + w - 8, y + (h - th) * 0.5, tag, selected and C.on_primary or tag_col)
        end
        return over and UI.clicked
    end

    local function time_bar(x, y, w, vm)
        local n = left_sec(vm)
        if n > round_max then round_max = n end
        local frac = 0
        if round_max > 0 then frac = n / round_max end
        if frac > 1 then frac = 1 elseif frac < 0 then frac = 0 end
        fill(x, y, w, 4, C.chip, 2)
        if frac > 0 then
            fill(x, y, w * frac, 4, (n <= 5) and C.warn or C.primary_light, 2)
        end
        return n
    end

    function M.build(x, y, w)
        local vm = state.match.voteMode
        if vm == nil then
            return paragraph(x, y, w, L('Waiting for the server...'))
        end
        resync(vm)

        local y0 = y
        local phase = vm.phase
        local mine = vm.myTeam
        local active = vm.currentTurn
        if phase == 'SIDE_PICK' then active = vm.sidePickerTeam end
        local my_turn = mine ~= nil and active ~= nil and mine == active

        local title = L('Map ban')
        if phase == 'SIDE_PICK' then title = L('Side pick')
        elseif phase == 'REGION_VOTE' then title = L('Region vote')
        elseif phase == 'CAPTAIN_DRAFT' then title = L('Captain draft')
        elseif phase == 'COMPLETED' then title = L('Vote complete') end

        local head_h = (phase == 'COMPLETED') and 46 or 66
        fill(x, y, w, head_h, C.panel, 8)
        text(F.main, x + 14, y + 10, title, C.text_mute)
        if phase == 'MAP_BAN' or phase == 'CAPTAIN_DRAFT' then
            text_right(F.main, x + w - 14, y + 10, (L('Round %d')):format(vm.currentRound or 1), C.text_mute)
        end

        local line, line_col = nil, C.text
        if phase == 'MAP_BAN' then
            line = my_turn and L('Your turn to ban') or L('Opponent is banning')
            line_col = my_turn and C.primary_light or C.text
        elseif phase == 'SIDE_PICK' then
            line = my_turn and L('You pick the starting side') or L('Opponent picks the starting side')
            line_col = my_turn and C.primary_light or C.text
        elseif phase == 'REGION_VOTE' then
            line = L('Everyone votes for the server region')
        elseif phase == 'CAPTAIN_DRAFT' then
            line = L('Captains are picking players')
        else
            line = L('Waiting for the server...')
        end
        local n = 0
        if phase ~= 'COMPLETED' then
            n = time_bar(x + 14, y + 52, w - 28, vm)
            text_right(F.main, x + w - 14, y + 26, ('%ds'):format(n), (n <= 5) and C.warn or C.text_mute)
            text(F.bold, x + 14, y + 26, ellipsize(F.bold, line, w - 28 - 46), line_col)
        else
            text(F.bold, x + 14, y + 26, ellipsize(F.bold, line, w - 28), line_col)
        end
        y = y + head_h + 10

        local live = n > 0

        if phase == 'MAP_BAN' then
            local by = vm.bannedBy
            if type(by) ~= 'table' then by = {} end
            local off = {}
            if type(vm.disabledMaps) == 'table' then
                for i = 1, #vm.disabledMaps do off[vm.disabledMaps[i]] = true end
            end
            local alive = {}
            for i = 1, #vm.remaining do alive[vm.remaining[i]] = true end

            local k = vm.banPerRound or 1
            local right = nil
            if my_turn then
                right = (k <= 1) and (L('Pick %d')):format(k) or (L('Selected %d/%d')):format(#sel, k)
            end
            y = y + section(x, y, w, L('Map'), right)

            local pool = vm.pool
            if type(pool) ~= 'table' or #pool == 0 then pool = vm.remaining end
            local cw = (w - 8) * 0.5
            for i = 1, #pool do
                local id = pool[i]
                local cx = x + ((i - 1) % 2) * (cw + 8)
                local cy = y + math.floor((i - 1) / 2) * 34
                local tag, tag_col, clickable = nil, C.text_mute, false
                if off[id] then
                    tag = L('Disabled')
                elseif not alive[id] then
                    tag = by[id] ~= nil and (L('Banned') .. ' ' .. by[id]) or L('Banned')
                    tag_col = C.danger_lt
                else
                    local cnt = 0
                    if type(vm.mapTally) == 'table' then cnt = tonumber(vm.mapTally[id]) or 0 end
                    if cnt > 0 then tag = tostring(cnt); tag_col = C.warn end
                    clickable = my_turn and live
                end
                if cell(cx, cy, cw, 30, map_label(id), tag, tag_col, sel_index(id) ~= nil, clickable) then
                    act(function() click_map(id, k) end)
                end
            end
            y = y + math.ceil(#pool / 2) * 34 + 4

        elseif phase == 'SIDE_PICK' then
            y = y + section(x, y, w, L('Starting side'))
            local bw = (w - 8) * 0.5
            for i = 1, 2 do
                local id = SIDES[i]
                local cnt = 0
                if type(vm.sideTally) == 'table' then cnt = tonumber(vm.sideTally[id]) or 0 end
                local tag = nil
                if cnt > 0 then tag = tostring(cnt) end
                if cell(x + (i - 1) * (bw + 8), y, bw, 40, L(id), tag, C.warn,
                        vm.mySideVote == id, my_turn and live) then
                    act(function() submit('vote-side', { side = id }, 's:' .. id) end)
                end
            end
            y = y + 48

        elseif phase == 'REGION_VOTE' then
            local cands = vm.candidateRegions
            if type(cands) ~= 'table' then cands = {} end
            y = y + section(x, y, w, L('Region'))
            local cw = (w - 8) * 0.5
            for i = 1, #cands do
                local id = cands[i]
                local cnt = 0
                if type(vm.regionTally) == 'table' then cnt = tonumber(vm.regionTally[id]) or 0 end
                local tag = nil
                if cnt > 0 then tag = tostring(cnt) end
                local cx = x + ((i - 1) % 2) * (cw + 8)
                local cy = y + math.floor((i - 1) / 2) * 34
                if cell(cx, cy, cw, 30, region_label(id), tag, C.warn, vm.myRegionVote == id, live) then
                    act(function() submit('vote-region', { region = id }, 'r:' .. id) end)
                end
            end
            y = y + math.ceil(#cands / 2) * 34 + 4

        elseif phase == 'CAPTAIN_DRAFT' then
            y = y + section(x, y, w, L('Captain draft'), ('%d / %d / %d'):format(
                tonumber(vm.draftPicksACount) or 0,
                tonumber(vm.draftPoolCount) or 0,
                tonumber(vm.draftPicksBCount) or 0))
            y = y + paragraph(x, y, w, L('Drafting is web only'), C.warn) + 4

        else
            local rows = {}
            if vm.pickedMap ~= nil then rows[#rows + 1] = { L('Map'), map_label(vm.pickedMap) } end
            if vm.pickedRegion ~= nil then rows[#rows + 1] = { L('Region'), region_label(vm.pickedRegion) } end
            if vm.teamAStartSide ~= nil and mine ~= nil then
                local ct = vm.teamAStartSide
                if mine == 'B' then ct = (ct == 'Terrorist') and 'CounterTerrorist' or 'Terrorist' end
                rows[#rows + 1] = { L('Starting side'), L(ct) }
            end
            for i = 1, #rows do
                local ry = y + (i - 1) * 26
                fill(x, ry, w, 24, C.chip, R_CHIP)
                text(F.main, x + 10, ry + 4, rows[i][1], C.text_mute)
                text_right(F.bold, x + w - 10, ry + 4, rows[i][2], C.text)
            end
            y = y + #rows * 26 + 2
        end

        if phase == 'MAP_BAN' or phase == 'SIDE_PICK' or phase == 'REGION_VOTE' then
            local total = 0
            local counts = state.match.teamCounts
            if type(counts) == 'table' then
                if phase == 'REGION_VOTE' then
                    for _, n2 in pairs(counts) do total = total + (tonumber(n2) or 0) end
                else
                    total = tonumber(counts[active]) or 0
                end
            end
            local voted = tonumber(vm.votedCount) or 0
            text(F.main, x, y + 4, (L('%d/%d voted')):format(voted, total), C.text_mute)
            y = y + 22
        end

        return y - y0
    end

    function M.hud()
        local m = state.match
        if m == nil or m.state ~= 'VOTING' or m.voteMode == nil then return nil end
        local vm = m.voteMode
        local title = L('Map ban')
        if vm.phase == 'SIDE_PICK' then title = L('Side pick')
        elseif vm.phase == 'REGION_VOTE' then title = L('Region vote')
        elseif vm.phase == 'CAPTAIN_DRAFT' then title = L('Captain draft')
        elseif vm.phase == 'COMPLETED' then return L('Vote complete') end
        return (L('Voting  |  %s  |  %ds')):format(title, left_sec(vm))
    end

    return M
end)()

local function build_in_match(x, y, w)
    local y0 = y

    if state.match == nil then
        y = y + paragraph(x, y, w, L('Confirming match...'))
        return y - y0
    end

    local st = state.match.state
    if st == 'VOTING' then
        return vote.build(x, y, w)
    end

    local connected = is_connected()

    fill(x, y, w, 62, C.panel, 8)
    if st == 'IN_PROGRESS' then
        text(F.main, x + 14, y + 12, connected and L('You are in the match') or L('Match is live'), C.text_mute)
        text(F.bold, x + 14, y + 32, ("%s:%d"):format(tostring(state.match.server), state.match.port or 0), C.text)
    else
        text(F.main, x + 14, y + 12, L('Match'), C.text_mute)
        text(F.bold, x + 14, y + 32, L(MATCH_STATE_TEXT[st] or 'Locating a server...'), C.text)
    end
    y = y + 72

    if st == 'IN_PROGRESS' and not connected then
        if button(x, y, w, 36, L('Connect'), 'primary') then act(join_server) end
        y = y + 36
    end

    return y - y0
end

local function ago(ms)
    if type(ms) ~= 'number' or ms <= 0 then return '' end
    local d = frame_time - math.floor(ms / 1000)
    if d < 60 then return L('just now') end
    if d < 3600 then return (L('%dm ago')):format(math.floor(d / 60)) end
    if d < 86400 then return (L('%dh ago')):format(math.floor(d / 3600)) end
    return (L('%dd ago')):format(math.floor(d / 86400))
end

local function ratio(a, b)
    if b == nil or b == 0 then return tostring(a or 0) .. '.00' end
    return ('%.2f'):format((a or 0) / b)
end

local function short_xuid(s)
    s = tostring(s)
    if #s <= 8 then return s end
    return '...' .. s:sub(#s - 5)
end

local function fit_xuid(font, s, max_w)
    s = tostring(s)
    if text_size(font, s) <= max_w then return s end
    return short_xuid(s)
end

local function build_stats(x, y, w)
    local y0 = y

    local p = stats.profile
    if p == nil then
        if stats.loading > 0 then
            y = y + paragraph(x, y, w, L('Loading your stats...'))
        else
            y = y + paragraph(x, y, w, stats.error or L('No stats yet. Play a match first.'), stats.error and C.danger_lt or nil)
        end
    else
        fill(x, y, w, 64, C.panel, R_SURFACE)
        text(F.main, x + 14, y + 10, L('Tier points'), C.text_mute)
        text(F.title, x + 14, y + 26, tostring(p.tierPoints or 0), C.text)
        local place = (p.placement or 0) > 0 and ('#%d'):format(p.placement) or L('unranked')
        text_right(F.main, x + w - 14, y + 10, (L('Season %d')):format(p.season or 0), C.text_mute)
        text_right(F.title, x + w - 14, y + 26, place, C.primary_light)
        y = y + 74

        local cols = {
            { L('W / L'), ('%d - %d'):format(p.wins or 0, p.losses or 0) },
            { L('K / D'), ratio(p.kills, p.deaths) },
            { L('HS %'), ((p.kills or 0) > 0) and ('%d%%'):format(math.floor((p.headshots or 0) * 100 / p.kills)) or '0%' },
            { L('Likes'), tostring(p.likes or 0) },
        }
        local cwd = (w - 18) / 4
        for i = 1, #cols do
            local cx = x + (i - 1) * (cwd + 6)
            fill(cx, y, cwd, 44, C.chip, R_CHIP)
            text_center(F.main, cx + cwd * 0.5, y + 8, cols[i][1], C.text_mute)
            text_center(F.bold, cx + cwd * 0.5, y + 24, cols[i][2], C.text)
        end
        y = y + 54
    end

    y = y + section(x, y, w, L('Recent matches'))
    local ms = stats.matches
    if ms == nil or #ms == 0 then
        y = y + paragraph(x, y, w, stats.loading > 0 and L('Loading...') or L('No matches yet.')) + 4
    else
        for i = 1, #ms do
            local m = ms[i]
            local col, tag = C.text_mute, '--'
            if m.outcome == 'WIN' then col = C.good; tag = L('WIN')
            elseif m.outcome == 'LOSS' then col = C.danger_lt; tag = L('LOSS')
            elseif m.outcome == 'TIE' then col = C.warn; tag = L('TIE')
            elseif m.state == 'IN_PROGRESS' then col = C.primary_light; tag = L('LIVE') end

            text(F.bold, x, y, tag, col)
            text(F.main, x + 42, y, ellipsize(F.main, map_label(m.map), 104), C.text)
            text(F.main, x + 152, y, ('%d : %d'):format(m.myScore or 0, m.enemyScore or 0), C.text_dim)
            if m.mvp == true then text(F.bold, x + 205, y, 'MVP', C.primary_light) end
            text_right(F.main, x + w, y, ago(m.endedAt), C.text_mute)
            y = y + row_h()
        end
        y = y + 4
    end

    y = y + section(x, y, w, L('Leaderboard'), stats.board and (L('top %d')):format(#stats.board) or nil)
    local b = stats.board
    if b == nil or #b == 0 then
        y = y + paragraph(x, y, w, stats.loading > 0 and L('Loading...') or L('Leaderboard unavailable.')) + 4
    else
        for i = 1, #b do
            local e = b[i]
            local col = e.self == true and C.primary_light or C.text_dim
            text(F.main, x, y, ('%d.'):format(e.rank or i), C.text_mute)

            local id = fit_xuid(F.main, e.xuid, 140)
            text(F.main, x + 28, y, id, col)

            local nm = e.self == true and L('you') or player_name(e.xuid, nil)
            if nm ~= nil then
                local nx = x + 28 + text_size(F.main, id) + 10
                local nw = x + 252 - nx
                if nw > 30 then text(F.main, nx, y, ellipsize(F.main, nm, nw), C.text_mute) end
            end

            text(F.main, x + 262, y, ('%d - %d'):format(e.wins or 0, e.losses or 0), C.text_mute)
            text(F.main, x + 334, y, ratio(e.kills, e.deaths), C.text_mute)
            text_right(F.bold, x + w, y, tostring(e.tierPoints or 0), col)
            y = y + row_h()
        end
        y = y + 4
    end

    if button(x, y, 120, 30, L('Refresh'), nil, stats.loading > 0) then act(function() fetch_stats(true) end) end
    y = y + 30

    return y - y0
end

local SOURCE_LABEL = {
    FATALITY = 'in-game',
    AIMWARE = 'in-game',
    NEVERLOSE = 'in-game',
    GAMESENSE = 'in-game',
    STEAM_OPENID = 'web',
    HVHGG = 'hvh.gg',
    UNVERIFIED = 'unverified',
}

local function build_steam(x, y, w)
    local y0 = y

    local linked = steam_has(my_xuid)
    fill(x, y, w, 58, C.panel, R_SURFACE)

    local tx = x + 14
    text(F.main, tx, y + 9, L('Current Steam account'), C.text_mute)

    local right = x + w - 14
    if linked == true then
        text_right(F.main, right, y + 27, L('linked'), C.good)
        right = right - text_size(F.main, L('linked')) - 10
    elseif linked == false then
        text_right(F.main, right, y + 27, L('not linked'), C.warn)
        right = right - text_size(F.main, L('not linked')) - 10
    end

    text(F.bold, tx, y + 27, my_xuid, C.text)
    local my_name = player_name(my_xuid, nil)
    if my_name ~= nil then
        local nx = tx + text_size(F.bold, my_xuid) + 10
        if right - nx > 30 then
            text(F.main, nx, y + 27, ellipsize(F.main, my_name, right - nx), C.text_mute)
        end
    end
    y = y + 68

    if linked == false then
        y = y + paragraph(x, y, w,
            L('This Steam account is not linked to your HvH.gg Prime account yet. You cannot queue with it until you link it.'),
            C.warn) + 8
        if button(x, y, 170, 34, L('Link this Steam'), 'primary', steam.loading > 0) then
            act(link_current_xuid)
        end
        y = y + 42
    end

    y = y + section(x, y, w, L('Linked accounts'),
        steam.items and (L('%d linked')):format(#steam.items) or nil)

    local page, pages = 1, 1

    if steam.items == nil then
        y = y + paragraph(x, y, w, L('Loading...')) + 4
    elseif #steam.items == 0 then
        y = y + paragraph(x, y, w, L('No Steam accounts linked yet.')) + 4
    else
        local total = #steam.items
        pages = math.ceil(total / steam.per_page)
        page = steam.page or 1
        if page > pages then page = pages end
        if page < 1 then page = 1 end

        local first = (page - 1) * steam.per_page + 1
        local last = math.min(first + steam.per_page - 1, total)

        for i = first, last do
            local it = steam.items[i]
            local is_me = it.xuid == my_xuid

            text(F.main, x, y + 6, it.xuid, is_me and C.primary_light or C.text)

            local src = L(SOURCE_LABEL[it.source] or tostring(it.source or ''))
            local src_r = x + w - 86
            text_right(F.main, src_r, y + 6, src, C.text_mute)

            local nm = player_name(it.xuid, nil)
            if nm ~= nil then
                local nx = x + text_size(F.main, it.xuid) + 10
                local nw = src_r - text_size(F.main, src) - 10 - nx
                if nw > 30 then
                    text(F.main, nx, y + 6, ellipsize(F.main, nm, nw), C.text_mute)
                end
            end

            local confirming = steam.confirm == it.xuid and frame_time < steam.confirm_until
            local label = confirming and L('Sure?') or L('Unbind')
            if button(x + w - 78, y, 78, 26, label, confirming and 'danger' or nil, steam.loading > 0) then
                local target = it.xuid
                if confirming then
                    act(function()
                        steam.confirm = nil
                        unlink_xuid(target)
                    end)
                else
                    local deadline = frame_time + 5
                    act(function()
                        steam.confirm = target
                        steam.confirm_until = deadline
                    end)
                end
            end
            y = y + 32
        end

        if pages > 1 then y = y + (steam.per_page - (last - first + 1)) * 32 end
    end

    y = y + 4
    if button(x, y, 120, 30, L('Refresh'), nil, steam.loading > 0) then act(function() fetch_xuids(true) end) end

    if pages > 1 then
        if button(x + w - 60, y, 60, 30, L('Next'), nil, page >= pages) then
            act(function() steam.page = page + 1 end)
        end
        if button(x + w - 126, y, 60, 30, L('Prev'), nil, page <= 1) then
            act(function() steam.page = page - 1 end)
        end
        text_right(F.main, x + w - 136, y + 9, ('%d / %d'):format(page, pages), C.text_mute)
    end
    y = y + 30

    return y - y0
end

local function account_tier(user)
    local m = user.membership
    if type(m) ~= 'table' or m.active ~= true then return 'FREE' end
    if m.tier == 'SVIP' then return 'SVIP' end
    if m.tier == 'VIP' then return 'VIP' end
    return 'FREE'
end

local function account_role(user)
    local r = user.role
    if r == 'ADMIN' then return 'ADMIN', C.admin, C.on_primary end
    if r == 'MOD' then return 'MOD', C.mod, C.on_primary end
    if r == 'DHDJ' then
        if T.no_cjk then return 'DHDJ', C.dhdj, C.on_dhdj end
        return '死妈烂崽', C.dhdj, C.on_dhdj
    end
    return nil
end

local function footer(x, y, w, user)
    fill(x, y + 12, w, 1, C.line)
    local ty = y + 23
    local tx = ty + 5

    local tier = account_tier(user)
    local role, role_bg, role_fg = account_role(user)

    local left, count = nil, nil
    if tier == 'FREE' then
        left = tonumber(user.dailyFreeMatchesRemaining)
        if left ~= nil then
            left = math.floor(left)
            count = ('%d/%d'):format(left, UI.free_total)
        end
    end

    local lw, lh = text_size(F.bold, tier)
    local pw = lw + 12
    local used = 8 + pw

    local rw, rh, rpw = 0, 0, 0
    if role ~= nil then
        rw, rh = text_size(F.bold, role)
        rpw = rw + 12
        used = used + 8 + rpw
    end

    if count ~= nil then used = used + 8 + text_size(F.bold, count) end

    local room = w - 106 - used
    if room < 40 then room = 40 end

    local name = ellipsize(F.main, tostring(user.name), room)
    local nw, nh = text_size(F.main, name)

    local ph = 18
    if lh + 4 > ph then ph = lh + 4 end
    if role ~= nil and rh + 4 > ph then ph = rh + 4 end
    if nh < ph then nh = ph end

    text(F.main, x, tx, name, C.text_dim)

    local px = x + nw + 8
    local py = tx + (nh - ph) * 0.5

    if role ~= nil then
        fill(px, py, rpw, ph, role_bg, R_CHIP)
        text(F.bold, px + 6, py + (ph - rh) * 0.5, role, role_fg)
        px = px + rpw + 8
    end

    local bg, fg = C.chip, C.text_dim
    if tier == 'SVIP' then
        bg, fg = C.svip, C.on_primary
    elseif tier == 'VIP' then
        bg, fg = C.vip, C.on_primary
    end

    fill(px, py, pw, ph, bg, R_CHIP)
    text(F.bold, px + 6, py + (ph - lh) * 0.5, tier, fg)

    if count ~= nil then
        text(F.bold, px + pw + 8, tx, count, (left <= 0) and C.danger_lt or C.good)
    end

    logout_button(x + w - 96, ty, 96, 26)

    local h = 31 + nh
    if h < 49 then h = 49 end
    return h
end

function room.build_players(x, y, w, host_here)
    local lb = state.lobby
    local list = (type(lb) == 'table' and type(lb.players) == 'table') and lb.players or {}
    local n = #list
    if n == 0 then return 0 end
    local user = state.user
    local queueing = user ~= nil and user.state == 'MATCHMAKING'
    local cw, ch = (w - 6) * 0.5, 26
    local rows = math.ceil(n / 2)
    for i = 1, n do
        local p = list[i]
        if type(p) == 'table' then
            local col = (i - 1) % 2
            local row = math.floor((i - 1) / 2)
            local bx, by = x + col * (cw + 6), y + row * (ch + 4)
            local name = tostring(p.player or '')
            local xuid = p.xuid
            if type(xuid) == 'number' then xuid = tostring(math.floor(xuid)) end
            if type(xuid) ~= 'string' then xuid = '' end
            local steam = player_name(xuid, nil)
            local shown = name
            if steam ~= nil and #steam > 0 then shown = steam end
            if #shown == 0 then shown = short_xuid(xuid) end
            local uid = p.uid
            local mine = (xuid ~= '' and xuid == my_xuid) or (user ~= nil and uid == user.uid)
            local host_row = (lb.hostUid ~= nil and uid == lb.hostUid)
            local can_kick = host_here and (not mine) and (not queueing) and type(uid) == 'string' and #uid > 0
            local confirming = can_kick and room.confirm == 'kick' and room.confirm_who == uid and frame_time < room.confirm_until
            local tag = confirming and L('Sure?') or '×'
            local kw = 0
            if can_kick then
                kw = text_size(F.bold, tag) + 10
                if kw < 22 then kw = 22 end
            end

            fill(bx, by, cw, ch, mine and C.panel or C.chip, R_CHIP)
            local right = bx + cw - 4
            if can_kick then
                local kx = right - kw
                local over = (not busy.room) and hit(kx, by + 2, kw, ch - 4)
                fill(kx, by + 3, kw, ch - 6, confirming and C.danger or C.chip, R_CHIP)
                if over then fill(kx, by + 3, kw, ch - 6, C.hover, R_CHIP) end
                local tw, th = text_size(F.bold, tag)
                text(F.bold, kx + (kw - tw) * 0.5, by + (ch - th) * 0.5, tag, confirming and C.on_primary or C.text_dim)
                if over and UI.clicked then
                    local who, who_name = uid, shown
                    act(function()
                        if room.ask('kick', who) then room.kick(who, who_name) end
                    end)
                end
                right = kx - 4
            end

            local badges = {}
            if host_row then badges[#badges + 1] = { L('HOST'), C.primary, C.on_primary } end
            if p.membershipTier == 'SVIP' then badges[#badges + 1] = { 'SVIP', C.svip, C.on_primary }
            elseif p.membershipTier == 'VIP' then badges[#badges + 1] = { 'VIP', C.vip, C.on_primary } end
            if p.online == false then badges[#badges + 1] = { L('AWAY'), C.warn, C.on_dhdj } end
            for k = #badges, 1, -1 do
                local b = badges[k]
                local bw = text_size(F.bold, b[1]) + 8
                right = right - bw
                fill(right, by + 4, bw, ch - 8, b[2], R_CHIP)
                text(F.bold, right + 4, by + 6, b[1], b[3])
                right = right - 4
            end

            local name_col = mine and C.primary_light or C.text
            if p.online == false then name_col = C.text_mute end
            text(F.main, bx + 8, by + 5, ellipsize(F.main, shown, right - bx - 10), name_col)
        end
    end
    return rows * (ch + 4) - 4
end

function room.build_bar(x, y, w)
    room.focus = false
    local y0 = y
    local code = room.code_of()
    y = y + section(x, y, w, L('Room'))

    local hh = 28
    fill(x, y, w, hh, C.panel, 6)
    local leaving = room.confirm == 'leave' and frame_time < room.confirm_until
    local lw = leaving and 56 or 52
    if button(x + w - lw, y + 1, lw, hh - 2, leaving and L('Sure?') or L('Leave'), leaving and 'danger' or 'ghost', busy.room) then
        act(function()
            if room.ask('leave', '') then room.leave() end
        end)
    end
    local code_r = x + w - lw - 8
    local shown = (#code > 0) and code or L('No room code yet')
    local code_col = (#code > 0) and C.primary_light or C.text_mute
    if #code > 0 and hit(x, y, code_r - x, hh) and UI.clicked then act(room.copy_code) end
    text(F.bold, x + 10, y + 6, ellipsize(F.bold, shown, code_r - x - 14), code_col)
    y = y + hh + 6

    local ph = room.build_players(x, y, w, room.is_host())
    if ph > 0 then y = y + ph + 6 end
    return y - y0
end

function room.build_join(x, y, w)
    local y0 = y
    y = y + section(x, y, w, L('Room'))

    local jw, gap = 64, 6
    local fw = w - jw - gap
    local over = hit(x, y, fw, 28)
    room.over = over
    if not UI.measuring and UI.clicked then room.focus = over == true end
    fill(x, y, fw, 28, C.panel, 6)
    if room.focus then stroke(x, y, fw, 28, C.primary_light, 6) end
    local shown = room.code
    if #shown == 0 then
        text(F.main, x + 8, y + 6, L('Room code'), C.text_mute)
    else
        text(F.bold, x + 8, y + 6, shown, C.text)
    end
    if room.focus and (not UI.measuring) then
        local tw = text_size(F.bold, (#shown > 0) and shown or '')
        if math.floor(real_time() * 2) % 2 == 0 then
            fill(x + 8 + tw + 1, y + 5, 1, 18, C.text)
        end
    end
    if button(x + fw + gap, y, jw, 28, L('Join'), 'primary', busy.room or (not cfg.ready)) then
        act(room.join)
    end
    y = y + 34
    if button(x, y, w, 28, L('Create room'), nil, busy.room or busy.queue or (not cfg.ready)) then
        act(room.create)
    end
    y = y + 34
    return y - y0
end

function room.build_readonly(x, y, w)
    local lb = state.lobby
    if type(lb) ~= 'table' then return 0 end
    local bits = {}
    if type(lb.gameMode) == 'string' then bits[#bits + 1] = mode_label(lb.gameMode) end
    if type(lb.region) == 'table' and #lb.region > 0 then
        bits[#bits + 1] = region_count_text(#lb.region)
    end
    if type(lb.maps) == 'table' and #lb.maps > 0 then
        bits[#bits + 1] = (L('%d maps')):format(#lb.maps)
    end
    if #bits == 0 then return 0 end
    text(F.main, x, y, ellipsize(F.main, table.concat(bits, '  ·  '), w), C.text_mute)
    return line_height(F.main, 'Ag') + 4
end

function room.build_guest(x, y, w)
    local y0 = y
    y = y + paragraph(x, y, w, L('Waiting for the host to start the queue.'), C.text_dim) + 6
    local rh = room.build_readonly(x, y, w)
    if rh > 0 then y = y + rh + 4 end
    y = y + room.build_bar(x, y, w)
    return y - y0
end

local function build_page(x, y, w)
    if state.last_error ~= nil and state.user == nil then
        local h = paragraph(x, y, w, state.last_error, C.danger_lt) + 12
        if state.logged_in then
            logout_button(x, y + h, 120, 32)
        else
            if button(x, y + h, 130, 34, L('Login'), 'primary', busy.login) then act(start_login) end
        end
        return h + 34
    end

    if not state.logged_in or state.login_session ~= nil then
        return build_logged_out(x, y, w)
    end

    if state.user == nil then
        return paragraph(x, y, w, L('Loading your profile...'))
    end

    local user = state.user
    local in_lobby = state.lobby ~= nil and state.lobby.isValid == true
    local is_host = in_lobby and state.lobby.hostUid == user.uid

    local h = 0

    if UI.page == 'stats' or UI.page == 'steam' then
        h = (UI.page == 'stats') and build_stats(x, y, w) or build_steam(x, y, w)
        return h + footer(x, y + h, w, user)
    end

    if in_lobby and not is_host and user.state ~= "IN_MATCH" then
        if user.state == 'MATCHMAKING' then
            h = build_matchmaking(x, y, w)
        else
            h = room.build_guest(x, y, w)
        end
        return h + footer(x, y + h, w, user)
    end

    if user.state == 'IDLE' then
        h = build_idle(x, y, w)
    elseif user.state == 'MATCHMAKING' then
        h = build_matchmaking(x, y, w)
    elseif user.state == 'IN_MATCH' then
        h = build_in_match(x, y, w)
    else
        h = paragraph(x, y, w, L('Ready.'))
    end

    return h + footer(x, y + h, w, user)
end

local function build_body(x, y, w)
    if not cfg.outdated then return build_page(x, y, w) end
    local y0 = y
    y = y + paragraph(x, y, w,
        (L('Script v%s is outdated, latest is v%s. Please update.')):format(VERSION, cfg.latest or '?'),
        C.warn) + 10
    if url_field(x, y, w, UPDATE_URL) then act(go_download) end
    y = y + 40
    if button(x, y, 170, 34, L('Download update'), 'primary') then act(go_download) end
    return y + 34 - y0
end

local TAB_W = 54
local TABS = { { 'play', 'PLAY' }, { 'stats', 'STATS' }, { 'steam', 'STEAM' } }

local function tabs_shown()
    return state.logged_in and state.user ~= nil
end

local function lang_btn_x()
    return UI.x + UI.w - PAD - UI.lang_w
end

local function tab_strip_x()
    return lang_btn_x() - 8 - TAB_W * #TABS
end

local function title_ctl_x()
    if tabs_shown() then return tab_strip_x() end
    return lang_btn_x()
end

local function lang_button(y)
    if T.no_cjk or cfg.outdated then return end
    if button(lang_btn_x(), y + 9, UI.lang_w, 20, T.lang == 2 and 'EN' or 'ZH', 'quiet') then
        act(function()
            settings.lang = (settings.lang == 2) and 1 or 2
            T.lang = settings.lang
            save_settings()
            state.lang_want = (T.lang == 2) and 'ZH' or 'EN'
            sync_language()
        end)
    end
end

local function draw_panel()
    local x, y, w = UI.x, UI.y, UI.w
    local bx, by = x + PAD, y + TITLE_H + PAD

    UI.measuring = true
    local body_h = build_body(bx, by, w - PAD * 2)
    UI.measuring = false

    local h = TITLE_H + PAD + body_h + PAD

    shadow(x, y, w, h)
    fill(x, y, w, h, C.bg, R_SURFACE)
    fill(x, y, w, TITLE_H, C.title_bg, R_SURFACE)
    fill(x, y + TITLE_H - R_SURFACE, w, R_SURFACE, C.title_bg)
    fill(x, y + TITLE_H - 1, w, 1, C.line)

    fill(x + PAD, y + TITLE_H * 0.5 - 7, 3, 14, C.primary_light, 1.5)
    text(F.bold, x + PAD + 11, y + 12, 'HvH.gg Prime', C.text)
    lang_button(y)

    if tabs_shown() then
        local tx = tab_strip_x()
        for i = 1, #TABS do
            local id, label = TABS[i][1], TABS[i][2]
            local tbx = tx + (i - 1) * TAB_W
            local on = UI.page == id
            text_center(F.bold, tbx + TAB_W * 0.5, y + 13, L(label), on and C.text or C.text_mute)
            if on then fill(tbx + 8, y + TITLE_H - 3, TAB_W - 16, 2, C.primary_light) end
            if hit(tbx, y + 4, TAB_W, TITLE_H - 6) and UI.clicked then
                act(function()
                    UI.page = id
                    steam.confirm = nil
                    room.focus = false
                    if id == 'stats' then fetch_stats(false) end
                    if id == 'steam' then fetch_xuids(false) end
                end)
            end
        end
    end

    build_body(bx, by, w - PAD * 2)

    UI.bottom = y + h
    UI.panel_h = h
end

local function draw_hud()
    local label = nil
    local col = C.primary_light
    local pulsing = false

    if state.login_session ~= nil then
        label = L('HvH.gg Prime  |  waiting for browser confirmation')
        col = C.warn
    elseif state.logged_in and state.user ~= nil then
        if state.user.state == 'MATCHMAKING' then
            local elapsed = 0
            if state.lobby ~= nil and state.lobby.startedAt ~= nil then
                elapsed = frame_time - math.floor(state.lobby.startedAt / 1000)
                if elapsed < 0 then elapsed = 0 end
            end
            local rn = region_summary()
            if type(state.lobby) == 'table' and type(state.lobby.region) == 'table' and #state.lobby.region > 0 then
                rn = #state.lobby.region
            end
            label = (L('In queue  %02d:%02d  |  %s  |  %s')):format(math.floor(elapsed / 60), elapsed % 60,
                mode_label(room.mode()), region_count_text(rn))
        elseif state.user.state == 'IN_MATCH' and state.match ~= nil then
            if state.match.state == 'IN_PROGRESS' then
                if not is_connected() then
                    label = L('Match is live  |  open the menu to connect')
                    col = C.good
                end
            elseif state.match.state == 'VOTING' then
                label = vote.hud()
                col = C.primary_light
                pulsing = true
            else
                label = L(MATCH_STATE_TEXT[state.match.state] or 'Match found!')
                col = C.good
                pulsing = true
            end
        end
    elseif state.last_error ~= nil then
        label = 'HvH.gg Prime  |  ' .. state.last_error
        col = C.danger_lt
    end

    if label == nil then return 0 end

    local tw, th = text_size(F.main, label)
    local w = tw + 34
    local h = 28
    local x, y = UI.x, UI.y

    local accent = col
    if pulsing then
        accent = mod_a(col, 0.55 + 0.45 * math.abs(math.sin(real_time() * 2)))
    end

    shadow(x, y, w, h)
    fill(x, y, w, h, C.bg, R_SURFACE)
    fill(x, y, 3, h, accent, 1.5)
    text(F.main, x + 14, y + (h - th) * 0.5, label, C.text)
    return h
end

local function draw_toasts(x, y)
    local now = frame_time
    local i = 1
    while i <= #toasts do
        if toasts[i].expires <= now then table.remove(toasts, i) else i = i + 1 end
    end
    if #toasts == 0 then return end

    local w = UI.w
    for j = 1, #toasts do
        local t = toasts[j]
        local lines = wrap_lines(F.main, t.text, w - 26)
        local lh = line_height(F.main, lines[1] or '')
        local h = #lines * lh + 14

        shadow(x, y, w, h)
        fill(x, y, w, h, C.panel, R_SURFACE)
        fill(x, y, 3, h, t.error and C.danger_lt or C.primary_light, 1.5)
        for k = 1, #lines do
            text(F.main, x + 14, y + 7 + (k - 1) * lh, lines[k], C.text)
        end

        y = y + h + 6
    end
end

local function poll_input()
    local down = false
    if input ~= nil and input.IsButtonDown ~= nil then
        local ok, v = pcall(input.IsButtonDown, 0x01)
        down = ok and v == true
    end

    UI.clicked = down and (not UI.prev_down)
    UI.prev_down = down
    UI.down = down
    UI.interactive = false

    if not host.open() or input == nil or input.GetMousePos == nil then
        UI.clicked = false
        if room ~= nil then
            room.focus = false
            room.held = nil
        end
        return
    end

    local ok, cx, cy = pcall(input.GetMousePos)
    if not ok or type(cx) ~= 'number' or type(cy) ~= 'number' then
        UI.clicked = false
        return
    end

    UI.cx = cx
    UI.cy = cy
    UI.interactive = true
    if room ~= nil then room.poll() end
end

local function handle_drag()
    if not UI.interactive then
        if UI.drag then
            UI.drag = false
            save_settings()
        end
        return
    end

    local over_title = UI.cx >= UI.x and UI.cx <= UI.x + UI.w
        and UI.cy >= UI.y and UI.cy <= UI.y + TITLE_H

    if over_title and UI.cx >= title_ctl_x() then over_title = false end

    if UI.clicked and over_title then
        UI.drag = true
        UI.drag_dx = UI.cx - UI.x
        UI.drag_dy = UI.cy - UI.y
    end

    if not UI.drag then return end

    if not UI.down then
        UI.drag = false
        settings.x = UI.x
        settings.y = UI.y
        save_settings()
        return
    end

    UI.x = UI.cx - UI.drag_dx
    UI.y = UI.cy - UI.drag_dy

    local sw, sh = screen_size()
    if UI.x < 0 then UI.x = 0 end
    if UI.y < 0 then UI.y = 0 end
    if UI.x > sw - 80 then UI.x = sw - 80 end
    if UI.y > sh - TITLE_H then UI.y = sh - TITLE_H end

    settings.x = UI.x
    settings.y = UI.y
end

local function render()
    if not UI.ok then return end
    UI.action = nil

    UI.over_panel = UI.interactive
        and UI.cx >= UI.x and UI.cx <= UI.x + UI.w
        and UI.cy >= UI.y and UI.cy <= UI.y + (UI.panel_h or TITLE_H)

    cur_font = nil

    local toast_y
    if UI.interactive then
        draw_panel()
        toast_y = UI.bottom + 8
    else
        local hud_h = draw_hud()
        toast_y = UI.y + (hud_h > 0 and hud_h + 8 or 0)
    end
    draw_toasts(UI.x, toast_y)

    if not UI.first_draw_logged then
        UI.first_draw_logged = true
        local sw, sh = screen_size()
        log(('[HvH.gg Prime] ui: first draw ok  screen=%dx%d  cursor=%s,%s'):format(
            sw, sh, tostring(UI.cx), tostring(UI.cy)))
    end

    if UI.action ~= nil then
        local fn = UI.action
        UI.action = nil
        fn()
    end
end

log('[HvH.gg Prime] load: ui ok')

local loop = {
    ready_at = utils.get_unix_time() + 2,
    last_tick = utils.get_unix_time(),
    last_poll = 0,
    tick_every = 2,
    tick_match = 10,
    drew = false,
    errors = 0,
}

function loop.beat()
    if state.match ~= nil and state.match.state == "IN_PROGRESS" and not state.auto_join then
        return loop.tick_match
    end
    return loop.tick_every
end

local function draw_frame()
    local time = utils.get_unix_time()

    frame_id = frame_id + 1
    frame_time = time

    ping_tick()

    if not cfg.ready and not cfg.fetching and time >= cfg.retry_at then fetch_config() end

    if not cfg.blocked() then
        if state.logged_in and steam.items == nil and steam.loading == 0 and time >= steam.retry_at then
            fetch_xuids(false)
        end

        if state.logged_in and time >= pn.retry_at then fetch_player_names() end

        if state.login_session ~= nil then
            if loop.last_poll <= time - 2 then
                loop.last_poll = time
                poll_login()
            end
        elseif state.recheck or loop.last_tick <= time - loop.beat() then
            state.recheck = false
            loop.last_tick = time
            tick()
        end
    end

    if time < loop.ready_at then return end

    if not UI.init_done then
        UI.init_done = true
        ui_init()
        log('[HvH.gg Prime] ui: init ok')
    end

    poll_input()
    handle_drag()
    render()
end

callbacks.Register('Draw', 'hvhgg_prime_draw', function()
    if host.dead then return end

    host.beat = real_time()

    if not loop.drew then
        loop.drew = true
        log('[HvH.gg Prime] draw: first frame')
    end

    local ok, err = pcall(draw_frame)
    if ok or loop.errors > 5 then return end

    loop.errors = loop.errors + 1
    log('[HvH.gg Prime] draw: ERROR ' .. tostring(err))
end)

callbacks.Register('CreateMove', 'hvhgg_prime_move', function(cmd)
    if host.dead or not UI.over_panel or cmd == nil then return end
    local ok, b = pcall(cmd.GetButtons, cmd)
    if not ok or type(b) ~= 'number' then return end

    local out = b
    if out % 2 == 1 then out = out - 1 end
    if math.floor(out / 2048) % 2 == 1 then out = out - 2048 end
    if out ~= b then pcall(cmd.SetButtons, cmd, out) end
end)

callbacks.Register('Unload', 'hvhgg_prime_unload' .. host.n, function(who)
    log('[HvH.gg Prime] unload: Unload event arg=' .. tostring(who))
    if type(who) == 'string' and #who > 0 and host.script ~= nil and who ~= host.script then return end
    host.shutdown()
end)

host.init()
fetch_config()

log('[HvH.gg Prime] load: restoring saved session')
load_session()
log('[HvH.gg Prime] load: session restore done')

log('[HvH.gg Prime] load: done')
