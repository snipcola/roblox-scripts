for a,b in pairs(getconnections(game:GetService("ScriptContext").Error))do b:Disable()end;local a=game:GetService('UserInputService')local b=game:GetService('Players')local c=b.LocalPlayer;local d=game:GetService('CoreGui')local e=game:GetService('StarterGui')local f=game:GetService('HttpService')local g={gui=Instance.new('ScreenGui'),frame=Instance.new('Frame'),corner=Instance.new('UICorner'),padding=Instance.new('UIPadding'),command=Instance.new('TextBox'),placeholder=Instance.new('TextLabel')}local h={}if not getgenv().config then getgenv().config={host='http://localhost',port='1530'}end;if getgenv().XAdminGuiName then local i=d:FindFirstChild(getgenv().XAdminGuiName)if i then i:Destroy()end end;local function j(k)local l='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-={}|[]`~'local m={}local string=''math.randomseed(os.time())for n in l:gmatch('.')do table.insert(m,n)end;for o=1,k do string=string..m[math.random(1,#m)]end;return string end;local p=j(100)getgenv().XAdminGuiName=p;local function q()pcall(function()if g.frame.Visible then g.frame.Position=UDim2.new(0.5,0,1,-20)g.frame:TweenPosition(UDim2.new(0.5,0,1.5,-20),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,.25)task.wait(.25)g.frame.Visible=false else g.frame.Position=UDim2.new(0.5,0,1.5,-20)g.frame.Visible=true;g.frame:TweenPosition(UDim2.new(0.5,0,1,-20),Enum.EasingDirection.InOut,Enum.EasingStyle.Quint,.25)g.command:CaptureFocus()task.wait()g.command.Text=''g.placeholder.Text=''end end)end;local function r(s,t)return s:sub(1,#t)==t end;local function u(v,b)for o,w in pairs(b)do if w~=c then if w.Name:lower()==v:lower()then return w elseif w.DisplayName:lower()==v:lower()then return w elseif r(w.Name:lower(),v:lower())then return w elseif w~=c and r(w.DisplayName:lower(),v:lower())then return w end end end;return false end;local function x(y,z,A,B)h[#h+1]={name=y,alias=z,args=A,func=B}end;local function C(D,E)for o,F in pairs(h)do for o,G in pairs(D:split(' '))do if G==F.name then F.func(E)else for o,z in pairs(F.alias)do if G==z then F.func(E)end end end end end end;local function H(string)for o,F in pairs(h)do if r(F.name:lower(),string:lower())then return F end end;return false end;local function I(J,K,L)e:SetCore('SendNotification',{Title=J,Text=K,Duration=L or 5})end;g.gui.Name=p;g.gui.DisplayOrder=9;g.gui.ResetOnSpawn=false;g.gui.Parent=d;g.frame.AnchorPoint=Vector2.new(0.5,1)g.frame.BackgroundColor3=Color3.fromRGB(242,242,242)g.frame.Size=UDim2.new(0,500,0,30)g.frame.Position=UDim2.new(0.5,0,1,-20)g.frame.ClipsDescendants=true;g.frame.Visible=false;g.frame.Parent=g.gui;g.corner.CornerRadius=UDim.new(0,10)g.corner.Parent=g.frame;g.padding.PaddingTop=UDim.new(0,0)g.padding.PaddingBottom=UDim.new(0,0)g.padding.PaddingLeft=UDim.new(0,20)g.padding.PaddingRight=UDim.new(0,20)g.padding.Parent=g.frame;g.command.AnchorPoint=Vector2.new(0,0.5)g.command.AutomaticSize=Enum.AutomaticSize.XY;g.command.Position=UDim2.new(0,0,0.5,0)g.command.BackgroundTransparency=1;g.command.BorderSizePixel=0;g.command.Size=UDim2.new(0,0,0,0)g.command.Font=Enum.Font.Roboto;g.command.PlaceholderText='Command Here...'g.command.Text=''g.command.TextSize=15;g.command.TextXAlignment=Enum.TextXAlignment.Left;g.command.Parent=g.frame;g.command.PlaceholderColor3=Color3.fromRGB(128,128,128)g.placeholder.Parent=g.command;g.placeholder.Font=Enum.Font.Roboto;g.placeholder.TextSize=15;g.placeholder.TextXAlignment=Enum.TextXAlignment.Left;g.placeholder.Position=UDim2.new(0,0,0.5,0)g.placeholder.AnchorPoint=Vector2.new(0,0.5)g.placeholder.Text=''g.placeholder.TextColor3=Color3.fromRGB(128,128,128)g.placeholder.BorderSizePixel=0;x('moderate',{'m'},{nil,{"Warning","Kicked","Banned","Other"}},function(A)local b=game:GetService('Players')local M,N=table.unpack(A)local O=table.concat(A,' '):sub(#M+#N+3)local P=u(M,b:GetPlayers())if N and O then local Q=game:HttpGet(getgenv().config.host..':'..getgenv().config.port..'/moderate/'..(P and P.Name or M)..'/'..N:gsub("^%l",string.upper)..'/'..f:UrlEncode(O))local R=f:JSONDecode(Q.Body)if R and R.success~=nil then I('Moderation '..(not R.success and'un'or'')..'successful','This moderation event has'..(not R.success and' not'or'')..' been logged.')end end end)g.command.FocusLost:Connect(q)a.InputBegan:Connect(function(S,T)if S.UserInputType==Enum.UserInputType.Keyboard then if S.KeyCode==Enum.KeyCode.Semicolon and not T then q()elseif g.frame.Visible and S.KeyCode==Enum.KeyCode.Return then local K=g.command.Text:split(' ')[1]local F=H(K)local A=g.command.Text:sub(2+#F.name):split(' ')q()C(F.name,A)end end end)g.command:GetPropertyChangedSignal('Text'):Connect(function()local A=g.command.Text:split(' ')local F=A[1]and H(A[1])local P=A[2]and u(A[2],b:GetPlayers())g.placeholder.Text=''if P and A[2]~=''and not A[3]then g.placeholder.Text=P.Name:sub(A[2]:len()+1)elseif F and A[1]~=''and not A[2]then g.placeholder.Text=F.name:sub(A[1]:len()+1)end;if F then for U,V in pairs(F.args)do for o,W in pairs(V)do if W and A[U+1]and A[U+1]~=''and not A[U+3]and r(W:lower(),A[U+1])then g.placeholder.Text=W:sub(A[U+1]:len()+1)end end end end;g.placeholder.Position=UDim2.new(0,g.command.TextBounds.X,0.5,0)end)
