{$APPTYPE GUI}

program desktoprefresh;

uses Windows;

var LVH, Was : HWnd;

BEGIN

SystemParametersInfo(88, 0, nil, SPIF_UPDATEINIFILE OR SPIF_SENDCHANGE);

SendMessage(
        FindWindowEx(
                GetDesktopWindow(), 0, 'ShellTrayWnd', nil),
                WM_COMMAND, MAKELONG($a065, 1), 0);

LVH := FindWindowEx(
        FindWindowEx(
                FindWindowEx(
                        GetDesktopWindow,
                                0, 'Progman', nil),
                        0, 'SHELLDLL_DefView', nil),
                0, 'SysListView32', nil);

Was := GetForeGroundWindow;
SetForegroundWindow(LVH);
keybd_event(VK_F5, $3F, 0, 0);
keybd_event(VK_F5, $3F, KEYEVENTF_KEYUP, 0);
SetForegroundWindow(Was);

END.

