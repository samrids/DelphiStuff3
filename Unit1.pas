unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, Vcl.StdCtrls,
  REST.Client, uRESTDebuggerResStrs,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    lbl_LastRequestStats: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure RESTRequest1AfterExecute(Sender: TCustomRESTRequest);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const
 RSBytesOfDataReturnedAndTiming = '%d : %s - %d bytes of data returned. Timing: Pre: %dms - Exec: %dms - Post: %dms - Total: %dms';

procedure TForm1.Button1Click(Sender: TObject);
begin
  RESTRequest1.Execute;
end;

procedure TForm1.RESTRequest1AfterExecute(Sender: TCustomRESTRequest);
begin
  lbl_LastRequestStats.Caption := format(RSBytesOfDataReturnedAndTiming,
    [RESTResponse1.StatusCode, RESTResponse1.StatusText,
    RESTResponse1.ContentLength,
    Sender.ExecutionPerformance.PreProcessingTime,
    Sender.ExecutionPerformance.ExecutionTime,
    Sender.ExecutionPerformance.PostProcessingTime,
    Sender.ExecutionPerformance.TotalExecutionTime]);
end;

end.
