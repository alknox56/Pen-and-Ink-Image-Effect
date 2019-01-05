function varargout = finalproject(varargin)
% FINALPROJECT MATLAB code for finalproject.fig
%      FINALPROJECT, by itself, creates a new FINALPROJECT or raises the existing
%      singleton*.
%
%      H = FINALPROJECT returns the handle to a new FINALPROJECT or the handle to
%      the existing singleton*.
%
%      FINALPROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINALPROJECT.M with the given input arguments.
%
%      FINALPROJECT('Property','Value',...) creates a new FINALPROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before finalproject_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to finalproject_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help finalproject

% Last Modified by GUIDE v2.5 05-Dec-2018 23:02:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @finalproject_OpeningFcn, ...
                   'gui_OutputFcn',  @finalproject_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
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


% --- Executes just before finalproject is made visible.
function finalproject_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to finalproject (see VARARGIN)

% Choose default command line output for finalproject
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes finalproject wait for user response (see UIRESUME)
% uiwait(handles.figure1);
clear all;
% run the reset function to reassign the axes
reset;

% --- Outputs from this function are returned to the command line.
function varargout = finalproject_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% reassigns the axes objects upon starting the GUI
% code retrieved from 'code.m' provided
function reset
global hAxes1;
global hAxes2;

%sets the left window to display the original image
if (isempty(hAxes1))
    hAxes1 = findobj(gcf,'Tag', 'Image_Window');
end
%seths the right window to display the modified image
if (isempty(hAxes2))
    hAxes2 = findobj(gcf,'Tag', 'Result_Window');
end

set(gcf, 'CurrentAxes', hAxes1);
imshow(1);
set(gcf, 'CurrentAxes', hAxes2);
imshow(1);
return;

% --- Executes on button press in load_button.
function load_button_Callback(hObject, eventdata, handles)
% hObject    handle to load_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% code retrieved from 'demo.m' provided
global X; % original image
global hAxes1;

% open an image 
[FileName,PathName] = uigetfile('*.bmp;*.tif;*.jpg;*.hdf','Select the image file');
if ispc
    FullPathName = [PathName,'\',FileName];
elseif ismac
    FullPathName = [PathName,'/',FileName];
elseif isunix
    FullPathName = [PathName,'/',FileName];
else
    FullPathName = [PathName,'\',FileName];
end
X = imread(FullPathName);

%display the original image
set(gcf, 'CurrentAxes', hAxes1);
imshow(X);
displayResult;


% --- Executes on slider movement.
function detail_slider_Callback(hObject, eventdata, handles)
% hObject    handle to detail_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% updates the modified image each time the slider is adjusted
displayResult;

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function detail_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to detail_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in dark_lines.
function dark_lines_Callback(hObject, eventdata, handles)
% hObject    handle to dark_lines (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% updates the modified image each time the button is pressed
displayResult;

% Hint: get(hObject,'Value') returns toggle state of dark_lines

% --- Executes on slider movement.
function filter_slider_Callback(hObject, eventdata, handles)
% hObject    handle to filter_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% updates the modified image each time the slider is adjusted
displayResult;

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function filter_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filter_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in smooth_checkbox.
function smooth_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to smooth_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% updates the modified image each time the button is pressed
displayResult;

% Hint: get(hObject,'Value') returns toggle state of smooth_checkbox

function displayResult
%access the image data matrix and desired outpuse axes
global X;
global hAxes2;

%get the filter status
smoothStatus = findobj(gcf, 'Tag', 'smooth_checkbox');
smooth = get(smoothStatus,'Value');
%get the dark line status
darkStatus = findobj(gcf, 'Tag', 'dark_lines');
dark = get(darkStatus,'Value');
% get the filter size
gaussLevel = findobj(gcf, 'Tag', 'filter_slider');
gauss = get(gaussLevel,'Value');
% get the detail level
detailLevel = findobj(gcf, 'Tag', 'detail_slider');
detail = get(detailLevel,'Value');

%apply gaussian filter if "smooth" box is checked
Y = X;
if smooth == true
    H = fspecial('gaussian', round(gauss), 0.5 * round(gauss));
    Y = imfilter(X, H);
end

%Determine horizontal and vertical gradiant madnitude of image
[height, width, dim] = size(Y);
hSobel = [-1 0 1; -2 0 2; -1 0 1];
vSobel = [1 2 1; 0 0 0; -1 -2 -1];
hMag = zeros(height, width);
vMag = zeros(height, width);
for i = 1:1:width-2
    for j = 1:1:height-2
        window = Y(i:i+2,j:j+2,1);
        hConv = conv2(window, hSobel);
        hMag(i+1,j+1)=hConv(3,3);
        vConv = conv2(window, vSobel);
        vMag(i+1,j+1)=vConv(3,3);
    end
end

%Find total gradiant magnitude and invert pixel values
totalMag = sqrt((hMag.*hMag) + (vMag.*vMag));
totalMag = 1 - (totalMag ./ 255);

%If 'dark lines' is checked, set pixel values to white or black
%depending on threshold value 'detail'.
if dark == true
    for i = 1:1:width
        for j = 1:1:height
            if totalMag(i,j) <= detail
                totalMag(i,j) = 0;
            else
                totalMag(i,j) = 1;
            end
        end
    end
end

% show the result
set(gcf, 'CurrentAxes', hAxes2);
imshow(totalMag);


