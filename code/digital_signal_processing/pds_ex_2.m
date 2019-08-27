function varargout = pds_ex_2(varargin)
%PDS_EX_2 M-file for pds_ex_2.fig
%      PDS_EX_2, by itself, creates a new PDS_EX_2 or raises the existing
%      singleton*.
%
%      H = PDS_EX_2 returns the handle to a new PDS_EX_2 or the handle to
%      the existing singleton*.
%
%      PDS_EX_2('Property','Value',...) creates a new PDS_EX_2 using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to pds_ex_2_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      PDS_EX_2('CALLBACK') and PDS_EX_2('CALLBACK',hObject,...) call the
%      local function named CALLBACK in PDS_EX_2.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pds_ex_2

% Last Modified by GUIDE v2.5 04-Mar-2016 10:35:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pds_ex_2_OpeningFcn, ...
                   'gui_OutputFcn',  @pds_ex_2_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT




% --- Executes just before pds_ex_2 is made visible.
function pds_ex_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for pds_ex_2
handles.output = hObject;

handles.T = 16;
handles.T1 = 4;
handles.Nvec = 0;
handles.dt = 1/100;
handles.t = ( -handles.T/2 : handles.dt : +handles.T/2 )';
handles.Nt = length(handles.t);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes pds_ex_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1)



% --- Outputs from this function are returned to the command line.
function varargout = pds_ex_2_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
Nvec = get(hObject,'Value');
Nvec = round(Nvec);
set(handles.edit1,'String',Nvec);

T = handles.T;
T1 = handles.T1;
dt = handles.dt;
t = handles.t;
Nt = handles.Nt;

N = Nvec;
k = ( -N : 1 : +N );
zinds = ( k == 0 );
a = sin( k * 2*pi/T * T1 ) ./ (k*pi);
a(zinds) = 1;
x = sum( repmat(a, Nt, 1) .* exp(1j .* repmat(k,Nt,1) .* 2*pi/T .* repmat(t,1,length(k))), 2 );

plot(t,abs(x),'parent',handles.axes1);

hold on;
Na = 2*N +1;

for n=1:N
    b = zeros(1,Na);
    b(N+1) = a(N+1);
    b(n) = a(n);
    b((Na+1)-n) = a((Na+1)-n);
    y = sum( repmat(b, Nt, 1) .* exp(1j .* repmat(k,Nt,1) .* 2*pi/T .* repmat(t,1,length(k))), 2 );
    plot(t,abs(y),'parent',handles.axes1,'Color',[(n-1)/N (n-1)/N (n-1)/N]);
end

hold off;





% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
Nvec = get(hObject,'Value');

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over slider1.
function slider1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over edit1.
function edit1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
