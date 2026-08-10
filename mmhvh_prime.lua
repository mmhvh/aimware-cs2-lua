if not ffi then
    return error("Turn on Allow insecure FFI")
end

local dY = false

local function dZ(d_, ea)
    if not dY then return end
    if file == nil or file.Open == nil then return end
    local eb, ec = pcall(file.Open, 'hvhgg_prime_log.txt', ea and 'w' or 'a')
    if not eb or ec == nil then return end
    pcall(ec.Write, ec, '[HvH.gg Prime] boot: ' .. d_ .. '\r\n')
    pcall(ec.Close, ec)
end

local function ed()
    if globals == nil or globals.RealTime == nil then return nil end
    local ee, ef = pcall(globals.RealTime)
    if not ee or type(ef) ~= 'number' then return nil end
    return ef
end

local function eg()
    local eh = rawget(_G, '__hvhgg_prime')
    if type(eh) ~= 'table' or eh.dead == true or type(eh.beat) ~= 'number' then return false end
    local ei = ed()
    if ei == nil then return false end
    return (ei - eh.beat) < 5
end

if eg() then
    dZ('skipped, already running')
    print('[HvH.gg Prime] this load does nothing, an instance is already running')
    return
end

dZ('chunk entered', true)

local iH = (function()
    local ej=true;local ek=false;local el='json'local em,en,eo,eq,er,es,et=pairs,type,tostring,tonumber,getmetatable,setmetatable,rawset;local eu,ev,ew=error,require,select;local ex,ey=math.floor,math.huge;local ez,eA,eB,eC,eD,eE,eF,eG=string.rep,string.gsub,string.sub,string.byte,string.char,string.find,string.len,string.format;local eH=string.match;local eI=table.concat;local eJ={version="dkjson 2.5"}if ek then _G[el]=eJ end;local eK=nil;eJ.null=es({},{__tojson=function()return"null"end})local function eL(eM)local eN,eO,eP=0,0,0;for eQ,eR in em(eM)do if eQ=='n'and en(eR)=='number'then eP=eR;if eR>eN then eN=eR end else if en(eQ)~='number'or eQ<1 or ex(eQ)~=eQ then return false end;if eQ>eN then eN=eQ end;eO=eO+1 end end;if eN>10 and eN>eP and eN>eO*2 then return false end;return true,eN end;local eS={["\""]="\\\"",["\\"]="\\\\",["\b"]="\\b",["\f"]="\\f",["\n"]="\\n",["\r"]="\\r",["\t"]="\\t"}local function eT(eU)local eV=eS[eU]if eV then return eV end;local eW,eX,eY,eZ=eC(eU,1,4)eW,eX,eY,eZ=eW or 0,eX or 0,eY or 0,eZ or 0;if eW<=0x7f then eV=eW elseif 0xc0<=eW and eW<=0xdf and eX>=0x80 then eV=(eW-0xc0)*0x40+eX-0x80 elseif 0xe0<=eW and eW<=0xef and eX>=0x80 and eY>=0x80 then eV=((eW-0xe0)*0x40+eX-0x80)*0x40+eY-0x80 elseif 0xf0<=eW and eW<=0xf7 and eX>=0x80 and eY>=0x80 and eZ>=0x80 then eV=(((eW-0xf0)*0x40+eX-0x80)*0x40+eY-0x80)*0x40+eZ-0x80 else return""end;if eV<=0xffff then return eG("\\u%.4x",eV)elseif eV<=0x10ffff then eV=eV-0x10000;local e0,e1=0xD800+ex(eV/0x400),0xDC00+eV%0x400;return eG("\\u%.4x\\u%.4x",e0,e1)else return""end end;local function e2(e3,e4,e5)if eE(e3,e4)then return eA(e3,e4,e5)else return e3 end end;local function e6(e7)e7=e2(e7,"[%z\1-\31\"\\\127]",eT)if eE(e7,"[\194\216\220\225\226\239]")then e7=e2(e7,"\194[\128-\159\173]",eT)e7=e2(e7,"\216[\128-\132]",eT)e7=e2(e7,"\220\143",eT)e7=e2(e7,"\225\158[\180\181]",eT)e7=e2(e7,"\226\128[\140-\143\168-\175]",eT)e7=e2(e7,"\226\129[\160-\175]",eT)e7=e2(e7,"\239\187\191",eT)e7=e2(e7,"\239\191[\176-\191]",eT)end;return"\""..e7.."\""end;eJ.quotestring=e6;local function e8(e9,e_,fa)local fb,fc=eE(e9,e_,1,true)if fb then return eB(e9,1,fb-1)..fa..eB(e9,fc+1,-1)else return e9 end end;local fd,fe;local function ff()fd=eH(eo(0.5),"([^05+])")fe="[^0-9%-%+eE"..eA(fd,"[%^%$%(%)%%%.%[%]%*%+%-%?]","%%%0").."]+"end;ff()local function fh(fi)return e8(e2(eo(fi),fe,""),fd,".")end;local function fj(fk)local fl=eq(e8(fk,".",fd))if not fl then ff()fl=eq(e8(fk,".",fd))end;return fl end;local function fm(fo,fq,fr)fq[fr+1]="\n"fq[fr+2]=ez("  ",fo)fr=fr+2;return fr end;function eJ.addnewline(fs)if fs.indent then fs.bufferlen=fm(fs.level or 0,fs.buffer,fs.bufferlen or#fs.buffer)end end;local ft;local function fu(fv,fw,fx,fy,fz,fA,fB,fC,fD,fE)local fF=en(fv)if fF~='string'and fF~='number'then return nil,"type '"..fF .."' is not supported as a key by JSON."end;if fx then fB=fB+1;fA[fB]=","end;if fy then fB=fm(fz,fA,fB)end;fA[fB+1]=e6(fv)fA[fB+2]=":"return ft(fw,fy,fz,fA,fB+2,fC,fD,fE)end;local function fG(fH,fI,fJ)local fK=fJ.bufferlen;if en(fH)=='string'then fK=fK+1;fI[fK]=fH end;return fK end;local function fL(fM,fN,fO,fP,fQ,fR)fR=fR or fM;local fS=fO.exception;if not fS then return nil,fR else fO.bufferlen=fQ;local fT,fU=fS(fM,fN,fO,fR)if not fT then return nil,fU or fR end;return fG(fT,fP,fO)end end;function eJ.encodeexception(fV,fW,fX,fY)return e6("<"..fY..">")end;ft=function(fZ,f0,f1,f2,f3,f4,f5,f6)local f7=en(fZ)local f8=er(fZ)f8=en(f8)=='table'and f8;local f9=f8 and f8.__tojson;if f9 then if f4[fZ]then return fL('reference cycle',fZ,f6,f2,f3)end;f4[fZ]=true;f6.bufferlen=f3;local f_,ga=f9(fZ,f6)if not f_ then return fL('custom encoder failed',fZ,f6,f2,f3,ga)end;f4[fZ]=nil;f3=fG(f_,f2,f6)elseif fZ==nil then f3=f3+1;f2[f3]="null"elseif f7=='number'then local gb;if fZ~=fZ or fZ>=ey or-fZ>=ey then gb="null"else gb=fh(fZ)end;f3=f3+1;f2[f3]=gb elseif f7=='boolean'then f3=f3+1;f2[f3]=fZ and"true"or"false"elseif f7=='string'then f3=f3+1;f2[f3]=e6(fZ)elseif f7=='table'then if f4[fZ]then return fL('reference cycle',fZ,f6,f2,f3)end;f4[fZ]=true;f1=f1+1;local gd,ge=eL(fZ)if ge==0 and f8 and f8.__jsontype=='object'then gd=false end;local gf;if gd then f3=f3+1;f2[f3]="["for gg=1,ge do f3,gf=ft(fZ[gg],f0,f1,f2,f3,f4,f5,f6)if not f3 then return nil,gf end;if gg<ge then f3=f3+1;f2[f3]=","end end;f3=f3+1;f2[f3]="]"else local gh=false;f3=f3+1;f2[f3]="{"local gj=f8 and f8.__jsonorder or f5;if gj then local gk={}ge=#gj;for gl=1,ge do local gm=gj[gl]local gn=fZ[gm]if gn then gk[gm]=true;f3,gf=fu(gm,gn,gh,f0,f1,f2,f3,f4,f5,f6)gh=true end end;for go,gp in em(fZ)do if not gk[go]then f3,gf=fu(go,gp,gh,f0,f1,f2,f3,f4,f5,f6)if not f3 then return nil,gf end;gh=true end end else for gq,gr in em(fZ)do f3,gf=fu(gq,gr,gh,f0,f1,f2,f3,f4,f5,f6)if not f3 then return nil,gf end;gh=true end end;if f0 then f3=fm(f1-1,f2,f3)end;f3=f3+1;f2[f3]="}"end;f4[fZ]=nil else return fL('unsupported type',fZ,f6,f2,f3,"type '"..f7.."' is not supported by JSON.")end;return f3 end;function eJ.encode(gs,gt)gt=gt or{}local gu=gt.buffer;local gv=gu or{}gt.buffer=gv;ff()local gw,gx=ft(gs,gt.indent,gt.level or 0,gv,gt.bufferlen or 0,gt.tables or{},gt.keyorder,gt)if not gw then eu(gx,2)elseif gu==gv then gt.bufferlen=gw;return true else gt.bufferlen=nil;gt.buffer=nil;return eI(gv)end end;local function gy(gz,gA)local gB,gC,gD=1,1,0;while true do gC=eE(gz,"\n",gC,true)if gC and gC<gA then gB=gB+1;gD=gC;gC=gC+1 else break end end;return"line "..gB..", column "..gA-gD end;local function gE(gF,gG,gH)return nil,eF(gF)+1,"unterminated "..gG.." at "..gy(gF,gH)end;local function gI(gJ,gK)while true do gK=eE(gJ,"%S",gK)if not gK then return nil end;local gL=eB(gJ,gK,gK+1)if gL=="\239\187"and eB(gJ,gK+2,gK+2)=="\191"then gK=gK+3 elseif gL=="//"then gK=eE(gJ,"[\n\r]",gK+2)if not gK then return nil end elseif gL=="/*"then gK=eE(gJ,"*/",gK+2)if not gK then return nil end;gK=gK+2 else return gK end end end;local gM={["\""]="\"",["\\"]="\\",["/"]="/",["b"]="\b",["f"]="\f",["n"]="\n",["r"]="\r",["t"]="\t"}local function gN(gO)if gO<0 then return nil elseif gO<=0x007f then return eD(gO)elseif gO<=0x07ff then return eD(0xc0+ex(gO/0x40),0x80+ex(gO)%0x40)elseif gO<=0xffff then return eD(0xe0+ex(gO/0x1000),0x80+ex(gO/0x40)%0x40,0x80+ex(gO)%0x40)elseif gO<=0x10ffff then return eD(0xf0+ex(gO/0x40000),0x80+ex(gO/0x1000)%0x40,0x80+ex(gO/0x40)%0x40,0x80+ex(gO)%0x40)else return nil end end;local function gP(gQ,gR)local gS=gR+1;local gT,gU={},0;while true do local gV=eE(gQ,"[\"\\]",gS)if not gV then return gE(gQ,"string",gR)end;if gV>gS then gU=gU+1;gT[gU]=eB(gQ,gS,gV-1)end;if eB(gQ,gV,gV)=="\""then gS=gV+1;break else local gW=eB(gQ,gV+1,gV+1)local gX;if gW=="u"then gX=eq(eB(gQ,gV+2,gV+5),16)if gX then local gY;if 0xD800<=gX and gX<=0xDBff then if eB(gQ,gV+6,gV+7)=="\\u"then gY=eq(eB(gQ,gV+8,gV+11),16)if gY and 0xDC00<=gY and gY<=0xDFFF then gX=(gX-0xD800)*0x400+gY-0xDC00+0x10000 else gY=nil end end end;gX=gX and gN(gX)if gX then if gY then gS=gV+12 else gS=gV+6 end end end end;if not gX then gX=gM[gW]or gW;gS=gV+2 end;gU=gU+1;gT[gU]=gX end end;if gU==1 then return gT[1],gS elseif gU>1 then return eI(gT),gS else return"",gS end end;local gZ;local function g0(g1,g2,g3,g4,g5,g6,g7)local g8=eF(g3)local g9,g_={},0;local ha=g4+1;if g1=='object'then es(g9,g6)else es(g9,g7)end;while true do ha=gI(g3,ha)if not ha then return gE(g3,g1,g4)end;local hb=eB(g3,ha,ha)if hb==g2 then return g9,ha+1 end;local hc,hd;hc,ha,hd=gZ(g3,ha,g5,g6,g7)if hd then return nil,ha,hd end;ha=gI(g3,ha)if not ha then return gE(g3,g1,g4)end;hb=eB(g3,ha,ha)if hb==":"then if hc==nil then return nil,ha,"cannot use nil as table index (at "..gy(g3,ha)..")"end;ha=gI(g3,ha+1)if not ha then return gE(g3,g1,g4)end;local he;he,ha,hd=gZ(g3,ha,g5,g6,g7)if hd then return nil,ha,hd end;g9[hc]=he;ha=gI(g3,ha)if not ha then return gE(g3,g1,g4)end;hb=eB(g3,ha,ha)else g_=g_+1;g9[g_]=hc end;if hb==","then ha=ha+1 end end end;gZ=function(hf,hg,hh,hj,hk)hg=hg or 1;hg=gI(hf,hg)if not hg then return nil,eF(hf)+1,"no valid JSON value (reached the end)"end;local hl=eB(hf,hg,hg)if hl=="{"then return g0('object',"}",hf,hg,hh,hj,hk)elseif hl=="["then return g0('array',"]",hf,hg,hh,hj,hk)elseif hl=="\""then return gP(hf,hg)else local hm,hn=eE(hf,"^%-?[%d%.]+[eE]?[%+%-]?%d*",hg)if hm then local ho=fj(eB(hf,hm,hn))if ho then return ho,hn+1 end end;hm,hn=eE(hf,"^%a%w*",hg)if hm then local hp=eB(hf,hm,hn)if hp=="true"then return true,hn+1 elseif hp=="false"then return false,hn+1 elseif hp=="null"then return hh,hn+1 end end;return nil,hg,"no valid JSON value at "..gy(hf,hg)end end;local function hq(...)if ew("#",...)>0 then return...else return{__jsontype='object'},{__jsontype='array'}end end;function eJ.decode(hr,hs,ht,...)local hu,hv=hq(...)return gZ(hr,hs,ht,hu,hv)end;function eJ.use_lpeg()local hw=ev("lpeg")if hw.version()=="0.11"then eu"due to a bug in LPeg 0.11, it cannot be used for JSON matching"end;local hx=hw.match;local hy,hz,hA=hw.P,hw.S,hw.R;local function hB(hC,hD,hE,hF)if not hF.msg then hF.msg=hE.." at "..gy(hC,hD)hF.pos=hD end;return false end;local function hG(hH)return hw.Cmt(hw.Cc(hH)*hw.Carg(2),hB)end;local hI=hy"//"*(1-hz"\n\r")^0;local hJ=hy"/*"*(1-hy"*/")^0*hy"*/"local hK=(hz" \n\r\t"+hy"\239\187\191"+hI+hJ)^0;local hL=1-hz"\"\\\n\r"local hM=hy"\\"*hw.C(hz"\"\\/bfnrt"+hG"unsupported escape sequence")/gM;local hN=hA("09","af","AF")local function hO(hP,hQ,hR,hS)hR,hS=eq(hR,16),eq(hS,16)if 0xD800<=hR and hR<=0xDBff and 0xDC00<=hS and hS<=0xDFFF then return true,gN((hR-0xD800)*0x400+hS-0xDC00+0x10000)else return false end end;local function hT(hU)return gN(eq(hU,16))end;local hV=hy"\\u"*hw.C(hN*hN*hN*hN)local hW=hw.Cmt(hV*hV,hO)+hV/hT;local hX=hW+hM+hL;local hY=hy"\""*hw.Cs(hX^0)*(hy"\""+hG"unterminated string")local hZ=hy"-"^-1*(hy"0"+hA"19"*hA"09"^0)local h0=hy"."*hA"09"^0;local h1=hz"eE"*hz"+-"^-1*hA"09"^1;local h2=hZ*h0^-1*h1^-1/fj;local h3=hy"true"*hw.Cc(true)+hy"false"*hw.Cc(false)+hy"null"*hw.Carg(1)local h4=h2+hY+h3;local h5,h6;local function h7(h8,h9,h_,ia)local ib,ic;local ie;local ig,ih={},0;repeat ib,ic,ie=hx(h5,h8,h9,h_,ia)if not ie then break end;h9=ie;ih=ih+1;ig[ih]=ib until ic=='last'return h9,es(ig,ia.arraymeta)end;local function ii(ij,ik,il,im)local io,iq,ir;local is;local iu={}repeat iq,io,ir,is=hx(h6,ij,ik,il,im)if not is then break end;ik=is;iu[iq]=io until ir=='last'return ik,es(iu,im.objectmeta)end;local iv=hy"["*hw.Cmt(hw.Carg(1)*hw.Carg(2),h7)*hK*(hy"]"+hG"']' expected")local iw=hy"{"*hw.Cmt(hw.Carg(1)*hw.Carg(2),ii)*hK*(hy"}"+hG"'}' expected")local ix=hK*(iv+iw+h4)local iy=ix+hK*hG"value expected"h5=ix*hK*(hy","*hw.Cc'cont'+hw.Cc'last')*hw.Cp()local iz=hw.Cg(hK*hY*hK*(hy":"+hG"colon expected")*iy)h6=iz*hK*(hy","*hw.Cc'cont'+hw.Cc'last')*hw.Cp()local iA=iy*hw.Cp()function eJ.decode(iB,iC,iD,...)local iE={}iE.objectmeta,iE.arraymeta=hq(...)local iF,iG=hx(iA,iB,iC,iD,iE)if iE.msg then return nil,iE.pos,iE.msg else return iF,iG end end;eJ.use_lpeg=function()return eJ end;eJ.using_lpeg=true;return eJ end;eJ.parse=eJ.decode;eJ.stringify=eJ.encode;return eJ

end)()

dZ('json ok')

local iI = {}

do
    local iJ = {
        'void* GetModuleHandleA(const char*);',
        'void* GetProcAddress(void*, const char*);',
        'void GetSystemTimeAsFileTime(void*);',
        'void* GlobalAlloc(unsigned int, size_t);',
        'void* GlobalLock(void*);',
        'int GlobalUnlock(void*);',
        'int OpenClipboard(void*);',
        'int EmptyClipboard(void);',
        'void* SetClipboardData(unsigned int, void*);',
        'int CloseClipboard(void);',
    }
    for iK = 1, #iJ do pcall(ffi.cdef, iJ[iK]) end

    local iL = ffi.C
    local iM = ffi.new('uint32_t[2]')
    local iN = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

    function iI.find_export(iO, iP)
        local iQ = iL.GetModuleHandleA(iO)
        if iQ == nil then return nil end
        local iR = iL.GetProcAddress(iQ, iP)
        if iR == nil then return nil end
        return iR
    end

    function iI.get_unix_time()
        iL.GetSystemTimeAsFileTime(iM)
        local iS, iT = tonumber(iM[1]), tonumber(iM[0])
        return math.floor((iS * 4294967296 + iT) / 10000000 - 11644473600)
    end

    function iI.clipboard_set(iU)
        iU = tostring(iU)
        local iV = #iU + 1
        local iW = iL.GlobalAlloc(2, iV)
        if iW == nil then return false end
        local iX = iL.GlobalLock(iW)
        if iX == nil then return false end
        ffi.copy(iX, iU, iV)
        iL.GlobalUnlock(iW)
        if iL.OpenClipboard(nil) == 0 then return false end
        iL.EmptyClipboard()
        iL.SetClipboardData(1, iW)
        iL.CloseClipboard()
        return true
    end

    function iI.base64_encode(iY)
        local iZ = {}
        for i0 = 1, #iY, 3 do
            local i1, i2, i3 = iY:byte(i0, i0 + 2)
            local i4 = i1 * 65536 + (i2 or 0) * 256 + (i3 or 0)
            local i5 = {}
            for i6 = 1, 4 do
                i5[5 - i6] = iN:sub(i4 % 64 + 1, i4 % 64 + 1)
                i4 = math.floor(i4 / 64)
            end
            if i3 == nil then i5[4] = '=' end
            if i2 == nil then i5[3] = '=' end
            iZ[#iZ + 1] = table.concat(i5)
        end
        return table.concat(iZ)
    end
end

dZ('utils ok')

local nb = rawget(_G, '__hvhgg_http') or (function()
    local i7=ffi.cast('uint64_t(__stdcall*)(const char*)',iI.find_export('kernel32.dll','GetModuleHandleA'))local i8=ffi.cast('uint64_t(__stdcall*)(uint64_t, const char*)',iI.find_export('kernel32.dll','GetProcAddress'))local i9=i7('steam_api64.dll')local i_=ffi.cast("void*(__thiscall*)()",i8(i9,'SteamClient'))local ja=ffi.cast("int(__stdcall*)()",i8(i9,'SteamAPI_GetHSteamPipe'))local jb=ffi.cast("int(__stdcall*)()",i8(i9,'SteamAPI_GetHSteamPipe'))local jc=ffi.cast("void*(__thiscall*)(void*, int, const char*)",i8(i9,'SteamAPI_ISteamClient_GetISteamUtils'))local jd=ffi.cast("uint64_t(__thiscall*)(void*, int, int, const char*)",i8(i9,'SteamAPI_ISteamClient_GetISteamHTTP'))local je=jd(i_(),ja(),jb(),"STEAMHTTP_INTERFACE_VERSION003")local jf=jc(i_(),ja(),"SteamUtils009")local jg,jh,ji,jj,jk,jl,jm,jn,jo,jp=assert,pcall,xpcall,error,setmetatable,tostring,tonumber,type,pairs,ipairs;local jq=string.format;local jr,js,jt,ju,jv,jw=ffi.typeof,ffi.sizeof,ffi.cast,ffi.cdef,ffi.string,ffi.gc;local jx,jy,jz=string.lower,string.len,string.find;local jA=iI.base64_encode;local jB,jC;do ffi.cdef([[
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
	]])local jD={[-1]="No failure",[0]="Steam gone",[1]="Network failure",[2]="Invalid handle",[3]="Mismatched callback"}local jE,jF;local jG,jH;local jI;local jJ=jr("struct SteamAPI_callback_base")local jK=js(jJ)local jL=jr("struct SteamAPI_callback_base[1]")local jM=jr("struct SteamAPI_callback_base*")local jN=jr("uintptr_t")local jO={}local jP={}local jQ={}local function jR(jS)return jl(jm(jt(jN,jS)))end;local function jT(jU,jV,jW)if jW then jW=jD[jI(jU.api_call_handle)]or"Unknown error"end;jU.api_call_handle=0;ji(function()local jX=jR(jU)local jY=jO[jX]if jY~=nil then ji(jY,jj,jV,jW)end;if jP[jX]~=nil then jO[jX]=nil;jP[jX]=nil end end,jj)end;local function jZ(j0,j1,j2,j3)if j3==j0.api_call_handle then jT(j0,j1,j2)end end;local function j4(j5,j6)jT(j5,j6,false)end;local function j7(j8)return jK end;local function j9(j_)if j_.api_call_handle~=0 then jF(j_,j_.api_call_handle)j_.api_call_handle=0;local ka=jR(j_)jO[ka]=nil;jP[ka]=nil end end;local kb=jr([[    struct {
			int8_t nRefCount;
		}
	]])local function kc()for kd,ke in jo(jP)do local kf=jt(jM,ke)j9(kf)end;for kg,kh in jo(jQ)do local ki=jt(jM,kh)jH(ki)end end;ffi.metatype(kb,{__gc=function(kj)return kc()end})local kk=ffi.new(kb)ffi.metatype(jJ,{__gc=j9,__index={cancel=j9}})local kl=jt("void(__thiscall *)(struct SteamAPI_callback_base *, void *, bool, uint64_t)",jZ)local km=jt("void(__thiscall *)(struct SteamAPI_callback_base *, void *)",j4)local kn=jt("int(__thiscall *)(struct SteamAPI_callback_base *)",j7)function jB(ko,kp,kq)jg(ko~=0)local kr=jL()local ks=jt(jM,kr)ks.vtbl_storage[0].run1=kl;ks.vtbl_storage[0].run2=km;ks.vtbl_storage[0].get_size=kn;ks.vtbl=ks.vtbl_storage;ks.api_call_handle=ko;ks.id=kq;local kt=jR(ks)jO[kt]=kp;jP[kt]=kr;jE(ks,ko)return ks end;function jC(ku,kv)jg(jQ[ku]==nil)kk.nRefCount=0;local kw=jL()local kx=jt(jM,kw)kx.vtbl_storage[0].run1=kl;kx.vtbl_storage[0].run2=km;kx.vtbl_storage[0].get_size=kn;kx.vtbl=kx.vtbl_storage;kx.api_call_handle=0;kx.id=ku;local ky=jR(kx)jO[ky]=kv;jQ[ku]=kw;jG(kx,ku)end;local function kz(kA,kB,kC)return jt(kC,jt("void***",kA)[0][kB])end;jE=ffi.cast("void(__cdecl*)(struct SteamAPI_callback_base *, uint64_t)",i8(i9,'SteamAPI_RegisterCallResult'))jF=ffi.cast("void(__cdecl*)(struct SteamAPI_callback_base *, uint64_t)",i8(i9,'SteamAPI_UnregisterCallResult'))jG=ffi.cast("void(__cdecl*)(struct SteamAPI_callback_base *, int)",i8(i9,'SteamAPI_RegisterCallback'))jH=ffi.cast("void(__cdecl*)(struct SteamAPI_callback_base *)",i8(i9,'SteamAPI_UnregisterCallback'))local kD=ffi.cast("int(__thiscall*)(void*, SteamAPICall_t)",i8(i9,'SteamAPI_ISteamUtils_GetAPICallFailureReason'))function jI(kE)return kD(jf,kE)end end;ffi.cdef([[
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
]])local kF={get=1,head=2,post=3,put=4,delete=5,options=6,patch=7}local kG={[100]="Continue",[101]="Switching Protocols",[102]="Processing",[200]="OK",[201]="Created",[202]="Accepted",[203]="Non-Authoritative Information",[204]="No Content",[205]="Reset Content",[206]="Partial Content",[207]="Multi-Status",[208]="Already Reported",[250]="Low on Storage Space",[226]="IM Used",[300]="Multiple Choices",[301]="Moved Permanently",[302]="Found",[303]="See Other",[304]="Not Modified",[305]="Use Proxy",[306]="Switch Proxy",[307]="Temporary Redirect",[308]="Permanent Redirect",[400]="Bad Request",[401]="Unauthorized",[402]="Payment Required",[403]="Forbidden",[404]="Not Found",[405]="Method Not Allowed",[406]="Not Acceptable",[407]="Proxy Authentication Required",[408]="Request Timeout",[409]="Conflict",[410]="Gone",[411]="Length Required",[412]="Precondition Failed",[413]="Request Entity Too Large",[414]="Request-URI Too Long",[415]="Unsupported Media Type",[416]="Requested Range Not Satisfiable",[417]="Expectation Failed",[418]="I'm a teapot",[420]="Enhance Your Calm",[422]="Unprocessable Entity",[423]="Locked",[424]="Failed Dependency",[424]="Method Failure",[425]="Unordered Collection",[426]="Upgrade Required",[428]="Precondition Required",[429]="Too Many Requests",[431]="Request Header Fields Too Large",[444]="No Response",[449]="Retry With",[450]="Blocked by Windows Parental Controls",[451]="Parameter Not Understood",[451]="Unavailable For Legal Reasons",[451]="Redirect",[452]="Conference Not Found",[453]="Not Enough Bandwidth",[454]="Session Not Found",[455]="Method Not Valid in This State",[456]="Header Field Not Valid for Resource",[457]="Invalid Range",[458]="Parameter Is Read-Only",[459]="Aggregate Operation Not Allowed",[460]="Only Aggregate Operation Allowed",[461]="Unsupported Transport",[462]="Destination Unreachable",[494]="Request Header Too Large",[495]="Cert Error",[496]="No Cert",[497]="HTTP to HTTPS",[499]="Client Closed Request",[500]="Internal Server Error",[501]="Not Implemented",[502]="Bad Gateway",[503]="Service Unavailable",[504]="Gateway Timeout",[505]="HTTP Version Not Supported",[506]="Variant Also Negotiates",[507]="Insufficient Storage",[508]="Loop Detected",[509]="Bandwidth Limit Exceeded",[510]="Not Extended",[511]="Network Authentication Required",[551]="Option not supported",[598]="Network read timeout error",[599]="Network connect timeout error"}local kH={"params","body","json"}local kI=2101;local kJ=2102;local kK=2103;local kL=jr([[
struct {
	http_HTTPRequestHandle m_hRequest;
	uint64_t m_ulContextValue;
	bool m_bRequestSuccessful;
	int m_eStatusCode;
	uint32_t m_unBodySize;
} *
]])local kM=jr([[
struct {
	http_HTTPRequestHandle m_hRequest;
	uint64_t m_ulContextValue;
} *
]])local kN=jr([[
struct {
	http_HTTPRequestHandle m_hRequest;
	uint64_t m_ulContextValue;
	uint32_t m_cOffset;
	uint32_t m_cBytesReceived;
} *
]])local kO=jr([[
struct {
	http_HTTPCookieContainerHandle m_hCookieContainer;
}
]])local kP=jr("SteamAPICall_t[1]")local kQ=jr("const char[?]")local kR=jr("uint8_t[?]")local kS=jr("unsigned int[?]")local kT=jr("bool[1]")local kU=jr("float[1]")local function kV()local kW=ffi.cast("struct http_ISteamHTTPVtbl**",je)[0]if kW==0 or kW==nil then return jj("find_isteamhttp failed")end;return je,kW end;local function kX(kY,kZ)return function(...)return kY(kZ,...)end end;local k0,k1=kV()local k2=kX(k1.CreateHTTPRequest,k0)local k3=kX(k1.SetHTTPRequestContextValue,k0)local k4=kX(k1.SetHTTPRequestNetworkActivityTimeout,k0)local k5=kX(k1.SetHTTPRequestHeaderValue,k0)local k6=kX(k1.SetHTTPRequestGetOrPostParameter,k0)local k7=kX(k1.SendHTTPRequest,k0)local k8=kX(k1.SendHTTPRequestAndStreamResponse,k0)local k9=kX(k1.DeferHTTPRequest,k0)local k_=kX(k1.PrioritizeHTTPRequest,k0)local la=kX(k1.GetHTTPResponseHeaderSize,k0)local lb=kX(k1.GetHTTPResponseHeaderValue,k0)local lc=kX(k1.GetHTTPResponseBodySize,k0)local ld=kX(k1.GetHTTPResponseBodyData,k0)local le=kX(k1.GetHTTPStreamingResponseBodyData,k0)local lf=kX(k1.ReleaseHTTPRequest,k0)local lg=kX(k1.GetHTTPDownloadProgressPct,k0)local li=kX(k1.SetHTTPRequestRawPostBody,k0)local lj=kX(k1.CreateCookieContainer,k0)local lk=kX(k1.ReleaseCookieContainer,k0)local ll=kX(k1.SetCookie,k0)local lm=kX(k1.SetHTTPRequestCookieContainer,k0)local ln=kX(k1.SetHTTPRequestUserAgentInfo,k0)local lp=kX(k1.SetHTTPRequestRequiresVerifiedCertificate,k0)local lq=kX(k1.SetHTTPRequestAbsoluteTimeoutMS,k0)local lr=kX(k1.GetHTTPRequestWasTimedOut,k0)local ls,lt={},false;local lu,lv=false,{}local lx,ly=false,{}local lz=jk({},{__mode="k"})local lA,lB=jk({},{__mode="k"}),jk({},{__mode="v"})local lC={}local lI={__index=function(lD,lE)local lF=lA[lD]if lF==nil then return end;lE=jl(lE)if lF.m_hRequest~=0 then local lG=kS(1)if la(lF.m_hRequest,lE,lG)then if lG~=nil then lG=lG[0]if lG<0 then return end;local lH=kR(lG)if lb(lF.m_hRequest,lE,lH,lG)then lD[lE]=jv(lH,lG-1)return lD[lE]end end end end end,__metatable=false}local lP={__index={set_cookie=function(lJ,lK,lL,lM,lN)local lO=lz[lJ]if lO==nil or lO.m_hCookieContainer==0 then return end;ll(lO.m_hCookieContainer,lK,lL,jl(lM).."="..jl(lN))end},__metatable=false}local function lQ(lR)if lR.m_hCookieContainer~=0 then lk(lR.m_hCookieContainer)lR.m_hCookieContainer=0 end end;local function lS(lT)if lT.m_hRequest~=0 then lf(lT.m_hRequest)lT.m_hRequest=0 end end;local function lU(lV,...)lf(lV)return jj(...)end;local function lW(lX,lY,lZ,l0,...)local l1=lB[lX.m_hRequest]if l1==nil then l1=jk({},lI)lB[lX.m_hRequest]=l1 end;lA[l1]=lX;l0.headers=l1;lt=true;ji(lY,jj,lZ,l0,...)lt=false end;local function l2(l3,l4)if l3==nil then return end;local l5=jt(kL,l3)if l5.m_hRequest~=0 then local l6=ls[l5.m_hRequest]if l6~=nil then ls[l5.m_hRequest]=nil;ly[l5.m_hRequest]=nil;lv[l5.m_hRequest]=nil;if l6 then local l7=l4==false and l5.m_bRequestSuccessful;local l8=l5.m_eStatusCode;local l9={status=l8}local l_=l5.m_unBodySize;if l7 and l_>0 then local ma=kR(l_)if ld(l5.m_hRequest,ma,l_)then l9.body=jv(ma,l_)end elseif not l5.m_bRequestSuccessful then local mb=kT()lr(l5.m_hRequest,mb)l9.timed_out=mb~=nil and mb[0]==true end;if l8>0 then l9.status_message=kG[l8]or"Unknown status"elseif l4 then l9.status_message=jq("IO Failure: %s",l4)else l9.status_message=l9.timed_out and"Timed out"or"Unknown error"end;lW(l5,l6,l7,l9)end;lS(l5)end end end;local function mc(md,me)if md==nil then return end;local mf=jt(kM,md)if mf.m_hRequest~=0 then local mg=lv[mf.m_hRequest]if mg then lW(mf,mg,me==false,{})end end end;local function mh(mi,mj)if mi==nil then return end;local mk=jt(kN,mi)if mk.m_hRequest~=0 then local ml=ly[mk.m_hRequest]if ly[mk.m_hRequest]then local mm={}local mn=kU()if lg(mk.m_hRequest,mn)then mm.download_progress=jm(mn[0])end;local mo=kR(mk.m_cBytesReceived)if le(mk.m_hRequest,mk.m_cOffset,mo,mk.m_cBytesReceived)then mm.body=jv(mo,mk.m_cBytesReceived)end;lW(mk,ml,mj==false,mm)end end end;local function mp(mq,mr,mt,mu)if jn(mt)=="function"and mu==nil then mu=mt;mt={}end;mt=mt or{}local mv=kF[jx(jl(mq))]if mv==nil then return jj("invalid HTTP method")end;if jn(mr)~="string"then return jj("URL has to be a string")end;local mx,my,mz;if jn(mu)=="function"then mx=mu elseif jn(mu)=="table"then mx=mu.completed or mu.complete;my=mu.headers_received or mu.headers;mz=mu.data_received or mu.data;if mx~=nil and jn(mx)~="function"then return jj("callbacks.completed callback has to be a function")elseif my~=nil and jn(my)~="function"then return jj("callbacks.headers_received callback has to be a function")elseif mz~=nil and jn(mz)~="function"then return jj("callbacks.data_received callback has to be a function")end else return jj("callbacks has to be a function or table")end;local mA=k2(mv,mr)if mA==0 then return jj("Failed to create HTTP request")end;local mB=false;for mC,mD in jp(kH)do if mt[mD]~=nil then if mB then return jj("can only set options.params, options.body or options.json")else mB=true end end end;local mE;if mt.json~=nil then local mF;mE=iH.stringify(mt.json)mF=mE~="null"if not mF then return jj("options.json is invalid: "..mE)end end;local mG=mt.network_timeout;if mG==nil then mG=10 end;if jn(mG)=="number"and mG>0 then if not k4(mA,mG)then return lU(mA,"failed to set network_timeout")end elseif mG~=nil then return lU(mA,"options.network_timeout has to be of type number and greater than 0")end;local mH=mt.absolute_timeout;if mH==nil then mH=30 end;if jn(mH)=="number"and mH>0 then if not lq(mA,mH*1000)then return lU(mA,"failed to set absolute_timeout")end elseif mH~=nil then return lU(mA,"options.absolute_timeout has to be of type number and greater than 0")end;local mI=mE~=nil and"application/json"or"text/plain"local mJ;local mK=mt.headers;if jn(mK)=="table"then for mL,mM in jo(mK)do mL=jl(mL)mM=jl(mM)local mN=jx(mL)if mN=="content-type"then mI=mM elseif mN=="authorization"then mJ=true end;if not k5(mA,mL,mM)then return lU(mA,"failed to set header "..mL)end end elseif mK~=nil then return lU(mA,"options.headers has to be of type table")end;local mO=mt.authorization;if jn(mO)=="table"then if mJ then return lU(mA,"Cannot set both options.authorization and the 'Authorization' header.")end;local mP,mQ=mO[1],mO[2]local mR=jq("Basic %s",jA(jq("%s:%s",jl(mP),jl(mQ)),"base64"))if not k5(mA,"Authorization",mR)then return lU(mA,"failed to apply options.authorization")end elseif mO~=nil then return lU(mA,"options.authorization has to be of type table")end;local mS=mE or mt.body;if jn(mS)=="string"then local mT=jy(mS)if not li(mA,mI,jt("unsigned char*",mS),mT)then return lU(mA,"failed to set post body")end elseif mS~=nil then return lU(mA,"options.body has to be of type string")end;local mU=mt.params;if jn(mU)=="table"then for mV,mW in jo(mU)do mV=jl(mV)if not k6(mA,mV,jl(mW))then return lU(mA,"failed to set parameter "..mV)end end elseif mU~=nil then return lU(mA,"options.params has to be of type table")end;local mX=mt.require_ssl;if jn(mX)=="boolean"then if not lp(mA,mX==true)then return lU(mA,"failed to set require_ssl")end elseif mX~=nil then return lU(mA,"options.require_ssl has to be of type boolean")end;local mY=mt.user_agent_info;if jn(mY)=="string"then if not ln(mA,jl(mY))then return lU(mA,"failed to set user_agent_info")end elseif mY~=nil then return lU(mA,"options.user_agent_info has to be of type string")end;local mZ=mt.cookie_container;if jn(mZ)=="table"then local m0=lz[mZ]if m0~=nil and m0.m_hCookieContainer~=0 then if not lm(mA,m0.m_hCookieContainer)then return lU(mA,"failed to set user_agent_info")end else return lU(mA,"options.cookie_container has to a valid cookie container")end elseif mZ~=nil then return lU(mA,"options.cookie_container has to a valid cookie container")end;local m1=k7;local m2=mt.stream_response;if jn(m2)=="boolean"then if m2 then m1=k8;if mx==nil and my==nil and mz==nil then return lU(mA,"a 'completed', 'headers_received' or 'data_received' callback is required")end else if mx==nil then return lU(mA,"'completed' callback has to be set for non-streamed requests")elseif my~=nil or mz~=nil then return lU(mA,"non-streamed requests only support 'completed' callbacks")end end elseif m2~=nil then return lU(mA,"options.stream_response has to be of type boolean")end;if my~=nil or mz~=nil then lv[mA]=my or false;if my~=nil then if not lu then jC(kJ,mc)lu=true end end;ly[mA]=mz or false;if mz~=nil then if not lx then jC(kK,mh)lx=true end end end;local m3=kP()if not m1(mA,m3)then lf(mA)if mx~=nil then mx(false,{status=0,status_message="Failed to send request"})end;return end;if mt.priority=="defer"or mt.priority=="prioritize"then local m4=mt.priority=="prioritize"and k_ or k9;if not m4(mA)then return lU(mA,"failed to set priority")end elseif mt.priority~=nil then return lU(mA,"options.priority has to be 'defer' of 'prioritize'")end;ls[mA]=mx or false;if mx~=nil then jB(m3[0],l2,kI)end end;local function m5(m6)if m6~=nil and jn(m6)~="boolean"then return jj("allow_modification has to be of type boolean")end;local m7=lj(m6==true)if m7~=nil then local m8=kO(m7)jw(m8,lQ)local m9=jk({},lP)lz[m9]=m8;return m9 end end;local m_={request=mp,create_cookie_container=m5}for na in jo(kF)do m_[na]=function(...)return mp(na,...)end end;return m_
end)()

rawset(_G, '__hvhgg_http', nb)

dZ('http ok')

local Ca = (function()
    local nc=false;local nd,ne,nf,ng,ni,nj,nk,nl,nn,no,np,nq,nr,ns,nt,nu=table.unpack or unpack,table.concat,string.byte,string.char,string.rep,string.sub,string.gsub,string.gmatch,string.format,math.floor,math.ceil,math.min,math.max,tonumber,type,math.huge;local function nv(ny)local nz,nA,nB,nC=0,ny,ny;while true do nz,nC,nA,nB=nz+1,nA,nA+nA+1,nB+nB+nz%2;if nz>256 or nA-(nA-1)~=1 or nB-(nB-1)~=1 or nA==nB then return nz,false elseif nA==nC then return nz,true end end end;local nD=2/3;local nE=nD*5>3 and nD*4<3 and nv(1.0)>=53;assert(nE,"at least 53-bit floating point numbers are required")local nF,nG=nv(1)local nH=nG and nF==64;local nI=nG and nF==32;assert(nH or nI or not nG,"Lua integers must be either 32-bit or 64-bit")local nJ=true;local nK;local nL;local nM;local nN;local nO;if nJ then nN=bit;nO="bit"local nP,nQ=true,nM;if nP then nM=nQ end;nK=false;nL=nt(jit)=="table"and jit.arch or nM and nM.arch or nil else for nR,nS in ipairs(_VERSION=="Lua 5.2"and{"bit32","bit"}or{"bit","bit32"})do if nt(_G[nS])=="table"and _G[nS].bxor then nN=_G[nS]nO=nS;break end end end;if nc then print("Abilities:")print("   Lua version:               "..(nJ and"LuaJIT "..(nK and"2.1 "or"2.0 ")..(nL or"")..(nM and" with FFI"or" without FFI")or _VERSION))print("   Integer bitwise operators: "..(nH and"int64"or nI and"int32"or"no"))print("   32-bit bitwise library:    "..(nO or"not found"))end;local nT,nU;if nJ and nM then nT="Using 'ffi' library of LuaJIT"nU="FFI"elseif nJ then nT="Using special code for sandboxed LuaJIT (no FFI)"nU="LJ"elseif nH then nT="Using native int64 bitwise operators"nU="INT64"elseif nI then nT="Using native int32 bitwise operators"nU="INT32"elseif nO then nT="Using '"..nO.."' library"nU="LIB32"else nT="Emulating bitwise operators using look-up table"nU="EMUL"end;if nc then print("Implementation selected:")print("   "..nT)end;local nV,nW,nX,nY,nZ,n0,n1,n3,n4,n5,n6;if nU=="FFI"or nU=="LJ"or nU=="LIB32"then nV=nN.band;nW=nN.bor;nX=nN.bxor;nY=nN.lshift;nZ=nN.rshift;n0=nN.rol or nN.lrotate;n1=nN.ror or nN.rrotate;n3=nN.bnot;n4=nN.tobit;n5=nN.tohex;assert(nV and nW and nX and nY and nZ and n0 and n1 and n3,"Library '"..nO.."' is incomplete")n6=nX end;n5=n5 or pcall(nn,"%x",2^31)and function(n7)return nn("%08x",n7%4294967296)end or function(n8)return nn("%08x",(n8+2^31)%2^32-2^31)end;local function n9(n_,oa)return nX(n_,oa or 0xA5A5A5A5)%4294967296 end;local function ob()return{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}end;local oc,od,oe,of,og,oh,oi,oj;local ol,om,oo,op,oq,os={},{},{},{},{},{}local ot={[224]={},[256]=op}local ou,ov={[384]={},[512]=oo},{[384]={},[512]=op}local ow,ox={},{0x67452301,0xEFCDAB89,0x98BADCFE,0x10325476,0xC3D2E1F0}local oy={0,0,0,0,0,0,0,0,28,25,26,27,0,0,10,9,11,12,0,15,16,17,18,0,20,22,23,21}local oz,oA;local oB={}local oC,oD,oE=oB,oB,{}local oF,oG,oH=4294967296,0,0;local oI={{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16},{15,11,5,9,10,16,14,7,2,13,1,3,12,8,6,4},{12,9,13,1,6,3,16,14,11,15,4,7,8,2,10,5},{8,10,4,2,14,13,12,15,3,7,6,11,5,1,16,9},{10,1,6,8,3,5,11,16,15,2,12,13,7,9,4,14},{3,13,7,11,1,12,9,4,5,14,8,6,16,15,2,10},{13,6,2,16,15,14,5,11,1,8,7,4,10,3,9,12},{14,12,8,15,13,2,4,10,6,1,16,5,9,7,3,11},{7,16,15,10,12,4,1,9,13,3,14,8,2,5,11,6},{11,3,9,5,8,7,2,6,16,12,10,15,4,13,14,1}}oI[11],oI[12]=oI[1],oI[2]local oJ={1,3,4,11,13,10,12,6,1,3,4,11,13,10,2,7,5,8,14,15,16,9,2,7,5,8,14,15}local function oK(oL)local oM={}for oN,oO in ipairs{1,9,13,17,18,21}do oM[oO]="<"..ni(oL,oO)end;return oM end;if nU=="FFI"then local oP=nM.new("int32_t[?]",80)oD=oP;oE=nM.new("int32_t[?]",16)oJ=nM.new("uint8_t[?]",#oJ+1,0,nd(oJ))for oQ=1,10 do oI[oQ]=nM.new("uint8_t[?]",#oI[oQ]+1,0,nd(oI[oQ]))end;oI[11],oI[12]=oI[1],oI[2]function oc(oR,oS,oT,oU)local oV,oW=oP,om;for oX=oT,oT+oU-1,64 do for oY=0,15 do oX=oX+4;local oZ,o0,o1,o2=nf(oS,oX-3,oX)oV[oY]=nW(nY(oZ,24),nY(o0,16),nY(o1,8),o2)end;for o3=16,63 do local o4,o5=oV[o3-15],oV[o3-2]oV[o3]=n4(nX(n1(o4,7),n0(o4,14),nZ(o4,3))+nX(n0(o5,15),n0(o5,13),nZ(o5,10))+oV[o3-7]+oV[o3-16])end;local o6,o7,o8,o9,o_,pa,pb,pc=oR[1],oR[2],oR[3],oR[4],oR[5],oR[6],oR[7],oR[8]for pd=0,63,8 do local pe=n4(nX(pb,nV(o_,nX(pa,pb)))+nX(n1(o_,6),n1(o_,11),n0(o_,7))+oV[pd]+oW[pd+1]+pc)pc,pb,pa,o_=pb,pa,o_,n4(o9+pe)o9,o8,o7,o6=o8,o7,o6,n4(nX(nV(o6,nX(o7,o8)),nV(o7,o8))+nX(n1(o6,2),n1(o6,13),n0(o6,10))+pe)pe=n4(nX(pb,nV(o_,nX(pa,pb)))+nX(n1(o_,6),n1(o_,11),n0(o_,7))+oV[pd+1]+oW[pd+2]+pc)pc,pb,pa,o_=pb,pa,o_,n4(o9+pe)o9,o8,o7,o6=o8,o7,o6,n4(nX(nV(o6,nX(o7,o8)),nV(o7,o8))+nX(n1(o6,2),n1(o6,13),n0(o6,10))+pe)pe=n4(nX(pb,nV(o_,nX(pa,pb)))+nX(n1(o_,6),n1(o_,11),n0(o_,7))+oV[pd+2]+oW[pd+3]+pc)pc,pb,pa,o_=pb,pa,o_,n4(o9+pe)o9,o8,o7,o6=o8,o7,o6,n4(nX(nV(o6,nX(o7,o8)),nV(o7,o8))+nX(n1(o6,2),n1(o6,13),n0(o6,10))+pe)pe=n4(nX(pb,nV(o_,nX(pa,pb)))+nX(n1(o_,6),n1(o_,11),n0(o_,7))+oV[pd+3]+oW[pd+4]+pc)pc,pb,pa,o_=pb,pa,o_,n4(o9+pe)o9,o8,o7,o6=o8,o7,o6,n4(nX(nV(o6,nX(o7,o8)),nV(o7,o8))+nX(n1(o6,2),n1(o6,13),n0(o6,10))+pe)pe=n4(nX(pb,nV(o_,nX(pa,pb)))+nX(n1(o_,6),n1(o_,11),n0(o_,7))+oV[pd+4]+oW[pd+5]+pc)pc,pb,pa,o_=pb,pa,o_,n4(o9+pe)o9,o8,o7,o6=o8,o7,o6,n4(nX(nV(o6,nX(o7,o8)),nV(o7,o8))+nX(n1(o6,2),n1(o6,13),n0(o6,10))+pe)pe=n4(nX(pb,nV(o_,nX(pa,pb)))+nX(n1(o_,6),n1(o_,11),n0(o_,7))+oV[pd+5]+oW[pd+6]+pc)pc,pb,pa,o_=pb,pa,o_,n4(o9+pe)o9,o8,o7,o6=o8,o7,o6,n4(nX(nV(o6,nX(o7,o8)),nV(o7,o8))+nX(n1(o6,2),n1(o6,13),n0(o6,10))+pe)pe=n4(nX(pb,nV(o_,nX(pa,pb)))+nX(n1(o_,6),n1(o_,11),n0(o_,7))+oV[pd+6]+oW[pd+7]+pc)pc,pb,pa,o_=pb,pa,o_,n4(o9+pe)o9,o8,o7,o6=o8,o7,o6,n4(nX(nV(o6,nX(o7,o8)),nV(o7,o8))+nX(n1(o6,2),n1(o6,13),n0(o6,10))+pe)pe=n4(nX(pb,nV(o_,nX(pa,pb)))+nX(n1(o_,6),n1(o_,11),n0(o_,7))+oV[pd+7]+oW[pd+8]+pc)pc,pb,pa,o_=pb,pa,o_,n4(o9+pe)o9,o8,o7,o6=o8,o7,o6,n4(nX(nV(o6,nX(o7,o8)),nV(o7,o8))+nX(n1(o6,2),n1(o6,13),n0(o6,10))+pe)end;oR[1],oR[2],oR[3],oR[4]=n4(o6+oR[1]),n4(o7+oR[2]),n4(o8+oR[3]),n4(o9+oR[4])oR[5],oR[6],oR[7],oR[8]=n4(o_+oR[5]),n4(pa+oR[6]),n4(pb+oR[7]),n4(pc+oR[8])end end;local pf=nM.new("int64_t[?]",80)oC=pf;local pg=nM.typeof"int64_t"local pi=nM.typeof"int32_t"local pj=nM.typeof"uint32_t"oG=pg(2^32)if nK then local pk,pl,pm,po,pp,pq,pr,ps=nV,nW,nX,n3,nY,nZ,n0,n1;oz=n5;do local pt=nM.new("int64_t[?]",16)local pu=oC;local function pv(pz,pA,pB,pC,pD,pE)local pF,pG,pH,pI=pt[pz],pt[pA],pt[pB],pt[pC]pF=pu[pD]+pF+pG;pI=ps(pm(pI,pF),32)pH=pH+pI;pG=ps(pm(pG,pH),24)pF=pu[pE]+pF+pG;pI=ps(pm(pI,pF),16)pH=pH+pI;pG=pr(pm(pG,pH),1)pt[pz],pt[pA],pt[pB],pt[pC]=pF,pG,pH,pI end;function oi(pJ,pK,pL,pM,pN,pO,pP,pQ)local pR,pS,pT,pU,pV,pW,pX,pY=pJ[1],pJ[2],pJ[3],pJ[4],pJ[5],pJ[6],pJ[7],pJ[8]for pZ=pM,pM+pN-1,128 do if pL then for p0=1,16 do pZ=pZ+8;local p1,p2,p3,p4,p5,p6,p7,p8=nf(pL,pZ-7,pZ)pu[p0]=pm(nW(nY(p8,24),nY(p7,16),nY(p6,8),p5)*pg(2^32),pj(pi(nW(nY(p4,24),nY(p3,16),nY(p2,8),p1))))end end;pt[0x0],pt[0x1],pt[0x2],pt[0x3],pt[0x4],pt[0x5],pt[0x6],pt[0x7]=pR,pS,pT,pU,pV,pW,pX,pY;pt[0x8],pt[0x9],pt[0xA],pt[0xB],pt[0xD],pt[0xE],pt[0xF]=oo[1],oo[2],oo[3],oo[4],oo[6],oo[7],oo[8]pO=pO+(pP or 128)pt[0xC]=pm(oo[5],pO)if pP then pt[0xE]=po(pt[0xE])end;if pQ then pt[0xF]=po(pt[0xF])end;for p9=1,12 do local p_=oI[p9]pv(0,4,8,12,p_[1],p_[2])pv(1,5,9,13,p_[3],p_[4])pv(2,6,10,14,p_[5],p_[6])pv(3,7,11,15,p_[7],p_[8])pv(0,5,10,15,p_[9],p_[10])pv(1,6,11,12,p_[11],p_[12])pv(2,7,8,13,p_[13],p_[14])pv(3,4,9,14,p_[15],p_[16])end;pR=pm(pR,pt[0x0],pt[0x8])pS=pm(pS,pt[0x1],pt[0x9])pT=pm(pT,pt[0x2],pt[0xA])pU=pm(pU,pt[0x3],pt[0xB])pV=pm(pV,pt[0x4],pt[0xC])pW=pm(pW,pt[0x5],pt[0xD])pX=pm(pX,pt[0x6],pt[0xE])pY=pm(pY,pt[0x7],pt[0xF])end;pJ[1],pJ[2],pJ[3],pJ[4],pJ[5],pJ[6],pJ[7],pJ[8]=pR,pS,pT,pU,pV,pW,pX,pY;return pO end end;local qa=nM.typeof"int64_t[?]"oA=0;oH=pg(2^32)function ob()return qa(30)end;function og(qb,qc,qd,qe,qf,qg)local qh=oq;local qi=nZ(qg,3)for qj=qe,qe+qf-1,qg do for qk=0,qi-1 do qj=qj+8;local ql,qm,qn,qo,qp,qq,qr,qs=nf(qd,qj-7,qj)qb[qk]=pm(qb[qk],pl(nW(nY(qs,24),nY(qr,16),nY(qq,8),qp)*pg(2^32),pj(pi(nW(nY(qo,24),nY(qn,16),nY(qm,8),ql)))))end;for qt=1,24 do for qu=0,4 do qb[25+qu]=pm(qb[qu],qb[qu+5],qb[qu+10],qb[qu+15],qb[qu+20])end;local qv=pm(qb[25],pr(qb[27],1))qb[1],qb[6],qb[11],qb[16]=pr(pm(qv,qb[6]),44),pr(pm(qv,qb[16]),45),pr(pm(qv,qb[1]),1),pr(pm(qv,qb[11]),10)qb[21]=pr(pm(qv,qb[21]),2)qv=pm(qb[26],pr(qb[28],1))qb[2],qb[7],qb[12],qb[22]=pr(pm(qv,qb[12]),43),pr(pm(qv,qb[22]),61),pr(pm(qv,qb[7]),6),pr(pm(qv,qb[2]),62)qb[17]=pr(pm(qv,qb[17]),15)qv=pm(qb[27],pr(qb[29],1))qb[3],qb[8],qb[18],qb[23]=pr(pm(qv,qb[18]),21),pr(pm(qv,qb[3]),28),pr(pm(qv,qb[23]),56),pr(pm(qv,qb[8]),55)qb[13]=pr(pm(qv,qb[13]),25)qv=pm(qb[28],pr(qb[25],1))qb[4],qb[14],qb[19],qb[24]=pr(pm(qv,qb[24]),14),pr(pm(qv,qb[19]),8),pr(pm(qv,qb[4]),27),pr(pm(qv,qb[14]),39)qb[9]=pr(pm(qv,qb[9]),20)qv=pm(qb[29],pr(qb[26],1))qb[5],qb[10],qb[15],qb[20]=pr(pm(qv,qb[10]),3),pr(pm(qv,qb[20]),18),pr(pm(qv,qb[5]),36),pr(pm(qv,qb[15]),41)qb[0]=pm(qv,qb[0])qb[0],qb[1],qb[2],qb[3],qb[4]=pm(qb[0],pk(po(qb[1]),qb[2]),qh[qt]),pm(qb[1],pk(po(qb[2]),qb[3])),pm(qb[2],pk(po(qb[3]),qb[4])),pm(qb[3],pk(po(qb[4]),qb[0])),pm(qb[4],pk(po(qb[0]),qb[1]))qb[5],qb[6],qb[7],qb[8],qb[9]=pm(qb[8],pk(po(qb[9]),qb[5])),pm(qb[9],pk(po(qb[5]),qb[6])),pm(qb[5],pk(po(qb[6]),qb[7])),pm(qb[6],pk(po(qb[7]),qb[8])),pm(qb[7],pk(po(qb[8]),qb[9]))qb[10],qb[11],qb[12],qb[13],qb[14]=pm(qb[11],pk(po(qb[12]),qb[13])),pm(qb[12],pk(po(qb[13]),qb[14])),pm(qb[13],pk(po(qb[14]),qb[10])),pm(qb[14],pk(po(qb[10]),qb[11])),pm(qb[10],pk(po(qb[11]),qb[12]))qb[15],qb[16],qb[17],qb[18],qb[19]=pm(qb[19],pk(po(qb[15]),qb[16])),pm(qb[15],pk(po(qb[16]),qb[17])),pm(qb[16],pk(po(qb[17]),qb[18])),pm(qb[17],pk(po(qb[18]),qb[19])),pm(qb[18],pk(po(qb[19]),qb[15]))qb[20],qb[21],qb[22],qb[23],qb[24]=pm(qb[22],pk(po(qb[23]),qb[24])),pm(qb[23],pk(po(qb[24]),qb[20])),pm(qb[24],pk(po(qb[20]),qb[21])),pm(qb[20],pk(po(qb[21]),qb[22])),pm(qb[21],pk(po(qb[22]),qb[23]))end end end;local qx=0xA5A5A5A5*pg(2^32+1)function n9(qy,qz)return pm(qy,qz or qx)end;function od(qA,qB,qC,qD,qE)local qF,qG=pf,ol;for qH=qD,qD+qE-1,128 do for qI=0,15 do qH=qH+8;local qJ,qK,qL,qM,qN,qO,qP,qQ=nf(qC,qH-7,qH)qF[qI]=pl(nW(nY(qJ,24),nY(qK,16),nY(qL,8),qM)*pg(2^32),pj(pi(nW(nY(qN,24),nY(qO,16),nY(qP,8),qQ))))end;for qR=16,79 do local qS,qT=qF[qR-15],qF[qR-2]qF[qR]=pm(ps(qS,1),ps(qS,8),pq(qS,7))+pm(ps(qT,19),pr(qT,3),pq(qT,6))+qF[qR-7]+qF[qR-16]end;local qU,qV,qW,qX,qY,qZ,q0,q3=qA[1],qA[2],qA[3],qA[4],qA[5],qA[6],qA[7],qA[8]for q4=0,79,8 do local q6=pm(ps(qY,14),ps(qY,18),pr(qY,23))+pm(q0,pk(qY,pm(qZ,q0)))+q3+qG[q4+1]+qF[q4]q3,q0,qZ,qY=q0,qZ,qY,q6+qX;qX,qW,qV,qU=qW,qV,qU,pm(pk(pm(qU,qV),qW),pk(qU,qV))+pm(ps(qU,28),pr(qU,25),pr(qU,30))+q6;q6=pm(ps(qY,14),ps(qY,18),pr(qY,23))+pm(q0,pk(qY,pm(qZ,q0)))+q3+qG[q4+2]+qF[q4+1]q3,q0,qZ,qY=q0,qZ,qY,q6+qX;qX,qW,qV,qU=qW,qV,qU,pm(pk(pm(qU,qV),qW),pk(qU,qV))+pm(ps(qU,28),pr(qU,25),pr(qU,30))+q6;q6=pm(ps(qY,14),ps(qY,18),pr(qY,23))+pm(q0,pk(qY,pm(qZ,q0)))+q3+qG[q4+3]+qF[q4+2]q3,q0,qZ,qY=q0,qZ,qY,q6+qX;qX,qW,qV,qU=qW,qV,qU,pm(pk(pm(qU,qV),qW),pk(qU,qV))+pm(ps(qU,28),pr(qU,25),pr(qU,30))+q6;q6=pm(ps(qY,14),ps(qY,18),pr(qY,23))+pm(q0,pk(qY,pm(qZ,q0)))+q3+qG[q4+4]+qF[q4+3]q3,q0,qZ,qY=q0,qZ,qY,q6+qX;qX,qW,qV,qU=qW,qV,qU,pm(pk(pm(qU,qV),qW),pk(qU,qV))+pm(ps(qU,28),pr(qU,25),pr(qU,30))+q6;q6=pm(ps(qY,14),ps(qY,18),pr(qY,23))+pm(q0,pk(qY,pm(qZ,q0)))+q3+qG[q4+5]+qF[q4+4]q3,q0,qZ,qY=q0,qZ,qY,q6+qX;qX,qW,qV,qU=qW,qV,qU,pm(pk(pm(qU,qV),qW),pk(qU,qV))+pm(ps(qU,28),pr(qU,25),pr(qU,30))+q6;q6=pm(ps(qY,14),ps(qY,18),pr(qY,23))+pm(q0,pk(qY,pm(qZ,q0)))+q3+qG[q4+6]+qF[q4+5]q3,q0,qZ,qY=q0,qZ,qY,q6+qX;qX,qW,qV,qU=qW,qV,qU,pm(pk(pm(qU,qV),qW),pk(qU,qV))+pm(ps(qU,28),pr(qU,25),pr(qU,30))+q6;q6=pm(ps(qY,14),ps(qY,18),pr(qY,23))+pm(q0,pk(qY,pm(qZ,q0)))+q3+qG[q4+7]+qF[q4+6]q3,q0,qZ,qY=q0,qZ,qY,q6+qX;qX,qW,qV,qU=qW,qV,qU,pm(pk(pm(qU,qV),qW),pk(qU,qV))+pm(ps(qU,28),pr(qU,25),pr(qU,30))+q6;q6=pm(ps(qY,14),ps(qY,18),pr(qY,23))+pm(q0,pk(qY,pm(qZ,q0)))+q3+qG[q4+8]+qF[q4+7]q3,q0,qZ,qY=q0,qZ,qY,q6+qX;qX,qW,qV,qU=qW,qV,qU,pm(pk(pm(qU,qV),qW),pk(qU,qV))+pm(ps(qU,28),pr(qU,25),pr(qU,30))+q6 end;qA[1]=qU+qA[1]qA[2]=qV+qA[2]qA[3]=qW+qA[3]qA[4]=qX+qA[4]qA[5]=qY+qA[5]qA[6]=qZ+qA[6]qA[7]=q0+qA[7]qA[8]=q3+qA[8]end end else local q7=nM.new("union{int64_t i64; struct{int32_t "..(nM.abi("le")and"lo, hi"or"hi, lo")..";} i32;}[3]")local function q8(q9)q7[0].i64=q9;local q_,ra=q7[0].i32.lo,q7[0].i32.hi;local rb=nX(nZ(q_,1),nY(ra,31),nZ(q_,8),nY(ra,24),nZ(q_,7),nY(ra,25))local rc=nX(nZ(ra,1),nY(q_,31),nZ(ra,8),nY(q_,24),nZ(ra,7))return rc*pg(2^32)+pj(pi(rb))end;local function rd(re)q7[0].i64=re;local rf,rg=q7[0].i32.lo,q7[0].i32.hi;local ri=nX(nZ(rf,19),nY(rg,13),nY(rf,3),nZ(rg,29),nZ(rf,6),nY(rg,26))local rj=nX(nZ(rg,19),nY(rf,13),nY(rg,3),nZ(rf,29),nZ(rg,6))return rj*pg(2^32)+pj(pi(ri))end;local function rk(rl)q7[0].i64=rl;local rm,ro=q7[0].i32.lo,q7[0].i32.hi;local rp=nX(nZ(rm,14),nY(ro,18),nZ(rm,18),nY(ro,14),nY(rm,23),nZ(ro,9))local rq=nX(nZ(ro,14),nY(rm,18),nZ(ro,18),nY(rm,14),nY(ro,23),nZ(rm,9))return rq*pg(2^32)+pj(pi(rp))end;local function rr(rs)q7[0].i64=rs;local rt,ru=q7[0].i32.lo,q7[0].i32.hi;local rv=nX(nZ(rt,28),nY(ru,4),nY(rt,30),nZ(ru,2),nY(rt,25),nZ(ru,7))local rz=nX(nZ(ru,28),nY(rt,4),nY(ru,30),nZ(rt,2),nY(ru,25),nZ(rt,7))return rz*pg(2^32)+pj(pi(rv))end;local function rA(rB,rC,rD)q7[0].i64=rC;q7[1].i64=rD;q7[2].i64=rB;local rE,rF=q7[0].i32.lo,q7[0].i32.hi;local rG,rH=q7[1].i32.lo,q7[1].i32.hi;local rI,rJ=q7[2].i32.lo,q7[2].i32.hi;local rK=nX(rG,nV(rI,nX(rE,rG)))local rL=nX(rH,nV(rJ,nX(rF,rH)))return rL*pg(2^32)+pj(pi(rK))end;local function rM(rN,rO,rP)q7[0].i64=rN;q7[1].i64=rO;q7[2].i64=rP;local rQ,rR=q7[0].i32.lo,q7[0].i32.hi;local rS,rT=q7[1].i32.lo,q7[1].i32.hi;local rU,rV=q7[2].i32.lo,q7[2].i32.hi;local rW=nX(nV(nX(rQ,rS),rU),nV(rQ,rS))local rX=nX(nV(nX(rR,rT),rV),nV(rR,rT))return rX*pg(2^32)+pj(pi(rW))end;local function rY(rZ,r0,r1)q7[0].i64=rZ;q7[1].i64=r0;local r2,r3=q7[0].i32.lo,q7[0].i32.hi;local r4,r5=q7[1].i32.lo,q7[1].i32.hi;local r6,r7=nX(r2,r4),nX(r3,r5)local r8=nX(nZ(r6,r1),nY(r7,-r1))local r9=nX(nZ(r7,r1),nY(r6,-r1))return r9*pg(2^32)+pj(pi(r8))end;local function r_(sa,sb)q7[0].i64=sa;q7[1].i64=sb;local sc,sd=q7[0].i32.lo,q7[0].i32.hi;local sf,sg=q7[1].i32.lo,q7[1].i32.hi;local si,sj=nX(sc,sf),nX(sd,sg)local sk=nX(nY(si,1),nZ(sj,31))local sl=nX(nY(sj,1),nZ(si,31))return sl*pg(2^32)+pj(pi(sk))end;local function sm(sn,so)q7[0].i64=sn;q7[1].i64=so;local sq,sr=q7[0].i32.lo,q7[0].i32.hi;local ss,su=q7[1].i32.lo,q7[1].i32.hi;local sv,sx=nX(sq,ss),nX(sr,su)return sv*pg(2^32)+pj(pi(sx))end;local function sy(sz,sA)q7[0].i64=sz;q7[1].i64=sA;local sB,sC=q7[0].i32.lo,q7[0].i32.hi;local sD,sE=q7[1].i32.lo,q7[1].i32.hi;local sF,sG=nX(sB,sD),nX(sC,sE)return sG*pg(2^32)+pj(pi(sF))end;local function sH(sI,sJ,sK)q7[0].i64=sI;q7[1].i64=sJ;q7[2].i64=sK;local sL,sM=q7[0].i32.lo,q7[0].i32.hi;local sN,sO=q7[1].i32.lo,q7[1].i32.hi;local sP,sQ=q7[2].i32.lo,q7[2].i32.hi;local sR,sS=nX(sL,sN,sP),nX(sM,sO,sQ)return sS*pg(2^32)+pj(pi(sR))end;function n9(sT,sU)q7[0].i64=sT;local sV,sW=q7[0].i32.lo,q7[0].i32.hi;local sX,sY=0xA5A5A5A5,0xA5A5A5A5;if sU then q7[1].i64=sU;sX,sY=q7[1].i32.lo,q7[1].i32.hi end;sV=nX(sV,sX)sW=nX(sW,sY)return sW*pg(2^32)+pj(pi(sV))end;function oz(sZ)q7[0].i64=sZ;return n5(q7[0].i32.hi)..n5(q7[0].i32.lo)end;function od(s0,s1,s2,s3,s4)local s5,s6=pf,ol;for s7=s3,s3+s4-1,128 do for s8=0,15 do s7=s7+8;local s9,s_,ta,tb,tc,td,te,tf=nf(s2,s7-7,s7)s5[s8]=nW(nY(s9,24),nY(s_,16),nY(ta,8),tb)*pg(2^32)+pj(pi(nW(nY(tc,24),nY(td,16),nY(te,8),tf)))end;for tg=16,79 do s5[tg]=q8(s5[tg-15])+rd(s5[tg-2])+s5[tg-7]+s5[tg-16]end;local ti,tj,tk,tl,tm,tn,to,tp=s0[1],s0[2],s0[3],s0[4],s0[5],s0[6],s0[7],s0[8]for tq=0,79,8 do local tr=rk(tm)+rA(tm,tn,to)+tp+s6[tq+1]+s5[tq]tp,to,tn,tm=to,tn,tm,tr+tl;tl,tk,tj,ti=tk,tj,ti,rM(ti,tj,tk)+rr(ti)+tr;tr=rk(tm)+rA(tm,tn,to)+tp+s6[tq+2]+s5[tq+1]tp,to,tn,tm=to,tn,tm,tr+tl;tl,tk,tj,ti=tk,tj,ti,rM(ti,tj,tk)+rr(ti)+tr;tr=rk(tm)+rA(tm,tn,to)+tp+s6[tq+3]+s5[tq+2]tp,to,tn,tm=to,tn,tm,tr+tl;tl,tk,tj,ti=tk,tj,ti,rM(ti,tj,tk)+rr(ti)+tr;tr=rk(tm)+rA(tm,tn,to)+tp+s6[tq+4]+s5[tq+3]tp,to,tn,tm=to,tn,tm,tr+tl;tl,tk,tj,ti=tk,tj,ti,rM(ti,tj,tk)+rr(ti)+tr;tr=rk(tm)+rA(tm,tn,to)+tp+s6[tq+5]+s5[tq+4]tp,to,tn,tm=to,tn,tm,tr+tl;tl,tk,tj,ti=tk,tj,ti,rM(ti,tj,tk)+rr(ti)+tr;tr=rk(tm)+rA(tm,tn,to)+tp+s6[tq+6]+s5[tq+5]tp,to,tn,tm=to,tn,tm,tr+tl;tl,tk,tj,ti=tk,tj,ti,rM(ti,tj,tk)+rr(ti)+tr;tr=rk(tm)+rA(tm,tn,to)+tp+s6[tq+7]+s5[tq+6]tp,to,tn,tm=to,tn,tm,tr+tl;tl,tk,tj,ti=tk,tj,ti,rM(ti,tj,tk)+rr(ti)+tr;tr=rk(tm)+rA(tm,tn,to)+tp+s6[tq+8]+s5[tq+7]tp,to,tn,tm=to,tn,tm,tr+tl;tl,tk,tj,ti=tk,tj,ti,rM(ti,tj,tk)+rr(ti)+tr end;s0[1]=ti+s0[1]s0[2]=tj+s0[2]s0[3]=tk+s0[3]s0[4]=tl+s0[4]s0[5]=tm+s0[5]s0[6]=tn+s0[6]s0[7]=to+s0[7]s0[8]=tp+s0[8]end end;do local ts=nM.new("int64_t[?]",16)local tt=oC;local function tu(tv,tz,tA,tB,tC,tD)local tE,tF,tG,tH=ts[tv],ts[tz],ts[tA],ts[tB]tE=tt[tC]+tE+tF;tH=sm(tH,tE)tG=tG+tH;tF=rY(tF,tG,24)tE=tt[tD]+tE+tF;tH=rY(tH,tE,16)tG=tG+tH;tF=r_(tF,tG)ts[tv],ts[tz],ts[tA],ts[tB]=tE,tF,tG,tH end;function oi(tI,tJ,tK,tL,tM,tN,tO,tP)local tQ,tR,tS,tT,tU,tV,tW,tX=tI[1],tI[2],tI[3],tI[4],tI[5],tI[6],tI[7],tI[8]for tY=tL,tL+tM-1,128 do if tK then for tZ=1,16 do tY=tY+8;local t0,t1,t2,t3,t4,t5,t6,t7=nf(tK,tY-7,tY)tt[tZ]=sy(nW(nY(t7,24),nY(t6,16),nY(t5,8),t4)*pg(2^32),pj(pi(nW(nY(t3,24),nY(t2,16),nY(t1,8),t0))))end end;ts[0x0],ts[0x1],ts[0x2],ts[0x3],ts[0x4],ts[0x5],ts[0x6],ts[0x7]=tQ,tR,tS,tT,tU,tV,tW,tX;ts[0x8],ts[0x9],ts[0xA],ts[0xB],ts[0xD],ts[0xE],ts[0xF]=oo[1],oo[2],oo[3],oo[4],oo[6],oo[7],oo[8]tN=tN+(tO or 128)ts[0xC]=sy(oo[5],tN)if tO then ts[0xE]=-1-ts[0xE]end;if tP then ts[0xF]=-1-ts[0xF]end;for t8=1,12 do local t9=oI[t8]tu(0,4,8,12,t9[1],t9[2])tu(1,5,9,13,t9[3],t9[4])tu(2,6,10,14,t9[5],t9[6])tu(3,7,11,15,t9[7],t9[8])tu(0,5,10,15,t9[9],t9[10])tu(1,6,11,12,t9[11],t9[12])tu(2,7,8,13,t9[13],t9[14])tu(3,4,9,14,t9[15],t9[16])end;tQ=sH(tQ,ts[0x0],ts[0x8])tR=sH(tR,ts[0x1],ts[0x9])tS=sH(tS,ts[0x2],ts[0xA])tT=sH(tT,ts[0x3],ts[0xB])tU=sH(tU,ts[0x4],ts[0xC])tV=sH(tV,ts[0x5],ts[0xD])tW=sH(tW,ts[0x6],ts[0xE])tX=sH(tX,ts[0x7],ts[0xF])end;tI[1],tI[2],tI[3],tI[4],tI[5],tI[6],tI[7],tI[8]=tQ,tR,tS,tT,tU,tV,tW,tX;return tN end end end;function oe(t_,ua,ub,uc)local ud,ue=oP,ow;for uf=ub,ub+uc-1,64 do for ug=0,15 do uf=uf+4;local uh,uj,uk,ul=nf(ua,uf-3,uf)ud[ug]=nW(nY(ul,24),nY(uk,16),nY(uj,8),uh)end;local um,un,uo,up=t_[1],t_[2],t_[3],t_[4]for uq=0,15,4 do um,up,uo,un=up,uo,un,n4(n0(nX(up,nV(un,nX(uo,up)))+ue[uq+1]+ud[uq]+um,7)+un)um,up,uo,un=up,uo,un,n4(n0(nX(up,nV(un,nX(uo,up)))+ue[uq+2]+ud[uq+1]+um,12)+un)um,up,uo,un=up,uo,un,n4(n0(nX(up,nV(un,nX(uo,up)))+ue[uq+3]+ud[uq+2]+um,17)+un)um,up,uo,un=up,uo,un,n4(n0(nX(up,nV(un,nX(uo,up)))+ue[uq+4]+ud[uq+3]+um,22)+un)end;for ur=16,31,4 do local us=5*ur;um,up,uo,un=up,uo,un,n4(n0(nX(uo,nV(up,nX(un,uo)))+ue[ur+1]+ud[nV(us+1,15)]+um,5)+un)um,up,uo,un=up,uo,un,n4(n0(nX(uo,nV(up,nX(un,uo)))+ue[ur+2]+ud[nV(us+6,15)]+um,9)+un)um,up,uo,un=up,uo,un,n4(n0(nX(uo,nV(up,nX(un,uo)))+ue[ur+3]+ud[nV(us-5,15)]+um,14)+un)um,up,uo,un=up,uo,un,n4(n0(nX(uo,nV(up,nX(un,uo)))+ue[ur+4]+ud[nV(us,15)]+um,20)+un)end;for ut=32,47,4 do local uu=3*ut;um,up,uo,un=up,uo,un,n4(n0(nX(un,uo,up)+ue[ut+1]+ud[nV(uu+5,15)]+um,4)+un)um,up,uo,un=up,uo,un,n4(n0(nX(un,uo,up)+ue[ut+2]+ud[nV(uu+8,15)]+um,11)+un)um,up,uo,un=up,uo,un,n4(n0(nX(un,uo,up)+ue[ut+3]+ud[nV(uu-5,15)]+um,16)+un)um,up,uo,un=up,uo,un,n4(n0(nX(un,uo,up)+ue[ut+4]+ud[nV(uu-2,15)]+um,23)+un)end;for uv=48,63,4 do local uw=7*uv;um,up,uo,un=up,uo,un,n4(n0(nX(uo,nW(un,n3(up)))+ue[uv+1]+ud[nV(uw,15)]+um,6)+un)um,up,uo,un=up,uo,un,n4(n0(nX(uo,nW(un,n3(up)))+ue[uv+2]+ud[nV(uw+7,15)]+um,10)+un)um,up,uo,un=up,uo,un,n4(n0(nX(uo,nW(un,n3(up)))+ue[uv+3]+ud[nV(uw-2,15)]+um,15)+un)um,up,uo,un=up,uo,un,n4(n0(nX(uo,nW(un,n3(up)))+ue[uv+4]+ud[nV(uw+5,15)]+um,21)+un)end;t_[1],t_[2],t_[3],t_[4]=n4(um+t_[1]),n4(un+t_[2]),n4(uo+t_[3]),n4(up+t_[4])end end;function of(ux,uy,uz,uA)local uB=oP;for uC=uz,uz+uA-1,64 do for uD=0,15 do uC=uC+4;local uE,uF,uG,uH=nf(uy,uC-3,uC)uB[uD]=nW(nY(uE,24),nY(uF,16),nY(uG,8),uH)end;for uI=16,79 do uB[uI]=n0(nX(uB[uI-3],uB[uI-8],uB[uI-14],uB[uI-16]),1)end;local uJ,uK,uL,uM,uN=ux[1],ux[2],ux[3],ux[4],ux[5]for uO=0,19,5 do uN,uM,uL,uK,uJ=uM,uL,n1(uK,2),uJ,n4(n0(uJ,5)+nX(uM,nV(uK,nX(uM,uL)))+uB[uO]+0x5A827999+uN)uN,uM,uL,uK,uJ=uM,uL,n1(uK,2),uJ,n4(n0(uJ,5)+nX(uM,nV(uK,nX(uM,uL)))+uB[uO+1]+0x5A827999+uN)uN,uM,uL,uK,uJ=uM,uL,n1(uK,2),uJ,n4(n0(uJ,5)+nX(uM,nV(uK,nX(uM,uL)))+uB[uO+2]+0x5A827999+uN)uN,uM,uL,uK,uJ=uM,uL,n1(uK,2),uJ,n4(n0(uJ,5)+nX(uM,nV(uK,nX(uM,uL)))+uB[uO+3]+0x5A827999+uN)uN,uM,uL,uK,uJ=uM,uL,n1(uK,2),uJ,n4(n0(uJ,5)+nX(uM,nV(uK,nX(uM,uL)))+uB[uO+4]+0x5A827999+uN)end;for uP=20,39,5 do uN,uM,uL,uK,uJ=uM,uL,n1(uK,2),uJ,n4(n0(uJ,5)+nX(uK,uL,uM)+uB[uP]+0x6ED9EBA1+uN)uN,uM,uL,uK,uJ=uM,uL,n1(uK,2),uJ,n4(n0(uJ,5)+nX(uK,uL,uM)+uB[uP+1]+0x6ED9EBA1+uN)uN,uM,uL,uK,uJ=uM,uL,n1(uK,2),uJ,n4(n0(uJ,5)+nX(uK,uL,uM)+uB[uP+2]+0x6ED9EBA1+uN)uN,uM,uL,uK,uJ=uM,uL,n1(uK,2),uJ,n4(n0(uJ,5)+nX(uK,uL,uM)+uB[uP+3]+0x6ED9EBA1+uN)uN,uM,uL,uK,uJ=uM,uL,n1(uK,2),uJ,n4(n0(uJ,5)+nX(uK,uL,uM)+uB[uP+4]+0x6ED9EBA1+uN)end;for uQ=40,59,5 do uN,uM,uL,uK,uJ=uM,uL,n1(uK,2),uJ,n4(n0(uJ,5)+nX(nV(uM,nX(uK,uL)),nV(uK,uL))+uB[uQ]+0x8F1BBCDC+uN)uN,uM,uL,uK,uJ=uM,uL,n1(uK,2),uJ,n4(n0(uJ,5)+nX(nV(uM,nX(uK,uL)),nV(uK,uL))+uB[uQ+1]+0x8F1BBCDC+uN)uN,uM,uL,uK,uJ=uM,uL,n1(uK,2),uJ,n4(n0(uJ,5)+nX(nV(uM,nX(uK,uL)),nV(uK,uL))+uB[uQ+2]+0x8F1BBCDC+uN)uN,uM,uL,uK,uJ=uM,uL,n1(uK,2),uJ,n4(n0(uJ,5)+nX(nV(uM,nX(uK,uL)),nV(uK,uL))+uB[uQ+3]+0x8F1BBCDC+uN)uN,uM,uL,uK,uJ=uM,uL,n1(uK,2),uJ,n4(n0(uJ,5)+nX(nV(uM,nX(uK,uL)),nV(uK,uL))+uB[uQ+4]+0x8F1BBCDC+uN)end;for uR=60,79,5 do uN,uM,uL,uK,uJ=uM,uL,n1(uK,2),uJ,n4(n0(uJ,5)+nX(uK,uL,uM)+uB[uR]+0xCA62C1D6+uN)uN,uM,uL,uK,uJ=uM,uL,n1(uK,2),uJ,n4(n0(uJ,5)+nX(uK,uL,uM)+uB[uR+1]+0xCA62C1D6+uN)uN,uM,uL,uK,uJ=uM,uL,n1(uK,2),uJ,n4(n0(uJ,5)+nX(uK,uL,uM)+uB[uR+2]+0xCA62C1D6+uN)uN,uM,uL,uK,uJ=uM,uL,n1(uK,2),uJ,n4(n0(uJ,5)+nX(uK,uL,uM)+uB[uR+3]+0xCA62C1D6+uN)uN,uM,uL,uK,uJ=uM,uL,n1(uK,2),uJ,n4(n0(uJ,5)+nX(uK,uL,uM)+uB[uR+4]+0xCA62C1D6+uN)end;ux[1],ux[2],ux[3],ux[4],ux[5]=n4(uJ+ux[1]),n4(uK+ux[2]),n4(uL+ux[3]),n4(uM+ux[4]),n4(uN+ux[5])end end end;if nU=="FFI"and not nK or nU=="LJ"then if nU=="FFI"then local uS=nM.typeof"int32_t[?]"function ob()return uS(31)end end;function og(uT,uU,uV,uW,uX,uY)local uZ,u0=oq,os;local u1=nZ(uY,3)for u2=uW,uW+uX-1,uY do for u3=1,u1 do local u4,u5,u6,u7=nf(uV,u2+1,u2+4)uT[u3]=nX(uT[u3],nW(nY(u7,24),nY(u6,16),nY(u5,8),u4))u2=u2+8;u4,u5,u6,u7=nf(uV,u2-3,u2)uU[u3]=nX(uU[u3],nW(nY(u7,24),nY(u6,16),nY(u5,8),u4))end;for u9=1,24 do for u_=1,5 do uT[25+u_]=nX(uT[u_],uT[u_+5],uT[u_+10],uT[u_+15],uT[u_+20])end;for va=1,5 do uU[25+va]=nX(uU[va],uU[va+5],uU[va+10],uU[va+15],uU[va+20])end;local vb=nX(uT[26],nY(uT[28],1),nZ(uU[28],31))local vc=nX(uU[26],nY(uU[28],1),nZ(uT[28],31))uT[2],uU[2],uT[7],uU[7],uT[12],uU[12],uT[17],uU[17]=nX(nZ(nX(vb,uT[7]),20),nY(nX(vc,uU[7]),12)),nX(nZ(nX(vc,uU[7]),20),nY(nX(vb,uT[7]),12)),nX(nZ(nX(vb,uT[17]),19),nY(nX(vc,uU[17]),13)),nX(nZ(nX(vc,uU[17]),19),nY(nX(vb,uT[17]),13)),nX(nY(nX(vb,uT[2]),1),nZ(nX(vc,uU[2]),31)),nX(nY(nX(vc,uU[2]),1),nZ(nX(vb,uT[2]),31)),nX(nY(nX(vb,uT[12]),10),nZ(nX(vc,uU[12]),22)),nX(nY(nX(vc,uU[12]),10),nZ(nX(vb,uT[12]),22))local vd,ve=nX(vb,uT[22]),nX(vc,uU[22])uT[22],uU[22]=nX(nY(vd,2),nZ(ve,30)),nX(nY(ve,2),nZ(vd,30))vb=nX(uT[27],nY(uT[29],1),nZ(uU[29],31))vc=nX(uU[27],nY(uU[29],1),nZ(uT[29],31))uT[3],uU[3],uT[8],uU[8],uT[13],uU[13],uT[23],uU[23]=nX(nZ(nX(vb,uT[13]),21),nY(nX(vc,uU[13]),11)),nX(nZ(nX(vc,uU[13]),21),nY(nX(vb,uT[13]),11)),nX(nZ(nX(vb,uT[23]),3),nY(nX(vc,uU[23]),29)),nX(nZ(nX(vc,uU[23]),3),nY(nX(vb,uT[23]),29)),nX(nY(nX(vb,uT[8]),6),nZ(nX(vc,uU[8]),26)),nX(nY(nX(vc,uU[8]),6),nZ(nX(vb,uT[8]),26)),nX(nZ(nX(vb,uT[3]),2),nY(nX(vc,uU[3]),30)),nX(nZ(nX(vc,uU[3]),2),nY(nX(vb,uT[3]),30))vd,ve=nX(vb,uT[18]),nX(vc,uU[18])uT[18],uU[18]=nX(nY(vd,15),nZ(ve,17)),nX(nY(ve,15),nZ(vd,17))vb=nX(uT[28],nY(uT[30],1),nZ(uU[30],31))vc=nX(uU[28],nY(uU[30],1),nZ(uT[30],31))uT[4],uU[4],uT[9],uU[9],uT[19],uU[19],uT[24],uU[24]=nX(nY(nX(vb,uT[19]),21),nZ(nX(vc,uU[19]),11)),nX(nY(nX(vc,uU[19]),21),nZ(nX(vb,uT[19]),11)),nX(nY(nX(vb,uT[4]),28),nZ(nX(vc,uU[4]),4)),nX(nY(nX(vc,uU[4]),28),nZ(nX(vb,uT[4]),4)),nX(nZ(nX(vb,uT[24]),8),nY(nX(vc,uU[24]),24)),nX(nZ(nX(vc,uU[24]),8),nY(nX(vb,uT[24]),24)),nX(nZ(nX(vb,uT[9]),9),nY(nX(vc,uU[9]),23)),nX(nZ(nX(vc,uU[9]),9),nY(nX(vb,uT[9]),23))vd,ve=nX(vb,uT[14]),nX(vc,uU[14])uT[14],uU[14]=nX(nY(vd,25),nZ(ve,7)),nX(nY(ve,25),nZ(vd,7))vb=nX(uT[29],nY(uT[26],1),nZ(uU[26],31))vc=nX(uU[29],nY(uU[26],1),nZ(uT[26],31))uT[5],uU[5],uT[15],uU[15],uT[20],uU[20],uT[25],uU[25]=nX(nY(nX(vb,uT[25]),14),nZ(nX(vc,uU[25]),18)),nX(nY(nX(vc,uU[25]),14),nZ(nX(vb,uT[25]),18)),nX(nY(nX(vb,uT[20]),8),nZ(nX(vc,uU[20]),24)),nX(nY(nX(vc,uU[20]),8),nZ(nX(vb,uT[20]),24)),nX(nY(nX(vb,uT[5]),27),nZ(nX(vc,uU[5]),5)),nX(nY(nX(vc,uU[5]),27),nZ(nX(vb,uT[5]),5)),nX(nZ(nX(vb,uT[15]),25),nY(nX(vc,uU[15]),7)),nX(nZ(nX(vc,uU[15]),25),nY(nX(vb,uT[15]),7))vd,ve=nX(vb,uT[10]),nX(vc,uU[10])uT[10],uU[10]=nX(nY(vd,20),nZ(ve,12)),nX(nY(ve,20),nZ(vd,12))vb=nX(uT[30],nY(uT[27],1),nZ(uU[27],31))vc=nX(uU[30],nY(uU[27],1),nZ(uT[27],31))uT[6],uU[6],uT[11],uU[11],uT[16],uU[16],uT[21],uU[21]=nX(nY(nX(vb,uT[11]),3),nZ(nX(vc,uU[11]),29)),nX(nY(nX(vc,uU[11]),3),nZ(nX(vb,uT[11]),29)),nX(nY(nX(vb,uT[21]),18),nZ(nX(vc,uU[21]),14)),nX(nY(nX(vc,uU[21]),18),nZ(nX(vb,uT[21]),14)),nX(nZ(nX(vb,uT[6]),28),nY(nX(vc,uU[6]),4)),nX(nZ(nX(vc,uU[6]),28),nY(nX(vb,uT[6]),4)),nX(nZ(nX(vb,uT[16]),23),nY(nX(vc,uU[16]),9)),nX(nZ(nX(vc,uU[16]),23),nY(nX(vb,uT[16]),9))uT[1],uU[1]=nX(vb,uT[1]),nX(vc,uU[1])uT[1],uT[2],uT[3],uT[4],uT[5]=nX(uT[1],nV(n3(uT[2]),uT[3]),uZ[u9]),nX(uT[2],nV(n3(uT[3]),uT[4])),nX(uT[3],nV(n3(uT[4]),uT[5])),nX(uT[4],nV(n3(uT[5]),uT[1])),nX(uT[5],nV(n3(uT[1]),uT[2]))uT[6],uT[7],uT[8],uT[9],uT[10]=nX(uT[9],nV(n3(uT[10]),uT[6])),nX(uT[10],nV(n3(uT[6]),uT[7])),nX(uT[6],nV(n3(uT[7]),uT[8])),nX(uT[7],nV(n3(uT[8]),uT[9])),nX(uT[8],nV(n3(uT[9]),uT[10]))uT[11],uT[12],uT[13],uT[14],uT[15]=nX(uT[12],nV(n3(uT[13]),uT[14])),nX(uT[13],nV(n3(uT[14]),uT[15])),nX(uT[14],nV(n3(uT[15]),uT[11])),nX(uT[15],nV(n3(uT[11]),uT[12])),nX(uT[11],nV(n3(uT[12]),uT[13]))uT[16],uT[17],uT[18],uT[19],uT[20]=nX(uT[20],nV(n3(uT[16]),uT[17])),nX(uT[16],nV(n3(uT[17]),uT[18])),nX(uT[17],nV(n3(uT[18]),uT[19])),nX(uT[18],nV(n3(uT[19]),uT[20])),nX(uT[19],nV(n3(uT[20]),uT[16]))uT[21],uT[22],uT[23],uT[24],uT[25]=nX(uT[23],nV(n3(uT[24]),uT[25])),nX(uT[24],nV(n3(uT[25]),uT[21])),nX(uT[25],nV(n3(uT[21]),uT[22])),nX(uT[21],nV(n3(uT[22]),uT[23])),nX(uT[22],nV(n3(uT[23]),uT[24]))uU[1],uU[2],uU[3],uU[4],uU[5]=nX(uU[1],nV(n3(uU[2]),uU[3]),u0[u9]),nX(uU[2],nV(n3(uU[3]),uU[4])),nX(uU[3],nV(n3(uU[4]),uU[5])),nX(uU[4],nV(n3(uU[5]),uU[1])),nX(uU[5],nV(n3(uU[1]),uU[2]))uU[6],uU[7],uU[8],uU[9],uU[10]=nX(uU[9],nV(n3(uU[10]),uU[6])),nX(uU[10],nV(n3(uU[6]),uU[7])),nX(uU[6],nV(n3(uU[7]),uU[8])),nX(uU[7],nV(n3(uU[8]),uU[9])),nX(uU[8],nV(n3(uU[9]),uU[10]))uU[11],uU[12],uU[13],uU[14],uU[15]=nX(uU[12],nV(n3(uU[13]),uU[14])),nX(uU[13],nV(n3(uU[14]),uU[15])),nX(uU[14],nV(n3(uU[15]),uU[11])),nX(uU[15],nV(n3(uU[11]),uU[12])),nX(uU[11],nV(n3(uU[12]),uU[13]))uU[16],uU[17],uU[18],uU[19],uU[20]=nX(uU[20],nV(n3(uU[16]),uU[17])),nX(uU[16],nV(n3(uU[17]),uU[18])),nX(uU[17],nV(n3(uU[18]),uU[19])),nX(uU[18],nV(n3(uU[19]),uU[20])),nX(uU[19],nV(n3(uU[20]),uU[16]))uU[21],uU[22],uU[23],uU[24],uU[25]=nX(uU[23],nV(n3(uU[24]),uU[25])),nX(uU[24],nV(n3(uU[25]),uU[21])),nX(uU[25],nV(n3(uU[21]),uU[22])),nX(uU[21],nV(n3(uU[22]),uU[23])),nX(uU[22],nV(n3(uU[23]),uU[24]))end end end end;if nU=="LJ"then function oc(vf,vg,vh,vi)local vj,vk=oB,om;for vl=vh,vh+vi-1,64 do for vn=1,16 do vl=vl+4;local vo,vp,vq,vr=nf(vg,vl-3,vl)vj[vn]=nW(nY(vo,24),nY(vp,16),nY(vq,8),vr)end;for vs=17,64 do local vt,vu=vj[vs-15],vj[vs-2]vj[vs]=n4(n4(nX(n1(vt,7),n0(vt,14),nZ(vt,3))+nX(n0(vu,15),n0(vu,13),nZ(vu,10)))+n4(vj[vs-7]+vj[vs-16]))end;local vv,vw,vx,vy,vz,vA,vB,vC=vf[1],vf[2],vf[3],vf[4],vf[5],vf[6],vf[7],vf[8]for vD=1,64,8 do local vE=n4(nX(n1(vz,6),n1(vz,11),n0(vz,7))+nX(vB,nV(vz,nX(vA,vB)))+vk[vD]+vj[vD]+vC)vC,vB,vA,vz=vB,vA,vz,n4(vy+vE)vy,vx,vw,vv=vx,vw,vv,n4(nX(nV(vv,nX(vw,vx)),nV(vw,vx))+nX(n1(vv,2),n1(vv,13),n0(vv,10))+vE)vE=n4(nX(n1(vz,6),n1(vz,11),n0(vz,7))+nX(vB,nV(vz,nX(vA,vB)))+vk[vD+1]+vj[vD+1]+vC)vC,vB,vA,vz=vB,vA,vz,n4(vy+vE)vy,vx,vw,vv=vx,vw,vv,n4(nX(nV(vv,nX(vw,vx)),nV(vw,vx))+nX(n1(vv,2),n1(vv,13),n0(vv,10))+vE)vE=n4(nX(n1(vz,6),n1(vz,11),n0(vz,7))+nX(vB,nV(vz,nX(vA,vB)))+vk[vD+2]+vj[vD+2]+vC)vC,vB,vA,vz=vB,vA,vz,n4(vy+vE)vy,vx,vw,vv=vx,vw,vv,n4(nX(nV(vv,nX(vw,vx)),nV(vw,vx))+nX(n1(vv,2),n1(vv,13),n0(vv,10))+vE)vE=n4(nX(n1(vz,6),n1(vz,11),n0(vz,7))+nX(vB,nV(vz,nX(vA,vB)))+vk[vD+3]+vj[vD+3]+vC)vC,vB,vA,vz=vB,vA,vz,n4(vy+vE)vy,vx,vw,vv=vx,vw,vv,n4(nX(nV(vv,nX(vw,vx)),nV(vw,vx))+nX(n1(vv,2),n1(vv,13),n0(vv,10))+vE)vE=n4(nX(n1(vz,6),n1(vz,11),n0(vz,7))+nX(vB,nV(vz,nX(vA,vB)))+vk[vD+4]+vj[vD+4]+vC)vC,vB,vA,vz=vB,vA,vz,n4(vy+vE)vy,vx,vw,vv=vx,vw,vv,n4(nX(nV(vv,nX(vw,vx)),nV(vw,vx))+nX(n1(vv,2),n1(vv,13),n0(vv,10))+vE)vE=n4(nX(n1(vz,6),n1(vz,11),n0(vz,7))+nX(vB,nV(vz,nX(vA,vB)))+vk[vD+5]+vj[vD+5]+vC)vC,vB,vA,vz=vB,vA,vz,n4(vy+vE)vy,vx,vw,vv=vx,vw,vv,n4(nX(nV(vv,nX(vw,vx)),nV(vw,vx))+nX(n1(vv,2),n1(vv,13),n0(vv,10))+vE)vE=n4(nX(n1(vz,6),n1(vz,11),n0(vz,7))+nX(vB,nV(vz,nX(vA,vB)))+vk[vD+6]+vj[vD+6]+vC)vC,vB,vA,vz=vB,vA,vz,n4(vy+vE)vy,vx,vw,vv=vx,vw,vv,n4(nX(nV(vv,nX(vw,vx)),nV(vw,vx))+nX(n1(vv,2),n1(vv,13),n0(vv,10))+vE)vE=n4(nX(n1(vz,6),n1(vz,11),n0(vz,7))+nX(vB,nV(vz,nX(vA,vB)))+vk[vD+7]+vj[vD+7]+vC)vC,vB,vA,vz=vB,vA,vz,n4(vy+vE)vy,vx,vw,vv=vx,vw,vv,n4(nX(nV(vv,nX(vw,vx)),nV(vw,vx))+nX(n1(vv,2),n1(vv,13),n0(vv,10))+vE)end;vf[1],vf[2],vf[3],vf[4]=n4(vv+vf[1]),n4(vw+vf[2]),n4(vx+vf[3]),n4(vy+vf[4])vf[5],vf[6],vf[7],vf[8]=n4(vz+vf[5]),n4(vA+vf[6]),n4(vB+vf[7]),n4(vC+vf[8])end end;local function vF(vG,vH,vI,vJ,vK,vL,vM,vN)local vO=vG%2^32+vI%2^32+vK%2^32+vM%2^32;local vP=vH+vJ+vL+vN;local vQ=n4(vO)local vR=n4(vP+no(vO/2^32))return vQ,vR end;if nL=="x86"then function od(vS,vT,vU,vV,vW)local vX,vY,vZ=oB,ol,om;for v0=vV,vV+vW-1,128 do for v1=1,16*2 do v0=v0+4;local v2,v3,v4,v5=nf(vU,v0-3,v0)vX[v1]=nW(nY(v2,24),nY(v3,16),nY(v4,8),v5)end;for v6=17*2,80*2,2 do local v7,v8=vX[v6-30],vX[v6-31]local v9=nX(nW(nZ(v7,1),nY(v8,31)),nW(nZ(v7,8),nY(v8,24)),nW(nZ(v7,7),nY(v8,25)))local v_=nX(nW(nZ(v8,1),nY(v7,31)),nW(nZ(v8,8),nY(v7,24)),nZ(v8,7))local wa,wb=vX[v6-4],vX[v6-5]local wc=nX(nW(nZ(wa,19),nY(wb,13)),nW(nY(wa,3),nZ(wb,29)),nW(nZ(wa,6),nY(wb,26)))local wd=nX(nW(nZ(wb,19),nY(wa,13)),nW(nY(wb,3),nZ(wa,29)),nZ(wb,6))vX[v6],vX[v6-1]=vF(v9,v_,wc,wd,vX[v6-14],vX[v6-15],vX[v6-32],vX[v6-33])end;local wf,wg,wh,wi,wj,wk,wl,wm=vS[1],vS[2],vS[3],vS[4],vS[5],vS[6],vS[7],vS[8]local wn,wo,wp,wq,wr,ws,wt,wu=vT[1],vT[2],vT[3],vT[4],vT[5],vT[6],vT[7],vT[8]local wv=0;for ww=1,80 do local wx=nX(wl,nV(wj,nX(wk,wl)))local wy=nX(wt,nV(wr,nX(ws,wt)))local wz=nX(nW(nZ(wj,14),nY(wr,18)),nW(nZ(wj,18),nY(wr,14)),nW(nY(wj,23),nZ(wr,9)))local wA=nX(nW(nZ(wr,14),nY(wj,18)),nW(nZ(wr,18),nY(wj,14)),nW(nY(wr,23),nZ(wj,9)))local wB=wz%2^32+wx%2^32+wm%2^32+vY[ww]+vX[2*ww]%2^32;local wC,wD=n4(wB),n4(wA+wy+wu+vZ[ww]+vX[2*ww-1]+no(wB/2^32))wv=wv+wv;wm,wu,wl,wt,wk,ws=nW(wv,wl),nW(wv,wt),nW(wv,wk),nW(wv,ws),nW(wv,wj),nW(wv,wr)local wE=wC%2^32+wi%2^32;wj,wr=n4(wE),n4(wD+wq+no(wE/2^32))wi,wq,wh,wp,wg,wo=nW(wv,wh),nW(wv,wp),nW(wv,wg),nW(wv,wo),nW(wv,wf),nW(wv,wn)wz=nX(nW(nZ(wg,28),nY(wo,4)),nW(nY(wg,30),nZ(wo,2)),nW(nY(wg,25),nZ(wo,7)))wA=nX(nW(nZ(wo,28),nY(wg,4)),nW(nY(wo,30),nZ(wg,2)),nW(nY(wo,25),nZ(wg,7)))wx=nW(nV(wi,wh),nV(wg,nX(wi,wh)))wy=nW(nV(wq,wp),nV(wo,nX(wq,wp)))local wF=wC%2^32+wx%2^32+wz%2^32;wf,wn=n4(wF),n4(wD+wy+wA+no(wF/2^32))end;vS[1],vT[1]=vF(vS[1],vT[1],wf,wn,0,0,0,0)vS[2],vT[2]=vF(vS[2],vT[2],wg,wo,0,0,0,0)vS[3],vT[3]=vF(vS[3],vT[3],wh,wp,0,0,0,0)vS[4],vT[4]=vF(vS[4],vT[4],wi,wq,0,0,0,0)vS[5],vT[5]=vF(vS[5],vT[5],wj,wr,0,0,0,0)vS[6],vT[6]=vF(vS[6],vT[6],wk,ws,0,0,0,0)vS[7],vT[7]=vF(vS[7],vT[7],wl,wt,0,0,0,0)vS[8],vT[8]=vF(vS[8],vT[8],wm,wu,0,0,0,0)end end else function od(wG,wH,wI,wJ,wK)local wL,wM,wN=oB,ol,om;for wO=wJ,wJ+wK-1,128 do for wP=1,16*2 do wO=wO+4;local wQ,wR,wS,wT=nf(wI,wO-3,wO)wL[wP]=nW(nY(wQ,24),nY(wR,16),nY(wS,8),wT)end;for wU=17*2,80*2,2 do local wV,wW=wL[wU-30],wL[wU-31]local wX=nX(nW(nZ(wV,1),nY(wW,31)),nW(nZ(wV,8),nY(wW,24)),nW(nZ(wV,7),nY(wW,25)))local wY=nX(nW(nZ(wW,1),nY(wV,31)),nW(nZ(wW,8),nY(wV,24)),nZ(wW,7))local wZ,w0=wL[wU-4],wL[wU-5]local w1=nX(nW(nZ(wZ,19),nY(w0,13)),nW(nY(wZ,3),nZ(w0,29)),nW(nZ(wZ,6),nY(w0,26)))local w2=nX(nW(nZ(w0,19),nY(wZ,13)),nW(nY(w0,3),nZ(wZ,29)),nZ(w0,6))wL[wU],wL[wU-1]=vF(wX,wY,w1,w2,wL[wU-14],wL[wU-15],wL[wU-32],wL[wU-33])end;local w3,w4,w5,w6,w7,w8,w9,w_=wG[1],wG[2],wG[3],wG[4],wG[5],wG[6],wG[7],wG[8]local xa,xb,xc,xd,xe,xf,xg,xh=wH[1],wH[2],wH[3],wH[4],wH[5],wH[6],wH[7],wH[8]for xi=1,80 do local xj=nX(w9,nV(w7,nX(w8,w9)))local xk=nX(xg,nV(xe,nX(xf,xg)))local xl=nX(nW(nZ(w7,14),nY(xe,18)),nW(nZ(w7,18),nY(xe,14)),nW(nY(w7,23),nZ(xe,9)))local xm=nX(nW(nZ(xe,14),nY(w7,18)),nW(nZ(xe,18),nY(w7,14)),nW(nY(xe,23),nZ(w7,9)))local xn=xl%2^32+xj%2^32+w_%2^32+wM[xi]+wL[2*xi]%2^32;local xo,xp=n4(xn),n4(xm+xk+xh+wN[xi]+wL[2*xi-1]+no(xn/2^32))w_,xh,w9,xg,w8,xf=w9,xg,w8,xf,w7,xe;local xq=xo%2^32+w6%2^32;w7,xe=n4(xq),n4(xp+xd+no(xq/2^32))w6,xd,w5,xc,w4,xb=w5,xc,w4,xb,w3,xa;xl=nX(nW(nZ(w4,28),nY(xb,4)),nW(nY(w4,30),nZ(xb,2)),nW(nY(w4,25),nZ(xb,7)))xm=nX(nW(nZ(xb,28),nY(w4,4)),nW(nY(xb,30),nZ(w4,2)),nW(nY(xb,25),nZ(w4,7)))xj=nW(nV(w6,w5),nV(w4,nX(w6,w5)))xk=nW(nV(xd,xc),nV(xb,nX(xd,xc)))local xr=xo%2^32+xl%2^32+xj%2^32;w3,xa=n4(xr),n4(xp+xm+xk+no(xr/2^32))end;wG[1],wH[1]=vF(wG[1],wH[1],w3,xa,0,0,0,0)wG[2],wH[2]=vF(wG[2],wH[2],w4,xb,0,0,0,0)wG[3],wH[3]=vF(wG[3],wH[3],w5,xc,0,0,0,0)wG[4],wH[4]=vF(wG[4],wH[4],w6,xd,0,0,0,0)wG[5],wH[5]=vF(wG[5],wH[5],w7,xe,0,0,0,0)wG[6],wH[6]=vF(wG[6],wH[6],w8,xf,0,0,0,0)wG[7],wH[7]=vF(wG[7],wH[7],w9,xg,0,0,0,0)wG[8],wH[8]=vF(wG[8],wH[8],w_,xh,0,0,0,0)end end end;function oe(xs,xt,xu,xv)local xw,xx=oB,ow;for xy=xu,xu+xv-1,64 do for xz=1,16 do xy=xy+4;local xA,xB,xC,xD=nf(xt,xy-3,xy)xw[xz]=nW(nY(xD,24),nY(xC,16),nY(xB,8),xA)end;local xE,xF,xG,xH=xs[1],xs[2],xs[3],xs[4]for xI=1,16,4 do xE,xH,xG,xF=xH,xG,xF,n4(n0(nX(xH,nV(xF,nX(xG,xH)))+xx[xI]+xw[xI]+xE,7)+xF)xE,xH,xG,xF=xH,xG,xF,n4(n0(nX(xH,nV(xF,nX(xG,xH)))+xx[xI+1]+xw[xI+1]+xE,12)+xF)xE,xH,xG,xF=xH,xG,xF,n4(n0(nX(xH,nV(xF,nX(xG,xH)))+xx[xI+2]+xw[xI+2]+xE,17)+xF)xE,xH,xG,xF=xH,xG,xF,n4(n0(nX(xH,nV(xF,nX(xG,xH)))+xx[xI+3]+xw[xI+3]+xE,22)+xF)end;for xJ=17,32,4 do local xK=5*xJ-4;xE,xH,xG,xF=xH,xG,xF,n4(n0(nX(xG,nV(xH,nX(xF,xG)))+xx[xJ]+xw[nV(xK,15)+1]+xE,5)+xF)xE,xH,xG,xF=xH,xG,xF,n4(n0(nX(xG,nV(xH,nX(xF,xG)))+xx[xJ+1]+xw[nV(xK+5,15)+1]+xE,9)+xF)xE,xH,xG,xF=xH,xG,xF,n4(n0(nX(xG,nV(xH,nX(xF,xG)))+xx[xJ+2]+xw[nV(xK+10,15)+1]+xE,14)+xF)xE,xH,xG,xF=xH,xG,xF,n4(n0(nX(xG,nV(xH,nX(xF,xG)))+xx[xJ+3]+xw[nV(xK-1,15)+1]+xE,20)+xF)end;for xL=33,48,4 do local xM=3*xL+2;xE,xH,xG,xF=xH,xG,xF,n4(n0(nX(xF,xG,xH)+xx[xL]+xw[nV(xM,15)+1]+xE,4)+xF)xE,xH,xG,xF=xH,xG,xF,n4(n0(nX(xF,xG,xH)+xx[xL+1]+xw[nV(xM+3,15)+1]+xE,11)+xF)xE,xH,xG,xF=xH,xG,xF,n4(n0(nX(xF,xG,xH)+xx[xL+2]+xw[nV(xM+6,15)+1]+xE,16)+xF)xE,xH,xG,xF=xH,xG,xF,n4(n0(nX(xF,xG,xH)+xx[xL+3]+xw[nV(xM-7,15)+1]+xE,23)+xF)end;for xN=49,64,4 do local xO=xN*7;xE,xH,xG,xF=xH,xG,xF,n4(n0(nX(xG,nW(xF,n3(xH)))+xx[xN]+xw[nV(xO-7,15)+1]+xE,6)+xF)xE,xH,xG,xF=xH,xG,xF,n4(n0(nX(xG,nW(xF,n3(xH)))+xx[xN+1]+xw[nV(xO,15)+1]+xE,10)+xF)xE,xH,xG,xF=xH,xG,xF,n4(n0(nX(xG,nW(xF,n3(xH)))+xx[xN+2]+xw[nV(xO+7,15)+1]+xE,15)+xF)xE,xH,xG,xF=xH,xG,xF,n4(n0(nX(xG,nW(xF,n3(xH)))+xx[xN+3]+xw[nV(xO-2,15)+1]+xE,21)+xF)end;xs[1],xs[2],xs[3],xs[4]=n4(xE+xs[1]),n4(xF+xs[2]),n4(xG+xs[3]),n4(xH+xs[4])end end;function of(xP,xQ,xR,xS)local xT=oB;for xU=xR,xR+xS-1,64 do for xV=1,16 do xU=xU+4;local xW,xX,xY,xZ=nf(xQ,xU-3,xU)xT[xV]=nW(nY(xW,24),nY(xX,16),nY(xY,8),xZ)end;for x0=17,80 do xT[x0]=n0(nX(xT[x0-3],xT[x0-8],xT[x0-14],xT[x0-16]),1)end;local x3,x4,x5,x6,x7=xP[1],xP[2],xP[3],xP[4],xP[5]for x8=1,20,5 do x7,x6,x5,x4,x3=x6,x5,n1(x4,2),x3,n4(n0(x3,5)+nX(x6,nV(x4,nX(x6,x5)))+xT[x8]+0x5A827999+x7)x7,x6,x5,x4,x3=x6,x5,n1(x4,2),x3,n4(n0(x3,5)+nX(x6,nV(x4,nX(x6,x5)))+xT[x8+1]+0x5A827999+x7)x7,x6,x5,x4,x3=x6,x5,n1(x4,2),x3,n4(n0(x3,5)+nX(x6,nV(x4,nX(x6,x5)))+xT[x8+2]+0x5A827999+x7)x7,x6,x5,x4,x3=x6,x5,n1(x4,2),x3,n4(n0(x3,5)+nX(x6,nV(x4,nX(x6,x5)))+xT[x8+3]+0x5A827999+x7)x7,x6,x5,x4,x3=x6,x5,n1(x4,2),x3,n4(n0(x3,5)+nX(x6,nV(x4,nX(x6,x5)))+xT[x8+4]+0x5A827999+x7)end;for x9=21,40,5 do x7,x6,x5,x4,x3=x6,x5,n1(x4,2),x3,n4(n0(x3,5)+nX(x4,x5,x6)+xT[x9]+0x6ED9EBA1+x7)x7,x6,x5,x4,x3=x6,x5,n1(x4,2),x3,n4(n0(x3,5)+nX(x4,x5,x6)+xT[x9+1]+0x6ED9EBA1+x7)x7,x6,x5,x4,x3=x6,x5,n1(x4,2),x3,n4(n0(x3,5)+nX(x4,x5,x6)+xT[x9+2]+0x6ED9EBA1+x7)x7,x6,x5,x4,x3=x6,x5,n1(x4,2),x3,n4(n0(x3,5)+nX(x4,x5,x6)+xT[x9+3]+0x6ED9EBA1+x7)x7,x6,x5,x4,x3=x6,x5,n1(x4,2),x3,n4(n0(x3,5)+nX(x4,x5,x6)+xT[x9+4]+0x6ED9EBA1+x7)end;for x_=41,60,5 do x7,x6,x5,x4,x3=x6,x5,n1(x4,2),x3,n4(n0(x3,5)+nX(nV(x6,nX(x4,x5)),nV(x4,x5))+xT[x_]+0x8F1BBCDC+x7)x7,x6,x5,x4,x3=x6,x5,n1(x4,2),x3,n4(n0(x3,5)+nX(nV(x6,nX(x4,x5)),nV(x4,x5))+xT[x_+1]+0x8F1BBCDC+x7)x7,x6,x5,x4,x3=x6,x5,n1(x4,2),x3,n4(n0(x3,5)+nX(nV(x6,nX(x4,x5)),nV(x4,x5))+xT[x_+2]+0x8F1BBCDC+x7)x7,x6,x5,x4,x3=x6,x5,n1(x4,2),x3,n4(n0(x3,5)+nX(nV(x6,nX(x4,x5)),nV(x4,x5))+xT[x_+3]+0x8F1BBCDC+x7)x7,x6,x5,x4,x3=x6,x5,n1(x4,2),x3,n4(n0(x3,5)+nX(nV(x6,nX(x4,x5)),nV(x4,x5))+xT[x_+4]+0x8F1BBCDC+x7)end;for ya=61,80,5 do x7,x6,x5,x4,x3=x6,x5,n1(x4,2),x3,n4(n0(x3,5)+nX(x4,x5,x6)+xT[ya]+0xCA62C1D6+x7)x7,x6,x5,x4,x3=x6,x5,n1(x4,2),x3,n4(n0(x3,5)+nX(x4,x5,x6)+xT[ya+1]+0xCA62C1D6+x7)x7,x6,x5,x4,x3=x6,x5,n1(x4,2),x3,n4(n0(x3,5)+nX(x4,x5,x6)+xT[ya+2]+0xCA62C1D6+x7)x7,x6,x5,x4,x3=x6,x5,n1(x4,2),x3,n4(n0(x3,5)+nX(x4,x5,x6)+xT[ya+3]+0xCA62C1D6+x7)x7,x6,x5,x4,x3=x6,x5,n1(x4,2),x3,n4(n0(x3,5)+nX(x4,x5,x6)+xT[ya+4]+0xCA62C1D6+x7)end;xP[1],xP[2],xP[3],xP[4],xP[5]=n4(x3+xP[1]),n4(x4+xP[2]),n4(x5+xP[3]),n4(x6+xP[4]),n4(x7+xP[5])end end;do local yb,yc={},{}local function yd(ye,yf,yg,yh,yi,yj)local yk=oB;local yl,ym,yn,yo=yb[ye],yb[yf],yb[yg],yb[yh]local yp,yq,yr,ys=yc[ye],yc[yf],yc[yg],yc[yh]local yt=yk[2*yi-1]+yl%2^32+ym%2^32;yl=n4(yt)yp=n4(yk[2*yi]+yp+yq+no(yt/2^32))yo,ys=nX(ys,yp),nX(yo,yl)yt=yn%2^32+yo%2^32;yn=n4(yt)yr=n4(yr+ys+no(yt/2^32))ym,yq=nX(ym,yn),nX(yq,yr)ym,yq=nX(nZ(ym,24),nY(yq,8)),nX(nZ(yq,24),nY(ym,8))yt=yk[2*yj-1]+yl%2^32+ym%2^32;yl=n4(yt)yp=n4(yk[2*yj]+yp+yq+no(yt/2^32))yo,ys=nX(yo,yl),nX(ys,yp)yo,ys=nX(nZ(yo,16),nY(ys,16)),nX(nZ(ys,16),nY(yo,16))yt=yn%2^32+yo%2^32;yn=n4(yt)yr=n4(yr+ys+no(yt/2^32))ym,yq=nX(ym,yn),nX(yq,yr)ym,yq=nX(nY(ym,1),nZ(yq,31)),nX(nY(yq,1),nZ(ym,31))yb[ye],yb[yf],yb[yg],yb[yh]=yl,ym,yn,yo;yc[ye],yc[yf],yc[yg],yc[yh]=yp,yq,yr,ys end;function oi(yu,yv,yw,yx,yy,yz,yA,yB)local yC=oB;local yD,yE,yF,yG,yH,yI,yJ,yK=yu[1],yu[2],yu[3],yu[4],yu[5],yu[6],yu[7],yu[8]local yL,yM,yN,yO,yP,yQ,yR,yS=yv[1],yv[2],yv[3],yv[4],yv[5],yv[6],yv[7],yv[8]for yT=yx,yx+yy-1,128 do if yw then for yU=1,32 do yT=yT+4;local yV,yW,yX,yY=nf(yw,yT-3,yT)yC[yU]=yY*2^24+nW(nY(yX,16),nY(yW,8),yV)end end;yb[0x0],yb[0x1],yb[0x2],yb[0x3],yb[0x4],yb[0x5],yb[0x6],yb[0x7]=yD,yE,yF,yG,yH,yI,yJ,yK;yb[0x8],yb[0x9],yb[0xA],yb[0xB],yb[0xC],yb[0xD],yb[0xE],yb[0xF]=oo[1],oo[2],oo[3],oo[4],oo[5],oo[6],oo[7],oo[8]yc[0x0],yc[0x1],yc[0x2],yc[0x3],yc[0x4],yc[0x5],yc[0x6],yc[0x7]=yL,yM,yN,yO,yP,yQ,yR,yS;yc[0x8],yc[0x9],yc[0xA],yc[0xB],yc[0xC],yc[0xD],yc[0xE],yc[0xF]=op[1],op[2],op[3],op[4],op[5],op[6],op[7],op[8]yz=yz+(yA or 128)local yZ=yz%2^32;local y3=no(yz/2^32)yb[0xC]=nX(yb[0xC],yZ)yc[0xC]=nX(yc[0xC],y3)if yA then yb[0xE]=n3(yb[0xE])yc[0xE]=n3(yc[0xE])end;if yB then yb[0xF]=n3(yb[0xF])yc[0xF]=n3(yc[0xF])end;for y4=1,12 do local y5=oI[y4]yd(0,4,8,12,y5[1],y5[2])yd(1,5,9,13,y5[3],y5[4])yd(2,6,10,14,y5[5],y5[6])yd(3,7,11,15,y5[7],y5[8])yd(0,5,10,15,y5[9],y5[10])yd(1,6,11,12,y5[11],y5[12])yd(2,7,8,13,y5[13],y5[14])yd(3,4,9,14,y5[15],y5[16])end;yD=nX(yD,yb[0x0],yb[0x8])yE=nX(yE,yb[0x1],yb[0x9])yF=nX(yF,yb[0x2],yb[0xA])yG=nX(yG,yb[0x3],yb[0xB])yH=nX(yH,yb[0x4],yb[0xC])yI=nX(yI,yb[0x5],yb[0xD])yJ=nX(yJ,yb[0x6],yb[0xE])yK=nX(yK,yb[0x7],yb[0xF])yL=nX(yL,yc[0x0],yc[0x8])yM=nX(yM,yc[0x1],yc[0x9])yN=nX(yN,yc[0x2],yc[0xA])yO=nX(yO,yc[0x3],yc[0xB])yP=nX(yP,yc[0x4],yc[0xC])yQ=nX(yQ,yc[0x5],yc[0xD])yR=nX(yR,yc[0x6],yc[0xE])yS=nX(yS,yc[0x7],yc[0xF])end;yu[1],yu[2],yu[3],yu[4],yu[5],yu[6],yu[7],yu[8]=yD%2^32,yE%2^32,yF%2^32,yG%2^32,yH%2^32,yI%2^32,yJ%2^32,yK%2^32;yv[1],yv[2],yv[3],yv[4],yv[5],yv[6],yv[7],yv[8]=yL%2^32,yM%2^32,yN%2^32,yO%2^32,yP%2^32,yQ%2^32,yR%2^32,yS%2^32;return yz end end end;if nU=="FFI"or nU=="LJ"then do local y6=oD;local y7=oE;local function y8(y9,y_,za,zb,zc,zd)local ze,zf,zg,zh=y7[y9],y7[y_],y7[za],y7[zb]ze=n4(y6[zc]+ze+zf)zh=n1(nX(zh,ze),16)zg=n4(zg+zh)zf=n1(nX(zf,zg),12)ze=n4(y6[zd]+ze+zf)zh=n1(nX(zh,ze),8)zg=n4(zg+zh)zf=n1(nX(zf,zg),7)y7[y9],y7[y_],y7[za],y7[zb]=ze,zf,zg,zh end;function oh(zi,zj,zk,zl,zm,zn,zo)local zp,zq,zr,zs,zt,zu,zv,zw=n4(zi[1]),n4(zi[2]),n4(zi[3]),n4(zi[4]),n4(zi[5]),n4(zi[6]),n4(zi[7]),n4(zi[8])for zx=zk,zk+zl-1,64 do if zj then for zy=1,16 do zx=zx+4;local zz,zA,zB,zC=nf(zj,zx-3,zx)y6[zy]=nW(nY(zC,24),nY(zB,16),nY(zA,8),zz)end end;y7[0x0],y7[0x1],y7[0x2],y7[0x3],y7[0x4],y7[0x5],y7[0x6],y7[0x7]=zp,zq,zr,zs,zt,zu,zv,zw;y7[0x8],y7[0x9],y7[0xA],y7[0xB],y7[0xE],y7[0xF]=n4(op[1]),n4(op[2]),n4(op[3]),n4(op[4]),n4(op[7]),n4(op[8])zm=zm+(zn or 64)local zD=zm%2^32;local zE=no(zm/2^32)y7[0xC]=nX(op[5],zD)y7[0xD]=nX(op[6],zE)if zn then y7[0xE]=n3(y7[0xE])end;if zo then y7[0xF]=n3(y7[0xF])end;for zF=1,10 do local zG=oI[zF]y8(0,4,8,12,zG[1],zG[2])y8(1,5,9,13,zG[3],zG[4])y8(2,6,10,14,zG[5],zG[6])y8(3,7,11,15,zG[7],zG[8])y8(0,5,10,15,zG[9],zG[10])y8(1,6,11,12,zG[11],zG[12])y8(2,7,8,13,zG[13],zG[14])y8(3,4,9,14,zG[15],zG[16])end;zp=nX(zp,y7[0x0],y7[0x8])zq=nX(zq,y7[0x1],y7[0x9])zr=nX(zr,y7[0x2],y7[0xA])zs=nX(zs,y7[0x3],y7[0xB])zt=nX(zt,y7[0x4],y7[0xC])zu=nX(zu,y7[0x5],y7[0xD])zv=nX(zv,y7[0x6],y7[0xE])zw=nX(zw,y7[0x7],y7[0xF])end;zi[1],zi[2],zi[3],zi[4],zi[5],zi[6],zi[7],zi[8]=zp,zq,zr,zs,zt,zu,zv,zw;return zm end;function oj(zH,zI,zJ,zK,zL,zM,zN,zO,zP)zP=zP or 64;local zQ,zR,zS,zT,zU,zV,zW,zX=n4(zM[1]),n4(zM[2]),n4(zM[3]),n4(zM[4]),n4(zM[5]),n4(zM[6]),n4(zM[7]),n4(zM[8])zN=zN or zM;for zY=zI,zI+zJ-1,64 do if zH then for zZ=1,16 do zY=zY+4;local z0,z1,z2,z3=nf(zH,zY-3,zY)y6[zZ]=nW(nY(z3,24),nY(z2,16),nY(z1,8),z0)end end;y7[0x0],y7[0x1],y7[0x2],y7[0x3],y7[0x4],y7[0x5],y7[0x6],y7[0x7]=zQ,zR,zS,zT,zU,zV,zW,zX;y7[0x8],y7[0x9],y7[0xA],y7[0xB]=n4(op[1]),n4(op[2]),n4(op[3]),n4(op[4])y7[0xC]=n4(zL%2^32)y7[0xD]=no(zL/2^32)y7[0xE],y7[0xF]=zP,zK;for z4=1,7 do y8(0,4,8,12,oJ[z4],oJ[z4+14])y8(1,5,9,13,oJ[z4+1],oJ[z4+2])y8(2,6,10,14,oJ[z4+16],oJ[z4+7])y8(3,7,11,15,oJ[z4+15],oJ[z4+17])y8(0,5,10,15,oJ[z4+21],oJ[z4+5])y8(1,6,11,12,oJ[z4+3],oJ[z4+6])y8(2,7,8,13,oJ[z4+4],oJ[z4+18])y8(3,4,9,14,oJ[z4+19],oJ[z4+20])end;if zO then zN[9]=nX(zQ,y7[0x8])zN[10]=nX(zR,y7[0x9])zN[11]=nX(zS,y7[0xA])zN[12]=nX(zT,y7[0xB])zN[13]=nX(zU,y7[0xC])zN[14]=nX(zV,y7[0xD])zN[15]=nX(zW,y7[0xE])zN[16]=nX(zX,y7[0xF])end;zQ=nX(y7[0x0],y7[0x8])zR=nX(y7[0x1],y7[0x9])zS=nX(y7[0x2],y7[0xA])zT=nX(y7[0x3],y7[0xB])zU=nX(y7[0x4],y7[0xC])zV=nX(y7[0x5],y7[0xD])zW=nX(y7[0x6],y7[0xE])zX=nX(y7[0x7],y7[0xF])end;zN[1],zN[2],zN[3],zN[4],zN[5],zN[6],zN[7],zN[8]=zQ,zR,zS,zT,zU,zV,zW,zX end end end;do local function z5(z6,z7,z8,z9)local z_,Aa,Ab,Ac={},0.0,0.0,1.0;for Ad=1,z9 do for Ae=nr(1,Ad+1-#z7),nq(Ad,#z6)do Aa=Aa+z8*z6[Ae]*z7[Ad+1-Ae]end;local Af=Aa%2^24;z_[Ad]=no(Af)Aa=(Aa-Af)/2^24;Ab=Ab+Af*Ac;Ac=Ac*2^24 end;return z_,Ab end;local Ag,Ah,Ai,Aj,Ak,Al=0,{4,1,2,-2,2},4,{1},op,oo;repeat Ai=Ai+Ah[Ai%6]local Am=1;repeat Am=Am+Ah[Am%6]if Am*Am>Ai then local An=Ai^(1/3)local Ao=An*2^40;Ao=z5({Ao-Ao%1},Aj,1.0,2)local Ap,Aq=z5(Ao,z5(Ao,Ao,1.0,4),-1.0,4)local Ar=Ao[2]%65536*65536+no(Ao[1]/256)local As=Ao[1]%256*16777216+no(Aq*2^-56/3*An/Ai)if Ag<16 then An=Ai^(1/2)Ao=An*2^40;Ao=z5({Ao-Ao%1},Aj,1.0,2)Ap,Aq=z5(Ao,Ao,-1.0,2)local At=Ao[2]%65536*65536+no(Ao[1]/256)local Au=Ao[1]%256*16777216+no(Aq*2^-17/An)local Av=Ag%8+1;ot[224][Av]=Au;Ak[Av],Al[Av]=At,Au+At*oG;if Av>7 then Ak,Al=ov[384],ou[384]end end;Ag=Ag+1;om[Ag],ol[Ag]=Ar,As%oF+Ar*oG;break end until Ai%Am==0 until Ag>79 end;for Aw=224,256,32 do local Ax,Ay={}if oz then for Az=1,8 do Ax[Az]=n9(oo[Az])end else Ay={}for AA=1,8 do Ax[AA]=n9(oo[AA])Ay[AA]=n9(op[AA])end end;od(Ax,Ay,"SHA-512/"..tostring(Aw).."\128"..ni("\0",115).."\88",0,128)ou[Aw]=Ax;ov[Aw]=Ay end;do local AB,AC,AD=math.sin,math.abs,math.modf;for AE=1,64 do local AF,AG=AD(AC(AB(AE))*2^16)ow[AE]=AF*65536+no(AG*2^16)end end;do local AH=29;local function AI()local AJ=AH%2;AH=n6((AH-AJ)/2,142*AJ)return AJ end;for AK=1,24 do local AL,AM=0;for AN=1,6 do AM=AM and AM*AM*2 or 1;AL=AL+AI()*AM end;local AO=AI()*AM;os[AK],oq[AK]=AO,AL+AO*oH end end;if nU=="FFI"then om=nM.new("uint32_t[?]",#om+1,0,nd(om))ol=nM.new("int64_t[?]",#ol+1,0,nd(ol))if oH==0 then oq=nM.new("uint32_t[?]",#oq+1,0,nd(oq))os=nM.new("uint32_t[?]",#os+1,0,nd(os))else oq=nM.new("int64_t[?]",#oq+1,0,nd(oq))end end;local function AP(AQ,AR)local AS,AT,AU={nd(ot[AQ])},0.0,""local function AV(AW)if AW then if AU then AT=AT+#AW;local AX=0;if AU~=""and#AU+#AW>=64 then AX=64-#AU;oc(AS,AU..nj(AW,1,AX),0,64)AU=""end;local AY=#AW-AX;local AZ=AY%64;oc(AS,AW,AX,AY-AZ)AU=AU..nj(AW,#AW+1-AZ)return AV else error("Adding more chunks is not allowed after receiving the result",2)end else if AU then local A0={AU,"\128",ni("\0",(-9-AT)%64+1)}AU=nil;AT=AT*8/256^7;for A1=4,10 do AT=AT%1*256;A0[A1]=ng(no(AT))end;A0=ne(A0)oc(AS,A0,0,#A0)local A2=AQ/32;for A3=1,A2 do AS[A3]=n5(AS[A3])end;AS=ne(AS,"",1,A2)end;return AS end end;if AR then return AV(AR)()else return AV end end;local function A4(A5,A6)local A7,A8,A9,A_=0.0,"",{nd(ou[A5])},not oz and{nd(ov[A5])}local function Ba(Bb)if Bb then if A8 then A7=A7+#Bb;local Bc=0;if A8~=""and#A8+#Bb>=128 then Bc=128-#A8;od(A9,A_,A8..nj(Bb,1,Bc),0,128)A8=""end;local Bd=#Bb-Bc;local Be=Bd%128;od(A9,A_,Bb,Bc,Bd-Be)A8=A8..nj(Bb,#Bb+1-Be)return Ba else error("Adding more chunks is not allowed after receiving the result",2)end else if A8 then local Bf={A8,"\128",ni("\0",(-17-A7)%128+9)}A8=nil;A7=A7*8/256^7;for Bg=4,10 do A7=A7%1*256;Bf[Bg]=ng(no(A7))end;Bf=ne(Bf)od(A9,A_,Bf,0,#Bf)local Bh=np(A5/64)if oz then for Bi=1,Bh do A9[Bi]=oz(A9[Bi])end else for Bj=1,Bh do A9[Bj]=n5(A_[Bj])..n5(A9[Bj])end;A_=nil end;A9=nj(ne(A9,"",1,Bh),1,A5/4)end;return A9 end end;if A6 then return Ba(A6)()else return Ba end end;local Bk,Bl,Bm,Bn;do function Bk(Bo)return nk(Bo,"%x%x",function(Bp)return ng(ns(Bp,16))end)end;function Bl(Bq)return nk(Bq,".",function(Br)return nn("%02x",nf(Br))end)end;local Bs={['+']=62,['-']=62,[62]='+',['/']=63,['_']=63,[63]='/',['=']=-1,['.']=-1,[-1]='='}local Bt=0;for Bu,Bv in ipairs{'AZ','az','09'}do for Bw=nf(Bv),nf(Bv,2)do local Bx=ng(Bw)Bs[Bx]=Bt;Bs[Bt]=Bx;Bt=Bt+1 end end;function Bm(By)local Bz={}for BA=1,#By,3 do local BB,BC,BD,BE=nf(nj(By,BA,BA+2)..'\0',1,-1)Bz[#Bz+1]=Bs[no(BB/4)]..Bs[BB%4*16+no(BC/16)]..Bs[BD and BC%16*4+no(BD/64)or-1]..Bs[BE and BD%64 or-1]end;return ne(Bz)end;function Bn(BF)local BG,BH={},3;for BI,BJ in nl(nk(BF,'%s+',''),'()(.)')do local BK=Bs[BJ]if BK<0 then BH=BH-1;BK=0 end;local BL=BI%4;if BL>0 then BG[-BL]=BK else local BM=BG[-1]*4+no(BG[-2]/16)local BN=BG[-2]%16*16+no(BG[-3]/4)local BO=BG[-3]%4*64+BK;BG[#BG+1]=nj(ng(BM,BN,BO),1,BH)end end;return ne(BG)end end;local BP;local function BQ(BR,BS,BT)return nk(BR,".",function(BU)return ng(n6(nf(BU),BT))end)..ni(ng(BT),BS-#BR)end;local function BV(BW,BX,BY)local BZ=BP[BW]if not BZ then error("Unknown hash function",2)end;if#BX>BZ then BX=Bk(BW(BX))end;local B0=BW()(BQ(BX,BZ,0x36))local B1;local function B2(B3)if not B3 then B1=B1 or BW(BQ(BX,BZ,0x5C)..Bk(B0()))return B1 elseif B1 then error("Adding more chunks is not allowed after receiving the result",2)else B0(B3)return B2 end end;if BY then return B2(BY)()else return B2 end end;local B_={sha224=function(B4)return AP(224,B4)end,sha256=function(B5)return AP(256,B5)end,sha512_224=function(B6)return A4(224,B6)end,sha512_256=function(B7)return A4(256,B7)end,sha384=function(B8)return A4(384,B8)end,sha512=function(B9)return A4(512,B9)end,hmac=BV,hex_to_bin=Bk,bin_to_hex=Bl,base64_to_bin=Bn,bin_to_base64=Bm,hex2bin=Bk,bin2hex=Bl,base642bin=Bn,bin2base64=Bm}BP={[B_.sha224]=64,[B_.sha256]=64,[B_.sha512_224]=128,[B_.sha512_256]=128,[B_.sha384]=128,[B_.sha512]=128}return B_
end)()

dZ('sha2 ok')

local Cb
local Cd

local Ce = {
    file = file ~= nil and (file.Open ~= nil or file.Write ~= nil),
    warned = false,
    log_on = false,
    auth = "hvhgg_prime_auth.txt",
    ui = "hvhgg_prime_ui.txt",
    log = "hvhgg_prime_log.txt",
}

function Ce.put(Cf, Ch, Ci)
    if not Ce.file then return false, 'file api unavailable' end

    local Cj = 'no writer'
    if file.Open ~= nil then
        local Ck, Cl = pcall(file.Open, Cf, Ci)
        if not Ck then
            Cj = tostring(Cl)
        elseif Cl == nil then
            Cj = 'file.Open returned nil'
        else
            local Cm, Cn = pcall(Cl.Write, Cl, Ch)
            pcall(Cl.Close, Cl)
            if Cm then return true end
            Cj = tostring(Cn)
        end
    end

    if Ci ~= 'a' and file.Write ~= nil then
        local Co, Cq = pcall(file.Write, Cf, Ch)
        if Co then return true end
        Cj = tostring(Cq)
    end

    return false, Cj
end

function Ce.get(Cr)
    if not Ce.file then return nil end

    if file.Read ~= nil then
        local Ct, Cu = pcall(file.Read, Cr)
        if Ct and type(Cu) == "string" and #Cu > 0 then return Cu end
    end

    if file.Open == nil then return nil end
    local Cv, Cw = pcall(file.Open, Cr, 'r')
    if not Cv or Cw == nil then return nil end
    local Cx, Cy = pcall(Cw.Read, Cw)
    pcall(Cw.Close, Cw)
    if Cx and type(Cy) == "string" and #Cy > 0 then return Cy end
    return nil
end

function Ce.read(Cz)
    local CA = Ce.get(Cz)
    if CA == nil then return nil end
    local CB, CC = pcall(iH.parse, CA)
    if not CB or type(CC) ~= "table" then return nil end
    return CC
end

function Ce.write(CD, CE)
    local CF, CG = pcall(iH.stringify, CE)
    if not CF or type(CG) ~= "string" then
        return Cb('[HvH.gg Prime] db: encode failed (' .. CD .. ') ' .. tostring(CG))
    end

    local CI, CJ = Ce.put(CD, CG, 'w')
    if CI then
        Ce.warned = false
        return
    end

    if Ce.warned then return end
    Ce.warned = true
    Cb('[HvH.gg Prime] db: save failed (' .. CD .. ') ' .. tostring(CJ))
    if Cd ~= nil then Cd('Save failed: ' .. tostring(CJ), 'error') end
end

Cb = function(CK)
    CK = tostring(CK)
    print(CK)
    if Ce.log_on then Ce.put(Ce.log, CK .. '\r\n', 'a') end
end

if dY and Ce.file then
    local CL, CM = Ce.put(Ce.log, '===== load =====\r\n', 'a')
    Ce.log_on = CL
    if not CL then print('[HvH.gg Prime] db: log file off (' .. tostring(CM) .. ')') end
end

Cb('[HvH.gg Prime] load: begin  file=' .. tostring(Ce.file) .. ' log=' .. tostring(Ce.log_on))

local CN = "48 83 EC 28 4C 8B 0D ?? ?? ?? ?? 4C 8D 05 ?? ?? ?? ?? BA ?? ?? ?? ?? 48 8D 0D ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 48 8D 05 ?? ?? ?? ?? 48 83 C4 28 C3"

local CO = mem.FindPattern('client.dll', CN)
if CO == nil then
    return error('[HvH.gg Prime] xuid signature not found in client.dll')
end

local CP = ffi.string(ffi.cast("char* (__fastcall*) ()", ffi.cast('void*', CO))())
if type(CP) ~= 'string' or #CP == 0 then
    return error('[HvH.gg Prime] xuid came back empty')
end

Cb('[HvH.gg Prime] load: xuid ok')

local CQ = "https://api.mmhvh.com/v2/lua/"
local CR = "https://mmhvh.com"

local CS = "https://shared-api.mmhvh.com/"

local CT = "AIMWARE"
local CU = "1.0.0"

local CV = "https://github.com/mmhvh/aimware-cs2-lua/blob/main/mmhvh_prime.lua"

local CW = "Mozilla/5.0 CHEAT_" .. CT
local CX = "https://mmhvh.com/"

if dY then Cb('[HvH.gg Prime] debug: ON  api=' .. CQ) end

local CY = iI.clipboard_set

local CZ = { lang = 2, no_cjk = false }

CZ.s = {
    ['Cannot reach the HvH.gg Prime'] = '无法连接到 HvH.gg Prime',
    ['API server error %d (empty response)'] = 'API 服务器错误 %d (响应为空)',
    ['API server returned a bad response (%s)'] = 'API 服务器返回了无效响应 (%s)',
    ['HTTP request failed: '] = 'HTTP 请求发送失败：',
    ['Session expired, please log in again'] = '会话已过期，请重新登录',
    ['Unknown error'] = '未知错误',
    ['Unexpected situation'] = '出现异常，请稍后重试',

    ['Could not read your AIMWARE username'] = '无法读取 AIMWARE 用户名',
    ['Failed to start login'] = '发起登录失败',
    ['Confirm the login in your browser (link copied)'] = '请在浏览器中确认登录 (链接已复制)',
    ['Login link copied to clipboard'] = '登录链接已复制到剪贴板',
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
    ['Asia'] = '亚洲',
    ['US'] = '美国',
    ['Europe'] = '欧洲',
    ['Shanghai'] = '上海',
    ['Beijing'] = '北京',
    ['Shenzhen'] = '深圳',
    ['Hong Kong'] = '香港',
    ['Singapore'] = '新加坡',
    ['US West'] = '美国西部',
    ['US East'] = '美国东部',
    ['Frankfurt'] = '法兰克福',
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
    ['Copy link'] = '复制链接',
    ['Link this Steam'] = '绑定当前 Steam',
    ['Loading...'] = '加载中...',

    ['Confirm this login in your browser. The link is already in your clipboard.'] =
        '请在浏览器中确认本次登录，链接已复制到剪贴板。',
    ['Sign in with your mmhvh.com account to start matchmaking. Your browser will open for confirmation.'] =
        '使用 mmhvh.com 账号登录后即可开始匹配，浏览器会自动打开等待确认。',
    ['Loading your profile...'] = '正在加载账号信息...',
    ['You are in a lobby hosted by someone else. The host controls the queue.'] =
        '你正在别人创建的大厅里，由房主控制匹配。',
    ['Ready.'] = '就绪。',
    ['Script v%s is outdated, latest is v%s. Please update.'] = '脚本版本 v%s 过旧，最新版本 v%s，请更新。',
    ['Download update'] = '前往下载新版',
    ['Opened the download page (link copied)'] = '已打开下载页面（链接已复制）',
    ['Could not open your browser, copy the link above'] = '打不开浏览器，请手动复制上面的链接',

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

local function C0(C1)
    if CZ.lang ~= 2 or CZ.no_cjk then return C1 end
    local C2 = CZ.s[C1]
    if C2 == nil then return C1 end
    return C2
end

local C3 = {
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

local function C4(C5)
    if type(C5) ~= 'string' or #C5 == 0 then return '' end
    local C6 = C3[C5]
    if C6 == nil then return C5 end
    if CZ.lang == 2 and not CZ.no_cjk then return C6[2] end
    return C6[1]
end

local C7 = {
    C5v5 = { '5v5 Full Map', '5v5 全图' },
    C3v3 = { '3v3 Full Map', '3v3 全图' },
    C2v2 = { '2v2 Full Map', '2v2 全图' },
    C1v1 = { '1v1 Full Map', '1v1 全图' },
    W3v3 = { '3v3 Wingman',  '3v3 搭档' },
    W2v2 = { '2v2 Wingman',  '2v2 搭档' },
    W1v1 = { '1v1 Wingman',  '1v1 搭档' },
}

local C8 = {
    { name = "CN_SHANGHAI",    label = "Shanghai",  group = "CN",   ping_url = "http://oss-cn-shanghai.aliyuncs.com" },
    { name = "CN_BEIJING",     label = "Beijing",   group = "CN",   ping_url = "http://oss-cn-beijing.aliyuncs.com" },
    { name = "CN_SHENZHEN",    label = "Shenzhen",  group = "CN",   ping_url = "http://oss-cn-shenzhen.aliyuncs.com" },
    { name = "CN_HONGKONG",    label = "Hong Kong", group = "ASIA", ping_url = "http://oss-cn-hongkong.aliyuncs.com" },
    { name = "AP_SOUTHEAST_1", label = "Singapore", group = "ASIA", ping_url = "http://oss-ap-southeast-1.aliyuncs.com" },
    { name = "US_WEST_1",      label = "US West",   group = "US",   ping_url = "http://oss-us-west-1.aliyuncs.com" },
    { name = "US_EAST_1",      label = "US East",   group = "US",   ping_url = "http://oss-us-east-1.aliyuncs.com" },
    { name = "EU_CENTRAL_1",   label = "Frankfurt", group = "EU",   ping_url = "http://oss-eu-central-1.aliyuncs.com" },
}

local function C9()
    if globals == nil or globals.RealTime == nil then return 0 end
    local C_, Da = pcall(globals.RealTime)
    if not C_ or type(Da) ~= 'number' then return 0 end
    return Da
end

local Db = {
    timeout = 10000,
    started = false,
    done = false,
    deadline = 0,
}

for Dc, Dd in ipairs(C8) do
    Dd.latency = Db.timeout
    Dd.pinging = false
end

local function De()
    if Db.done then return end
    Db.done = true
    table.sort(C8, function(Df, Dg) return Df.latency < Dg.latency end)
    Cb("----------HvH.gg Prime HTTP Time-----------")
    for Dh, Di in ipairs(C8) do
        Cb(("%d. %s: %.0f ms"):format(Dh, Di.name, Di.latency))
    end
end

local function Dj()
    if Db.started then return end
    Db.started = true
    Db.deadline = C9() + 15

    for Dk, Dl in ipairs(C8) do
        Dl.pinging = true
        Dl.ping_start_time = C9()
        nb.get(Dl.ping_url, {}, function(Dm, Dn)
            Dl.pinging = false
            if Dm and Dn.body ~= nil then
                Dl.latency = (C9() - Dl.ping_start_time) * 1000 * 0.8
            end
            for Do, Dp in ipairs(C8) do
                if Dp.pinging then return end
            end
            De()
        end)
    end
end

local function Dq()
    if Db.done or not Db.started then return end
    if C9() >= Db.deadline then De() end
end

local function Dr()
    if cheat == nil or cheat.GetUserName == nil then return nil end
    local Ds, Dt = pcall(cheat.GetUserName)
    if not Ds or type(Dt) ~= "string" or #Dt == 0 then return nil end
    return Dt
end

local function Du()
    local Dv = Dr()
    if Dv == nil then return nil end
    local Dw = tostring(iI.get_unix_time())
    local Dx = Ca.hmac(Ca.sha256, "SteamAPI_RegisterCallResult[1]", Dv .. Dw)
    return Dv .. "." .. Dw .. "." .. Dx
end

local function Dy(Dz)
    local DA = Dz or {}
    local DB = math.floor(iI.get_unix_time())
    DA.xuid = CP
    DA.xuidTime = DB
    DA.xuidSig = Ca.hmac(Ca.sha256, "ValidateAuthTicketResponse_t[1]", CP .. "." .. DB)
    return DA
end

local DC = {
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

function DC.blocked()
    return DC.outdated or not DC.checked
end

local function DD(DE)
    for DF, DG in ipairs(DC.modes) do
        if DG.id == DE then return DG end
    end
    return nil
end

local DH = {
    { id = "AUTO", label = "Auto" },
    { id = "CN",   label = "China" },
    { id = "ASIA", label = "Asia" },
    { id = "US",   label = "US" },
    { id = "EU",   label = "Europe" },
}

local DI = {
    mode = nil,
    region = 1,
    lang = CZ.lang,
    rules = false,
    x = 60,
    y = 170,
    c_maps = {},
    w_maps = {},
    c_saved = {},
    w_saved = {},
}

local function DJ()
    local function DK(DL)
        local DM = {}
        if type(DL) ~= "table" then return DM end
        for DN, DO in ipairs(DL) do
            if type(DO) == "string" and #DO > 0 then DM[#DM + 1] = DO end
        end
        return DM
    end

    local DP = Ce.read(Ce.ui)
    if DP == nil then return end

    if type(DP.mode) == "string" and #DP.mode > 0 then DI.mode = DP.mode end
    local DQ = tonumber(DP.region)
    if DQ ~= nil and DQ >= 1 and DQ <= #DH then DI.region = math.floor(DQ) end
    DQ = tonumber(DP.lang)
    if DQ == 1 or DQ == 2 then DI.lang = math.floor(DQ) end
    if type(DP.rules) == "boolean" then DI.rules = DP.rules end
    DQ = tonumber(DP.x)
    if DQ ~= nil then DI.x = DQ end
    DQ = tonumber(DP.y)
    if DQ ~= nil then DI.y = DQ end

    DI.c_saved = DK(DP.c)
    DI.w_saved = DK(DP.w)
end

local function DR()
    local function DS(DT, DU)
        local DV = {}
        for DW, DX in ipairs(DU) do
            if DT[DX] then DV[#DV + 1] = DX end
        end
        return DV
    end

    Ce.write(Ce.ui, {
        mode = DI.mode or "",
        region = DI.region,
        lang = DI.lang,
        rules = DI.rules,
        x = math.floor(DI.x),
        y = math.floor(DI.y),
        c = DC.ready and DS(DI.c_maps, DC.pools.c.maps) or DI.c_saved,
        w = DC.ready and DS(DI.w_maps, DC.pools.w.maps) or DI.w_saved,
    })
end

local function DY()
    if DI.mode ~= nil then return DI.mode end
    local DZ = DC.modes[1]
    if DZ ~= nil then return DZ.id end
    return nil
end

local function D0()
    local D1 = DD(DY())
    return D1 ~= nil and D1.wingman == true
end

local function D2()
    local D3 = DD(DY())
    return D3 ~= nil and type(D3.settings) == 'table' and D3.settings.voteMode == true
end

local function D4()
    if D0() then return "w" end
    return "c"
end

local function D5()
    return DC.pools[D4()].maps
end

local function D6()
    if D4() == "w" then return DI.w_maps end
    return DI.c_maps
end

local function D7()
    local D8, D9 = D5(), D6()
    local D_ = D2()
    local Ea = {}
    for Eb, Ec in ipairs(D8) do
        if D_ or D9[Ec] then Ea[#Ea + 1] = Ec end
    end
    return Ea
end

local function Ed()
    local Ee, Ef = D5(), D6()
    if D2() then return #Ee end
    local Eg = 0
    for Eh = 1, #Ee do
        if Ef[Ee[Eh]] then Eg = Eg + 1 end
    end
    return Eg
end

local function Ei()
    return DC.pools[D4()].min
end

local function Ej(Ek)
    local El = C7[Ek]
    if El ~= nil then
        if CZ.lang == 2 and not CZ.no_cjk then return El[2] end
        return El[1]
    end
    local Em = DD(Ek)
    if Em ~= nil then return Em.label end
    return Ek or ""
end

local function En(Eo, Ep, Eq)
    local Er = {}
    for Es, Et in ipairs(Eq) do Er[Et] = true end
    local Eu = false
    for Ev, Ew in ipairs(Ep) do
        if Er[Ew] then Eu = true end
    end
    for Ex, Ey in ipairs(Ep) do
        Eo[Ey] = (not Eu) or (Er[Ey] == true)
    end
end

local Ez = "CS2"

local function EA(EB)
    if type(EB) ~= "table" then return false end
    local EC = EB.games
    if type(EC) ~= "table" then return false end
    local ED = EC[Ez]
    if type(ED) ~= "table" then return false end

    local EE, EF, EG = ED.modes, ED.competitive, ED.wingman
    if type(EE) ~= "table" or #EE == 0 then return false end
    if type(EF) ~= "table" or type(EF.maps) ~= "table" or #EF.maps == 0 then return false end
    if type(EG) ~= "table" or type(EG.maps) ~= "table" or #EG.maps == 0 then return false end

    local EH = {}
    for EI, EJ in ipairs(EE) do
        if type(EJ) == "table" and type(EJ.id) == "string" then
            EH[#EH + 1] = {
                id = EJ.id,
                label = EJ.label or EJ.id,
                wingman = EJ.wingman == true,
                settings = (type(EJ.settings) == "table") and EJ.settings or nil,
            }
        end
    end
    if #EH == 0 then return false end

    DC.modes = EH
    DC.pools.c = { min = EF.minMaps or 0, maps = EF.maps }
    DC.pools.w = { min = EG.minMaps or 0, maps = EG.maps }

    if DI.mode == nil or DD(DI.mode) == nil then
        DI.mode = DC.modes[1].id
    end

    En(DI.c_maps, DC.pools.c.maps, DI.c_saved)
    En(DI.w_maps, DC.pools.w.maps, DI.w_saved)

    local EK = EB.clientVersions
    DC.latest = (type(EK) == "table" and type(EK[CT]) == "string") and EK[CT] or nil
    DC.outdated = DC.latest ~= nil and DC.latest ~= CU

    DC.ready = true
    return true
end

local function EL()
    local EM = (DH[DI.region] or DH[1]).id
    local EN = {}
    for EO, EP in ipairs(C8) do
        if EM == "AUTO" or EP.group == EM then EN[#EN + 1] = EP end
    end
    if #EN == 0 then
        for EQ, ER in ipairs(C8) do EN[#EN + 1] = ER end
    end
    return EN
end

local function ES()
    local ET = {}
    for EU, EV in ipairs(EL()) do ET[#ET + 1] = EV.name end
    return ET
end

local function EW()
    return table.concat(ES(), ",")
end

local function EX()
    if Db.sum_key == DI.region and Db.sum_done == Db.done
        and Db.sum_lang == CZ.lang then
        return Db.sum_n, Db.sum_text
    end

    local EY = EL()
    local EZ = {}
    for E0 = 1, #EY do EZ[E0] = C0(EY[E0].label) end

    Db.sum_key = DI.region
    Db.sum_done = Db.done
    Db.sum_lang = CZ.lang
    Db.sum_n = #EY
    Db.sum_text = table.concat(EZ, ', ')
    return Db.sum_n, Db.sum_text
end

local E1 = {}

local function E2()
    if Db.order_done == Db.done and #E1 == #DH then
        return E1
    end

    local E3 = {}
    for E4 = 1, #DH do
        local E5, E6 = DH[E4].id, nil
        for E7, E8 in ipairs(C8) do
            if E8.group == E5 and (E6 == nil or E8.latency < E6) then E6 = E8.latency end
        end
        E3[E4] = E6 or Db.timeout
        E1[E4] = E4
    end

    table.sort(E1, function(E9, E_)
        local Fa, Fb = DH[E9].id == 'AUTO', DH[E_].id == 'AUTO'
        if Fa ~= Fb then return Fa end
        if E3[E9] ~= E3[E_] then return E3[E9] < E3[E_] end
        return E9 < E_
    end)

    Db.order_done = Db.done
    return E1
end

local function Fc(Fd)
    if Fd == 1 then return C0('1 region') end
    return (C0('%d regions')):format(Fd)
end

Cb('[HvH.gg Prime] load: settings')
DJ()
CZ.lang = DI.lang

local Fe = 0
local Ff = iI.get_unix_time()

local Fg = {
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

local Fh = {
    login = false,
    queue = false,
    check = false,
    region = false,
    poll = false,
    lang = false,
    vote = false,
}

local Fi = 5
local Fj = 3
local Fk = {}

Cd = function(Fl, Fm)
    Fl = tostring(Fl)
    Cb('[HvH.gg Prime] ' .. Fl)

    local Fn = Fk[#Fk]
    if Fn ~= nil and Fn.text == Fl then
        Fn.expires = iI.get_unix_time() + Fi
        Fn.error = Fm == 'error'
        return
    end

    Fk[#Fk + 1] = {
        text = Fl,
        error = Fm == 'error',
        expires = iI.get_unix_time() + Fi,
    }
    if #Fk > Fj then table.remove(Fk, 1) end
end

local Fo
local Fp

local function Fq(Fr, Fs)
    local Ft, Fu, Fv, Fw = 'nil', 'nil', 'nil', 'nil'
    if type(Fs) == 'table' then
        Ft = tostring(Fs.status)
        Fu = tostring(Fs.status_message)
        Fv = tostring(Fs.timed_out)
        if type(Fs.body) == 'string' then Fw = tostring(#Fs.body) end
    end
    return ('ok=%s code=%s msg=%s timedOut=%s bodyLen=%s'):format(tostring(Fr), Ft, Fu, Fv, Fw)
end

local function Fx(Fy, Fz, FA)
    return pcall(nb.post, Fy, Fz, FA)
end

local function FB(FC, FD, FE, FF, FG)
    if Fg.requesting > 2 then
        if dY then
            Cb(('[HvH.gg Prime] http SKIP %s (inflight=%d)'):format(FD, Fg.requesting))
        end
        return false
    end
    if FC and Fg.login_token == nil then return false end

    local FH = FG ~= nil and FG.soft == true
    local FI = (FG ~= nil and FG.base) or CQ

    local FJ = {
        headers = { Referer = CX },
        user_agent_info = CW,
        network_timeout = 10,
        absolute_timeout = 15,
    }

    if FC then
        FJ.headers.Authorization = "Bearer " .. Fg.login_token
    end

    if Fg.accept_charset then
        FJ.headers["Accept-Charset"] = "utf-8"
    end

    if FE then FJ["json"] = FE end

    Fg.requesting = Fg.requesting + 1

    Fg.api_seq = Fg.api_seq + 1
    local FK = Fg.api_seq
    local FL = C9()

    local FM = FI .. FD

    local function FN(FO, FP)
        Fg.requesting = Fg.requesting - 1

        local FQ = nil
        if type(FP) == 'table' and type(FP.body) == 'string' then FQ = FP.body end
        local FR = nil
        if type(FP) == 'table' then FR = tonumber(FP.status) end

        local FS = (C9() - FL) * 1000

        if FO ~= true or FQ == nil then
            if FH then
                if dY then
                    Cb(('[HvH.gg Prime] http FAIL(soft) #%d %s %s took=%.0fms'):format(
                        FK, FD, Fq(FO, FP), FS))
                end
                return FF(false, nil, FR)
            end

            Fg.fail_streak = Fg.fail_streak + 1
            if dY then
                Cb(('[HvH.gg Prime] http FAIL #%d t=%d %s auth=%s %s took=%.0fms streak=%d inflight=%d'):format(
                    FK, iI.get_unix_time(), FD, tostring(FC == true),
                    Fq(FO, FP), FS, Fg.fail_streak, Fg.requesting))
            end

            local FU = C0('Cannot reach the HvH.gg Prime')
            if FR ~= nil and FR > 0 then
                FU = (C0('API server error %d (empty response)')):format(FR)
            end

            local FV = 2
            if Fg.fail_streak >= 3 then
                FV = 15
            elseif Fg.fail_streak >= 2 then
                FV = 5
            end
            if Fg.fail_streak >= 2 then
                if Fg.last_error ~= FU then Cd(FU, 'error') end
                Fg.last_error = FU
            end
            Fg.error_backoff_until = iI.get_unix_time() + FV
            return FF(false)
        end

        local FW = FR == 401
            or FQ == "Nice try bro"
            or FQ == "Login revoked"
            or FQ == "Nice try funny"
        if FW and FC then
            if dY then
                Cb(('[HvH.gg Prime] http 401 #%d %s body=%s'):format(FK, FD, string.sub(FQ, 1, 80)))
            end
            if FH then return FF(false, nil, 401) end
            if Fg.logged_in then
                Fo()
                Cd(C0('Session expired, please log in again'), 'error')
            end
            return FF(false)
        end

        local FX = iH.parse(FQ)
        if FX == nil then
            if FH then
                if dY then
                    Cb(('[HvH.gg Prime] http BADJSON(soft) #%d %s code=%s body=%s'):format(
                        FK, FD, tostring(FR), string.sub(FQ, 1, 200)))
                end
                return FF(false, nil, FR)
            end

            Fg.fail_streak = Fg.fail_streak + 1
            if dY then
                Cb(('[HvH.gg Prime] http BADJSON #%d t=%d %s %s took=%.0fms body=%s'):format(
                    FK, iI.get_unix_time(), FD, Fq(FO, FP), FS,
                    string.sub(FQ, 1, 200)))
            end
            local FY = (C0('API server returned a bad response (%s)')):format(tostring(FR))
            if Fg.last_error ~= FY then Cd(FY, 'error') end
            Fg.last_error = FY
            Fg.error_backoff_until = iI.get_unix_time() + 15
            return FF(false)
        end

        if not FH then Fg.fail_streak = 0 end
        if dY then
            Cb(('[HvH.gg Prime] http ok #%d %s code=%s took=%.0fms len=%d body=%s'):format(
                FK, FD, tostring(FR), FS, #FQ, string.sub(FQ, 1, 256)))
        end
        FF(true, FX, FR)
    end

    local FZ, F0 = Fx(FM, FJ, FN)

    if not FZ and Fg.accept_charset then
        Fg.accept_charset = false
        FJ.headers["Accept-Charset"] = nil
        Cb('[HvH.gg Prime] http: Accept-Charset rejected by steam, dropped')
        FZ, F0 = Fx(FM, FJ, FN)
    end

    if not FZ then
        Fg.requesting = Fg.requesting - 1
        Fg.fail_streak = Fg.fail_streak + 1
        Fg.error_backoff_until = iI.get_unix_time() + 15
        Cd(C0('HTTP request failed: ') .. tostring(F0), 'error')
        return false
    end

    return true
end

local function F1(F2, F3, F4, F5, F6)
    if Fh[F2] then return false end
    Fh[F2] = true
    local F9 = FB(F3, F4, F5, function(F7, F8)
        Fh[F2] = false
        F6(F7, F8)
    end)
    if not F9 then Fh[F2] = false end
    return F9
end

local function F_()
    if DC.ready or DC.fetching then return end
    DC.fetching = true

    local Gc = FB(false, "config", {}, function(Ga, Gb)
        DC.fetching = false
        DC.checked = true
        if not Ga or Gb == nil or Gb.status ~= true or not EA(Gb.data) then
            DC.retry_at = iI.get_unix_time() + 15
            return
        end
        Cb(('[HvH.gg Prime] config: %d modes, %d comp maps (min %d), %d wingman maps (min %d)'):format(
            #DC.modes, #DC.pools.c.maps, DC.pools.c.min, #DC.pools.w.maps, DC.pools.w.min))
        if DC.outdated then
            Cb(('[HvH.gg Prime] version: %s is outdated, latest is %s, stopping'):format(CU, DC.latest))
            Cd((C0('Script v%s is outdated, latest is v%s. Please update.')):format(CU, DC.latest), 'error')
            return
        end
        Dj()
        Fg.recheck = true
    end)

    if not Gc then
        DC.fetching = false
        DC.checked = true
        DC.retry_at = iI.get_unix_time() + 5
    end
end

local function Gd()
    if Fg.login_token == nil then return end
    Ce.write(Ce.auth, { token = Fg.login_token, renew = math.floor(Fg.login_renew or 0) })
end

local function Ge()
    Ce.write(Ce.auth, { token = "", renew = 0 })
end

local function Gf()
    local Gg = Ce.read(Ce.auth)
    if Gg == nil or type(Gg.token) ~= "string" or #Gg.token == 0 then return end

    local Gh = Gg.token
    local Gi = tonumber(Gg.renew) or 0

    if Gi > 0 and Gi <= iI.get_unix_time() then return end
    Fg.login_token = Gh
    Fg.login_renew = Gi
    Fg.logged_in = true
end

local Gj
local Gk

Fo = function()
    if Gj ~= nil then Gj() end
    Fg.login_token = nil
    Fg.logged_in = false
    Fg.user = nil
    Fg.login_renew = 0
    Fg.lobby = nil
    Fg.match = nil
    Fg.queueCount = nil
    Fg.sent_region_key = nil
    Fg.lang_want = nil
    Fg.lang_seen = nil
    Fg.recheck = false
    Fg.last_error = nil
    Fg.error_backoff_until = 0
    Ge()
end

local function Gl(Gm, Gn, Go)
    Fg.login_token = Gn
    Fg.logged_in = true
    Fg.user = Gm
    Fg.login_renew = Go / 1000
    Fg.login_session = nil
    Fg.login_url = nil
    Fg.last_error = nil
    Fg.error_backoff_until = 0
    Gd()
    Cd(C0('Logged in, welcome back'))
end

local Gp = { inited = false, shell = nil, winexec = nil }

local function Gq(Gr)
    if not Gp.inited then
        Gp.inited = true
        local Gs = iI.find_export('shell32.dll', 'ShellExecuteA')
        if Gs ~= nil then
            Gp.shell = ffi.cast('unsigned long long(__stdcall*)(void*, const char*, const char*, const char*, const char*, int)', Gs)
        end
        local Gt = iI.find_export('kernel32.dll', 'WinExec')
        if Gt ~= nil then
            Gp.winexec = ffi.cast('unsigned int(__stdcall*)(const char*, unsigned int)', Gt)
        end
    end
    Gr = (Gr:gsub('"', ''))
    if Gp.shell ~= nil then
        local Gu, Gv = pcall(Gp.shell, nil, 'open', Gr, nil, nil, 1)
        if Gu and (tonumber(Gv) or 0) > 32 then return true end
    end
    if Gp.winexec ~= nil then
        local Gw, Gx = pcall(Gp.winexec, ('explorer.exe "%s"'):format(Gr), 1)
        if Gw then return (tonumber(Gx) or 0) > 31 end
    end
    return false
end

local function Gy()
    if CY ~= nil then CY(CV) end
    if Gq(CV) then
        Cd(C0('Opened the download page (link copied)'))
    else
        Cd(C0('Could not open your browser, copy the link above'), 'error')
    end
end

local function Gz()
    if Fg.login_url == nil or CY == nil then return end
    CY(Fg.login_url)
    Cd(C0('Login link copied to clipboard'))
end

local function GA()
    if Fg.login_session == nil then return end
    Fg.login_session = nil
    Fg.login_url = nil
    Cd(C0('Login cancelled'))
end

local function GB()
    if Fh.login or Fg.logged_in then return end
    local GC = Du()
    if GC == nil then
        return Cd(C0('Could not read your AIMWARE username'), 'error')
    end
    if not F1('login', false, "login-session", { client = CT, linkCode = GC }, function(GD, GE)
        if not GD then return end

        if GE.status ~= true or GE.data == nil or GE.data.sessionId == nil then
            return Cd(GE.error or C0('Failed to start login'), 'error')
        end

        Fg.login_session = GE.data.sessionId
        Fg.login_url = CR .. "/cheat-device?code=" .. GE.data.sessionId
        Fg.last_error = nil
        Fg.error_backoff_until = 0
        if CY ~= nil then CY(Fg.login_url) end
        Gq(Fg.login_url)
        Cd(C0('Confirm the login in your browser (link copied)'))
    end) then
        Cd(C0('Unexpected situation'), 'error')
    end
end

local function GF()
    if Fg.login_session == nil then return end
    F1('poll', false, "login-poll", { sessionId = Fg.login_session }, function(GG, GH)
        if Fg.login_session == nil then return end
        if not GG then return end

        if GH.status ~= true or GH.data == nil then
            Fg.login_session = nil
            Fg.login_url = nil
            return Cd(GH.error or C0('Login failed'), 'error')
        end

        local GI = GH.data.loginStatus
        if GI == "PENDING" then return end

        if GI == "APPROVED" then
            if GH.data.token == nil or GH.data.user == nil or GH.data.renewAt == nil then
                Fg.login_session = nil
                Fg.login_url = nil
                return Cd(C0('Login failed, please try again'), 'error')
            end
            return Gl(GH.data.user, GH.data.token, GH.data.renewAt)
        end

        Fg.login_session = nil
        Fg.login_url = nil
        if GI == "DENIED" then
            Cd(C0('Login was rejected'), 'error')
        else
            Cd(C0('Login link expired, please try again'), 'error')
        end
    end)
end

local function GJ()
    if not Fg.logged_in then return end
    FB(true, "logout", {}, function() end)
    Fo()
    Cd(C0('Logged out'))
end

local function GK()
    local GL = Fg.lang_want
    if GL == nil or not Fg.logged_in then return end
    F1('lang', true, "set-language", { language = GL }, function(GM, GN)
        if not GM or GN == nil then return end
        if GN.status == true then
            if Fg.lang_want == GL then Fg.lang_want = nil end
        else
            Fg.lang_want = nil
            Cd(GN.error or C0('Failed to change language'), 'error')
        end
    end)
end

local function GO()
    return F1('check', true, "check-state", {}, function(GP, GQ)
        if not GP then return end

        if GQ.status == true then
            Fg.last_error = nil
            Fg.error_backoff_until = 0

            if GQ.data ~= nil then
                local GR = GQ.data
                Fg.user = GR.user
                Fg.queueCount = GR.queueCount
                Fg.lobby = GR.lobby
                Fg.match = GR.match

                local GS = (Fg.user ~= nil) and Fg.user.language or nil
                if type(GS) == 'string' and GS ~= Fg.lang_seen then
                    Fg.lang_seen = GS
                    if Fg.lang_want == nil and Gk ~= nil then
                        Gk((GS == 'ZH') and 2 or 1)
                    end
                end
            end
        else
            local GT = GQ.error or C0('Unknown error')
            if GT ~= Fg.last_error then Cd(GT, 'error') end
            Fg.last_error = GT
            Fg.error_backoff_until = iI.get_unix_time() + 15
        end
    end)
end

local function GU()
    local GV = EW()
    if GV == Fg.sent_region_key then return false end
    return F1('region', true, "update-lobby-region", { region = ES() }, function(GW, GX)
        if not GW then return end
        if GX.status == true then
            Fg.sent_region_key = GV
            Fg.lobby = GX.lobby
        else
            Cd(GX.error, 'error')
        end
    end)
end

local function GY()
    if engine == nil or engine.GetServerIP == nil then return nil end
    local GZ, G0 = pcall(engine.GetServerIP)
    if not GZ or type(G0) ~= 'string' or #G0 == 0 then return nil end
    return G0
end

local function G1()
    if Fg.conn_frame == Fe then return Fg.conn_value end
    Fg.conn_frame = Fe
    Fg.conn_value = false
    local G2 = Fg.match
    if G2 ~= nil and G2.state == "IN_PROGRESS" then
        local G3 = GY()
        if G3 ~= nil then
            Fg.conn_value = G3 == ("%s:%d"):format(tostring(G2.server), G2.port or 0)
                or G3 == tostring(G2.server)
        end
    end
    return Fg.conn_value
end

local function G4()
    return ("connect %s:%d"):format(Fg.match.server, Fg.match.port)
end

local function G5()
    if Fg.match ~= nil and Fg.match.state == "IN_PROGRESS" and (not G1()) then
        Cd(C0('Joining match'))
        client.Command(G4(), true)
    end
end

local function G6()
    if DC.blocked() then return end
    if not Fg.logged_in or Fg.login_token == nil then return end

    if iI.get_unix_time() < Fg.error_backoff_until then return end

    if Fg.login_renew > 0 and Fg.login_renew <= iI.get_unix_time() then
        Cd(C0('Session expired, please log in again'), 'error')
        return Fo()
    end

    GO()
    GK()

    local G7 = Fg.user
    if G7 == nil then return end

    if G7.lobbyId ~= nil and Fg.lobby ~= nil then
        if G7.uid == Fg.lobby.hostUid then GU() end
    end

    if G7.state == "IDLE" then
        Fg.auto_join = true
        Fg.auto_accepted = false
    elseif G7.state == "IN_MATCH" then
        if Fg.match ~= nil and Fg.match.state == "WAITING_FOR_PLAYERS" and not Fg.auto_accepted then
            Fg.auto_accepted = true
            FB(true, "accept-match", {}, function() end)
        end
        if Fg.match ~= nil and Fg.match.state == "VOTING" then Fp.sync() end
        if Fg.auto_join and Fg.match ~= nil and Fg.match.state == "IN_PROGRESS" then
            if not G1() then
                Cd(C0('Autojoining match'))
                client.Command(G4(), true)
            end
            Fg.auto_join = false
        end
    end
end

local function G8(G9)
    Fh.queue = true
    if not FB(true, G9 and "start-queue" or "stop-queue", {}, function(G_, Ha)
        Fh.queue = false
        if not G_ then return end
        if Ha.status == true then
            Fg.lobby = Ha.lobby
            Fg.recheck = true
        else
            Cd(Ha.error, 'error')
        end
    end) then
        Fh.queue = false
        Cd(C0('Unexpected situation'), 'error')
    end
end

local function Hb()
    if Fh.queue then return end

    if not DC.ready then
        return Cd(C0('Still loading matchmaking config, try again in a moment'), 'error')
    end

    local Hc = D7()
    local Hd = Ei()
    if #Hc < Hd then
        return Cd((C0('You must select at least %d maps')):format(Hd), 'error')
    end

    local He = DY()
    local Hf = ES()
    local Hg = table.concat(Hf, ",")

    local Hh = Fg.user ~= nil and Fg.user.lobbyId ~= nil

    local Hi = Hh and "update-lobby" or "create-lobby"
    local Hj
    if Hh then
        Hj = { game = Ez, gameMode = He, region = Hf, maps = Hc }
    else
        Hj = Dy({ game = Ez, gameMode = He, region = Hf, maps = Hc })
    end

    Fh.queue = true
    if not FB(true, Hi, Hj, function(Hk, Hl)
        if not Hk then
            Fh.queue = false
            return
        end
        if Hl.status ~= true then
            Fh.queue = false
            return Cd(Hl.error, 'error')
        end
        Fg.sent_region_key = Hg
        Fg.lobby = Hl.lobby
        G8(true)
    end) then
        Fh.queue = false
        Cd(C0('Unexpected situation'), 'error')
    end
end

local function Hm()
    if Fh.queue then return end
    G8(false)
end

local Hn = 12

local Ho = {
    name = {},
    want = {},
    n_want = 0,
    inflight = false,
    retry_at = 0,
    off = false,
}

function Ho.requeue(Hp, Hq)
    for Hr = 1, Hq do
        local Hs = Hp[Hr]
        if Ho.name[Hs] == nil and not Ho.want[Hs] then
            Ho.want[Hs] = true
            Ho.n_want = Ho.n_want + 1
        end
    end
end

local function Ht(Hu, Hv)
    if type(Hu) ~= 'string' or #Hu == 0 then return Hv end
    local Hw = Ho.name[Hu]
    if Hw ~= nil then
        if #Hw > 0 then return Hw end
        return Hv
    end
    if not Ho.off and not Ho.want[Hu] then
        Ho.want[Hu] = true
        Ho.n_want = Ho.n_want + 1
    end
    return Hv
end

local function Hx()
    if Ho.off or Ho.inflight or Ho.n_want == 0 then return end
    if not Fg.logged_in or Ff < Ho.retry_at then return end

    local Hy, Hz, HA = {}, 0, 0
    for HB in pairs(Ho.want) do
        if Hz < Hn then
            Hz = Hz + 1
            Hy[Hz] = HB
            Ho.want[HB] = nil
        else
            HA = HA + 1
        end
    end
    Ho.n_want = HA
    if Hz == 0 then return end

    Ho.inflight = true
    local HI = FB(true, "steam/lua/players", { steam_ids = Hy }, function(HC, HD, HE)
        Ho.inflight = false

        if not HC or HD == nil or HD.status ~= true or type(HD.data) ~= 'table' then
            if HE == 401 then
                Ho.off = true
                Cb('[HvH.gg Prime] steam names: off (unauthorized on shared-api)')
                return
            end
            Ho.retry_at = iI.get_unix_time() + 60
            Ho.requeue(Hy, Hz)
            return
        end

        for HF, HG in ipairs(HD.data) do
            if type(HG) == 'table' and type(HG.steam_id) == 'string' then
                local HH = HG.name
                if type(HH) ~= 'string' or #HH == 0 or HH == HG.steam_id then HH = '' end
                Ho.name[HG.steam_id] = HH
            end
        end
    end, { base = CS, soft = true })

    if not HI then
        Ho.inflight = false
        Ho.retry_at = iI.get_unix_time() + 5
        Ho.requeue(Hy, Hz)
    end
end

local HJ = {
    items = nil,
    loading = 0,
    retry_at = 0,
    confirm = nil,
    confirm_until = 0,

    page = 1,
    per_page = 6,
}

Gj = function()
    HJ.items = nil
    HJ.loading = 0
    HJ.retry_at = 0
    HJ.confirm = nil
    HJ.confirm_until = 0
    HJ.page = 1
    Ho.off = false
    Ho.retry_at = 0
end

local function HK(HL)
    if HJ.items == nil then return nil end
    for HM, HN in ipairs(HJ.items) do
        if HN.xuid == HL then return true end
    end
    return false
end

local function HO(HP)
    if type(HP) ~= "table" or type(HP.items) ~= "table" then return false end
    HJ.items = HP.items
    HJ.confirm = nil
    return true
end

local function HQ(HR)
    if not Fg.logged_in then return end
    if HJ.loading > 0 then return end
    if HJ.items ~= nil and not HR then return end

    HJ.loading = 1
    if not FB(true, "xuids", {}, function(HS, HT)
        HJ.loading = 0
        if not HS or HT == nil or HT.status ~= true or not HO(HT.data) then
            HJ.retry_at = iI.get_unix_time() + 15
        end
    end) then
        HJ.loading = 0
        HJ.retry_at = iI.get_unix_time() + 5
    end
end

local function HU()
    if HJ.loading > 0 then return end
    HJ.loading = 1
    if not FB(true, "link-xuid", Dy({}), function(HV, HW)
        HJ.loading = 0
        if not HV or HW == nil then return end
        if HW.status ~= true or not HO(HW.data) then
            return Cd(HW.error or C0('Failed to link this Steam account'), 'error')
        end
        Cd(C0('Steam account linked'))
    end) then
        HJ.loading = 0
        Cd(C0('Unexpected situation'), 'error')
    end
end

local function HX(HY)
    if HJ.loading > 0 then return end
    HJ.loading = 1

    local function HZ()
        if not FB(true, "unlink-xuid", { xuid = HY }, function(H0, H1)
            HJ.loading = 0
            if not H0 or H1 == nil then return end
            if H1.status ~= true or not HO(H1.data) then
                return Cd(H1.error or C0('Failed to unlink this Steam account'), 'error')
            end
            Cd(C0('Steam account unlinked'))
        end) then
            HJ.loading = 0
            Cd(C0('Unexpected situation'), 'error')
        end
    end

    if Fg.user == nil or Fg.user.lobbyId == nil then return HZ() end

    if not FB(true, "leave-lobby", {}, function(H2, H3)
        if not H2 or H3 == nil then
            HJ.loading = 0
            return
        end
        if H3.status ~= true then
            HJ.loading = 0
            return Cd(H3.error or C0('Failed to leave your lobby'), 'error')
        end
        if H3.user ~= nil then Fg.user = H3.user end
        Fg.lobby = nil
        Fg.sent_region_key = nil
        Cd(C0('Left your lobby to unlink this Steam account'))
        HZ()
    end) then
        HJ.loading = 0
        Cd(C0('Unexpected situation'), 'error')
    end
end

local H4 = {
    profile = nil,
    matches = nil,
    board = nil,
    loading = 0,
    fetched_at = 0,
    error = nil,
}

local H5 = 60

local function H6(H7)
    if not Fg.logged_in then return end
    if H4.loading > 0 then return end
    local H8 = iI.get_unix_time()
    if not H7 and H4.fetched_at > 0 and H8 - H4.fetched_at < H5 then return end

    H4.error = nil
    H4.loading = 1

    local function H9(H_)
        H4.loading = 0
        if H_ then H4.fetched_at = iI.get_unix_time() end
    end

    local function Ia(Ib, Ic)
        if Ib == nil then return end
        if Ib.status ~= true or Ib.data == nil then
            H4.error = Ib.error or C0('Failed to load stats')
            return
        end
        Ic(Ib.data)
    end

    local function Id()
        if not FB(true, "leaderboard", { startIndex = 0, count = 10 }, function(Ie, If)
            if Ie then Ia(If, function(Ig) H4.board = Ig.items end) end
            H9(Ie)
        end) then H9(false) end
    end

    local function Ih()
        if not FB(true, "matches", { xuid = CP, startIndex = 0, count = 8 }, function(Ii, Ij)
            if Ii then Ia(Ij, function(Ik) H4.matches = Ik.items end) end
            Id()
        end) then H9(false) end
    end

    if not FB(true, "profile", { xuid = CP }, function(Il, Im)
        if Il then Ia(Im, function(In) H4.profile = In end) end
        Ih()
    end) then H9(false) end
end

Cb('[HvH.gg Prime] load: logic ok')

local Io = {
    init_done = false,
    ok = false,
    w = 440,
    x = DI.x,
    y = DI.y,
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

local Ip = {}
local Iq = {}

local Ir = { ref = nil, dead = false, gone = false, beat = 0 }

Ir.n = (rawget(_G, '__hvhgg_prime_n') or 0) + 1
rawset(_G, '__hvhgg_prime_n', Ir.n)

if GetScriptName ~= nil then
    local Is, It = pcall(GetScriptName)
    if Is and type(It) == 'string' and #It > 0 then Ir.script = It end
end

do
    local Iu = rawget(_G, '__hvhgg_prime')
    rawset(_G, '__hvhgg_prime', Ir)
    if type(Iu) == 'table' then
        Iu.dead = true
        Cb('[HvH.gg Prime] load: superseding a previous instance')
    end
end

function Ir.alive(Iv)
    if Iv == nil then return false end
    local Iw, Ix = pcall(Iv.IsActive, Iv)
    return Iw and Ix == true
end

function Ir.init()
    if gui == nil or gui.Reference == nil then
        Cb('[HvH.gg Prime] ui: no gui.Reference, panel will stay hidden')
        return
    end

    local Iy, Iz = pcall(gui.Reference, 'Menu')
    if Iy and Iz ~= nil and Iz.IsActive ~= nil then Ir.ref = Iz end

    Cb('[HvH.gg Prime] ui: host menu=' .. tostring(Ir.ref ~= nil))
end

function Ir.open()
    return Ir.alive(Ir.ref)
end

function Ir.shutdown()
    if Ir.gone then return end
    Ir.gone = true
    Ir.dead = true

    if rawget(_G, '__hvhgg_prime') == Ir then rawset(_G, '__hvhgg_prime', nil) end
    Cb('[HvH.gg Prime] unload: done')
end

local IA = {
    names = { 'Microsoft YaHei UI', 'Microsoft YaHei', 'Noto Sans SC', 'SimHei', 'SimSun', 'Segoe UI', 'Tahoma' },
    size = { main = 13, bold = 13, title = 17 },
}

function IA.make(IB, IC, ID)
    if draw.CreateFont == nil then return nil end
    local IE, IF = pcall(draw.CreateFont, IB, IC, ID, false, true)
    if not IE or IF == nil then return nil end
    return IF
end

function IA.cjk(IG)
    if IG == nil or draw.SetFont == nil or draw.GetTextSize == nil then return 0 end
    local IH, II = pcall(function()
        draw.SetFont(IG)
        return (draw.GetTextSize('中文'))
    end)
    if not IH or type(II) ~= 'number' then return 0 end
    return II
end

Gk = function(IJ)
    if CZ.no_cjk or IJ == CZ.lang then return end
    DI.lang = IJ
    CZ.lang = IJ
    DR()
    Cb('[HvH.gg Prime] ui: language from account = ' .. tostring(IJ))
end

local function IK()
    local IL, IM, IN = nil, nil, false

    for IO = 1, #IA.names do
        local IP = IA.make(IA.names[IO], IA.size.main, 400)
        if IP ~= nil then
            local IQ = IA.cjk(IP)
            if IL == nil then IL, IM = IA.names[IO], IP end
            if IQ > 0 then
                IL, IM, IN = IA.names[IO], IP, true
                break
            end
        end
    end

    Ip.main = IM
    Ip.bold = IL and IA.make(IL, IA.size.bold, 700) or IM
    Ip.title = IL and IA.make(IL, IA.size.title, 700) or IM
    if Ip.bold == nil then Ip.bold = IM end
    if Ip.title == nil then Ip.title = IM end

    if not IN then
        CZ.no_cjk = true
        CZ.lang = 1
    end

    Cb('[HvH.gg Prime] ui: font ' .. tostring(IL) .. ' cjk=' .. tostring(IN))

    Iq.bg        = { 30, 30, 30, 250 }
    Iq.title_bg  = { 39, 39, 39, 255 }
    Iq.panel     = { 48, 48, 48, 255 }
    Iq.line      = { 255, 255, 255, 30 }
    Iq.text      = { 255, 255, 255, 255 }
    Iq.text_dim  = { 255, 255, 255, 179 }
    Iq.text_mute = { 255, 255, 255, 97 }
    Iq.chip      = { 255, 255, 255, 20 }
    Iq.hover     = { 255, 255, 255, 22 }
    Iq.shadow    = { 0, 0, 0, 110 }

    Iq.primary       = { 25, 118, 210, 255 }
    Iq.primary_light = { 144, 202, 249, 255 }
    Iq.on_primary    = { 255, 255, 255, 255 }

    Iq.vip       = { 249, 115, 22, 255 }
    Iq.svip      = { 192, 132, 252, 255 }

    Iq.mod       = { 56, 189, 248, 255 }
    Iq.admin     = { 239, 68, 68, 255 }
    Iq.dhdj      = { 250, 204, 21, 255 }
    Iq.on_dhdj   = { 30, 30, 30, 255 }

    Iq.good      = { 102, 187, 106, 255 }
    Iq.warn      = { 255, 167, 38, 255 }
    Iq.danger    = { 211, 47, 47, 255 }
    Iq.danger_lt = { 244, 67, 54, 255 }

    Io.ok = true
end

local IR = {
    max = 2048,
    ascii = {},
    size = {},
    upper = {},
    ell = {},
    wrap = {},
    n = { ascii = 0, size = 0, upper = 0, ell = 0, wrap = 0 },
}

function IR.room(IS)
    if IR.n[IS] < IR.max then return false end
    IR[IS] = {}
    IR.n[IS] = 0
    return true
end

function IR.put(IT, IU, IV)
    IR.room(IT)
    IR[IT][IU] = IV
    IR.n[IT] = IR.n[IT] + 1
    return IV
end

function IR.u8(IW, IX)
    local IY = IW:byte(IX)
    if IY == nil then return IX + 1 end
    if IY >= 0xF0 then return IX + 4 end
    if IY >= 0xE0 then return IX + 3 end
    if IY >= 0xC0 then return IX + 2 end
    return IX + 1
end

local function IZ(I0)
    local I1 = IR.ascii[I0]
    if I1 ~= nil then return I1 end
    return IR.put('ascii', I0, I0:find('[\128-\255]') == nil)
end

local function I2(I3, I4)
    return { I3[1], I3[2], I3[3], I3[4] * I4 }
end

local function I5(I6)
    if I6 == nil then return end
    draw.Color(I6[1], I6[2], I6[3], I6[4])
end

local function I7()
    if draw.GetScreenSize == nil then return 1920, 1080 end
    local I8, I9, I_ = pcall(draw.GetScreenSize)
    if not I8 or type(I9) ~= 'number' or type(I_) ~= 'number' then return 1920, 1080 end
    return I9, I_
end

local function Ja(Jb)
    return math.floor(Jb + 0.5)
end

local function Jc(Jd, Je, Jf, Jg, Jh, Ji)
    if Io.measuring then return end
    I5(Jh)
    local Jj, Jk, Jl, Jm = Ja(Jd), Ja(Je), Ja(Jd + Jf), Ja(Je + Jg)
    if Ji ~= nil and Ji > 0 and draw.RoundedRectFill ~= nil then
        draw.RoundedRectFill(Jj, Jk, Jl, Jm, Ji)
    else
        draw.FilledRect(Jj, Jk, Jl, Jm)
    end
end

local function Jn(Jo, Jp, Jq, Jr, Js, Jt)
    if Io.measuring then return end
    I5(Js)
    local Ju, Jv, Jw, Jx = Ja(Jo), Ja(Jp), Ja(Jo + Jq), Ja(Jp + Jr)
    if Jt ~= nil and Jt > 0 and draw.RoundedRect ~= nil then
        draw.RoundedRect(Ju, Jv, Jw, Jx, Jt)
    else
        draw.OutlinedRect(Ju, Jv, Jw, Jx)
    end
end

local Jy = nil

local function Jz(JA)
    if JA == nil then return false end
    if Jy ~= JA then
        draw.SetFont(JA)
        Jy = JA
    end
    return true
end

local function JB(JC, JD)
    local JE = IR.size[JC]
    if JE ~= nil then
        local JF = JE[JD]
        if JF ~= nil then return JF[1], JF[2] end
    end

    local JG, JH = #JD * 7, 13
    if Jz(JC) then
        local JI, JJ, JK = pcall(draw.GetTextSize, JD)
        if JI and type(JJ) == 'number' then
            JG = JJ
            if type(JK) == 'number' and JK > 0 then JH = JK end
        end
    end

    if IR.room('size') then JE = nil end
    if JE == nil then
        JE = {}
        IR.size[JC] = JE
    end
    JE[JD] = { JG, JH }
    IR.n.size = IR.n.size + 1
    return JG, JH
end

local function JL(JM, JN)
    if JM == nil then return #JN * 7, 13 end
    return JB(JM, JN)
end

local function JO(JP, JQ, JR, JS)
    if Io.measuring or draw.ShadowRect == nil then return end
    I5(Iq.shadow)
    draw.ShadowRect(Ja(JP), Ja(JQ), Ja(JP + JR), Ja(JQ + JS), 6)
end

local function JT(JU, JV, JW, JX, JY)
    if Io.measuring then return end
    if not Jz(JU) then return end
    I5(JY)
    draw.Text(Ja(JV), Ja(JW), JX)
end

local function JZ(J0, J1, J2, J3, J4)
    local J5 = JL(J0, J3)
    JT(J0, J1 - J5 * 0.5, J2, J3, J4)
end

local function J6(J7, J8, J9, J_, Ka)
    local Kb = JL(J7, J_)
    JT(J7, J8 - Kb, J9, J_, Ka)
end

local function Kc(Kd, Ke)
    if Kd == nil then return 7 end
    return (JB(Kd, Ke))
end

local function Kf(Kg, Kh, Ki)
    if Kg == nil or not IZ(Kh) then return JL(Kg, Kh) end
    local Kj = 0
    for Kk = 1, #Kh do Kj = Kj + Kc(Kg, Kh:sub(Kk, Kk)) + Ki end
    return Kj - Ki
end

local function Kl(Km, Kn, Ko, Kp, Kq, Kr)
    if Km == nil then return end
    if not IZ(Kp) then return JT(Km, Kn, Ko, Kp, Kq) end
    if Io.measuring then return end
    if not Jz(Km) then return end
    I5(Kq)
    for Ks = 1, #Kp do
        local Kt = Kp:sub(Ks, Ks)
        if Kt ~= ' ' then
            draw.Text(Ja(Kn), Ja(Ko), Kt)
        end
        Kn = Kn + Kc(Km, Kt) + Kr
    end
end

local function Ku(Kv)
    local Kw = IR.upper[Kv]
    if Kw ~= nil then return Kw end
    return IR.put('upper', Kv, Kv:upper())
end

local function Kx(Ky, Kz, KA)
    local KB = IR.ell[Kz]
    if KB ~= nil and KB.f == Ky and KB.w == KA then return KB.out end

    local KC = Kz
    if JL(Ky, Kz) > KA then
        local KD, KE = nil, 1
        while KE <= #Kz do
            local KF = IR.u8(Kz, KE)
            if JL(Ky, Kz:sub(1, KF - 1) .. '...') > KA then break end
            KD = Kz:sub(1, KF - 1)
            KE = KF
        end
        if KD ~= nil then KC = KD .. '...' end
    end

    IR.put('ell', Kz, { f = Ky, w = KA, out = KC })
    return KC
end

local function KG(KH, KI, KJ)
    KI = tostring(KI)
    local KK = IR.wrap[KI]
    if KK ~= nil and KK.f == KH and KK.w == KJ then return KK.lines end

    local function KL(KM, KN)
        local KO = KM:byte(KN)
        if KO >= 128 then return IR.u8(KM, KN) end
        if KO == 32 then return KN + 1 end
        local KP = KN
        while KP <= #KM do
            local KQ = KM:byte(KP)
            if KQ >= 128 or KQ == 32 then break end
            KP = KP + 1
        end
        return KP
    end

    local KR = {}
    for KS in (KI .. "\n"):gmatch("([^\n]*)\n") do
        if JL(KH, KS) <= KJ then
            KR[#KR + 1] = KS
        else
            local KT, KU = "", 1
            while KU <= #KS do
                local KV = KL(KS, KU)
                local KW = KS:sub(KU, KV - 1)
                KU = KV
                if KW ~= " " or #KT > 0 then
                    if #KT > 0 and JL(KH, KT .. KW) > KJ then
                        KR[#KR + 1] = KT
                        KT = (KW == " ") and "" or KW
                    else
                        KT = KT .. KW
                    end
                end
            end
            if #KT > 0 then KR[#KR + 1] = KT end
        end
    end

    IR.put('wrap', KI, { f = KH, w = KJ, lines = KR })
    return KR
end

local function KX(KY, KZ, K0, K1)
    if Io.measuring or not Io.interactive then return false end
    return Io.cx >= KY and Io.cx <= KY + K0 and Io.cy >= KZ and Io.cy <= KZ + K1
end

local K2 = 16

local function K3(K4, K5)
    local K6, K7 = JL(K4, K5)
    if K7 + 2 > K2 then return K7 + 2 end
    return K2
end

local function K8()
    if Io.row_frame ~= Fe then
        Io.row_frame = Fe
        local K9 = 15
        if Ip.main ~= nil then local K_; K_, K9 = JB(Ip.main, 'Ag') end
        Io.row_value = (K9 + 3 > 18) and (K9 + 3) or 18
    end
    return Io.row_value
end

local function La(Lb, Lc, Ld, Le, Lf)
    local Lg = KG(Ip.main, Le, Ld)
    local Lh = K3(Ip.main, Lg[1] or '')
    for Li = 1, #Lg do
        JT(Ip.main, Lb, Lc + (Li - 1) * Lh, Lg[Li], Lf or Iq.text_dim)
    end
    return #Lg * Lh
end

local Lj = 4
local Lk = 4
local Ll = 4
local Lm = 0.6
local Ln = 1.4

local function Lo(Lp, Lq, Lr, Ls, Lt, Lu, Lv)
    local Lw = IZ(Lt)
    if Lw then Lt = Ku(Lt) end
    local Lx = (not Lv) and KX(Lp, Lq, Lr, Ls)

    local Ly = nil
    local Lz = Iq.primary_light
    local LA = false

    if Lu == 'primary' then
        Ly = Iq.primary
        Lz = Iq.on_primary
    elseif Lu == 'danger' then
        Ly = Iq.danger
        Lz = Iq.on_primary
    elseif Lu == 'ghost' then
        Lz = Iq.primary_light
    elseif Lu == 'quiet' then
        Lz = Iq.text_dim
    else
        LA = true
    end

    if Lv then
        Ly = Iq.chip
        Lz = Iq.text_mute
        LA = false
    end

    if Ly ~= nil then
        Jc(Lp, Lq, Lr, Ls, Ly, Lk)
    elseif LA then
        Jn(Lp, Lq, Lr, Ls, Iq.line, Lk)
    end
    if Lx then Jc(Lp, Lq, Lr, Ls, Iq.hover, Lk) end

    local LB, LC = JL(Ip.bold, Lt)
    if Lw then
        LB = Kf(Ip.bold, Lt, Lm)
        Kl(Ip.bold, Lp + (Lr - LB) * 0.5, Lq + (Ls - LC) * 0.5, Lt, Lz, Lm)
    else
        JT(Ip.bold, Lp + (Lr - LB) * 0.5, Lq + (Ls - LC) * 0.5, Lt, Lz)
    end
    return Lx and Io.clicked
end

local function LD(LE, LF, LG, LH, LI, LJ)
    local LK = KX(LE, LF, LG, LH)
    Jc(LE, LF, LG, LH, LJ and Iq.primary or Iq.chip, Ll)
    if LK then Jc(LE, LF, LG, LH, Iq.hover, Ll) end
    local LL, LM = JL(Ip.main, LI)
    JT(Ip.main, LE + (LG - LL) * 0.5, LF + (LH - LM) * 0.5, LI, LJ and Iq.on_primary or Iq.text_dim)
    return LK and Io.clicked
end

local function LN(LO, LP, LQ, LR, LS)
    local LT = K3(Ip.main, LR) + 2
    if IZ(LR) then
        Kl(Ip.main, LO, LP, Ku(LR), Iq.text_mute, Ln)
    else
        JT(Ip.main, LO, LP, LR, Iq.text_mute)
    end
    if LS ~= nil then
        J6(Ip.main, LO + LQ, LP, LS, Iq.text_mute)
    end
    Jc(LO, LP + LT, LQ, 1, Iq.line)
    return LT + 10
end

local LU = 14
local LV = 38

local function LW(LX) Io.action = LX end

local function LY(LZ, L0, L1, L2)
    local L3 = Ff < (Io.logout_until or 0)
    if Lo(LZ, L0, L1, L2, L3 and C0('Sure?') or C0('Logout'), L3 and 'danger' or 'quiet') then
        if L3 then
            LW(function()
                Io.logout_until = 0
                GJ()
            end)
        else
            local L4 = Ff + 5
            LW(function() Io.logout_until = L4 end)
        end
    end
end

local L5 = {
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

local function L6(L7, L8)
    if L7 == 'dtMode' then
        local L9 = tonumber(L8) or 0
        return C0((L9 >= 2 and 'Blocked') or (L9 == 1 and 'Limited') or 'Unrestricted'),
            (L9 > 0) and Iq.good or Iq.danger_lt
    end
    if L7 == 'airAccelerate' then
        return tostring(math.floor(tonumber(L8) or 0)), Iq.primary_light
    end
    if L7 == 'pingBalance' then
        local L_ = tonumber(L8) or 0
        if L_ > 0 then return ('%dms'):format(L_), Iq.primary_light end
        return C0('Off'), Iq.danger_lt
    end
    if L7 == 'restrictAwp' or L7 == 'restrictScout' or L7 == 'restrictAuto' then
        local Ma = tonumber(L8)
        if Ma == nil or Ma < 0 then return C0('Unlimited'), Iq.primary_light end
        return (C0('%d guns')):format(Ma), Iq.primary_light
    end
    if L8 == true then return C0('On'), Iq.good end
    return C0('Off'), Iq.danger_lt
end

local function Mb(Mc, Md, Me)
    local Mf = DD(DY())
    local Mg = (Mf ~= nil and type(Mf.settings) == 'table') and Mf.settings or nil
    if Mg == nil then return 0 end

    local Mh, Mi = Md, Md
    Md = Md + LN(Mc, Md, Me, C0('Match settings'))
    if Lo(Mc + Me - 62, Mi - 4, 62, 22, DI.rules and C0('Hide') or C0('Show'), 'ghost') then
        LW(function()
            DI.rules = not DI.rules
            DR()
        end)
    end
    if not DI.rules then return Md - Mh end

    local Mj, Mk, Ml = (Me - 16) * 0.5, K8(), 0
    for Mm = 1, #L5 do
        local Mn = Mg[L5[Mm][1]]
        if Mn ~= nil then
            local Mo = Mc + (Ml % 2) * (Mj + 16)
            local Mp = Md + math.floor(Ml / 2) * Mk
            local Mq, Mr = L6(L5[Mm][1], Mn)
            local Ms = JL(Ip.main, Mq)
            J6(Ip.main, Mo + Mj, Mp, Mq, Mr)
            JT(Ip.main, Mo, Mp, Kx(Ip.main, C0(L5[Mm][2]), Mj - Ms - 8), Iq.text_dim)
            Ml = Ml + 1
        end
    end
    return (Md - Mh) + math.ceil(Ml / 2) * Mk + 4
end

local function Mt(Mu, Mv, Mw)
    local Mx = Mv
    if Fg.login_session ~= nil then
        Mv = Mv + La(Mu, Mv, Mw, C0('Confirm this login in your browser. The link is already in your clipboard.')) + 10
        Jc(Mu, Mv, Mw, 30, Iq.panel, 6)
        JT(Ip.main, Mu + 10, Mv + 9, Kx(Ip.main, tostring(Fg.login_url), Mw - 20), Iq.text_dim)
        Mv = Mv + 40
        if Lo(Mu, Mv, 120, 32, C0('Copy link')) then LW(Gz) end
        if Lo(Mu + 130, Mv, 110, 32, C0('Cancel'), 'ghost') then LW(GA) end
        Mv = Mv + 32
    else
        Mv = Mv + La(Mu, Mv, Mw, C0('Sign in with your mmhvh.com account to start matchmaking. Your browser will open for confirmation.')) + 12
        if Lo(Mu, Mv, 130, 34, C0('Login'), 'primary', Fh.login) then LW(GB) end
        Mv = Mv + 34
    end
    return Mv - Mx
end

local function My(Mz, MA, MB)
    local MC = MA

    if HK(CP) == false then
        MA = MA + La(Mz, MA, MB,
            C0('The Steam account you are playing on is not linked to your HvH.gg Prime account. Link it before queueing.'),
            Iq.warn) + 8
        if Lo(Mz, MA, 170, 34, C0('Link this Steam'), 'primary', HJ.loading > 0) then
            LW(HU)
        end
        MA = MA + 42
    end

    if not DC.ready then
        return (MA - MC) + La(Mz, MA, MB, C0('Loading matchmaking config...'))
    end

    MA = MA + LN(Mz, MA, MB, C0('Game mode'))
    local MD = (MB - 8) * 0.5
    for ME = 1, #DC.modes do
        local MF = (ME - 1) % 2
        local MG = math.floor((ME - 1) / 2)
        local MH = DC.modes[ME]
        if LD(Mz + MF * (MD + 8), MA + MG * 38, MD, 32, Ej(MH.id), DI.mode == MH.id) then
            LW(function() DI.mode = MH.id; DR() end)
        end
    end
    MA = MA + math.ceil(#DC.modes / 2) * 38 + 6

    MA = MA + Mb(Mz, MA, MB)

    local MI, MJ = EX()
    MA = MA + LN(Mz, MA, MB, C0('Region'), Fc(MI))
    local MK = (MB - 12) / 3
    local ML = E2()
    for MM = 1, #ML do
        local MN = ML[MM]
        local MO = (MM - 1) % 3
        local MP = math.floor((MM - 1) / 3)
        if LD(Mz + MO * (MK + 6), MA + MP * 36, MK, 30, C0(DH[MN].label), DI.region == MN) then
            LW(function() DI.region = MN; DR() end)
        end
    end
    MA = MA + math.ceil(#ML / 3) * 36 + 2
    JT(Ip.main, Mz, MA, Kx(Ip.main, MJ, MB), Iq.text_mute)
    MA = MA + 20

    local MQ = Ed()
    local MR = Ei()

    if not D2() then
        local MS, MT = D5(), D6()
        local MU = MA
        MA = MA + LN(Mz, MA, MB, C0('Map pool'))
        J6(Ip.main, Mz + MB - 116, MU, (C0('%d/%d  (min %d)')):format(MQ, #MS, MR), Iq.text_mute)

        if Lo(Mz + MB - 106, MU - 4, 50, 22, C0('All'), 'ghost') then
            LW(function()
                for MV, MW in ipairs(MS) do MT[MW] = true end
                DR()
            end)
        end
        if Lo(Mz + MB - 52, MU - 4, 52, 22, C0('None'), 'ghost') then
            LW(function()
                for MX, MY in ipairs(MS) do MT[MY] = false end
                DR()
            end)
        end

        local MZ = (MB - 8) * 0.5
        for M0 = 1, #MS do
            local M1 = (M0 - 1) % 2
            local M2 = math.floor((M0 - 1) / 2)
            local M3 = MS[M0]
            if LD(Mz + M1 * (MZ + 8), MA + M2 * 34, MZ, 28, C4(M3), MT[M3] == true) then
                LW(function() MT[M3] = not (MT[M3] == true); DR() end)
            end
        end
        MA = MA + math.ceil(#MS / 2) * 34 + 10
    end

    local M4 = MQ >= MR
    if Lo(Mz, MA, MB, 38, C0('Start queue'), 'primary', Fh.queue or (not M4)) then
        LW(Hb)
    end
    MA = MA + 38
    if not M4 then
        MA = MA + 6
        MA = MA + La(Mz, MA, MB, (C0('Select at least %d maps to queue.')):format(MR), Iq.warn)
    end

    return MA - MC
end

local function M5(M6, M7, M8)
    local M9 = M7

    local M_ = 0
    if Fg.lobby ~= nil and Fg.lobby.startedAt ~= nil then
        M_ = Ff - math.floor(Fg.lobby.startedAt / 1000)
        if M_ < 0 then M_ = 0 end
    end

    local Na, Nb = EX()

    Jc(M6, M7, M8, 86, Iq.panel, 8)
    JT(Ip.main, M6 + 14, M7 + 12, C0('Searching for a match'), Iq.text_mute)
    JT(Ip.title, M6 + 14, M7 + 30, ("%02d:%02d"):format(math.floor(M_ / 60), M_ % 60), Iq.text)
    J6(Ip.main, M6 + M8 - 14, M7 + 32, Ej(DY()), Iq.text_dim)
    Jc(M6 + 14, M7 + 58, M8 - 28, 1, Iq.line)
    JT(Ip.main, M6 + 14, M7 + 62, Fc(Na), Iq.text_dim)
    J6(Ip.main, M6 + M8 - 14, M7 + 62, Kx(Ip.main, Nb, M8 - 110), Iq.text_mute)
    M7 = M7 + 96

    local Nc, Nd, Ne, Nf = 0, 0, 0, 0
    local Ng = Fg.queueCount ~= nil
    if Ng then
        Nc = Fg.queueCount.total or 0
        local Nh = Fg.queueCount.cs2 or {}
        Nd = Nh.C5v5 or 0
        Ne = (Nh.C2v2 or 0) + (Nh.W2v2 or 0)
        Nf = (Nh.C1v1 or 0) + (Nh.W1v1 or 0)
    end

    M7 = M7 + LN(M6, M7, M8, C0('Players in queue'),
        Ng and (C0('%d total')):format(Nc) or C0('no data'))
    local Ni = (M8 - 12) / 3
    local Nj = { { '5v5', Nd }, { '2v2', Ne }, { '1v1', Nf } }
    for Nk = 1, 3 do
        local Nl = M6 + (Nk - 1) * (Ni + 6)
        Jc(Nl, M7, Ni, 40, Iq.panel, 6)
        JZ(Ip.title, Nl + Ni * 0.5, M7 + 6, tostring(Nj[Nk][2]), Iq.text)
        JZ(Ip.main, Nl + Ni * 0.5, M7 + 24, Nj[Nk][1], Iq.text_mute)
    end
    M7 = M7 + 50

    if Lo(M6, M7, M8, 36, C0('Stop queue'), 'danger', Fh.queue) then LW(Hm) end
    M7 = M7 + 36

    return M7 - M9
end

local Nm = {
    WAITING_FOR_PLAYERS = 'Match found! Waiting for players to accept...',
    WAITING_FOR_SERVER  = 'Match found! Loading server...',
    WAITING_FOR_GAME    = 'Match found! Waiting for server to start...',
}

Fp = (function()
    local Nn = {}

    local No = {}
    local Np = nil
    local Nq = 0
    local Nr, Ns, Nt, Nu = nil, nil, nil, nil

    local Nv = { 'CounterTerrorist', 'Terrorist' }

    local function Nw(Nx)
        for Ny = 1, #C8 do
            if C8[Ny].name == Nx then return C0(C8[Ny].label) end
        end
        return Nx
    end

    local function Nz(NA)
        local NB = tonumber(NA.phaseDeadline)
        if NB == nil then return 0 end
        local NC = math.floor(NB / 1000) - Ff
        if NC < 0 then return 0 end
        return NC
    end

    local function ND(NE)
        local NF = tostring(NE.phase) .. '|' .. tostring(NE.currentRound) .. '|' .. tostring(NE.currentTurn)
        if NF == Np then return end
        Np = NF
        Nq = 0
        Nr, Ns, Nt, Nu = nil, nil, nil, nil
        No = {}
        if type(NE.myMapVote) == 'table' then
            for NG = 1, #NE.myMapVote do No[NG] = NE.myMapVote[NG] end
        end
    end

    local function NH()
        if Nt == nil or Nt == Nu then return end
        if Fh.vote then return end
        local NI = Nt
        F1('vote', true, Nr, Ns, function(NJ, NK)
            if not NJ then return end
            Nu = NI
            if NK.status ~= true then
                Cd(NK.error or C0('Failed to submit your vote'), 'error')
                Np = nil
            end
        end)
    end

    local function NL(NM, NN, NO)
        Nr, Ns, Nt = NM, NN, NO
        NH()
    end

    function Nn.sync()
        local NP = Fg.match
        if NP == nil or NP.state ~= 'VOTING' or NP.voteMode == nil then return end
        ND(NP.voteMode)
        NH()
    end

    local function NQ(NR)
        for NS = 1, #No do
            if No[NS] == NR then return NS end
        end
        return nil
    end

    local function NT()
        local NU = {}
        for NV = 1, #No do NU[NV] = No[NV] end
        NL('vote-map', { maps = NU }, 'm:' .. table.concat(NU, ','))
    end

    local function NW(NX, NY)
        local NZ = NQ(NX)
        if NZ ~= nil then
            if NY <= 1 then return end
            table.remove(No, NZ)
            return
        end
        if NY <= 1 then
            No = { NX }
            return NT()
        end
        if #No >= NY then return end
        No[#No + 1] = NX
        if #No == NY then NT() end
    end

    local function N0(N1, N2, N3, N4, N5, N6, N7, N8, N9)
        local N_ = N9 and KX(N1, N2, N3, N4)
        Jc(N1, N2, N3, N4, N8 and Iq.primary or Iq.chip, Ll)
        if N_ then Jc(N1, N2, N3, N4, Iq.hover, Ll) end

        local Oa = Iq.text_dim
        if N8 then Oa = Iq.on_primary elseif not N9 then Oa = Iq.text_mute end

        local Ob = 0
        if N6 ~= nil then Ob = JL(Ip.main, N6) + 8 end
        local Oc, Od = JL(Ip.main, 'Ag')
        JT(Ip.main, N1 + 8, N2 + (N4 - Od) * 0.5, Kx(Ip.main, N5, N3 - 16 - Ob), Oa)
        if N6 ~= nil then
            J6(Ip.main, N1 + N3 - 8, N2 + (N4 - Od) * 0.5, N6, N8 and Iq.on_primary or N7)
        end
        return N_ and Io.clicked
    end

    local function Oe(Of, Og, Oh, Oi)
        local Oj = Nz(Oi)
        if Oj > Nq then Nq = Oj end
        local Ok = 0
        if Nq > 0 then Ok = Oj / Nq end
        if Ok > 1 then Ok = 1 elseif Ok < 0 then Ok = 0 end
        Jc(Of, Og, Oh, 4, Iq.chip, 2)
        if Ok > 0 then
            Jc(Of, Og, Oh * Ok, 4, (Oj <= 5) and Iq.warn or Iq.primary_light, 2)
        end
        return Oj
    end

    function Nn.build(Ol, Om, On)
        local Oo = Fg.match.voteMode
        if Oo == nil then
            return La(Ol, Om, On, C0('Waiting for the server...'))
        end
        ND(Oo)

        local Op = Om
        local Oq = Oo.phase
        local Or = Oo.myTeam
        local Os = Oo.currentTurn
        if Oq == 'SIDE_PICK' then Os = Oo.sidePickerTeam end
        local Ot = Or ~= nil and Os ~= nil and Or == Os

        local Ou = C0('Map ban')
        if Oq == 'SIDE_PICK' then Ou = C0('Side pick')
        elseif Oq == 'REGION_VOTE' then Ou = C0('Region vote')
        elseif Oq == 'CAPTAIN_DRAFT' then Ou = C0('Captain draft')
        elseif Oq == 'COMPLETED' then Ou = C0('Vote complete') end

        local Ov = (Oq == 'COMPLETED') and 46 or 66
        Jc(Ol, Om, On, Ov, Iq.panel, 8)
        JT(Ip.main, Ol + 14, Om + 10, Ou, Iq.text_mute)
        if Oq == 'MAP_BAN' or Oq == 'CAPTAIN_DRAFT' then
            J6(Ip.main, Ol + On - 14, Om + 10, (C0('Round %d')):format(Oo.currentRound or 1), Iq.text_mute)
        end

        local Ow, Ox = nil, Iq.text
        if Oq == 'MAP_BAN' then
            Ow = Ot and C0('Your turn to ban') or C0('Opponent is banning')
            Ox = Ot and Iq.primary_light or Iq.text
        elseif Oq == 'SIDE_PICK' then
            Ow = Ot and C0('You pick the starting side') or C0('Opponent picks the starting side')
            Ox = Ot and Iq.primary_light or Iq.text
        elseif Oq == 'REGION_VOTE' then
            Ow = C0('Everyone votes for the server region')
        elseif Oq == 'CAPTAIN_DRAFT' then
            Ow = C0('Captains are picking players')
        else
            Ow = C0('Waiting for the server...')
        end
        local Oy = 0
        if Oq ~= 'COMPLETED' then
            Oy = Oe(Ol + 14, Om + 52, On - 28, Oo)
            J6(Ip.main, Ol + On - 14, Om + 26, ('%ds'):format(Oy), (Oy <= 5) and Iq.warn or Iq.text_mute)
            JT(Ip.bold, Ol + 14, Om + 26, Kx(Ip.bold, Ow, On - 28 - 46), Ox)
        else
            JT(Ip.bold, Ol + 14, Om + 26, Kx(Ip.bold, Ow, On - 28), Ox)
        end
        Om = Om + Ov + 10

        local Oz = Oy > 0

        if Oq == 'MAP_BAN' then
            local OA = Oo.bannedBy
            if type(OA) ~= 'table' then OA = {} end
            local OB = {}
            if type(Oo.disabledMaps) == 'table' then
                for OC = 1, #Oo.disabledMaps do OB[Oo.disabledMaps[OC]] = true end
            end
            local OD = {}
            for OE = 1, #Oo.remaining do OD[Oo.remaining[OE]] = true end

            local OF = Oo.banPerRound or 1
            local OG = nil
            if Ot then
                OG = (OF <= 1) and (C0('Pick %d')):format(OF) or (C0('Selected %d/%d')):format(#No, OF)
            end
            Om = Om + LN(Ol, Om, On, C0('Map'), OG)

            local OH = Oo.pool
            if type(OH) ~= 'table' or #OH == 0 then OH = Oo.remaining end
            local OI = (On - 8) * 0.5
            for OJ = 1, #OH do
                local OK = OH[OJ]
                local OL = Ol + ((OJ - 1) % 2) * (OI + 8)
                local OM = Om + math.floor((OJ - 1) / 2) * 34
                local ON, OO, OP = nil, Iq.text_mute, false
                if OB[OK] then
                    ON = C0('Disabled')
                elseif not OD[OK] then
                    ON = OA[OK] ~= nil and (C0('Banned') .. ' ' .. OA[OK]) or C0('Banned')
                    OO = Iq.danger_lt
                else
                    local OQ = 0
                    if type(Oo.mapTally) == 'table' then OQ = tonumber(Oo.mapTally[OK]) or 0 end
                    if OQ > 0 then ON = tostring(OQ); OO = Iq.warn end
                    OP = Ot and Oz
                end
                if N0(OL, OM, OI, 30, C4(OK), ON, OO, NQ(OK) ~= nil, OP) then
                    LW(function() NW(OK, OF) end)
                end
            end
            Om = Om + math.ceil(#OH / 2) * 34 + 4

        elseif Oq == 'SIDE_PICK' then
            Om = Om + LN(Ol, Om, On, C0('Starting side'))
            local OR = (On - 8) * 0.5
            for OS = 1, 2 do
                local OT = Nv[OS]
                local OU = 0
                if type(Oo.sideTally) == 'table' then OU = tonumber(Oo.sideTally[OT]) or 0 end
                local OV = nil
                if OU > 0 then OV = tostring(OU) end
                if N0(Ol + (OS - 1) * (OR + 8), Om, OR, 40, C0(OT), OV, Iq.warn,
                        Oo.mySideVote == OT, Ot and Oz) then
                    LW(function() NL('vote-side', { side = OT }, 's:' .. OT) end)
                end
            end
            Om = Om + 48

        elseif Oq == 'REGION_VOTE' then
            local OW = Oo.candidateRegions
            if type(OW) ~= 'table' then OW = {} end
            Om = Om + LN(Ol, Om, On, C0('Region'))
            local OX = (On - 8) * 0.5
            for OY = 1, #OW do
                local OZ = OW[OY]
                local O0 = 0
                if type(Oo.regionTally) == 'table' then O0 = tonumber(Oo.regionTally[OZ]) or 0 end
                local O1 = nil
                if O0 > 0 then O1 = tostring(O0) end
                local O2 = Ol + ((OY - 1) % 2) * (OX + 8)
                local O3 = Om + math.floor((OY - 1) / 2) * 34
                if N0(O2, O3, OX, 30, Nw(OZ), O1, Iq.warn, Oo.myRegionVote == OZ, Oz) then
                    LW(function() NL('vote-region', { region = OZ }, 'r:' .. OZ) end)
                end
            end
            Om = Om + math.ceil(#OW / 2) * 34 + 4

        elseif Oq == 'CAPTAIN_DRAFT' then
            Om = Om + LN(Ol, Om, On, C0('Captain draft'), ('%d / %d / %d'):format(
                tonumber(Oo.draftPicksACount) or 0,
                tonumber(Oo.draftPoolCount) or 0,
                tonumber(Oo.draftPicksBCount) or 0))
            Om = Om + La(Ol, Om, On, C0('Drafting is web only'), Iq.warn) + 4

        else
            local O4 = {}
            if Oo.pickedMap ~= nil then O4[#O4 + 1] = { C0('Map'), C4(Oo.pickedMap) } end
            if Oo.pickedRegion ~= nil then O4[#O4 + 1] = { C0('Region'), Nw(Oo.pickedRegion) } end
            if Oo.teamAStartSide ~= nil and Or ~= nil then
                local O5 = Oo.teamAStartSide
                if Or == 'B' then O5 = (O5 == 'Terrorist') and 'CounterTerrorist' or 'Terrorist' end
                O4[#O4 + 1] = { C0('Starting side'), C0(O5) }
            end
            for O6 = 1, #O4 do
                local O7 = Om + (O6 - 1) * 26
                Jc(Ol, O7, On, 24, Iq.chip, Ll)
                JT(Ip.main, Ol + 10, O7 + 4, O4[O6][1], Iq.text_mute)
                J6(Ip.bold, Ol + On - 10, O7 + 4, O4[O6][2], Iq.text)
            end
            Om = Om + #O4 * 26 + 2
        end

        if Oq == 'MAP_BAN' or Oq == 'SIDE_PICK' or Oq == 'REGION_VOTE' then
            local O8 = 0
            local O9 = Fg.match.teamCounts
            if type(O9) == 'table' then
                if Oq == 'REGION_VOTE' then
                    for O_, Pa in pairs(O9) do O8 = O8 + (tonumber(Pa) or 0) end
                else
                    O8 = tonumber(O9[Os]) or 0
                end
            end
            local Pb = tonumber(Oo.votedCount) or 0
            JT(Ip.main, Ol, Om + 4, (C0('%d/%d voted')):format(Pb, O8), Iq.text_mute)
            Om = Om + 22
        end

        return Om - Op
    end

    function Nn.hud()
        local Pc = Fg.match
        if Pc == nil or Pc.state ~= 'VOTING' or Pc.voteMode == nil then return nil end
        local Pd = Pc.voteMode
        local Pe = C0('Map ban')
        if Pd.phase == 'SIDE_PICK' then Pe = C0('Side pick')
        elseif Pd.phase == 'REGION_VOTE' then Pe = C0('Region vote')
        elseif Pd.phase == 'CAPTAIN_DRAFT' then Pe = C0('Captain draft')
        elseif Pd.phase == 'COMPLETED' then return C0('Vote complete') end
        return (C0('Voting  |  %s  |  %ds')):format(Pe, Nz(Pd))
    end

    return Nn
end)()

local function Pf(Pg, Ph, Pi)
    local Pj = Ph

    if Fg.match == nil then
        Ph = Ph + La(Pg, Ph, Pi, C0('Confirming match...'))
        return Ph - Pj
    end

    local Pk = Fg.match.state
    if Pk == 'VOTING' then
        return Fp.build(Pg, Ph, Pi)
    end

    local Pl = G1()

    Jc(Pg, Ph, Pi, 62, Iq.panel, 8)
    if Pk == 'IN_PROGRESS' then
        JT(Ip.main, Pg + 14, Ph + 12, Pl and C0('You are in the match') or C0('Match is live'), Iq.text_mute)
        JT(Ip.bold, Pg + 14, Ph + 32, ("%s:%d"):format(tostring(Fg.match.server), Fg.match.port or 0), Iq.text)
    else
        JT(Ip.main, Pg + 14, Ph + 12, C0('Match'), Iq.text_mute)
        JT(Ip.bold, Pg + 14, Ph + 32, C0(Nm[Pk] or 'Locating a server...'), Iq.text)
    end
    Ph = Ph + 72

    if Pk == 'IN_PROGRESS' and not Pl then
        if Lo(Pg, Ph, Pi, 36, C0('Connect'), 'primary') then LW(G5) end
        Ph = Ph + 36
    end

    return Ph - Pj
end

local function Pm(Pn)
    if type(Pn) ~= 'number' or Pn <= 0 then return '' end
    local Po = Ff - math.floor(Pn / 1000)
    if Po < 60 then return C0('just now') end
    if Po < 3600 then return (C0('%dm ago')):format(math.floor(Po / 60)) end
    if Po < 86400 then return (C0('%dh ago')):format(math.floor(Po / 3600)) end
    return (C0('%dd ago')):format(math.floor(Po / 86400))
end

local function Pp(Pq, Pr)
    if Pr == nil or Pr == 0 then return tostring(Pq or 0) .. '.00' end
    return ('%.2f'):format((Pq or 0) / Pr)
end

local function Ps(Pt)
    Pt = tostring(Pt)
    if #Pt <= 8 then return Pt end
    return '...' .. Pt:sub(#Pt - 5)
end

local function Pu(Pv, Pw, Px)
    Pw = tostring(Pw)
    if JL(Pv, Pw) <= Px then return Pw end
    return Ps(Pw)
end

local function Py(Pz, PA, PB)
    local PC = PA

    local PD = H4.profile
    if PD == nil then
        if H4.loading > 0 then
            PA = PA + La(Pz, PA, PB, C0('Loading your stats...'))
        else
            PA = PA + La(Pz, PA, PB, H4.error or C0('No stats yet. Play a match first.'), H4.error and Iq.danger_lt or nil)
        end
    else
        Jc(Pz, PA, PB, 64, Iq.panel, Lj)
        JT(Ip.main, Pz + 14, PA + 10, C0('Tier points'), Iq.text_mute)
        JT(Ip.title, Pz + 14, PA + 26, tostring(PD.tierPoints or 0), Iq.text)
        local PE = (PD.placement or 0) > 0 and ('#%d'):format(PD.placement) or C0('unranked')
        J6(Ip.main, Pz + PB - 14, PA + 10, (C0('Season %d')):format(PD.season or 0), Iq.text_mute)
        J6(Ip.title, Pz + PB - 14, PA + 26, PE, Iq.primary_light)
        PA = PA + 74

        local PF = {
            { C0('W / L'), ('%d - %d'):format(PD.wins or 0, PD.losses or 0) },
            { C0('K / D'), Pp(PD.kills, PD.deaths) },
            { C0('HS %'), ((PD.kills or 0) > 0) and ('%d%%'):format(math.floor((PD.headshots or 0) * 100 / PD.kills)) or '0%' },
            { C0('Likes'), tostring(PD.likes or 0) },
        }
        local PG = (PB - 18) / 4
        for PH = 1, #PF do
            local PI = Pz + (PH - 1) * (PG + 6)
            Jc(PI, PA, PG, 44, Iq.chip, Ll)
            JZ(Ip.main, PI + PG * 0.5, PA + 8, PF[PH][1], Iq.text_mute)
            JZ(Ip.bold, PI + PG * 0.5, PA + 24, PF[PH][2], Iq.text)
        end
        PA = PA + 54
    end

    PA = PA + LN(Pz, PA, PB, C0('Recent matches'))
    local PJ = H4.matches
    if PJ == nil or #PJ == 0 then
        PA = PA + La(Pz, PA, PB, H4.loading > 0 and C0('Loading...') or C0('No matches yet.')) + 4
    else
        for PK = 1, #PJ do
            local PL = PJ[PK]
            local PM, PN = Iq.text_mute, '--'
            if PL.outcome == 'WIN' then PM = Iq.good; PN = C0('WIN')
            elseif PL.outcome == 'LOSS' then PM = Iq.danger_lt; PN = C0('LOSS')
            elseif PL.outcome == 'TIE' then PM = Iq.warn; PN = C0('TIE')
            elseif PL.state == 'IN_PROGRESS' then PM = Iq.primary_light; PN = C0('LIVE') end

            JT(Ip.bold, Pz, PA, PN, PM)
            JT(Ip.main, Pz + 42, PA, Kx(Ip.main, C4(PL.map), 104), Iq.text)
            JT(Ip.main, Pz + 152, PA, ('%d : %d'):format(PL.myScore or 0, PL.enemyScore or 0), Iq.text_dim)
            if PL.mvp == true then JT(Ip.bold, Pz + 205, PA, 'MVP', Iq.primary_light) end
            J6(Ip.main, Pz + PB, PA, Pm(PL.endedAt), Iq.text_mute)
            PA = PA + K8()
        end
        PA = PA + 4
    end

    PA = PA + LN(Pz, PA, PB, C0('Leaderboard'), H4.board and (C0('top %d')):format(#H4.board) or nil)
    local PO = H4.board
    if PO == nil or #PO == 0 then
        PA = PA + La(Pz, PA, PB, H4.loading > 0 and C0('Loading...') or C0('Leaderboard unavailable.')) + 4
    else
        for PP = 1, #PO do
            local PQ = PO[PP]
            local PR = PQ.self == true and Iq.primary_light or Iq.text_dim
            JT(Ip.main, Pz, PA, ('%d.'):format(PQ.rank or PP), Iq.text_mute)

            local PS = Pu(Ip.main, PQ.xuid, 140)
            JT(Ip.main, Pz + 28, PA, PS, PR)

            local PT = PQ.self == true and C0('you') or Ht(PQ.xuid, nil)
            if PT ~= nil then
                local PU = Pz + 28 + JL(Ip.main, PS) + 10
                local PV = Pz + 252 - PU
                if PV > 30 then JT(Ip.main, PU, PA, Kx(Ip.main, PT, PV), Iq.text_mute) end
            end

            JT(Ip.main, Pz + 262, PA, ('%d - %d'):format(PQ.wins or 0, PQ.losses or 0), Iq.text_mute)
            JT(Ip.main, Pz + 334, PA, Pp(PQ.kills, PQ.deaths), Iq.text_mute)
            J6(Ip.bold, Pz + PB, PA, tostring(PQ.tierPoints or 0), PR)
            PA = PA + K8()
        end
        PA = PA + 4
    end

    if Lo(Pz, PA, 120, 30, C0('Refresh'), nil, H4.loading > 0) then LW(function() H6(true) end) end
    PA = PA + 30

    return PA - PC
end

local PW = {
    FATALITY = 'in-game',
    AIMWARE = 'in-game',
    NEVERLOSE = 'in-game',
    GAMESENSE = 'in-game',
    STEAM_OPENID = 'web',
    HVHGG = 'hvh.gg',
    UNVERIFIED = 'unverified',
}

local function PX(PY, PZ, P0)
    local P1 = PZ

    local P2 = HK(CP)
    Jc(PY, PZ, P0, 58, Iq.panel, Lj)

    local P3 = PY + 14
    JT(Ip.main, P3, PZ + 9, C0('Current Steam account'), Iq.text_mute)

    local P4 = PY + P0 - 14
    if P2 == true then
        J6(Ip.main, P4, PZ + 27, C0('linked'), Iq.good)
        P4 = P4 - JL(Ip.main, C0('linked')) - 10
    elseif P2 == false then
        J6(Ip.main, P4, PZ + 27, C0('not linked'), Iq.warn)
        P4 = P4 - JL(Ip.main, C0('not linked')) - 10
    end

    JT(Ip.bold, P3, PZ + 27, CP, Iq.text)
    local P5 = Ht(CP, nil)
    if P5 ~= nil then
        local P6 = P3 + JL(Ip.bold, CP) + 10
        if P4 - P6 > 30 then
            JT(Ip.main, P6, PZ + 27, Kx(Ip.main, P5, P4 - P6), Iq.text_mute)
        end
    end
    PZ = PZ + 68

    if P2 == false then
        PZ = PZ + La(PY, PZ, P0,
            C0('This Steam account is not linked to your HvH.gg Prime account yet. You cannot queue with it until you link it.'),
            Iq.warn) + 8
        if Lo(PY, PZ, 170, 34, C0('Link this Steam'), 'primary', HJ.loading > 0) then
            LW(HU)
        end
        PZ = PZ + 42
    end

    PZ = PZ + LN(PY, PZ, P0, C0('Linked accounts'),
        HJ.items and (C0('%d linked')):format(#HJ.items) or nil)

    local P7, P8 = 1, 1

    if HJ.items == nil then
        PZ = PZ + La(PY, PZ, P0, C0('Loading...')) + 4
    elseif #HJ.items == 0 then
        PZ = PZ + La(PY, PZ, P0, C0('No Steam accounts linked yet.')) + 4
    else
        local P9 = #HJ.items
        P8 = math.ceil(P9 / HJ.per_page)
        P7 = HJ.page or 1
        if P7 > P8 then P7 = P8 end
        if P7 < 1 then P7 = 1 end

        local P_ = (P7 - 1) * HJ.per_page + 1
        local Qa = math.min(P_ + HJ.per_page - 1, P9)

        for Qb = P_, Qa do
            local Qc = HJ.items[Qb]
            local Qd = Qc.xuid == CP

            JT(Ip.main, PY, PZ + 6, Qc.xuid, Qd and Iq.primary_light or Iq.text)

            local Qe = C0(PW[Qc.source] or tostring(Qc.source or ''))
            local Qf = PY + P0 - 86
            J6(Ip.main, Qf, PZ + 6, Qe, Iq.text_mute)

            local Qg = Ht(Qc.xuid, nil)
            if Qg ~= nil then
                local Qh = PY + JL(Ip.main, Qc.xuid) + 10
                local Qi = Qf - JL(Ip.main, Qe) - 10 - Qh
                if Qi > 30 then
                    JT(Ip.main, Qh, PZ + 6, Kx(Ip.main, Qg, Qi), Iq.text_mute)
                end
            end

            local Qj = HJ.confirm == Qc.xuid and Ff < HJ.confirm_until
            local Qk = Qj and C0('Sure?') or C0('Unbind')
            if Lo(PY + P0 - 78, PZ, 78, 26, Qk, Qj and 'danger' or nil, HJ.loading > 0) then
                local Ql = Qc.xuid
                if Qj then
                    LW(function()
                        HJ.confirm = nil
                        HX(Ql)
                    end)
                else
                    local Qm = Ff + 5
                    LW(function()
                        HJ.confirm = Ql
                        HJ.confirm_until = Qm
                    end)
                end
            end
            PZ = PZ + 32
        end

        if P8 > 1 then PZ = PZ + (HJ.per_page - (Qa - P_ + 1)) * 32 end
    end

    PZ = PZ + 4
    if Lo(PY, PZ, 120, 30, C0('Refresh'), nil, HJ.loading > 0) then LW(function() HQ(true) end) end

    if P8 > 1 then
        if Lo(PY + P0 - 60, PZ, 60, 30, C0('Next'), nil, P7 >= P8) then
            LW(function() HJ.page = P7 + 1 end)
        end
        if Lo(PY + P0 - 126, PZ, 60, 30, C0('Prev'), nil, P7 <= 1) then
            LW(function() HJ.page = P7 - 1 end)
        end
        J6(Ip.main, PY + P0 - 136, PZ + 9, ('%d / %d'):format(P7, P8), Iq.text_mute)
    end
    PZ = PZ + 30

    return PZ - P1
end

local function Qn(Qo)
    local Qp = Qo.membership
    if type(Qp) ~= 'table' or Qp.active ~= true then return 'FREE' end
    if Qp.tier == 'SVIP' then return 'SVIP' end
    if Qp.tier == 'VIP' then return 'VIP' end
    return 'FREE'
end

local function Qq(Qr)
    local Qs = Qr.role
    if Qs == 'ADMIN' then return 'ADMIN', Iq.admin, Iq.on_primary end
    if Qs == 'MOD' then return 'MOD', Iq.mod, Iq.on_primary end
    if Qs == 'DHDJ' then
        if CZ.no_cjk then return 'DHDJ', Iq.dhdj, Iq.on_dhdj end
        return '死妈烂崽', Iq.dhdj, Iq.on_dhdj
    end
    return nil
end

local function Qt(Qu, Qv, Qw, Qx)
    Jc(Qu, Qv + 12, Qw, 1, Iq.line)
    local Qy = Qv + 23
    local Qz = Qy + 5

    local QA = Qn(Qx)
    local QB, QC, QD = Qq(Qx)

    local QE, QF = nil, nil
    if QA == 'FREE' then
        QE = tonumber(Qx.dailyFreeMatchesRemaining)
        if QE ~= nil then
            QE = math.floor(QE)
            QF = ('%d/%d'):format(QE, Io.free_total)
        end
    end

    local QG, QH = JL(Ip.bold, QA)
    local QI = QG + 12
    local QJ = 8 + QI

    local QK, QL, QM = 0, 0, 0
    if QB ~= nil then
        QK, QL = JL(Ip.bold, QB)
        QM = QK + 12
        QJ = QJ + 8 + QM
    end

    if QF ~= nil then QJ = QJ + 8 + JL(Ip.bold, QF) end

    local QN = Qw - 106 - QJ
    if QN < 40 then QN = 40 end

    local QO = Kx(Ip.main, tostring(Qx.name), QN)
    local QP, QQ = JL(Ip.main, QO)

    local QR = 18
    if QH + 4 > QR then QR = QH + 4 end
    if QB ~= nil and QL + 4 > QR then QR = QL + 4 end
    if QQ < QR then QQ = QR end

    JT(Ip.main, Qu, Qz, QO, Iq.text_dim)

    local QS = Qu + QP + 8
    local QT = Qz + (QQ - QR) * 0.5

    if QB ~= nil then
        Jc(QS, QT, QM, QR, QC, Ll)
        JT(Ip.bold, QS + 6, QT + (QR - QL) * 0.5, QB, QD)
        QS = QS + QM + 8
    end

    local QU, QV = Iq.chip, Iq.text_dim
    if QA == 'SVIP' then
        QU, QV = Iq.svip, Iq.on_primary
    elseif QA == 'VIP' then
        QU, QV = Iq.vip, Iq.on_primary
    end

    Jc(QS, QT, QI, QR, QU, Ll)
    JT(Ip.bold, QS + 6, QT + (QR - QH) * 0.5, QA, QV)

    if QF ~= nil then
        JT(Ip.bold, QS + QI + 8, Qz, QF, (QE <= 0) and Iq.danger_lt or Iq.good)
    end

    LY(Qu + Qw - 96, Qy, 96, 26)

    local QW = 31 + QQ
    if QW < 49 then QW = 49 end
    return QW
end

local function QX(QY, QZ, Q0)
    if Fg.last_error ~= nil and Fg.user == nil then
        local Q1 = La(QY, QZ, Q0, Fg.last_error, Iq.danger_lt) + 12
        if Fg.logged_in then
            LY(QY, QZ + Q1, 120, 32)
        else
            if Lo(QY, QZ + Q1, 130, 34, C0('Login'), 'primary', Fh.login) then LW(GB) end
        end
        return Q1 + 34
    end

    if not Fg.logged_in or Fg.login_session ~= nil then
        return Mt(QY, QZ, Q0)
    end

    if Fg.user == nil then
        return La(QY, QZ, Q0, C0('Loading your profile...'))
    end

    local Q2 = Fg.user
    local Q3 = Fg.lobby ~= nil and Fg.lobby.isValid == true
    local Q4 = Q3 and Fg.lobby.hostUid == Q2.uid

    local Q5 = 0

    if Io.page == 'stats' or Io.page == 'steam' then
        Q5 = (Io.page == 'stats') and Py(QY, QZ, Q0) or PX(QY, QZ, Q0)
        return Q5 + Qt(QY, QZ + Q5, Q0, Q2)
    end

    if Q3 and not Q4 and Q2.state ~= "IN_MATCH" then
        return La(QY, QZ, Q0, C0('You are in a lobby hosted by someone else. The host controls the queue.'))
    end

    if Q2.state == 'IDLE' then
        Q5 = My(QY, QZ, Q0)
    elseif Q2.state == 'MATCHMAKING' then
        Q5 = M5(QY, QZ, Q0)
    elseif Q2.state == 'IN_MATCH' then
        Q5 = Pf(QY, QZ, Q0)
    else
        Q5 = La(QY, QZ, Q0, C0('Ready.'))
    end

    return Q5 + Qt(QY, QZ + Q5, Q0, Q2)
end

local function Q6(Q7, Q8, Q9)
    if not DC.outdated then return QX(Q7, Q8, Q9) end
    local Q_ = Q8
    Q8 = Q8 + La(Q7, Q8, Q9,
        (C0('Script v%s is outdated, latest is v%s. Please update.')):format(CU, DC.latest or '?'),
        Iq.warn) + 10
    Jc(Q7, Q8, Q9, 30, Iq.panel, 6)
    JT(Ip.main, Q7 + 10, Q8 + 9, Kx(Ip.main, CV, Q9 - 20), Iq.text_dim)
    Q8 = Q8 + 40
    if Lo(Q7, Q8, 170, 34, C0('Download update'), 'primary') then LW(Gy) end
    return Q8 + 34 - Q_
end

local Ra = 54
local Rb = { { 'play', 'PLAY' }, { 'stats', 'STATS' }, { 'steam', 'STEAM' } }

local function Rc()
    return Fg.logged_in and Fg.user ~= nil
end

local function Rd()
    return Io.x + Io.w - LU - Io.lang_w
end

local function Re()
    return Rd() - 8 - Ra * #Rb
end

local function Rf()
    if Rc() then return Re() end
    return Rd()
end

local function Rg(Rh)
    if CZ.no_cjk or DC.outdated then return end
    if Lo(Rd(), Rh + 9, Io.lang_w, 20, CZ.lang == 2 and 'EN' or 'ZH', 'quiet') then
        LW(function()
            DI.lang = (DI.lang == 2) and 1 or 2
            CZ.lang = DI.lang
            DR()
            Fg.lang_want = (CZ.lang == 2) and 'ZH' or 'EN'
            GK()
        end)
    end
end

local function Ri()
    local Rj, Rk, Rl = Io.x, Io.y, Io.w
    local Rm, Rn = Rj + LU, Rk + LV + LU

    Io.measuring = true
    local Ro = Q6(Rm, Rn, Rl - LU * 2)
    Io.measuring = false

    local Rp = LV + LU + Ro + LU

    JO(Rj, Rk, Rl, Rp)
    Jc(Rj, Rk, Rl, Rp, Iq.bg, Lj)
    Jc(Rj, Rk, Rl, LV, Iq.title_bg, Lj)
    Jc(Rj, Rk + LV - Lj, Rl, Lj, Iq.title_bg)
    Jc(Rj, Rk + LV - 1, Rl, 1, Iq.line)

    Jc(Rj + LU, Rk + LV * 0.5 - 7, 3, 14, Iq.primary_light, 1.5)
    JT(Ip.bold, Rj + LU + 11, Rk + 12, 'HvH.gg Prime', Iq.text)
    Rg(Rk)

    if Rc() then
        local Rq = Re()
        for Rr = 1, #Rb do
            local Rs, Rt = Rb[Rr][1], Rb[Rr][2]
            local Ru = Rq + (Rr - 1) * Ra
            local Rv = Io.page == Rs
            JZ(Ip.bold, Ru + Ra * 0.5, Rk + 13, C0(Rt), Rv and Iq.text or Iq.text_mute)
            if Rv then Jc(Ru + 8, Rk + LV - 3, Ra - 16, 2, Iq.primary_light) end
            if KX(Ru, Rk + 4, Ra, LV - 6) and Io.clicked then
                LW(function()
                    Io.page = Rs
                    HJ.confirm = nil
                    if Rs == 'stats' then H6(false) end
                    if Rs == 'steam' then HQ(false) end
                end)
            end
        end
    end

    Q6(Rm, Rn, Rl - LU * 2)

    Io.bottom = Rk + Rp
    Io.panel_h = Rp
end

local function Rw()
    local Rx = nil
    local Ry = Iq.primary_light
    local Rz = false

    if Fg.login_session ~= nil then
        Rx = C0('HvH.gg Prime  |  waiting for browser confirmation')
        Ry = Iq.warn
    elseif Fg.logged_in and Fg.user ~= nil then
        if Fg.user.state == 'MATCHMAKING' then
            local RA = 0
            if Fg.lobby ~= nil and Fg.lobby.startedAt ~= nil then
                RA = Ff - math.floor(Fg.lobby.startedAt / 1000)
                if RA < 0 then RA = 0 end
            end
            Rx = (C0('In queue  %02d:%02d  |  %s  |  %s')):format(math.floor(RA / 60), RA % 60,
                Ej(DY()), Fc((EX())))
        elseif Fg.user.state == 'IN_MATCH' and Fg.match ~= nil then
            if Fg.match.state == 'IN_PROGRESS' then
                if not G1() then
                    Rx = C0('Match is live  |  open the menu to connect')
                    Ry = Iq.good
                end
            elseif Fg.match.state == 'VOTING' then
                Rx = Fp.hud()
                Ry = Iq.primary_light
                Rz = true
            else
                Rx = C0(Nm[Fg.match.state] or 'Match found!')
                Ry = Iq.good
                Rz = true
            end
        end
    elseif Fg.last_error ~= nil then
        Rx = 'HvH.gg Prime  |  ' .. Fg.last_error
        Ry = Iq.danger_lt
    end

    if Rx == nil then return 0 end

    local RB, RC = JL(Ip.main, Rx)
    local RD = RB + 34
    local RE = 28
    local RF, RG = Io.x, Io.y

    local RH = Ry
    if Rz then
        RH = I2(Ry, 0.55 + 0.45 * math.abs(math.sin(C9() * 2)))
    end

    JO(RF, RG, RD, RE)
    Jc(RF, RG, RD, RE, Iq.bg, Lj)
    Jc(RF, RG, 3, RE, RH, 1.5)
    JT(Ip.main, RF + 14, RG + (RE - RC) * 0.5, Rx, Iq.text)
    return RE
end

local function RI(RJ, RK)
    local RL = Ff
    local RM = 1
    while RM <= #Fk do
        if Fk[RM].expires <= RL then table.remove(Fk, RM) else RM = RM + 1 end
    end
    if #Fk == 0 then return end

    local RN = Io.w
    for RO = 1, #Fk do
        local RP = Fk[RO]
        local RQ = KG(Ip.main, RP.text, RN - 26)
        local RR = K3(Ip.main, RQ[1] or '')
        local RS = #RQ * RR + 14

        JO(RJ, RK, RN, RS)
        Jc(RJ, RK, RN, RS, Iq.panel, Lj)
        Jc(RJ, RK, 3, RS, RP.error and Iq.danger_lt or Iq.primary_light, 1.5)
        for RT = 1, #RQ do
            JT(Ip.main, RJ + 14, RK + 7 + (RT - 1) * RR, RQ[RT], Iq.text)
        end

        RK = RK + RS + 6
    end
end

local function RU()
    local RV = false
    if input ~= nil and input.IsButtonDown ~= nil then
        local RW, RX = pcall(input.IsButtonDown, 0x01)
        RV = RW and RX == true
    end

    Io.clicked = RV and (not Io.prev_down)
    Io.prev_down = RV
    Io.down = RV
    Io.interactive = false

    if not Ir.open() or input == nil or input.GetMousePos == nil then
        Io.clicked = false
        return
    end

    local RY, RZ, R0 = pcall(input.GetMousePos)
    if not RY or type(RZ) ~= 'number' or type(R0) ~= 'number' then
        Io.clicked = false
        return
    end

    Io.cx = RZ
    Io.cy = R0
    Io.interactive = true
end

local function R1()
    if not Io.interactive then
        if Io.drag then
            Io.drag = false
            DR()
        end
        return
    end

    local R2 = Io.cx >= Io.x and Io.cx <= Io.x + Io.w
        and Io.cy >= Io.y and Io.cy <= Io.y + LV

    if R2 and Io.cx >= Rf() then R2 = false end

    if Io.clicked and R2 then
        Io.drag = true
        Io.drag_dx = Io.cx - Io.x
        Io.drag_dy = Io.cy - Io.y
    end

    if not Io.drag then return end

    if not Io.down then
        Io.drag = false
        DI.x = Io.x
        DI.y = Io.y
        DR()
        return
    end

    Io.x = Io.cx - Io.drag_dx
    Io.y = Io.cy - Io.drag_dy

    local R3, R4 = I7()
    if Io.x < 0 then Io.x = 0 end
    if Io.y < 0 then Io.y = 0 end
    if Io.x > R3 - 80 then Io.x = R3 - 80 end
    if Io.y > R4 - LV then Io.y = R4 - LV end

    DI.x = Io.x
    DI.y = Io.y
end

local function R5()
    if not Io.ok then return end
    Io.action = nil

    Io.over_panel = Io.interactive
        and Io.cx >= Io.x and Io.cx <= Io.x + Io.w
        and Io.cy >= Io.y and Io.cy <= Io.y + (Io.panel_h or LV)

    Jy = nil

    local R6
    if Io.interactive then
        Ri()
        R6 = Io.bottom + 8
    else
        local R7 = Rw()
        R6 = Io.y + (R7 > 0 and R7 + 8 or 0)
    end
    RI(Io.x, R6)

    if not Io.first_draw_logged then
        Io.first_draw_logged = true
        local R8, R9 = I7()
        Cb(('[HvH.gg Prime] ui: first draw ok  screen=%dx%d  cursor=%s,%s'):format(
            R8, R9, tostring(Io.cx), tostring(Io.cy)))
    end

    if Io.action ~= nil then
        local R_ = Io.action
        Io.action = nil
        R_()
    end
end

Cb('[HvH.gg Prime] load: ui ok')

local Sa = {
    ready_at = iI.get_unix_time() + 2,
    last_tick = iI.get_unix_time(),
    last_poll = 0,
    tick_every = 2,
    tick_match = 10,
    drew = false,
    errors = 0,
}

function Sa.beat()
    if Fg.match ~= nil and Fg.match.state == "IN_PROGRESS" and not Fg.auto_join then
        return Sa.tick_match
    end
    return Sa.tick_every
end

local function Sb()
    local Sc = iI.get_unix_time()

    Fe = Fe + 1
    Ff = Sc

    Dq()

    if not DC.ready and not DC.fetching and Sc >= DC.retry_at then F_() end

    if not DC.blocked() then
        if Fg.logged_in and HJ.items == nil and HJ.loading == 0 and Sc >= HJ.retry_at then
            HQ(false)
        end

        if Fg.logged_in and Sc >= Ho.retry_at then Hx() end

        if Fg.login_session ~= nil then
            if Sa.last_poll <= Sc - 2 then
                Sa.last_poll = Sc
                GF()
            end
        elseif Fg.recheck or Sa.last_tick <= Sc - Sa.beat() then
            Fg.recheck = false
            Sa.last_tick = Sc
            G6()
        end
    end

    if Sc < Sa.ready_at then return end

    if not Io.init_done then
        Io.init_done = true
        IK()
        Cb('[HvH.gg Prime] ui: init ok')
    end

    RU()
    R1()
    R5()
end

callbacks.Register('Draw', 'hvhgg_prime_draw', function()
    if Ir.dead then return end

    Ir.beat = C9()

    if not Sa.drew then
        Sa.drew = true
        Cb('[HvH.gg Prime] draw: first frame')
    end

    local Sd, Se = pcall(Sb)
    if Sd or Sa.errors > 5 then return end

    Sa.errors = Sa.errors + 1
    Cb('[HvH.gg Prime] draw: ERROR ' .. tostring(Se))
end)

callbacks.Register('CreateMove', 'hvhgg_prime_move', function(Sf)
    if Ir.dead or not Io.over_panel or Sf == nil then return end
    local Sg, Sh = pcall(Sf.GetButtons, Sf)
    if not Sg or type(Sh) ~= 'number' then return end

    local Si = Sh
    if Si % 2 == 1 then Si = Si - 1 end
    if math.floor(Si / 2048) % 2 == 1 then Si = Si - 2048 end
    if Si ~= Sh then pcall(Sf.SetButtons, Sf, Si) end
end)

callbacks.Register('Unload', 'hvhgg_prime_unload' .. Ir.n, function(Sj)
    Cb('[HvH.gg Prime] unload: Unload event arg=' .. tostring(Sj))
    if type(Sj) == 'string' and #Sj > 0 and Ir.script ~= nil and Sj ~= Ir.script then return end
    Ir.shutdown()
end)

Ir.init()
F_()

Cb('[HvH.gg Prime] load: restoring saved session')
Gf()
Cb('[HvH.gg Prime] load: session restore done')

Cb('[HvH.gg Prime] load: done')
